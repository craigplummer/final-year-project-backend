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
	</cffunction>

	<cffunction name="verify">
		<cfset order = model("order").findOne(where="id='#params.orderid#'")>
		<cfset ticket = model("ticket").findOne(where="id='#order.ticketid#'")>
		
		<cfset ordertotal = #order.qty# * #ticket.price#>

		<cfset return = verifyPaypalPayment(receiverEmail="sell_1299181492_biz@craigplummer.co.uk", price="#ordertotal#", currency="GBP", itemNumber="#order.ticketid#", custom="#params.orderid#")>

		<cfset result = model("order").updateOne(where="id='#params.orderid#'", paymentstatus=#return#)>
		
		<cfmail from="craig@craigplummer.co.uk" subject="PayPal" to="craigplummer@me.com">
			<cfoutput>
			<cfdump var="#return#" format="text">
			<cfdump var="#params#" format="text">
			#ordertotal#
			</cfoutput>
		</cfmail>

		


	</cffunction>

</cfcomponent>