<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
String ProofStatus=(String)session.getAttribute("ProofStatus4");
System.out.println("UploadEducation Page::::ProofStatus::::"+ProofStatus);
if(ProofStatus==null)
{
session.setAttribute( "ProofStatus4", "0");
ProofStatus = "0";
}

session.setAttribute( "proofName", "EducationProof" );
String proof=(String) request.getParameter("proofName");
if(proof==null)
{
proof="";
}
session.setAttribute("proof",proof);

String redURL=recruitPath + "jsp/UploadEducation.jsp?proofName="+proof;
session.setAttribute("redURL4",redURL);
String otherDetails="";
if(proof.equalsIgnoreCase("Other"))
{
otherDetails=(String) request.getParameter("OtherDetails");
if(otherDetails==null)
{
otherDetails="";
}
System.out.println("Upload Education page::::otherDetails"+otherDetails); 
session.setAttribute("OtherDetails4",otherDetails);
}
String FileName=(String)session.getAttribute("FileName4");
if(FileName==null)
{
FileName="";
}
System.out.println("Upload Education page::::FileName"+FileName);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<style type="text/css">
		html,body
		{
			margin: 0px;
		}
	</style>

	<script type="text/javascript" language="JavaScript">
	function check() 
	{
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
				// return true;  
				OpenProcess();
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
	<script type="text/javascript">
	function OpenProcess()
	{
 		document.getElementById("tdfile").style.display="none";
 		document.getElementById("tdbutton").style.display="none";
		document.getElementById("processDIV").style.display="";   	 	
	}
	function HideProcess()
	{
 		document.getElementById("processDIV").style.display="none";
		document.getElementById("submit").style.display="";   	 	
	}
	
	</script>
  </head>
  
  <body style="background-color: #F8F8F8;">
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/DocumentUpload.jsp?proofName=EducationProof&proofType=4" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		<%
    		System.out.println("Upload Education page::::Session Value of:::::"+ProofStatus);
    		if(ProofStatus.equalsIgnoreCase("1")){ 
    		%>
    		<script type="text/javascript" language="JavaScript">
    		var EducationproofHiddenFld=parent.document.getElementById('EducationproofHiddenFld');
        	EducationproofHiddenFld.value = "1";
    		</script>
    		  <td>
    		  <input id="FilePathDISP" value="File : <%= FileName%>, successfully uploaded." size="50" readonly="readonly" style="border: none;background-color: #F8F8F8;"> 
	          </td>
	            <td align="center" style="width:75px;">
			      <input type="submit" name="reset" value="Change" class="inputFileButtons" id="reset" onclick="return HideProcess();"/>
	           </td>
    		<%} else { %>
    		<script type="text/javascript" language="JavaScript">
    		var EducationproofHiddenFld=parent.document.getElementById('EducationproofHiddenFld');
        	EducationproofHiddenFld.value = "0";
    		</script>
            <td id="tdfile">
            	<input type="file" name="uploadfile" size="50" />
		    </td>
             <td align="center" style="width:75px;" id="tdbutton">
            	 <input type="submit" name="submit" value="Upload" class="inputFileButtons" id="submit" onclick="check();"/>
            </td>     
			    <td align="left" id="processDIV" style="display:none; font-size: 12px; color: black; padding-left: 5px; padding-top: 12px;" valign="middle">
			    	<b>Processing, please wait...</b>
			    </td>
            <%} %> 
           </tr>
    	</table>
   </form>
  </body>
</html>
