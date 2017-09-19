<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
		html{height:100%;}
		body{height:100%;margin:0px;padding:0px;}
		#top{width:100%;height:60px;border-bottom:1px solid #ccc;}
		#aside{position:absolute;height:541px;border-right:1px solid #bbb;background:#ddd;}
		/* #map{margin-left:410px;} */
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4GP1SsiqVkKPbFibQ8Qc4smTsFDFLQax"></script>
	<title>网点</title>
	<!-- Bootstrap-Core-CSS -->
	<link href="${app}/assets/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom-Theme-Styling -->
	<link href="${app}/assets/css/style.css" rel="stylesheet"
		type="text/css" media="all" />
	<!-- Owl-Carousel-Styling -->
	<link rel="stylesheet" href="${app}/assets/css/owl.carousel.css"
		type="text/css" media="all">
	<script src="${app}/assets/js/modernizr.custom.js"></script>
	<script src="${app}/assets/js/jquery.min.js"></script>
	
</head>
<body onresize="checkSize()" style="background:url(../assets/images/1.jpg)">
	<div class="row">	
		<div style="width:95%" class="center-block">
			<!-- Header-Starts-Here -->
			<div style="height:70px">
				<div class=" header">
					<div class="container"  >
					<!-- Navigation -->
					<nav class="navbar navbar-inverse" style="left:20%"> 
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="col-md-1 cl-effect-7"><a href="#">Home</a></li>
								<li class="col-md-1 cl-effect-7"><a href="#services">服务</a></li>
								<li class="col-md-1 cl-effect-7"><a href="#offer">提供</a></li>
								<li class="col-md-1 cl-effect-7"><a href="${app}/findMap.action">网点</a></li>
								<li class="col-md-1 cl-effect-7"><a href="${app}/home/reg">注&nbsp;册/</a></li>
								<li class="col-md-1 cl-effect-7"><a href="${app}/home/login"> &nbsp;| &nbsp;登&nbsp;陆</a>
								</li>
							</ul>
						</div>
						<!-- //Navbar-collapse -->
					</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="main">
		<div class="row">
		    <div id="aside" class=" panel panel-default col-md-2 col-md-offset-2 ">
					<br/>
		    	<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">城市名</span>
					<input type="text" id="cityName" class="form-control" placeholder="city name" aria-describedby="basic-addon1">

					<!-- <input id="cityName" type="text" style="width:100px;margin-right: 100px"/> -->
					
				</div>
				<div class="input-group">
					<br/>
					<button type="button"  onclick="theLocation(this.value)" class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="该功能为查询指定地点的下级网点">查询</button>
					&nbsp;&nbsp;
					<button type="button"  onclick="getLocation()" class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="我是啥我自己都不知道">显示当前位置</button>
				</div>
				<br/>
				<div>
					<div class="panel panel-default" >
					  <div class="panel-heading">网点列表</div>
					  <div class="panel-body pre-scrollable"  style="height:80%">
					    <ul class="nav nav-pills nav-stacked">
						  <c:forEach items="${mapList}" var="d" >	
						  		<%-- <c:set value="${fn:replace(d,']', '') }" var="tmp"></c:set>		  
						  		<c:set value="${tmp = fn:replace(tmp,'[', '') }" var="tmp"></c:set>	 --%>	  
							  <li>
							  		<button type="button" style="float:left" value="${d.address}" onclick="theLocation('${d.address}')" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="跳到->${d.deptName}  下的网点"  >${d.address},${d.deptName},${d.telephone }</button>
							  	</li>
						  </c:forEach>
						</ul>	
					  </div>
					</div>
				</div>  
				<div>
					<div class="panel panel-default" >
					  <div class="panel-heading">使用说明</div>
					  	<div class="panel-body"  style="height:100%">
					  		查看网点列表<br/>
					  		查看网点间路径(暂不支持中间点)<br/>
					  	</div>
					</div>
				</div>   
		    </div>
		    
		   
			<div class="panel panel-default col-md-6 col-md-offset-4" style="background-color:#bbb">
				<div id="map"  style="height:530px"></div>
			</div>
		</div>
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
	var map = null;
	function checkSize() {
	    var h = document.documentElement.clientHeight;
	    document.getElementById('aside').style.height = h - 80 + "px";
	    document.getElementById('map').style.height = h - 80 + "px";
	}
	function init() {
	    checkSize();
	    map = new BMap.Map('map');
	    map.centerAndZoom(new BMap.Point(116.404, 39.915),5);
	    window.map = map;
	}
	init();
	//map.centerAndZoom(new BMap.Point(116.404, 39.915),5);
	// console.log(map.getContainer());
	//城市名查询
	function theLocation(city) {
		if (city == "") {
			city = document.getElementById("cityName").value;
		}
		map.centerAndZoom(city.replace("\"",""), 13);//用地图名设置成地图中心点
	}
	function getLocation(){
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.centerAndZoom(r.point,11);
			}
			else {
				alert('failed'+this.getStatus());
			}        
		},{enableHighAccuracy: true})
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
				var infoWindow = new BMap.InfoWindow(label.content.replace(/\"|\"$/g,''), opts);
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
				myGeo.getPoint(add.address, function(point) {
					if (point) {
						//将地区信息输出在页面上
						var address = new BMap.Point(point.lng, point.lat);
						addMarker(address, new BMap.Label(index + ":" + 
								add.address+"\n"+
								add.deptName+"\n"+
								add.telephone
								, {
							offset : new BMap.Size(20, -10)
						}));
					}else console.log(add.address+"地址解析失败");
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
			// 编写自定义函数,创建文字标注,增加右键菜单

			//开启鼠标滚轮缩放
			map.enableScrollWheelZoom(true);
		
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

