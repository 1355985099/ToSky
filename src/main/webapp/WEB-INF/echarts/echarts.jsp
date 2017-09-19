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
    <title>Title</title>
</head>
<body>
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
                   x :'center'  
            },
            tooltip: {
                show: true
            },
            legend: {
                data:['订单量','出单量'],
            	y : 'bottom'
            },
            xAxis : [
                {
                    type : 'category',
                    data : [
                            temp[0].userName,
                            temp[1].userName,
                            temp[2].userName,
                            temp[3].userName,
                            temp[4].userName,
                            temp[5].userName,
                            temp[6].userName
                           ]
                }
            ],
            yAxis : [
                {
                    type : 'value'
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
                    x :'center'  
                },  
                tooltip : {  
                    trigger: 'item',  
                    formatter: "{a} <br/>{b} : {c} ({d}%)"  
                },  
                legend: {  
                    x : 'center',  
                    y : 'bottom',  
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
                    x: 'center'  
                },tooltip : {  
                    trigger: 'axis'  
                },  
                legend: {  
                    data:['进单量','出单量'],  
                    y : 'bottom'  
                },  
                calculable : true,  
                xAxis : [  
                         {  
                             type : 'category',  
                             boundaryGap : false,  
                             data : ['北京','上海','广州','深圳','杭州','南京','东京','台湾','廊坊','合肥','苏州']  
                         }  
                     ],  
                     yAxis : [  
                              {  
                                  type : 'value',  
                                  axisLabel : {  
                                      formatter: '{value} 单'  
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
