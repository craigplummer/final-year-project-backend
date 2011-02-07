<cfoutput>
<div id="left-nav">
Left nav goes here
</div>


<div id="main-content">
<h2>Add New Event</h2>

<cfif flashKeyExists("success")>
	<ul id="success">
		<li>#flash("success")#</li>
	</ul>
</cfif>

#startFormTag(action="create")#

#select(label = "Select a venue", property="venueid", objectName="event",  options=venues, includeBlank=true)# 

#textField(label="Event Title", objectName="event", property="eventtitle")#
#textField(label="Event Description", objectName="event", property="eventdesc")#
<label>Start Time</label>#dateTimeSelect(objectName='event', property='starttime',dateOrder='year,month,day', monthDisplay='abbreviations', timeOrder='hour,minute', minuteStep='5')#
<label>End Time</label>#dateTimeSelect(objectName='event', property='endtime',dateOrder='year,month,day', monthDisplay='abbreviations', timeOrder='hour,minute', minuteStep='5')#

<h2>Tickets</h2>
<div id="tickets">

#includePartial(event.tickets)#

</div>

#submitTag(value="Add Event")#

#endFormTag()#
</div>
<div class="clearfix"></div>
</cfoutput>