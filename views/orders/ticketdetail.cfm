<cfoutput>
<h2>#event.eventtitle#</h2>
<p><strong>Venue: </strong> #venue.name#</p>
<p><strong>Start Time:</strong> #event.starttime#</p>

<p><strong>Admits: </strong> #order.qty# only</p>
<center>
<cfimage
action="writetobrowser"
source="#order.barcode#"
format="png"
/><br />
#order.ticketnumber#
</center>
<p><strong>Total Price: </strong>£#numberformat(order.total, '.99')#</p>
</cfoutput>
