<cfparam name="user">

<cfoutput>

<h2>Login</h2>
<p class="logintext">Please login to Ticketseller to manage your events</p>
#startFormTag(action="signin")#

<cfif flashKeyExists("error")>
	<ul id="error">
		<li>#flash("error")#</li>
	</ul>
</cfif>
<ul class="form">
#textField(label="E-Mail Address", objectName="user", property="email")#
#passwordField(label="Password", objectName="user", property="password")#
</ul>
<div id="login-button" class="clear">
#linkTo(text="Forgotten your password?", controller="account", action="register", id="forgotpass")#
#submitTag(value="Login", id="loginbutton")#
</div>
#endFormTag()#

</cfoutput>