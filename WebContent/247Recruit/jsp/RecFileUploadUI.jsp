<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
session.setAttribute("proofName","ResumeProof");
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
	  if(ext.length==0)
	  {
	  	alert("Please browse a file.");
	  	return false;
	  }
	  else
	  {
	  	ext = ext.substring(ext.length-3,ext.length);
		  ext = ext.toLowerCase();
		  
		  if(ext == 'doc' || ext=='docx' || ext=='pdf'|| ext=='xls'|| ext=='xlsx'|| ext=='txt') 
		  {
		    
		  } 
		  else
		  {
		    alert('You selected a .'+ext+' file; please upload one of these files (.doc or .docx or .pdf or .xls or .txt) instead!');
		    return false; 
		  }
		 
		}
	 }
	</script>
  </head>
  <body>
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/SingleFileUpload.jsp" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		  <td>
	               <input type="file" name="uploadfile" id="uploadfile" size="50" />
	          </td>
	            <td align="center" style="width:75px;">
			       <input type="submit" name="submit" value="Upload" class="inputFileButtons" />
			    </td>
	         </tr>
    	</table>
     </form>
  </body>
</html>
