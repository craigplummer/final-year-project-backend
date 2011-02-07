<cfparam name="location">
<cfoutput>

<h1>Add new venue</h1>

#startFormTag(action="create")#

<cfif flashKeyExists("success")>
	<p>#flash("success")#</p>
</cfif>

#textField(label="Venue Name", objectName="location", property="name")#
#textField(label="Address Line 1", objectName="location", property="address1")#
#textField(label="Address Line 2", objectName="location", property="address2")#
#textField(label="Town/City", objectName="location", property="towncity")#
#textField(label="County", objectName="location", property="county")#
#textField(label="Postcode", objectName="location", property="postcode")#

#submitTag(value="Add Venue")#

#endFormTag()#

</cfoutput>