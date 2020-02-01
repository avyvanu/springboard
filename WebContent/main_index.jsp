<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd" "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="OuterGlobalDeclare.jsp"%>

<%
	System.out.println("START - I");
%>

<%
	String x_val = (String)session.getAttribute("x_val2");
	System.out.println("x_val   "+ x_val);
	if(x_val.equals("1"))
	{
		session.setAttribute("x_val2","2");
	}
%>

<html>
	<head>
		<title>[24]7 SPRINGBOARD</title>
	</head>
	<frameset rows="81,*,21" frameborder="no" border="0" framespacing="0">
		<frame name="topNav" src="jsp/Header.jsp" scrolling="no">
		<frameset cols="*,270" frameborder="no" border="0" framespacing="0">
			<frame name="content" src="jsp/main_pict_inst.jsp" marginheight="0"
				marginwidth="0" scrolling="auto" noresize>
			<frame name="related" src="jsp/camfor_typingtest.jsp" marginheight="0"
				marginwidth="0" scrolling="no" noresize>
		</frameset>
		<frame name="botNav" src="jsp/Footer.jsp" scrolling="no">
		<noframes>
			<p>
				This section (everything between the 'noframes' tags) will only be
				displayed if the users' browser doesn't support frames. You can
				provide a link to a non-frames version of the website here. Feel
				free to use HTML tags within this section.
			</p>
		</noframes>
	</frameset>
</html>
<%
	System.out.println("END - I");
%>
