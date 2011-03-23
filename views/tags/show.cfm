<h1>Showing tags</h1>

<cfoutput>

					<p><span>Id</span> <br />
						#tags.id#</p>
				
					<p><span>Categoryid</span> <br />
						#tags.categoryid#</p>
				
					<p><span>Name</span> <br />
						#tags.name#</p>
				
					<p><span>Description</span> <br />
						#tags.description#</p>
				
					<p><span>Image</span> <br />
						#tags.image#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this tags", action="edit", key=tags.id)#
</cfoutput>
