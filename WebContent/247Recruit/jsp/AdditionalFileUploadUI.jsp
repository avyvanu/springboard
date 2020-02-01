<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";


String docTypeId=(String) request.getParameter("docTypeId");
if(docTypeId == null)
{
docTypeId = "";
}
System.out.println("docTypeId"+docTypeId);

String proofname=(String) request.getParameter("proofName");
if(proofname==null)
{
proofname="";
}
System.out.println("FileUploadUI proof Name"+proofname);
session.setAttribute("proofName",proofname);
String documentDescription = (String) request.getParameter("documentDescription");
if(documentDescription==null)
{
documentDescription = "";
}
System.out.println("FileUploadUI page::::documentDescription::::"+documentDescription);
session.setAttribute("documentDescription"+docTypeId,documentDescription);

String redURL=recruitPath + "jsp/Cand_Additional_Doc_Upload.jsp";
session.setAttribute("redAdditionalURL"+docTypeId,redURL);


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">

	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	</style>
	
	<script type="text/javascript">
	
	function HideProcess()
	{
 		document.getElementById("processDIV").style.display="";
		document.getElementById("tdfile").style.display="none";   
		document.getElementById("tdbutton").style.display="none";   	 	
	}
	
	</script>
	
	<script type="text/javascript" language="JavaScript">
	function check() 
	{
	  
	  var docName = parent.document.getElementById("documentsTypesId").value;
	  if(docName == "select")
		  {
			  alert("Please select the Document type !");
			  return false;
		  }
	  
	 if( parent.document.getElementById('txtIDL').value == 'Document Description' || parent.document.getElementById('txtIDL').value.trim() == "")
			 {
			    var appStr = 'Please Enter Document Description !';		
				alert(appStr);
				parent.document.getElementById('txtIDL').focus();
				return false;
			}
   		
	  var ext = FileUpoadForm.uploadfile.value;
	 // alert(ext);
	  if(ext.length==0)
	  {
	  	alert("Please browse a file.");
	  	return false;
	  }
	  else
	  {	
 		if(ext != '')
 		{ 
  			var valid_extensions = /(.jpg|.jpeg|.doc|.docx|.txt|.pdf|.xlsx|.xls)$/i;   
  			if(valid_extensions.test(ext))
  			{			  
			//  return true;
			//  alert('HELLO');
			  HideProcess();
  			}
  			else
  			{
  				 alert('You selected a .'+ext+' file; please upload one of these files (.jpg or .jpeg or .doc or .docx or .txt or .pdf or .xlsx or .xls) instead!');
		    	 return false; 
  			}	  	 
	    }	 
	 }
	}	  
	 
	</script>

  </head>
  
  <body>
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/AdditionalUploadDocument.jsp?proofName=<%=proofname %>&proofType=<%=docTypeId %>&documentDescription=<%=documentDescription %>" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		   <td id="tdfile">
	           	 <input type="file" name="uploadfile" id="uploadfile" size="45" />
	           </td>
	            <td align="center" style="width:75px;" id="tdbutton">
			      <input type="submit" name="submit" value="Upload" class="inputFileButtons" id="submit" onclick="return check();"/>		
			    </td>
			    <td align="left" id="processDIV" style="display:none; font-size: 12px; color: black; padding-left: 5px;" valign="middle">
			    	<table>
			    	<tr>
				    	<td valign="middle">
				    	  <img src="<%=recruitPath%>images/progress.gif" width="18px" height="18px" alt="image" />
				    	</td>
				    	<td valign="middle">
				    	   <b>Processing, please wait...</b>
				    	</td>
			    	</tr>
			    	</table>
			    </td>
              </tr>
    	</table>
     </form>
  </body>
</html>
