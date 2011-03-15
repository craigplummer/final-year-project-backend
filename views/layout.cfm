<!--- Place HTML here that should be used as the default layout of your application --->
<cfoutput>
<!DOCTYPE html>

<html>
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
	
		<title>Ticketseller - Administration</title>
	
		#stylesheetLinkTag("style")#
		
	
		<!-- HTML5 Shiv for IE Support -->
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		
		<!-- jQuery and jQuery UI from Google CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
		<script type="text/javascript" src="/javascripts/jquery.hyjack.select.min.js"></script> 
		
		<!-- Typekit JS for custom fonts -->
		<script type="text/javascript" src="http://use.typekit.com/mpx6oim.js"></script>
		<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
		
		
	</head>
	
	<body id="main">
			
				<header>
					<div id="header-inner">
						<h1>Ticket<span class="seller">seller</span></h1>
						<nav id="main-navigation">
							<ul>
								<li>#linkTo(text="Dashboard", controller="account", action="dashboard")#</li>
								<li>#linkTo(text="My Events", controller="events", action="home")#</li>
								<li id="add-event">#linkTo(text="Add New Event", controller="events", action="new")#</li>
								<li id="logged-in">#session.user.firstname# #session.user.surname#</li>
							</ul>
						</nav>
					</div>
				</header>
				
			</div>
			
			<div id="main-container">
				#includeContent()#
			</div>
			
		
		
		
			<footer>
				<p>Ticketseller &copy; 2011</p>
			</footer>
		</div>
	</body>
<script type="text/javascript">
    $('##event-venueid').hyjack_select({          /* Defaults */
        ddImage: '/images/arrow_down.png',      // arrow_down.png
        ddCancel: '/images/cancel.png',    // cancel.png
        ddImageClass: 'class_of_arrow',     // hjsel_ddImage
        ddCancelClass: 'class_of_cancel',   // hjsel_ddCancel
        emptyMessage: '<a href=\'/add/venue.cfm\'>Add New Venue</a>',   // No Items to Display
        filter: 'like',         // 'like', 'first', 'words'
        restrictSearch: false          // false
    });
</script>
</html>

</cfoutput>