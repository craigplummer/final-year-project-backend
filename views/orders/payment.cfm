<cfoutput>

#showPaypalButton(type="_xclick",
business="sell_1299181492_biz@craigplummer.co.uk",
amount="#ticket.price#",
itemName="#event.eventtitle# - #ticket.ticketname#",
itemNumber="#order.ticketid#",
quantity="#order.qty#",
custom="#params.orderid#",
return="http://ts.craigplummer.co.uk/order/confirm/?orderid=#params.orderid#",
notifyUrl="http://ts.craigplummer.co.uk/order/verify/?orderid=#params.orderid#",
currency="GBP")#

</cfoutput>