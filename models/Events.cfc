<cfcomponent extends="Model" output="false">

	<cffunction name="init">
		
		<cfset validatesPresenceOf("eventtitle, eventdesc, starttime, endtime, categoryid, venueid")>
		
		<cfset validatesLengthOf(property="eventtitle", maximum=255)>
		<cfset validatesLengthOf(property="eventdesc", maximum="1000")>

		
	</cffunction>

</cfcomponent>
