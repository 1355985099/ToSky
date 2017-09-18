<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>客户下单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/staticFile/css/style.css" type="text/css" media="all">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticFile/js/jquery-1.11.1.js"></script>			
<script type="text/javascript" src="${pageContext.request.contextPath}/staticFile/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticFile/js/additional-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/staticFile/js/jquery.validate.extend.js"></script>
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
			}
		}
	});
	
 	//让当前表单调用validate方法，实现表单验证功能
	$("#cargo").validate({
		//debug:true, //调试模式
		//onkeyup:null, //当丢失焦点时才触发验证请求
		
		rule:{
			nweight:{
				required:true
			},
			cargoName:{
				required:true
			},
			"orderInfoId.remark":{
				required:false
			}
			
		},
		messages:{
			nweight:{
				required:"请输入重量"
			},
			cargoName:{
				required:"请输入所寄物品的类型"
			},
			"orderInfoId.remark":{
				required:false
			}
		}
	});
	
	//让当前表单调用validate方法，实现表单验证功能
	$("#rec").validate({
		//debug:true, //调试模式
		//onkeyup:null, //当丢失焦点时才触发验证请求
		rule:{
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
			}
		},
		messages:{
			receiveAddress:{
				required:"请选择地址"
			},
			receiveName:{
				required:"请输入用户名",
				rangelength:$.validator.format("用户名长度为4-12个字符")
			},
			receiveTel:{
				required:"请输入手机号"
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
			<form id="send" action="#" method="post">
			<input type="text" name="sendAddress" placeholder="发货地址" required="">
				<input type="text" name="sendName" placeholder="寄件人姓名" required="">
				<input type="text" name="sendTel" placeholder="手机号码" required="">
			</form>
	
			<div class="clear"></div>
		</div>
		<div class="container w3layouts agileits">
			<h2>收件人信息</h2>
			<form id="rec" action="#" method="post">
				<input type="text" name="receiveAddress" placeholder="收件地址" required="">
				<input type="text" name="receiveName" placeholder="收件人姓名" required="">
				<input type="text" name="receiveTel" placeholder="手机号码" required="">
			</form>
			
			<div class="clear"></div>
		</div>

		<div class="container w3layouts agileits">
			<h2>货物信息</h2>
			<form id="cargo" action="#" method="post">
				<input type="text" name="nweight" placeholder="物品体积" required="">
				<input type="text" name="cargoName" placeholder="物品类型" required="">
				<input type="text" name="orderInfoId.remark" placeholder="备注信息" required="">
			</form>
			
			<div class="send-button w3layouts agileits">
					<input type="button" onclick="$('#send').submit(),$('#rec').submit(),$('#cargo').submit();" value="提交订单"  >
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</div>
</body>

</html>