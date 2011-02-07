<cfoutput>
<div class="ticket">

	#textField(label="Ticket Name", objectName="event", association="tickets", position=arguments.current, property="ticketname")#
	#textField(label="Ticket Description", objectName="event", association="tickets", position=arguments.current, property="ticketdesc")#
	#textField(label="Ticket Price", objectName="event", association="tickets", position=arguments.current, property="price")#
	#textField(label="Qty Avaliable", objectName="event", association="tickets", position=arguments.current, property="qty")#
		
</div>
</cfoutput>
