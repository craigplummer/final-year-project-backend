<cfset dataToReturn = []>
<cfloop query="regionListing">

	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = regionListing.id,
			"name" = regionListing.name
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>