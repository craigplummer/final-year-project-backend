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
	
	<cffunction name="edit">
		 <cfset event = model("event").findByKey(key=params.key, include="tickets")>
    	<cfset category = model("category").findAll()>
		<cfset venues = model("Venues").findAll()>
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(event)>
	        <cfset flashInsert(error="Regions #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
	</cffunction>
	
	<cffunction name="update">
	<cfset event = model("event").findByKey(params.key)>
	<cfset category = model("category").findAll()>
	<cfset venues = model("Venues").findAll()>
		
		<!--- Verify that the regions updates successfully --->
		<cfif event.update(params.event)>
			<cfset flashInsert(success="The regions was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the regions.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>

	<cffunction name="create">
		<cfset venues = model("Venues").findAll()>
		<cfset devices = model("devices").findAll()>
		<cfset event = model("event").new(params.event)>
		<cfset event.id = createuuid()>
		<cfset event.personid = session.user.id>
		<cfset event.save()>
		
		<cfloop query="devices">
	<cfset APNSService = createObject( "java", "com.notnoop.apns.APNS" ).newService()
  	.withCert("/var/www/html/lib/push.p12", "3nv3l0p3")
  	.withProductionDestination()
  	.build() />
	
	<cfset payload = createObject( "java", "com.notnoop.apns.APNS" ).newPayload()
				.badge(1)
				.alertBody("A new event has been added: #event.eventtitle#")
				.build()/>
				
	<cfset APNSService.push("#devices.devicetoken#", payload) />
			
		</cfloop>


		<cfif event.hasErrors()>
			<cfset renderPage(action="new")>
		<cfelse>
			<cfset flashInsert(success="Your event was added sucessfully")>
			<cfset redirectTo(controller="events", action="created")>
		</cfif>
		
		

	</cffunction>

	<cffunction name="featured">
		<cfset eventListing = model("event").findAll(where="featured=1")>
		<cfset provides("json")>
		<cfset renderWith(eventListing)>
	</cffunction>
	
	<cffunction name="categorylist">
		<cfset eventListing = model("event").findAll(where="categoryid='#params.id#'")>
		<cfset provides("json")>
		<cfset renderWith(eventListing)>
	</cffunction>
	
	<cffunction name="venuelist">
		<cfset eventListing = model("event").findAll(where="venueid='#params.id#'")>
		<cfset provides("json")>
		<cfset renderWith(eventListing)>
	</cffunction>
	
		<cffunction name="list">
		<cfset eventListing = model("event").findAll()>
		<cfset provides("json")>
		<cfset renderWith(eventListing)>
	</cffunction>

</cfcomponent>