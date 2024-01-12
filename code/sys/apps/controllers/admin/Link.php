<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Link extends CI_Controller {
	function __construct(){
	    parent::__construct();
		//加载会员模型
		$this->load->model('admin');
        //判断登陆
		$this->admin->login();
        //当前模版
		$this->load->get_templates();
	}

	//有情连接列表
	public function index(){
		$page = (int)$this->input->get_post('page');
		if($page == 0) $page = 1;
		$where = array();

		//每页数量
		$per_page = 20;
		$total = $this->csdb->get_nums('link',$where);
		$pagejs = ceil($total / $per_page); // 总页数
		if($pagejs == 0) $pagejs = 1;
		if($page > $pagejs) $page = $pagejs;
		$limit = array($per_page,$per_page*($page-1));
		//数据
        $data['link'] = $this->csdb->get_select('link','*',$where,'id DESC',$limit);
        $base_url = site_url('link')."?page=";
        $data['page_data'] = page_data($total,$page,$pagejs); //获取分页类
        $data['page_list'] = admin_page($base_url,$page,$pagejs); //获取分页类
        $this->load->view('link.tpl',$data);
	}


	//页面编辑
	public function edit($id = 0)
	{
 	    $id = intval($id);
		if($id==0){
		     $data['id'] = 0;
		     $data['name'] = '';
		     $data['url'] = '';
		}else{
		     $row = $this->csdb->get_row("link","*",array('id'=>$id)); 
		     $data['id'] = $id;
		     $data['name'] = $row->name;
		     $data['url'] = $row->url;
		}
        $this->load->view('link_edit.tpl',$data);
	}

	//修改入库
	public function save($id = 0)
	{
		$id = (int)$id;
		$data['name'] = $this->input->post('name',true);
		$data['url'] = $this->input->post('url',true);
		if(empty($data['name']) || empty($data['url'])){
             getjson('数据不完整~！');
		}

		if($id==0){
             $this->csdb->get_insert('link',$data);
		}else{
             $this->csdb->get_update('link',$id,$data);
		}
        getjson('数据操作完成',1);
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
				$this->db->delete('link',array('id'=>$id));
			}
		}else{
			$id = intval($ids);
			$this->db->delete('link',array('id'=>$id));
		}
		$info['msg'] = '操作完成';
		$info['url'] = site_url('link')."?v=".rand(0,999);
		getjson($info,1);
	}
}