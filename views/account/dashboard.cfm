<cfoutput>
<div id="main-content">
<h2>Welcome to Ticketseller</h2>
<cfif flashKeyExists("success")>
	<p>#flash("success")#</p>
</cfif>
<p>Thank you for loging in, from here you can add new events and edit existing ones</p>
<br />
<h2>My Events</h2>
<p>Here are all your current events</p>
<cftable query="events" colHeaders="true" HTMLTable="true">
	
					
				
					<cfcol header="Event Name" text="#eventtitle#" />
					<cfcol header="Start Date" text="#dateformat(starttime, "dd MMM yyyy")# #timeformat(starttime, "h:mm tt")#" />
					<cfcol header="End Date" text="#dateformat(endtime, "dd MMM yyyy")# #timeformat(endtime, "h:mm tt")#" />
					
				
	<cfcol header="" text="#linkTo(text='Show', controller="events", action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', controller="events", action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', controller="events", action='delete', key=id, confirm='Are you sure?')#" />
</cftable>
<div class="clearfix"></div>
<cfoutput>
	<p>#linkTo(text="Add another event", controller="events", action="new")#</p>
</cfoutput>

</div>
<div class="clearfix"></div>
</cfoutput>