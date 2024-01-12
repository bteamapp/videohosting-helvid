<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Api extends CI_Controller {
	function __construct(){
	    parent::__construct();
        $this->load->get_templates();
	}

	public function index(){
		$ac = $this->input->get('ac',true);
		$rid = (int)$this->input->get('rid',true);
		$wd = $this->input->get('wd',true);
		$cid = (int)$this->input->get('t',true);
		$h = (int)$this->input->get('h',true);
		$ids = $this->input->get('ids',true);
		$page = (int)$this->input->get('pg',true);
		//SQL过滤
		$wd = safe_replace(rawurldecode($wd));
		if($ac!=='list') $ac='vod';

		$where = $like = array();
		$where['vip'] = 0;
		//分类
		if($cid>0) $where['cid'] = $cid;
		//天数
		if($h>0){
			if($h==24){
				$time = strtotime(date('Y-m-d'));
				$where['addtime>'] = $time;
			}else{
				$time1 = time()-3600*$h;
				$time2 = date('Y-m-d 0:0:0',$time1);
				$time = strtotime($time2);
				$where['addtime>'] = $time;
			}
		}
		//搜索
		if(!empty($wd)) $like['name'] = $wd;

		//选中采集
		if(preg_match('/^([0-9]+[,]?)+$/', $ids)){
			$where['id'] = $ids;
		}

		//每页数量
		$size = 30;
		//总数量
		$nums = $this->csdb->get_nums('vod',$where,$like);
		//总页数
		$pagejs = ceil($nums / $size);
		if($page > $pagejs) $page=$pagejs;
		if($page==0) $page = 1;
		if($nums<$size) $size=$nums;
		//偏移量
		$limit = array($size,$size*($page-1));
		//数据列表
		$data['vod'] = $this->csdb->get_select('vod','*',$where,'addtime desc',$limit,$like);
		//二级分类
		if($ac=='list'){
			$data['class'] = $this->csdb->get_select('class','*','','xid asc',50);
		}else{
			$data['class'] = array();
		}
		$data['page'] = $page;
		$data['pagejs'] = $pagejs;
		$data['nums'] = $nums;
		$data['size'] = $size;
		header("Content-type:text/xml;charset=utf-8");
		$this->load->view('api/'.$ac.'.tpl',$data);
	}

	//VIP会员
	public function vip($user = ''){
		if(empty($user)) exit('Vip账号为空');
		$res = $this->csdb->get_row('user','id,vip',array('name'=>safe_replace($user)));
		if(!$res || $res->vip == 0) exit('Vip账号不存在');
		$ac = $this->input->get('ac',true);
		$rid = (int)$this->input->get('rid',true);
		$wd = $this->input->get('wd',true);
		$cid = (int)$this->input->get('t',true);
		$h = (int)$this->input->get('h',true);
		$ids = $this->input->get('ids',true);
		$page = (int)$this->input->get('pg',true);
		//SQL过滤
		$wd = safe_replace(rawurldecode($wd));
		if($ac!=='list') $ac='vod';

		$where = $like = array();
		$where['uid'] = $res->id;
		//分类
		if($cid>0) $where['cid'] = $cid;
		//天数
		if($h>0){
			if($h==24){
				$time = strtotime(date('Y-m-d'));
				$where['addtime>'] = $time;
			}else{
				$time1 = time()-3600*$h;
				$time2 = date('Y-m-d 0:0:0',$time1);
				$time = strtotime($time2);
				$where['addtime>'] = $time;
			}
		}
		//搜索
		if(!empty($wd)) $like['name'] = $wd;

		//选中采集
		if(preg_match('/^([0-9]+[,]?)+$/', $ids)){
			$where['id'] = $ids;
		}

		//每页数量
		$size = 30;
		//总数量
		$nums = $this->csdb->get_nums('vod',$where,$like);
		//总页数
		$pagejs = ceil($nums / $size);
		if($page > $pagejs) $page=$pagejs;
		if($page==0) $page = 1;
		if($nums<$size) $size=$nums;
		//偏移量
		$limit = array($size,$size*($page-1));
		//数据列表
		$data['vod'] = $this->csdb->get_select('vod','*',$where,'addtime desc',$limit,$like);
		//二级分类
		if($ac=='list'){
			$data['class'] = $this->csdb->get_select('class','*','','xid asc',50);
		}else{
			$data['class'] = array();
		}
		$data['page'] = $page;
		$data['pagejs'] = $pagejs;
		$data['nums'] = $nums;
		$data['size'] = $size;
		header("Content-type:text/xml;charset=utf-8");
		$this->load->view('api/'.$ac.'.tpl',$data);
	}
}