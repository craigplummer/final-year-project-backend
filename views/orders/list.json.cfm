<cfset dataToReturn = []>
<cfloop query="eventListing">
	<cfquery name="qGetEvent" datasource="ticketseller">
		SELECT * FROM events WHERE id='#orderListing.eventid#'
	</cfquery>
	<cfquery name="qGetVenue" datasource="ticketseller">
		SELECT name FROM venues WHERE id='#qGetEvent.venueid#'
	</cfquery>
	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = orderListing.id,
			"eventtitle" = qGetEvent.eventtitle,
			"venue" = #qGetVenue.name#,
			"eventdate" = qGetEvent.starttime
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>