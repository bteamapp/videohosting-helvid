
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                      <div class="row">
                        <div class="col-md-12">
                            <!-- Begin: life time stats -->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-search fa-lg font-red"></i>
                                            <span class="caption-subject font-red sbold uppercase">搜索关键字：<?=$key?> &nbsp;</span>
                                              <span class="caption-helper"> （总共有 <?=$nums?> 部符合查询条件的视频） </span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tabbable-line">
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="overview_1">
                                                    <table class="table table-striped table-hover table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th> 视频名称 </th>
                                                                <th> 类别 </th>
                                                                <th> 上传会员 </th>
                                                                <th> 状态</th>
                                                                <th> 发布时间 </th>
                                                                <th> 视频ID </th>
                                                                <th> 操作 </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <?php
														$arr = array();
                                                        if(empty($vod)) echo '<tr><td align="center" height="50" colspan="7">没有相关记录</td></tr>';
                                                        foreach($vod as $k=>$row){
															if($row->fid > 0){
																$server = $this->csdb->get_row_arr('server','m3u8dir,cdnurl',array('id'=>$row->fid));
															}else{
																$server = array();
															}
                                                            $cname = ' -- ';
                                                            if($row->cid > 0) $cname = getzd('class','name',$row->cid);
                                                            if($row->zt == 1){
                                                                $color = 'color:#080;';
                                                                $zt = '<i class="fa fa-spinner"></i>转码中';
                                                            }elseif($row->zt == 2){
                                                                $color = '';
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
                                                                $pic2 .= $piclink.'<br>';
                                                            }
                                                            echo '
                                                            <tr>
                                                                <td style="text-align: left;"><a href="'.links('play','index',$row->vid).'" target="_blank">'.$row->name.'</a> <span class="label label-info">'.formatsize($row->size).'</span></td>
                                                                <td>'.$cname.'</td>
                                                                <td>'.getzd('user','name',$row->uid).'</td>
                                                                <td class="text-primary" style="'.$color.'">'.$zt.'</td>
                                                                <td>'.get_time($row->addtime).'</td>
                                                                <!--td><span id="copyid'.$row->id.'"> '.$row->vid.' </span>&nbsp;&nbsp;<a href="javascript:;" data-clipboard-action="copy" data-clipboard-target="#copyid'.$row->id.'" class="mt-clipboard btn btn-sm btn-default"><i class="icon-note"></i>点击复制</a></td-->
                                                                <td><a onclick="n='.$k.';get_mode(\'fetch\');" href="#longshare" data-toggle="modal" class="mt-clipboard btn btn-sm btn-default"><i class="icon-note"></i>点击获取分享链接</a></td>
                                                                <td><a href="#long'.$row->id.'" data-toggle="modal"  class="btn btn-sm btn-default"> <i class="fa fa-file-picture-o"></i> 预览图 </a><a  href="'.links('play','index',$row->vid).'"  target="_blank" class="btn btn-sm btn-default">  <i class="fa fa-search"></i> 预览 </a><a  href="javascript:getajax(\''.links('ajax','fav',$row->id).'\',\'fav\');" class="btn btn-sm btn-default">  <i class="fa fa-heart"></i> 收藏 </a></td>
                                                            </tr>

                                                            <div id="long'.$row->id.'" class="modal fade" tabindex="-1" data-width="600">
                                                            <div class="modal-dialog" style="margin:0px;padding:0px;">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                        <h4 class="modal-title">来自 '.$row->name.' 预览图</h4>
                                                                    </div>
                                                                    <div class="modal-body" style="height:350px" >
                                                                        '.$pic.' 
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="well" id="copyshare'.$row->id.'" style="margin-bottom: 0px;">'.$pic2.'</div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" href="javascript:;" data-clipboard-action="copy" data-clipboard-target="#copyshare'.$row->id.'"  class="mt-clipboard btn btn-success">一键复制</button>
                                                                        <button type="button" data-dismiss="modal" class="btn btn-primary">关闭</button>
                                                                    </div>
                                                                </div>
                                                            </div>';
															$arr[$k]['name'] = $row->name;
															$arr[$k]['link'] = 'http://'.Web_Url.links('play','index',$row->vid);
															$arr[$k]['m3u8'] = m3u8_link($row->vid,$row->addtime,'m3u8',1,$server);
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
			<table align="center" width="100%" cellpadding="4" cellspacing="0" border="0" class="td_line">
				<tbody>
				<tr>
					<td>
						<div>播放器 (推荐): 
							<a href="javascript:void(0);" onclick="get_mode('fetch');">[采集模式]</a> 
							- <a href="javascript:void(0);" onclick="get_mode('wnurl');">[文件名和网址]</a>
						</div>
						<div>M3U8: 
							<a href="javascript:void(0);" onclick="get_mode('m3u8');">[M3U8采集模式]</a>
							- <a href="javascript:void(0);" onclick="get_mode('m3u8url');">[M3U8文件名和网址]</a>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
			<div style="padding-top:5px;">
				<textarea id="link_area" style="width:100%; height:300px;"></textarea>
			</div>
			<div style="padding-top:20px;">
				<div class="alert alert-danger">
					  <strong>警告：</strong>请确认您所分享的文件资源符合当地的相关法律法规，并知晓您所需要承担的责任和风险！
				</div>
				<div class="alert alert-danger">
					  <strong>提醒：</strong>播放器 (推荐)能实现故障自动切换，并完美支持H5播放器；M3U8 在节点故障时无法自动迁移！
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
<script type="text/javascript">
var n = 0;
//文件外链代码
var upl_array = <?=json_encode($arr)?>;
function get_mode(type){
	var file = upl_array[n];
	switch(type){
		case 'fetch':
			var line = file['name'] + '$' + file['link'];
		break;
		case 'm3u8':
			var line = file['name'] + '$' + file['m3u8'];
		break;
		case 'wnurl':
			var line = '[ '+file['name'] + ' ] : ' + file['link'];
		break;
		case 'm3u8url':
			var line = '[ '+file['name'] + ' ] : ' + file['m3u8'];
		break;
	}
	if(document.all){
		document.getElementById('link_area').innerText = line;
	}else{
		document.getElementById('link_area').innerHTML = line;
	}
}
$('#vall').addClass('open');
$("#vodlist").css('display','block');
</script>