<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";


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
    <form name="FileUpoadForm" ENCTYPE="multipart/form-data" action="<%=recruitPath%>jsp/TestFileUpload.jsp" method="post" onsubmit="return check(this);" >
    	<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
            <td>
            	<input type="file" name="uploadfile" size="50" />
             </td>
             <td width="10px">
             </td>
            <td style="vertical-align: bottom;">
            	<input type="submit" name="submit" value="Upload" class="buttonSmall"  />
            </td>
        </tr>
    	</table>
    	
    </form>
    
  </body>
  
</html>
