<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
    
  	String CandidateId =(String)request.getParameter("canId");
    System.out.println("CandidateId===+++++"+CandidateId);
  	if(CandidateId==null)
  	{
  		response.sendRedirect("../../jsp/Login.jsp");
  	}
  	String ColorType=(String)request.getParameter("ColorType");
    System.out.println("ColorType===+++++"+ColorType);
  	if(ColorType==null)
  	{
  		response.sendRedirect("../../jsp/Login.jsp");
  	}
  	
  	Connection connection=ConnectDatabase.getConnection();	
  	
  	//***********************************************//
  	        String FirstName=null;
		  	String LastName=null;
		  	String PhoneNumber=null;
		  	String Email=null;	
			Statement stmts=null;
			ResultSet rss = null;
			CallableStatement cs=null;
			try
			{
				connection=ConnectDatabase.getConnection();									
				stmts = connection.createStatement();
				String strProcedure="{call CandListPopUp_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=connection.prepareCall(strProcedure);
				cs.setString(1,CandidateId);
		        cs.setString(2,EDKey);
		        cs.setString(3,EDKPass);
				rss=cs.executeQuery();
				System.out.println("Executed the procedure:::::"+strProcedure);
	    	
		if (rss.next())
		 {
			 FirstName=rss.getString("First_Name");
			 System.out.println("FirstName:::"+FirstName);
			 LastName=rss.getString("Last_Sir_Name");
			 System.out.println("LastName"+LastName);
			 Email=rss.getString("Email");
			 System.out.println("Email"+Email);
			 PhoneNumber=rss.getString("Phone");
			 System.out.println("PhoneNumber"+PhoneNumber);
		}
		}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
		 
		 //***************************////
  	 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Common.css">
	<script type="text/javascript" src="<%=recruitPath%>js/tcal.js"></script> 
	<script type="text/javascript" language="javascript">	
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
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
	</script>
  </head>
  
   <body>
 <form name="BioForm" method="post" >
 
					<table width="100%" cellpadding="6" cellspacing="6" border="0" >
						<tr>
							<td align="left" class="allBackColor" style="background-color: #d8d8d8;">
								<b> Candidate Info:</b>
							</td>
						</tr>
						<%
						connection=ConnectDatabase.getConnection();		
						Statement stmt=connection.createStatement();
						Statement stmt2=connection.createStatement();
						ResultSet rs=null;
						ResultSet rs2=null;
						String canName;
						Date dateStr;
						Date dateDOR;
						SimpleDateFormat formatter;
						String DOB;
						String DOR;
						String CandidateID = null;
						String CandidatePhone=null;
						String CandidateEmail=null;
						String CandIDs=null;
						int appyingFor = 0;
						String appyingForDISP = null;
						int candStatus = 0;
						String candStatusDisp = null;
						//***********Single Candidate Details procedure******************//
						CallableStatement singleCandDtls = null;
						String strSnglCandDtlsProc = "{call SingleCandDetailsPopUp_Encrypt_Proc(?,?,?)}"; //your procedure name
						System.out.println("strCandDtlsProc"+strSnglCandDtlsProc);
						singleCandDtls=connection.prepareCall(strSnglCandDtlsProc);
						singleCandDtls.setString(1,CandidateId);
						singleCandDtls.setString(2,EDKey);
				        singleCandDtls.setString(3,EDKPass);
						rs=singleCandDtls.executeQuery();
						if(rs.next())
						{
						CandidateID = rs.getString("Bpo_Cand_Id");
						canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
		  				System.out.println("canName:::::"+canName);
		  				dateStr = rs.getDate("Cand_DOB");
		  				formatter = new SimpleDateFormat("dd MMM yyyy");
		  				DOB = formatter.format(dateStr);  
		    			System.out.println("DOB:::::"+DOB);
		    			CandIDs= rs.getString("Bpo_Cand_Id");
		    			System.out.println("CandIDs:::::"+CandIDs);
		    			dateDOR = rs.getDate("System_Date_Time");
		    			System.out.println("dateDOR:::::"+dateDOR);
		    			DOR = formatter.format(dateDOR);
		    			System.out.println("DOR:::::"+DOR);
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
						<tr>
				            <td align="left" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">               	
				            	<table cellpadding="6" cellspacing="6" border="0" width="100%">
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
								            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=CandIDs%>" width="105" height="60" alt="image" />
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
					<%
						}
						rs.close();
						System.out.println("Executed the procedure strSnglCandDtlsProc:::::"+strSnglCandDtlsProc);
						//***********End Single Candidate Details procedure**************//
						 %>
					<tr>
						<td align="left" class="allBackColor" style="background-color: #d8d8d8;">
							 <%
							 	//***********Candidate Details procedure**************//
								stmt = connection.createStatement();
				                CallableStatement candDtls=null;
								String strCandDtlsProc="{call CandDetailsPopUp_Encrypt_Proc(?,?,?,?,?,?,?,?)}"; //your procedure name
								System.out.println("strCandDtlsProc"+strCandDtlsProc);
								candDtls=connection.prepareCall(strCandDtlsProc);
								candDtls.setString(1,CandidateId);
								candDtls.setString(2,FirstName);
								candDtls.setString(3,LastName);
								candDtls.setString(4,Email);
								candDtls.setString(5,PhoneNumber);
								candDtls.setString(6,ColorType);
						        candDtls.setString(7,EDKey);
						        candDtls.setString(8,EDKPass);
								rs=candDtls.executeQuery();
								System.out.println("Executed the procedure:::::"+strCandDtlsProc);
					           //***********End of Candidate Details procedure**************//
								
								//***********Candidate Count procedure**************//
								connection=ConnectDatabase.getConnection();									
				                stmt2 = connection.createStatement();
				                CallableStatement candCount=null;
								String strCandCountProc="{call CandCountPopUp_Encrypt_Proc(?,?,?,?,?,?,?,?)}"; //your procedure name
								System.out.println("strCandCountProc:::::"+strCandCountProc);
								candCount=connection.prepareCall(strCandCountProc);
								candCount.setString(1,CandidateId);
								candCount.setString(2,FirstName);
								candCount.setString(3,LastName);
								candCount.setString(4,Email);
								candCount.setString(5,PhoneNumber);
								candCount.setString(6,ColorType);
						        candCount.setString(7,EDKey);
						        candCount.setString(8,EDKPass);
								rs2=candCount.executeQuery();
								System.out.println("Executed the procedure:::::"+strCandCountProc);
					           //***********End of Candidate Count procedure**************//
							  
							  int CandidateCount=0;
					       if(rs!=null)
					     {
					 	if(rs2.next())
						{
							CandidateCount=rs2.getInt("Count");
							System.out.println("CandidateCount:::::"+CandidateCount);
							  %>
						 <b>Match found:</b> <font color="#FF0000"><b><%=CandidateCount%></b></font>     	
						</td>
					</tr>
					  <%
						}
						
						if(CandidateCount> 0)
						{
							int cntr=0;
							while(rs.next())
							{
								CandidateID = rs.getString("Bpo_Cand_Id");
								canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
				  				System.out.println("canName:::::"+canName);
				  				dateStr = rs.getDate("Cand_DOB");
				  				formatter = new SimpleDateFormat("dd MMM yyyy");
				    			CandIDs= rs.getString("Bpo_Cand_Id");
				    			System.out.println("CandIDs:::::"+CandIDs);
				    			DOB = formatter.format(dateStr);  
				    			System.out.println("DOB:::::"+DOB);
				    			dateDOR = rs.getDate("System_Date_Time");
				    			System.out.println("dateDOR:::::"+dateDOR);
				    			DOR = formatter.format(dateDOR);
				    			System.out.println("DOR:::::"+DOR);
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
						<tr>
				            <td align="left" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">               	
				            	<table cellpadding="6" cellspacing="6" border="0" width="100%">
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
								            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=CandIDs%>" width="105" height="60" alt="image" />
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
	                    <tr>
	                        <td class="allBackColor" style="background-color: #d8d8d8; height: 5px; padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
	                           &nbsp;
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
        <!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->
	 </body>
</html>
