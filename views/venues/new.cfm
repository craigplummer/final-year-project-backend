
<div id="main-content">
<h2>Add New Venue</h2>
<p>Please complete all the fields below to add a new venue</p>
<cfoutput>

			#errorMessagesFor("venues")#
	
			#startFormTag(action="create")#
		<ul class="form">
				
						<li>#textField(objectName='venues', property='name', label='Name', class="main-content-form")#
					
						
					
						
							
						<li>#select(label = "Select a region", property="regionid", objectName="venues",  options=regions, includeBlank=true, class="main-content-cats")#</li> 
					
						
					
						<li>#textField(objectName='venues', property='address1', label='Address Line 1', class="main-content-form")#</li>
					
						<li>#textField(objectName='venues', property='address2', label='Address Line 2', class="main-content-form")#</li>
					
						<li>#textField(objectName='venues', property='towncity', label='Town/City', class="main-content-form")#</li>
					
						<li>#textField(objectName='venues', property='county', label='County', class="main-content-form")#</li>
					
						<li>#textField(objectName='venues', property='postcode', label='Postcode', class="main-content-form")#</li>
				</ul>	

				#submitTag()#
				
			#endFormTag()#
			</div>
<div class="clearfix"></div>
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
