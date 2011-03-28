<div id="main-content">
<h2>Venues</h2>

<cftable query="venues" colHeaders="true" HTMLTable="true">
	

					<cfcol header="Name" text="#name#" />
				
					
				
					
				
					<cfcol header="Address 1" text="#address1#" />
				
					<cfcol header="Address 2" text="#address2#" />
				
					<cfcol header="Town/City" text="#towncity#" />
				
					<cfcol header="County" text="#county#" />
				
					<cfcol header="Postcode" text="#postcode#" />
				
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New venues", action="new")#</p>
</cfoutput>

</h2>