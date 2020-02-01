<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PalyAudio.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=recruitPath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=recruitPath%>js/jquery.media.js"></script> 
	
	<SCRIPT type=text/javascript>
    $(function() {
        $('a.media').media( { width: 300, height: 20 } );
    });
</SCRIPT>
  </head>
  
  <body>
    <A class=media href="<%=voicePath%>asalaam.mp3"></A> 
  </body>
</html>
