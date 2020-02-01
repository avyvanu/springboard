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
	String engGrammarRowId = (String)request.getParameter("engGrammarRowId");
	System.out.println("engGrammarRowId\t"+engGrammarRowId);

	String engGrammarTestName = "";
	String engGrammarPassage = "";
	String engGrammar_IsActive = "";
%>
<html>
<head>
    <title>[24]7 SPRINGBOARD</title>
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	    .classengGrammarTestleft_TD
		{
			width: 100px;
			font-size: 12px;
			background-color: #D8D8D8;
		}
		.classengGrammarTestright_TD
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
	var engGrammarNewIsActive = document.getElementById("engGrammarStatus").checked;
	var IsActive = document.getElementById("engGrammarIsActive").value;
	var engGrammarOldIsActive = false;
	var StatusMsg = '';
	var AvailMsg = '';
	if(IsActive == '1')
	{
		engGrammarOldIsActive = true;
		StatusMsg = 'deactivate';
		AvailMsg = ' not';
	}
	else
	{
		StatusMsg = 'activate';
	}
	if(engGrammarNewIsActive == engGrammarOldIsActive)
	{
		alert("No change in status!!");
		return false;
	}
	if(!engGrammarNewIsActive)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't deactivate all english grammar tests!! At least one must be active.");
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
    function showViewengGrammar(getengGrammarId)
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_EngGrammar_Test.jsp?engGrammarTestId="+getengGrammarId;
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
function deleteFinalengGrammarTest()
{
	var engGrammarIsActive = parseInt(document.getElementById("engGrammarIDStatus").value);
	if(engGrammarIsActive == 1)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't delete the only activate english grammar test!! At least one test, other than the one being deleted, must be active.");
			return false;
		}
	}
	var reason = document.getElementById("reason").value;
	var engGrammarDeleteID = document.getElementById("engGrammarID").value;
	var engGrammarDeleteIDStatus = document.getElementById("engGrammarIDStatus").value;
	if(reason == null || reason == '' || reason.trim().length == 0)
	{
		alert('Please enter delete reason !');
		document.getElementById("reason").focus();
		return false;
	}
	if(confirm('Are you sure you want to delete this englsih grammar test? It will be removed permanently from the list of english grammar tests.'))
	{
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/DeleteEngGrammarTest.jsp?deleteTestId='+engGrammarDeleteID+'&deleteTestIdStatus='+engGrammarDeleteIDStatus+'&reason='+reason;
	}

}

</script>
</head>
  
  <body>
  <%
  try
  {
	String query="select Test_Name, PASSAGE, Is_Alive from bpo_eng_comp_master where READING_COMP_MASTER_ID="+engGrammarRowId; 
	con=ConnectDatabase.getConnection();		
	stmt=con.createStatement();
	rs=stmt.executeQuery(query);
	if(rs.next())
	{
		engGrammarTestName = rs.getString("Test_Name");
		engGrammarPassage = rs.getString("PASSAGE");
		engGrammar_IsActive = rs.getString("Is_Alive");
		engGrammarPassage = engGrammarPassage.replaceAll("\\s+", " ");
		System.out.println("engGrammarTestName:::::::"+engGrammarTestName+"   engGrammar_IsActive:::::::"+engGrammar_IsActive+"  ");
 	}
 	if(engGrammarRowId != null)
 	{
   %>

<form action="<%=request.getContextPath()%>/EditEngGrammarStatus" method="post">
  	<table border="0" cellpadding="6" cellspacing="6" style="width: 450px; margin:0px;">
  		<tr>
  			<td class="classengGrammarTestleft_TD" nowrap="nowrap">
  				Test Name 
  			</td>
  			<td class="classengGrammarTestright_TD">
  				<%=engGrammarTestName%>
  			</td>
  		</tr>
  		<tr>
  			<td class="classengGrammarTestleft_TD">
  				 Test Passage
  			</td>
  			<td class="classengGrammarTestright_TD">
  				<div style="overflow-x: hidden; overflow-y: scroll; width: 100%; height: 113px;">
  					<%=engGrammarPassage%>
  				</div>
  			</td>  			
  		</tr>
  		<tr id="isActiveDisplayRow">
  			<td class="classengGrammarTestleft_TD" nowrap="nowrap">
  				Test Status
  			</td>
  			<td class="classengGrammarTestright_TD" nowrap="nowrap">
  				<%
	  				if(engGrammar_IsActive.equalsIgnoreCase("1"))
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
	            <input type="hidden" name="engGrammarID" id="engGrammarID" value="<%=engGrammarRowId%>"/>
				<input type="hidden" name="engGrammarIDStatus" id="engGrammarIDStatus" value="<%=engGrammar_IsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="deleteDisplayRow" style="display: none;">
  			<td class="classengGrammarTestleft_TD" nowrap="nowrap">
  				Delete Reason 
  			</td>
  			<td class="classengGrammarTestright_TD" nowrap="nowrap">
				 <input type="text" name="reason" id="reason" style="width: 100%;" maxlength="50" onkeypress="return AllowChars(event);"/>
 			</td>  		
  		</tr>
  		<tr id="isActiveRowEdit" style="display: none;">
  			<td class="classengGrammarTestleft_TD" nowrap="nowrap">
  				 Test Status
  			</td>
  			<td class="classengGrammarTestright_TD" nowrap="nowrap">
  				<%if(engGrammar_IsActive.equalsIgnoreCase("1")){%>
  					<input type="radio" name="engGrammarStatus" id="engGrammarStatus" value="1" checked="checked"/>Active
  					<input type="radio" name="engGrammarStatus" id="engGrammarStatus" value="0"/>Inactive
  				<%}else{%>
  					<input type="radio" name="engGrammarStatus" id="engGrammarStatus" value="1"/>Active
  					<input type="radio" name="engGrammarStatus" id="engGrammarStatus" value="0" checked="checked"/>Inactive
  				<%}%>
	            <input type="hidden" name="engGrammarIsActive" id="engGrammarIsActive" value="<%=engGrammar_IsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="isActiveDisplayButton">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="center">
				            <input type="button" name="engGrammarTestView" id="engGrammarTestView" value="View" class="buttonSmall" onclick="showViewengGrammar('<%=engGrammarRowId%>');"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="callengGrammarTestMainPage" id="callengGrammarTestMainPage" value="Add" class="buttonSmall" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Admin_Add_EngGrammar_Test.jsp'"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="editengGrammarStatus" id="editengGrammarStatus" value="Edit" class="buttonSmall" onclick="return displayEditDiv();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="engGrammarTestDelete" id="engGrammarTestDelete" value="Delete" class="buttonSmall" onclick="return displayDeleteDiv();"/>
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
				            <input type="submit" name="editengGrammarStatus" id="editengGrammarStatus" value="Update" class="buttonSmall" onclick="return updateDetails();"/>
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
				            <input type="button" name="deleteengGrammarStatus" id="deleteengGrammarStatus" value="Delete" class="buttonSmall" onclick="return deleteFinalengGrammarTest();"/>
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
