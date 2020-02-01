<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ChatTest.jsp' starting page</title>
    
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
	<table width="100%"  bgcolor="#ad0000" cellpadding="5"  style="-moz-border-radius:12px;">
		<tr>
<td class="tBackColor">
Chat Test
</td>
</tr>
</table>
<table width="100%">
<tr>
<td>
<textarea name="input" cols="120" rows="12">Hi Amit, this is Anand from the HR team,

Please use the text box below to chat, in case of technical issues with the audio hardware.</textarea>
</td>
</tr>
</table>
<table width="100%" border="0px">
<tr>
<td width="703" class="allTdBackColor">
<textarea name="output" cols="110" rows="2"></textarea>
</td>
<td width="52" class="allTdBackColor">
  
    <div align="center">
      <input name="" type="button" value="" class="send"/>
      </div></td>
</tr>
</table>
</form>
</fieldset>
  </body>
</html>
