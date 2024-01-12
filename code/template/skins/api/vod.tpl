<?php 
echo '<?xml version="1.0" encoding="UTF-8"?><rss version="5.1"><list page="'.$page.'" pagecount="'.$pagejs.'" pagesize="'.$size.'" recordcount="'.$nums.'">';
foreach ($vod as $row) {
    $rows = array();
    if($row->fid > 0) $rows = $this->csdb->get_row_arr('server','*',array('id'=>$row->fid));
    $purl = '//'.Web_Url.links('play','index',$row->vid);
	echo '<video><last>'.date('Y-m-d H:i:s',$row->addtime).'</last><id>'.$row->id.'</id><tid>'.$row->cid.'</tid><name><![CDATA['.$row->name.']]></name><type>'.getzd('class','name',$row->cid).'</type><pic>'.m3u8_link($row->vid,$row->addtime,'pic',1,$rows).'</pic><lang></lang><area><![CDATA['.formatsize($row->size).']]></area><year>'.date('Y').'</year><state>0</state><note><![CDATA[高清]]></note><actor><![CDATA['.formattime($row->duration,1).']]></actor><director><![CDATA[好色资源盘]]></director><dl><dd flag="2028zy"><![CDATA[高清$'.$purl.']]></dd></dl><des><![CDATA['.$row->name.']]></des></video>';
}
echo '</list></rss>';