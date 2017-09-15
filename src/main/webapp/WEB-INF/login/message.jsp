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
            <h1 style="font-size:103px;">欢迎来到通天快递</h1>
    <%--         <form id="commentForm"  action="${app}/user/reg" method="post">
				<div>
					<input id="username" type="text" name="userName" class="username" placeholder="用户名"  />
				</div>
                <div>
					<input id="password" type="password" name="password" class="password" placeholder="密码" />
                </div>
                <div>
					<input id="password2" type="password" name="password2" class="password2" placeholder="确认密码" />
                </div>
                 <div>
					<input id="tel" type="text" name="tel" class="username" placeholder="电话"  />
                </div>
                <div>
					<input id="email" type="text" name="email" class="username" placeholder="邮箱"  />
                </div>
                <button id="submit" type="submit">注 册</button>
            </form> --%>
            <div class="connect">
                <p id="er" style="font-size:50px;">${msg}</p> 
				<p id="er" style="margin-top:30px;font-size:50px;"><a href="http://mail.${email}">激活此账号!!</a></p>
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

		});
		</script>
    </body>

</html>

