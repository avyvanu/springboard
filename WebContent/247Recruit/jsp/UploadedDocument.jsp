<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="GlobalDeclare.jsp" %>
<%
	String candidateID = request.getParameter("CIDrec");
	String DocumentID = request.getParameter("DocumentID");
%>
<html>
  <head>
    <title>[24]7 Document</title>
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
			   	<iframe src="<%=recruitPath%>jsp/displayDocsFile.jsp?CIDrec=<%=candidateID%>&DocumentID=<%=DocumentID%>" width="100%" height="100%"></iframe>
	        </td>
	    </tr>
	</table>
  </body>
</html>
