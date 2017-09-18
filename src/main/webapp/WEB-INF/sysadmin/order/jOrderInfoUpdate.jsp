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
					 <button type="button" class="btn btn-default btn-success" onclick="formSubmit('toview','_self');this.blur();">保存更新</button>
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
					寄件人姓名：<input type="text" name="sendName" value="${orderInfo.sendName}"><hr>
					寄件人电话：<input type="text" name="sendTel" value="${orderInfo.sendTel }"><hr>
					寄件人地址：<input type="text" name="" value="${orderInfo.sendAddress }"><hr>
                	<hr>
				</div>
				

                <div class="col-md-6 column" style="border: 1px solid gray;">
					<h3 class="muted">
						收件人信息
					</h3>
					<hr>
					收件人姓名：<input type="text" value="${orderInfo.receiveName }"><hr>
					收件人电话：<input type="text" value="${orderInfo.receiveTel }"><hr>
					收件人地址：<input type="text" value="${orderInfo.receiveAddress}"><hr>
					<hr>
				</div>
				<hr>
				<hr>	
				<div class="col-md-12 column" style="border: 1px solid gray;" text-align="center">
					<h3 class="muted">
						货品信息
					</h3>
					<hr>
					快递单号：<input type="text" value="${orderInfo.orderInfoId}"><hr>
					货品名称：<input type="text" value="${orderInfo.cargoName}"><hr>
					货品重量：<input type="text" value="${orderInfo.nweight}">kg<hr>
					运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：<input type="text" value="${orderInfo.price}">元<hr>
					<hr>
					备注信息：<br>
					<textarea style="height:130px;width:100%" name="remark" value="${orderInfo.order.remark }"></textarea>
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
