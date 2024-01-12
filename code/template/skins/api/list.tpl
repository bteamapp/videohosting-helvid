<?php 
echo '<?xml version="1.0" encoding="UTF-8"?><rss version="5.1"><list page="'.$page.'" pagecount="'.$pagejs.'" pagesize="'.$size.'" recordcount="'.$nums.'">';
foreach ($vod as $row) { 
	echo '<video><last>'.date('Y-m-d H:i:s',$row->addtime).'</last><id>'.$row->id.'</id><tid>'.$row->cid.'</tid><name><![CDATA['.$row->name.']]></name><type>'.getzd('class','name',$row->cid).'</type><dt>2028zy</dt><note><![CDATA[高清]]></note></video>';
}
echo '</list><class>';
foreach ($class as $row) { 
	echo '<ty id="'.$row->id.'">'.$row->name.'</ty>';
}
echo '</class></rss>';