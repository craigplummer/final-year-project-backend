<cfset dataToReturn = []>
<cfloop query="venueListing">

	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = venueListing.id,
			"name" = venueListing.name
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>