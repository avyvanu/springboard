<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
    
  	String CandidateId=(String)request.getParameter("canId");
    System.out.println("CandidateId===+++++"+CandidateId);
  	if(CandidateId==null)
  	{
  		response.sendRedirect("../../jsp/Login.jsp");
  	}
  	Connection connection=ConnectDatabase.getConnection();	
  	String FirstName=null;
  	String LastName=null;
  	String PhoneNumber=null;
  	String Email=null;	
	String BpoQuery="select First_Name,Last_Sir_Name,Email,Phone from bpo_candidatesreg_details where Bpo_Cand_Id='"+CandidateId+"'";
  	Statement Bpostmt=connection.createStatement();
  	ResultSet rsBpo=null;
  	rsBpo=Bpostmt.executeQuery(BpoQuery);
  	if(rsBpo.next())
  	{
  	FirstName=rsBpo.getString("First_Name");
  	LastName=rsBpo.getString("Last_Sir_Name");
  	PhoneNumber=rsBpo.getString("Phone");
  	Email=rsBpo.getString("Email");
  	}
   %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>247Recruitment - Candidate Search & Verification</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<script type="text/javascript" src="<%=recruitPath%>js/tcal.js"></script> 
	<script type="text/javascript" language="javascript">	
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
	</script>
  </head>
  
   <body>
 <form name="BioForm" method="post" >
 
					<table width="100%" cellpadding="0" cellspacing="0" border="0" >
					<tr>
						<td align="center">
										 
							 <%
							 	connection=ConnectDatabase.getConnection();		
								Statement stmt=connection.createStatement();
								Statement stmt2=connection.createStatement();
								ResultSet rs=null;
								ResultSet rs2=null;
								String query="";
								String queryCount="";
								query="SELECT * FROM (SELECT * FROM bpo_candidatesreg_details WHERE (First_Name='"+FirstName+"' AND Last_Sir_Name='"+LastName+"') or  Phone='"+PhoneNumber+"' or Email='"+Email+"') bpo where bpo.Bpo_Cand_Id NOT IN ('"+CandidateId+"')"; 
								System.out.println("query:::::"+query);
							 	queryCount="SELECT count(*) as Count FROM (SELECT * FROM bpo_candidatesreg_details WHERE (First_Name='"+FirstName+"' AND Last_Sir_Name='"+LastName+"') or  Phone='"+PhoneNumber+"' or Email='"+Email+"') bpo where bpo.Bpo_Cand_Id NOT IN ('"+CandidateId+"')";
							    System.out.println("queryCount:::::"+queryCount);
							    rs=stmt.executeQuery(query);
							    System.out.println("Result set 1:::::");
								rs2=stmt2.executeQuery(queryCount);
								System.out.println("Result set 2:::::");
							 int CandidateCount=0;
					       if(rs!=null)
					     {
					 	if(rs2.next())
						{
							CandidateCount=rs2.getInt("Count");
							  %>
						 <b>Match found: </b><font color="#FF0000"><b><%=CandidateCount%></b></font>     	
						</td>
					</tr>
					  <%
						}
						
						if(CandidateCount> 0)
						{
							int cntr=0;
							String canName;
							Date dateStr;
							SimpleDateFormat formatter;
							String DOR;
							String CandidatePhone=null;
							String CandidateEmail=null;
							while(rs.next())
							{
								canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
				  				dateStr = rs.getDate("Cand_DOB");
				  				formatter = new SimpleDateFormat("dd MMM yyyy");
				    			DOR = formatter.format(dateStr);  
				    			CandidatePhone=rs.getString("Phone");
				    			CandidateEmail=rs.getString("Email");
							%>
								<tr>
						            <td align="left">               	
						            	<table cellpadding="6" cellspacing="6" border="0">
								        <tr>
								           <%
								            		if(rs.getString("ImagePath")==null)
								            		{
								            	 %>
									            	 <td style="width:80px; padding-left:3px;" align="center">
										            	<img src="<%=recruitPath%>images/default_person.jpg" width="80px" height="80px" alt="image" />
										            </td>
								            	<%}
								            		else
								            		{
								            	%>
								            		 <td style="width:80px; padding-left:3px;" align="center">
										            	<img src="<%=candImgPath%><%=rs.getString("ImagePath")%>" width="80px" height="80px" alt="image" />
										            </td>
								            	<%}%>    
								            
								            	
								            <td align="left">
								                <table cellpadding="6" cellspacing="6" border="0">
								                    <tr>
								                        <td class="tdRight1" style="padding-left: 3px;">
								                          <b> ID: </b>  <%=rs.getString("Bpo_Cand_Id")%>
								                        </td>
								                    </tr>
								                  <tr>
								                        <td class="tdRight1" style="padding-left: 3px;">
								                          <b>Name: </b>  <%=canName %>
								                        </td>
								                    </tr>
								                   <tr>
								                        <td class="tdRight1" style="padding-left: 3px;">
								                          <b>  DOB: </b><%=DOR%>
								                        </td>
								                    </tr>
								                 <tr>
								                        <td class="tdRight1" style="padding-left: 3px;">
								                          <b>  Phone:</b> <%=CandidatePhone%>
								                        </td>
								                    </tr>
								                    <tr>
								                        <td class="tdRight1" style="padding-left: 3px;" nowrap="nowrap">
								                           <b> Email: </b><%=CandidateEmail%>
								                        </td>
								                    </tr>  
								                </table>
								            </td>
								        </tr> 
								        </table>             
						            </td>
						        </tr>
							<%
								cntr++;
								}
							}
							rs.close();
							rs2.close();
							connection.close();
						}
					 %>
			</table>
        </form>
	 </body>
</html>
