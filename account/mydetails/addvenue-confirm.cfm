<cfdump var="#form#">
<cfquery name="qAddVenue" datasource="ticketseller_local">
	INSERT INTO ts_venues (uuid, name, description, location) VALUES ('#createuuid()#', '#form.venuename#', '#form.venuedescription#', '#form.venuelocation#')
</cfquery>

<p>Your venue has been added</p>
<p><a href="/admin">Return home</a></p>