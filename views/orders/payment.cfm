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
<form action="https://sandbox.google.com/checkout/api/checkout/v2/checkoutForm/Merchant/218065289180922" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm" target="_top">
    <input name="item_name_1" type="hidden" value="#event.eventtitle#"/>
    <input name="item_description_1" type="hidden" value=" #ticket.ticketname#"/>
    <input name="item_quantity_1" type="hidden" value="#order.qty#"/>
    <input name="item_price_1" type="hidden" value="#ticket.price#"/>
	<input name="item_merchant_id_1" type="hidden" value="#order.id#"/>
    <input name="item_currency_1" type="hidden" value="GBP"/>
    <input name="_charset_" type="hidden" value="utf-8"/>
    <input alt="" src="https://sandbox.google.com/checkout/buttons/buy.gif?merchant_id=218065289180922&amp;w=117&amp;h=48&amp;style=trans&amp;variant=text&amp;loc=en_US" type="image"/>
</form>
</div>
</div>
</body>
</html>


</cfoutput>