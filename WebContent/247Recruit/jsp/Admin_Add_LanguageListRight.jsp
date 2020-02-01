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
	String languageTestId = (String)request.getParameter("LanguageRowId");
	System.out.println("languageTestId\t"+languageTestId);

	String languageTestName = "";
	String languagePassage = "";
	String languageTestIsActive = "";
%>
<html>
<head>
    <title>[24]7 SPRINGBOARD</title>
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	    .classlangTestleft_TD
		{
			width: 100px;
			font-size: 12px;
			background-color: #D8D8D8;
		}
		.classlangTestright_TD
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
	var LangNewIsActive = document.getElementById("langStutas").checked;
	var IsActive = document.getElementById("languageIsActive").value;
	var LangOldIsActive = false;
	var StatusMsg = '';
	var AvailMsg = '';
	if(IsActive == '1')
	{
		LangOldIsActive = true;
		StatusMsg = 'deactivate';
		AvailMsg = ' not';
	}
	else
	{
		StatusMsg = 'activate';
	}
	if(LangNewIsActive == LangOldIsActive)
	{
		alert("No change in status!!");
		return false;
	}
	if(!LangNewIsActive)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't deactivate all language tests!! At least one must be active.");
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
    function showScriptPartA(getLangId)
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_Lang_Test.jsp?langTestId="+getLangId;
		someWindow = window.open(url,'ReasonWindow','height=600,width=800,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
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
function deleteFinalLangTest()
{
	var LangIsActive = parseInt(document.getElementById("languageIDStatus").value);
	if(LangIsActive == 1)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't delete the only activate language test!! At least one test, other than the one being deleted, must be active.");
			return false;
		}
	}
	var reason = document.getElementById("reason").value;
	var languageDeleteID = document.getElementById("languageID").value;
	var languageDeleteIDStatus = document.getElementById("languageIDStatus").value;
	if(reason == null || reason == '' || reason.length == 0)
	{
		alert('Please enter delete reason !');
		document.getElementById("reason").focus();
		return false;
	}
	// alert(reason + "   " + languageDeleteID);
	if(confirm('Are you sure you want to delete this language test? It will be removed permanently from the list of language tests.'))
	{
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/DeleteLanguageTest.jsp?deleteTestId='+languageDeleteID+'&deleteTestIdStatus='+languageDeleteIDStatus+'&reason='+reason;
	}

}

</script>
</head>
  
  <body>
  <%
  try
  {
	String query="select Lang_Test_Name, Lang_Passage, Is_Active from language_test_master where Lang_Test_Id="+languageTestId; 
	con=ConnectDatabase.getConnection();		
	stmt=con.createStatement();
	rs=stmt.executeQuery(query);
	if(rs.next())
	{
		languageTestName = rs.getString("Lang_Test_Name");
		languagePassage = rs.getString("Lang_Passage");
		languageTestIsActive = rs.getString("Is_Active");
		languagePassage = languagePassage.replaceAll("\\s+", " ");
		System.out.println("languageTestName\t"+languageTestName+"     languageTestIsActive \t "+languageTestIsActive+"  ");
 	}
 	if(languageTestId != null)
 	{
   %>

<form action="<%=request.getContextPath()%>/EditLanguageStatus" method="post">
  	<table border="0" cellpadding="6" cellspacing="6" style="width: 450px; margin:0px;">
  		<tr>
  			<td class="classlangTestleft_TD" nowrap="nowrap">
  				Language Test Name 
  			</td>
  			<td class="classlangTestright_TD">
  				<%=languageTestName%>
  			</td>
  		</tr>
  		<tr>
  			<td class="classlangTestleft_TD">
  				Language Test Passage
  			</td>
  			<td class="classlangTestright_TD">
  				<div style="overflow-x: hidden; overflow-y: scroll; width: 100%; height: 113px;">
  					<%=languagePassage%>
  				</div>
  			</td>  			
  		</tr>
  		<tr id="isActiveDisplayRow">
  			<td class="classlangTestleft_TD" nowrap="nowrap">
  				Language Test Status
  			</td>
  			<td class="classlangTestright_TD" nowrap="nowrap">
  				<%
	  				if(languageTestIsActive.equalsIgnoreCase("1"))
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
	            <input type="hidden" name="languageID" id="languageID" value="<%=languageTestId%>"/>
				<input type="hidden" name="languageIDStatus" id="languageIDStatus" value="<%=languageTestIsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="deleteDisplayRow" style="display: none;">
  			<td class="classlangTestleft_TD" nowrap="nowrap">
  				Delete Reason 
  			</td>
  			<td class="classlangTestright_TD" nowrap="nowrap">
				 <input type="text" name="reason" id="reason" style="width: 100%;" maxlength="50" onkeypress="return AllowChars(event);"/>
 			</td>  		
  		</tr>
  		<tr id="isActiveRowEdit" style="display: none;">
  			<td class="classlangTestleft_TD" nowrap="nowrap">
  				Language Test Status
  			</td>
  			<td class="classlangTestright_TD" nowrap="nowrap">
  				<%if(languageTestIsActive.equalsIgnoreCase("1")){%>
  					<input type="radio" name="langStutas" id="langStutas" value="1" checked="checked"/>Active
  					<input type="radio" name="langStutas" id="langStutas" value="0"/>Inactive
  				<%}else{%>
  					<input type="radio" name="langStutas" id="langStutas" value="1"/>Active
  					<input type="radio" name="langStutas" id="langStutas" value="0" checked="checked"/>Inactive
  				<%}%>
	            <input type="hidden" name="languageIsActive" id="languageIsActive" value="<%=languageTestIsActive%>"/>
  			</td>  		
  		</tr>
  		<tr id="isActiveDisplayButton">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="center">
				            <input type="button" name="LangTestView" id="LangTestView" value="View" class="buttonSmall" onclick="showScriptPartA('<%=languageTestId%>');"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="callLangTestMainPage" id="callLangTestMainPage" value="Add" class="buttonSmall" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Admin_Add_Language_Test.jsp'"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="editLangStatus" id="editLangStatus" value="Edit" class="buttonSmall" onclick="return displayEditDiv();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="LangTestDelete" id="LangTestDelete" value="Delete" class="buttonSmall" onclick="return displayDeleteDiv();"/>
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
				            <input type="submit" name="editLangStatus" id="editLangStatus" value="Update" class="buttonSmall" onclick="return updateDetails();"/>
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
				            <input type="button" name="deleteLangStatus" id="deleteLangStatus" value="Delete" class="buttonSmall" onclick="return deleteFinalLangTest();"/>
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
