<cfdump var="#form#">
<cfquery name="qAddEvent" datasource="ticketseller_local">
	INSERT INTO ts_events (uuid, name, description, startdate, enddate, venueuuid) VALUES ('#createuuid()#', '#form.eventname#', '#form.eventdescription#', '#form.starttime#', '#form.endtime#', '#form.venuename#')
</cfquery>

<p>Your event has been added</p>
<p><a href="/admin">Return home</a></p>