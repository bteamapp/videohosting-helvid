
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                      <div class="row">
                        <div class="col-md-12">
                            <!-- Begin: life time stats -->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                        <div class="caption" style="width: 75%;height: 33px;overflow: hidden;">
                                            <i class="fa fa-upload fa-lg font-red"></i>
                                            <span class="caption-subject font-red sbold uppercase">我的视频 &nbsp;</span>
 
                                              <span class="caption-helper"> （你总共上传了 <?=$this->csdb->get_nums('vod',array('uid'=>$user->id))?> 部视频） </span>
 
                                        </div>
                                        <div class="actions">
                                        	
                               <div class="btn-group">
                                            <a class="btn red btn-outline  btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="false"> 浏览模式
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                  <a href="javascript:;"><i class="fa fa-check"></i> 详情模式</a>
                                                </li>
                                                <li class="divider"> </li>
                                                <li>
                                                    <a href="<?=links('vod','index','pic',$cid)?>"> 图文模式</a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                                                    
                                                                    
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tabbable-line">
                                            <ul class="nav nav-tabs">
                                                <li<?php if($cid == 0) echo ' class="active"';?>><a href="<?=links('vod')?>">全部视频</a></li>
                                                <?php 
                                                foreach($class as $row){
                                                    $cls = $cid == $row->id ? 'active' : '';
                                                    echo '<li class="'.$cls.'"><a href="'.links('vod','index',$op,$row->id).'">'.$row->name.'</a></li>';
                                                }
                                                ?>
    	                                    </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="overview_1">
                                                    <table class="table table-striped table-hover table-bordered reponse-table">
                                                        <thead>
                                                            <tr>
                                                                <th> 视频名称 </th>
                                                                <th> 类别 </th>
                                                                <th> 分类 </th>
                                                                <th> 状态</th>
                                                                <th> 发布时间 </th>
                                                                <th> 操作 </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <?php
                                                        if(empty($vod)) echo '<tr><td align="center" height="50" colspan="7">没有相关记录</td></tr>';
                                                        $arr = array();
														foreach($vod as $k=>$row){
															if($row->fid > 0){
																$server = $this->csdb->get_row_arr('server','m3u8dir,cdnurl',array('id'=>$row->fid));
															}else{
																$server = array();
															}
                                                            $cname = $myname = ' -- ';
                                                            if($row->cid > 0) $cname = getzd('class','name',$row->cid);
                                                            if($row->mycid > 0) $myname = getzd('myclass','name',$row->mycid);
                                                            if($row->zt == 1){
                                                                $color = '';
                                                                $zt = '<i class="fa fa-spinner"></i>转码中';
                                                            }elseif($row->zt == 2){
                                                                $color = 'color:#080;';
                                                                $zt = '<i class="fa fa-check-square-o"></i>已转码';
                                                            }elseif($row->zt == 3){
                                                                $color = 'color:red;';
                                                                $zt = '<i class="fa fa-window-close-o">转码失败</i>';
                                                            }else{
                                                                $color = 'color:#f90;';
                                                                $zt = '<i class="fa fa-retweet"></i>待转码';
                                                            }
                                                            $pic = $pic2 = '';
                                                            for($i = 1;$i<=Jpg_Num;$i++){
                                                                $piclink = m3u8_link($row->vid,$row->addtime,'pic',$i,$server);
                                                                $pic .= '<img alt="'.$row->name.'" src="'.$piclink.'">';
                                                                $pic2 .= $piclink.'</br>';
                                                            }
                                                            echo '
                                                            <tr>
                                                                <td style="text-align: left;"><a href="'.links('play','index',$row->vid).'" target="_blank">'.$row->name.'</a> <span class="label label-info">'.formatsize($row->size).'</span></td>
                                                                <td>'.$cname.'</td>
                                                                <td>'.$myname.'</td>
                                                                <td class="text-primary" style="'.$color.'">'.$zt.'</td>
                                                                <td>'.get_time($row->addtime).'</td>
                                                                <td><a onclick="n='.$k.';get_mode(\'fetch\');" href="#longshare" data-toggle="modal" class="mt-clipboard btn btn-sm btn-default"><i class="icon-note"></i>链接</a><a href="#long'.$row->id.'" data-toggle="modal" class="btn btn-sm btn-default"> <i class="fa fa-file-picture-o"></i>截图</a><a  href="'.links('play','index',$row->vid).'"  target="_blank" class="btn btn-sm btn-default">  <i class="fa fa-search"></i>预览</a><a href="'.links('vod','edit',$row->id).'" class="btn btn-sm btn-default"><i class="fa fa-edit"></i>编辑</a></td>
                                                            </tr>

                                                            <div id="long'.$row->id.'" class="modal fade" tabindex="-1" data-width="600">
                                                            <div class="modal-dialog" style="margin:0px;padding:0px;">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                        <h4 class="modal-title">来自 '.$row->name.' 预览图</h4>
                                                                    </div>
                                                                    <div class="modal-body" style="height:120px" >
                                                                        '.$pic.' 
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="well" id="copyshare'.$row->id.'" style="margin-bottom: 0px;">'.$pic2.'</div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" href="javascript:;" data-clipboard-text="'.$pic2.' "  class="mt-clipboard btn btn-success copy-img">一键复制</button>
                                                                        <button type="button" data-dismiss="modal" class="btn btn-primary">关闭</button>
                                                                    </div>
                                                                </div>
                                                            </div>';
															$arr[$k]['name'] = $row->name;
															$arr[$k]['link'] = 'https://'.Web_Url.links('play','index',$row->vid);
                                                        }
                                                        ?>
                                                        </tbody>
                                                    </table>
                                                    <div class="row">
                                                        <div class="col-md-offset-4 col-md-8">
                                                            <ul class="pagination"  style="float:right">
                                                                <?=$pages?>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<div id="longshare" class="modal fade in modal-overflow" aria-hidden="true" tabindex="-1" data-width="600" style="display: none;">
    <div class="modal-content" style="opacity: 1;">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">获取分享地址</h4>
        </div>
        <div class="modal-body">

            <div style="padding-top:5px;">
                <h5>播放器地址</h5>
                <div class="input-group" id="copy_caji">
                    <input type="text" class="form-control">
                    <span class="input-group-addon copy-btn" data-clipboard-text="">复制[采集模式]</span>
                </div>
                <br>
                <div class="input-group" id="copy_wjmwz">
                    <input type="text" class="form-control">
                    <span class="input-group-addon copy-btn" data-clipboard-text="">复制[文件名和网址]</span>
                </div>
            </div>
            <div style="padding-top:20px;">
                <div class="alert alert-danger">
                    <strong>警告：</strong>
                    请确认您所分享的文件资源符合当地的相关法律法规，并知晓您所需要承担的责任和风险！
                </div>
                <div class="alert alert-danger">
                    <strong>提醒：</strong>
                    播放器 (推荐)能实现故障自动切换，并完美支持H5播放器；M3U8 在节点故障时无法自动迁移！
                </div>
            </div>
        </div>
        <div class="modal-footer" style="padding:20px;">
            <a type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                关闭
            </a>
        </div>
    </div>
</div>
<script language="javascript">
var n = 0;
//文件外链代码
var upl_array = <?=json_encode($arr)?>;
function get_mode(type){
  var file = upl_array[n];
  var line = file['name'] + '$' + file['link'];
  $('#copy_caji input').val(line);
  $('#copy_caji .copy-btn').attr('data-clipboard-text',line);
  var line = '[ '+file['name'] + ' ] : ' + file['link'];
  $('#copy_wjmwz input').val(line); 
  $('#copy_wjmwz .copy-btn').attr('data-clipboard-text',line);
}
$(document).ready(function() {
    var layer = layui.layer;
    $('#a3').addClass('active');
    $('.copy-btn').on('click', function () {
        var clipboard = new Clipboard('.copy-btn');
        clipboard.on('success', function(e) {
          layer.msg('复制成功');
        });
        clipboard.on('error', function(e) {
          layer.msg('复制失败', {shift: 6});
        });
    })
    $('.copy-img').on('click', function () {
        var clipboard2 = new Clipboard('.copy-img');
        clipboard2.on('success', function(e) {
          layer.msg('复制成功');
        });
        clipboard2.on('error', function(e) {
          layer.msg('复制失败', {shift: 6});
        });
    })
});
</script>