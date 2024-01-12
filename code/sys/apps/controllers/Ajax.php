<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Ajax extends CI_Controller {
	function __construct(){
	    parent::__construct();
	    //加载会员模型
		$this->load->model('user');
	}
	//收藏视频
	public function fav($id=0){
		$id = (int)$id;
		if($id == 0) getjson('视频ID不能为空');
		if(!$this->user->login(1)) getjson('登录超时，请先登录');
		$row = $this->csdb->get_row('vod','cid',array('id'=>$id));
		if(!$row) getjson('视频不存在');
		$row2 = $this->csdb->get_row('fav','id',array('did'=>$id,'uid'=>$this->cookie->get('user_id')));
		if($row2) getjson('该视频已经收藏过了');

		$add['did'] = $id;
		$add['cid'] = $row->cid;
		$add['uid'] = $this->cookie->get('user_id');
		$add['addtime'] = time();
		$this->csdb->get_insert('fav',$add);
		getjson('视频收藏成功',1);
	}

	//删除收藏
	public function delfav($id=0){
		$id = (int)$id;
		if($id == 0) getjson('视频ID不能为空');
		if(!$this->user->login(1)) getjson('登录超时，请先登录');
		$row2 = $this->csdb->get_row('fav','id',array('id'=>$id,'uid'=>$this->cookie->get('user_id')));
		if(!$row2) getjson('该记录不存在');
		$this->db->delete('fav',array('id'=>$id));
		getjson('取消收藏成功',1);
	}

	//转码异常视频
	public function err(){
		//转码未完成
		$time = time()-300;
		$res = $this->csdb->get_select('vod','*',array('zt'=>1,'zmtime<'=>$time),'id ASC',100);
		foreach($res as $row){
			$zt = 3;
			if($row->fid > 0){
				$post['vid'] = $row->vid;
				$post['addtime'] = $row->addtime;
                $apikey = getzd('server','apikey',$row->fid);
                $row2 = $this->csdb->get_row_arr('server','*',array('id'=>$row->fid));
				$apiurl = $row2['apiurl'].'api.php?ac=init&key='.$row2['apikey'];
				$zt = (int)geturl($apiurl,$post);
				if($zt == 0) $zt = 1;
			}else{
				$row2 = array();
				$m3u8file = m3u8_dir($row->vid,$row->addtime).'playlist.m3u8';
				if(file_exists($m3u8file)){
					$m3u8 = file_get_contents($m3u8file);
					if(strpos($m3u8,'#EXT-X-ENDLIST') !== false){
						$zt = 2;
					}else{
						$zt = 1;
					}
				}
			}
			//执行同步
			if($zt == 2 && Tb_Zt == 1 && !empty(Tb_Url) && !empty(Tb_Key)){
				$tb['name'] = $row->name;
				$tb['cid'] = $row->cid;
				$tb['pic'] = m3u8_link($row->vid,$row->addtime,'pic',1,$row2);
				$tb['m3u8url'] = m3u8_link($row->vid,$row->addtime,'m3u8',1,$row2);
				$tb['shareurl'] = 'http://'.Web_Url.links('play','index',$row->vid);
				$tb['token'] = Tb_Key;
				$res = geturl(Tb_Url,$tb);
				get_log(date('Y-m-d H:i:s').'：视频：'.$row->name.'--->同步提交--->状态：'.$res);
			}
			$this->csdb->get_update('vod',$row->id,array('zt'=>$zt));
		}
	}

	//执行未转码视频
	public function zm(){
		$res1 = $this->csdb->get_select('server','id',array(),'id ASC',50);
		foreach($res1 as $row2){
			$res2 = $this->csdb->get_select('vod','id',array('zt'=>0,'fid'=>$row2->id),'id ASC',10);
			foreach($res2 as $row){
                $zmurl = 'http://'.Web_Zm_Url.Web_Path.'index.php/ting?id='.$row->id;
				$res3 = file_get_contents($zmurl);
			}
		}
	}

	//api
	public function api($ac){
		//新增记录
		if($ac == 'add'){
			$key = $this->input->get_post('key',true);
			$fid = (int)$this->input->get_post('fid',true);
			//判断key
			$row = $this->csdb->get_row('server','size,apikey',array('id'=>$fid));
			if(!$row || $row->apikey != $key) exit('0');
			unset($_GET['key']);
			$name = $this->input->get_post('name',true);
			$uid = (int)$this->input->get_post('uid',true);
			//判断视频是否上传过
			$res = $this->csdb->get_row('vod','id',array('name'=>$name,'uid'=>$uid));
			if($res) exit("yes");
			//入库
			$did = $this->csdb->get_insert("vod",$_GET);
			if($did){
				//修改容量
				$this->csdb->get_update('server',$fid,array('size'=>($row->size+$_GET['size'])));
			}
			echo $did;

		}elseif($ac == 'zm'){ //转码状态
			$key = $this->input->get_post('key',true);
			$id = (int)$this->input->get_post('id',true);
			$zt = (int)$this->input->get_post('zt',true);
			if($zt > 3) $zt = 3;
			if($id > 0){
				$row = $this->csdb->get_row('vod','id,vid,cid,fid,name,addtime',array('id'=>$id));
				$rows = $this->csdb->get_row_arr('server','*',array('id'=>$row->fid));
				if(!$rows || $rows['apikey'] != $key) exit('0');
				if($zt == 2){
					get_log(date('Y-m-d H:i:s').'：视频：'.$row->name.'--->转码完成');
					//执行同步
					if(Tb_Zt == 1 && !empty(Tb_Url) && !empty(Tb_Key)){
						$tb['name'] = $row->name;
						$tb['cid'] = $row->cid;
						$tb['pic'] = m3u8_link($row->vid,$row->addtime,'pic',1,$rows);
						$tb['m3u8url'] = m3u8_link($row->vid,$row->addtime,'m3u8',1,$rows);
						$tb['shareurl'] = 'http://'.Web_Url.links('play','index',$row->vid);
						$tb['token'] = Tb_Key;
						$res = geturl(Tb_Url,$tb);
						get_log(date('Y-m-d H:i:s').'：视频：'.$row->name.'--->同步提交--->状态：'.$res);
					}
				}else{
					get_log(date('Y-m-d H:i:s').'：视频：'.$row->name.'--->转码失败');
				}
				$this->csdb->get_update('vod',$id,array('zt'=>$zt));
			}
		}
	}
}