<cfoutput>
<!DOCTYPE html>
<html>
	<head>
	
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	
		<title>Tickeseller - Login</title>
	
		#stylesheetLinkTag("style")#
	
		<!-- HTML5 Shiv for IE Support -->
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	
		<!-- jQuery from Google CDN -->
		<script type="text/javascript" src="/javascripts/jquery.hyjack.select.min.js"></script>
	
		<!-- Typekit JS for custom fonts -->
		<script type="text/javascript" src="http://use.typekit.com/mpx6oim.js"></script>
		<script type="text/javascript">try{Typekit.load();}catch(e){}</script> 
	
	</head>
	
	<body id="login">
		<header id="login-screen"><h1>Ticketseller</h1></header>
		
		<div id="login_container">
			
			<section id="login-controls">
			 	#includeContent()#
			</section>
			
			<section id="register-controls">
				<h2>Not a member?</h2>
				<p id="signup">#linkTo(text="Sign up now!", controller="account", action="register")#</p>
			</section>
			
			<div class="clearfix"></div>
		</div>
			<footer>
			<p>Ticketseller &copy; 2011</p>
			</footer>
	</body>
</html>
</cfoutput>