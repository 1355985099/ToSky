<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8"> 
	<title>订单新增</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script language="javascript">
		function formSubmit (url,sTarget){
		    document.forms[0].target = sTarget   //表示新跳转的页面在当前窗口打开
		    document.forms[0].action = url;      //发起请求 delete
		    document.forms[0].submit();
		    return true;
		};
		$(function(){
			$("#orderInfoId").blur(function(){
				var orderInfoId = $("#orderInfoId").val();
				
				$.ajax({
					url:"${app}/checkOrderInfoId",
					data:{"orderInfoId":orderInfoId},
					type:"POST",
					success:function(data){
						if(data=='0'){
							$("#msg").html("订单号已存在，不可用");
							$("#msg").css("color","red");
						}
						else{
							$("#msg").html("订单号不存在，可用");
	                        $("#msg").css("color","green");
						}
					}
					
				})
			})
		});
	</script>
</head>
<body>
<hr>
<hr>
<form name="icform" method="post">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-success" onclick="formSubmit('tosave','_self');this.blur();">保存更新</button>
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default btn-warning" onclick="window.history.go(-1)">返回</button>
				</div>
				<div class="col-md-1 column">
				</div>
				<div class="col-md-1 column">
				</div>
				<div class="col-md-8 column">
				</div>
			</div>
			<hr>
			<hr>
			<div class="row clearfix">
				<div class="col-md-6 column" style="border: 1px solid gray;">
					<h3 class="muted">
						寄件人信息
					</h3>
					<hr>
					寄件人姓名：<input type="text" name="sendName"><hr>
					寄件人电话：<input type="text" name="sendTel" ><hr>
					寄件人地址：<input type="text" name="sendAddress" ><hr>
                	<hr>
				</div>
				

                <div class="col-md-6 column" style="border: 1px solid gray;">
					<h3 class="muted">
						收件人信息
					</h3>
					<hr>
					收件人姓名：<input type="text" name="receiveName"><hr>
					收件人电话：<input type="text" name="receiveTel"><hr>
					收件人地址：<input type="text" name="receiveAddress"><hr>
					<hr>
				</div>
				<hr>
				<hr>	
				<div class="col-md-12 column" style="border: 1px solid gray;" text-align="center">
					<h3 class="muted">
						货品信息
					</h3>
					<hr>
					快递单号：<input type="text" name="orderInfoId" id="orderInfoId"><span id="msg"></span><hr>
					货品名称：<input type="text" name="cargoName"><hr>
					货品重量：<input type="text" name="nweight">kg<hr>
					运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：<input type="text" name="price">元<hr>
					<hr>
					备注信息：<br>
					<textarea style="height:130px;width:100%" name="order.remark"></textarea>
				</div>
			</div>
				
			
		</div>
		<div class="col-md-1 column">
		</div>
		<hr>
		<hr>
		<hr>
        <hr>
		<hr>	
	</div>
</div>
</form>
<hr>
		<hr>
		<hr>
        <hr>
		<hr>
</body>
</html>
