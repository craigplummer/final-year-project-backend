<cfoutput>

<form action="https://sandbox.google.com/checkout/api/checkout/v2/checkoutForm/Merchant/218065289180922" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm" target="_top">
    <input name="item_name_1" type="hidden" value="#event.eventtitle#"/>
    <input name="item_description_1" type="hidden" value=" #ticket.ticketname#"/>
    <input name="item_quantity_1" type="hidden" value="#order.qty#"/>
    <input name="item_price_1" type="hidden" value="#ticket.price#"/>
	<input name="item_merchant_id_1" type="hidden" value="#order.id#"/>
    <input name="item_currency_1" type="hidden" value="GBP"/>
    <input name="_charset_" type="hidden" value="utf-8"/>
    <input alt="" src="https://sandbox.google.com/checkout/buttons/buy.gif?merchant_id=218065289180922&amp;w=117&amp;h=48&amp;style=trans&amp;variant=text&amp;loc=en_US" type="image"/>
</form>


</cfoutput>