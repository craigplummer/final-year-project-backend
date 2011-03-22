<cfcomponent extends="Controller">

	<cffunction name="init">
	</cffunction>

	<cffunction name="details">
		<cfset eventdetails = model("event").findOne(where="id='#params.eventid#'")>
		<cfset ticketdetails = model("ticket").findAll(where="eventid='#eventdetails.id#'")>

	  <!--- <cfdump var="#eventdetails#" abort>
		<cfdump var="#ticketdetails#"> --->

		<cfset renderPage(layout="orderlayout")>


	</cffunction>

	<cffunction name="tickets">
		<cfset order = model("order").new()>

		<cfset ticketdetails = model("ticket").findOne(where="id='#params.ticketid#'")>
		<cfset eventdetails = model("event").findOne(where="id='#ticketdetails.eventid#'")>

		<cfset renderPage(layout="orderlayout")>
	</cffunction>

	<cffunction name="create">

		<cfset order = model("order").new(params.order)>
		<cfset ticketdetails = model("ticket").findOne(where="id='#params.ticketdetails.id#'")>
		<cfset order.ticketid = params.ticketdetails.id>
		<cfset order.eventid = params.eventdetails.id>
		<cfset order.total = params.order.qty * ticketdetails.price>
		<cfset order.id = createuuid()>
		<cfset order.paymentstatus = 0>
		<cfset order.save()>
		
		

		<cfset redirectTo(controller="orders", action="payment", params="orderid=#order.id#")>
	</cffunction>

	<cffunction name="payment">


		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset event = model("event").findOne(where="id='#order.eventid#'")>
		<cfset ticket = model("ticket").findOne(where="id='#order.ticketid#'")>

		<cfset renderPage(layout="orderlayout")>


	</cffunction>

	<cffunction name="confirm">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		
		<cfset ticketText = "http://mobile.ticketseller.co.uk/ticket/123456" />  
    	<!--- initialize writer and create a new barcode matrix --->  
    	<cfset BarcodeFormat = application.javaloader.create("com.google.zxing.BarcodeFormat") />  
    	<cfset writer = application.javaloader.create("com.google.zxing.qrcode.QRCodeWriter").init() />  
    	<cfset bitMatrix = writer.encode( ticketText, BarcodeFormat.QR_CODE, 120, 120 )>  
    	<!--- render the matrix as a bufferedimage --->  
    	<cfset converter = application.javaloader.create("com.google.zxing.client.j2se.MatrixToImageWriter")>  
    	<cfset buff = converter.toBufferedImage( bitMatrix ) />  
    	<!--- convert it to a CF compatible image --->  
    	<cfset img = ImageNew( buff ) />  
  		<!--- display results --->  
        <cfimage action="read" name="barcode" source="#img#" format="png">
		<cfset ticketbarcode = model("order").updateOne(where="id='#params.orderid#'", barcode="#imageGetBlob(barcode)#")>
	</cffunction>

	<cffunction name="verify">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset ticket = model("ticket").findOne(where="id='#order.ticketid#'")>
		
		<cfset ordertotal = #order.qty# * #ticket.price#>

		<cfset return = verifyPaypalPayment(receiverEmail="sell_1299181492_biz@craigplummer.co.uk", price="#numberformat(ordertotal, '.99')#", currency="GBP", itemNumber="#order.ticketid#", custom="#params.orderid#")>

		<cfset result = model("order").updateOne(where="id='#params.orderid#'", paymentstatus=#return#)>
		
		<cfmail from="craig@craigplummer.co.uk" subject="PayPal" to="craigplummer@me.com">
			<cfoutput>
			<cfdump var="#return#" format="text">
			<cfdump var="#params#" format="text">
			#numberformat(ordertotal, '.99')#
			</cfoutput>
		</cfmail>

		


	</cffunction>

</cfcomponent>