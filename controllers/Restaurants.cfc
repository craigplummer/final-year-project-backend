<cfcomponent extends="Controller" output="false">
	
	<!--- restaurants/index --->
	<cffunction name="index">
		<cfset restaurants = model("Restaurants").findAll()>
	</cffunction>
	
	<!--- restaurants/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset restaurants = model("Restaurants").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(restaurants)>
	        <cfset flashInsert(error="Restaurants #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- restaurants/new --->
	<cffunction name="new">
		<cfset restaurants = model("Restaurants").new()>
	</cffunction>
	
	<!--- restaurants/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset restaurants = model("Restaurants").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(restaurants)>
	        <cfset flashInsert(error="Restaurants #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<cffunction name="list">
		
	<cfinvoke component="mycfc.googlegeocoder3" method="googlegeocoder3" returnvariable="variables.geocode_query">	  
	  <cfinvokeargument name="latlng" value="#params.latitude#,#params.longitude#">
	  <cfinvokeargument name="ShowDetails" value="true">
	</cfinvoke>
	
	<cfdump var="#variables.geocode_query#" abort>
		
	</cffunction>
	
	<!--- restaurants/create --->
	<cffunction name="create">
		<cfset restaurants = model("Restaurants").new(params.restaurants)>
		<cfset restaurants.id = createuuid()>
		
		<!--- Verify that the restaurants creates successfully --->
		<cfif restaurants.save()>
			<cfset flashInsert(success="The restaurants was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the restaurants.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- restaurants/update --->
	<cffunction name="update">
		<cfset restaurants = model("Restaurants").findByKey(params.key)>
		
		<!--- Verify that the restaurants updates successfully --->
		<cfif restaurants.update(params.restaurants)>
			<cfset flashInsert(success="The restaurants was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the restaurants.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- restaurants/delete/key --->
	<cffunction name="delete">
		<cfset restaurants = model("Restaurants").findByKey(params.key)>
		
		<!--- Verify that the restaurants deletes successfully --->
		<cfif restaurants.delete()>
			<cfset flashInsert(success="The restaurants was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the restaurants.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
