<cfparam name="user">

<cfoutput>

<h2>Register</h2>
<p class="logintext">Please complete all the fields on this form to setup your Ticketseller account.</p>

#startFormTag(action="create")#

#errorMessagesFor("user")#

<ul class="form">
<li>#textField(label="First Name", objectName="user", property="firstname")#</li>
<li>#textField(label="Surname", objectName="user", property="surname")#</li>
<li>#textField(label="E-mail Address", objectName="user", property="email")#</li>
<li>#passwordField(label="Password", objectName="user", property="password")#</li>
<li>#passwordField(label="Confirm Password", objectName="user", property="passwordConfirmation")#</li>
</ul>

<div id="login-button" class="clear">
#submitTag(value="Register")#
</div>

#endFormTag()#

</cfoutput>
