<h1>Showing regions</h1>

<cfoutput>

					<p><span>Id</span> <br />
						#regions.id#</p>
				
					<p><span>Name</span> <br />
						#regions.name#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this regions", action="edit", key=regions.id)#
</cfoutput>
