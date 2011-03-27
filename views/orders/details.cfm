<cfoutput>
	<h2>#eventdetails.eventtitle#</h2>

	<p>#eventdetails.eventdesc#</p>

	<p><strong>Venue:</strong></p>
	
	<p>#venuedetails.name#, #venuedetails.towncity#</p>
	<a href="/venues/details/?id=#venuedetails.id#" data-role="button">View Venue Details</a>
	<h3>Tickets</h3>

	<ul data-role="listview" data-inset="true">
		<li data-role="list-divider" >Select ticket type</li>
	<cfloop query="ticketdetails">
		<li><a href="/orders/tickets?ticketid=#ticketdetails.id#&userid=#userdetails.id#"><h3>#ticketdetails.ticketname#</h3></a>
		<p>#ticketdetails.ticketdesc#</p>
		<p>£#ticketdetails.price#</p>
		</li>
	</cfloop>
	</ul>


</cfoutput>