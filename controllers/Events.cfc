<cfcomponent extends="Controller">

	<cffunction name="init">
		 <cfset provides("html,json")>
	</cffunction>

	<cffunction name="new">
		<cfset var newTickets = [ model("ticket").new() ]>
		<cfset event = model("event").new(tickets=newTickets)>
		
		<cfset venues = model("venues").findAll()>

	</cffunction>
	
	<cffunction name="create">
		<cfset event = model("event").new(params.event)>
		<cfset event.id = createuuid()>
		<cfset event.personid = session.user.id>
		<cfset ticket.id = createuuid()>
		<cfset event.save()>
		
		<cfif event.hasErrors()>
			<cfset renderPage(action="new")>
		<cfelse>
			<cfset flashInsert(success="Your event was added sucessfully")>
			<cfset redirectTo(controller="events", action="new")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="featured">
		<cfset eventListing = model("event").findAll(where="featured=1")>
		<cfset renderWith(eventListing)>
	</cffunction>

</cfcomponent>