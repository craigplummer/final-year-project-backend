<section id="mission">
	<p>Add New Venue</p>
</section>

<section id="featuredcontent">
	<p>Please complete the following fields to add a new venue</p>
	
	<form name="add_event" id="add_event" action="added-venue.cfm" method="post">
		<fieldset>
			<ul>
				<li><label for="venuename">Venue Name</label><input type="text" name="venuename" id="venue-name"/></li>
				<li><label for="venuedesc">Venue Description</label><textarea name="venuedesc" id="venue-desc"></textarea></li>
				<li><label for="venuelogo">Venue Logo</label><input type="file" name="venuelogo" id="venue-logo"></li>
				<li><label for="venueimage">Venue Image</label><input type="file" name="venueimage" id="venue-image"></li>
				<h3>Venue Address</h3>
				<li><label for="venueaddress1">Address Line 1</label><input type="text" name="venueaddress1" id="venue-address-1"></li>
				<li><label for="venueaddress2">Address Line 2</label><input type="text" name="venueaddress2" id="venue-address-2"></li>
				<li><label for="venuetowncity">Town / City</label><input type="text" name="venuetowncity" id="venue-town-city"></li>
				<li><label for="venuecounty">County</label><input type="text" name="venuecounty" id="venue-county"></li>
				<li><label for="venuepostcode">Postcode</label><input type="text" name="venuepostcode" id="venue-postcode"></li>
				<li><input type="submit" name="submit" value="Add Venue >>"></li>		
			</ul>
		</fieldset>
	</form>
</section>