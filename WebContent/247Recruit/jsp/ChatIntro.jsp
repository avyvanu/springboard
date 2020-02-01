<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 Gotya!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">

  </head>
  
  <body>
  <fieldset>
   <form>

<table width="100%" bgcolor="#ad0000" cellpadding="5"  style="-moz-border-radius:12px;">
<tr>
       <td width="15%" height="41" rowspan="5"><p align="left"> <b>Precis Writing Score</b></td>
    </tr>
  </table>
	<table width="100%" border="0">
	<tr>
	<td height="169" class="allTdBackColor"><b>In the next few minutes you will be asked a series of questions.
Please answer all questions in a concise manner.
Other Instruction1<br/>
Other Instruction2<br/> 
Other Instruction3<br/> 
:<br/>
:<br/>
:<br/>
:<br/>
Other Instruction n</b>

	</td>
	</tr>
	</table>
	<table width="100%" border="0">
	<tr>
	<td width="52%"  align="center">
	  <input name="accept" type="button"  value="" class="chatintro" />
	</td>

	<td width="48%" align="center">
	  <input name="accept2" type="button"  value="submit"  cellpadding="5"  style="-moz-border-radius:12px;  background-color:#ad0000;color: white; " />
	  </td>
	</tr>
	</table>
</form>
</fieldset>
  </body>
</html>
