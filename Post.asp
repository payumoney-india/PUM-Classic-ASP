

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	Test page ......
</title>
<script type="text/javascript" src="sha512.js"></script>
</head>
<body >

<%

        Function HashString(strValue)
  Dim aBytes
  Dim aBinResult
  Set oEncoding = CreateObject("System.Text.UTF8Encoding")
  Set oCrypt = Server.CreateObject("System.Security.Cryptography.SHA512Managed")
  aBytes = oEncoding.GetBytes_4(strValue)
  aBinResult = oCrypt.ComputeHash_2((aBytes))
  HashString = BinToHexString(aBinResult)
End Function
Function BinToHexString(rabyt)
  Dim xml: Set xml = CreateObject("MSXML2.DOMDocument.3.0")
  xml.LoadXml "<root />"
  xml.documentElement.dataType = "bin.hex"
  xml.documentElement.nodeTypedValue = rabyt
  BinToHexString = Replace(xml.documentElement.Text, VbLf, "")
 
End Function
Dim strToHash, strHash
strToHash = "JBZaLc|12345|1|productinfo|Pawan|abc@xyz.com||12345|||||||||GQs7yium"
strHash = HashString(strToHash)
//Response.Write strHash



 %>

<script type="text/javascript">

    function SubmitForm() 
    {

        var hash1;

        document.forms[0].txnid.value = 'AJX' + Math.floor((Math.random() * 99999999) + 1);

        //var stringhash = document.forms[0].key.value + '|' + document.forms[0].txnid.value + '|' + document.forms[0].amount.value + '|' + document.forms[0].productinfo.value + '|' + document.forms[0].firstname.value + '|' + document.forms[0].email.value + '|||||||||||<%=salt%>';

        // hash1 = SHA512(stringhash);
        hash1 = <%strHash %>

        document.forms[0].hash.value = hash1;        

        document.forms[0].Submit();
    }



</script>
    <form method="post" action="https://sandboxsecure.payu.in/_payment" id="form1">  
      
    
   <input name="key" type="hidden" id="key" value="JBZaLc" />
      <input name="hash" type="hidden" id="hash" />
            <input name="txnid" type="hidden" id="txnid" />
      <table>
        <tr>
          <td><b>Mandatory Parameters</b></td>
        </tr>
        <tr>
          <td>Amount: </td>
          <td>
          <input name="amount" type="text" id="amount" /></td>
          <td>First Name: </td>
          <td>
           <input name="firstname" type="text" id="firstname" /></td>
        </tr>
        <tr>
          <td>Email: </td>
          <td>
           <input name="email" type="text" id="email" /></td>
          <td>Phone: </td>
          <td>
          <input name="phone" type="text" id="phone" /></td>
        </tr>
        <tr>
          <td>Product Info: </td>
          <td colspan="3">
          <input name="productinfo" type="text" id="productinfo" /></td>
        </tr>
        <tr>
          <td>Success URI: </td>
          <td colspan="3">
          <input name="surl" type="text" id="surl" /></td>
        </tr>
        <tr>
          <td>Failure URI: </td>
          <td colspan="3">
          <input name="furl" type="text" id="furl" /></td>
        </tr>
        <tr>
          <td><b>Optional Parameters</b></td>
        </tr>
        <tr>
          <td>Last Name: </td>
          <td>
          <input name="lastname" type="text" id="lastname" /></td>
          <td>Cancel URI: </td>
          <td>
           <input name="curl" type="text" id="curl" /></td>
         
        </tr>
        <tr>
          <td>Address1: </td>
          <td>
            <input name="address1" type="text" id="address1" /></td>
          <td>Address2: </td>
          <td>
          <input name="address2" type="text" id="address2" /></td>
        </tr>
        <tr>
          <td>City: </td>
          <td>
          <input name="city" type="text" id="city" /></td>
          <td>State: </td>
          <td>
          <input name="state" type="text" id="state" /></td>
        </tr>
        <tr>
          <td>Country: </td>
          <td>
          <input name="country" type="text" id="country" /></td>
          <td>Zipcode: </td>
          <td>
            <input name="zipcode" type="text" id="zipcode" /></td>
        </tr>
        <tr>
          <td>UDF1: </td>
          <td>
           <input name="udf1" type="text" id="udf1" /></td>
          <td>UDF2: </td>
          <td>
           <input name="udf2" type="text" id="udf2" /></td>
        </tr>
        <tr>
          <td>UDF3: </td>
          <td>
           <input name="udf3" type="text" id="udf3" /></td>
          <td>UDF4: </td>
          <td>
           <input name="udf4" type="text" id="udf4" /></td>
        </tr>
        <tr>
          <td>UDF5: </td>
          <td>
           <input name="udf5" type="text" id="udf5" /></td>
          <td>PG: </td>
          <td>
           <input name="pg" type="text" id="pg" /></td>
        </tr>
		<tr>
		<td>Service Provider: </td>
          <td>
           <input name="service_provider" type="text" value="payu_paisa" id="service_provider" /></td>
		</tr>
        <tr>
        
            <td colspan="4"></td>
            
        </tr>
      </table>
     <br />
      <input type="submit" name="submit" value="submit" id="submit" style="width:100px;"  onclick= 'SubmitForm()' />
    </form>
</body>
</html>
