<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp"%>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
    System.out.println("USER_Name in stability check score page::::"+USER_Name);
	String candID = (String) request.getParameter("candId");
	System.out.println("candID===" + candID);
	String pagevalue = (String) session.getAttribute("page");
	System.out.println("pagevalue===" + pagevalue);
	
%>
<%
	String SID = request.getParameter("stabilityid");
	System.out.println("SID" + SID);
	if (SID == null) {

		Integer partid = 1;
		int questionid = 1;
%>
<%
	try {
			    Connection con = ConnectDatabase.getConnection();
			    String recruiterName = null;
				String recruiterid = null;
		        String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_Name='" + USER_Name + "'";
				System.out.println("query " + secqryrecruiter);
				Statement stmtsrec = con.createStatement();
				ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
				if (rssrec.next())
				 {
	                    recruiterName = rssrec.getString("Emp_Name");
						recruiterid = rssrec.getString("Emp_ID");
						System.out.println("recruiterid::::" + recruiterid);
				}
					String firstname = null;
					String middlename = null;
					String cid = null;
					String higeduc = null;
					int Reveexp = 0;
			        int ReveexpMts=0;
			        int ReveexpYrs = 0;
				    int nonReveexp = 0;
				    int nonReveexpMts=0;
				    int nonReveexpYrs = 0;
				    int ApplyingFor=0;
				    String imagepath = null;
					Statement stmts=null;
					ResultSet rss = null;
					CallableStatement cs=null;
					con=ConnectDatabase.getConnection();									
					stmts = con.createStatement();
					String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
					System.out.println("strProcedure"+strProcedure);
					cs=con.prepareCall(strProcedure);
					cs.setString(1,candID);
			        cs.setString(2,EDKey);
			        cs.setString(3,EDKPass);
					rss=cs.executeQuery();
			if (rss.next())
		    {
					cid = rss.getString("AutoID");
					System.out.println("candidateid" + cid);
					candID = rss.getString("Bpo_Cand_Id");
					firstname = rss.getString("First_Name");
					middlename = rss.getString("Middle_Name");
					ApplyingFor=rss.getInt("Applying_For");
					higeduc = rss.getString("Qualification");
					Reveexp = rss.getInt("RelevantExprience");
					System.out.println("RelevantExprience"+Reveexp);
					ReveexpMts=Reveexp%12;
					System.out.println("RelevantExprience:::ReveexpMts"+ReveexpMts);
					ReveexpYrs=Reveexp/12;
					System.out.println("RelevantExprience::ReveexpYrs"+ReveexpYrs);
					nonReveexp = rss.getInt("NONRelevantExprience");
					System.out.println("Non RelevantExprience"+nonReveexp);
					nonReveexpMts=nonReveexp%12;
					System.out.println("Non RelevantExprience:::nonReveexpMts"+nonReveexpMts);
					nonReveexpYrs=nonReveexp/12;
					System.out.println("Non RelevantExprience:::nonReveexpYrs"+nonReveexpYrs);
					imagepath = rss.getString("ImagePath");

			}
					//*******Qualification Group Code*********//
					Statement stQualification=null;
					ResultSet rsQualification=null;
				    String QualificationGroupName="";
				    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
					stQualification=con.createStatement();
					rsQualification=stQualification.executeQuery(queryForqualification);
					if(rsQualification.next())
			    	{	
			    	QualificationGroupName=rsQualification.getString("QualificationGroupName");
			    	System.out.println("QualificationGroupName"+QualificationGroupName);
			    	}
				    rsQualification.close();
				    stQualification.close();
				    //*****End ofQualification Group Code*****//
			
			         //**************Applying For*****************//
		    	    Statement stApplyingFor=null;
					ResultSet rsApplyingFor=null;
				    String ApplyingForName="";
				    String queryApplyingFor="SELECT Program_type_Name FROM  program_type_master Where Program_Type_Id='"+ApplyingFor+"'";
					stApplyingFor=con.createStatement();
					rsApplyingFor=stApplyingFor.executeQuery(queryApplyingFor);
					if(rsApplyingFor.next())
			    	{	
			    	ApplyingForName=rsApplyingFor.getString("Program_type_Name");
			    	System.out.println("ApplyingForName"+ApplyingForName);
			    	}
				    rsApplyingFor.close();
				    stApplyingFor.close();
		    	
		    	//**************End of Applying For*****************//	
			
			        String secQsncandidate = "SELECT Candidate_ID FROM stability_chk_master where Candidate_ID='"+ cid + "' and End_date is null" ;
					System.out.println("query " + secQsncandidate);
					Statement stmtcandidate = con.createStatement();
					ResultSet rsscandidate = stmtcandidate.executeQuery(secQsncandidate);
					boolean state=rsscandidate.next();
				    System.out.println("state"+state);
				    if(state==false)
				    {
					CallableStatement proc = null;
					proc = con.prepareCall("{ call Stability_Chk_Proc(?,?)}");
					//proc.clearParameters();
					System.out.println(proc);
					System.out.println("recruiterid::::" + recruiterid);
					proc.setString(1, recruiterid);
					proc.setString(2, cid);
					proc.execute();
					System.out.println(proc);
					System.out.println("Update succesfull!!");
					}
					String StartDateTime=null;
					String insertQuery = "SELECT now()";
				    System.out.println("query " + insertQuery);
				    Statement statement = con.createStatement();
				    ResultSet resultset = statement.executeQuery(insertQuery);
					if (resultset.next()) 
					  {
						StartDateTime = resultset.getString(1);
						System.out.println("StartDateTime" + StartDateTime);
					  }
%>
<html>
	<head>
		<title>[24]7 Stability Check Score</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">

<!-- Char allowing scripts --> 
<script type="text/javascript">
	function AllowChars(evt)
	{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	      // alert(charCode);
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
<!-- End of script -->

<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
		<script type="text/javascript">
function calcscore()	 
		 {
		    var QInfo=document.getElementById("hQCounts").value;
		    tmpQInfo = QInfo.split("-");
		    var total=0;
		    for(var i=1;i<=tmpQInfo.length;i++)
			 {
				for(var j=1;j<=tmpQInfo[i-1];j++)
				 { 
				   var tmpScore=document.getElementById("P" + i + "Q" + j + "Score").value;
				   if(tmpScore != "")
				   {
				   total = total + parseInt(tmpScore);
				   }
				 }
			 }
		   	document.getElementById("display").value=total; 
		 }	
	
function CheckValidation()	 
		 {
	    var QInfo=document.getElementById("hQCounts").value;
	    tmpQInfo = QInfo.split("-");
	    for(var i=1;i<=tmpQInfo.length;i++)
		 {
			for(var j=1;j<=tmpQInfo[i-1];j++)
			 { 
			   var tmpSelectedIndex=document.getElementById("P" + i + "Q" + j + "Score").selectedIndex;
			   if(tmpSelectedIndex == 0) 
               {
                 alert ( 'Please select a valid score for Part ' + i + ' Question ' + j + '.'); 
                 document.getElementById("P" + i + "Q" + j + "Score").focus();
                 return false;
                }
               var tmpSelectedElement=document.getElementById("P" + i + "Q" + j + "Score").value;
               if(tmpSelectedElement!=0)
			   {
			   var tmpComment=document.getElementById("P" + i + "Q" + j + "Comment").value;
			   if(tmpComment == 0) 
               {
                 alert ( 'Please enter a valid Comment for Part ' + i + ' Question ' + j + '.'); 
                 document.getElementById("P" + i + "Q" + j + "Comment").focus();
                 return false;
                }
                }
                 }
			  }
			 if(document.getElementById("comments").value=='')
			{
				var appStr = 'Please Enter Overall Comments !!!';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			else
			if (( stabilitysubmitform.select[0].checked == false ) && ( stabilitysubmitform.select[1].checked == false )&&( stabilitysubmitform.select[2].checked == false ) ) 
			{ 
				 alert ( "Please choose the status(Select/Hold/Reject)" );
				 return false;
		    }
			document.getElementById('Submit').style.display="none";
            document.getElementById("processing").style.display="";
		 }	
		 
	
</script>

<style type="text/css">

html,body
 {
	margin: 0px;
 }
 
.contentSize
	{
		border: 0px solid #FFFFFF;
	    clear: both;
	    display: block;
	    overflow: hidden;
	    padding-left: 0px;
	    width: 920px;
	    vertical-align: middle;
	}
.wrapper
	{
		margin: 0 auto;
    	width: 920px;
	}

</style>

		<script type="text/javascript" language="javascript">

 function logout()
 {
 location.href = "<%=logoutPage%>";
 }
</script>

		<script language="JavaScript">
function backButtonOverride()
{
 
  setTimeout("backButtonOverrideBody()", 1);

}

function backButtonOverrideBody()
{
  // Works if we backed up to get here
   //alert("3");
  try 
  {
    history.forward();
  } 
  catch (e) 
  {
   
  }
 
}
</script>

	</head>

	<body>

		<table cellpadding="0" cellspacing="0" width="100%">
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
			<tr>
				<td align="left" style="padding-left: 10px;">
					<font
						style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > 
						<a href="<%=recruitPath%>jsp/Voice_Home.jsp">Voice</a> >
						<a href="<%=recruitPath%>jsp/Stability_Check.jsp">StabilityCheck</a> ></font>
					<font style="color: #000000; font-weight: bold; font-size: 12px; font-family: Arial;">Score</font>
				</td>
				<td align="right" style="padding-right: 10px;">
                <b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				
					<%
						if (request.getAttribute("DuplicateCheck") != null)
						 {
						String DuplicateCheck = (String) request.getAttribute("DuplicateCheck");
						 if (DuplicateCheck.equalsIgnoreCase("Already_Inserted")) 
						 {
					%>
					<div align="center">
						<span class="register" style="color: red; font-weight: bold;">
							Data already Exists!! </span>
					</div>
					<%
						}
							}
					%>
              <br/>
					<!-- ############################################ -->
          <div class="wrapper">
                <div class="contentSize">
			<form action="<%=request.getContextPath()%>/StabiltyChkTest" method="post" id="stabilitysubmitform" name="stabilitysubmitform"  onsubmit="return CheckValidation();">
				<table width="920px" cellspacing="6" cellpadding="6" border="0">
					<tr>
					<%
                 if(imagepath==null)
           		{
            	 %>
	            	<td width="120px" rowspan="3" style="padding: 0px;"> 
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="90px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
                        <td width="120px" rowspan="3" style="padding: 0px;"> 
							<img src="<%=recruitPath%>/jsp/displayImageView.jsp?CID=<%=candID%>" width="120px" height="90px" alt="image" />
						</td>
						<%} %>
						<td width="350px" class="allBackColor" id="candidateid" align="left"><%=candID%>
							<input type="hidden" name="candidateid" value="<%=cid%>" />
							<input type="hidden" name="recruitername" value="<%=recruiterName%>">
							<input type="hidden" name="starttime" value="<%=StartDateTime%>">
							<input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" />
							
						</td>
						<td width="300px"  class="allBackmain" align="left">
							<b>Highest Education</b>
						</td>

						<td width="170px" class="allBackColor" align="left">
						<%if(higeduc.equalsIgnoreCase("0")) {%>NA
			            <%}else{ %>
		              <%=QualificationGroupName%>
		                  	 <%} %>
						</td>
					</tr>
					<tr>
						<td class="allBackColor" align="left"><%=firstname%>&nbsp;<%=middlename%></td>
						<td class="allBackmain" align="left">
							<b>Customer Interaction Experience</b>
						</td>
						<td class="allBackColor" align="left">
						<%if(Reveexp==0) { %>
						 Fresher
						<%} else { %>
					<%=ReveexpYrs%> Years <%=ReveexpMts %> Months
						<%} %>
						</td>
					</tr>
					<tr align="left">
						<td class="allBackColor">
							<%=ApplyingForName %>
						</td>
						<td class="allBackmain">
							<b>Other Experience</b>
						</td>
						<td class="allBackColor">
						<%if(nonReveexp==0){ %>
						Fresher
						<%}else { %>
              <%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
						<% } %></td>
					</tr>
			
					<%
						
						int rowcnt = 0;
						String PIDs = "";
						String QIDs = "";
						String QCounts = "";
						String description = null;
						String Porderno = null;
						Statement stmtpartid,stmtpart=null;
						Statement stmt1=null;
						ResultSet rsspartid,rsspart=null;
						ResultSet rs1=null;
						String secqrypartid = "select Part_Description,Part_Id,order_no from Stability_part_master where isalive=1 order by order_no";
						System.out.println("Part id " + secqrypartid);
						stmtpartid = con.createStatement();
						rsspartid = stmtpartid.executeQuery(secqrypartid);
					while (rsspartid.next()) {
						description = rsspartid.getString("part_description");
						rowcnt = rsspartid.getRow();
						System.out.println("Row number::" + rowcnt);
						partid = rsspartid.getInt("part_id");
						Porderno = rsspartid.getString("order_no");
						System.out.println("Part id " + partid);
						ArrayList<Integer> al = new ArrayList<Integer>();
						al.add(partid);
						System.out.println("Part id ::::" + al);
					%>
					<tr>
						<td colspan="4" class="allBackheading" align="left">
							Part-<%=Porderno%>&nbsp;<%=description%></td>
					</tr>
					<tr class="allBackmain" align="center">
						<td colspan="1">Sl.No</td>
						<td align="left">Question</td>
						<td>Comments</td>
					    <td>Score</td>
					</tr>
	                <%
						String Question = null;
						String qorderno = null;
						String secpart = "select Question_Id,Question,order_no from stability_check_question_master where isalive=1 and  part_id="+ partid + " order by order_no";
						System.out.println("Stability table details " + secpart);
						stmtpart = con.createStatement();
						rsspart = stmtpart.executeQuery(secpart);
						while (rsspart.next()) {
						questionid = rsspart.getInt("Question_Id");
						Question = rsspart.getString("Question");
						qorderno = rsspart.getString("order_no");
					%>
					<tr align="center">
						<td  class="allBackColor" colspan="1"><%=qorderno%></td>
						<td  class="allBackColor" align="left"><%=Question%></td>
						<td  style="background-color: #F2F2F2;">
							<textarea name="P<%=Porderno%>Q<%=qorderno%>Comment"  id="P<%=Porderno%>Q<%=qorderno%>Comment" rows="2" style="width: 100%; resize: none" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
						</td>
						<td class="allBackColor">
						<select name="P<%=Porderno%>Q<%=qorderno%>Score" size="1" id="P<%=Porderno%>Q<%=qorderno%>Score" onchange="calcscore()" style="width: 100%; color: #342826; text-align: center">
							 <option value="">Select</option>
		               	<%
								String secQsnQry1 = "select *  from stabitlity_scores_master order by score";
								System.out.println("query " + secQsnQry1);
								stmt1 = con.createStatement();
								rs1 = stmt1.executeQuery(secQsnQry1);
								while (rs1.next()) {
	                     %>
								<option value="<%=rs1.getString("score")%>"><%=rs1.getString("score")%></option>
							<%
							}
											if (QIDs != "") {
												QIDs = QIDs + '-' + questionid;
											} else {
												QIDs = "" + questionid;
											}
						%>
                      			<option value="0">NA</option>
							</select>
						</td>
					</tr>
	
				<%
					}
						if (PIDs != "") {
									PIDs = PIDs + '-' + partid;
										} else {
											PIDs = "" + partid;
										}
										if (QCounts != "") {
											QCounts = QCounts + '-' + qorderno;
										} else {
											QCounts = "" + qorderno;
										}
									}
									System.out.println("value:::::" + PIDs);
									System.out.println("value:::::" + QIDs);
									System.out.println("value:::::" + QCounts);
						%>
					
				  
                     <tr>
				       <td class="allBackheading" align="center" colspan="4">Mention all verbatim - in the interview form
						<input id="hPIDs" type="hidden" name="hPIDs" value="<%=PIDs%>" />
						<input id="hQIDs" type="hidden" name="hQIDs" value="<%=QIDs%>" />
						<input id="hQCounts" type="hidden" name="hQCounts" value="<%=QCounts%>" />
				      </td>
				    </tr>
				      <tr>
						<td  class="allBackmain" align="center" colspan="1">
								<b>Overall Comments</b>
						</td>
						<td class="allTdBackColor" colspan="3">
					 <textarea name="comments" style="width: 100%" rows="4" id="comments" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
						</td>
					</tr>
                    <tr>
					     <td class="allBackmain" align="center">
								<b>TOTAL SCORE</b>
						</td>
						<td class="allBackColor" align="center">
						<b><input type="text" id="display" name="display" value="0" readonly="readonly" style="background: #F2F2F2; border-left: #F2F2F2; border-top: #F2F2F2; border-bottom: #F2F2F2; border-right: #F2F2F2; text-align: center" />
                         </b>
						</td>
								
				  <td colspan="2" align="center">
					<table border="0" width="100%">
					     <tr>
					        <td nowrap="nowrap" style="font-family: Arial;font-size: 12px;color: #41383C;">
							<input type="radio" name="select" value="1" style="padding-left: 10px;"/>Select
							<input type="radio" name="select" value="2" style="padding-left: 10px;"/>Hold
							<input type="radio" name="select" value="3" style="padding-left: 10px;"/>Reject
						   </td>
						   <td align="left">
						        <input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmall" />
						  </td>
						  <td>
						   <input name="Submit" id="Submit" type="submit" value="Submit" class="buttonSmall" onClick="return CheckValidation(this.form);" />
					      <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
					      </td>	
					  </tr>
				   </table>
				  </td>
				 </tr>
						<%
						   
                        rs1.close();
						stmt1.close();
						rsspart.close();								
						stmtpart.close();
						rsspartid.close();						
						stmtpartid.close();
						rsscandidate.close();
						stmtcandidate.close();
						rssrec.close();
						stmtsrec.close();
						rsscandidate.close();
						stmtcandidate.close();
						con.close();
							} catch (Exception ex) {
									System.out.println("=========" + ex.getMessage());
									ex.printStackTrace();
								}
							}
						%>
</table>
					</form>
					</div>
					</div>
					<br/>
					<!-- ############################################ -->
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			<tr class="footerBackColor">
				<td align="left" valign="middle"
					style="background-color: #808080; color: #FFFFFF; font-weight: bold; height: 21px; font-size: 9px; font-family: Arial; padding-left: 5px;"
					colspan="1">
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          