<cfset dataToReturn = []>
<cfloop query="eventListing">
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = eventListing.id
			"eventtitle" = eventListing.eventtitle
			"eventdate" = eventListing.startdate
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>