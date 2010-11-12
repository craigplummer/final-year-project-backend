<cfinclude template="/assets/templates/header.cfm">
	<div class="clear"></div>
	<section id="maincontent" class="grid_7 suffix_1">
		<p>Add a venue</p>
		<p>Please complete the following fields</p>
		
		<form name="add_venue" id="add_venue" action="addvenue-confirm.cfm" method="post">
			<fieldset>
				<ul>
					<li><label for="venue-name">Venue Name</label><input type="text" name="venuename" /></li>
					<li><label for="venue-description">Description</label><input type="text" name="venuedescription"></li>
					<li><label for="venue-location">Venue Location</label><input type="text" name="venuelocation" /></li>
					<li><label for="venue-logo">Venue Logo</label><input type="text" name="venuelogo" /></li>
					<li><input type="submit" name="submit" value="Add Venue"></li>
				</ul>
			</fieldset>
		</form>
	</section>
	<section id="sidebar" class="grid_4">
		<p>Sidebar to go here</p>
	</section>
<cfinclude template="/assets/templates/footer.cfm">