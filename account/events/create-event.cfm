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
	
	<script language="javascript" type="text/javascript">
	<!--
	function popup(url) {
		newwindow=window.open(url,'name','height=600,width=700');
		if (window.focus) {newwindow.focus()}
		return false;
	}

	// -->
	</script>
	
	<section id="featuredcontent">
		<p>Please complete the following fields</p>
		
		<form name="add_event" id="add_event" action="event-created.cfm" method="post">
			<fieldset>
				<ul>
					<li><label for="event-title">Event Title</label><input type="text" name="eventtitle" id="event-title"/></li>
					<li><label for="event-desc">Event Description</label><textarea name="eventdesc" id="event-desc"></textarea></li>
					<li><label for="event-image">Event Image</label><input type="file" name="eventimage" id="event-image"></li>
					<li><label for="eventname">Venue</label><select name="venuename" id="venue-name"/>
						<cfloop query="qGetVenues">
								<cfoutput>
									<option value="#qGetVenues.uuid#">#qGetVenues.name#</option>
								</cfoutput>
						</cfloop>
					</select> <a href="add-venue.cfm" onclick="return popup('add-venue.cfm')">Add New Venue</a></li>
					<li><label for="starttime">Start Date and Time</label><input type="text" name="starttime" id="start-time" />
						<select name="starthour" class="hour">
							<option value="00">00</option>
							<option value="00">01</option>
							<option value="00">02</option>
							<option value="00">03</option>
							<option value="00">04</option>
							<option value="00">05</option>
							<option value="00">06</option>
							<option value="00">07</option>
							<option value="00">08</option>
							<option value="00">09</option>
							<option value="00">10</option>
							<option value="00">11</option>
							<option value="00">12</option>
							<option value="00">13</option>
							<option value="00">14</option>
							<option value="00">15</option>
							<option value="00">16</option>
							<option value="00">17</option>
							<option value="00">18</option>
							<option value="00">19</option>
							<option value="00">20</option>
							<option value="00">21</option>
							<option value="00">22</option>
							<option value="00">23</option>
						</select>
						<select name="startminutes" class="minutes">
							<option value="00">00</option>
							<option value="05">05</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
							<option value="35">35</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
							<option value="55">55</option>
						</select></li>
					<li><label for="end-time">End Date and Time</label><input type="text" name="endtime" id="end-time" />
							<select name="endhour" class="hour">
								<option value="00">00</option>
								<option value="00">01</option>
								<option value="00">02</option>
								<option value="00">03</option>
								<option value="00">04</option>
								<option value="00">05</option>
								<option value="00">06</option>
								<option value="00">07</option>
								<option value="00">08</option>
								<option value="00">09</option>
								<option value="00">10</option>
								<option value="00">11</option>
								<option value="00">12</option>
								<option value="00">13</option>
								<option value="00">14</option>
								<option value="00">15</option>
								<option value="00">16</option>
								<option value="00">17</option>
								<option value="00">18</option>
								<option value="00">19</option>
								<option value="00">20</option>
								<option value="00">21</option>
								<option value="00">22</option>
								<option value="00">23</option>
							</select>
							<select name="endminutes" class="minutes">
								<option value="00">00</option>
								<option value="05">05</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
							</select></li>
					<li><input type="submit" name="submit" value="Step 2: Add Tickets >>"></li>
				</ul>
			</fieldset>
		</form>
	</section>
	<section id="sidebar" class="grid_4">
		<p>Sidebar to go here</p>
	</section>
	

