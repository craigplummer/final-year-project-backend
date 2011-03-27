<cfcomponent extends="Controller" output="false">
	
	<!--- regions/index --->
	<cffunction name="index">
		<cfset regions = model("Regions").findAll()>
	</cffunction>
	
	<!--- regions/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset regions = model("Regions").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(regions)>
	        <cfset flashInsert(error="Regions #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- regions/new --->
	<cffunction name="new">
		<cfset regions = model("Regions").new()>
	</cffunction>
	
	<!--- regions/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset regions = model("Regions").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(regions)>
	        <cfset flashInsert(error="Regions #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- regions/create --->
	<cffunction name="create">
		<cfset regions = model("Regions").new(params.regions)>
		<cfset regions.id = createuuid()>
		
		<!--- Verify that the regions creates successfully --->
		<cfif regions.save()>
			<cfset flashInsert(success="The regions was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the regions.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- regions/update --->
	<cffunction name="update">
		<cfset regions = model("Regions").findByKey(params.key)>
		
		<!--- Verify that the regions updates successfully --->
		<cfif regions.update(params.regions)>
			<cfset flashInsert(success="The regions was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the regions.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- regions/delete/key --->
	<cffunction name="delete">
		<cfset regions = model("Regions").findByKey(params.key)>
		
		<!--- Verify that the regions deletes successfully --->
		<cfif regions.delete()>
			<cfset flashInsert(success="The regions was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the regions.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
	<cffunction name="list">
		<cfset regionListing = model("Regions").findAll(order="name")>
		<cfset provides("json")>
		<cfset renderWith(regionListing)>
	</cffunction>
	
</cfcomponent>
