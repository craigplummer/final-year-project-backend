	<cfquery name="qGetVenues" datasource="ticketseller">
		SELECT uuid, name FROM ts_venues
	</cfquery>
	
	<section id="mission">
		<p>Create Event: Step 1 - Event Details</p>
	</section>
	
	<script>
		$(function() {
			$("#start-time").datepicker();
			$("#end-time").datepicker();
		});
	</script>
	
	<section id="featuredcontent">
		<p>Please complete the following fields</p>
		
		<form name="add_event" id="add_event" action="addevent-confirm.cfm" method="post">
			<fieldset>
				<ul>
					<li><label for="event-title">Event Title</label><input type="text" name="event-title" /></li>
					<li><label for="event-desc">Event Description</label><textarea name="event-desc"></textarea></li>
					<li><label for="eventname">Venue</label><select name="venuename"/>
						<cfloop query="qGetVenues">
								<cfoutput>
									<option value="#qGetVenues.uuid#">#qGetVenues.name#</option>
								</cfoutput>
						</cfloop>
					</select><a href="#">Add New Venue</a></li>
					<li><label for="eventdescription">Event Description</label><input type="text" name="eventdescription" /></li>
					<li><label for="starttime">Start Date and Time</label><input type="text" name="start-time" id="start-time" /></li>
					<li><label for="endtime">End Time</label><input type="text" name="end-time" id="end-time" /></li>
					<li><input type="submit" name="submit" value="Add Event"></li>
				</ul>
			</fieldset>
		</form>
	</section>
	<section id="sidebar" class="grid_4">
		<p>Sidebar to go here</p>
	</section>
	

