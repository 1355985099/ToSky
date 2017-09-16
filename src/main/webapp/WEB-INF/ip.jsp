<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#allmap{height:90%;width:100%;content: counter();"}
		#r-result{height:20%;width:100%;font-size:20px;}
		#cityName{
			content: open-quote;
		}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4GP1SsiqVkKPbFibQ8Qc4smTsFDFLQax"></script>
	<title>地址解析</title>
</head>
<body>
	
	<div id="allmap"></div>
	<div id="r-result">
		 城市名：<input id="cityName" type="text" style="width:100px;margin-right: 100px"/>
		<input type="button" value="查询" onclick="theLocation()"/>
		<input type="button" value="批量地址解析" onclick="bdGEO()" />
		<br/>
		<br/> 
	  	
	</div>
</body>
</html>
<script type="text/javascript">
	
	var startImage = new Image();//起点的图片
	startImage.src = "statics/image/start.png";//起点图片路径
	var endImage = new Image();//终点的图片
	endImage.src = "statics/image/end.png";//终点图片路径
	var index = 0;
	var adds = ${maplist};
	var markers = [];
	var pt = null;
	var i = 0;
	// 创建地址解析器实例
	var point = null;//起点
	var pointend = null;//终点
	var myStartIcon = null;//起点图标
	var originalStartIcon = null;
	var myEndIcon = null;//终点图标
	var originalEndIcon = null;
	var mapMenu = null;//菜单
	var startMarker = null;//起点标注
	var endMarker = null;//终点标注
	var transit = null;//路径检索对象
	
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.404, 39.915),5);
	
	//城市名查询
	function theLocation() {
		var city = document.getElementById("cityName").value;
		if (city != "") {
			map.centerAndZoom(city, 11);//用地图名设置成地图中心点
		}
	}
	
	map.addEventListener("tilesloaded", function() {
		//window.setTimeout(function() {
			// 百度地图API功能
			var MAX = 100;
			var myGeo = new BMap.Geocoder();

			myStartIcon = new BMap.Icon(startImage.src, new BMap.Size(
					startImage.width, -startImage.height),
					{
						// 图标的定位点[左上角]相对于图标左上角的偏移值   [向左移动多少,向上移动多少]
						anchor : new BMap.Size(startImage.width / 2,
								startImage.height),
						// 设置图片偏移。   
						// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
						// 需要指定大图的偏移位置，此做法与css sprites技术类似。    
						imageOffset : new BMap.Size(0, 0)
					// 设置图片偏移    
					});
			myEndIcon = new BMap.Icon(endImage.src, new BMap.Size(
					endImage.width, -endImage.height), {
				// 图标中央下端的尖角位置。    
				anchor : new BMap.Size(endImage.width / 2, endImage.height),
				// 设置图片偏移。   
				// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
				// 需要指定大图的偏移位置，此做法与css sprites技术类似。    
				imageOffset : new BMap.Size(0, 0)
			// 设置图片偏移    
			});
			console.log("1");

			/*
			更改图标，并将原图标暂存
			 */
			var setStart = function(epoint, eepixl, marker)//增加起点
			{
				if(transit != null) transit.clearResults();//清楚上次查询结果
				var lng = parseFloat(marker.getPosition().lng);
				var lat = parseFloat(marker.getPosition().lat);

				point = new BMap.Point(lng, lat);//将标注的坐标赋值给起点
				if(startMarker != null) {
					//原有坐标抛弃
					startMarker.setIcon(originalStartIcon);
				}
				startMarker = marker;
				if (startMarker != null) {
					originalStartIcon = startMarker.getIcon();//暂存原图标
					startMarker.setIcon(myStartIcon);
				}
			}
			var setEnd = function(epoint, eepixl, marker)//增加终点
			{
				if(transit != null) transit.clearResults();//清楚上次查询结果
				var lng = parseFloat(marker.getPosition().lng);
				var lat = parseFloat(marker.getPosition().lat);

				pointend = new BMap.Point(lng, lat);
				if(endMarker != null) {
					//原有坐标抛弃
					endMarker.setIcon(originalEndIcon);
				}
				endMarker = marker;
				if (endMarker != null) {
					originalEndIcon = endMarker.getIcon();//暂存原图标
					endMarker.setIcon(myEndIcon);
				}
			}

			function addMarker(point, label) {
				
				var marker = new BMap.Marker(point);
				map.addOverlay(marker);
				var opts = {
					width : 200, // 信息窗口宽度
					height : 100, // 信息窗口高度
				//title : "海底捞王府井店" , // 信息窗口标题
				}
				var infoWindow = new BMap.InfoWindow(label.content, opts);
				marker.addEventListener("click", function() {
					map.openInfoWindow(infoWindow, point); //开启信息窗口
				});

				 //给当前的标注增加右键菜单
				var markerMenu=new BMap.ContextMenu();
				markerMenu.addItem(new BMap.MenuItem('设置为起点',setStart.bind(marker)));
				markerMenu.addSeparator();
				markerMenu.addItem(new BMap.MenuItem('设置为终点',setEnd.bind(marker))); 
				marker.addContextMenu(markerMenu); 

				//设置文字标准标注
				//label存储的值"1:浙江省杭州市江干区秋涛北路47号"
				//marker.setLabel(label);
				//跳动的动画
				marker.setAnimation(BMAP_ANIMATION_BOUNCE);
			}

			//批量地址解析
			function geocodeSearch(add) {
				if (index >= adds.length) {
					return;
				}
				myGeo.getPoint(add, function(point) {
					if (point) {
						//将地区信息输出在页面上
						var address = new BMap.Point(point.lng, point.lat);
						addMarker(address, new BMap.Label(index + ":" + add, {
							offset : new BMap.Size(20, -10)
						}));
					}else console.log(add+"地址解析失败");
				}, "合肥市");
				index++;
				bdGEO();
			}

			function bdGEO() {
				var add = adds[index];
				console.log(add);
				geocodeSearch(add);
			}

			bdGEO();

			console.log("2");
			// 编写自定义函数,创建文字标注,增加右键菜单

			console.log("3");
			//开启鼠标滚轮缩放
			map.enableScrollWheelZoom(true);

			console.log("4");
			

			console.log("5");
			function Clear() {//清除标注物
				//清楚地图的起点和终点的标注
				if(startMarker != null) startMarker.setIcon(originalStartIcon);
				startmarker = null;
				if(endMarker != null) endMarker.setIcon(originalEndIcon);
				endMarker = null;
				point = null;//清除起点
				pointend = null;//清除终点
			}
			console.log("6");
			function getPath() {
				var p1 = point;
				var p2 = pointend;
				if(p1 == null || p2 == null){
					alert("起点或终点未设置，直接获取没有结果");
				}
				if (transit == null) {
					transit = new BMap.DrivingRoute(map, {
						renderOptions : {
							map : map,
							// panel : "r-result",
							enableDragging : true
						//起终点可进行拖拽
						},
					});
				}
				transit.clearResults();//清楚上次查询结果
				//transit.disableAutoViewport();静止自动缩放
				transit.search(p1, p2);//进行路径查询
				Clear();//消除界面原有设置的标注物
			}
			console.log("7");
			//增加全局的右键菜单
			mapMenu = new BMap.ContextMenu();
			mapMenu.addItem(new BMap.MenuItem('获取终点和起点路径', getPath.bind()));
			map.addContextMenu(mapMenu);
			console.log("8");
		//}, 1000);
	});
</script>

