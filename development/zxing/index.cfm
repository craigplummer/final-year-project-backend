<cfset libraries = [ expandPath('zxing_core.jar'),expandPath('zxing_javase.jar') ]>
<cfset libraryList = ArrayToList(libraries)>
<cftry>
    <cfset origText = "http://getrailo.org/" />
    <!--- initialize writer and create a new barcode matrix --->
	<cfset BarcodeFormat = createObject('java','com.google.zxing.BarcodeFormat',libraryList)>
	<cfset writer = createObject('java','com.google.zxing.qrcode.QRCodeWriter',libraryList).init()>
    <cfset bitMatrix = writer.encode( origText, BarcodeFormat.QR_CODE, 200, 200 )>
    <!--- render the matrix as a bufferedimage --->
    <cfset converter = createObject('java','com.google.zxing.client.j2se.MatrixToImageWriter',libraryList)>
    <cfset buff = converter.toBufferedImage( bitMatrix ) />
    <!--- convert it to a CF compatible image --->
    <cfset img = ImageNew( buff ) />
    <!--- display results --->
    <b>Original Text = </b> <cfoutput>#origText#</cfoutput>
    <div>
        <cfimage action="writeToBrowser" source="#img#" format="png">
    </div>
    <!--- add real exception handling here ...--->
    <cfcatch>
        ERROR: Unable to generate barcode <cfoutput>#cfcatch.message#</cfoutput>
    </cfcatch>
</cftry>
