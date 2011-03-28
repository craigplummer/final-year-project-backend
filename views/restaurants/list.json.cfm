
<cfset dataToReturn = []>
<cfloop query="restaurantListing">

	
	
	<cfset ArrayAppend(
		dataToReturn,
		{	
			"id" = restaurantListing.id,
			"eventtitle" = restaurantListing.name,
			"type" = restaurantListing.type,
			"location" = locality
		}
	)>
</cfloop>


<cfoutput>#SerializeJson(dataToReturn)#</cfoutput>