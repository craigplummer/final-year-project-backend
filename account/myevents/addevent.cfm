<cfinclude template="/assets/templates/header.cfm">
	<cfquery name="qGetVenues" datasource="ticketseller_local">
		SELECT uuid, name FROM ts_venues
	</cfquery>
	
	<section id="mission">
		<p>Add Event</p>
	</section>
	
	
	<section id="featuredcontent">
		<p>Please complete the following fields</p>
		
		<form name="add_event" id="add_event" action="addevent-confirm.cfm" method="post">
			<fieldset>
				<ul>
					<li><label for="venuename">Venue</label>
							<select name="venuename"/>
								<cfloop query="qGetVenues">
										<cfoutput>
											<option value="#qGetVenues.uuid#">#qGetVenues.name#</option>
										</cfoutput>
								</cfloop>
							</select>
					</li>
					<li><label for="eventname">Event Name</label><input type="text" name="eventname"></li>
					<li><label for="eventdescription">Event Description</label><input type="text" name="eventdescription" /></li>
					<li><label for="starttime">Start Time</label><input type="text" name="starttime" /></li>
					<li><label for="endtime">End Time</label><input type="text" name="endtime">
					<li><input type="submit" name="submit" value="Add Event"></li>
				</ul>
			</fieldset>
		</form>
	</section>
	<section id="sidebar" class="grid_4">
		<p>Sidebar to go here</p>
	</section>
<cfinclude template="/assets/templates/footer.cfm">