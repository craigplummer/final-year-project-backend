<cfcomponent extends="Model">

	<cffunction name="init">
	
	<!--- Associations --->
	<cfset belongsTo("person")>
	<cfset hasOne("venue")>	
	<cfset hasMany("tickets")>
	
	<cfset nestedProperties(
	associations="tickets",
	allowDelete=true
	)>
		
	</cffunction>

</cfcomponent>