<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String comprehensionId = (String)request.getParameter("comprehensionRowId");
	System.out.println("comprehensionId\t"+comprehensionId);

	String comprehensionTestName = "";
	String comprehensionPassage = "";
	String comprehension_IsActive = "";
%>
<html>
<head>
    <title>[24]7 SPRINGBOARD</title>
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	    .classCompTestleft_TD
		{
			width: 100px;
			font-size: 12px;
			background-color: #D8D8D8;
		}
		.classCompTestright_TD
		{
			width: 200px;
			font-size: 12px;
			background-color: #F8F8F8;
		}
	</style>
	
<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			alert("Invalid character entered !!");
			return false;
		}
	}      
</script>
	
<script type="text/javascript">
function displayEditDiv()
{	
	document.getElementById("isActiveDisplayRow").style.display = "none";
	document.getElementById("isActiveDisplayButton").style.display = "none";
	document.getElementById("isActiveRowEdit").style.display = "";
	document.getElementById("isActiveButtonEdit").style.display = "";
}
function enableOldField()
{
	document.getElementById("isActiveRowEdit").style.display = "none";
	document.getElementById("isActiveButtonEdit").style.display = "none";
	document.getElementById("isDeleteButtonEdit").style.display = "none";
	document.getElementById("deleteDisplayRow").style.display = "none";		
	document.getElementById("isActiveDisplayRow").style.display = "";
	document.getElementById("isActiveDisplayButton").style.display = "";
}
function updateDetails()
{
	var compNewIsActive = document.getElementById("compStatus").checked;
	var IsActive = document.getElementById("compIsActive").value;
	var compOldIsActive = false;
	var StatusMsg = '';
	var AvailMsg = '';
	if(IsActive == '1')
	{
		compOldIsActive = true;
		StatusMsg = 'deactivate';
		AvailMsg = ' not';
	}
	else
	{
		StatusMsg = 'activate';
	}
	if(compNewIsActive == compOldIsActive)
	{
		alert("No change in status!!");
		return false;
	}
	if(!compNewIsActive)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't deactivate all reading comprehension tests!! At least one must be active.");
			return false;
		}
	}
	if(confirm('Are you sure you want to '+StatusMsg+' this test? It will'+AvailMsg+' be available to candidates immediately.'))
	{
		return true;
	}
	else 
	{
		return false;
	}
}

</script>
<script type="text/javascript">
    function showViewComp(getCompId)
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_Comp_Test.jsp?compTestId="+getCompId;
		someWindow = window.open(url,'ReasonWindow','height=500,width=800,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
</script>
<script type="text/javascript">
function displayDeleteDiv()
{
	document.getElementById("isActiveDisplayButton").style.display="none";
	document.getElementById("deleteDisplayRow").style.display="";
	document.getElementById("isDeleteButtonEdit").style.display="";
}
</script>
<script type="text/javascript">
function deleteFinalCompTest()
{
	var LangIsActive = parseInt(document.getElementById("compIDStatus").value);
	if(LangIsActive == 1)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't delete the only activate comprehension test!! At least one test, other than the one being deleted, must be active.");
			return false;
		}
	}
	var reason = document.getElementById("reason").value;
	var compDeleteID = document.getElementById("comprehensionID").value;
	var compDeleteIDStatus = document.getElementById("compIDStatus").value;
	if(reason == null || reason == '' || reason.trim().length == 0)
	{
		alert('Please enter delete reason !');
		document.getElementById("reason").focus();
		return false;
	}
	if(confirm('Are you sure you want to delete this comprehension test? It will be removed permanently from the list of comprehension tests.'))
	{
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/DeleteComprehensionTest.jsp?deleteTestId='+compDeleteID+'&deleteTestIdStatus='+compDeleteIDStatus+'&reason='+reason;
	}

}

</script>
</head>
  
  <body>
  <%
  try
  {
	String query="select Test_Name, PASSAGE, Is_Alive from bpo_reading_comp_master where READING_COMP_MASTER_ID="+comprehensionId; 
	con=ConnectDatabase.getConnection();		
	stmt=con.createStatement();
	rs=stmt.executeQuery(query);
	if(rs.next())
	{
		comprehensionTestName = rs.getString("Test_Name");
		comprehensionPassage = rs.getString("PASSAGE");
		comprehension_IsActive = rs.getString("Is_Alive");
		comprehensionPassage = comprehensionPassage.replaceAll("\\s+", " ");
		System.out.println("languageTestName:::::::"+comprehensionTestName+"   languageTestIsActive:::::::"+comprehension_IsActive+"  ");
 	}
 	if(comprehensionId != null)
 	{
   %>

<form action="<%=request.getContextPath()%>/EditComprehensionStatus" method="post">
  	<table border="0" cellpadding="6" cellspacing="6" style="width: 450px; margin:0px;">
  		<tr>
  			<td class="classCompTestleft_TD" nowrap="nowrap">
  				Test Name 
  			</td>
  			<td class="classCompTestright_TD">
  				<%=comprehensionTestName%>
  			</td>
  		</tr>
  		<tr>
  			<td class="classCompTestleft_TD">
  				 Test Passage
  			</td>
  			<td class="classCompTestright_TD">
  				<div style="overflow-x: hidden; overflow-y: scroll; width: 100%; height: 113px;">
  					<%=comprehensionPassage%>
  				</div>
  			</td>  			
  		</tr>
  		<tr id="isActiveDisplayRow">
  			<td class="classCompTestleft_TD" nowrap="nowrap">
  				Test Status
  			</td>
  			<td class="classCompTestright_TD" nowrap="nowrap">
  				<%
	  				if(comprehension_IsActive.equalsIgnoreCase("1"))
	  				{
  				%>
  					Active
  				<%	
	  				}
	  				else
	  				{
  				%>
  					Inactive
  				<%
	  				}
  				%>
	            <input type="hidden" name="ActiveTestCount" id="ActiveTestCount" value="<%=session.getAttribute("ActiveTestCount")%>"/>
	            <input type="hidden" name="comprehensionID" id="comprehensionID" value="<%=comprehensionId%>"/>
				<input type="hidden" name="compIDStatus" id="compIDStatus" value="<%=comprehension_IsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="deleteDisplayRow" style="display: none;">
  			<td class="classCompTestleft_TD" nowrap="nowrap">
  				Delete Reason 
  			</td>
  			<td class="classCompTestright_TD" nowrap="nowrap">
				 <input type="text" name="reason" id="reason" style="width: 100%;" maxlength="50" onkeypress="return AllowChars(event);"/>
 			</td>  		
  		</tr>
  		<tr id="isActiveRowEdit" style="display: none;">
  			<td class="classCompTestleft_TD" nowrap="nowrap">
  				 Test Status
  			</td>
  			<td class="classCompTestright_TD" nowrap="nowrap">
  				<%if(comprehension_IsActive.equalsIgnoreCase("1")){%>
  					<input type="radio" name="compStatus" id="compStatus" value="1" checked="checked"/>Active
  					<input type="radio" name="compStatus" id="compStatus" value="0"/>Inactive
  				<%}else{%>
  					<input type="radio" name="compStatus" id="compStatus" value="1"/>Active
  					<input type="radio" name="compStatus" id="compStatus" value="0" checked="checked"/>Inactive
  				<%}%>
	            <input type="hidden" name="compIsActive" id="compIsActive" value="<%=comprehension_IsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="isActiveDisplayButton">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="center">
				            <input type="button" name="CompTestView" id="CompTestView" value="View" class="buttonSmall" onclick="showViewComp('<%=comprehensionId%>');"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="callCompTestMainPage" id="callCompTestMainPage" value="Add" class="buttonSmall" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Admin_Add_Comprehension_Test.jsp'"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="editCompStatus" id="editCompStatus" value="Edit" class="buttonSmall" onclick="return displayEditDiv();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="compTestDelete" id="compTestDelete" value="Delete" class="buttonSmall" onclick="return displayDeleteDiv();"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
  		<tr id="isActiveButtonEdit" style="display: none;">
            <td colspan="2" align="center">   
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="right">
				            <input type="reset" name="reset" id="reset" value="Cancel" class="buttonSmall" onclick="return enableOldField();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="left">
				            <input type="submit" name="editCompStatus" id="editCompStatus" value="Update" class="buttonSmall" onclick="return updateDetails();"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr> 
  		<tr id="isDeleteButtonEdit" style="display: none;">
            <td colspan="2" align="center">   
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="right">
				            <input type="button" name="reset" id="reset" value="Cancel" class="buttonSmall" onclick="return enableOldField();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="left">
				            <input type="button" name="deleteCompStatus" id="deleteCompStatus" value="Delete" class="buttonSmall" onclick="return deleteFinalCompTest();"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr> 
        
  	</table>
  </form>
   <%
  }
  }
  catch(Exception e)
  {
  	e.printStackTrace();
  }
  %>  	
  </body>
</html>
