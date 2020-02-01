<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>
<html>
	<head>
	<%
	String DuplicateCheck = (String) session.getAttribute("alert");
	System.out.println("DuplicateCheck :"+DuplicateCheck);
	if (session.getAttribute("alert") != null)
	 {
		if(DuplicateCheck.equalsIgnoreCase("Inserted_Successfully"))
		{
			%>
				<script type="text/javascript">
					alert("Inserted Successfully!");
					top.location.href = "<%= recruitPath%>jsp/Admin_Manage_Test.jsp";
				</script>
			<%
		}
		else if(DuplicateCheck.equalsIgnoreCase("Not_Inserted"))
		{
			%>
				<script type="text/javascript">
					alert("Not Inserted!");
					top.location.href = "<%= recruitPath%>jsp/Admin_Manage_Test.jsp";
				</script>
			<%
	 	}
		else if (DuplicateCheck.equalsIgnoreCase("update_Successfull")) 
		{
			%>
				<script type="text/javascript">
					alert("Updated successfully!");
					top.location.href = "<%= recruitPath%>jsp/Admin_Manage_Test.jsp";
				</script>
			<%
		}
		else if (DuplicateCheck.equalsIgnoreCase("1")) 
		{
			 %>
				<script type="text/javascript">
			 		alert("Can't deactivate all language tests!! At least one must be active.");
					top.location.href = "<%= recruitPath%>jsp/Admin_Manage_Test.jsp";
			 	</script>
			 <%
		}
		else
		{
			 %>
				<script type="text/javascript">
					alert("Not Updated!");
					top.location.href = "<%= recruitPath%>jsp/Admin_Manage_Test.jsp";
				</script>
			<% 
		}
	} 
	%>
	</head>

</html>
