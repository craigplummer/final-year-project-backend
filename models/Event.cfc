<cfcomponent extends="Model">

	<cffunction name="init">
	
	<cfset belongsTo("venue")>	
	<cfset hasMany("tickets")>
	
	<cfset nestedProperties(
	associations="tickets",
	allowDelete=true
	)>
		
	</cffunction>

</cfcomponent>