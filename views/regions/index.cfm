<div id="main-content">
<h2>Regions</h2>
<p>This is a listing of all the regions currently listed. You can add new regions and change existing ones from here</p>

<cftable query="regions" colHeaders="true" HTMLTable="true">
	
					
				
					<cfcol header="Name" text="#name#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New regions", action="new", id="addnewticket")#</p>
</cfoutput>

</div>
<div class="clearfix"></div>
