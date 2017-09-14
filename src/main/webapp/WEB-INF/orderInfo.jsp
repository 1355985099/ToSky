<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/staticFile/css/style.css" type="text/css" media="all">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
			SAddress:{
				required:true
			},
			SName:{
				required:true,
				rangelength:[4,12]
			},
			Tel:{
				required:true,
				phone:true
			}
		},
		messages:{
			SAddress:{
				required:"请选择地址"
			},
			SName:{
				required:"请输入用户名",
				rangelength:$.validator.format("用户名长度为4-12个字符")
			},
			Tel:{
				required:"请输入手机号"
			}
		}
	});
	
 	//让当前表单调用validate方法，实现表单验证功能
	$("#cargo").validate({
		//debug:true, //调试模式
		//onkeyup:null, //当丢失焦点时才触发验证请求
		rule:{
			PWeight:{
				required:true
			},
			PType:{
				required:true,
			}
		},
		messages:{
			PWeight:{
				required:"请输入重量"
			},
			PType:{
				required:"请输入所寄物品的类型",
			}
		}
	});
	
	//让当前表单调用validate方法，实现表单验证功能
	$("#rec").validate({
		//debug:true, //调试模式
		//onkeyup:null, //当丢失焦点时才触发验证请求
		rule:{
			RAddress:{
				required:true
			},
			RName:{
				required:true,
				rangelength:[4,12]
			},
			Tel:{
				required:true,
				phone:true
			}
		},
		messages:{
			RAddress:{
				required:"请选择地址"
			},
			RName:{
				required:"请输入用户名",
				rangelength:$.validator.format("用户名长度为4-12个字符")
			},
			Tel:{
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
			<input type="text" name="SAddress" placeholder="发货地址" required="">
				<input type="text" name="SName" placeholder="寄件人姓名" required="">
				<input type="text" name="Tel" placeholder="手机号码" required="">
			</form>
	
			<div class="clear"></div>
		</div>
		<div class="container w3layouts agileits">
			<h2>收件人信息</h2>
			<form id="rec" action="#" method="post">
				<input type="text" name="RAddress" placeholder="收件地址" required="">
				<input type="text" name="RName" placeholder="收件人姓名" required="">
				<input type="text" name="Tel" placeholder="手机号码" required="">
			</form>
			
			<div class="clear"></div>
		</div>

		<div class="container w3layouts agileits">
			<h2>货物信息</h2>
			<form id="cargo" action="#" method="post">
				<input type="text" name="PWeight" placeholder="物品体积" required="">
				<input type="text" name="PType" placeholder="物品类型" required="">
				
				
			</form>
			<div class="send-button w3layouts agileits">
				
					<input type="button" onclick="$('#cargo').submit()" value="提交订单">
				
			</div>
			
			<div class="clear"></div>
		</div>

	</div>

	

</body>
</html>