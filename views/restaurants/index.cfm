<h1>Listing restaurants</h1>

<cftable query="restaurants" colHeaders="true" HTMLTable="true">
	
					<cfcol header="Id" text="#id#" />
				
					<cfcol header="Name" text="#name#" />
				
					<cfcol header="Type" text="#type#" />
				
					<cfcol header="Address1" text="#address1#" />
				
					<cfcol header="Address2" text="#address2#" />
				
					<cfcol header="Towncity" text="#towncity#" />
				
					<cfcol header="County" text="#county#" />
				
					<cfcol header="Postcode" text="#postcode#" />
				
					<cfcol header="Phone" text="#phone#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New restaurants", action="new")#</p>
</cfoutput>
