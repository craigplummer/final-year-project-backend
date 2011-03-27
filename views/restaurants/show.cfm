<h1>Showing restaurants</h1>

<cfoutput>

					<p><span>Id</span> <br />
						#restaurants.id#</p>
				
					<p><span>Name</span> <br />
						#restaurants.name#</p>
				
					<p><span>Type</span> <br />
						#restaurants.type#</p>
				
					<p><span>Address1</span> <br />
						#restaurants.address1#</p>
				
					<p><span>Address2</span> <br />
						#restaurants.address2#</p>
				
					<p><span>Towncity</span> <br />
						#restaurants.towncity#</p>
				
					<p><span>County</span> <br />
						#restaurants.county#</p>
				
					<p><span>Postcode</span> <br />
						#restaurants.postcode#</p>
				
					<p><span>Phone</span> <br />
						#restaurants.phone#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this restaurants", action="edit", key=restaurants.id)#
</cfoutput>
