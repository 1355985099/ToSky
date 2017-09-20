<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/15
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>图表</title>
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
	
	<!-- //Web-Fonts -->
	<script src="${app}/assets/js/modernizr.custom.js"></script>
</head>
<body style="background:url(../../assets/images/1.jpg);font-size: 18px">
	
	<div class="row" style="margin-left: 220px">	
		<div style="width:95%" class="center-block">
			<!-- Header-Starts-Here -->
			<div style="height:170px">
				<div class=" header">
					<div class="container"  >
					<!-- Navigation -->
					<nav class="navbar navbar-inverse"> 
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<shiro:hasPermission name="Home">
									<li class="col-md-1 cl-effect-7"><a href="${app}/">Home</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="服务">
									<li class="col-md-1 cl-effect-7"><a href="#services">服务</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="提供">
									<li class="col-md-1 cl-effect-7"><a href="#offer">提供</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="下载">
									<!-- <li class="cl-effect-7 scroll"><a href="#cover">登陆/注册</a></li> -->
									<li class="col-md-1 cl-effect-7"><a href="${app}/downLoad">下载</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="About">
									<li class="col-md-1 cl-effect-7"><a href="#about">About</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="Gallery">
									<li class="col-md-1 cl-effect-7"><a href="#gallery">Gallery</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="联系我们">
									<li class="col-md-1 cl-effect-7"><a href="#contact">联系我们</a></li>
								</shiro:hasPermission>
							</ul>
						</div>
						<!-- //Navbar-collapse -->
					</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px"></div>
    <div style="text-align: center;">
    	<input onclick="drawWd()" value="网点" type="button"/>
    	<input onclick="drawYsfs()" value="运输" type="button"/>
    	<input onclick="drawBar()" value="订单" type="button"/>
    </div>
    <!-- ECharts单文件引入 -->
    <script src="../../staticfile/echarts/build/dist/echarts.js"></script>
    <script src="../../staticfile/echarts/doc/asset/js/jquery.js"></script>
    <script type="text/javascript">
    var echar;
    // 路径配置
    require.config({
        paths: {
            echarts: '../../staticfile/echarts/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
        	echar=ec;
        	drawYsfs();
        }
    );
    function drawBar() {
        var temp;
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/barquery",
            data: {},
            async : false,
            success: function(data){
//              alert(data);
                temp = data;
            }
        });

		var myChart=echar.init(document.getElementById('main'));
        var option = {
       		title : {  
                   text: '近7天订/出单量统计分析', 
                   textStyle:{//标题内容的样式
                       color:'rgb(250,250,250)',//京东红
                       fontStyle:'normal',//主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
                       fontWeight:"lighter",//可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
                       fontFamily:"san-serif",//主题文字字体，默认微软雅黑
                       fontSize:18//主题文字字体大小，默认为18px
                   },
                   x :'center'  
            },
            tooltip: {
                show: true
            },
            legend: {
                data:['订单量','出单量'],
                textStyle: {
                    color: 'rgb(250,250,250)'
                },
            	y : 'bottom'
            },
            xAxis : [
                {
                    type : 'category',
                    axisLabel : {  
                        textStyle: {
                            color: 'rgb(250,250,250)'
                        }
                    },
                    data : [
                            '2017-9-12',
                            '2017-9-13',
                            '2017-9-14',
                            '2017-9-15',
                            '2017-9-16',
                            '2017-9-17',
                            '2017-9-18'
                           ]
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {  
                        textStyle: {
                            color: 'rgb(250,250,250)'
                        }
                    }
                }
            ],
            series : [
                {
                    "name":"订单量",
                    "type":"bar",
                    "data":[
                            temp[0].state,
                            temp[1].state,
                            temp[2].state,
                            temp[3].state,
                            temp[4].state,
                            temp[5].state,
                            temp[6].state
                           ]
                },
                {
                    "name":"出单量",
                    "type":"bar",
                    "data":[
                            temp[6].state,
                            temp[5].state,
                            temp[4].state,
                            temp[3].state,
                            temp[2].state,
                            temp[1].state,
                            temp[0].state
                           ]
                }
            ]
        };

        //myChart.clear($("#main"));
        //$("#main").innerHTML="";
        // 为echarts对象加载数据
        myChart.setOption(option);
    }
    function drawYsfs() { 
    	//从后台获取数据
    	var temp;
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/piequery",
            data: {},
            async : false,
            success: function(data){
//              alert(data);
                temp = data;
            }
        });
        
    	// 基于准备好的dom，初始化echarts图表
        var myChart = echar.init(document.getElementById('main'));
        var option = {  
                title : {  
                    text: '运输方式统计分析',  
                    textStyle:{//标题内容的样式
                        color:'rgb(250,250,250)',//京东红
                        fontStyle:'normal',//主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
                        fontWeight:"lighter",//可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
                        fontFamily:"san-serif",//主题文字字体，默认微软雅黑
                        fontSize:18//主题文字字体大小，默认为18px
                    },
                    x :'center'  
                },  
                tooltip : {  
                    trigger: 'item',  
                    formatter: "{a} <br/>{b} : {c} ({d}%)"  
                },  
                legend: {  
                    x : 'center',  
                    y : 'bottom',
                    textStyle: {
                        color: 'rgb(250,250,250)'
                    },
                    data:['轮船','火车','汽车','飞机']  
                },  
                calculable : true,  
                series : [  
                    {  
                        name:'订单个数',  
                        type:'pie',  
                        radius : [30, 110],  
                        center : ['50%', '50%'],  
                        roseType : 'area',  
                        x: '50%',               // for funnel  
                        max: 40,                // for funnel  
                        sort : 'ascending',     // for funnel  
                        data:[  
                            {value:15, name:'轮船'},  
                            {value:52, name:'火车'},  
                            {value:86, name:'汽车'},  
                            {value:32, name:'飞机'}
                        ]  
                    }  
                ]  
            };  
        myChart.setOption(option);  
    }  
    function drawWd() {  
    	//从后台获取数据
    	var temp;
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/linequery",
            data: {},
            async : false,
            success: function(data){
//              alert(data);
                temp = data;
            }
        });
        
        var myChart = echar.init(document.getElementById('main'));  
        var option = {  
                title : {  
                    text: '各网点日进/出单量折线图 ',
                    textStyle:{//标题内容的样式
                        color:'rgb(250,250,250)',//京东红
                        fontStyle:'normal',//主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
                        fontWeight:"lighter",//可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
                        fontFamily:"san-serif",//主题文字字体，默认微软雅黑
                        fontSize:18//主题文字字体大小，默认为18px
                    },
                    x: 'center'  
                },tooltip : {  
                    trigger: 'axis'  
                },  
                legend: {  
                    data:['进单量','出单量'],
                    textStyle: {
                        color: 'rgb(250,250,250)'
                    },
                    y : 'bottom'  
                },  
                calculable : true,  
                xAxis : [  
                         {  
                             type : 'category', 
                             axisLabel : {  
                                 textStyle: {
                                     color: 'rgb(250,250,250)'
                                 }
                             }, 
                             boundaryGap : false,  
                             data : ['北京','上海','广州','深圳','杭州','南京','东京','台湾','廊坊','合肥','苏州']
                         }  
                     ],  
                 yAxis : [  
                          {  
                              type : 'value',  
                              axisLabel : {  
                                  formatter: '{value} 单',
                                  textStyle: {
                                      color: 'rgb(250,250,250)'
                                  }
                              },  
                              min:100,  
                              max:5000  
                          }  
                 ],  
                 series : [  
                            {  
                                name:"进单量",  
                                type:'line',  
                                smooth:true,  
                                data:[1289,807,3343,588,644,2450,1076,665,1258,2341,1398],  
                                itemStyle: {normal: {areaStyle: {type: 'default'}}},  
                                markPoint : {  
                                    data : [  
                                        {type : 'max', name: '最大值'},  
                                        {type : 'min', name: '最小值'}  
                                    ]  
                                }  
                            },  
                            {  
                                name:"出单量",  
                                type:'line',  
                                smooth:true,  
                                data:[490,586,930,667,323,847,207,1487,2341,1025,542],  
                                itemStyle: {normal: {areaStyle: {type: 'default'}}},  
                                markPoint : {  
                                    data : [  
                                        {type : 'max', name: '最大值'},  
                                        {type : 'min', name: '最小值'}  
                                    ]  
                                }  
                            },  
                 ]  
        };  
        myChart.setOption(option);  
    }  
</script>
</body>
</html>
