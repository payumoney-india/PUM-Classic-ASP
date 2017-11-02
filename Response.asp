

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	Test page ......
</title>
<script type="text/javascript" src="sha512.js"></script>
</head>
<body >

<%

        salt = "GQs7yium"
        ResponseHash = Request("hash")
        ResponseSucess = Request("status")
        key = Request("key")
        txnid = Request("txnid")
        amount = Request("amount")
        productinfo = Request("productinfo")
        firstname = Request("firstname")
        email = Request("email")
      
 %>

<script type="text/javascript">

    function CheckData()
     {

        var hash1;

        //<SALT>|status||||||udf5|udf4|udf3|udf2|udf1|email|firstname|productinfo|amount|txnid|key)

        var stringhash = '<%=salt%>' + '|' + '<%=ResponseSucess%>' + '|||||||||||' + '<%=email%>' + '|' + '<%=firstname%>' + '|' + '<%=productinfo%>' + '|' + '<%=amount%>' + '|' + '<%=txnid%>' + '|' + '<%=key%>';

        hash1 = SHA512(stringhash);

        hash2 =  <%= ResponseHash%>;
        alert(hash2);

        if (hash1 == hash2)
        {
            alert('Hash match');
        }
        else{

         alert('no match');
        }


    }
    

    CheckData(); 

</script>
 
</body>
</html>
