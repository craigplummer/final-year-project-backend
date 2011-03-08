<cfoutput>
	<h1>Ticketseller</h1>
	<h2>#eventdetails.eventtitle#</h2>
	<h3>#ticketdetails.ticketname#</h3>
	
	#startFormTag(action="create")#
	
	#textField(label="Qty", objectName="order", property="qty")#
	#hiddenField(objectName="eventdetails", property="id")#
	#hiddenField(objectName="ticketdetails", property="id")#	
	
	#submitTag(value="Next >>")#
		
	#endFormTag()#
	
</cfoutput>