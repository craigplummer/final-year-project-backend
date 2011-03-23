<cfcomponent extends="Controller" output="false">
	
	<!--- tags/index --->
	<cffunction name="index">
		<cfset tags = model("Tags").findAll()>
	</cffunction>
	
	<!--- tags/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset tags = model("Tags").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(tags)>
	        <cfset flashInsert(error="Tags #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- tags/new --->
	<cffunction name="new">
		<cfset categories = model("Categories").findAll()>
		<cfset tags = model("Tags").new()>
	</cffunction>
	
	<!--- tags/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset tags = model("Tags").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(tags)>
	        <cfset flashInsert(error="Tags #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- tags/create --->
	<cffunction name="create">
		<cfset categories = model("Categories").findAll()>
		<cfset tags = model("Tags").new(params.tags)>
		<cfset tags.id = createuuid()>
		
		<!--- Verify that the tags creates successfully --->
		<cfif tags.save()>
			<cfset flashInsert(success="The tags was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the tags.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- tags/update --->
	<cffunction name="update">
		<cfset tags = model("Tags").findByKey(params.key)>
		
		<!--- Verify that the tags updates successfully --->
		<cfif tags.update(params.tags)>
			<cfset flashInsert(success="The tags was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the tags.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- tags/delete/key --->
	<cffunction name="delete">
		<cfset tags = model("Tags").findByKey(params.key)>
		
		<!--- Verify that the tags deletes successfully --->
		<cfif tags.delete()>
			<cfset flashInsert(success="The tags was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the tags.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
