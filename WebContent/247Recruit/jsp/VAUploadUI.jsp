<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
String ProofStatus=(String)session.getAttribute("ProofStatusVAFile");
if(ProofStatus==null)
{
session.setAttribute( "ProofStatusVAFile", "0");
ProofStatus = "0";
}
System.out.println("VAUploadUI Page::::ProofStatus::::"+ProofStatus);
String FileName=(String)session.getAttribute("VAFileName");
if(FileName==null)
{
FileName="";
}
System.out.println("FileUpload Page::::FileName:::"+FileName);
%>


<html>
  <head>
    <title>[24]7 Upload V&A Audio</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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
		  
		  if(ext == 'mp3' || ext=='wav') 
		  {
		    
		  } 
		  else
		  {
		    alert('You selected a .'+ext+' file; please upload either .mp3 or .wav file instead!');
		    return false; 
		  }
		 
		}
	  
	  
	  }
	  
	</script>
  </head>
  <body>
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/VAFileUpload.jsp" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		<%
    		System.out.println("FileUploadUI page::::Session Value of:::::"+ProofStatus);
    		if(ProofStatus.equalsIgnoreCase("1")){ 
    		%>
    		<td>
    		  <input id="FilePathDISP" value="File : <%= FileName%>, successfully uploaded." size="50" readonly="readonly" style="border: none;background-color: #F8F8F8;"> 
	          </td>
	          <td width="10px">
             </td>
	            <td align="center">
			      <input type="submit" name="reset" value="Change" class="inputFileButtons"/>
	           </td>
	           <%} else { %>
            <td>
            	<input type="file" name="uploadfile" size="50" />
             </td>
             <td width="10px">
             </td>
            <td style="vertical-align: bottom;" >
            	<input type="submit" name="submit" value="Upload" class="buttonSmall"  />
            </td>
            <%} %>
        </tr>
    	</table>
    	
    </form>
    
  </body>
  
</html>
