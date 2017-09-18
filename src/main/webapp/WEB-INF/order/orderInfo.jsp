<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>客户下单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/staticfile/css/orderstyle.css" type="text/css" media="all">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticfile/js/jquery-1.11.1.js"></script>			
<script type="text/javascript" src="${pageContext.request.contextPath}/staticfile/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticfile/js/additional-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticfile/js/jquery.validate.extend.js"></script>
<script type="text/javascript">
$(function(){
	//让当前表单调用validate方法，实现表单验证功能
	$("#send").validate({
		//debug:true, //调试模式
		//onkeyup:null, //当丢失焦点时才触发验证请求 
		rule:{
			sendAddress:{
				required:true
			},
			sendName:{
				required:true,
				rangelength:[4,12]
			},
			sendTel:{
				required:true,
				phone:true
			},
			receiveAddress:{
				required:true
			},
			receiveName:{
				required:true,
				rangelength:[4,12]
			},
			receiveTel:{
				required:true,
				phone:true
			},
			nweight:{
				required:true
			},
			cargoName:{
				required:true
			},
			"order.remark":{
				required:false
			}
		},
		messages:{
			sendAddress:{
				required:"请选择地址"
			},
			sendName:{
				required:"请输入用户名",
				rangelength:$.validator.format("用户名长度为4-12个字符")
			},
			sendTel:{
				required:"请输入手机号"
			},
			receiveAddress:{
				required:"请选择地址"
			},
			receiveName:{
				required:"请输入用户名",
				rangelength:$.validator.format("用户名长度为4-12个字符")
			},
			receiveTel:{
				required:"请输入手机号"
			},
			nweight:{
				required:"请输入重量"
			},
			cargoName:{
				required:"请输入所寄物品的类型"
			},
			"order.remark":{
				required:false
			}
		}
		
	});
});








</script>
</head>
<body>
<h1>寄收件人信息</h1>

	<div class="container w3layouts agileits">

		<div class="container w3layouts agileits">
			<h2>寄件人信息</h2>
			<form id="send" action="save" method="post">
			<input type="text" name="sendAddress" placeholder="发货地址" required="">
				<input type="text" name="sendName" placeholder="寄件人姓名" required="">
				<input type="text" name="sendTel" placeholder="手机号码" required="">
	
			<h2>收件人信息</h2>
				<input type="text" name="receiveAddress" placeholder="收件地址" required="">
				<input type="text" name="receiveName" placeholder="收件人姓名" required="">
				<input type="text" name="receiveTel" placeholder="手机号码" required="">
			<div class="clear"></div>
		
			<h2>货物信息</h2>
				<input type="text" name="nweight" placeholder="物品重量(KG)" required="">
				<input type="text" name="cargoName" placeholder="物品类型" required="">
				<input type="text" name="order.remark" placeholder="备注信息" required="">
		
			
			<div class="send-button w3layouts agileits">
			
					<input type="submit" value="提交订单"  >
			
			</div>
				</form>
				</div>
			<div class="clear"></div>
		</div>

	

	

</body>
</html>