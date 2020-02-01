<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@ include file="GlobalDeclare.jsp" %>


<html>
  <head>
    <title>[24]7 SPRINGBORD </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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
    function showScriptPartA(getMockId)
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_Mock_Test.jsp?getMockId="+getMockId;
		someWindow = window.open(url,'ReasonWindow','height=350,width=800,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
</script>
	
	<script type="text/javascript">	
		function displayEditDiv()
		{	
			document.getElementById("isActiveMockDisplayButton").style.display = "none";			
			document.getElementById("isActiveDispTR").style.display = "none";
			document.getElementById("isActiveChangeTR").style.display = "";
			document.getElementById("isActiveButtonEdit").style.display = "";
		}
		function displayDeleteDiv()
		{
			document.getElementById("isActiveMockDisplayButton").style.display = "none";				
			document.getElementById("deleteDisplayRow").style.display = "";		
			document.getElementById("isDeleteButtonEdit").style.display = "";			
		}
		function enableOldField()
		{
			document.getElementById("isActiveChangeTR").style.display = "none";
			document.getElementById("isActiveDispTR").style.display = "";
			document.getElementById("isActiveButtonEdit").style.display = "none";			
			document.getElementById("deleteDisplayRow").style.display = "none";
			document.getElementById("isDeleteButtonEdit").style.display = "none";			
			document.getElementById("isActiveMockDisplayButton").style.display = "";
		}	
	</script>
	
<script type="text/javascript">
function updateDetails()
{
		var LangNewIsActive = document.getElementById("Mockstatus").checked;
		var IsActive = document.getElementById("mockStatusID").value;
	
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
				alert("Can't deactivate all mockchat tests!! At least one must be active.");
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
function deleteFinalMockTest()
{
	var LangIsActive = parseInt(document.getElementById("mockStatusID").value);
	if(LangIsActive == 1)
	{
		var ActiveTestCt = parseInt(document.getElementById("ActiveTestCount").value);
		if(ActiveTestCt < 2)
		{
			alert("Can't delete the only activate mockchat test!! At least one test, other than the one being deleted, must be active.");
			return false;
		}
	}
	var reason = document.getElementById("reason").value;
	var languageDeleteID = document.getElementById("chatScriptId").value;
	var mockStatusID = document.getElementById("mockStatusID").value;
	if(reason == null || reason == '' || reason.trim().length == 0)
	{
		alert('Please enter delete reason !');
		document.getElementById("reason").focus();
		return false;
	}
	if(confirm('Are you sure you want to delete this mockchat test? It will be removed permanently from the list of mockchat tests.'))
	{
		top.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/DeleteMochChatTest.jsp?deleteTestId='+languageDeleteID+'&deleteTestIdStatus='+mockStatusID+'&reason='+reason;
	}
}
	</script>
 
  </head>
  <body>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String ques = "";
	String testQuesName = "";
	String mockStatus = "";
	String MockChatQuesID = request.getParameter("MockChatQuesID");
	ArrayList<String> arrQues = new ArrayList<String>();
	if(MockChatQuesID !=null)
	{
	try
	{
		String query="SELECT Chat_Script_Id, Chat_Question_Id, Chat_Question, Is_Active FROM  mock_chat_scripts WHERE Is_Deleted = 0 and Chat_Script_Id ="+MockChatQuesID; 
		System.out.println("query \t"+query);
		con=ConnectDatabase.getConnection();		
		stmt=con.createStatement();
		rs=stmt.executeQuery(query);
		while(rs.next())
		{
			ques = rs.getString("Chat_Question");
			arrQues.add(ques);
			testQuesName = rs.getString("Chat_Script_Id");
			mockStatus = rs.getString("Is_Active");
		}
  	
%>
   <form action="<%= request.getContextPath()%>/EditMockChatTestStatus" method="post">
   <input type="hidden" name="chatScriptId" id="chatScriptId" value="<%=MockChatQuesID%>"/>
   <input type="hidden" name="mockStatusID" id="mockStatusID" value="<%=mockStatus%>"/>
   <input type="hidden" name="ActiveTestCount" id="ActiveTestCount" value="<%=session.getAttribute("ActiveTestCount")%>"/>
   <table width="100%" cellpadding="6" cellspacing="6" border="0" bordercolor="gray">
   	<tr>
   		<td class="classlangTestleft_TD">MockChat Test Name </td>
   		<td class="classlangTestright_TD">
   			MockChat Test <%=testQuesName%>
   		</td>
   	</tr>
   	
   	<tr>
   		<td class="classlangTestleft_TD">MockChat Test Question</td>
   		<td class="classlangTestright_TD">
   		<%
   			Iterator ir = arrQues.iterator();
   			
   			int qNo = 0;
  		%>
  		<div style="overflow-x: hidden; overflow-y: scroll; width: 100%; height: 150px;">
  		<%
   			while(ir.hasNext())
   			{
   				Object objQues= ir.next();
   				%>
   					<b>
  					<%
  					qNo = qNo+1;
  					 %>
  					<%=qNo %>.</b>&nbsp;<%=objQues%><br/><br/>
    				<%
   					System.out.println(objQues);
   			}
   		 %>
   		 </div>
   		 <%	
   				
   		 %>
 		</td>
   	</tr>
   	<tr id="isActiveDispTR">
   		<td class="classlangTestleft_TD">MockChat Test Status</td>
   		<td class="classlangTestright_TD">
   		<%
   		if(mockStatus.equals("1"))
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
   		
   		</td>
   	</tr>

   	<tr id="isActiveChangeTR" style="display: none;">
   		<td class="classlangTestleft_TD">MockChat Test Status</td>
   		<td class="classlangTestright_TD">
   		<%
   		if(mockStatus.equals("1"))
   		{
   		%>
   			<input type="radio" name="Mockstatus" id="Mockstatus" value="1" checked="checked">Active
   			<input type="radio" name="Mockstatus" id="Mockstatus" value="0" >Inactive
   		<%
   		}
   		else
   		{
   		%>
    		<input type="radio" name="Mockstatus" id="Mockstatus" value="1">Active
   			<input type="radio" name="Mockstatus" id="Mockstatus" value="0" checked="checked">Inactive   			
   		<%
   		}
   		%>
   		
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
   	
	<tr id="isActiveMockDisplayButton">
          <td colspan="2" align="center">
          	<table border="0" cellpadding="0" cellspacing="0" width="100%">
          		<tr>
          			<td align="center">
		           	 	<input type="button" name="MockTestView" id="MockTestView" value="View" class="buttonSmall" onclick="showScriptPartA('<%=MockChatQuesID%>');"/>
          			</td>
          			<td style="width: 15px;">&nbsp;</td>
          			<td align="center">
		            	<input type="button" name="AddMockChatTest" id="AddMockChatTest" value="Add" class="buttonSmall" onclick="javascript:parent.location.href='<%=request.getContextPath()%>/247Recruit/jsp/Admin_Add_MockChat_Test.jsp?opId=1'"/>
          			</td>
          			<td style="width: 15px;">&nbsp;</td>
          			<td align="center">
		            	<input type="button" name="EditMockChatStatus" id="EditMockChatStatus" value="Edit" class="buttonSmall" onclick="return displayEditDiv();"/>
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
			            <input type="button" name="reset" id="reset" value="Cancel" class="buttonSmall" onclick="return enableOldField();"/>
           			</td>
           			<td style="width: 15px;">&nbsp;</td>
           			<td align="left">
			            <input type="submit" name="editMockStatus" id="editMockStatus" value="Update" class="buttonSmall" onclick="return updateDetails();"/>
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
				            <input type="button" name="deleteMockStatus" id="deleteMockStatus" value="Delete" class="buttonSmall" onclick="return deleteFinalMockTest();"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr> 
   	
   </table>
   </form>
<%

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
 %>
   
  </body>
</html>
