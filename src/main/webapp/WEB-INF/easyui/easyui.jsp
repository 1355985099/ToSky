<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>  
  
<html>  
<head>  
    <meta name="viewport" content="width=device-width" />  
    <title>管理主页</title>  
    <link href="../../staticfile/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css"/>  
    <link href="../../staticfile/easyui/themes/icon.css" rel="stylesheet" type="text/css" />  
    @*添加的引用*@  
    <script src="../../staticfile/easyui/jquery-1.8.0.min.js" type ="text/javascript"></script>  
    <script src="../../staticfile/easyui/jquery.easyui.min.js" type ="text/javascript"></script>  
    <script src="../../staticfile/easyui/locale/easyui-lang-zh_CN.js" type ="text/javascript"></script>  
  
      
</head>  
  <body class="easyui-layout">  
     @*easyui的精华*@  
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>  
    <div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">west content</div>  
    <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>  
    <div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>  
    <div data-options="region:'center',title:'Center'"></div>
  </body>  
  
</html>  