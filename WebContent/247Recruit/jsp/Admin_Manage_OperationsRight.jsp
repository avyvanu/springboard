<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String username=(String)session.getAttribute("USER_Name");
String ProgramId= (String) request.getParameter("ProgramId");
if(ProgramId==null)
{
ProgramId="";
}
System.out.println("ProgramId:::Admin Program Right Page:::"+ProgramId);
session.setAttribute( "ProgramId", ProgramId );
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

<script type="text/javascript">
    function viewOpsPage(getProgId)
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_Operations_Interview.jsp?ProgramId="+getProgId;
		someWindow = window.open(url,'ReasonWindow','height=600,width=940,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	
	function editOpsPage(getProgId)
	{
		<%
       String AdminOpsEditPage = basePath + "247Recruit/jsp/Admin_Manage_Operation_Edit.jsp?ProgramId="+ProgramId;
       %>
        parent.location.href="<%=AdminOpsEditPage%>";
	}
	
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
		if(username==null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
     
     
  </script>
  
<!-- Populating the sub program based on selection of Program  -->  
  <script type="text/javascript">


	function GetXmlHttpObject()
	{
		if (window.XMLHttpRequest)
	    {
			// code for IE7+, Firefox, Chrome, Opera, Safari
	  		return new XMLHttpRequest();
	  	}
		if (window.ActiveXObject)
		{
			// code for IE6, IE5
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		return null;
	}
function selectProgramName()
{
		//alert("programname change!!!!");
		document.getElementById("subprogramname").disabled=false;
		
		getSubProgramNameList();
}
function getSubProgramNameList()	
{	
	//alert("programname change22!!!!");
	var cp=document.getElementById("programname").value;
	//alert(cp);
	
	if (cp != "0")
	{
	    var url="<%=request.getContextPath()%>/247Recruit/jsp/SubProgramList.jsp";
	    
		url=url+"?sid="+Math.random();
		url=url+"&ProgramId="+cp; 
		
	      
	    var request = GetXmlHttpObject();
	    if (request==null)
	    {
	 		 alert("Your browser does not support AJAX!");
			 return false;
		}
		request.onreadystatechange = function () 
		{		
			chargeCodeSelected(request);
		};
		request.open("POST", url, true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		request.send(null);
	}
	else
	{
	 var arry = new Array(0);
	 document.getElementById('subprogramname').options.length = 0;	
     arry[0] = document.createElement('option');  
	 arry[0].text = '- -Select- -';
	 arry[0].value ='';
	 document.getElementById('subprogramname').options[0]= arry[0];	
	}        
}

function chargeCodeSelected(request)
{
	
	 var data = request.responseText;
	 idata=data.split(",");
	 var arry = new Array(idata.length);

	 document.getElementById('subprogramname').options.length = 0;	
	 
     arry[0] = document.createElement('option');  
	 arry[0].text = '- -Select- -';
	 arry[0].value ='';
	 document.getElementById('subprogramname').options[0]= arry[0];	

	 for(var i=1;i<idata.length;i++)
	 {
		fenName = idata[i-1].split(":");
	    arry[i] = document.createElement('option');  
 		arry[i].text = fenName[1];
		arry[i].value =fenName[0];
		document.getElementById('subprogramname').options[i]= arry[i];	
	 }
}
//End of program Ajax

</script>

 
  
 <script type="text/javascript">
 function deleteuser()
 {
 
 document.getElementById('AddEditDelete').style.display="none";
 document.getElementById('deletesubmit').style.display="";
 document.getElementById('ProgramTypeDISP').style.display="";
 document.getElementById('ProgramNameValueDISP').style.display="";
 document.getElementById('hrmsProgramNameDISP').style.display="";
  document.getElementById('ProgramTypeValueDISP').style.display="";
 document.getElementById('HRMSProgramValueDISP').style.display="";
 document.getElementById('ProgramNameDISP').style.display="";
 document.getElementById('EnterProgramNameADD').style.display="none";
 document.getElementById('SelecthrmsSubProgramNameDISP').style.display="none";
 document.getElementById('SelectSubPgrmDDL').style.display="none";
 document.getElementById('hrmsSubProgramNameDISP').style.display="";
 document.getElementById('HRMSSubProgramValueDISP').style.display="";
 document.getElementById('submitadd').style.display="none";
 document.getElementById('submitedit').style.display="none";
 document.getElementById('submitdelete').style.display="none";
 document.getElementById('SelecthrmsProgramNameDISP').style.display="none";
 document.getElementById('SelectProgramDDL').style.display="none";
 document.getElementById('ProgramNameADD').style.display="none";
 document.getElementById('SelectProgramTypeDISP').style.display="none";
 document.getElementById('PrgrmTypSlctnADD').style.display="none";
 document.getElementById('SelectProgramStatusDISP').style.display="none";
 document.getElementById('PrgrmStatusSlctnADD').style.display="none";
 alert("Are you sure you want to Delete the program ??");
 
 }
 function submitdeleteUser()
 {
 <%
  String AdminDeletesubmitPage=basePath + "247Recruit/jsp/Admin_Add_Program_UpdateSubmit.jsp?ActionType=3&ProgramId="+ProgramId;
  %>
  window.location.href="<%=AdminDeletesubmitPage%>";
 }
 
 
 function edituser()
 {
  //ShowChkBox();
  document.getElementById('ActionType').value=2;
  document.getElementById('ProgramNameEdit').style.display="";
  document.getElementById('ProgramNameDISP').style.display="";
  document.getElementById('ProgramTypeDISP').style.display="";
  document.getElementById('EnterProgramNameADD').style.display="none";
  document.getElementById('hrmsProgramNameDISP').style.display="";
  document.getElementById('HRMSProgramValueDISP').style.display="";
  document.getElementById('SelecthrmsSubProgramNameDISP').style.display="none";
  document.getElementById('SelectSubPgrmDDL').style.display="none";
  document.getElementById('hrmsSubProgramNameDISP').style.display="";
  document.getElementById('HRMSSubProgramValueDISP').style.display="";
  document.getElementById('ProgramNameValueDISP').style.display="none";
  document.getElementById('AddEditDelete').style.display="none";
  document.getElementById('ProgramTypeValueDISP').style.display="none";
  document.getElementById('ProgramTypeRadioSelection').style.display="";
  document.getElementById('ProgramStatusRadioSelection').style.display="";
  document.getElementById('SelecthrmsProgramNameDISP').style.display="none";
  document.getElementById('SelectProgramDDL').style.display="none";
  document.getElementById('submit').style.display="";
  document.getElementById('ProgramNameADD').style.display="none";
  document.getElementById('SelectProgramTypeDISP').style.display="none";
  document.getElementById('PrgrmTypSlctnADD').style.display="none";
  document.getElementById('PrgrmStatusSlctnADD').style.display="none";
  }
  
  
  function submitEditUser()
  {
  
  if(document.getElementById("ProgramNameVal").value=='')
			{
				var appStr = 'Please Enter Program Name !';		
				alert(appStr);
				document.getElementById('ProgramNameVal').focus();
				return false;
			}
  if ((AdminForm.ProgramTypeSelelction[0].checked == false)&& (AdminForm.ProgramTypeSelelction[1].checked == false))
              {
              alert("Please Check atleast One Field ");
              return false;
              }
  if ((AdminForm.ProgramStatusSelelction[0].checked == false)&& (AdminForm.ProgramStatusSelelction[1].checked == false))
			  {
			  alert("Please Check atleast One Field ");
			  return false;
			  }
  } 
  
  function ValidationAddedUser()
  {
  if(document.getElementById("ProgramNameValADD").value=='Program Name')
			{
				var appStr = 'Please Enter Program Name !';		
				alert(appStr);
				document.getElementById('ProgramNameValADD').focus();
				return false;
			}
        if(AdminForm.programname.selectedIndex == 0) 
              { 
                alert('Please Select the Program !'); 
                document.getElementById('programname').focus();
                 return false; 
              }	
          
         if(AdminForm.subprogramname.selectedIndex == '') 
              { 
                alert('Please Select the Sub-Program !'); 
                document.getElementById('subprogramname').focus();
                 return false; 
              }  
          
          if ((AdminForm.ProgramTypeSelelctionAdd[0].checked == false)&& (AdminForm.ProgramTypeSelelctionAdd[1].checked == false))
             {
             alert("Please Check  Program Type !");
             return false;
          }   
          if ((AdminForm.ProgramStatusSelelctionAdd[0].checked == false)&& (AdminForm.ProgramStatusSelelctionAdd[1].checked == false))
             {
             alert("Please Check Program Status !");
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
function ShowChkBox1()
  {
document.getElementById('UserAccessDISP').style.display="";
    if(AdminForm.UserTypesIdAddUser.selectedIndex == 2) 
              { 
              
             document.getElementById('LNDCHKDISPADDUser').style.display="";
             document.getElementById('RECCHKDISPADDUser').style.display="none"; 
             document.getElementById('OpsListBoxAddDISP').style.display="none"; 
             document.getElementById('OpsListBoxAdd').style.display="none"; 
              }
    if(AdminForm.UserTypesIdAddUser.selectedIndex == 1) 
              { 
            
            document.getElementById('LNDCHKDISPADDUser').style.display="none";
            document.getElementById('RECCHKDISPADDUser').style.display=""; 
            document.getElementById('OpsListBoxAddDISP').style.display="none"; 
            document.getElementById('OpsListBoxAdd').style.display="none"; 
              }  
     if(AdminForm.UserTypesIdAddUser.selectedIndex == 3) 
     {
      document.getElementById('UserAccessDISP').style.display="none"; 
      document.getElementById('OpsListBoxAddDISP').style.display=""; 
      document.getElementById('OpsListBoxAdd').style.display=""; 
     }         
   }
</script>
  </head>
  
  <body>
  <form action="<%=recruitPath%>jsp/Admin_Add_Program_UpdateSubmit.jsp" name="AdminForm" id="AdminForm"  method="post"  accept-charset="utf-8">
    <%
      try
      {
      Connection connection=ConnectDatabase.getConnection();	
      String query="select * from program_names_master where Program_Id='" + ProgramId + "'";
      Statement stmt=connection.createStatement();
      ResultSet rs=stmt.executeQuery(query);
      String ProgramName=null;
      int hrmsProgramId=0;
      int hrmsSubProgramId=0;
      String hrmsProgramName=null;
      String hrmsSubProgramName=null;
      String EmpId=null;
      String EmpEmail=null;
  	  String EmpPhone=null;
  	  String LocationName=null;
  	  String ProgramTypename=null;
  	  String ProgramTypeId=null;
  	  String IsActive=null;
  	  int SendAlerts=0;
  	  int EmpUserId=0;
  	  int location=0;
  	  Statement stmts = null;
  	  ResultSet rss = null;
  	if(rs.next())
  	   {
  	    
  		ProgramName=rs.getString("Program_name");
  		System.out.println("ProgramName:::::"+ProgramName);
  		session.setAttribute("Program_name", ProgramName);
  		hrmsProgramId=rs.getInt("mst_programid");
  		System.out.println("hrmsProgramId:::::"+hrmsProgramId);
  		hrmsSubProgramId=rs.getInt("mst_subprogramid");
  		System.out.println("hrmsSubProgramId:::::"+hrmsSubProgramId);
  		ProgramTypeId=rs.getString("Program_TypeId");
  		IsActive=rs.getString("Is_Alive");
  		String Querycentre="select mstp.programname as programname,mstsp.subprogramname as subprogramname from mstprogram mstp,mstsubprogram mstsp where mstp.programid="+hrmsProgramId+" and mstsp.subprogramid="+hrmsSubProgramId+"";
        stmts=connection.createStatement();
        rss=stmts.executeQuery(Querycentre);
        if(rss.next())
        {
        hrmsProgramName=rss.getString("programname").trim();
        System.out.println("HRMS Program name:::::"+hrmsProgramName);
        hrmsSubProgramName=rss.getString("subprogramname").trim();
        System.out.println("HRMS Sub-Program name:::::"+hrmsSubProgramName);
        }
  		rss.close();
  		
  		
        String Querytype="select Program_type_Name from program_type_master where Program_type_Id='" + ProgramTypeId + "'";
        rss = stmts.executeQuery(Querytype);
        if(rss.next())
        {
        ProgramTypename = rss.getString("Program_type_Name").trim();
        }
        rss.close();
        
        int partCount = 0;
        Querytype = "select count(*) as count from operations_interview_part_master where Program_Id ='"+ProgramId+"' and IsAlive=1";
        rss = stmts.executeQuery(Querytype);
        if(rss.next())
        {
        partCount = rss.getInt("count");
        System.out.println("partCount::::"+partCount);
        }
        rss.close();
        
  		%>
  		
	<table border="0" cellpadding="6" cellspacing="6" width="450px" >
	   <tr>
	   		<td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">    
	            <table border="0" cellpadding="0" cellspacing="0" width="120px">
					<tr>
						<td align="left" class="allBackColor" id="ProgramNameDISP" style="background-color: #d8d8d8;">Program Name </td>
<!-- 						<td align="left" class="allBackColor" id="EnterProgramNameADD" style="background-color: #d8d8d8;display: none;">Enter Program Name</td>
 -->				</tr>
				</table>
            </td>
	     	<td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="350px">
					<tr>
					  <td align="left" class="allBackColor" id="ProgramNameValueDISP"><%=ProgramName %>&nbsp;</td>
					  <td align="left" class="allBackColor" id="ProgramNameEdit" style="display: none;">
						  <input type="text" name="ProgramNameVal" id="ProgramNameVal"  style="border-color: #41383C;" size="25" maxlength="50" onkeypress="return AllowChars(event);" title="Enter the Program Name" oncopy="return false" onpaste="return false" oncut="return false" value="<%=ProgramName %>">
					  </td>
					  <td align="left" class="allBackColor" id="ProgramNameADD" style="display: none;">
						  <input type="text" name="ProgramNameValADD" id="ProgramNameValADD"  style="border-color: #41383C;" size="25" maxlength="50" onkeypress="return AllowChars(event);" title="Enter the Program Name"  class="wmta" onblur="Blur(this.id,'Program Name')" onfocus="Focus(this.id,'Program Name')" value="Program Name" oncopy="return false" onpaste="return false" oncut="return false">
					  </td>
					</tr>
			   </table>
			 </td>
		  </tr>
		  <tr>
          <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" id="hrmsProgramNameDISP" class="allBackColor" style="background-color: #d8d8d8;" nowrap="nowrap">HRMS Program Name</td>
						<td align="left" id="SelecthrmsProgramNameDISP" class="allBackColor" style="background-color: #d8d8d8;display: none;" nowrap="nowrap">Select HRMS Program </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="HRMSProgramValueDISP"><%=hrmsProgramName %>&nbsp;</td>
					  <td align="left" class="allBackColor" id="SelectProgramDDL" style="display: none;">
						   <select name="programname" id="programname" size="1" onChange="selectProgramName()" onkeyup="selectProgramName()" style="height: 18px;width: 180px;">
								<option value="0">
									- -Select- -
								</option>
								<%
									String secQsnQry = "select ProgramId, ProgramName from mstprogram where isActive='Y' order by programname asc";
										System.out.println("query " + secQsnQry);
										ResultSet rsprogram = stmt.executeQuery(secQsnQry);
										while (rsprogram.next()) {
								%>
								<option value="<%=rsprogram.getString("ProgramId")%>"><%=rsprogram.getString("ProgramName")%></option>
								<%
									}
								%>
							</select>
					</td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr>
          <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" id="hrmsSubProgramNameDISP" class="allBackColor" style="background-color: #d8d8d8;">HRMS Sub Program Name </td>
					    <td align="left" class="allBackColor" id="SelecthrmsSubProgramNameDISP" style="background-color: #d8d8d8;display: none;">Select HRMS Sub-Program </td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="HRMSSubProgramValueDISP"><%=hrmsSubProgramName %>&nbsp;
					  </td>
					  <td align="left" class="allBackColor" id="SelectSubPgrmDDL" style="display: none;">
					   <select name="subprogramname" id="subprogramname" size="1" style="height: 18px;width: 180px;">
							<option value="0">
								- -Select- -
							</option>
							
						</select>
					   </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr>
          <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;" id="ProgramTypeDISP">Program Type</td>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;display: none;" id="SelectProgramTypeDISP">Select Program Type</td>
					</tr>
				</table>
            </td>
              <td align="left" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
					  <td align="left" class="allBackColor" id="ProgramTypeValueDISP"><%=ProgramTypename %>&nbsp;</td>
					   <td align="left" class="allBackColor" id="ProgramTypeRadioSelection" style="display: none;">
					  <input type="hidden" name="ProgramTypeInitialVal" id="ProgramTypeInitialVal" value=<%=ProgramTypeId %>>
					  <%if(ProgramTypeId.equalsIgnoreCase("1")) {%>
					   <input type="radio" name="ProgramTypeSelelction" id="ProgramTypeSelelction" checked="checked" value="1">Speech Assisted Call 
					  <%} else { %>
					   <input type="radio" name="ProgramTypeSelelction" id="ProgramTypeSelelction" value="1">Speech Assisted Call 
					   <%} if(ProgramTypeId.equalsIgnoreCase("2")){%>
					  <input type="radio" name="ProgramTypeSelelction" id="ProgramTypeSelelction" checked="checked" value="2">Speech Assisted Chat 
					  <%}else { %>
					  <input type="radio" name="ProgramTypeSelelction" id="ProgramTypeSelelction" value="2">Speech Assisted Chat 
					  <%} %>
					  </td>
					  <td class="allBackColor" id="PrgrmTypSlctnADD" style="display: none;">
					  <input type="radio" name="ProgramTypeSelelctionAdd" id="ProgramTypeSelelctionAdd" value="1">Speech Assisted Call
					  <input type="radio" name="ProgramTypeSelelctionAdd" id="ProgramTypeSelelctionAdd" value="2">Speech Assisted Chat
					  </td>
					</tr>
				</table>
			  </td>
		  </tr>
		  <tr>
		    <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		     Total Parts
		    </td>
		    <td align="left" class="allBackColor">
		      <%=partCount %>
		    </td>
		    
		  </tr>
		      <%  
                String description = "";
                String Porderno=null;
                int partid = 1;
                String secqrypartid = "select Part_Description,Part_Id,order_no from operations_interview_part_master where Program_Id='"+ProgramId+"' and isalive=1 order by order_no";
				System.out.println("Part id "+secqrypartid);
				rss = stmt.executeQuery(secqrypartid);
				while(rss.next())
				{
				description=rss.getString("part_description");
				System.out.println("description:::::"+description);
				Porderno=rss.getString("order_no");
				partid=rss.getInt("part_id");
				System.out.println("Part id "+partid);
				%>
		  <tr>
		    <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		     Part-<%= Porderno%>&nbsp;Description:
		    </td>
		    <td align="left" class="allBackColor">
		      <%if(!description.equalsIgnoreCase("")) 
		      {
		      %>
		      <%=description%>
		      <%
		      }
		      else if(description.equalsIgnoreCase("")) 
		      {
		      %>
		      No Description Available
		      <%
		      }
		      %>
		    </td>
		  </tr>
			  <%
				int qnsCount = 0;
				String secqnsCount = "select count(Question_Id) as Count from operations_interview_question_master where Part_Id = '"+partid+"' and IsAlive = 1";
				System.out.println("secqrsCount:::"+secqnsCount);
				ResultSet rssqns = stmts.executeQuery(secqnsCount);
				if(rssqns.next())
				{
				qnsCount=rssqns.getInt("Count");
				System.out.println("qnsCount:::::"+qnsCount);
				}
				rssqns.close();
			   %>
		  <tr>
		     <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
		     Total Questions
		    </td>
		    <td align="left" class="allBackColor">
		    <%=qnsCount %>
		    </td>
		  </tr>
		  <%
		   } 
		  rss.close();
		  %>
		  <tr>
            <td colspan="3" align="center" id="AddEditDelete">   
            	<input type="button" name="submitadd" id="submitadd" value="View" class="buttonSmall" onclick="viewOpsPage('<%=ProgramId%>');"/>&nbsp;&nbsp;
            	<input type="button" name="submitedit" id="submitedit" value="Edit" class="buttonSmall" onclick="editOpsPage('<%=ProgramId%>');"/>&nbsp;&nbsp;
            	<!--  <input type="button" name="submitdelete" id="submitdelete" value="Delete" class="buttonSmall" onclick="javascript:deleteuser();"/>&nbsp;&nbsp;-->
              </td>
        </tr>
        
    </table>
    <table style="display: none;">
    	<tr>
    		<td>
    			<input type = "hidden" id = "total_parts" name = "total_parts" value = " <%=partCount %>">
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
