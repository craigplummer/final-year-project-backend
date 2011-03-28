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
	
	<cfloop query="variables.geocode_query">
		<cfif #variables.geocode_query.address_type# EQ "Locality">
		<cfset locality = "#variables.geocode_query.address_long_name#">

		</cfif>
	</cfloop>
	
	
	
	<cfset restaurantListing = model("Restaurants").findAll(where="towncity='#locality#'")>
	<cfset provides("json")>
	<cfset renderWith(restaurantListing)>
		
	</cffunction>
	
	<cffunction name="details">
		<cfset restaurants = model("Restaurants").findOne(where="id='#params.id#'")>
		
		<cfset renderPage(layout="mobilelayout")>
		
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
