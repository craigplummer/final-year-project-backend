<cfset dataToReturn = []>
<cfloop query="eventListing">
	<cfset ArrayAppend(
		dataToReturn,
		{
			"eventtitle" = eventListing.eventtitle
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>