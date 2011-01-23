<cfquery name="qAddEvent" datasource="ticketseller">
	INSERT INTO ts_venues (uuid, name, description, address1, address2, towncity, county, postcode) VALUES ('#createuuid()#', '#form.venuename#', '#form.venuedesc#', '#form.venueaddress1#', '#form.venueaddress2#', '#form.venuetowncity#', '#form.venuecounty#', '#form.venuepostcode#')
</cfquery>

<p>Your venue has been added</p>