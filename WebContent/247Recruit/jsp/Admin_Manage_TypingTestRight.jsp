<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isELIgnored="false" language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
	<head>
	    
		<title>[24]7 SPRINGBOARD</title>
		    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Recruiter.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css">

		<style type="text/css">
			.html,.body,.form
			{
				margin:0px;
			}
			.classtypeTestleft_TD
			{
				width:100px;
				font-size:12px;
				background-color:#D8D8D8;
			}
			.classtypeTestright_TD
			{
				width:200px;
				font-size:12px;
				background-color:#F8F8F8;
			}
		</style>

		<script type="text/javascript">
			function openedittest()
			{
				document.getElementById('disptypeTestName').style.display="";
				document.getElementById('type_Test_Status').style.display="none";
				document.getElementById('type_Test_Edit').style.display="";
				document.getElementById('type_Test_Delete').style.display="none";
				document.getElementById('buttons').style.display="none";
				document.getElementById('type_Edit_Button').style.display="";
			}	
		</script>

		<script  type="text/javascript">
			function opendeletetest()
			{
				document.getElementById('disptypeTestName').style.display="";
				document.getElementById('type_Test_Status').style.display="";
				document.getElementById('type_Test_Edit').style.display="none";
				document.getElementById('buttons').style.display="none";
				document.getElementById('type_Edit_Button').style.display="none";
				document.getElementById('type_Test_Delete').style.display="";
				document.getElementById('type_Delete_Button').style.display="";
			}
		</script>
		
		<script type="text/javascript">
			function cancelButton()
			{
				document.getElementById('disptypeTestName').style.display="";
				document.getElementById('type_Test_Status').style.display="";
				document.getElementById('type_Test_Edit').style.display="none";
				document.getElementById('buttons').style.display="";
				document.getElementById('type_Edit_Button').style.display="none";
				document.getElementById('type_Test_Delete').style.display="none";
				document.getElementById('type_Delete_Button').style.display="none";
			}	
		</script>
		 
		<script type="text/javascript">
			function showScript(getTypeId)
			{
				var url = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_View_Typing_Test.jsp?testTypeId="+getTypeId;
				someWindow = window.open(url,'ReasonWindow','height=540,width=720,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no,align=center');
			}	
		</script>
		<script type="text/javascript">
		function edittypeTestfun()
		{
			if(confirm('Are you sure you want to update this typing test status ?'))
			{
				return true;
			}
			else 
			{
				return false;
			}
		}
		function deleteTestfun()
		{
			var reason = document.getElementById("delete_Reason").value;
			if(reason == null || reason == '' || reason.trim().length == 0)
			{
				alert('Please enter delete reason !');
				document.getElementById("delete_Reason").focus();
				return false;
			}
			if(confirm('Are you sure you want to delete this typing test? It will be removed permanently from the list of typing tests.'))
			{
				return true;
			}
			else 
			{
				return false;
			}
		}
		
		</script>

	</head>
	
	<body > 
		<form action="<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest_AddEditDelete.jsp">
			<% 
				int cur=0;
				String TypeId=request.getParameter("TypeId");
				String TypeName=request.getParameter("Typename");
				String TypeStatus=request.getParameter("Typestatus");
				
				System.out.println("ID(rightpage)::::"+TypeId);
				System.out.println("Tname(rightpage)::::"+TypeName);
				System.out.println("Tstatus(rightpage)::::"+TypeStatus);
				
				session.setAttribute("ID",TypeId);
				session.setAttribute("Typetestname",TypeName);
				session.setAttribute("Typeteststatus",TypeStatus);
				
				if(request.getParameter("hidden")!=null)
				{
					cur=Integer.parseInt(request.getParameter("hidden"));
				}
				try
				{
					Connection connection=ConnectDatabase.getConnection();
					String typingPassage = null;
					String typingHeader = null;
					String typingTestName = null;
					String query="SELECT Typing_Test_Name,PASSAGE,Is_Active FROM bpo_typing_master WHERE TYPING_MASTER_ID='"+TypeId+"'";
					System.out.println("TypeId:::::"+TypeId);
					Statement stmt=connection.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					if(rs.next())
					{
					typingPassage = rs.getString("PASSAGE");
					if(typingPassage == null)
					{
						typingPassage = "No Passage available";
					}
					else
					{
						typingPassage = typingPassage.trim();
					}
					typingTestName = rs.getString("Typing_Test_Name");
					if(typingTestName == null)
					{
						typingTestName = "";
					}
					else
					{
						typingTestName = typingTestName.trim();
					}
					%>
						<div id="disptypeTestName">
							<table cellspacing="6" cellpadding="6" style="width:450px;margin:0px;" border="0">
								<tbody>
									<tr>
										<td class="classtypeTestleft_TD"  nowrap="nowrap">Test Name</td>
										<td class="classtypeTestright_TD" ><%=typingTestName%></td>
									</tr>
									<tr>
										<td class="classtypeTestleft_TD" nowrap="nowrap">Test Passage</td>
										<td class="classtypeTestright_TD" >
											<div style="overflow-x:hidden;overflow-y:scroll;width:100%;height:113px;">
												<%=typingPassage%>
											</div>
									</tr>
									<tr id="type_Test_Status">
										<td class="classtypeTestleft_TD" nowrap="nowrap">Test Status</td>
										<td class="classtypeTestright_TD" nowrap="nowrap">
											<%
											String stattype=rs.getString("Is_Active");
											if(stattype.equals("1"))
											{
												stattype="Active";
												
											}
											else
											{
												stattype="InActive";
											}	
											%>
											<%=stattype %>
											<input type="hidden" id="type_Test_Active" value="active1" name="type_Test_Active">
											<input type="hidden" id="type_Test_Id" value="1" name="type_Test_Id">
											<input type="hidden" id="type_Test_Status" value="active3" name="type_Test_Status">
										</td>
									</tr>
								<%
									String status=rs.getString("Is_Active");
									System.out.println("Edit--Status:::::::::::::::"+status);
									String stat=null;
									if(status!=null)
									{	
										if(status.equals("1"))
										{
								%>
											<tr id="type_Test_Edit" style="display:none;">
												<td class="classtypeTestleft_TD" nowrap="nowrap">Test Status</td>
												<td class="classtypeTestright_TD" nowrap="nowrap">
													<input type="radio" name="type_status" id="type_status" value="Active" checked="checked" />
														Active	
													<input type="radio" name="type_status" id="type_status" value="InActive" />
														InActive	
													<input type="hidden" id="type_Edit_Isactive" value="1" name="type_Edit_Isactive">
												</td>
											</tr>
									<%
										}
										else
										{
									%>
											<tr id="type_Test_Edit" style="display:none;">
												<td class="classtypeTestleft_TD" nowrap="nowrap">Test Status</td>
												<td class="classtypeTestright_TD" nowrap="nowrap">
													<input type="radio" name="type_status" id="type_status" value="Active"  />
														Active	
													<input type="radio" name="type_status"  id="type_status" value="InActive" checked="checked"/>
														InActive
													<input type="hidden" id="type_Edit_Isactive" value="0" name="type_Edit_Isactive">
												</td>
											</tr>
									<%
										}
									}
									session.setAttribute("type_status",stat);
									%>
									
									<tr id="type_Test_Delete" style="display:none;">
										<td class="classtypeTestleft_TD" nowrap="nowrap">Delete Reason</td>
										<td class="classtypeTestright_TD" nowrap="nowrap" style="100%">
											<input type="text" id="delete_Reason" maxlength="50" style="width:100%;" name="delete_Reason" size="30">
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
						<table width="450px">
							<tbody>
								<tr id="buttons">
									<td align="center">
										<input type="button" class="buttonSmall" value="View" id="viewTypeTest" onclick="showScript('<%=TypeId %>');">
									</td>
									<td style="width:15px;"></td>
									<td align="center">
										<strong><input type="button" class="buttonSmall" value="Add" id="addTypeTest" onclick="javascript:parent.location.href='<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest_Add.jsp'"></strong>
									</td>
									<td style="width:15px;"></td>
									<td align="center">
										<input type="button" class="buttonSmall" value="Edit" id="editTypeTest" onclick="return openedittest();">
									</td>
									<td style="width:15px;"></td>
									<td align="center">	
										<input type="button" class="buttonSmall" value="Delete" id="deleteTypeTest" onclick="return opendeletetest();">
									</td>
								</tr>
								<tr id="type_Edit_Button" style="display:none;">
									<td align="center" colspan="2">
										
											<table width="100%" cellspacing="0" cellpadding="0" border="0">
												<tbody>
													<tr>
														<td align="right">
															<input type="reset" id=type_Edit_Cancel value="Cancel" class="buttonSmall" name="type_Edit_Cancel" onclick="return cancelButton();">
														</td>
														
														<td align="left">
															<input type="submit" id="buttons" value="Update" class="buttonSmall" name="buttons" onclick="return edittypeTestfun();">
														</td>
													</tr>
												</tbody>
											</table>
									</td>
								</tr>
								<tr id="type_Delete_Button" style="display:none;">
									<td align="center" colspan="2">
										<table width="100%" cellspacing="0" cellpadding="0" border="0">
											<tbody>
												<tr> 
													<td align="right">
														<input type="button" id="type_Delete_Cancel" value="Cancel" class="buttonSmall" name="type_Delete_Submit" onclick="return cancelButton();">
													</td>
													<td align="left">
														<input type="submit" id="buttons" value="Submit" class="buttonSmall" name="buttons" onclick="return deleteTestfun();">
													</td>
												</tr>
											</tbody>
										</table>					 
									</td>					
								</tr>
							</tbody>												
						</table>	  	
			<%
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>
		</form>
	</body>
</html>
