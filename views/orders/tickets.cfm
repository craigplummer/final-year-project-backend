<cfoutput>

	<h2>#eventdetails.eventtitle#</h2>
	<p><strong>Ticket type:</strong>#ticketdetails.ticketname#</h3>
	<p>#ticketdetails.ticketdesc#</p>
	<p><strong>Price each:</strong> £#ticketdetails.price#</p>

	<p>Please select the quantity you wish to purchase. Maximum 4 per order.</p>
	#startFormTag(action="create")#
		
	<div data-role="fieldcontain">
	<label for="order[qty]" class="select" data-native-menu="true">Choose quantity:</label>
	<select name="order[qty]" id="select-choice-1">
		<option value="1">1 Ticket: £#ticketdetails.price#</option>
		<option value="2">2 Tickets: £#ticketprice.two#</option>
		<option value="3">3 Tickets: £#ticketprice.three#</option>
		<option value="4">4 Tickets: £#ticketprice.four#</option>
	</select>
</div>

	#hiddenField(objectName="eventdetails", property="id")#
	#hiddenField(objectName="ticketdetails", property="id")#
	#hiddenField(objectName="userdetails", property="id")#

	#submitTag(value="Next: Confirm Order >>")#

	#endFormTag()#

</cfoutput>