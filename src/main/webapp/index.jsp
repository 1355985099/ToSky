<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../WEB-INF/base.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=10">
<title>首页</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${app}/staticfile/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${app}/staticfile/dist/css/ionicons.min.css">
<link rel="stylesheet" href="${app}/staticfile/dist/css/AdminLTE.css">
<link rel="stylesheet"
	href="${app}/staticfile/dist/css/skins/_all-skins.css">
<link rel="stylesheet" href="${app}/staticfile/vince/css/vince.css">
<link rel="stylesheet"
	href="${app}/staticfile/vince/biao/css/font-awesome.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="fuceng">
		<div class="fuqu" id="box">
			<div class="fuquzone">
				<div class="fuqulogo" id="bar1"></div>
				<p class="fuqutitle" id="bar">
					<span class="fuclose">×</span>
				</p>

				<div class="sy_newtable">
					<div class="sy_newtabletitle">
						<div class="sy_newtabletitlelf">
							<p>每月完成目标</p>
						</div>
						<div class="sy_newtabletitleri">
							<p>每日目标分解</p>
						</div>
					</div>
					<div class="sy_newtablecon">
						<div class="sy_newtableconle">
							<input type="text" value="57430">百万
						</div>
						<div class="sy_newtableconri"></div>
					</div>
				</div>
				<div class="fuqusave">
					<input type="button" value="保存">
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<header class="main-header">
			<a href="#" class="logo"> <span class="logo-mini"> <img
					src="vince/images/v01.png">
			</span> <span class="logo-lg"><img
					src="${app}/staticfile//vince/images/v01.png">项目</span>
			</a>
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"></a> <span class="all_title">通天物流国际后台管理系统</span>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${app}/staticfile/dist/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> <span
								class="hidden-xs">管理员</span>
						</a>
							<ul class="dropdown-menu">
								<li class="user-header"><img
									src="${app}/staticfile/dist/img/user2-160x160.jpg"
									class="img-circle" alt="User Image">
									<p>
										姓名：管理员 <small>部门：信息部</small>
									</p></li>
								<li class="user-footer">
									<div class="pull-right">
										<a href="login.html" class="btn btn-default btn-flat">退出系统</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">

				<div class="user-panel">
					<div class="pull-left image">
						<img src="${app}/staticfile/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>当前用户：管理员</p>
						<p class="menu_time">
							时间：<span id="nowTime"> 他他他</span>
						</p>
					</div>
				</div>
				<ul class="sidebar-menu">
					<li class="header"><h3>菜单 MENU</h3></li>
					<li class="active"><a href="index.html"> <i
							class="fa fa-home" style="font-size: 22px"></i> <span>首页</span>
					</a></li>
					<li><a href="${app}/staticfile/jDeptList.html"> <i
							class="fa fa-eye"></i> <span>网点查询</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-magnet"></i>
							<span>用户管理</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="/toCreate"><i class="fa fa-bookmark"></i>用户新增
							</a></li>
							<li><a href="/toUpdate"><i class="fa fa-bookmark"></i>用户修改
							</a></li>
							<li><a href="/user/toFindAll"><i class="fa fa-bookmark"></i>用户查询
							</a></li>
							<li><a href="/toDelete"><i class="fa fa-bookmark"></i>用户删除
							</a></li>
							<li><a href="/toRoleAssign"><i class="fa fa-bookmark"></i>角色分配
							</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-sliders"></i>
							<span>部门管理</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="xyxgpj.html"><i class="fa fa-bookmark"></i>
									部门新增 </a></li>
							<li><a href="fhxyfx.html"><i class="fa fa-bookmark"></i>
									部门修改 </a></li>
							<li><a href="fhxyfx.html"><i class="fa fa-bookmark"></i>
									部门 查询 </a></li>
							<li><a href="xyfagl.html"><i class="fa fa-bookmark"></i>
									部门删除 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-map"></i>
							<span>角色管理</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="sbrk.html"><i class="fa fa-bookmark"></i>
									角色新增</a></li>
							<li><a href="sbaz.html"><i class="fa fa-bookmark"></i>
									角色修改</a></li>
							<li><a href="sbjx.html"><i class="fa fa-bookmark"></i>
									角色查询</a></li>
							<li><a href="sbbf.html"><i class="fa fa-bookmark"></i>
									角色删除</a></li>
						</ul></li>

					<li><a href="yjgl.html"> <i class="fa fa-bell"></i> <span>异常管理</span>
					</a></li>

					<li><a href="kzcl.html"> <i class="fa fa-magnet"></i> <span>统计查询</span>
					</a></li>
					<li><a href="xtjc.html"> <i class="fa fa-gears"></i> <span>系统集成</span>
					</a></li>
				</ul>
			</section>
		</aside>
		<div class="content-wrapper">
			<section class="content-header">
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
				</ol>
			</section>
			<div class="content qqq">
				<div class="rezone">
					<div class="requtu">
						<img src='${app}/staticfile/vince/images/001.jpg' usemap="#Map" />
						<map name="Map">
							<area shape="poly" id="hotone"
								coords="487,85,563,60,660,41,721,35,753,35,772,40,785,45,778,190,748,197,729,213,727,230,727,264,680,276,665,273,640,269,624,269,598,273,580,273,564,274,556,274,542,280,524,280,508,278,492,278,485,263"
								href="#">
							<area shape="poly" id="hottwo"
								coords="185,156,213,177,223,175,236,188,238,200,307,211,308,196,330,189,424,156,422,110,400,91,315,72,311,51,257,40,244,32,212,26,168,32,155,45,156,115,159,135"
								href="#">
						</map>
						<a href="yjgl.html">
							<div class="sy_jinggao jing"></div>
						</a>
						<div class="requone">
							<div class="requzuo"></div>
							<div class="requyou">
								<p class="requyou_title">通天办公楼</p>
								<li class="requyou_inf"><span class="requyou_infleft">总部职能</span>
									<span class="requyou_infright">人力资源部</span></li>
								<li class="requyou_inf"><span class="requyou_infleft">仓储管理部</span>
									<span class="requyou_infright">经营门店部</span></li>
								<li class="requyou_inf"><span class="requyou_infleft">运营中心</span>
									<span class="requyou_infright">财务部</span></li>
							</div>
						</div>
						<div class="requtwo">
							<div class="requzuo"></div>
							<div class="requyou">
								<p class="requyou_title">通天休闲楼</p>
								<li class="requyou_inf"><span class="requyou_infleft">室内游泳馆</span>
									<span class="requyou_infright">室内篮球场</span></li>
								<li class="requyou_inf"><span class="requyou_infleft">SPA洗浴中心</span>
									<span class="requyou_infright">泰国推拿体验馆</span></li>
								<li class="requyou_inf"><span class="requyou_infleft">舌尖上的中国</span>
									<span class="requyou_infright">天上人间</span></li>
							</div>
						</div>
					</div>
				</div>
				<div class="sy_info">
					<div class="sy_info_left lindianjia">
						<p>
							月完成目标：<span>57430</span> 百万 <br> 日分解目标：<span>4098</span>
							百万
						</p>
					</div>
					<div class="sy_info_right">
						<div class="sy_info_one">
							<p>
								当<br>前<br>运<br>营<br>方<br>案
							</p>
						</div>
						<div class="sy_info_three">
							<table>
								<tr>
									<td rowspan="2">目标完成方案：<span class="shoudanxuan"></span><br>2017年9月方案
									</td>
									<td>策略1:提升配送效率策略<span class="shoudanxuan"></span></td>
									<td>扩展转运中心：16个</td>
									<td>合理规划门店地址</td>
									<td>以当日完成投递为KPI考核</td>
								</tr>
								<tr>
									<td>策略2:提升客户体验<span class="shoudanxuan"></span></td>
									<td>设置自动化立体仓库</td>
									<td>持续引进机器人自动分拣系统</td>
									<td>推出当日达,次日达等不同物流产品服务</td>
								</tr>
							</table>
							<div class="clear"></div>
						</div>
						<div class="sy_info_four">
							<p>当前方案下已运行的:01、提升配送效率策略;02、提升客户体验策略;03、缩减成本策略</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>

			</div>
		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b></b>
			</div>
			<strong>Copyright &copy; 2016-2017 版权所有,仿冒必究：<a
				href="http://www.aspku.com/" target="_blank">通天物流国际</a></strong>
		</footer>
		<div class="control-sidebar-bg"></div>
	</div>
	<script src="${app}/staticfile/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="${app}/staticfile/bootstrap/js/bootstrap.min.js"></script>
	<script src="${app}/staticfile/dist/js/app.min.js"></script>

	<script src="${app}/staticfile/vince/js/nicescroll.js"></script>
	<script src="${app}/staticfile/vince/drag/zxx.drag.1.0.js"></script>
	<script src="${app}/staticfile/dist/js/demo.js"></script>
	<script src="${app}/staticfile/vince/js/demo.js"></script>

	<div id="sss" style="display: none; height: 200px; width: 200px;"></div>
	<script src="${app}/staticfile/vince/js/echarts.min.js"></script>
	<script type="text/javascript">
		var myChart1 = echarts.init(document.getElementById('sss'));
		option1 = {
			series : [ {
				data : [ 247, 179 ]
			} ]
		};
		myChart1.setOption(option1);
	</script>
</body>
</html>