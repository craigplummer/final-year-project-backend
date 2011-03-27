<cfoutput>
<cfif #order.paymentstatus# EQ 0>
	<p>We currently awating information from paypal about your payment. This should only take a minute</p>
	<p>This page will refresh automatically</p>
	
<cfelseif #order.paymentstatus# EQ 1>
	<h2>Thank You!</h2>
	<p>Thank you your order is now complete</p>
	<p>Please ensure you re-sync your tickets to your device</p>
	
	<cfif #user.taccesstoken# NEQ "">
		<a href="http://ts.craigplummer.co.uk/orders/twitter/?userid=#user.id#&orderid=#order.id#" class="button">Tweet this purchase</a>
	</cfif>
	
<cfelse>
	<p>Sorry there has been a problem with your payment. Please email example@example.com</p>

</cfif>

</cfoutput>