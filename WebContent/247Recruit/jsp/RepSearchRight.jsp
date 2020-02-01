<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String  USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
 System.out.println("USER_Name in Rep search right page::::"+USER_Name);
String canId= (String) request.getParameter("candId");
	Statement stmts=null;
	ResultSet rs = null;
	CallableStatement cs=null;
	Connection connection=ConnectDatabase.getConnection();	
	try
	{
		connection=ConnectDatabase.getConnection();									
		stmts = connection.createStatement();
		String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
		System.out.println("strProcedure"+strProcedure);
		cs=connection.prepareCall(strProcedure);
		cs.setString(1,canId);
        cs.setString(2,EDKey);
        cs.setString(3,EDKPass);
		rs=cs.executeQuery();	
%>



<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
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
		function showWindow(CandID,ApplyingFor)
		{
		var url = "<%=recruitPath%>jsp/CandidateInfoPopUp.jsp?CandID="+CandID+"&ApplyingFor="+ApplyingFor;
			if(ApplyingFor == 1)
			{
				someWindow = window.open(url,'WindowStatus','height=350,width=460,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
			}
			else if(ApplyingFor == 2)
			{
				someWindow = window.open(url,'WindowStatus','height=420,width=460,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
			}
		}
	  function showWindowRed()
		{
			var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=1"
			someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		}
		function showWindowYellow()
		{
			var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=2"
			someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		}
	</script>
  </head>
  
  <body>
  <form name="BioForm" >
    <%
    String canName;
	Date dateStr;
	Date dateStrDOR;
	SimpleDateFormat formatter;
	String DOB = null;
	String DOR = null;
	int appyingFor = 0;
	String appyingForDISP = null;
	int candStatus = 0;
	String candStatusDisp = null;	
	String CandidatePhone=null;
	String CandidateEmail=null;	
	String CandidateID = null;
  		if(rs.next())
  		{
  		CandidateID = rs.getString("Bpo_Cand_Id");
  		System.out.println("CandidateID:::::"+CandidateID);	
  		int RAG=rs.getInt("RAG");
  		canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		System.out.println("canName:::::"+canName);
  		dateStrDOR = rs.getDate("System_Date_Time");
  		formatter = new SimpleDateFormat("dd MMM yyyy");
    	DOR = formatter.format(dateStrDOR);  
		appyingFor = rs.getInt("Applying_For");
    	dateStr = rs.getDate("Cand_DOB");
    	DOB = formatter.format(dateStr);  
		CandidatePhone=rs.getString("Phone");
		System.out.println("CandidatePhone:::::"+CandidatePhone);
		CandidateEmail=rs.getString("Email");
		System.out.println("CandidateEmail:::::"+CandidateEmail);
		appyingFor = rs.getInt("Applying_For");
		System.out.println("appyingFor:::::"+appyingFor);
		candStatus = rs.getInt("cand_Status");
		System.out.println("candStatus:::::"+candStatus);
		if(appyingFor != 0 )
		{
   			String qryForApplying = "select Program_type_Name from program_type_master where Program_type_Id = "+appyingFor+"";
   			System.out.println("qryForApplying:::::"+qryForApplying);
   			Statement stmtAppyingFor = connection.createStatement();
			ResultSet rsAppyingFor = stmtAppyingFor.executeQuery(qryForApplying);
			if(rsAppyingFor.next())
			{
				appyingForDISP = rsAppyingFor.getString("Program_type_Name");
				System.out.println("appyingForDISP:::::"+appyingForDISP);
			}
			stmtAppyingFor.close();
			rsAppyingFor.close();
		}
		else
		{
			appyingForDISP = "NA";
		}
		String qryForCandStatus = "select CanStatus from cand_status_master where StatusID  = "+candStatus+"";
		System.out.println("qryForCandStatus:::::"+qryForCandStatus);
		Statement stmtcandStatus = connection.createStatement();
		ResultSet rscandStatus = stmtcandStatus.executeQuery(qryForCandStatus);
		if(rscandStatus.next())
		{
			candStatusDisp = rscandStatus.getString("CanStatus");
			System.out.println("candStatusDisp:::::"+candStatusDisp);
		}
    	%>
  			<table border="0" cellpadding="6" cellspacing="6" width="500px">
      					 <tr>
			           		 <td align="left" colspan="1" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">               	
			            		<table cellpadding="6" cellspacing="6" border="0" width="100%">
			                    	<tr>
			                    		 <td colspan="2" align="center" valign="middle">
						            	  	<%
						            		if(RAG==2)
						            		{
						            	 	%>
						            			<a style="text-align: right;color: maroon;" onclick="showWindowYellow()"><img src="<%=recruitPath%>images/yellow.jpg" width="30" height="30" alt="image" /></a>
						            	 	<%}
						            		else if(RAG==3)
						            		{
						            	 	%>
						            	 		<img src="<%=recruitPath%>images/green.jpg" width="30" height="30" alt="image" />
						            	 	<%}
						            		else
						            		{
						            		 %>
						            			<a style="text-align: right;color: maroon;" onclick="showWindowRed()"> <img src="<%=recruitPath%>images/red.jpg" width="30" height="30" alt="image" /></a>
						            		<%
						            		}
						            		 %>
						            	 </td>
			                    	</tr>
			                    	<tr>
				                        <td class="allBackColor" nowrap="nowrap">
				                           <b>ID: </b> <%=CandidateID%>
				                        </td>
				                        <td class="allBackColor">
				                           <b> Name:</b> <%=canName %>
				                        </td>
			                    	</tr>
			                   		 <tr>
				                        <td class="allBackColor" nowrap="nowrap">
				                           <b> DOR:</b> <%=DOR %>
				                        </td>
				                        <td class="allBackColor">
				                           <b> Applied For: </b><%=appyingForDISP%>
				                        </td>
			                    	</tr>
						        	<tr>
					            		<td rowspan="2" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;" align="center">
						           		<%
						            		if(rs.getString("ImagePath")==null)
						            		{
						            	%>
								            	<img src="<%=recruitPath%>images/default_person.jpg" width="105" height="60" alt="image" />
						            	<%}
						            		else
						            		{
						            	%>
								            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=CandidateID%>" width="105" height="60" alt="image" />
						            	<%}%>    
							            </td>
				                        <td class="allBackColor">
				                           <b> Status: </b>
					                           <%if(candStatus > 5)
					                           {
					                            %>
					                             <a onclick="showWindow('<%=CandidateID%>','<%=appyingFor %>')" style="text-align: right;color: maroon;cursor: pointer" title="Click"><%=candStatusDisp%></a>
					                           <%
					                           }
					                          else
					                          {
					                          %>
					                           <%=candStatusDisp%>
						                       <%
						                       } 
						                       %>
				                        </td>
			                   	 	</tr> 
				                    <tr>
				                        <td class="allBackColor" nowrap="nowrap">
				                           <b> Email: </b><%=CandidateEmail%>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td class="allBackColor" nowrap="nowrap">
				                          <b>  DOB:</b> <%=DOB%>
				                        </td>
				                        <td class="allBackColor">
				                          <b>  Phone:</b> <%=CandidatePhone%>
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
					rs.close();
					stmts.close();
					connection.close();
				 %>
  </body>
</html>
