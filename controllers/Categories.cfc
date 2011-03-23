<cfcomponent extends="Controller" output="false">
	
	<!--- categories/index --->
	<cffunction name="index">
		<cfset categories = model("Categories").findAll()>
	</cffunction>
	
	<!--- categories/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset categories = model("Categories").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(categories)>
	        <cfset flashInsert(error="Categories #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- categories/new --->
	<cffunction name="new">
		<cfset categories = model("Categories").new()>
	</cffunction>
	
	<!--- categories/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset categories = model("Categories").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(categories)>
	        <cfset flashInsert(error="Categories #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- categories/create --->
	<cffunction name="create">
		<cfset categories = model("Categories").new(params.categories)>
		<cfset categories.id = createuuid()>
		
		<!--- Verify that the categories creates successfully --->
		<cfif categories.save()>
			<cfset flashInsert(success="The categories was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the categories.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- categories/update --->
	<cffunction name="update">
		<cfset categories = model("Categories").findByKey(params.key)>
		
		<!--- Verify that the categories updates successfully --->
		<cfif categories.update(params.categories)>
			<cfset flashInsert(success="The categories was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the categories.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- categories/delete/key --->
	<cffunction name="delete">
		<cfset categories = model("Categories").findByKey(params.key)>
		
		<!--- Verify that the categories deletes successfully --->
		<cfif categories.delete()>
			<cfset flashInsert(success="The categories was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the categories.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
