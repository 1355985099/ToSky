<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4GP1SsiqVkKPbFibQ8Qc4smTsFDFLQax"></script>
	<title>给覆盖物添加右键菜单</title>
</head>
<body>
	<div id="allmap" style="height:80%"></div>
	<span id="r-result" ></span>
</body>
</html>
 <script type="text/javascript">
//百度地图API功能
	var startImage = new Image();//起点的图片
	startImage.src = "statics/image/start.png";//起点图片路径
	var endImage = new Image();//终点的图片
	endImage.src = "statics/image/end.png";//终点图片路径
	var map = null;//地图
	var point = null;//起点
	var pointend = null;//终点
	var startMarker = null;//起点标注
	var endMarker = null;//终点标注
	var transit = null;//路径检索对象
	var myStartIcon = null;//起点图标
	var myEndIcon = null;//终点图标
	var mapMenu = null;//菜单 
	/*
	将obj对象转化为json串
	*/
	
	function toJson(obj){
		try{
	        var seen = [];
	        json = JSON.stringify(obj, function(key, val) {
	           if (typeof val == "object") {
	                if (seen.indexOf(val) >= 0) return;
	                seen.push(val)
	            }
	            return val;
	        });
	        return json;
	    }catch(e){
	        return e;
	    }
	}
	//这边需要停止一段时间等待图片加载
	window.setTimeout(function(){
		
		map = new BMap.Map("allmap");// 创建地图实例
		point = new BMap.Point(116.404, 39.915);//初始化起点
		map.centerAndZoom(point,15);//设置中心点坐标和地图级别
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
		pointend = new BMap.Point(116.403, 39.90);//初始化地图终点   
		
		myStartIcon = new BMap.Icon(startImage.src, new BMap.Size(startImage.width, -startImage.height),{
				// 图标的定位点[左上角]相对于图标左上角的偏移值   [向左移动多少,向上移动多少]
				   anchor: new BMap.Size(startImage.width/2, startImage.height),    
				   // 设置图片偏移。   
				   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
				   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
				   imageOffset: new BMap.Size(0, 0)   // 设置图片偏移    
				 }		
		); 
		myEndIcon = new BMap.Icon(endImage.src, new BMap.Size(endImage.width, -endImage.height),{
			// 图标中央下端的尖角位置。    
			   anchor: new BMap.Size(endImage.width/2, endImage.height),    
			   // 设置图片偏移。   
			   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
			   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
			   imageOffset: new BMap.Size(0, 0)   // 设置图片偏移    
			 }		);
		
		//增加起点 
		var setStart = function(epoint,eepixl){
			console.log("起点");
			console.log(epoint);//坐标
			console.log(eepixl);//像素位置
			var lng = parseFloat(epoint.lng);//
			var lat = parseFloat(epoint.lat);//
			point = new BMap.Point(lng,lat);
			if(startMarker != null){
				startMarker.setPosition(point);//设置将开始标注设置到point的位置，本文中意思是将开始标注设置到起点
			}
			else {
				//设立标注，并且设置图标
				startMarker = new BMap.Marker(new BMap.Point(lng, lat),{icon: myStartIcon});
				startMarker.setLabel("s");
				setmarkerMenu(startMarker);//给标注增加菜单	
			}
			map.addOverlay(startMarker);//将标注添加到地图
			console.log('4');
		}
	
		var removeMarker = function(epoint,eepixl,marker){
			map.removeOverlay(marker);
			if(marker.getLabel() == 'e'){
				
			}else {
				
			}
		}
		var setEnd = function(epoint,eepixl){
			console.log("终点");
			console.log(epoint);
			console.log(eepixl);
			var lng = parseFloat(epoint.lng);
			var lat = parseFloat(epoint.lat);
			pointend = new BMap.Point(lng,lat);
			if(endMarker != null){
				endMarker.setPosition(pointend);
			}else {
				endMarker= new BMap.Marker(new BMap.Point(lng, lat),{icon: myEndIcon});
				endMarker.setLabel("e");
				setmarkerMenu(endMarker);//
			}
				map.addOverlay(endMarker);
			console.log('5');			
		} 
		
		//创建右键菜单
		function setmarkerMenu(marker){
			var markerMenu=new BMap.ContextMenu();
			markerMenu.addItem(new BMap.MenuItem('删除',removeMarker.bind(marker)));
			marker.addContextMenu(markerMenu);
		}
		console.log('2');
		
		function getPath(){
			var p1 = point;
			var p2 = pointend;
			if(transit == null){
				transit = new BMap.DrivingRoute(map, {
					renderOptions: {
						map: map,
						panel: "r-result",
						enableDragging : true //起终点可进行拖拽
					},  
				});
			}
			transit.clearResults();//清楚上次查询结果
			//transit.disableAutoViewport();静止自动缩放
			transit.search(p1,p2);//进行路径查询
			Clear();//消除界面原有设置的标注物
		}
		function Clear(){//清除标注物
			map.clearOverlays();//清除图层覆盖物
			point = null;//清楚起点
			pointend = null;//清楚终点
			/* document.getElementById("keyword").value="";//清除搜索框结构 */
		}
		
		mapMenu = new BMap.ContextMenu();
		mapMenu.addItem(new BMap.MenuItem('设置为起点',setStart.bind()));
		mapMenu.addSeparator();
		mapMenu.addItem(new BMap.MenuItem('设置为终点',setEnd.bind())); 
		mapMenu.addSeparator();
		mapMenu.addItem(new BMap.MenuItem('获取终点和起点路径',getPath.bind()));
		map.addContextMenu(mapMenu);
	},1000);
</script>
