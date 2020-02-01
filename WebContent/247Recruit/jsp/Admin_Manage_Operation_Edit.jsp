<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%> 
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String programName=(String)session.getAttribute("Program_name");
	System.out.println(":::::Program Name:::::"+programName);
		
	try
	{
		con = ConnectDatabase.getConnection();
		st = con.createStatement();
		String USER_Name = null;
	  	String User_Type_Id = null;
	  	try
	  	{
		  	USER_Name =(String)session.getAttribute("USER_Name");
		  	if(USER_Name == null)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
		  	User_Type_Id = (String)session.getAttribute("User_Type_Id");
		    if(User_Type_Id == null)
			{
			  	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
		}
		catch(Exception e)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		} 	
		
		String recruiterName=null;
		String recruiterid=null;
		String CandidateID = "Candidate Id";
		String higeduc = "Candidate Qualification";
		String fullName = "Candidate FullName";
		String ApplyingFor= "Applied for";
		String CandExp = "Work Experience";
		String CandExpOther = "Other Experience";
		System.out.println(":::::+++++++:::::");
		
%>
		<html>
			<head>
				<title>[24]7 SPRINGBOARD</title>
				
				<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>	
			 	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/addRow.js"></script>	
			
				<style type="text/css">
				html,body,form
				{
					margin: 0px;
				}
				.theader 
				{
				    background: url("<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
				    color: #FFFFFF;
				}
				.classOprnleft_TD
				{
					width: 150px;
					font-size: 12px;
					background-color: #D8D8D8;
					font-family:Verdana, Arial, Helvetica, sans-serif;
				}
				.classOprnleft_TDDYNA
				{
					width: 150px;
					font-size: 12px;
					background-color: #D8D8D8;
					font-family:Verdana, Arial, Helvetica, sans-serif;
				}
				.classOprnright_TD
				{
					width:600px;
					font-size: 12px;
					background-color: #F8F8F8;
					font-family:Verdana, Arial, Helvetica, sans-serif;
				}
				.classOprnright_TD_Qns
				{
					width: 50px;
					font-size: 12px;
					font-family:Verdana, Arial, Helvetica, sans-serif;
				}
				.classOprnright_JS
				{
					width: 300px;
					font-size: 12px;
					background-color: #F8F8F8;
					font-family:Verdana, Arial, Helvetica, sans-serif;
				}
				.reSizeforOther
				{
					width: 100%;
				}
				.setBgStyple
				{
					resize: none; 
					width: 660px; 
					height: 150px; 
					text-align: left; 
					background-color:#f8f8f8; 
					border-bottom-color: gray;	
			
					border-right-color: gray;	
				}
				.delImg
				{
					background-color:#F8F8F8;
					valign:middle;
				}
				.srcvis
				{ 
					background: url('<%=recruitPath%>/images/delO.png') no-repeat; 
					border-style: none;
					cursor: pointer;
					cursor: hand;
					width:16px;
					height:16px;
					font-weight: bold;
					font-size: 11px;
					padding-right: 7px;
					font-weight: bold;
					vertical-align: text-bottom;
					text-align: center;
				}
				
				.contentSize
				{
					border: 0px solid #FFFFFF;
				    clear: both;
				    display: block;
				    overflow: hidden;
				    padding-left: 0px;
				    width: 900px;
				    vertical-align: middle;
				}
				.wrapper
				{
					margin: 0 auto;
			    	width: 900px;
				}
				.alignleft
				{
					float : left;
				}
				.alignright
				{
					float: right;
				}
				
				.buttonSmallnoPointer

				{ 
			
					background: url('../images/Button_Small.png') no-repeat; 
					
					border-style: none;
					
					width:71px;
					
					height:41px;
					font-weight: bold;
					font-size: 11px;
					
					padding-right: 7px;
					padding-bottom: 5px;
					
					font-weight: bold;
					
					vertical-align: text-top;
					
					text-align: center;
			
				}
				</style>
				<script type="text/javascript">
				function ShowDoc(Filepath)
				{
					someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
				}
				</script>
				
				<script type="text/javascript">
				function AllowChars(evt)
				{
					var charCode = (evt.which) ? evt.which : event.keyCode;
					if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) 
					   	|| (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13 
					   	|| charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 
					   	|| charCode == 47 || charCode == 34 || charCode == 39 || charCode == 63)
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
				function edit()
				{
					var t_box = document.getElementById('total_box').value;
					var total_box_Qns;
					var t = 1;
					var tname;
					var s =1;
					var addQues ;
					for(t =1;t<=t_box;t++) 
					{
						var tempPartDesc = document.getElementById( 'partHeader'+ t).value;
						tempPartDesc = "Part-"+t+" "+tempPartDesc;
						document.getElementById('partdiv_td'+ t).innerHTML = tempPartDesc;
						total_box_Qns = document.getElementById('total_box_Qns'+t).value;
						 for (s=1; s<=parseInt(total_box_Qns); s++)
						 {
							addQues = document.getElementById('part'+t+'addQues'+s).value;
							if (addQues.trim() == null || addQues.trim() == "" )
							{
							 	 alert('Please Enter Question '+s+' for Part '+t+'.');
							 	
							 	 document.getElementById('part'+t+'addQues'+s).focus();
							 	 return false;
							 	
							}
							document.getElementById('part' + t + 'sNo' + s).innerHTML = s;
							document.getElementById('part' + t + 'qns' + s).innerHTML = document.getElementById('part'+t+'addQues'+ s).value;
						}
						 
					} 
						document.getElementById('oprnAddQues').style.display = 'none';
						document.getElementById('previewpage').style.display = '';
				}
					</script>
					<script type="text/javascript">
					function ConfirmSubmit()
					{
						if(confirm('Are you sure you want to add these Questions ? It will be available to candidates immediately.'))
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
					function cancelButton()
					{
						document.getElementById('previewpage').style.display="none";	
						document.getElementById('oprnAddQues').style.display="";
					}
				</script>
		
				<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
				<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
				<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/OprnInterview.css">
			</head>
		
			<body>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left">
							<img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
						</td>
						<td align="right">
							<img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
						</td>
					</tr>
					<tr class="tBackColor">
						<td align="left" colspan="2" style="height: 12px;">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 10px;"></td>
					</tr>
					<tr>
						<td align="left" style="padding-left: 10px;">
							<font
								style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
								<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home </a>
								> 
							</font>
							<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
								<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">
								Administration
								</a> 
								 >
							</font>
							<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
								<a href="<%=recruitPath%>jsp/Admin_Manage_Operations_Qns.jsp">
								Manage Operation Interview Questionnaire
								</a> 
								>
							</font>
						
							<font class="nonLink">Edit</font>
						</td>
						<td align="right" style="padding-right: 10px;">
							<b><span class="recName"><%=USER_Name%></span>
							</b><font
								style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor: hand; cursor: pointer;">Logout</a>
							</font>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="top">
							<br />
 							<form action = "<%=request.getContextPath()%>/AddOperationInterview" method="post" autocomplete="off">
						
							 	<div id="oprnAddQues">
							 		<%-- <%
							 		Object oj = request.getAttribute("NODATE");
							 		if(oj!=null)
							 		{
							 			if(oj.equals("ONE"))
							 			{
							 		%>
							 			<p style="color: red; font-weight: bold; font-size: 12px;"> Please add at least one question !</p>
							 		<%
							 			}
							 		}
							 		 %> --%>
									<table width="900" border="0" cellpadding="0" cellspacing="0">
										<tr>
							        		<th class="classOprnleft_TD" style="padding: 6px;" colspan="2">
							        			Edit Operation Interview Questionnaire for <%=programName%>
							        		</th>
							        	</tr>
						  	        	<tr>
						 					<td colspan="2">
						 						<table id="tblSample">
						 							
						 						</table>
						 					</td>
							        	</tr> 
						  	        	<tr>
						 					<td colspan="2">
												<input type="hidden" name="total_box" id="total_box"/>
												<%
												int partCount = 0;
										        int partid = 1;
												int questionid=1;
										       	String Question=null;
										        String qorderno=null;
										        ResultSet rssqns = null;
										        Statement stmts = null;
												int qnsCount = 0;
												//String[] arrQuest = null;
												//ArrayList arrQuest = new ArrayList();
												int ProgramId  = Integer.parseInt(request.getParameter("ProgramId"));
												System.out.println("ProgramId::"+ProgramId);
												
											        String Querytype = "select count(*) as count from operations_interview_part_master where Program_Id ='"+ProgramId+"' and IsAlive=1";
											        System.out.println(Querytype);
											        rs = st.executeQuery(Querytype);
											        if(rs.next())
											        {
												        partCount = rs.getInt("count");
												        System.out.println("partCount::::"+partCount);
											        }
										           
											        int rowcnt=0;
									                String description=null;
									                String Porderno=null;
									                String secqrypartid = "select Part_Description,Part_Id,order_no from operations_interview_part_master where Program_Id='"+ProgramId+"' and isalive=1 order by order_no";
													System.out.println("Part id "+secqrypartid);
													Statement stmtpartid,stmtpart=null;
													Statement stmt1=null;
													ResultSet rsspartid,rsspart=null;
													ResultSet rs1=null;
													stmtpartid = con.createStatement();
													rsspartid = stmtpartid.executeQuery(secqrypartid);
													int i =1;
													while(rsspartid.next())
													{
														description=rsspartid.getString("part_description");
														rowcnt = rsspartid.getRow();
														System.out.println("Row number::"+rowcnt);
														Porderno=rsspartid.getString("order_no");
														partid=rsspartid.getInt("part_id");
														System.out.println("Part id "+partid);
														
														stmts = con.createStatement();
														String secqnsCount = "select count(Question_Id) as Count from operations_interview_question_master where Part_Id = '"+partid+"' and IsAlive = 1";
														rssqns = stmts.executeQuery(secqnsCount);
														while(rssqns.next())
														{
															qnsCount=rssqns.getInt("Count");
															System.out.println("qnsCount:::::"+qnsCount);
														
															String secpart ="select Question_Id,Question,order_no from operations_interview_question_master where isalive=1 and  part_id="+partid+" order by order_no"; 
													        System.out.println("operations_interview_question_master table details "+secpart);
													        stmtpart = con.createStatement();
															rsspart= stmtpart.executeQuery(secpart);
															int j = 1;
															while(rsspart.next())
															{
														         questionid=rsspart.getInt("Question_Id");
														         Question=rsspart.getString("Question");
														         qorderno=rsspart.getString("order_no");
														         System.out.println("qorderno"+qorderno);
															
															%>
															    <input type = "hidden" id = "total_parts" name = "total_parts" value = " <%=partCount%>">
																<input type = "hidden" id = "total_ques<%=i%>" name = "total_ques<%=i%>" value = " <%=qnsCount%>">
																<input type = "hidden" id = "partVal<%=i%>" name = "partVal<%=i%>" value = "<%=description%>">
																<input type = "hidden" id = "part<%=i%>Ques<%=j%>" name = "part<%=i%>Ques<%=j%>" value = '<%=Question%>'>
																<input type = "hidden" id = "ProgramId" name = "ProgramId" value = "<%=ProgramId%>">
															<%
																
																System.out.println("part"+i+"Ques"+j+":"+Question); 
																j++;
															}
														}
														i++;
													}
													stmtpartid.close();
													rsspartid.close();
													stmts.close();
													rssqns.close();
													st.close();
													rs.close();
												%>
														
												<hr style="width:900px; height: 1px;">
						 					</td>
							        	</tr> 
										<tr>
											<td align="left">
												<div align="left">		
													<input type="button" name="AddPart"  value="Add Part" class="buttonMedium" onclick="addRowHeader(); addQuestionOnAddPart(); addRowButtonsOnAddPart();"/>
												</div>					
											</td>
											<td align="right">
												<div align="right">		
													<input type="button" name="Preview"  value="Preview" class="buttonMedium" onclick="return edit();"/>
												</div>					
											</td>
										</tr>   	 		
									</table>
								</div>	
								<div id="previewpage" style="display: none;">
									<table width="900px" cellspacing="6" cellpadding="6" border="0">
										<tr>
											<td width="120px" rowspan="4" style="padding: 0px;"> 
												<img src="<%= recruitPath %>images/default_person.jpg" width="120px" height="90px" alt="image" />
											</td>
											<td width="320px" class="allBackColor" id="candidateid" align="left"> &lt;<%=CandidateID%>&gt;
												<input type="hidden" name="recruitername" value="<%= recruiterName%>">
											</td>
											<td width="300px"  class="allBackmain" align="left" ><b>Highest Education</b></td>
											<td width="160px" class="allBackColor" align="left">
												&lt;<%= higeduc %>&gt;
											</td>
										</tr>
										<tr align="left">
											<td class="allBackColor">&lt;<%=fullName%>&gt;</td>
											<td class="allBackmain"><b>Customer Interaction Experience</b></td>
											<td class="allBackColor">
												&lt;<%= CandExp%>&gt;
											</td>
										</tr>
										<tr align="left">
											<td class="allBackColor">&lt;<%=ApplyingFor %>&gt;</td>
											<td class="allBackmain"><b>Other Experience</b></td>
											<td class="allBackColor">
												&lt;<%=CandExpOther%>&gt;
											</td>
										</tr>
									</table>	
	 								<input type="hidden" id="total_divbox" name="total_divbox" value="">
									<table id="tblSample1" width="900" border="0" cellpadding="6" cellspacing="6">
										
									</table>
									<table width="900px" cellspacing="6" cellpadding="6" border="0">  
										<tr>
											<td class="allBackheading" align="center" colspan="4">Mention all verbatim - in the interview form
												<input id="hPIDs" type="hidden" name="hPIDs" value=""/>
												<input id="hQIDs" type="hidden" name="hQIDs" value=""/>
												<input id="hQCounts" type="hidden" name="hQCounts" value=""/>
												<input type="hidden" name="progrmvalues" id="progrmvalues" value="0"/>
												<input type="hidden" name="prgmvalues" id="prgmvalues" value=""/>
											</td>
										</tr>
										<tr>
											<td class="allBackmain" align="center" colspan="1"><b>Overall Comments</b></td>
											<td  colspan="3" class="allTdBackColor"  >
												<textarea name="comments" style="width: 100%" rows="4" id="comments" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false"  disabled="disabled"></textarea>
											</td>
										</tr>
										<tr>
											<td width="120px" class="allBackmain" align="center" ><b>TOTAL SCORE</b></td>
											<td width="330px" class="allBackColor" align="center" >
												<b>
													<input type="text" id="display" name="display" value="0" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/>
												</b>
											</td>
											<td width="470px">
												<table border="0" width="100%">
													<tr>
														<td nowrap="nowrap" style="font-family: Arial;font-size: 12px;color: #41383C;">
															<input type="radio" name="select" value="1" disabled="disabled"/>Select
															<input type="radio" name="select" value="2" disabled="disabled"/>Hold
															<input type="radio" name="select" value="3" disabled="disabled"/>Reject
														</td> 
														<td align="left">
															<input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmallnoPointer" disabled="disabled"/>
														</td>
														<td>
															<input name="Submit" id="Submit" type="submit" value="Submit"  class="buttonSmallnoPointer"  disabled="disabled"/>
															<span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<table width="900" >
										<tr>
											<td colspan="4" align="left">
												<div align="left">		
													<input type="button" name="editb"  value="Edit" id="editb" class="buttonMedium" onclick="return cancelButton();"/>
												</div>					
											</td>
											<td colspan="4" align="right">
												<div align="right">		
													<input type="submit" name="confirmb"  value="Confirm" id="confirmb" class="buttonMedium" onclick="return ConfirmSubmit();"/>
												</div>					
											</td>
										</tr>
									</table>	
								</div>	
							</form>
						</td>
					</tr>
									
					<tr>
						<td colspan="2" style="height: 10px;"></td>
					</tr>
					<tr class="footerBackColor" >
						<td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
						&copy; 2012. [24]7. ALL RIGHTS RESERVED.
						</td>
						<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
										{
										%>
										<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
										<%
										}
										else if(User_Type_Id.equalsIgnoreCase("2")) 
										{
										 %>
										<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
										<%
										}
										else if(User_Type_Id.equalsIgnoreCase("3"))
										{
										%>
										<a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
										<%
										}
										%>
									</td>
									<td style="width: 5px;"></td>
									<td>
										<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
									{
									%>
									<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
									<%
									}
									else if(User_Type_Id.equalsIgnoreCase("2")) 
									{
									%>
									<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
									<%
									}
									else if(User_Type_Id.equalsIgnoreCase("3"))
									{
									%>
									<a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
									<%
									}
									%>
													   
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<%
					
												
				}
				catch(Exception nullPoint)
				{
				 	System.out.println("nullPoint >>>>> \t"+nullPoint);
				 	//response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
				}
				 %>
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

