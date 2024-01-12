<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Server extends CI_Controller {
	function __construct(){
	    parent::__construct();
		//加载会员模型
		$this->load->model('admin');
        //判断登陆
		$this->admin->login();
        //当前模版
		$this->load->get_templates();
	}

	//服务器列表
	public function index(){
		$page = (int)$this->input->get_post('page');
		$zd = $this->input->get_post('zd',true);
		$key = $this->input->get_post('key',true);
		if($page == 0) $page = 1;
		$where = $like = array();

		if(!empty($key)){
			$like[$zd] = $key;
		}
		$data['zd'] = $zd;
		$data['key'] = $key;

		//每页数量
		$per_page = 50;
		$total = $this->csdb->get_nums('server',$where,$like);
		$pagejs = ceil($total / $per_page); // 总页数
		if($pagejs == 0) $pagejs = 1;
		if($page > $pagejs) $page = $pagejs;
		$limit = array($per_page,$per_page*($page-1));
		//数据
        $data['server'] = $this->csdb->get_select('server','*',$where,'id ASC',$limit,$like);
        $base_url = site_url('server')."?zd=".$zd."&key=".urlencode($key)."&page=";
        $data['page_data'] = page_data($total,$page,$pagejs); //获取分页类
        $data['page_list'] = admin_page($base_url,$page,$pagejs); //获取分页类
        $this->load->view('server.tpl',$data);
	}

	//修改
	public function edit($id=0){
		$id = intval($id);
		if($id == 0){
			$data['name'] = '';
			$data['apiurl'] = 'http://';
			$data['apikey'] = md5(time());
			$data['zmnum'] = 10;
			$data['vip'] = 0;
			$data['mp4dir'] = './video/data/';
			$data['m3u8dir'] = './video/m3u8/';
			$data['cdnurl'] = 'http://';
			$data['zsize'] = 1024;
		}else{
			$row = $this->csdb->get_row('server','*',array('id'=>$id));
			$data['name'] = $row->name;
			$data['apiurl'] = $row->apiurl;
			$data['apikey'] = $row->apikey;
			$data['zmnum'] = $row->zmnum;
			$data['mp4dir'] = $row->mp4dir;
			$data['vip'] = $row->vip;
			$data['m3u8dir'] = $row->m3u8dir;
			$data['cdnurl'] = $row->cdnurl;
			$data['zsize'] = $row->zsize/1024/1024/1024;
		}
		$data['id'] = $row->id;
		$this->load->view('server_edit.tpl',$data);
	}

	//入库
	public function save($id=0){
		$id = intval($id);
		$data['name'] = $this->input->post('name',true);
		$data['apiurl'] = $this->input->post('apiurl',true);
		$data['apikey'] = $this->input->post('apikey',true);
		$data['zmnum'] = (int)$this->input->post('zmnum',true);
		$data['vip'] = (int)$this->input->post('vip',true);
		$data['mp4dir'] = $this->input->post('mp4dir',true);
		$data['m3u8dir'] = $this->input->post('m3u8dir',true);
		$data['cdnurl'] = $this->input->post('cdnurl',true);
		$data['zsize'] = $this->input->post('zsize',true);
		if($data['zmnum'] == 0) $data['zmnum'] = 10;
		if(empty($data['name']) || empty($data['apiurl']) || empty($data['apikey']) || empty($data['cdnurl']) || empty($data['mp4dir']) || empty($data['m3u8dir']) || empty($data['zsize'])) getjson('数据不完整');
		if(substr($data['apiurl'],0,4) != 'http' || substr($data['apiurl'],-1) != '/') getjson('访问地址格式错误');
		$yapikey = getzd('server','apikey',$id);
		$data['zsize'] = $data['zsize'] * 1024 * 1024 * 1024;
		if($id == 0){
			$id = $this->db->insert("server",$data);
		}else{
			$this->db->update("server",$data,array('id'=>$id));
		}
		//同步至远程服务器
		$post['Web_ID'] = $id;
		$post['Web_Url'] = 'http://'.Web_Url.Web_Path;
		$post['Up_Dir'] = $data['mp4dir'];
		$post['Up_Ext'] = Up_Ext;
		$post['Zm_Dir'] = $data['m3u8dir'];
		$post['Zm_Preset'] = Zm_Preset;
		$post['Zm_Time'] = Zm_Time;
		$post['Zm_Kbps'] = Zm_Kbps;
		$post['Zm_Size'] = Zm_Size;
		$post['Zm_Zm'] = Zm_Zm;
		$post['Zm_Sy'] = Zm_Sy;
		$post['Zm_Sylt'] = Zm_Sylt;
		$post['Jpg_On'] = Jpg_On;
		$post['Jpg_Num'] = Jpg_Num;
		$post['Jpg_Time'] = Jpg_Time;
		$post['Jpg_Size'] = Jpg_Size;
		$post['Api_Key'] = $data['apikey'];
		$apiurl = $data['apiurl'].'api.php?ac=set&key='.$yapikey;
		geturl($apiurl,$post);
		getjson('操作完成',1);
	}

	//删除
	public function del(){
		$ids = $this->input->get_post('id');
		if(is_array($ids)){
			array_unique($ids);
			$ids = array_merge($ids);
			if(sizeof($ids)<1) getjson('请选择要删除的数据');
			foreach ($ids as $key => $value) {
				$id = intval($value);
				if($id<1) continue;
				$row = $this->csdb->get_row('vod','*',array('fid'=>$id));
				if(!$row){
					$this->db->delete('server',array('id'=>$id));
				}
			}
		}else{
			$id = intval($ids);
			$row = $this->csdb->get_row('vod','*',array('fid'=>$id));
			if($row) getjson('该服务器下有视频，请先删除视频');
			$this->db->delete('server',array('id'=>$id));
		}
		$info['msg'] = '操作完成';
		$info['url'] = site_url('server')."?v=".rand(0,999);
		getjson($info,1);
	}
}