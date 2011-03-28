
<div id="main-content">
<h2>Add New Region</h2>
<p>Please complete the field below to add an new region</p>


<cfoutput>

			#errorMessagesFor("regions")#
	
			#startFormTag(action="create")#
		<ul class="form">
				
					<li>#textField(objectName='regions', property='name', label='Name', class="main-content-form")#</li>
					
<ul class="form">
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
</div>
<div class="clearfix"></div>
