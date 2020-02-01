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
String RoleID= (String) request.getParameter("RoleID");
if(RoleID == null)
	 {
		RoleID = "";
	 }
System.out.println("RoleID:::Admin Task Right Page:::"+RoleID);
String User_Type_Id = (String)session.getAttribute("User_Type_Id");
System.out.println("User_Type_Id:::Admin_Manage_RolesTask_Mapping right Page:::"+User_Type_Id);
if(User_Type_Id == null)
 	{
 	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
session.setAttribute( "RoleID", RoleID );
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
     function chkBoxCHK(val)
     {
     var parentChkboxCHK = document.getElementById("UUTM"+val).checked;
     var chdCount = document.getElementById("counterForChdEdit"+val).value;
	     if(parentChkboxCHK  == false)
	     {
		     for(var i =1; i < chdCount ; i++ )
		     {
		     	document.getElementById("UTTM"+val+"Chd"+i).checked = false;
		     	document.getElementById("UTTM"+val+"Chd"+i).disabled = true;
		     }
		     
		 }
		 if(parentChkboxCHK  == true)
	     {
		     for(var j =1; j < chdCount ; j++ )
		     {
		     	var childChkboxCHK = document.getElementById("UTTMTF"+val+"Chd"+j).value;
		     	document.getElementById("UTTM"+val+"Chd"+j).disabled = false;
		     	if(childChkboxCHK == "true")
		     	{
		     	document.getElementById("UTTM"+val+"Chd"+j).checked = true;
		     	}
		     }
		}
     }
     function enableOldViewEdit()
	   {
			 document.getElementById('editpartButtonDisp').style.display="none";
			 document.getElementById('ChkBoxEdit').style.display="none";
		     document.getElementById('ChkBoxDISP').style.display="";
			 document.getElementById('RoleNameValueDISP').style.display="";
			 document.getElementById('AddEditDelete').style.display="";
	  }
	
	 function enableOldViewAdd()
	 {
			
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('EnterRoleNameADD').style.display="none";
			document.getElementById('RoleNameADD').style.display="none";
			document.getElementById('RoleNameValueDISP').style.display="";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('RoleNameDISP').style.display="";
			document.getElementById('RoleStatusSlctnADD').style.display="none";
	}
    function deleteuser()
     {
			document.getElementById('AddEditDelete').style.display="none";
			document.getElementById('deletesubmit').style.display="";
			document.getElementById('ProgramTypeDISP').style.display="";
			document.getElementById('RoleNameValueDISP').style.display="";
			document.getElementById('hrmsProgramNameDISP').style.display="";
			document.getElementById('ProgramTypeValueDISP').style.display="";
			document.getElementById('HRMSProgramValueDISP').style.display="";
			document.getElementById('ProgramNameDISP').style.display="";
			document.getElementById('EnterRoleNameADD').style.display="none";
			document.getElementById('SelecthrmsSubProgramNameDISP').style.display="none";
			document.getElementById('SelectSubPgrmDDL').style.display="none";
			document.getElementById('hrmsSubProgramNameDISP').style.display="";
			document.getElementById('HRMSSubProgramValueDISP').style.display="";
			document.getElementById('SelecthrmsProgramNameDISP').style.display="none";
			document.getElementById('SelectProgramDDL').style.display="none";
			document.getElementById('RoleNameADD').style.display="none";
			document.getElementById('SelectProgramTypeDISP').style.display="none";
			document.getElementById('PrgrmTypSlctnADD').style.display="none";
			document.getElementById('SelectRoleStatusDISP').style.display="none";
			document.getElementById('RoleStatusSlctnADD').style.display="none";
			alert("Are you sure you want to Delete the program ??");
     }
	 
      function edituser()
	     {
		  document.getElementById('ActionType').value=2;
		  document.getElementById('editpartButtonDisp').style.display="";
		  document.getElementById('ChkBoxEdit').style.display="";
		  document.getElementById('ChkBoxDISP').style.display="none";
		  document.getElementById('EnterRoleNameADD').style.display="none";
		  document.getElementById('AddEditDelete').style.display="none";
		  //document.getElementById('RoleStatusDISPTXT').style.display="none";
		  document.getElementById('RoleNameADD').style.display="none";
		  //document.getElementById('RoleStatusSelectionedit').style.display="";
		 }
  
	  function submitEditUser()
	  {
		  if ((AdminForm.RoleStatusSelelction[0].checked == false)&& (AdminForm.RoleStatusSelelction[1].checked == false))
			  {
			  alert("Please Check atleast One Field ");
			  return false;
			  }
	  } 
  
	  function AddUser()
	  {
		  document.getElementById('ActionType').value=1;
		  document.getElementById('RoleNameDISP').style.display="none";
		  document.getElementById('RoleNameValueDISP').style.display="none";
		  document.getElementById('EnterRoleNameADD').style.display="";
		  document.getElementById('RoleNameADD').style.display="";
		  document.getElementById('AddEditDelete').style.display="none";
		  //document.getElementById('RoleStatusDISPTXT').style.display="none";
		  //document.getElementById('RoleStatusSelectionedit').style.display="none";
		  document.getElementById('editpartButtonDisp').style.display="none";
		  document.getElementById('addpartButtonDisp').style.display="";
		   document.getElementById('RoleStatusSlctnADD').style.display="";
	 }
  
	  function ValidationAddedUser()
	  {
        if(document.getElementById("RoleNameValADD").value=='Role Description')
			{
				var appStr = 'Please Enter Role Description !';		
				alert(appStr);
				document.getElementById('RoleNameValADD').focus();
				return false;
			}
		else if(document.getElementById("RoleNameValADD").value.trim() == "")
		    {
		        var appStr = 'Please Enter Role Description !';		
				alert(appStr);
				document.getElementById('RoleNameValADD').focus();
				return false;
		    }
	    if ((AdminForm.RoleStatusSelelctionAdd[0].checked == false)&& (AdminForm.RoleStatusSelelctionAdd[1].checked == false))
	        {
	             alert("Please Check Task Status !");
	             return false;
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
  <form action="<%=recruitPath%>jsp/Admin_Manage_RolesTask_Mapping_UpdateSubmit.jsp" name="AdminForm" id="AdminForm"  method="post"  accept-charset="utf-8">
    <%
      try
      {
      Connection connection=ConnectDatabase.getConnection();	
      String IsActive = "";
	  int status = 0;
	  String roleDescription = null;
      String query="select * from user_type_master where User_Type_Id ='" + RoleID + "'";
      Statement stmt=connection.createStatement();
      ResultSet rs=stmt.executeQuery(query);
      if(rs.next())
	  	   {
	  	    
	  		roleDescription=rs.getString("User_Type_Description");
	  		System.out.println("roleDescription:::::"+roleDescription);
	  		status=rs.getInt("Is_Active");
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
						<td align="left" class="allBackColor" id="RoleNameDISP" style="background-color: #d8d8d8;">Role Description</td>
						<td align="left" class="allBackColor" id="EnterRoleNameADD" style="background-color: #d8d8d8;display: none;">Enter Role Description</td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="350px">
					<tr>
					  <td align="left" class="allBackColor" id="RoleNameValueDISP"><b><%=roleDescription %></b>&nbsp;</td>
					  <!-- <td align="left" class="allBackColor" id="TaskNameEdit" style="display: none;">
					  		<input type="text" name="ProgramNameVal" id="ProgramNameVal"  style="border-color: #41383C;" size="25" maxlength="50" onkeypress="return AllowChars(event);" title="Enter the Role Description" oncopy="return false" onpaste="return false" oncut="return false" value="<%=roleDescription %>">
					  </td> -->
					  <td align="left" class="allBackColor" id="RoleNameADD" style="display: none;">
					  		<input type="text" name="RoleNameValADD" id="RoleNameValADD"  style="border-color: #41383C;" size="25" maxlength="50" onkeypress="return AllowChars(event);" title="Enter the Task Name"  class="wmta" onblur="Blur(this.id,'Role Description')" onfocus="Focus(this.id,'Role Description')" value="Role Description" oncopy="return false" onpaste="return false" oncut="return false">
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
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="RoleStatusDISP">Role Status </td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="SelectRoleStatusDISP">Select Role Status </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor" id="RoleStatusDISPTXT">
					 	 <b><%=IsActive %></b>
					  </td>
					  
					   <td align="left" class="allBackColor" id="RoleStatusSlctnADD" style="display: none;">
					  		<input type="radio" name="RoleStatusSelelctionAdd" id="RoleStatusSelelctionAdd" value="1">Active
					  		<input type="radio" name="RoleStatusSelelctionAdd" id="RoleStatusSelelctionAdd" value="0">In Active
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr id="ChkBoxDISP">
		    <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		    	 Mapped to :
		    </td>
		    <td align="left" class="allBackColor">
		    	<%
		    	int i = 1;
		    	String TaskDescription = "";
		    	int taskID = 0;
		    	String QuerychkBoxDISP= "select distinct(tm.Task_Id),tm.Task_Description from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = '"+RoleID+"' order by tm.Task_Id";
				System.out.println("Check Box DISP Query:: "+QuerychkBoxDISP);
				ResultSet ChkBoxDISP = stmt.executeQuery(QuerychkBoxDISP);
				while(ChkBoxDISP.next())
				{
				TaskDescription = 	ChkBoxDISP.getString("tm.Task_Description");
				taskID = ChkBoxDISP.getInt("tm.Task_Id");
					%>
						 <div>
						 <%=i %>. <b><%=TaskDescription %></b>
						 </div>
						 <%
						 	int i1 = 1;
						 	String TaskDescriptionChd = "";
						 	String QuerychkBoxDISPChd= "select distinct(tm.Task_Id),tm.Task_Description from task_master tm,user_type_task_mapping uttm where uttm.task_id= tm.task_id and uttm.user_type_id = '"+RoleID+"' and tm.pareent_task_id = "+taskID+"";
							System.out.println("QuerychkBoxDISPChd:: "+QuerychkBoxDISPChd);
							Statement stmtChd = connection.createStatement();
							ResultSet ChkBoxDISPChd = stmtChd.executeQuery(QuerychkBoxDISPChd);
							while(ChkBoxDISPChd.next())
							{
							TaskDescriptionChd = ChkBoxDISPChd.getString("tm.Task_Description");
								%>
								<div style="padding-left: 20;"><img src="<%=recruitPath%>images/bullet4.gif" alt="image" />  <%=TaskDescriptionChd %></div>
								<%
							i1++;
							}
						 	 %>
					<%
					i++;
				}
				ChkBoxDISP.close();
				System.out.println("i:: "+i);
		    	if(i <= 1)
		    	{
		    	 %>
		    	<div> No mapping available. </div>
		    	<%
		    	}
		    	 %> 
		    </td>
		  </tr>
		   <tr id="ChkBoxEdit" style="display: none;">
		    <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		    	 Mapped to :
		    </td>
		    <td align="left" class="allBackColor">
		    	<%
		    	int j = 1;
		    	String TaskDescriptionedit = "";
		    	int TaskId = 0;
		    	ResultSet ChkBoxDISPEdit = null;
		    	ResultSet ChkBoxDISPEdit1 = null;
		    	int checkedState = 0;
		    	String QuerychkBoxDISPedit= "select distinct(tbl_der.task_id),tbl_der.task_description from (select tm.task_id,tm.task_description,tm.Pareent_Task_Id,tm.Is_Active,uttm.user_type_id from task_master tm left join user_type_task_mapping uttm on tm.task_id = uttm.task_id where  tm.Is_Active = 1 and (uttm.task_id is null or uttm.user_type_id not in('"+User_Type_Id+"'))) tbl_der  where  Pareent_Task_Id = 0";
				System.out.println("QuerychkBoxDISPedit:: "+QuerychkBoxDISPedit);
				ChkBoxDISPEdit = stmt.executeQuery(QuerychkBoxDISPedit);
					while(ChkBoxDISPEdit.next())
						{
						TaskDescriptionedit = ChkBoxDISPEdit.getString("task_description");
						TaskId = ChkBoxDISPEdit.getInt("task_id");
						String QrychkBoxDISPedit1 = "select Task_id from user_type_task_mapping where user_type_id = '"+RoleID+"' and task_id = "+TaskId+"";
						System.out.println("QrychkBoxDISPedit1:: "+QrychkBoxDISPedit1);
						Statement stmts = connection.createStatement();
						ChkBoxDISPEdit1 = stmts.executeQuery(QrychkBoxDISPedit1);
						System.out.println("ChkBoxDISP1:: "+ChkBoxDISPEdit1);
							if(ChkBoxDISPEdit1.next())
							{
							%>
								 <input type="checkbox" name="UUTM<%=j %>" id="UUTM<%=j %>" value="<%=TaskId %>" checked="checked" title="Select Field" onclick="return chkBoxCHK(<%=j %>);"><b><%=TaskDescriptionedit %></b><br/>
							     <input type="hidden" name="UUTMHdd<%=j %>" id="UUTMHdd<%=j %>" value="<%=TaskId %>">
							<%
							checkedState = 1;
							}
							else
							{
							%>
							<input type="checkbox" name="UUTM<%=j %>" id="UUTM<%=j %>" value="<%=TaskId %>"  title="Select Field" onclick="return chkBoxCHK(<%=j %>);"><b><%=TaskDescriptionedit %></b><br/>
							<input type="hidden" name="UUTMHdd<%=j %>" id="UUTMHdd<%=j %>" value="">
							<%
							checkedState = 0;
							}
							%>
								<div style="padding-left: 20px;"> 
								<%
								int TaskIdChd=0;
								int j1 = 1;
								String TaskDescriptioneditChd = "";
								String QrychkBoxchild = "select distinct(tbl_der.task_id),tbl_der.task_description from (select tm.task_id,tm.task_description,tm.Pareent_Task_Id,tm.Is_Active,uttm.user_type_id from task_master tm left join user_type_task_mapping uttm on tm.task_id = uttm.task_id where  tm.Is_Active = 1 and (uttm.task_id is null or uttm.user_type_id not in('"+User_Type_Id+"'))) tbl_der  where  Pareent_Task_Id = '"+TaskId+"'";
								System.out.println("QrychkBoxchild:: "+QrychkBoxchild); 
								Statement stmtschild = connection.createStatement();
								ResultSet rsChild = stmtschild.executeQuery(QrychkBoxchild);
								while(rsChild.next())
						         {
						         System.out.println("checkedState:: "+checkedState); 
						         TaskIdChd = rsChild.getInt("Task_id");
						         TaskDescriptioneditChd = rsChild.getString("Task_Description");
						         String QrychkBoxchild1 = "select Task_id from user_type_task_mapping where user_type_id = '"+RoleID+"' and task_id = "+TaskIdChd+"";
								 System.out.println("QrychkBoxchild1:: "+QrychkBoxchild1); 
								 Statement stmtschild1 = connection.createStatement();
								 ResultSet rsChild1 = stmtschild1.executeQuery(QrychkBoxchild1);
								 if(rsChild1.next())
								 {
								 	if(checkedState == 1)
								 	{
								  %>
									<input type="checkbox" name="UTTM<%=j %>Chd<%=j1 %>" id="UTTM<%=j %>Chd<%=j1 %>" value="<%=TaskIdChd %>" checked="checked" title="Select Field"><%=TaskDescriptioneditChd %><br/>
									<%
									}
									else
									{
								 	%>
								 	<input type="checkbox" name="UTTM<%=j %>Chd<%=j1 %>" id="UTTM<%=j %>Chd<%=j1 %>" value="<%=TaskIdChd %>" checked="checked" title="Select Field" disabled="disabled"><%=TaskDescriptioneditChd %><br/>
									<%
									}
									 %>
									<input type="hidden" name="UTTMHdd<%=j %>Chd<%=j1 %>" id="UTTMHdd<%=j %>Chd<%=j1 %>" value="<%=TaskIdChd %>">
									<input type="hidden" name="UTTMTF<%=j %>Chd<%=j1 %>" id="UTTMTF<%=j %>Chd<%=j1 %>" value="true">
								<%
								}
								else
								{
									if(checkedState == 1)
							 		{
								    %>
										<input type="checkbox" name="UTTM<%=j %>Chd<%=j1 %>" id="UTTM<%=j %>Chd<%=j1 %>" value="<%=TaskIdChd %>"  title="Select Field"><%=TaskDescriptioneditChd %><br/>
									<%
									}
									else
									{
									 %>
									 	<input type="checkbox" name="UTTM<%=j %>Chd<%=j1 %>" id="UTTM<%=j %>Chd<%=j1 %>" value="<%=TaskIdChd %>"  title="Select Field" disabled="disabled"><%=TaskDescriptioneditChd %><br/>
									 <%
									 }
									  %>
									<input type="hidden" name="UTTMHdd<%=j %>Chd<%=j1 %>" id="UTTMHdd<%=j %>Chd<%=j1 %>" value="">
									<input type="hidden" name="UTTMTF<%=j %>Chd<%=j1 %>" id="UTTMTF<%=j %>Chd<%=j1 %>" value="false">
								<%
								}
								j1++;
								 }
								 %>
								 	<input type="hidden" id="counterForChdEdit<%=j%>" name="counterForChdEdit<%=j%>" value="<%=j1 %>">	
								</div>
						<%
						j++;
						}
				%>
		    	<input type="hidden" id="counterForChkEdit" name="counterForChkEdit" value="<%=j %>"> 
		    </td>
		  </tr>
		    <!--**********End of  Radio Button for Program Status Field ************-->
		    <tr>
            <td colspan="2" align="center" id="AddEditDelete">   
            	<!-- <input type="button" name="submitadd" id="submitadd" value="Add" class="buttonSmall" onclick="javascript:AddUser();"/>&nbsp;&nbsp; -->
            	<input type="button" name="submitedit" id="submitedit" value="Edit" class="buttonSmall" onclick="javascript:edituser();"/>&nbsp;&nbsp;
            	<input type="hidden" name="ActionType" id="ActionType" value="" />
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
				//rs.close();
				//stmt.close();
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
