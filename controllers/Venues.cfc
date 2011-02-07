<cfcomponent extends="Controller">

	<cffunction name="new">
		
		<cfset location = model("venue").new()>
		
		
	</cffunction>
	
	<cffunction name="create">
	
		<cfset location = model("venue").new(params.location)>
		<cfset location.save()>
		
		<cfif location.hasErrors()>
			<cfset renderPage(action="new")>
		<cfelse>
			<cfset flashInsert(success="The venue was added sucessfully")>
			<cfset redirectTo(controller="venues", action="new")>
		</cfif>	
	
	</cffunction>

</cfcomponent>