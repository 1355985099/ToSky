<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DD279b2a90afdf0ae7a3796787a0742e"></script>
	<title>给覆盖物添加右键菜单</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point,15);
	
	var removeMarker = function(e,ee,marker){
		map.removeOverlay(marker);
	}
	//创建右键菜单
	var markerMenu=new BMap.ContextMenu();
	markerMenu.addItem(new BMap.MenuItem('删除',removeMarker.bind(marker)));
	
	var marker = new BMap.Marker(point);
	map.addOverlay(marker);
	marker.addContextMenu(markerMenu);
</script>
