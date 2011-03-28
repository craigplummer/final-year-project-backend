<div id="ticket-templates" style="display: none ;">
    <div id="::FIELD1::" class="tickettemplate clearfix">

<li class="tname"><input id="event-tickets-::FIELD2::-ticketname" maxlength="255" name="event[tickets][::FIELD3::][ticketname]" type="text" value="" /></li>


<li class="tdesc"><input id="event-tickets-::FIELD4::-ticketdesc" maxlength="1000" name="event[tickets][::FIELD5::][ticketdesc]" type="text" value="" /></li>


<li class="tprice"><input id="event-tickets-::FIELD6::-price" name="event[tickets][::FIELD7::][price]" type="text" value="" /></li>


<li class="tqty"><input id="event-tickets-::FIELD12::-qty" name="event[tickets][::FIELD13::][qty]" type="text" value="" /> </li>

<li class="span-3 last prepend-top tremove">
     <p><a class="button negative removeticket" href="">R</a></p>
</li>

</div>
</div>
 
 <script>
// Another bit of JS nicked from  Ben Nadel.
// When the DOM has loaded, init the form link.
$(
	function addticket(){
		var jAddNewTicket = $( "#addnewticket" );
 		jAddNewTicket
			.attr( "href", "javascript:void( 0 )" )
			.click(
				function( objEvent ){
					AddNewTicket();
 					objEvent.preventDefault();
					return( false );
				}
		);
	}
)	

$('.removeticket').live('click',function() {
    $(this).parents("div.tickettemplate:first").remove();
	return( false );
});


function AddNewTicket(){
	var jTicketContainer = $( "#tickets" );
 	var jTicketTemplate = $( "#ticket-templates div.tickettemplate" );
	var jTicket = jTicketTemplate.clone(); 
	var strNewHTML = jTicket.html();
	var intNewTicketCount = (jFilesContainer.find( "div.tickettemplate" ).length + 1); 
	jTicket.attr( "id", ("emailedit[" + intNewTicketCount + "]") );
 	strNewHTML = strNewHTML
		.replace(
			new RegExp( "::FIELD1::", "i" ),
			intNewTicketCount
			)
		.replace(
			new RegExp( "::FIELD2::", "i" ),
			intNewTicketCount
			)
 				.replace(
			new RegExp( "::FIELD3::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD4::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD5::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD6::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD7::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD8::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD9::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD10::", "i" ),
			intNewTicketCount
			)
					.replace(
			new RegExp( "::FIELD11::", "i" ),
			intNewTicketCount
			) 
				.replace(
			new RegExp( "::FIELD12::", "i" ),
			intNewTicketCount
			) 
				.replace(
			new RegExp( "::FIELD13::", "i" ),
			intNewTicketCount
			) 
 
	;
 
	jTicket.html( strNewHTML );
 	jTicketContainer.append( jTicket );
}
</script>