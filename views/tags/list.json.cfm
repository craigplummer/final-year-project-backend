<cfset dataToReturn = []>
<cfloop query="tags">

	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = tags.id,
			"name" = tags.name
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>