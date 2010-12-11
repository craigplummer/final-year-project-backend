<cfquery name="qAddUser" datasource="ticketseller">
	insert into crm_users (uuid,account_uuid,title,firstname,surname,email,password) values ('#createuuid()#','#createuuid()#','#form.title#','#form.firstname#','#form.surname#','#form.email#','#form.password#')
</cfquery>

<h1>User Registered</h1>