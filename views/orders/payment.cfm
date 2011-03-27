<cfoutput>
	<h2>#event.eventtitle#</h2>
	<p><strong>Ticket type: </strong>#ticket.ticketname#</p>
	<p><strong>Price: </strong>£#ticket.price#</p>
	<p><strong>Qty: </strong>#order.qty#</p>
	<p><strong>Order Total: </strong>£#numberformat(order.total, '.99')#</p>
	
	<p>To complete your order please click the Pay Now button below. You will be taken to PayPal to make your payment</p>

#showPaypalButton(
type="_xclick",
business="sell_1299181492_biz@craigplummer.co.uk",
amount="#ticket.price#",
itemName="#event.eventtitle# - #ticket.ticketname#",
itemNumber="#order.ticketid#",
quantity="#order.qty#",
custom="#params.orderid#",
return="http://ts.craigplummer.co.uk/orders/confirm/?orderid=#params.orderid#",
notifyUrl="http://ts.craigplummer.co.uk/orders/verify/?orderid=#params.orderid#",
currency="GBP",
datarole="none")#

</cfoutput>