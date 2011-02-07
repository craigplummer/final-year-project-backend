<cfcomponent extends="Controller">

	<cffunction name="new">
	
		<cfset var newTickets = [ model("ticket").new() ]>
		<cfset event = model("event").new(tickets=newTickets)>
		<cfset venues = model("venue").findAll()>

	</cffunction>
	
	<cffunction name="create">
	
		<cfset event = model("event").new(params.event)>
		<cfset event.save()>
		
		<cfif event.hasErrors()>
			<cfset renderPage(action="new")>
		<cfelse>
			<cfset flashInsert(success="Your event was added sucessfully")>
			<cfset redirectTo(controller="events", action="new")>
		</cfif>
	
	</cffunction>

</cfcomponent>