<cfset starttime = "#form.starttime# #form.starthour#:#form.startminutes#">
<cfset endtime = "#form.endtime# #form.endhour#:#form.endminutes#">
<cfdump var="#form#">
<cfquery name="qAddEvent" datasource="ticketseller">
	INSERT INTO ts_events (uuid, name, description, startdate, enddate, venueuuid) VALUES ('#createuuid()#', '#form.eventtitle#', '#form.eventdesc#', '#starttime#', '#endtime#', '#form.venuename#')
</cfquery>

<p>Your event has been added</p>
<p><a href="/admin">Return home</a></p>