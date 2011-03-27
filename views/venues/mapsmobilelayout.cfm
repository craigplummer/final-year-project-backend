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

		<!-- jQuery Mobile Alpha 3 -->
		<script src="/javascripts/jquerymobile/jquery.mobile-1.0a3.min.js" type="text/javascript"></script>
		<link href="/javascripts/jquerymobile/jquery.mobile-1.0a3.min.css" media="all" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script type="text/javascript">
 		 function onLoad() {
    		var latlng = new google.maps.LatLng(#venues.latitude#, #venues.longitude#);
    		var myOptions = {
      		zoom: 17,
      		center: latlng,
     		mapTypeId: google.maps.MapTypeId.ROADMAP
			
    	};

		var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

		var marker = new google.maps.Marker({
	      position: latlng, 
	      map: map, 
	      title:"#venues.name#"
	  });
   
  }

</script>
	</head>


	<body onLoad="onLoad();">
		
	<div data-role="page" data-theme="b" id="jqm-home">
			<div data-role="header" data-theme="b"><a href="#" data-rel="back" data-icon="arrow-l">Back</a>
				<h1>Ticketseller</h1> 
		</div>
	<div data-role="content">
		#includeContent()#
	</div>
	
	
	</body>
	</html>
</cfoutput>