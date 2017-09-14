<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../base.jsp"%>
<!DOCTYPE html>
<html>



<!-- Head -->
<head>

<title>注册and登录</title>

<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->

<!-- Style.CSS --> 
<link rel="stylesheet" href="${app}/assets/login/css/style.css" type="text/css" media="all" />


<!-- Horizontal-Tabs-JavaScript -->
<script src="${app}/assets/login/js/jquery-1.11.1.min.js"></script>
<script src="${app}/assets/login/js/easyResponsiveTabs.js" type="text/javascript"></script>

<!-- 引入Jquer.validate.js -->
<%-- <script src="${app}/assets/validate/jquery.js"></script> --%>
<%-- <script src="${app}/assets/validate/jquery.validate.js"></script> --%>

</head>
<!-- Head -->



<!-- Body -->
<body>

	<!-- Heading -->
	<h1>欢 迎 & 光 临</h1>
	<!-- //Headng -->


	<!-- Container -->
	<div class="container">

		<div class="tabs">

			<div class="sap_tabs">

				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">

					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><h2><span>登 陆</span></h2></li>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>注 册</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span>重置 密码</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-4" role="tab"><span>关于 我们</span></li>
						<div class="clear"> </div>
					</ul>

					<div class="resp-tabs-container">
						
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
							<!-- Form -->
							<form action="${app}/login" method="post">
								<input type="text" Name="userName" placeholder="用户名"   required="" >
								<input type="password" Name="password" placeholder="密码" minlength="8" required="">
								<ul>
									<li>
										<input type="checkbox" id="brand1" value="">
										<label for="brand1"><span></span>记住用户名</label>
									</li>
								</ul>
								<input type="submit" value="LOGIN">
							</form>
							<!-- //Form -->
						</div>

						<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-2">
							<div class="register">
								<form action="#" method="post">
									<input type="text" Name="First Name" placeholder="用户名" required="">
									<!-- <input type="text" Name="Last Name" placeholder="Last Name" required=""> -->
									<input type="email"  Name="email" placeholder="邮箱" required="" class="required email">
									<input id="password" type="password" Name="Password" placeholder="密码"  minlength="8" required="">
									<input id="confirm_password" type="password" Name="Password" class="lessgap" placeholder="确认 密码"  minlength="8" required="" 
									>
									<input type="text" Name="Phone Number" placeholder="电话 号码" required="">
									<div class="send-button">
										<input type="submit" value="注册">
									</div>
								</form>
							</div>
						</div>

						<div class="tab-3 resp-tab-content" aria-labelledby="tab_item-3">
							<div class="reset">
								<form action="#" method="post">
									<input type="text" Name="Email" placeholder="Email" required="">
									<p>(Or)</p>
									<input type="text" Name="Phone Number" placeholder="Phone Number" required="">
									<input type="submit" value="RESET MY PASSWORD">
								</form>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- //Container -->



	<!-- Footer -->
	<div class="footer">

		<!-- Copyright -->
		<div class="copyright">
			<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
		</div>
		<!-- //Copyright -->

	</div>
	<!-- //Footer -->



</body>
<!-- //Body -->



</html>