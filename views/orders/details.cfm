<cfoutput>
	<h1>Ticketseller</h1>
	<h2>#eventdetails.eventtitle#</h2>
	
	<p>#eventdetails.eventdesc#</p>
	
	<h3>Tickets</h3>

	<cfloop query="ticketdetails">
		<p>#ticketdetails.ticketname#</p>
		<p>#ticketdetails.ticketdesc#</p>
		<p>#ticketdetails.price#</p>
		<a href="/orders/tickets?ticketid=#ticketdetails.id#">Order</a>
	</cfloop>
	
	
</cfoutput>