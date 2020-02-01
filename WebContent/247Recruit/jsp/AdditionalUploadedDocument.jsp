<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="GlobalDeclare.jsp" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	String candDocAutoId = request.getParameter("docAutoID");
	
%>
<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		html,body
		{
			margin: 0px;
		}
	</style>
  </head>
  <body>
  	<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 100%; overflow: hidden;">
	    <tr>
	        <td>
			   	<iframe src="<%=recruitPath%>jsp/displayAdditionalDocsFile.jsp?candDocAutoId=<%=candDocAutoId%>" width="100%" height="100%"></iframe>
	        </td>
	    </tr>
	</table>
	  <!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->
  </body>
</html>
