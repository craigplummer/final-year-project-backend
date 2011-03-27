<cfcomponent extends="Controller" output="false">
	
	<!--- venues/index --->
	<cffunction name="index">
		<cfset venues = model("Venues").findAll()>
	</cffunction>
	
	<!--- venues/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset venues = model("Venues").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(venues)>
	        <cfset flashInsert(error="Venues #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- venues/new --->
	<cffunction name="new">
		<cfset venues = model("Venues").new()>
		<cfset regions = model("Regions").findAll(order="name")>
	</cffunction>
	
	<!--- venues/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset venues = model("Venues").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(venues)>
	        <cfset flashInsert(error="Venues #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- venues/create --->
	<cffunction name="create">
		<cfset regions = model("Regions").findAll()>
		<cfset venues = model("Venues").new(params.venues)>
		<cfset venues.id = createuuid()>
		
		
		<!--- Verify that the venues creates successfully --->
		<cfif venues.save()>
			<cfset flashInsert(success="The venues was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the venues.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- venues/update --->
	<cffunction name="update">
		<cfset venues = model("Venues").findByKey(params.key)>
		
		<!--- Verify that the venues updates successfully --->
		<cfif venues.update(params.venues)>
			<cfset flashInsert(success="The venues was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the venues.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- venues/delete/key --->
	<cffunction name="delete">
		<cfset venues = model("Venues").findByKey(params.key)>
		
		<!--- Verify that the venues deletes successfully --->
		<cfif venues.delete()>
			<cfset flashInsert(success="The venues was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the venues.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
	<cffunction name="list">
		<cfset venueListing = model("Venues").findAll(where="regionid='#params.id#'")>
		<cfset provides("json")>
		<cfset renderWith(venueListing)>
	</cffunction>
	
</cfcomponent>
