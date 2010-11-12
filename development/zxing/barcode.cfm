
		<cfscript>
			paths = arrayNew(1);

			/*
			This points to the jar we want to load.
			Could also load a directory of .class files
			*/
			paths[1] = expandPath("zxing_core.jar");
			paths[2] = expandPath("zxing_javase.jar");

			//create the loader
			loader = createObject("component", "javaloader.JavaLoader").init(paths);

		</cfscript>


<!---  
    Generate barcode  
--->  
<cftry>  
	<cfset ticketnumber = "Y36HW9K7">
    <cfset origText = "http://mobile.ticketseller.co.uk/ticket/#ticketnumber#" />  
    <!--- initialize writer and create a new barcode matrix --->  
    <cfset BarcodeFormat = loader.create("com.google.zxing.BarcodeFormat") />  
    <cfset writer = loader.create("com.google.zxing.qrcode.QRCodeWriter").init() />  
    <cfset bitMatrix = writer.encode( origText, BarcodeFormat.QR_CODE, 120, 120 )>  
    <!--- render the matrix as a bufferedimage --->  
    <cfset converter = loader.create("com.google.zxing.client.j2se.MatrixToImageWriter")>  
    <cfset buff = converter.toBufferedImage( bitMatrix ) />  
    <!--- convert it to a CF compatible image --->  
    <cfset img = ImageNew( buff ) />  
  
    <!--- display results --->  
    <div>  
        <cfimage action="writeToBrowser" source="#img#" format="png"> <br />
        <cfoutput>#ticketnumber#</cfoutput> 
    </div>  
    <!--- add real exception handling here ...--->  
    <cfcatch>  
        ERROR: Unable to generate barcode <cfoutput>#cfcatch.message#</cfoutput>  
    </cfcatch>  
</cftry>  