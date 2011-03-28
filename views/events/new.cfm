<cfoutput>


<div id="main-content">
<h2>Add New Event</h2>
<p>Please complete all the fields below to add your event</p>
<cfif flashKeyExists("success")>
	<ul id="success">
		<li>#flash("success")#</li>
	</ul>
</cfif>

#startFormTag(action="create")#
	
	#errorMessagesFor("event")#
<ul class="form">
<li><label for="event-venueid">Search for venue</label>
<select name="event[venueid]" id="event-venueid">
	<option value=""></option>
<cfloop query = "venues">
	<option value="#venues.id#">#venues.name#, #venues.towncity#</option>
</cfloop>
</select></li>

<li>#textField(label="Event Title", objectName="event", property="eventtitle", class="main-content-form")#</li>
<li>#textArea(label="Event Description", objectName="event", property="eventdesc", class="main-content-form")#</li>
<li><label>Start Time</label>#dateTimeSelect(objectName='event', property='starttime',dateOrder='day,month,year', monthDisplay='abbreviations', timeOrder='hour,minute', minuteStep='5', class="main-content-date")#</li>
<li><label>End Time</label>#dateTimeSelect(objectName='event', property='endtime',dateOrder='day,month,year', monthDisplay='abbreviations', timeOrder='hour,minute', minuteStep='5', class="main-content-date")#</li>
<li><label for="category">Category</label>
<select id="category" name="event[categoryid]" class="main-content-cats">
	<option value="">Select a category</option>
<cfloop query="category">
	<cfquery name="qGetTags" datasource="ticketseller">
		SELECT * FROM tags WHERE categoryid='#category.id#'
	</cfquery>
	<option value="#category.id#" class="titlecat">-- #category.name# --</option>
	<cfloop query="qGetTags">
		<option value="#qGetTags.id#">#qGetTags.name#</option>
	</cfloop>
</cfloop>
</select></li>
</ul>
<div class="clearfix"></div>
<h2>Tickets</h2>
<p>Please add details of the tickets you wish to associate with this event</p>
<ul id="tickets">

#includePartial(event.tickets)#

</ul>
<div class="clearfix"></div>
<a href="" id="addnewticket" class="button">Add Another Ticket</a>

#submitTag(value="Add Event")#

#endFormTag()#
</div>
<div class="clearfix"></div>

#includePartial("ticketTemplate")#
</cfoutput>