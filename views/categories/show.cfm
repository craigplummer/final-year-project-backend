<h1>Showing categories</h1>

<cfoutput>

					<p><span>Id</span> <br />
						#categories.id#</p>
				
					<p><span>Name</span> <br />
						#categories.name#</p>
				
					<p><span>Description</span> <br />
						#categories.description#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this categories", action="edit", key=categories.id)#
</cfoutput>
