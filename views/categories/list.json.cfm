<cfset dataToReturn = []>

<cfloop query="categories">

	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = categories.id,
			"name" = categories.name

		}
	)>
</cfloop>

<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>