<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="base.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>Home</title>

<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Tradeaux a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->

<!-- Bootstrap-Core-CSS -->
<link href="${app}/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom-Theme-Styling -->
<link href="${app}/assets/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- Owl-Carousel-Styling -->
<link rel="stylesheet" href="${app}/assets/css/owl.carousel.css"
	type="text/css" media="all">

<!-- Web-Fonts -->
 <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Raleway:400,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'> 
<!-- //Web-Fonts -->

<script src="${app}/assets/js/modernizr.custom.js"></script>

</head>
<body>

	<!-- Header-Starts-Here -->
	<div class="header">

		<div class="container">
			<!-- Navigation -->
			<nav class="navbar navbar-inverse">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active cl-effect-7"><a href="#">Home</a></li>
						<li class="cl-effect-7 scroll"><a href="#services">服务</a></li>
						<li class="cl-effect-7 scroll"><a href="#offer">提供</a></li>
						<!-- <li class="cl-effect-7 scroll"><a href="#cover">登陆/注册</a></li> -->
						<li class="cl-effect-7 scroll"><a href="${app}/login">xxx</a></li>
						<li class="cl-effect-7 scroll"><a href="#about">About</a></li>
						<li class="cl-effect-7 scroll"><a href="#gallery">Gallery</a></li>
						<li class="cl-effect-7 scroll"><a href="#contact">联系我们</a></li>
						<c:if test="${sessionUser==null}">
							<span style="color: beige" ><a href="${app}/home/reg"  style="color: beige">注&nbsp;册</a></span>
							<span  style="color: beige">&nbsp;| &nbsp;</span>
							<span style="color: beige" ><a href="${app}/home/login"> 登&nbsp;陆</a></span>
						</c:if>
						<c:if test="${sessionUser!=null}" >
							<span style="color: beige" >欢迎&nbsp;${sessionUser.userName}&nbsp;来到通天国际物流</span>
						</c:if>
					</ul>
				</div>
				<!-- //Navbar-collapse -->
			</nav>
		</div>
		<!-- //Container -->

		<!-- Slider-Starts-Here -->
		<div class="slider">
			<ul class="rslides" id="slider">

				<li><img src="${app}/assets/images/1.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>
							欢迎来到  <span>通天物流</span>
						</h3>
						<p>自1874年以来，引领物流行业</p>
					</div></li>
				<li><img src="${app}/assets/images/2.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>通过海洋,服务于进出口</h3>
					</div></li>
				<li><img src="${app}/assets/images/3.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>通过天空,服务于国际</h3>
					</div></li>
				<li><img src="${app}/assets/images/4.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>货运 飞机</h3>
					</div></li>
				<li><img src="${app}/assets/images/5.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>铁路</h3>
					</div></li>
				<li><img src="${app}/assets/images/6.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>来自 中国</h3>
					</div></li>
				<li><img src="${app}/assets/images/7.jpg" alt="Tradeaux">
					<div class="caption">
						<h3>前往 世界<h3>
					</div></li>

			</ul>
		</div>
		<!-- //Slider-Ends-Here -->

	</div>
	<!-- //Header-Ends-Here -->

	<div class="content">

		<!-- Area-Starts-Here -->
		<div class="area" id="services">
			<h1>Services</h1>

			<div class="container">
				<div class="area1">
					<div class="col-md-4 col-sm-4 air slideanim">
						<div class="area-image">
							<img src="${app}/assets/images/area1.jpg" alt="Tradeaux">
						</div>
						<div class="area-info">
							<h4>GLOBAL AIR FREIGHT</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>

					<div class="col-md-4 col-sm-4 sea slideanim">
						<div class="area-image">
							<img src="${app}/assets/images/area2.jpg" alt="Tradeaux">
						</div>
						<div class="area-info">
							<h4>OFFSHORE HANDLING</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>

					<div class="col-md-4 col-sm-4 land slideanim">
						<div class="area-image">
							<img src="${app}/assets/images/area3.jpg" alt="Tradeaux">
						</div>
						<div class="area-info">
							<h4>GROUND SHIPPING</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!-- //Area-Ends-Here -->

		<!-- Offer-Starts-Here -->
		<div class="offer slideanim" id="offer">
			<div class="container">
				<h3>We Offer</h3>
				<p>Best in the class Logistic Services</p>
				<div class="offer-grid">
					<div class="col-md-6 col-sm-6 offer1 slideanim">
						<div class="offer-icon">
							<img src="${app}/assets/images/o1.png" alt="Tradeaux">
						</div>
						<div class="offer-info">
							<h4>Contract Shipping</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 col-sm-6 offer1 slideanim">
						<div class="offer-icon">
							<img src="${app}/assets/images/o2.png" alt="Tradeaux">
						</div>
						<div class="offer-info">
							<h4><a href="order">International Freight</a></h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 col-sm-6 offer1 slideanim">
						<div class="offer-icon">
							<img src="${app}/assets/images/o3.png" alt="Tradeaux">
						</div>
						<div class="offer-info">
							<h4>Storage & Warehouse</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 col-sm-6 offer1 slideanim">
						<div class="offer-icon">
							<img src="${app}/assets/images/o4.png" alt="Tradeaux">
						</div>
						<div class="offer-info">
							<h4>Consultancy Services</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam.</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!-- //Offer-Ends-Here -->

		<!-- Cover-Starts-Here -->
		<div class="cover" id="cover">
			<div class="container">
				<h3>Industries Covered</h3>
				<p>We ship everything!</p>

				<div class="cover-grid">
					<div class="col-md-4 cover-top-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#" data-title="Packed Goods"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">
									<img src="${app}/assets/images/c1.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 cover-top-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#" data-title="Chemicals"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">
									<img src="${app}/assets/images/c2.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 cover-top-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#"
									data-title="Cars & Automobiles"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">
									<img src="${app}/assets/images/c3.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>

					<div class="col-md-4 cover-bottom-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#" data-title="Oil & Gas"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit.">
									<img src="${app}/assets/images/c4.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 cover-bottom-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#" data-title="Retail Goods"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><img src="${app}/assets/images/c5.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 cover-bottom-grid slideanim">
						<div class="column-wrap clearfix">
							<div class="column">
								<a class="caption caption-3" href="#"
									data-title="Food & Beverages"
									data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><img src="${app}/assets/images/c6.jpg" alt="Tradeaux"></a>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
		<!-- //Cover-Ends-Here -->

		<!-- Details-Starts-Here -->
		<div class="details">
			<div class="container">
				<h2>About</h2>

				<!-- News-Starts-Here -->
				<div class="col-md-4 details-grid news slideanim">
					<h3>News</h3>
					<div class="news-top">
						<div class="news-icon">
							<img src="${app}/assets/images/n1.png" alt="Tradeaux">
						</div>
						<div class="news-info">
							<h4>Logistics - Company of the Year 2015</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="news-bottom">
						<div class="news-icon">
							<img src="${app}/assets/images/n2.png" alt="Tradeaux">
						</div>
						<div class="news-info">
							<h4>2015 Revenue Report Released</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- News-Ends-Here -->

				<!-- Reviews-Starts-Here -->
				<div class="col-md-4 details-grid reviews slideanim" id="about">
					<h3>Reviews</h3>
					<div class="about-section-left-grid">
						<section class="slider">
							<div class="flexslider">
								<ul class="slides">
									<li>
										<h4>"Excellent Service"</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam. Consectetur adipiscing
											elit tempor incididunt.</p>
										<div class="client">
											<p>Johann Schmidt</p>
											<p>Entrepreneur</p>
										</div>
									</li>
									<li>
										<h4>"Safe Delivery"</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam. Consectetur adipiscing
											elit tempor incididunt.</p>
										<div class="client">
											<p>Rachel Green</p>
											<p>Museum Curator</p>
										</div>
									</li>
									<li>
										<h4>"Fully Satisfied"</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam. Consectetur adipiscing
											elit tempor incididunt.</p>
										<div class="client">
											<p>Jeff Daniels</p>
											<p>Cars Dealer</p>
										</div>
									</li>
								</ul>
							</div>
						</section>
					</div>
				</div>
				<!-- Reviews-Ends-Here -->

				<!-- Location-Starts-Here -->
				<div class="col-md-4 details-grid locations slideanim">
					<h3>Locations</h3>
					<img src="${app}/assets/images/location.jpg" alt="Tradeaux">
				</div>
				<!-- //Location-Ends-Here -->

				<div class="clearfix"></div>
			</div>
		</div>
		<!-- Details-Ends-Here -->

		<!-- Gallery-Starts-Here -->
		<div class="gallery slideanim" id="gallery">
			<h3>Gallery</h3>
			<div class="gallery-cursual">

				<!-- Screen-Gallery-Carousel -->
				<div id="owl-demo" class="owl-carousel text-center">
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/area1.jpg"
							alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g1.jpg" alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g2.jpg" alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g3.jpg" alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g4.jpg" alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g5.jpg" alt="name">
					</div>
					<div class="item">
						<img class="lazyOwl" src="${app}/assets/images/g6.jpg" alt="name">
					</div>
				</div>
				<!-- //Screen-Gallery-Carousel -->
			</div>
		</div>
		<!-- //Gallery-Ends-Here -->

		<!-- Contact-Starts-Here -->
		<div class="contact slideanim" id="contact">
			<div class="container">
				<h3>Contact</h3>
				<form class="contact_form">

					<div class="message">
						<div class="col-md-6 col-sm-6 grid_6 c1">
							<input type="text" class="text" value="Name" placeholder="Name"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Name';}"> <input
								type="text" class="text" value="Email" placeholder="Email"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Email';}">
							<input type="text" class="text" value="Phone" placeholder="Phone"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Phone';}">
						</div>

						<div class="col-md-6 col-sm-6 grid_6 c1">
							<textarea placeholder="Message" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
						</div>
						<div class="clearfix"></div>
					</div>

					<input type="submit" class="more_btn" value="Send Message">
				</form>
			</div>
		</div>
		<!-- //Contact-Ends-Here -->

	</div>

	<!-- Footer-Starts-Here -->
	<div class="footer">

		<div class="container">

			<div class="footer-info slideanim">
				<div class="col-md-3 footer-info-grid links">
					<h4>QUICK LINKS</h4>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#cover">Coverage</a></li>
						<li><a href="#offer">Offers</a></li>
						<li><a href="#service">Services</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-info-grid services">
					<h4>INDUSTRIES</h4>
					<ul>
						<li>Logistics</li>
						<li>Aviation</li>
						<li>Transport</li>
						<li>Consultancy</li>
						<li>Shipping</li>
					</ul>
				</div>
				<div class="col-md-3 footer-info-grid address">
					<h4>ADDRESS</h4>
					<address>
						<ul>
							<li>Parma Via Modena</li>
							<li>40019 Sant'Agata Bolognese</li>
							<li>BO, Italy</li>
							<li>Telephone : +1 (734) 123-4567</li>
							<li>Email : <a class="mail" href="mailto:mail@example.com">info(at)tradeaux.com</a></li>
						</ul>
					</address>
				</div>
				<div class="col-md-3 footer-info-grid email">
					<h4>NEWSLETTER</h4>
					<p>Subscribe to our newsletter and we will inform you about
						newest projects and promotions.</p>

					<form class="newsletter">
						<input class="email" type="email" placeholder="Your email...">
						<input type="submit" class="submit" value="">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="social-icons">
				<ul class="social slideanim" id="follow">
					<li><a href="#" class="facebook"
						title="Go to Our Facebook Page"></a></li>
					<li><a href="#" class="twitter"
						title="Go to Our Twitter Account"></a></li>
					<li><a href="#" class="googleplus"
						title="Go to Our Google Plus Account"></a></li>
					<li><a href="#" class="instagram"
						title="Go to Our Instagram Account"></a></li>
					<li><a href="#" class="youtube"
						title="Go to Our Youtube Channel"></a></li>
				</ul>
			</div>

			<div class="copyright slideanim">
				<!-- 未知 -->
			</div>

		</div>



	</div>
	<!-- //Footer-Ends-Here -->

	<!-- Supportive-JavaScript -->
	<script type="text/javascript" src="${app}/assets/js/jquery.min.js"></script>
	<!-- Necessary-JS-File-For-Bootstrap -->
	<script type="text/javascript" src="${app}/assets/js/bootstrap.min.js"></script>

	<!-- SmoothScroll-JavaScript -->
	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar li a, .footer a[href='#myPage']").on('click',
							function(event) {

								// Prevent default anchor click behavior
								event.preventDefault();

								// Store hash
								var hash = this.hash;

								// Using jQuery's animate() method to add smooth page scroll
								// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
								$('html, body').animate({
									scrollTop : $(hash).offset().top
								}, 900, function() {

									// Add hash (#) to URL when done scrolling (default click behavior)
									window.location.hash = hash;
								});
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
				})
	</script>
	<!-- //SmoothScroll-JavaScript -->

	<!-- Slideanim-JavaScript -->
	<script type="text/javascript">
		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	</script>
	<!-- //Slideanim-JavaScript -->

	<!-- Owl-Carousel-JavaScript -->
	<script src="${app}/assets/js/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				items : 4,
				lazyLoad : true,
				autoPlay : true,
				pagination : false,
			});
		});
	</script>
	<!-- //Owl-Carousel-JavaScript -->

	<!-- Banner-Slider-JavaScript -->
	<script src="${app}/assets/js/responsiveslides.min.js"></script>
	<script>
		$(function() {
			$("#slider").responsiveSlides({
				auto : true,
				nav : true,
				speed : 500,
				namespace : "callbacks",
				pager : true,
			});
		});
	</script>
	<!-- //Banner-Slider-JavaScript -->

	<!-- Slide-To-Top JavaScript (No-Need-To-Change) -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //Slide-To-Top JavaScript -->

	<!-- Smooth-Scrolling-JavaScript -->
	<script type="text/javascript" src="${app}/assets/js/move-top.js"></script>
	<script type="text/javascript" src="${app}/assets/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //Smooth-Scrolling-JavaScript -->

	<!-- FlexSlider-JavaScript -->
	<script defer src="${app}/assets/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(function() {
			SyntaxHighlighter.all();
		});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!-- //FlexSlider-JavaScript -->
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
</body>
</html>