<cftry>  
    <cfset origText = "http://mobile.ticketseller.co.uk/ticket/123456" />  
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