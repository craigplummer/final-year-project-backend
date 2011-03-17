<cfoutput>
	<!DOCTYPE html>

<html>
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
	
		<title>Ticketseller - Administration</title>
	
	
		<!-- HTML5 Shiv for IE Support -->
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		
		<!-- jQuery and jQuery UI from Google CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="/javascripts/jquery.hyjack.select.min.js"></script> 
		
		<!-- jQuery Mobile Alpha 2 -->
		<script src="/javascripts/jquerymobile/jquery.mobile-1.0a3.min.js" type="text/javascript"></script>
		<link href="/javascripts/jquerymobile/jquery.mobile-1.0a3.min.css" media="all" rel="stylesheet" type="text/css" />
		
		<!-- Typekit JS for custom fonts -->
		<script type="text/javascript" src="http://use.typekit.com/mpx6oim.js"></script>
		<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
		
		
	</head>
	<body>
		<div data-role="page" data-theme="b" id="jqm-home">
			<div data-role="header" data-theme="b"> 
				<h1>Ticketseller - Order</h1> 
		</div>
	<div data-role="content">
	
	<h2>#eventdetails.eventtitle#</h2>
	<h3>#ticketdetails.ticketname#</h3>
	
	#startFormTag(action="create")#
	
	<div data-role="fieldcontain">
	<label for="select-choice-1" class="select">Select ticket qty:</label>
	<select name="select-choice-1" id="select-choice-1">
		<option value="1">1 Ticket </option>
		<option value="2">2 Tickets</option>
		<option value="3">3 Tickets</option>
		<option value="4">4 Tickets</option>
	</select>
</div>
	
	#hiddenField(objectName="eventdetails", property="id")#
	#hiddenField(objectName="ticketdetails", property="id")#	
	
	#submitTag(value="Place Order")#
		
	#endFormTag()#
		</div>
		</div>
		</body>
		</html>
	
</cfoutput>