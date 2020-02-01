<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
    System.out.println("USER_Name in source target page::::"+USER_Name);
  	
   %>
<%


// String EDKey="[24]7";
// String EDKPass="247Cust0m3r";		

String fName=request.getParameter("txtFirstName");
System.out.println("fName \t"+fName);

String lName=request.getParameter("txtLastName");
System.out.println("fName \t"+lName);

String dob=request.getParameter("date");
System.out.println("dob \t"+dob);

String phone=request.getParameter("txtPhone");
System.out.println("phone \t"+phone);

String dor=request.getParameter("txtDOR");
System.out.println("dor \t"+dor);

String id=request.getParameter("txtID");
System.out.println("id \t"+id);
if(fName==null)
{
	fName="";
}
if(lName==null)
{
	lName="";
}
if(dob==null)
{
	dob="";
}
if(phone==null)
{
	phone="";
}
if(dor==null)
{
	dor="";
}
if(id==null)
{
	id="";
}


 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
       <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	
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
		function validateCheck()
		{
			var fname = document.getElementById("txtFirstName").value;
			fname = fname.trim();
			var lname = document.getElementById("txtLastName").value;
			lname = lname.trim();
			var date = document.getElementById("date").value;
			date = date.trim();
			var txtPhone = document.getElementById("txtPhone").value;
			txtPhone = txtPhone.trim();
			var txtDOR = document.getElementById("txtDOR").value;
			txtDOR = txtDOR.trim();
			var txtID = document.getElementById("txtID").value;
			txtID = txtID.trim();
			if((fname == '' || fname.length == 0) && (lname == '' || lname.length == 0) && (date == '' || date.length == 0) && (txtPhone == '' || txtPhone.length == 0) && (txtDOR == '' || txtDOR.length == 0) && (txtID == '' || txtID.length == 0))
			{
				alert("Please Enter atleast 1 field!");
				return false;
			}
		}
	</script>

		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->
	   	<script type="text/javascript">
		$(function() {
		$("#txtDOR").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	   
	   	   	<script type="text/javascript">
		$(function() {
		$("#date").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
	<!-- Allow Alphabets Script -->
	<script type="text/javascript">
	function AllowAlphabet(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8) {
			return true;
		}
		else
		{
			alert("Only Alphabets allowed here !!");
			return false;
		}
	}      
   </script>
	<!-- End of Script -->
	
<!-- Number Validation for Input field -->
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
<!-- End of Number Validation -->

<!-- Alpha Numeric Script -->
	<script type="text/javascript">
	function AllowAlphaNumeric(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)) 
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
<!-- End of Alpha Numeric Script -->	
 </head>
  
   <body>
 <form name="BioForm" method="post">
  	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	   <tr>
             <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	     </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
			</td>
		</tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr style="font-size: 14px;">
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > 
	            </font>
	            <font class="nonLink">Candidate Search</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="padding-top:20px; padding-left:30px; padding-right:30px; font-size: 16px; font-family: Times New Roman;" >
					<table width="100%" cellpadding="6" cellspacing="6" border="0">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">Candidate ID</td>
						<td class="allBackColor">
							<input type="text" name="txtID" id="txtID" value="<%=id%>" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">First Name</td>
						<td class="allBackColor">
							<input type="text" name="txtFirstName"   id="txtFirstName" value="<%=fName%>" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">Last Name</td>
						<td class="allBackColor">
							<input type="text" name="txtLastName" id="txtLastName" value="<%=lName%>" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
					</tr>
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">Phone Number</td>
						<td class="allBackColor">
							<input type="text" name="txtPhone" id="txtPhone" value="<%=phone%>" maxlength="10" onkeypress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/>
						</td>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">Date of Birth</td>
						<td class="allBackColor">
							<div><input type="text" name="date"  value="<%=dob%>" readonly="readonly" id="date"/></div>
						</td>
						<td class="allBackColor" style="background-color: #d8d8d8; width: 105px;">Registration Date</td>
						<td class="allBackColor">
							<div><input type="text" name="txtDOR" value="<%=dor%>" readonly="readonly" id="txtDOR"/></div>
						</td>
					</tr>
					<tr>
			            <td colspan="6" align="center">   
			            	<input type="submit" name="submit" value="Search" class="buttonMedium" onclick="return validateCheck();"/>&nbsp;&nbsp;
			            </td>
			        </tr>			        
						 <%
						 	try
							{
						 	boolean rsDataGet = false;
						 	Connection connection=ConnectDatabase.getConnection();		
							//.Statement stmt=connection.createStatement();
							//..Statement stmt2=connection.createStatement();
							ResultSet rs=null;
							ResultSet rs2=null;
							String query="";
							String queryCount="";
							String dateDOB="";
							String dateDOR="";
							
							if(dob.length()>1)
							{
						 		String[] stArray=dob.split("-");
						 		dateDOB=stArray[2] + "-" + stArray[1] + "-" + stArray[0];
						 	}
						 	
						 	if(dor.length()>1)
							{
						 		String[] stArray1=dor.split("-");
						 		dateDOR=stArray1[2] + "-" + stArray1[1] + "-" + stArray1[0];
						 	}
						 		CallableStatement callSearchPageQuery = connection.prepareCall("call ENCRYPT_SearchPage_Proc(?,?,?,?,?,?,?,?)");
							 	callSearchPageQuery.setString(1,fName);
							 	callSearchPageQuery.setString(2,lName);
							 	callSearchPageQuery.setString(3,dateDOB);
							 	callSearchPageQuery.setString(4,dateDOR);
							 	callSearchPageQuery.setString(5,phone);
							 	callSearchPageQuery.setString(6,id);
							 	callSearchPageQuery.setString(7,EDKey);
							 	callSearchPageQuery.setString(8,EDKPass);								 
							 	rs=callSearchPageQuery.executeQuery();
								rs.last();
								int resCount = rs.getRow();
								rs.first();
						  %>
					<tr>
				           <td align="left" colspan="6" style="background-color: #d8d8d8;" class="allBackColor">           	
				                <b>Search Results</b>&nbsp;<img src="<%=recruitPath%>images/bullet4.gif" alt="image" height="8" />&nbsp;Match found :&nbsp;<font color="#FF0000"><b><%=resCount%></b></font>                
				           </td>
				    </tr>
				<%
						//System.out.println(resCount);		
						if(resCount > 0)
						{
							int cntr=0;
							String CandidateID = null;
							String canName;
							Date dateStr;
							Date dateStrDOR;
							SimpleDateFormat formatter;
							String DOB;	
							String DOR;
							int appyingFor = 0;
							String appyingForDISP = null;
							int candStatus = 0;
							String candStatusDisp = null;	
							String CandidatePhone=null;
							String CandidateEmail=null;					
							do 
							{
								System.out.println("in side the while loop "+rsDataGet);
								CandidateID = rs.getString("Bpo_Cand_Id");	
								canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
				  				dateStr = rs.getDate("Cand_DOB");
				  				formatter = new SimpleDateFormat("dd MMM yyyy");
				    			DOB = formatter.format(dateStr);  
				    			dateStrDOR = rs.getDate("System_Date_Time");
				    			System.out.println("DOB:::::"+DOB);
				    			DOR = formatter.format(dateStrDOR);
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
			           		 <td align="left" colspan="6" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">               	
			            		<table cellpadding="6" cellspacing="6" border="0" width="405">
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
				        <tr>
	                        <td class="allBackColor" colspan="6" style="background-color: #d8d8d8; height: 5px; padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
	                           &nbsp;
	                        </td>
	                    </tr>
							<%
								cntr++;
							}while(rs.next());
							}
							
							}
							catch(Exception e)
							{
								System.out.println(e);
								e.printStackTrace();
							}							
												
					 %>
					
				</table>
           </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
			</td>
	    </tr>
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
