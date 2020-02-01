<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="util.GenerateCCA"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String USER_Name =(String)session.getAttribute("USER_Name");
System.out.println("USER_Name::::::CCA Right Page"+USER_Name);
String EmpUserId = (String) request.getParameter("EmpUserId");
if(EmpUserId==null)
{
EmpUserId="";
}
System.out.println("UserId::::::CCA Right Page"+EmpUserId);
int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
if(USER_AUTOID == 0)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
System.out.println("USER_AUTOID home page::::"+USER_AUTOID);
String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
if(IsSAdmin == null)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
session.setAttribute("IsSAdmin",IsSAdmin);
System.out.println("IsSAdmin in home page::::"+IsSAdmin);
session.setAttribute( "EmpUserId", EmpUserId );
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


  
   <!-- Email Id validation  -->
   <script type="text/javascript">
function validate(CCAForm,Email_id) 
{ 
   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
   var address = document.forms[CCAForm].elements[Email_id].value;
   if(reg.test(address) == false) 
   { 
       alert('Please Enter Valid Email Id !'); 
       document.getElementById('employeeemailid').value = "";
       document.getElementById('employeeemailid').focus();     
       return false;
   }
   return true;
}
  </script>
   
    

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
	
	<!-- Java script for Char Validation -->
	<script type="text/javascript">
	 <%
			if(USER_Name == null)
	 			{
		%>
			parent.location.href="<%=logoutPage%>";
		<%
			}
		%>
	
	function AllowChars(evt)
	{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	      // alert(charCode);
	if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) {
				return true;
	}
	else
	{
	alert("Invalid character entered !!");
	return false;
	}
	}     
	 function chkBoxCHKLND(val)
     {
     	var parentChkboxLNDCHK = document.getElementById("UUTLNDEdit"+val).checked;
	    var chdLNDCount = document.getElementById("LNDCountValue"+val).value;
	     if(parentChkboxLNDCHK  == false)
		     {
			   for(var i = 1; i < chdLNDCount ; i++ )
			     {
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxLNDCHK  == true)
		     {
			     for(var j =1; j < chdLNDCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTLNDHdd"+val+"Chd"+j).value;
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
	   }
   </script>
   
  <script type="text/javascript">
	 
	 function enableOldViewEdit()
	    {
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('deleteCommentsDISP').style.display="none"; 
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('SelectUserType').style.display="none";
			document.getElementById('UserStateRadioDISP').style.display="none";
			document.getElementById('LNDCHKDISP').style.display="none";
			document.getElementById('employeeAlertsDISP').style.display="none";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('LNDLabelDISP').style.display="";
			document.getElementById('EmployeeIdDISP').style.display="";
			document.getElementById('EmployeeIdValueDISP').style.display="";
			document.getElementById('EmployeeNameDISP').style.display="";
			document.getElementById('EmployeeNameValueDISP').style.display="";
			document.getElementById('usertypesname').style.display="";
			document.getElementById('LocationDISP').style.display="";
			document.getElementById('emailidDISP').style.display=""; 
			document.getElementById('employeephoneDISP').style.display="";
			document.getElementById('EmployeeAlertDISP').style.display="";
			document.getElementById('employeeAlertsDISPTXT').style.display="";
			document.getElementById('UserStateDISP').style.display="";
			document.getElementById('UserStateDISPTXT').style.display="";
			document.getElementById('UserAccessDISP').style.display="";
			if(document.getElementById('UserTypeIdInitial').value == 3)
			{
				document.getElementById('OpsPrgmAcssDISP').style.display="";
			}
	 }
	 function enableOldViewDelete()
	 {
		 document.getElementById('AddEditDelete').style.display="";
		 document.getElementById('editpartButtonDisp').style.display="none";
		 document.getElementById('deletepartButtonDisp').style.display="none";
		 document.getElementById('deleteCommentsDISP').style.display="none"; 
		 document.getElementById('deletepartButtonDisp').style.display="none";
	 }
	 function enableOldViewAdd()
	 {
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('deleteCommentsDISP').style.display="none"; 
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('SelectProgramDISP').style.display="none";
			document.getElementById('SelectProgramDDL').style.display="none";
			document.getElementById('SelectSubPgrmDISP').style.display="none";
			document.getElementById('SelectSubPgrmDDL').style.display="none";
			document.getElementById('EmployeeNameAddDISP').style.display="none";
			document.getElementById('EmployeeIdAddDISP').style.display="none";
			document.getElementById('emailidAdd').style.display="none";
			document.getElementById('employeephoneAdd').style.display="none";
			document.getElementById('EmployeeIdAddValueDISP').style.display="none";
			document.getElementById('locationAdd').style.display="none";
			document.getElementById('usertypesADDUser').style.display="none";
			document.getElementById('SelectUserType').style.display="none";
			document.getElementById('LNDCHKDISPADDUser').style.display="none";
			document.getElementById('EmployeeSelectAlrtsDISP').style.display="none";
			document.getElementById('UserStateSelectDISP').style.display="none";
			document.getElementById('employeeAlertsAdd').style.display="none";
			document.getElementById('UserStateAdd').style.display="none";
			document.getElementById('EmployeeEnterPhoneDISP').style.display="none";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('EmployeeIdDISP').style.display="";
			document.getElementById('EmployeeIdValueDISP').style.display="";
			document.getElementById('EmployeeNameDISP').style.display="";
			document.getElementById('EmployeeNameValueDISP').style.display="";
			document.getElementById('usertypesname').style.display="";
			document.getElementById('LocationDISP').style.display="";
			document.getElementById('emailidDISP').style.display=""; 
			document.getElementById('employeephoneDISP').style.display="";
			document.getElementById('EmployeePhoneDISP').style.display="";
			document.getElementById('EmployeeAlertDISP').style.display="";
			document.getElementById('employeeAlertsDISP').style.display="none";
			document.getElementById('employeeAlertsDISPTXT').style.display="";
			document.getElementById('UserStateDISP').style.display="";
			document.getElementById('UserStateDISPTXT').style.display="";
			document.getElementById('UserAccessDISP').style.display="";
			document.getElementById('LNDLabelDISP').style.display="";
			if(document.getElementById('UserTypeIdInitial').value == 3)
			{
				document.getElementById('OpsPrgmAcssDISP').style.display="";
			}
	 }
	 function deleteuser()
	   {
		 document.getElementById('usertypesname').style.display="none";
		 document.getElementById('deleteCommentsDISP').style.display="";
		 document.getElementById('AddEditDelete').style.display="none";
		 document.getElementById('deletepartButtonDisp').style.display="";
		 alert("Are you sure you want to delete this User ??");
	 
	  }
	 function resetPW()
	  {
	  	document.getElementById('ActionType').value = 4;
	  	document.getElementById('AddEditDelete').style.display="none";
	  	if(confirm('Are you sure you want reset the password.Please click "OK" to reset User, else "cancel".'))
		   {
			document.getElementById("processing").style.display="";
		    return true;
		  }
		else
		  {
			return false;
		 }   
	  }
	 function submitdeleteUser()
	  {
		var deletecoments = document.getElementById("deleteCommentstxt").value;
		if(deletecoments =='Enter Delete Reason')
			{
			    var appStr = 'Please Enter the reason for deleting the user !';		
				alert(appStr);
				document.getElementById('deleteCommentstxt').focus();
				return false;
			}
		
		else if(deletecoments.trim() == "")
		{
		    var appStr = 'Please Enter the reason for deleting the user !';		
			alert(appStr);
			document.getElementById('deleteCommentstxt').focus();
			return false;
		}
		if(confirm('Are you sure you want Delete the User.Please click "OK" to delete User, else "cancel".'))
		   {
			var deleteComments= document.getElementById('deleteCommentstxt').value; 
			var UserTypeIdInitial = document.getElementById('UserTypeIdInitial').value; 
			var empid = document.getElementById('Empid').value; 
			location.href = "<%=recruitPath%>jsp/Manage_CCA_ResourceSubmit.jsp?ActionType=3&empid="+empid+"&UserTypeIdInitial="+UserTypeIdInitial+"&deleteComments="+deleteComments;
		    document.getElementById('deletepartButtonDisp').style.display = "none";
            document.getElementById("processing").style.display="";
		    return true;
		  }
		else
		  {
			return false;
		 }   
	  }
    function edituser()
     {
	  ShowChkBox();
	  document.getElementById('ActionType').value=2;
	  document.getElementById('usertypesname').style.display="";
	  document.getElementById('submit').style.display="";
	  document.getElementById('editpartButtonDisp').style.display="";
	  document.getElementById('AddEditDelete').style.display="none";
	  document.getElementById('SelectUserType').style.display="";
	  document.getElementById('LNDLabelDISP').style.display="none";
	  document.getElementById('employeeAlertsDISP').style.display="";
	  document.getElementById('employeeAlertsDISPTXT').style.display="none";
	  document.getElementById('UserStateRadioDISP').style.display="";
	  document.getElementById('UserStateDISPTXT').style.display="none";
    }
  
  
  function submitEditUser()
  {
  
  document.getElementById('editpartButtonDisp').style.display = "none";
  document.getElementById("processing").style.display="";
  } 
  
  function AddUser()
  {
  document.getElementById('ActionType').value=1;
  document.getElementById('UserAccessDISP').style.display="";
  document.getElementById('LNDLabelDISP').style.display="none";
  document.getElementById('AddEditDelete').style.display="none";
  document.getElementById('submit').style.display="none";
  document.getElementById('finalsubmit').style.display="";
  document.getElementById('editpartButtonDisp').style.display="none";
  document.getElementById('addpartButtonDisp').style.display="";
  document.getElementById('employeeAlertsAdd').style.display="";
  document.getElementById('UserStateAdd').style.display="";
  document.getElementById('employeeAlertsDISP').style.display="none";
  document.getElementById('employeeAlertsDISPTXT').style.display="none";
  document.getElementById('UserStateDISPTXT').style.display="none";
  document.getElementById('EmployeeIdDISP').style.display="none";
  document.getElementById('EmployeeIdValueDISP').style.display="none";
  document.getElementById('SelectProgramDDL').style.display="";
  document.getElementById('SelectProgramDISP').style.display="";
  document.getElementById('EmployeeAlertDISP').style.display="none";
  document.getElementById('EmployeeSelectAlrtsDISP').style.display="";
  document.getElementById('UserStateDISP').style.display="none";
  document.getElementById('UserStateSelectDISP').style.display=""; 
  document.getElementById('EmployeeNameDISP').style.display="none";
  document.getElementById('SelectSubPgrmDISP').style.display="";
  document.getElementById('EmployeeNameValueDISP').style.display="none";
  document.getElementById('SelectSubPgrmDDL').style.display="";
  document.getElementById('EmployeeIdAddDISP').style.display="none";
  document.getElementById('EmployeeNameAddDISP').style.display="";
  document.getElementById('usertypesname').style.display="none";
  document.getElementById('emailidDISP').style.display="none"; 
  document.getElementById('emailidAdd').style.display="";
  document.getElementById('employeephoneDISP').style.display="none";
  document.getElementById('employeephoneAdd').style.display="";
  document.getElementById('EmployeeIdAddValueDISP').style.display="";
  document.getElementById('EmployeeNameAddValueDISP').style.display="";
  document.getElementById('LocationDISP').style.display="none";
  document.getElementById('locationAdd').style.display="";
  document.getElementById('EmployeePhoneDISP').style.display="none";
  document.getElementById('EmployeeEnterPhoneDISP').style.display="";
  document.getElementById('usertypesADDUser').style.display="";
  document.getElementById('SelectUserType').style.display="";
  document.getElementById('LNDCHKDISPADDUser').style.display="";
  document.getElementById('LNDCHKDISP').style.display="none";
  
  }
  function ValidationAddedUser()
  {
        
		var EmpName = document.getElementById("employeename").value;
		if(EmpName == 'Enter Employee Name')
			{
				alert("Please Enter Employee Name. !");
				document.getElementById('employeename').focus();
				return false;
			}
		else if(EmpName.trim() == "")
		{
		alert("Please Enter Employee Name. !");
				document.getElementById('employeename').focus();
				return false;
		}	
		var Email = document.getElementById("employeeemailid").value;
		 if(Email == 'Enter Email Id')
			{
				alert("Please Enter Email Id. !");
				document.getElementById('employeeemailid').focus();
				return false;
			}
			else if(Email.trim() == "")
		   {
		   		alert("Please Enter Email Id. !");
				document.getElementById('employeeemailid').focus();
				return false;
	       }
           
           var phone = document.getElementById("employeephone").value;
          if(phone == 'Enter Mobile No.')
			{
				alert("Please Enter Mobile No. !");
				document.getElementById('employeephone').focus();
				return false;
			}
         else if(phone.trim() == "")
			{
				alert("Please Enter Mobile No. !");
				document.getElementById('employeephone').focus();
				return false;
			}
		else if((phone.trim()).length < 10)
			{
				alert("Please Enter 10 digit Mobile No. !");
				document.getElementById('employeephone').focus();
				return false;
			}
           if ((CCAForm.AlertsRequiredAdd[0].checked == false)&& (CCAForm.AlertsRequiredAdd[1].checked == false))
              {
              alert("Please Check atleast One Field ");
              return false;
           }  
           if ((CCAForm.UserStateAdd[0].checked == false)&& (CCAForm.UserStateAdd[1].checked == false))
              {
              alert("Please Check atleast One Field ");
              return false;
           }  
        if(confirm('User-Id and Password will be sent to the mentioned Email and Mobile No.Please click "OK" to continue, else "cancel".'))
		   {
	         document.getElementById('addpartButtonDisp').style.display = "none";
	         document.getElementById("processing").style.display="";
	         return true;
         }
         else
         {
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
<script type="text/javascript">
function ShowChkBox()
  {
document.getElementById('UserAccessDISP').style.display="";
     if(CCAForm.UserTypesId.value == 2) 
            { 
             document.getElementById('LNDCHKDISP').style.display=""; 
            }
   }

</script>
  </head>
  
  <body>
  <form action="<%=recruitPath%>jsp/Manage_CCA_ResourceSubmit.jsp" name="CCAForm" id="CCAForm"  method="post"  accept-charset="utf-8">
    <%
      try
      {
      String query="select * from user_master where Emp_ID='" + EmpUserId + "'";
      System.out.println("query:::::"+query);
      Connection connection=ConnectDatabase.getConnection();		
      Statement stmt=connection.createStatement();
      ResultSet rs=stmt.executeQuery(query);
      String EmpName=null;
      String EmpId=null;
      String EmpEmail=null;
  	  String EmpPhone=null;
  	  String LocationName=null;
  	  String UserTypename=null;
  	  String UserTypeId=null;
  	  String IsActive=null;
  	  int SendAlerts=0;
  	  int EmpUserAutoId=0;
  	  int location=0;
  	  int programId=0;
  	  int subprogramId = 0;
  	if(rs.next())
  	   {
  	    EmpUserAutoId=rs.getInt("User_Id");
  		session.setAttribute("EmpUserAutoId",EmpUserAutoId);
  		EmpName=rs.getString("Emp_Name");
  		session.setAttribute("EmployeeName",EmpName);
  		System.out.println("Emp_Name"+EmpName);
  		EmpId=rs.getString("Emp_ID");
  		System.out.println("EmpId"+EmpId);
  		location=rs.getInt("Centre_Id");
  		programId=rs.getInt("Program_Id");
  		subprogramId=rs.getInt("SubProgram_Id");
  		EmpEmail=rs.getString("Emp_email");
  		session.setAttribute("EmpEmail",EmpEmail);
  		SendAlerts=rs.getInt("SendAlerts");
  		EmpPhone=rs.getString("Emp_Mobile_No");
  		session.setAttribute("EmpPhone",EmpPhone);
  		UserTypeId=rs.getString("User_Type_Id");
  		System.out.println("UserTypeId::::"+UserTypeId);
  		IsActive=rs.getString("Is_Active");
  		String Querycentre="select Centre_Name from centre_master where Centre_Id='" + location + "'";
        Statement stmtcentre=connection.createStatement();
        ResultSet rscentre=stmtcentre.executeQuery(Querycentre);
        if(rscentre.next())
        {
        LocationName=rscentre.getString("Centre_Name").trim();
        }
  		
        String Querytype="select User_Type_Description from user_type_master where User_Type_ID='" + UserTypeId + "'";
        Statement stmttype=connection.createStatement();
        ResultSet rstype=stmttype.executeQuery(Querytype);
        if(rstype.next())
        {
        UserTypename=rstype.getString("User_Type_Description").trim();
        }
  		%>
	<table border="0" cellpadding="6" cellspacing="6" width="550px">
        <tr style="display: none;" id="EmployeeIdAddDISP">
         <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr >
					<td align="left" class="allBackColor" id="EmployeeIdAddDISP" style="background-color: #d8d8d8;">Employee Id </td>
				</tr>
			</table>
           </td>
             <td align="left" class="allBackColor">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
				  <td align="left" class="allBackColor" id="EmployeeIdAddValueDISP" style="display: none;">
				  <input type="text" name="employeeid" id="employeeid" style="border: #F8F8F8;background: #F8F8F8;color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;font-weight: bold" readonly="readonly" value="">
				  </td>
				</tr>
			</table>
		  </td>
	   </tr>
	   <tr style="display: none;" id="EmployeeNameAddDISP">
         <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr >
					<td align="left" class="allBackColor" id="EmployeeNameAddDISP" style="background-color: #d8d8d8;">Employee Name </td>
				</tr>
			</table>
           </td>
             <td align="left" class="allBackColor">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
				  <td align="left" class="allBackColor" id="EmployeeNameAddValueDISP" style="display: none;">
				    <input type="text" id="employeename" name="employeename"  title="Enter Employee Name" class="wmta" onblur="Blur(this.id,'Enter Employee Name')"  onfocus="Focus(this.id,'Enter Employee Name')" value="Enter Employee Name" maxlength="150" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);">
				  </td>
				</tr>
			</table>
		  </td>
	   </tr>
	   
       <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="120px">
					<tr>
						<td align="left" class="allBackColor" id="EmployeeIdDISP" style="background-color: #d8d8d8;">Employee Id </td>
					    <td align="left" class="allBackColor" id="SelectProgramDISP" style="background-color: #d8d8d8;display: none;">Program </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="430px">
					<tr>
					  <td align="left" class="allBackColor" id="EmployeeIdValueDISP"><b><%=EmpId %></b>&nbsp;</td>
					 <td align="left" class="allBackColor" id="SelectProgramDDL" style="display: none;">
					       <%
							    String ProgramName = "";
							    String secQsnQry = "select ProgramName from mstprogram where ProgramId = "+programId+"";
								System.out.println("query " + secQsnQry);
								Statement stmtprogram = connection.createStatement();
								ResultSet rsprogram = stmtprogram.executeQuery(secQsnQry);
								if (rsprogram.next()) 
								{
									ProgramName = rsprogram.getString("ProgramName");
								}
							%>
							<%= ProgramName%>
					  </td>
					</tr>
				</table>
			  </td>
		  </tr> 
       <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" id="EmployeeNameDISP" style="background-color: #d8d8d8;">Employee Name </td>
						<td align="left" class="allBackColor" id="SelectSubPgrmDISP" style="background-color: #d8d8d8;display: none;">Sub-Program </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="EmployeeNameValueDISP"><b><%=EmpName %></b>&nbsp;</td>
					   <td align="left" class="allBackColor" id="SelectSubPgrmDDL" style="display: none;">
							   <%
							    String subProgramName = "";
							    String secsubQry = "select SubProgramName from mstsubprogram where ProgramId = "+programId+"";
								System.out.println("query " + secQsnQry);
								Statement stmtsubprogram = connection.createStatement();
								ResultSet rssubprogram = stmtsubprogram.executeQuery(secsubQry);
								if (rssubprogram.next()) 
								{
									subProgramName = rssubprogram.getString("SubProgramName");
								}
							 %>
							 <%=subProgramName %>
					   </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  
		  
		  <tr id="SelectUserType" style="display: none;">
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">User Type </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr id="usertypesname" style="display: none;">
					  <td align="left" class="allBackColor">
					        <input type="hidden" name="UserTypesId" id="UserTypesId" value="<%=UserTypeId %>">
					         <%
							    String userTypeDescription = "";
							    String secQsnQrytypes = "select User_Type_Description from user_type_master where Is_Active = 1 and User_Type_ID = '"+UserTypeId+"'";
								System.out.println("query " + secQsnQrytypes);
								Statement stmttypes = connection.createStatement();
								ResultSet rstypes = stmttypes.executeQuery(secQsnQrytypes);
								if (rstypes.next()) 
								{
								 userTypeDescription = rstypes.getString("User_Type_Description");
					            }
					            rstypes.close();
					            stmttypes.close();
					         %>
					        <b> <%= userTypeDescription%> </b>
					  </td>
					</tr>
					<tr id="usertypesADDUser" style="display: none;">
					  <td align="left" class="allBackColor">
							  <%
							    String userTypeDescriptionAdd = "";
							    String secQsnQrytypesAdd = "select User_Type_Description from user_type_master where Is_Active = 1 and User_Type_ID = '"+UserTypeId+"'";
								System.out.println("query " + secQsnQrytypes);
								Statement stmttypesAdd = connection.createStatement();
								ResultSet rstypesAdd = stmttypesAdd.executeQuery(secQsnQrytypesAdd);
								if (rstypesAdd.next()) 
								{
								 userTypeDescriptionAdd = rstypesAdd.getString("User_Type_Description");
					            }
					            rstypesAdd.close();
					            stmttypesAdd.close();
					         %>
					         <%= userTypeDescriptionAdd%>
					  </td>
					</tr>
					
				</table>
			  </td>
		  </tr>
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Location </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="LocationDISP"><b><%=LocationName %></b>&nbsp;</td>
					  <td align="left" class="allBackColor" id="locationAdd" style="display: none;">
					    <input type="text" name="employeeLocation" id="employeeLocation" class="allBackColor" style="border: #F8F8F8;background: #F8F8F8;width: 100%" readonly="readonly" value="<%=LocationName %>">
					 </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">Employee Email-Id </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="emailidDISP"><b><%=EmpEmail %></b>&nbsp;
					  </td>
					  <td align="left" class="allBackColor" id="emailidAdd" style="display: none;">
					   <input type="text" name="employeeemailid" id="employeeemailid" size="35"  maxlength="240" onchange="javascript:return validate('CCAForm','employeeemailid');" oncopy="return false" onpaste="return false" oncut="return false" title="Enter the Email Id" class="wmta" onblur="Blur(this.id,'Enter Email Id')"  onfocus="Focus(this.id,'Enter Email Id')" value="Enter Email Id">
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="EmployeePhoneDISP">Employee Phone No. </td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="EmployeeEnterPhoneDISP">Employee Mobile No. </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="employeephoneDISP"><b><%=EmpPhone %></b>&nbsp;</td>
					   <td align="left" class="allBackColor" id="employeephoneAdd" style="display: none;">
					  <input type="text" name="employeephone" id="employeephone" maxlength="10" onkeypress="return isNumberKey(event);" title="Enter the Phone Number" oncopy="return false" onpaste="return false" oncut="return false" class="wmta" onblur="Blur(this.id,'Enter Mobile No.')"  onfocus="Focus(this.id,'Enter Mobile No.')" value="Enter Mobile No.">
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  
		  <!--*********** Radio Button for Sending Alerts Field **************-->
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="EmployeeAlertDISP">Alerts Recipient </td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="EmployeeSelectAlrtsDISP">Select Alerts Recipient </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor" id="employeeAlertsDISPTXT">
					  <%if(SendAlerts==1) {%>
					  
					  Yes
					  <%} else { %>
					  No
					  <%} %>
					  </td>
					  
					  <td align="left" class="allBackColor" id="employeeAlertsDISP" style="display: none;">
					  <%if(SendAlerts==1) {%>
					  
					  <input type="radio" name="AlertsRequired" id="AlertsRequired" checked="checked" value="1">Yes
					  <%} else { %>
					   <input type="radio" name="AlertsRequired" id="AlertsRequired" value="1">Yes
					   <%} if(SendAlerts==0){%>
					  <input type="radio" name="AlertsRequired" id="AlertsRequired" checked="checked" value="0">No
					  <%}else { %>
					  <input type="radio" name="AlertsRequired" id="AlertsRequired" value="0">No
					  <%} %>
					  </td>
					   <td align="left" class="allBackColor" id="employeeAlertsAdd" style="display: none;">
					  <input type="radio" name="AlertsRequiredAdd" id="AlertsRequiredAdd" value="1">Yes
					  <input type="radio" name="AlertsRequiredAdd" id="AlertsRequiredAdd" value="0" checked="checked">No
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		    <!--**********End of  Radio Button for Sending Alerts Field ************-->
		    
		  <!--*********** User Active/NonActive state Part **************-->
		  <tr>
          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="UserStateDISP">User Status </td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="UserStateSelectDISP">Select User Status  </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					 <td align="left" class="allBackColor" id="UserStateDISPTXT">
					  <%if(IsActive.equalsIgnoreCase("1")) {%>
					  Enabled
					  <%} else { %>
					  Disabled
					  <%} %>
					  </td>
					  
					  <td align="left" class="allBackColor" id="UserStateRadioDISP" style="display: none;">
					  <%if(IsActive.equalsIgnoreCase("1")) {%>
					  
					  <input type="radio" name="UserState" id="UserState" checked="checked" value="1">Yes
					  <%} else { %>
					   <input type="radio" name="UserState" id="UserState" value="1">Yes
					   <%} if(IsActive.equalsIgnoreCase("0")){%>
					  <input type="radio" name="UserState" id="UserState" checked="checked" value="0">No
					  <%}else { %>
					  <input type="radio" name="UserState" id="UserState" value="0">No
					  <%} %>
					  </td>
					   <td align="left" class="allBackColor" id="UserStateAdd" style="display: none;">
					  <input type="radio" name="UserStateAdd" id="UserStateAdd" value="1" checked="checked">Enable
					  <input type="radio" name="UserStateAdd" id="UserStateAdd" value="0">Disable
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		    <!--**********End of  User  Active/NonActive state Part  ************-->
		    
		    
		    <!-- User Access Display Part::::Header Text --> 
		  <tr id="UserAccessDISP">
	          <td colspan="1" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		            <table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="left" class="allBackColor" style="background-color: #d8d8d8;" >User Access</td>
						</tr>
					</table>
	            </td>
	       <!--**********User Access Initial Text Display  ************-->
	      <td align="left" class="allBackColor" id="LNDLabelDISP" >
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor">
							  <% 
						String LNDUTTMappingIdDISP=null;
						String LNDTaskDescriptionDISP=null;
						int LNDTaskIdDISP=0;
						int kDISP=1;
						String QuerychkBoxLDDISP= "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = '"+UserTypeId+"' and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and uum.user_id = '"+EmpUserAutoId+"' and tm.Is_Active = 1 order by tm.Task_ID";
						System.out.println("User Access Disp:: "+QuerychkBoxLDDISP);
						Statement stmtChkBoxLDDISP=connection.createStatement();
						ResultSet ChkBoxRecLDDISP=stmtChkBoxLDDISP.executeQuery(QuerychkBoxLDDISP);
						while(ChkBoxRecLDDISP.next())
						{
							LNDTaskIdDISP=ChkBoxRecLDDISP.getInt("tm.Task_ID");
							System.out.println("LNDUTTMappingIdDISP:: "+LNDUTTMappingIdDISP);
							LNDUTTMappingIdDISP=ChkBoxRecLDDISP.getString("uttm.UTT_Mapping_Id");
							System.out.println("LNDUTTMappingIdDISP:: "+LNDUTTMappingIdDISP);
							LNDTaskDescriptionDISP =ChkBoxRecLDDISP.getString("tm.Task_Description");
							System.out.println("LNDTaskDescriptionDISP:: "+LNDTaskDescriptionDISP);
						 %> 
							 <div>
							 <%=kDISP %>. <%=LNDTaskDescriptionDISP %>
							 </div>
							 	<%
							 	int kDISP1 = 1;
							 	String TaskDescriptionChd = "";
							 	String QuerychkBoxLDDISPChd= "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = '"+UserTypeId+"' and tm.Pareent_Task_Id = '"+LNDTaskIdDISP+"' and uum.Is_Active=1 and uum.user_id = '"+EmpUserAutoId+"' and tm.Is_Active = 1 order by tm.Task_ID";
								System.out.println("QuerychkBoxDISPChd:: "+QuerychkBoxLDDISPChd);
								Statement stmtChd = connection.createStatement();
								ResultSet ChkBoxRecLDDISPChd = stmtChd.executeQuery(QuerychkBoxLDDISPChd);
								while(ChkBoxRecLDDISPChd.next())
								{
								TaskDescriptionChd = ChkBoxRecLDDISPChd.getString("tm.Task_Description");
									%>
									<div style="padding-left: 20;"><img src="<%=recruitPath%>images/bullet4.gif" alt="image" />  <%=TaskDescriptionChd %></div>
									<%
								kDISP1++;
								}
						 	 %>
						 <%
						 kDISP++;
						 }
						 if(kDISP==1)
						 {
						 %> 
						 <div>
						 No Access Granted
						 </div>
						 <%}
						  %>
					</td>
				</tr>	  
		    </table>
		  </td>
		     <!--**********User Access Initial Text Display  ************-->      
	            
	            
            <!-- Check box For Edit User Field -->
             <!-- L and D part -->
            <td align="left" class="allBackColor" id="LNDCHKDISP" style="display: none;">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor">
						<% 
						String UTTMappingId_LND = null;
						String TaskDescription_LND = null;
						int TaskId_LND = 0;
						int i_LND = 1;
						String QuerychkBox_LND = "";
						if(IsSAdmin.equalsIgnoreCase("Yes"))
						{
							QuerychkBox_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 2 order by tm.Task_Id";
						}
						else
						{
							QuerychkBox_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and  uum.user_id = '"+USER_AUTOID+"' and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 2 order by tm.Task_Id";
						}
						System.out.println("Check Box Selection Edit Query LND:: "+QuerychkBox_LND);
						Statement stmtChkBox_LND=connection.createStatement();
						ResultSet ChkBoxRec_LND=stmtChkBox_LND.executeQuery(QuerychkBox_LND);
						while(ChkBoxRec_LND.next())
							{
								TaskId_LND = ChkBoxRec_LND.getInt("tm.Task_Id");
								System.out.println("TaskId_LND  Edit part:: "+TaskId_LND);
								UTTMappingId_LND = ChkBoxRec_LND.getString("uttm.UTT_Mapping_Id");
								System.out.println("UTTMappingId_LND Edit part:: "+UTTMappingId_LND);
								TaskDescription_LND = ChkBoxRec_LND.getString("tm.Task_Description");
								System.out.println("TaskDescription Edit part::::::::"+TaskDescription_LND);
								String QryTaskMasterRec_LND =  "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 2 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"+TaskId_LND+"' and uum.user_id = '"+EmpUserAutoId+"' and tm.Is_Active = 1 order by tm.Task_ID";
								System.out.println("Tasks master Edit Query LND:: "+QryTaskMasterRec_LND);
								Statement stmtTaskMasterRec_LND=null;
								ResultSet TaskMasterRec_LND=null;
								stmtTaskMasterRec_LND = connection.createStatement();
								TaskMasterRec_LND = stmtTaskMasterRec_LND.executeQuery(QryTaskMasterRec_LND);
								if(TaskMasterRec_LND.next())
									{
									%>
										<input type="checkbox" name="UUTLNDEdit<%=i_LND %>" id="UUTLNDEdit<%=i_LND %>" checked="checked" value="<%=UTTMappingId_LND %>"  title="Select Field" onclick="return chkBoxCHKLND(<%=i_LND %>);"><%=TaskDescription_LND %><br/>
									<%
									}
								else
									{
									%>
										<input type="checkbox" name="UUTLNDEdit<%=i_LND %>" id="UUTLNDEdit<%=i_LND %>"  value="<%=UTTMappingId_LND %>"  title="Select Field"><%=TaskDescription_LND %><br/>
									<%
									 }
									 %>
									 	<div style="padding-left: 20px;"> 
									 	  <%
									 	  	String UTTMappingIdChd_LND = null;
											String TaskDescriptionChd_LND = null;
											int TaskIdChd_LND = 0;
											int i1_LND = 1;
											String QuerychkBoxChd_LND = "";
											if(IsSAdmin.equalsIgnoreCase("Yes"))
											{			
												QuerychkBoxChd_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"+TaskId_LND+"' and  uttm.user_type_id = 2 order by tm.Task_Id";
											}
											else
											{
												QuerychkBoxChd_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"+USER_AUTOID+"' and tm.Is_Active = 1 and tm.task_id not in (38,39) and tm.Pareent_Task_Id = '"+TaskId_LND+"' and  uttm.user_type_id = 2 order by tm.Task_Id";
											}
											System.out.println("Check Box Chd Selection Edit Query Recruiter:: "+QuerychkBoxChd_LND);
											Statement stmtChkBoxchd_LND =connection.createStatement();
											ResultSet ChkBoxRecchd_LND =stmtChkBoxchd_LND.executeQuery(QuerychkBoxChd_LND);
											while(ChkBoxRecchd_LND.next())
											{
												TaskIdChd_LND = ChkBoxRecchd_LND.getInt("tm.Task_Id");
												System.out.println("TaskIdChd_LND  Edit part:: "+TaskIdChd_LND);
												TaskDescriptionChd_LND = ChkBoxRecchd_LND.getString("tm.Task_Description");
												UTTMappingIdChd_LND = ChkBoxRecchd_LND.getString("uttm.UTT_Mapping_Id");
												System.out.println("UTTMappingIdChd Edit part:: "+UTTMappingIdChd_LND);
												System.out.println("TaskDescriptionChd Edit part::::::::"+TaskDescriptionChd_LND);
												String QryTaskMasterRecChd_LND =  "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 2 and tm.Pareent_Task_Id = '"+TaskId_LND+"' and uum.Is_Active=1 and tm.Task_ID = '"+TaskIdChd_LND+"' and uum.user_id = '"+EmpUserAutoId+"' and tm.Is_Active = 1 order by tm.Task_ID";
												System.out.println("Tasks master Chd Edit Query Recruiter:: "+QryTaskMasterRecChd_LND);
												Statement stmtTaskMasterRecChd_LND =null;
												ResultSet TaskMasterRecChd_LND =null;
												stmtTaskMasterRecChd_LND = connection.createStatement();
												TaskMasterRecChd_LND = stmtTaskMasterRecChd_LND.executeQuery(QryTaskMasterRecChd_LND);
									 	   		if(TaskMasterRecChd_LND.next())
													{
													System.out.println("Available for chd");
													%>
														<input type="checkbox" name="UUTLNDEdit<%=i_LND %>Chd<%=i1_LND%>" id="UUTLNDEdit<%=i_LND %>Chd<%=i1_LND%>" checked="checked" value="<%=UTTMappingIdChd_LND %>"  title="Select Field"><%=TaskDescriptionChd_LND %><br/>
														<input type="hidden" name="UUTLNDHdd<%=i_LND %>Chd<%=i1_LND %>" id="UUTLNDHdd<%=i_LND %>Chd<%=i1_LND %>" value="true">
													<%
													}
												else
													{
													System.out.println("Not Available for chd");
													%>
														<input type="checkbox" name="UUTLNDEdit<%=i_LND %>Chd<%=i1_LND%>" id="UUTLNDEdit<%=i_LND %>Chd<%=i1_LND%>"  value="<%=UTTMappingIdChd_LND %>"  title="Select Field"><%=TaskDescriptionChd_LND %><br/>
														<input type="hidden" name="UUTLNDHdd<%=i_LND %>Chd<%=i1_LND %>" id="UUTLNDHdd<%=i_LND %>Chd<%=i1_LND %>" value="false">
													<%
													 }
										 	  i1_LND++;
										 	 }		 
									 	   %>	
									 	   <input type="hidden" id="LNDCountValue<%=i_LND%>" name="LNDCountValue<%=i_LND%>" value="<%=i1_LND %>">
									 	</div>
									 <%
								 i_LND++;
								 System.out.println("i value  Edit part:: "+i_LND);
							  }
						%>
						   <input type="hidden" name="LNDCountValue" id="LNDCountValue" value="<%=i_LND%>">
					</td>
					</tr>
				</table>
			  </td>
			   <!--End of L and D part -->
			  
			  
			  
		   <!------- End of Check box For Edit User Field ---------->
		  
          
          <!-- -------*******Check box For Add User Field********------- -->
              <!-- Add user Check box field for LND part -->
                <td align="left" class="allBackColor" id="LNDCHKDISPADDUser" style="display: none;">
                   <table border="0" cellpadding="0" cellspacing="0" width="100%">
					 <tr>
					   <td align="left" class="allBackColor">
						  <% 
							int LNDUTTMappingIdAdduser=0;
							String LNDTaskDescriptionAdduser=null;
							int LNDTaskIdAdduser=0;
							String QryTaskMasterLNDAdduser = "";
							if(IsSAdmin.equalsIgnoreCase("Yes"))
							{
								QryTaskMasterLNDAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id = 2 and tm.Pareent_Task_Id=0";
							}
							else
							{
								QryTaskMasterLNDAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id  and uum.user_id = '"+USER_AUTOID+"'  and umt.user_type_id= 2 and tm.Pareent_Task_Id=0";
							}
							System.out.println("QryTaskMasterLNDAdduser:: "+QryTaskMasterLNDAdduser);
							Statement stmtTaskMasterLNDAdduser=null;
							ResultSet TaskMasterLNDAdduser=null;
							stmtTaskMasterLNDAdduser = connection.createStatement();
							TaskMasterLNDAdduser = stmtTaskMasterLNDAdduser.executeQuery(QryTaskMasterLNDAdduser);
							int p=1;
							while(TaskMasterLNDAdduser.next())
							{
							LNDTaskDescriptionAdduser=TaskMasterLNDAdduser.getString("tm.Task_Description");
							System.out.println("LNDTaskDescriptionAdduser Query Add:: "+LNDTaskDescriptionAdduser);
							LNDUTTMappingIdAdduser=TaskMasterLNDAdduser.getInt("umt.UTT_Mapping_Id");
							System.out.println("LNDUTTMappingIdAdduser  Add:: "+LNDUTTMappingIdAdduser);
							LNDTaskIdAdduser=TaskMasterLNDAdduser.getInt("tm.Task_ID");
							System.out.println("LNDTaskIdAdduser Add:: "+LNDTaskIdAdduser);
							 %> 
							 <input type="checkbox" name="UUTADDLND<%=p %>" id="UUTADDLND<%=p %>" value="<%=LNDUTTMappingIdAdduser %>" title="Select Field"><%=LNDTaskDescriptionAdduser %><br/>
							 <div style="padding-left: 20px;"> 
							 		<%
										int LNDUTTMappingIdAdduserChd=0;
										String LNDTaskDescriptionAdduserChd=null;
										int LNDTaskIdAdduserChd=0;
										String QryTaskMasterLNDAdduserChd = "";
										if(IsSAdmin.equalsIgnoreCase("Yes"))
										{
											QryTaskMasterLNDAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id= 2 and tm.Pareent_Task_Id = '"+LNDTaskIdAdduser+"'";
										}
										else
										{
											QryTaskMasterLNDAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"+USER_AUTOID+"' and umt.user_type_id= 2 and tm.Pareent_Task_Id = '"+LNDTaskIdAdduser+"'";
										}
										System.out.println("QryTaskMasterLNDAdduserChd:: "+QryTaskMasterLNDAdduserChd);
										Statement stmtTaskMasterLNDAdduserChd=null;
										ResultSet TaskMasterLNDAdduserChd=null;
										stmtTaskMasterLNDAdduserChd = connection.createStatement();
										TaskMasterLNDAdduserChd = stmtTaskMasterLNDAdduserChd.executeQuery(QryTaskMasterLNDAdduserChd);
										int pChd=1;
										while(TaskMasterLNDAdduserChd.next())
										{
										LNDTaskDescriptionAdduserChd=TaskMasterLNDAdduserChd.getString("tm.Task_Description");
										LNDUTTMappingIdAdduserChd=TaskMasterLNDAdduserChd.getInt("umt.UTT_Mapping_Id");
										LNDTaskIdAdduserChd=TaskMasterLNDAdduserChd.getInt("tm.Task_ID");
										 %> 
										<input type="checkbox" name="UUTADDLND<%=p%>Chd<%=pChd %>" id="UUTADDLND<%=p%>Chd<%=pChd %>" value="<%=LNDUTTMappingIdAdduserChd %>" title="Select Field"><%=LNDTaskDescriptionAdduserChd %><br/>
										<%
										pChd++;
										}
										System.out.println("Value of pChd::::"+pChd);
							 		 %>
							 		  <input type="hidden" name="LNDCountValueAdduser<%=p %>" id="LNDCountValueAdduser<%=p %>" value="<%=pChd%>">
							 	</div>
							 <%
							 p++;
							  }
							  System.out.println("Value of p::::"+p);
					        %> 
				          <input type="hidden" name="LNDCountValueAdduser" id="LNDCountValueAdduser" value="<%=p%>">
					   </td>
					 </tr>
				  </table>
	            </td>
	            <!-- End of Add user Check box field for LND part -->
        <tr>
            <td colspan="2" align="center" id="AddEditDelete">   
            	<input type="button" name="submitadd" id="submitadd" value="Add" class="buttonSmall" onclick="javascript:AddUser();"/>&nbsp;&nbsp;
            	<input type="button" name="submitedit" id="submitedit" value="Edit" class="buttonSmall" onclick="javascript:edituser();"/>&nbsp;&nbsp;
            	<input type="button" name="submitdelete" id="submitdelete" value="Delete" class="buttonSmall" onclick="javascript:deleteuser();"/>&nbsp;&nbsp;
            	<input type="submit" name="submitResetPW" id="submitResetPW" value="Reset Password" class="buttonMedium" onclick="javascript:resetPW();"/>&nbsp;&nbsp;
             </td>
        </tr>
        <tr id="deleteCommentsDISP" style="display: none;">
	        <td class="allBackColor" align="left" style="background-color: #d8d8d8;" colspan="1">
	         Delete Reason
	        <br></td>
	        <td colspan="1" class="allBackColor" ><input type="text" size="40" id="deleteCommentstxt" name="deleteCommentstxt" title="Delete Reason" class="wmta" onblur="Blur(this.id,'Enter Delete Reason')"  onfocus="Focus(this.id,'Enter Delete Reason')" value="Enter Delete Reason" maxlength="150" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
	   	       <input type="hidden" name="UserTypeIdInitial" id="UserTypeIdInitial" value="<%=UserTypeId %>" />
	   	       <input type="hidden" name="Empid" id="Empid" value="<%=EmpUserId %>" />
	   	   <br></td>
        </tr>
        <tr>
            <td colspan="2" align="center">   
            	 <input type="hidden" name="ActionType" id="ActionType" value="" />
            	  <input type="hidden" name="programid" id="programid" value="<%=programId %>" />
            	  <input type="hidden" name="subprogramid" id="subprogramid" value="<%=subprogramId %>" />
            	  <input type="hidden" name="location" id="location" value="<%=location %>" />
            	  <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
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
       <tr id="deletepartButtonDisp" style="display: none;">
            <td colspan="2" align="center">   
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="right">
				            <input id="cancelbutton" class="buttonSmall" type="reset" onclick="return enableOldViewDelete();" value="Cancel" name="cancelbutton">
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="left">
				             <input type="button" name="deletesubmit" id="deletesubmit" value="Submit"  class="buttonSmall" onclick="javascript:submitdeleteUser();"/>&nbsp;&nbsp;
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
				rstypes.close();
                stmttypes.close();
				rsprogram.close();
				stmtprogram.close();
				rstype.close();
				stmttype.close();
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
