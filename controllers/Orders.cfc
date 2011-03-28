<cfcomponent extends="Controller">

	<cffunction name="init">
	</cffunction>

	<cffunction name="details">
		<cfset eventdetails = model("event").findOne(where="id='#params.eventid#'")>
		<cfset userdetails = model("person").findOne(where="email='#params.email#'")>
		<cfset ticketdetails = model("ticket").findAll(where="eventid='#eventdetails.id#'")>
		<cfset venuedetails = model("venues").findOne(where="id='#eventdetails.venueid#'")>

	  <!--- <cfdump var="#eventdetails#" abort>
		<cfdump var="#ticketdetails#"> --->

		<cfset renderPage(layout="mobilelayout")>


	</cffunction>

	<cffunction name="tickets">
		<cfset order = model("order").new()>

		<cfset ticketdetails = model("ticket").findOne(where="id='#params.ticketid#'")>
		<cfset userdetails = model("person").findOne(where="id='#params.userid#'")>
		<cfset eventdetails = model("event").findOne(where="id='#ticketdetails.eventid#'")>
		
		<cfset ticketprice.two = #ticketdetails.price# * 2>
		<cfset ticketprice.three = #ticketdetails.price# * 3>
		<cfset ticketprice.four = #ticketdetails.price# * 4>

		<cfset renderPage(layout="mobilelayout")>
	</cffunction>

	<cffunction name="create">

		<cfset order = model("order").new(params.order)>
		<cfset ticketdetails = model("ticket").findOne(where="id='#params.ticketdetails.id#'")>
		<cfset order.ticketid = params.ticketdetails.id>
		<cfset order.eventid = params.eventdetails.id>
		<cfset order.userid = params.userdetails.id>
		<cfset order.total = params.order.qty * ticketdetails.price>
		<cfset order.id = createuuid()>
		<cfset order.paymentstatus = 0>
		<cfset order.save()>
		
		

		<cfset redirectTo(controller="orders", action="payment", params="orderid=#order.id#")>
	</cffunction>
	
	<cffunction name="ticketdetail">
		<cfset order = model("order").findOne(where="id='#params.id#'")>
		<cfset event = model("event").findOne(where="id='#order.eventid#'")>
		<cfset venue = model("Venues").findOne(where="id='#event.venueid#'")>
		
		<cfset renderPage(layout="mobilelayout")>
		
	</cffunction>
	
	<cffunction name="list">
		<cfset user = model("person").findOne(where="email='#params.email#'")>
		<cfset orderListing = model("order").findAll(where="userid='#user.id#' AND paymentstatus=1")>
		<cfset provides("json")>
		<cfset renderWith(orderListing)>
	</cffunction>

	<cffunction name="payment">


		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset event = model("event").findOne(where="id='#order.eventid#'")>
		<cfset ticket = model("ticket").findOne(where="id='#order.ticketid#'")>

		<cfset renderPage(layout="mobilelayout")>


	</cffunction>

	<cffunction name="confirm">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		
		<cfset renderPage(layout="mobileconfirmlayout")>
		
		
	</cffunction>
	
	<cffunction name="ppconfirm">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset user = model("person").findOne(where="id='#order.userid#'")>
	
		<cfset renderPage(layout="orderlayout")>
	</cffunction>
	
	<cffunction name="twitter">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset user = model("person").findOne(where="id='#params.userid#'")>
		<cfset event = model("event").findOne(where="id='#order.eventid#'")>
		
		<cfset Twitter = createObject("java", "twitter4j.Twitter")>
		<cfset Twitter.setOAuthConsumer('q8RebEtK6UObawa7Ia4zQ','SrenfcKPuFwVporxcjIpZvFXQoWDSy6QUa3GOAhxo')>
		<cfset Twitter.setOAuthAccessToken('#user.taccesstoken#','#user.taccesssecret#')>
		<cfset Twitter.updateStatus("I just purchased tickets for #event.eventtitle# on Ticketseller. http://www.ticketseller.co.uk")>
 
 		<cfset renderPage(layout="mobilelayout")>
	</cffunction>

	<cffunction name="verify">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset ticket = model("ticket").findOne(where="id='#order.ticketid#'")>
		
		<cfset ordertotal = #order.qty# * #ticket.price#>

		<cfset return = verifyPaypalPayment(receiverEmail="sell_1299181492_biz@craigplummer.co.uk", price="#numberformat(ordertotal, '.99')#", currency="GBP", itemNumber="#order.ticketid#", custom="#params.orderid#")>

		<cfif #return# EQ 1>
			<!---First Generate a Ticket Number--->
			
			<cfset CharSet = "QWERTYUPASDFGHJKLZXCVBNM23456789" />
   			<cfset CurChar = "" />
  		    <cfset ticketNumber = "" />

   			<cfloop from="1" to="8" index="Cnt">
      			<cfset CurChar = Mid(CharSet, RandRange(1,Len(CharSet)), 1) />
      			<cfset ticketNumber = ticketNumber & CurChar />
   			</cfloop>
			
			
		
		<cfset ticketText = "http://mobile.ticketseller.co.uk/ticket/#ticketNumber#" />  
    	<!--- initialize writer and create a new barcode matrix --->  
    	<cfset BarcodeFormat = createObject("java", "com.google.zxing.BarcodeFormat") />  
    	<cfset writer = createObject("java", "com.google.zxing.qrcode.QRCodeWriter").init() />  
    	<cfset bitMatrix = writer.encode( ticketText, BarcodeFormat.QR_CODE, 120, 120 )>  
    	<!--- render the matrix as a bufferedimage --->  
    	<cfset converter = application.javaloader.create("com.google.zxing.client.j2se.MatrixToImageWriter")>  
    	<cfset buff = converter.toBufferedImage( bitMatrix ) />  
    	<!--- convert it to a CF compatible image --->  
    	<cfset img = ImageNew( buff ) />  
		<cfimage action = "write" destination = "/var/www/html/barcodes/#params.orderid#.png" source = "#img#">
		<cfimage source="/var/www/html/barcodes/#params.orderid#.png" name="barcodeLocation">
  		<!--- display results --->  
		<cfset ticketbarcode = model("order").updateOne(where="id='#params.orderid#'", barcode="#imageGetBlob(barcodeLocation)#", ticketnumber="#ticketNumber#", paymentstatus=#return#)>

				  </cfif>
		
		<cfmail from="craig@craigplummer.co.uk" subject="PayPal" to="fyproject@craigplummer.co.uk">
			<cfoutput>
			<cfdump var="#return#" format="text">
			<cfdump var="#params#" format="text">
			#numberformat(ordertotal, '.99')#
			</cfoutput>
		</cfmail>
		


	</cffunction>

</cfcomponent>