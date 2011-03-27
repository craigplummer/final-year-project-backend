<cfset dataToReturn = []>
<cfloop query="eventListing">
	<cfquery name="qGetVenue" datasource="ticketseller">
		SELECT name FROM venues WHERE id='#eventListing.venueid#'
	</cfquery>
	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = eventListing.id,
			"eventtitle" = eventListing.eventtitle,
			"venue" = #qGetVenue.name#,
			"eventdate" = eventListing.starttime
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>