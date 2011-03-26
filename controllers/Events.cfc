<cfcomponent extends="Controller">

	<cffunction name="init">
		 <cfset provides("html,json")>
	</cffunction>

	<cffunction name="new">
		<cfset var newTickets = [ model("ticket").new() ]>
		<cfset event = model("event").new(tickets=newTickets)>
		<cfset category = model("category").findAll()>
		<cfset venues = model("Venues").findAll()>
	</cffunction>

	<cffunction name="create">
		<cfset venues = model("Venues").findAll()>
		<cfset event = model("event").new(params.event)>
		<cfset event.id = createuuid()>
		<cfset event.personid = session.user.id>
		<cfset event.save()>


		<cfif event.hasErrors()>
			<cfdump var="#event.allerrors()#">
			<cfabort>
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