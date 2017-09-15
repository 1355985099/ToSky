<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../base.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>通天 物流</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${app}/assets/login/css/reset.css">
        <link rel="stylesheet" href="${app}/assets/login/css/supersized.css">
        <link rel="stylesheet" href="${app}/assets/login/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <style type="text/css">
        	.error{
				    display: inline-grid;
        	}
        </style>

    </head>

    <body oncontextmenu="return false">

        <div class="page-container">
            <h1>注册
            </h1>
             <h5 style="padding-top: 20px" >${msg}</h5>
            <form id="commentForm"  action="${app}/login/reg" method="post">
				<div>
					<input id="username" type="text" name="userName" class="username" placeholder="用户名" value="${user.userName}"  />
				</div>
                <div>
					<input id="password" type="password" name="password" class="password" placeholder="密码" value="${user.password}"/>
                </div>
                <div>
					<input id="password2" type="password" name="password2" class="password2" placeholder="确认密码"  value="${user.password2}" />
                </div>
                 <div>
					<input id="tel" type="text" name="tel" class="username" placeholder="电话" value="${user.tel}" />
                </div>
                <div>
					<input id="email" type="text" name="email" class="username" placeholder="邮箱" value="${user.email}" />
					<input id="emailr" type="hidden" value="" />
                </div>
                <button id="submit" type="submit">注 册</button>
            </form>
            <div class="connect">
                <p id="er">If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
				<p style="margin-top:20px;">如果只是遇见，不能停留，不如不遇见。</p>
            </div>
        </div>
<!-- 		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div> -->

        <!-- Javascript -->
 		<script src="${app}/assets/validate/jquery-1.11.1.js"></script>
	
		<script src="${app}/assets/validate/jquery.validate.js"></script>
        <script src="${app}/assets/login/js/supersized.3.2.7.min.js"></script>
		<script>
		$(".btn").click(function(){
			is_hide();
		})
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		} 
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
		jQuery(function($){

		    $.supersized({

		        // Functionality
		        slide_interval     : 6000,    // Length between transitions
		        transition         : 1,    // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		        transition_speed   : 3000,    // Speed of transition
		        performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)

		        // Size & Position
		        min_width          : 0,    // Min width allowed (in pixels)
		        min_height         : 0,    // Min height allowed (in pixels)
		        vertical_center    : 1,    // Vertically center background
		        horizontal_center  : 1,    // Horizontally center background
		        fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
		        fit_portrait       : 1,    // Portrait images will not exceed browser height
		        fit_landscape      : 0,    // Landscape images will not exceed browser width

		        // Components
		        slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank')
		        slides             : [    // Slideshow Images
		                                 {image : '${app}/assets/login/img/1.jpg'},
		                                 {image : '${app}/assets/login/img/2.jpg'},
		                                 {image : '${app}/assets/login/img/3.jpg'}
		                             ]

		    });
			$("#commentForm").validate({
				onfocusout: function(element) { $(element).valid(); }, 
				rules: {
					userName: {
						required: true,
						minlength: 2
					},
					password: {
						required: true,
						minlength: 8
					},
					password2: {
						required: true,
						minlength: 8,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true,
						isEmailRepeat: true
					},
					tel: {
						required: true,
						isMobile: true
					}
				},
				messages: {
					userName: {
						required: "用户名不能为空",
						minlength: "用户名不能少于2个字符"
					},
					password: {
						required: "密码不能为空",
						minlength: "密码不能少于8个字符"
					},
					password2: {
						required: "确认密码不能为空",
						minlength: "密码不能少于8个字符",
						equalTo: "与密码不相等"
					},
					tel: {
						required: "电话不能为空",
					},
					email: {
						required: "不能为空",
						email: "邮箱格式有误"
					}
				}
			});
			/*电话校验*/
			jQuery.validator.addMethod("isMobile", function(value, element) {
				var length = value.length;
				var mobile = /^1[3|5][0-9]\d{4,8}$/;
				return this.optional(element) || (length == 11 && mobile.test(value));
				}, "请正确填写您的手机号码");
			/*邮箱校验*/
			jQuery.validator.addMethod("isEmailRepeat", function(value, element) {
					var re
					$.post("${app}/login/isEmailRepeat",{email:value},function(result){
							re=result;
				  });
					if(re=="true"){
						return true;   
			    	}
			    	return false;
				}, "您输入的邮箱已被注册");
		});
		</script>
    </body>

</html>

