<cfoutput>

	
	<li class="tname">#textField(label="Ticket Name", objectName="event", association="tickets", position=arguments.current, property="ticketname")#</li>
	<li class="tdesc">#textField(label="Ticket Description", objectName="event", association="tickets", position=arguments.current, property="ticketdesc")#</li>
	<li class="tprice">#textField(label="Price", objectName="event", association="tickets", position=arguments.current, property="price")#</li>
	<li class="tqty">#textField(label="Qty", objectName="event", association="tickets", position=arguments.current, property="qty")#</li>
	<li class="tremove"></li>

</cfoutput>
