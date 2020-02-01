<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String USER_Name =(String)session.getAttribute("USER_Name");
if(USER_Name == null)
	 {
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	 }
String TaskId= (String) request.getParameter("TaskId");
if(TaskId == null)
	 {
		TaskId = "";
	 }
System.out.println("TaskId:::Admin Task Right Page:::"+TaskId);
session.setAttribute( "TaskId", TaskId );
%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">

	<script type="text/javascript">
		function AllowChars(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
	        if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) {
				return true;
			}
			else
			{
				alert("Invalid character entered !!");
				return false;
			}
		}      
	</script>

<!-- :Water mark::Start Java script for Test Fields Blur Data:Water mark -->
	<script type="text/javascript">
			function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
	</script>

	<style type="text/css">
		.wmta
		{       		 
			color:gray;       		
		}
		.wmtr
		{       		 
			color:black;       		
		}
		.nta
		{
			color: black;
		}	
	</style>
<!-- :Water mark:::End Javascript for Test Fiels Blur Data -->

	<script type="text/javascript" language="javascript">
	    <%
			if(USER_Name == null)
	 			{
		%>
			parent.location.href="<%=logoutPage%>";
		<%
			}
		%>
	  </script>
     
     <script type="text/javascript">
     function showOptionEdit(value)
		{
		   if (value == 1)
		   	{
		   	  document.getElementById('parentTaskEdit').style.display="";
		   	}
		   	else
		   	{
		   		document.getElementById('parentTaskEdit').style.display="none";
		   	}
		}
		function showOptionAdd(value)
		{
		   if (value == 1)
		   	{
		   	  document.getElementById('parentTaskAdd').style.display="";
			}
		   	else
		   	{
		   		document.getElementById('parentTaskAdd').style.display="none";
		    }
		}
      function enableOldViewEdit()
	   {
			 document.getElementById('editpartButtonDisp').style.display="none";
			 document.getElementById('TaskStatusSelectionedit').style.display="none";
			 document.getElementById('TaskNameValueDISP').style.display="";
			 document.getElementById('TaskURLValueDISP').style.display="";
			 document.getElementById('TaskStatusDISPTXT').style.display="";
		 	 document.getElementById('AddEditDelete').style.display="";
		 	 document.getElementById('selectTaskTypeDISP').style.display="";
		 	 document.getElementById('selectTaskTypeEdit').style.display="none";
		 	 document.getElementById('selectTaskTypeAdd').style.display="none";
		 	 document.getElementById('parentTaskAdd').style.display="none";
		 	 if(document.getElementById('parentTaskId').value != 0)
			  {
			  	document.getElementById('parentTaskDISP').style.display="";
			  	document.getElementById('parentTaskEdit').style.display="none";
			  }
	  }
	
	 function enableOldViewAdd()
	 {
			
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('EnterTaskNameADD').style.display="none";
			document.getElementById('EnterTaskURLADD').style.display="none";
			document.getElementById('TaskNameADD').style.display="none";
			document.getElementById('TaskURLADD').style.display="none";
			document.getElementById('TaskNameValueDISP').style.display="";
			document.getElementById('TaskURLValueDISP').style.display="";
			document.getElementById('TaskStatusDISPTXT').style.display="";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('TaskNameDISP').style.display="";
			document.getElementById('TaskURLDISP').style.display="";
			document.getElementById('TaskStatusSlctnADD').style.display="none";
			document.getElementById('selectTaskTypeDISP').style.display="";
			document.getElementById('selectTaskTypeEdit').style.display="none";
			document.getElementById('selectTaskTypeAdd').style.display="none";
			document.getElementById('parentTaskAdd').style.display="none";
			if(document.getElementById('parentTaskId').value != 0)
			  {
			  	document.getElementById('parentTaskDISP').style.display="";
			  	document.getElementById('parentTaskEdit').style.display="none";
			  }
	}
    function deleteuser()
     {
			document.getElementById('AddEditDelete').style.display="none";
			document.getElementById('deletesubmit').style.display="";
			document.getElementById('ProgramTypeDISP').style.display="";
			document.getElementById('TaskNameValueDISP').style.display="";
			document.getElementById('TaskURLValueDISP').style.display="";
			document.getElementById('hrmsProgramNameDISP').style.display="";
			document.getElementById('ProgramTypeValueDISP').style.display="";
			document.getElementById('HRMSProgramValueDISP').style.display="";
			document.getElementById('ProgramNameDISP').style.display="";
			document.getElementById('EnterTaskNameADD').style.display="none";
			document.getElementById('EnterTaskURLADD').style.display="none";
			document.getElementById('SelecthrmsSubProgramNameDISP').style.display="none";
			document.getElementById('SelectSubPgrmDDL').style.display="none";
			document.getElementById('hrmsSubProgramNameDISP').style.display="";
			document.getElementById('HRMSSubProgramValueDISP').style.display="";
			document.getElementById('SelecthrmsProgramNameDISP').style.display="none";
			document.getElementById('SelectProgramDDL').style.display="none";
			document.getElementById('TaskNameADD').style.display="none";
			document.getElementById('TaskURLADD').style.display="none";
			document.getElementById('SelectProgramTypeDISP').style.display="none";
			document.getElementById('PrgrmTypSlctnADD').style.display="none";
			document.getElementById('SelectTaskStatusDISP').style.display="none";
			document.getElementById('TaskStatusSlctnADD').style.display="none";
			alert("Are you sure you want to Delete the program ??");
     }
	 
      function edituser()
	     {
		  document.getElementById('ActionType').value=2;
		  document.getElementById('editpartButtonDisp').style.display="";
		  //document.getElementById('TaskNameEdit').style.display="";
		  document.getElementById('EnterTaskNameADD').style.display="none";
		  document.getElementById('EnterTaskURLADD').style.display="none";
		  document.getElementById('AddEditDelete').style.display="none";
		  document.getElementById('TaskStatusDISPTXT').style.display="none";
		  document.getElementById('TaskNameADD').style.display="none";
		  document.getElementById('TaskURLADD').style.display="none";
		  document.getElementById('TaskStatusSelectionedit').style.display="";
		  document.getElementById('selectTaskTypeDISP').style.display="none";
		  document.getElementById('selectTaskTypeEdit').style.display="";
		  document.getElementById('parentTaskAdd').style.display="none";
		  if(document.getElementById('parentTaskId').value != 0)
		  {
		  	document.getElementById('parentTaskDISP').style.display="none";
		  	document.getElementById('parentTaskEdit').style.display="";
		  }
		 }
  
	  function submitEditUser()
	  {
		  if ((AdminForm.TaskStatusSelelction[0].checked == false)&& (AdminForm.TaskStatusSelelction[1].checked == false))
			  {
			  alert("Please select Task status !");
			  return false;
			  }
		  if ((AdminForm.selectTaskTypeedit[0].checked == false)&& (AdminForm.selectTaskTypeedit[1].checked == false))
		  {
		  alert("Please select Task Type !");
		  return false;
		  }
		  if (AdminForm.selectTaskTypeedit[1].checked == true)
	     {
   		 	if(AdminForm.selParentTask.value == "0") 
		   		{
		   			alert ( "Please select parent task." ); 
		   			AdminForm.selParentTaskAdd.focus();
		   			return false;
		   		}
	     }    
	  } 
  
	  function AddUser()
	  {
		  document.getElementById('ActionType').value=1;
		  document.getElementById('TaskNameDISP').style.display="none";
		  document.getElementById('TaskURLDISP').style.display="none";
		  document.getElementById('TaskNameValueDISP').style.display="none";
		  document.getElementById('TaskURLValueDISP').style.display="none";
		  document.getElementById('EnterTaskNameADD').style.display="";
		  document.getElementById('EnterTaskURLADD').style.display="";
		  document.getElementById('TaskNameADD').style.display="";
		  document.getElementById('TaskURLADD').style.display="";
		  document.getElementById('AddEditDelete').style.display="none";
		  document.getElementById('TaskStatusDISPTXT').style.display="none";
		  document.getElementById('TaskStatusSelectionedit').style.display="none";
		  document.getElementById('editpartButtonDisp').style.display="none";
		  document.getElementById('addpartButtonDisp').style.display="";
		  document.getElementById('TaskStatusSlctnADD').style.display="";
		  document.getElementById('selectTaskTypeDISP').style.display="none";
		  document.getElementById('selectTaskTypeAdd').style.display="";
		  if(document.getElementById('parentTaskId').value != 0)
		  {
		  	document.getElementById('parentTaskDISP').style.display="none";
		  	document.getElementById('parentTaskEdit').style.display="none";
		  }
		  
	 }
  
	  function ValidationAddedUser()
	  {
        if(document.getElementById("TaskNameValADD").value=='Task Description')
			{
				var appStr = 'Please Enter Task Description !';		
				alert(appStr);
				document.getElementById('TaskNameValADD').focus();
				return false;
			}
		else if(document.getElementById("TaskNameValADD").value.trim() == "")
		    {
		        var appStr = 'Please Enter Task Description !';		
				alert(appStr);
				document.getElementById('TaskNameValADD').focus();
				return false;
		    }
		    if(document.getElementById("TaskURLValADD").value=='Task URL')
			{
				var appStr = 'Please Enter Task URL !';		
				alert(appStr);
				document.getElementById('TaskURLValADD').focus();
				return false;
			}
		else if(document.getElementById("TaskURLValADD").value.trim() == "")
		    {
		        var appStr = 'Please Enter Task URL !';		
				alert(appStr);
				document.getElementById('TaskURLValADD').focus();
				return false;
		    }
	    if ((AdminForm.TaskStatusSelelctionAdd[0].checked == false)&& (AdminForm.TaskStatusSelelctionAdd[1].checked == false))
	        {
	             alert("Please select Task Status !");
	             return false;
	        } 
	     if ((AdminForm.selectTaskTypeadd[0].checked == false)&& (AdminForm.selectTaskTypeadd[1].checked == false))
	        {
	             alert("Please select Task type !");
	             return false;
	        } 
	     if (AdminForm.selectTaskTypeadd[1].checked == true)
	     {
   		 	if(AdminForm.selParentTaskAdd.value == "0") 
		   		{
		   			alert ( "Please select parent task." ); 
		   			AdminForm.selParentTaskAdd.focus();
		   			return false;
		   		}
	     }       
	  }
 	  </script> 
 
	 <!-- Number Validation Script-->
	 <script type="text/javascript">
		function isNumberKey(evt) 
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
				alert("Only Numeric allowed here");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  <form action="<%=recruitPath%>jsp/Admin_Manage_Task_UpdateSubmit.jsp" name="AdminForm" id="AdminForm"  method="post"  accept-charset="utf-8">
    <%
      try
      {
      Connection connection=ConnectDatabase.getConnection();	
      String IsActive = "";
	  int status = 0;
	  String taskURL = "";
	  int parentTaskId = 0;
	  String parentTaskIdDISP = null;
	  String TaskDescription = null;
	  String parentDescription = null;
      String query="select * from task_master where Task_Id ='" + TaskId + "'";
      Statement stmt=connection.createStatement();
      ResultSet rs=stmt.executeQuery(query);
      if(rs.next())
	  	   {
	  	    
	  		TaskDescription=rs.getString("Task_Description");
	  		System.out.println("TaskDescription:::::"+TaskDescription);
	  		status = rs.getInt("Is_Active");
	  		taskURL = rs.getString("Task_URL");
	  		parentTaskId = rs.getInt("Pareent_Task_Id");
	  		System.out.println("parentTaskId:::::"+parentTaskId);
	  		if(parentTaskId == 0)
	  		{
	  			parentTaskIdDISP = "Parent";
			}
	  		else
	  		{
	  			parentTaskIdDISP = "Child";
	  			String qryfortaskParent = "select Task_Description from task_master where Task_Id = "+parentTaskId+"";   
	  		    System.out.println("qryfortaskParent:::::"+qryfortaskParent);
	  		    Statement stmtchild = connection.createStatement();
	     		ResultSet rschild = stmtchild.executeQuery(qryfortaskParent);
	     		if(rschild.next())
	     		{
	     			parentDescription = rschild.getString("Task_Description");
	     		}
	     		rschild.close();
	     		stmtchild.close();
	  		}
	  		if(taskURL == null)
	  		{
	  		taskURL = "NA";
	  		}
	  		System.out.println("status:::::"+status);
	  		if(status == 1)
			   {
			   		IsActive = "Active";
			   }
			   else
			   {
			   		IsActive = "In Active";
			   }
			
			
  		%>
	<table border="0" cellpadding="6" cellspacing="6" width="450px">
       <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="120px">
					<tr>
						<td align="left" class="allBackColor" id="TaskNameDISP" style="background-color: #d8d8d8;">Task Description</td>
						<td align="left" class="allBackColor" id="EnterTaskNameADD" style="background-color: #d8d8d8;display: none;">Task Description</td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="350px">
					<tr>
					  <td align="left" class="allBackColor" id="TaskNameValueDISP"><b><%=TaskDescription %></b>&nbsp;</td>
					 <td align="left" class="allBackColor" id="TaskNameADD" style="display: none;">
					  		<input type="text" name="TaskNameValADD" id="TaskNameValADD"  style="border-color: #41383C;" size="25" maxlength="50" onkeypress="return AllowChars(event);" title="Enter the Task Name"  class="wmta" onblur="Blur(this.id,'Task Description')" onfocus="Focus(this.id,'Task Description')" value="Task Description" oncopy="return false" onpaste="return false" oncut="return false">
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="120px">
					<tr>
						<td align="left" class="allBackColor" id="TaskURLDISP" style="background-color: #d8d8d8;">Task URL</td>
						<td align="left" class="allBackColor" id="EnterTaskURLADD" style="background-color: #d8d8d8;display: none;">Task URL</td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="350px">
					<tr>
					  <td align="left" class="allBackColor" id="TaskURLValueDISP"><b><%=taskURL %></b>&nbsp;</td>
					 <td align="left" class="allBackColor" id="TaskURLADD" style="display: none;">
					  		<input type="text" name="TaskURLValADD" id="TaskURLValADD"  style="border-color: #41383C;" size="25" maxlength="50"  title="Enter the Task URL"  class="wmta" onblur="Blur(this.id,'Task URL')" onfocus="Focus(this.id,'Task URL')" value="Task URL" oncopy="return false" onpaste="return false" oncut="return false">
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		 <!--*********** Radio Button for Tasks Status Field **************-->
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="TaskStatusDISP">Task Status </td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="SelectTaskStatusDISP">Select Task Status </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor" id="TaskStatusDISPTXT">
					 	 <b> <%=IsActive %> </b>
					  </td>
					  <td align="left" class="allBackColor" id="TaskStatusSelectionedit" style="display: none;">
						   <%if(status == 1)
						   {
						   %>
					          <input type="radio" name="TaskStatusSelelction" id="TaskStatusSelelction" checked="checked" value="1">Active
					       <%
					       }
					       else
					       { 
					       %>
					  	     <input type="radio" name="TaskStatusSelelction" id="TaskStatusSelelction" value="1">Active
					      <%
					      }
					      if(status == 0)
					      {
					      %>
					 		 <input type="radio" name="TaskStatusSelelction" id="TaskStatusSelelction" checked="checked" value="0">In Active
					    <%
					      }
					    else
					     { 
					     %>
					        <input type="radio" name="TaskStatusSelelction" id="TaskStatusSelelction" value="0">In Active
					    <%
					     } 
					     %>
					  </td>
					   <td align="left" class="allBackColor" id="TaskStatusSlctnADD" style="display: none;">
					  		<input type="radio" name="TaskStatusSelelctionAdd" id="TaskStatusSelelctionAdd" value="1">Active
					  		<input type="radio" name="TaskStatusSelelctionAdd" id="TaskStatusSelelctionAdd" value="0" checked="checked">In Active
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr>
            <td colspan="1" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Task Type
            </td>
   			<td class="allBackColor" id="selectTaskTypeDISP">
				<b> <%=parentTaskIdDISP %> </b>
			</td>
   			<td class="allBackColor" id="selectTaskTypeEdit" style="display: none;">
				<%if(parentTaskId == 0) 
				{
				%>
					<input type="radio" name="selectTaskTypeedit" value="0" id="selectTaskTypeedit" checked="checked" onclick="showOptionEdit(this.value);">
				<%
				}
				else
				{
				 %>
				 	<input type="radio" name="selectTaskTypeedit" value="0" id="selectTaskTypeedit" onclick="showOptionEdit(this.value);">
				<%
				}
				 %> 
				Parent
			   <%if(parentTaskId != 0) 
				{
				%>
			   		<input type="radio" name="selectTaskTypeedit" value="1" id="selectTaskTypeedit" checked="checked" onclick="showOptionEdit(this.value);">
				<%
				}
				else
				{
				 %>
				 	<input type="radio" name="selectTaskTypeedit" value="1" id="selectTaskTypeedit"  onclick="showOptionEdit(this.value);">
				<%
				}
				 %>
				Child
			</td>
			<td class="allBackColor" id="selectTaskTypeAdd" style="display: none;">
				<input type="radio" name="selectTaskTypeadd" value="0" id="selectTaskTypeadd" onclick="showOptionAdd(this.value);">
				Parent
			   <input type="radio" name="selectTaskTypeadd" value="1" id="selectTaskTypeadd"  onclick="showOptionAdd(this.value);">
				Child
			</td>
       	</tr>
	       	<%if(parentTaskId != 0) 
				 {
		      %>
       	<tr id="parentTaskDISP">
            <td colspan="1" align="left" style="background-color: #d8d8d8;" class="allBackColor" >
                 Parent Task
            </td>
             
            <td colspan="1" align="left" class="allBackColor">
              	<b><%=parentDescription %></b>
            </td>
        </tr>
		        <%
		         }
		         %>
       	<tr id="parentTaskEdit" style="display: none;">
	          <td colspan="1" align="left" style="background-color: #d8d8d8;" class="allBackColor" >
	               Parent Task
	          </td>
	          <td colspan="1" align="left" class="allBackColor">
	            		<select name="selParentTask" id="selParentTask"  style="width: 150px;">
				<option value="0">--Select--</option>
		       <%    
		         try
		         {   	
       				String queryforTasks = "select Task_ID,Task_Description from task_master where Pareent_Task_Id = 0";			        
			  		System.out.println("queryforTasks:::::::"+queryforTasks);
			  		Statement smttasks = connection.createStatement();
					ResultSet rstasks = smttasks.executeQuery(queryforTasks);
					while(rstasks.next())
					{		
					if (parentTaskId == rstasks.getInt("Task_ID")) 
					{	        
					%>					
						<option value="<%=rstasks.getString("Task_ID")%>" selected="selected" style="font-weight: bold;"><%=rstasks.getString("Task_Description") %></option>
					<%
					}
					else
					{
					 %>	
						<option value="<%=rstasks.getString("Task_ID")%>"><%=rstasks.getString("Task_Description") %></option>
					<%
					}
					}
					rstasks.close();
					smttasks.close();
				 }
		    	 catch(Exception e)
		   		 {
		   	  		e.printStackTrace();
		   		 }			            	  
           	      %>
				</select>
	          </td>
        </tr>
	     <tr id="parentTaskAdd" style="display: none;">
	          <td colspan="1" align="left" style="background-color: #d8d8d8;" class="allBackColor" >
	               Parent Task
	          </td>
	          <td colspan="1" align="left" class="allBackColor">
	            		<select name="selParentTaskAdd" id="selParentTaskAdd"  style="width: 150px;">
				<option value="0">--Select--</option>
		       <%    
		         try
		         {   	
       				String queryforTasksadd = "select Task_ID,Task_Description from task_master where Is_Active = 1";			        
			  		System.out.println("queryforTasksadd:::::::"+queryforTasksadd);
			  		Statement smttasksadd = connection.createStatement();
					ResultSet rstasksadd = smttasksadd.executeQuery(queryforTasksadd);
					while(rstasksadd.next())
					{		
					%>
						<option value="<%=rstasksadd.getString("Task_ID")%>"><%=rstasksadd.getString("Task_Description") %></option>
					<%
					}
					rstasksadd.close();
					smttasksadd.close();
				 }
		    	 catch(Exception e)
		   		 {
		   	  		e.printStackTrace();
		   		 }			            	  
           	      %>
				</select>
	          </td>
        </tr>
		    <!--**********End of  Radio Button for Program Status Field ************-->
		    <tr>
            <td colspan="2" align="center" id="AddEditDelete">   
            	<input type="button" name="submitadd" id="submitadd" value="Add" class="buttonSmall" onclick="javascript:AddUser();"/>&nbsp;&nbsp;
            	<input type="button" name="submitedit" id="submitedit" value="Edit" class="buttonSmall" onclick="javascript:edituser();"/>&nbsp;&nbsp;
            	<input type="hidden" name="ActionType" id="ActionType" value="" />
            	<input type="hidden" name="parentTaskId" id="parentTaskId" value="<%=parentTaskId %>" />
            	<!--  <input type="button" name="submitdelete" id="submitdelete" value="Delete" class="buttonSmall" onclick="javascript:deleteuser();"/>&nbsp;&nbsp;-->
              </td>
        </tr>
        
         <tr id="editpartButtonDisp" style="display: none;">
            <td colspan="2" align="center">   
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="right">
				            <input id="cancelbutton" class="buttonSmall" type="reset" onclick="return enableOldViewEdit();" value="Cancel" name="cancelbutton">
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="left">
				             <input type="submit" name="submit" id="submit" value="Submit" class="buttonSmall" onclick="return submitEditUser(this.form);"/>&nbsp;&nbsp;
            			</td>
            		</tr>
            	</table>
            </td>
       </tr>
        <tr id="addpartButtonDisp" style="display: none;">
            <td colspan="2" align="center">   
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="right">
				            <input id="cancelbutton" class="buttonSmall" type="reset" onclick="return enableOldViewAdd();" value="Cancel" name="cancelbutton">
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="left">
				             <input type="submit" name="finalsubmit" id="finalsubmit" value="Submit" class="buttonSmall" onclick="return ValidationAddedUser(this.form);"/>&nbsp;&nbsp;
            			</td>
            		</tr>
            	</table>
            </td>
       </tr>
    </table>
  		<%
				rs.close();
				stmt.close();
				connection.close();
		 }
		 }
		 catch(Exception ex)
		 {
		 ex.printStackTrace();
		 }
		 %>
   </form>
  </body>
</html>
