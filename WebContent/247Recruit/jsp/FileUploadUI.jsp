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
String selectedDocId=(String) request.getParameter("selectedDocId");
if(selectedDocId == null)
{
selectedDocId = "";
}
System.out.println("selectedDocId::::"+selectedDocId);

//String ProofStatus=(String)session.getAttribute("ProofStatus"+docTypeId);
//System.out.println("FileUploadUI Page::::ProofStatus::::"+ProofStatus);
//if(ProofStatus==null)
//{
//session.setAttribute( "ProofStatus"+docTypeId, "0");
//ProofStatus = "0";
//}
//System.out.println("FileUploadUI Page::::ProofStatus::::"+ProofStatus);

String proofname=(String) request.getParameter("proofName");
if(proofname==null)
{
proofname="";
}
System.out.println("FileUploadUI proof Name"+proofname);
session.setAttribute("proofName",proofname);
String otherDetails="";
if(selectedDocId.equalsIgnoreCase("Other"))
{
otherDetails=(String) request.getParameter("OtherDetails");
if(otherDetails==null)
{
otherDetails="";
}
System.out.println("FileUploadUI page::::OtherDetails::::"+otherDetails);
session.setAttribute("OtherDetails"+docTypeId,otherDetails);
}
String redURL=recruitPath + "jsp/Cand_Doc_Upload.jsp";
session.setAttribute("redURL"+docTypeId,redURL);


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
	  
	  var docSelelcted = parent.document.getElementById('selDocument').value;
		  if(docSelelcted == "select")
		  {
			  alert ( "Please select the Document !" ); 
			  parent.document.getElementById('selDocument').focus();
			  return false;
		  }
	  
	  if ( parent.document.getElementById('selDocument').value == "Other" ) 
   		{
   		   if( parent.document.getElementById('txtIDL').value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details !';		
				alert(appStr);
				parent.document.getElementById('txtIDL').focus();
				return false;
			}
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
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/DocumentUpload.jsp?proofName=<%=proofname %>&proofType=<%=docTypeId %>&selectedDocId=<%=selectedDocId %>" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		   <td id="tdfile">
	           	 <input type="file" name="uploadfile" id="uploadfile" size="38" />
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
