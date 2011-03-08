<cfcomponent extends="Model">
	
	<cffunction name="init">

	</cffunction>
	
	<cffunction name="ProcessXmlData" output="true" returntype="string" hint="Parses the XML response from google" access="remote">
		<cfargument name="XMLData" required="true">
		<cfset var myDOM = "">
		<cfset var type= "">
		<cfset var responseType = "">
		<cfset var logText = "">

        <cfif isBinary(XMLData)>
			<cfset myDOM = XmlParse(toString(XMLData))>
		<cfelse>
			<cfset myDOM = XmlParse(XMLData)>
		</cfif>

		<cfset type = structKeyList(myDOM)>

		<cfif #type# EQ "new-order-notification">
				<cfset ProcessNewOrderNotification(myDOM)>
		</cfif>

		<cfreturn myDOM>
	</cffunction>

	<cffunction name="ProcessNewOrderNotification" output="true" returntype="Any" hint="Process the new order notifications">
		<cfargument name="XMLData" type="string" required="yes">

		<cfset var responseType="new-order-notification">
		<cfset var OrderNumber = XMLData["new-order-notification"]["google-order-number"].xmltext>
		<cfset var OrderAmount = XMLData["new-order-notification"]["order-total"].xmltext >
		<cfset var CustID = "">
		<cfset var OrderID = XMLData["new-order-notification"]["shopping-cart"].items.item[0]["merchant-item-id"].xmltext>
		<cfset order = model("order").findOne(where="id='#orderID#'")>

		<!--- Add basic order information --->
	
		<cfset googleOrder.orderNumber = orderNumber>
		<cfset googleOrder.orderAmount = orderAmount>

		<cfset order.update(googletotal="#googleOrder.orderAmount#", googleid="#googleOrder.orderNumber#")>
	</cffunction>


</cfcomponent>