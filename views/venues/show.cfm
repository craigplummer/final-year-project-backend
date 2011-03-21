<h1>Showing venues</h1>

<cfoutput>

					<p><span>Id</span> <br />
						#venues.id#</p>
				
					<p><span>Name</span> <br />
						#venues.name#</p>
				
					<p><span>Description</span> <br />
						#venues.description#</p>
				
					<p><span>Location</span> <br />
						#venues.location#</p>
				
					<p><span>Gps</span> <br />
						#venues.gps#</p>
				
					<p><span>Address1</span> <br />
						#venues.address1#</p>
				
					<p><span>Address2</span> <br />
						#venues.address2#</p>
				
					<p><span>Towncity</span> <br />
						#venues.towncity#</p>
				
					<p><span>County</span> <br />
						#venues.county#</p>
				
					<p><span>Postcode</span> <br />
						#venues.postcode#</p>
				
					<p><span>Createdat</span> <br />
						#venues.createdat#</p>
				
					<p><span>Updatedat</span> <br />
						#venues.updatedat#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this venues", action="edit", key=venues.id)#
</cfoutput>
