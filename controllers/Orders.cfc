<cfcomponent extends="Controller">
	
	<cffunction name="init">
	</cffunction>

	<cffunction name="details">
		<cfset eventdetails = model("event").findOne(where="id=#params.eventid#")>
		<cfset ticketdetails = model("ticket").findAll(where="id=#eventdetails.id#")>
		
	<!--- <cfdump var="#eventdetails#">
		<cfdump var="#ticketdetails#"> --->
		
		<cfset renderPage(layout="orderlayout")>
		
		
	</cffunction>
	
	<cffunction name="create">
		<cfset order = model("order").new()>
		<cfset userid = #params.userid#>
		<cfset order.itemid = #params.itemid#>
		<cfset order.id = createuuid()>
		<cfset order.paymentstatus = 0>
		<cfset order.save()>
		
		<cfset redirectTo(controller="order", action="payment")>
	</cffunction>
	
	<cffunction name="payment">
		<cfset renderPage(layout="orderLayout")>
		
	</cffunction>
	
	<cffunction name="confirm">
	</cffunction>

</cfcomponent>