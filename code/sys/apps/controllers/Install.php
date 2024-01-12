<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Install extends CI_Controller {

	function __construct(){
	    parent::__construct();
        //当前模版
		$this->load->get_templates();
		if(file_exists(FCPATH.'packs/install/install.lock')){
			exit('重新安装，请删除./packs/install/install.lock文件');
		}
	}

	public function index(){
		$this->load->view('install.tpl');
	}

	public function save(){
		$host = $this->input->post('host',true);
		$port = (int)$this->input->post('port',true);
		$name = $this->input->post('name',true);
		$prefix = $this->input->post('prefix',true);
		$user = $this->input->post('user',true);
		$pass = $this->input->post('pass',true);
		$weburl = $this->input->post('weburl',true);
		$zmurl = $this->input->post('zmurl',true);
		$admin_name = $this->input->post('admin_name',true);
		$admin_pass = $this->input->post('admin_pass',true);
		if($port == 0) $port = '';

		if(empty($host) || empty($name) || empty($user) || empty($pass) || empty($admin_name) || empty($admin_pass)){
			exit("<script>alert('数据不完整~!');history.go(-1);</script>");
		}

		//修改数据库配置
        $this->load->helper('string');
        $Encryption_Key = random_string('alnum',12);
		$driver = is_php('5.4') ? 'mysqli' : 'mysql';
	    $config=file_get_contents(FCPATH.'sys/libs/db.php');
	    $config=preg_replace("/'CT_Sqlserver','(.*?)'/","'CT_Sqlserver','".$host."'",$config);
	    $config=preg_replace("/'CT_Sqlport','(.*?)'/","'CT_Sqlport','".$port."'",$config);
	    $config=preg_replace("/'CT_Sqlname','(.*?)'/","'CT_Sqlname','".$name."'",$config);
	    $config=preg_replace("/'CT_Sqluid','(.*?)'/","'CT_Sqluid','".$user."'",$config);
	    $config=preg_replace("/'CT_Sqlpwd','(.*?)'/","'CT_Sqlpwd','".$pass."'",$config);
	    $config=preg_replace("/'CT_Dbdriver','(.*?)'/","'CT_Dbdriver','".$driver."'",$config);
	    $config=preg_replace("/'CT_SqlPrefix','(.*?)'/","'CT_SqlPrefix','".$prefix."'",$config);
	    $config=preg_replace("/'CT_Encryption_Key','(.*?)'/","'CT_Encryption_Key','".$Encryption_Key."'",$config);
	    if(!write_file(FCPATH.'sys/libs/db.php', $config)){
			exit("<script>alert('./sys/libs/db.php文件没有修改权限');history.go(-1);</script>");
		}
		//修改域名
	    $config2 = file_get_contents(FCPATH.'sys/libs/config.php');
	    $config2 = preg_replace("/'Web_Url','(.*?)'/","'Web_Url','".$weburl."'",$config2);
	    $config2 = preg_replace("/'Web_Zm_Url','(.*?)'/","'Web_Zm_Url','".$zmurl."'",$config2);
		write_file(FCPATH.'sys/libs/config.php', $config2);

		//数据表
		$sql = file_get_contents(FCPATH."packs/install/mysql.sql");
		$sql = str_replace("[prefix]",$prefix,$sql);
		$adminsql = "INSERT INTO `".$prefix."admin` VALUES ('1', '".$admin_name."', '".md5($admin_pass)."', '', '127.0.0.1', '".time()."');";
		if(is_php('5.4')){
            $mysqli = new mysqli($host,$user,$pass);
            //检查连接是否成功
            if (mysqli_connect_errno()){
				exit("<script>alert('数据库链接失败~!');history.go(-1);</script>");
            }
			if(!$mysqli->select_db($name)){
				if(!$mysqli->query("CREATE DATABASE `".$name."`")){
					exit("<script>alert('数据库表《".$name."》不存在，请手动创建~!');history.go(-1);</script>");
				}
				$mysqli->select_db($name);
			}
			$mysqli->query("SET NAMES utf8");
            //导入数据表
	        $sqlarr = explode("#ctcms#",$sql);
	        for($i=0;$i<count($sqlarr);$i++){
				  if(!empty($sqlarr[$i])){
		               $mysqli->query($sqlarr[$i]);
				  }
	        }
			//后台账号
			$mysqli->query($adminsql);
		}else{
			$lnk=mysql_connect($host,$user,$pass);
			if(!$lnk) exit("<script>alert('数据库链接失败~!');history.go(-1);</script>");
			if(!mysql_select_db($name,$lnk)){
				if(!mysql_query("CREATE DATABASE `".$name."`")){
				    exit("<script>alert('数据库表《".$name."》不存在，请手动创建~!');history.go(-1);</script>");
				}
				mysql_select_db($name,$lnk);
			}
	        mysql_query("SET NAMES utf8", $lnk);
            //导入数据表
	        $sqlarr = explode("#ctcms#",$sql);
	        for($i=0;$i<count($sqlarr);$i++){
				  if(!empty($sqlarr[$i])){
		               mysql_query($sqlarr[$i]);
				  }
	        }
			//后台账号
			mysql_query($adminsql);
		}
	    if(!write_file(FCPATH.'packs/install/install.lock', 'ctcms')){
			exit("<script>alert('./packs/install/目录没有写入权限');history.go(-1);</script>");
		}
		$web_path = str_replace(str_replace("\\","/",getcwd()),'',FCPATH);
		exit("<script>alert('恭喜您，安装完成');window.location.href='".$web_path."admin.php';</script>");
	}
}