<%@page import="java.util.ArrayList"%>
<%@page import="beans.CompTestDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.CompRandum"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<%	String USER_Name =(String)session.getAttribute("USER_Name");
	int USER_AUTOID =(Integer) session.getAttribute("USER_AUTOID");
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp"); // ReadingComprehensionTest.jsp  ReadingComprehensionSucess.jsp
	}
	String compTestId = request.getParameter("compTestId");	
	System.out.println("compTestId:::::View page"+compTestId);
%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 SPRINGBOARD</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<script language="javascript" src="../js/shortcut.js"></script>
<script type="text/javascript" src="../example/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../example/jquery.webcam.js"></script>
</head>
<body>
	<div class="wrapperSize" style="width: 720px;">
	 <div class="" style="clear: both;display: block; margin: 0 0 0;overflow: hidden;padding: 0;position: relative;">
		<form name="compTestPage" id="compTestPage" action="" method="post">
			<input type="hidden" name="methodName" id="methodName" value="storeRes"/>
				<div class="forms"  style="float: left;">
					<table border="0" cellpadding="6" width="100%" cellspacing="1" style="margin:15px 0 0 0" >
						<%
								String ranNum = compTestId;
								Connection con=null;
								con= ConnectDatabase.getConnection();
								Statement stmt = null;
								ResultSet resultSet = null;
								Statement stmt12 = null;
								ResultSet resultSet12 = null;
								int compQsnId = 0;
								String compQsnPass=null;
								int qsnID=0;
								int no_qs=0;
								String qsnStr = null;
								String compHeader = null;
								try
								{
									String compQsnQry = "SELECT * FROM bpo_reading_comp_master where READING_COMP_MASTER_ID='"+ranNum+"'";
									System.out.println("Step 8 Query "+compQsnQry);
									Statement adrStmt = con.createStatement();
									ResultSet adrRs = adrStmt.executeQuery(compQsnQry);
									if(adrRs.next())
									{
									compQsnId = adrRs.getInt("READING_COMP_MASTER_ID");
									compQsnPass = adrRs.getString("PASSAGE");
									compHeader = adrRs.getString("Test_Header");
									}
								}
								catch (Exception e)
								{
								e.printStackTrace();
								}
								%>
						<tr>
							<th colspan="4" class="taL"><div style="float:left;">Reading Comprehension</div><div style="float:right;">Time Remaining <input type="text" name="disp" value="5:00" size="3" class="timer" id="disp"/> </div></th>
						</tr>
						<tr>
					       <td colspan="4"><div style="float:left;"> <p style="color: #aa0000;"><b><%=compHeader %> </b></p></div></td>
					    </tr>
						<tr>
							<td>
								<div style="float: left;" >
								<input type="hidden" name="target" value="ComprehensionTest"/>
								<input type="hidden" name="sesVal" value="CompVal"/>
								<input type="hidden" name="country" value="sdfd"/>
								<input type="hidden" name="timeOut" id="timeOut"/>
								<input type="hidden" name="attemptQsn" id="attemptQsn"/>
								<input type="hidden" name="methodName" id="methodName" value="storeRes"/>
								<textarea class="quest_output" readonly="readonly" style="resize:none;"><%= compQsnPass %></textarea>
								</div>
								<div style="float: left;margin-left: 2px;width: 350px;" class="quest_output2">
								<%
									try{
											String sql3 ="SELECT No_of_Question FROM maximum_read_assement_no";
											System.out.println("sql>>>>>>for------------------------------------"+sql3);
											Statement stmt_forsql3=con.createStatement();;
											ResultSet rs3 = stmt_forsql3.executeQuery(sql3);
											System.out.println("sql>>>>>>"+rs3);
											if (rs3.next()) 
											{
											no_qs=Integer.parseInt(rs3.getString("No_of_Question"));
											System.out.println("sql>>>>>>..............."+no_qs);
											}
											System.out.println("sql>>>>>/////////////////");			
										}
										catch(Exception e){
										e.getStackTrace();
										}		
								 try
									{
										String compQsnQry12 = "SELECT * FROM bpo_reading_comp_question_master where READING_COMP_MASTER_ID='"+compQsnId+"' limit "+no_qs;
										System.out.println("Step 8 Query "+compQsnQry12);
										Statement adrStmt12 = con.createStatement();
										ResultSet adrRs12 = adrStmt12.executeQuery(compQsnQry12);
										int count =0;
										while(adrRs12.next())
										{
										qsnID = adrRs12.getInt("READING_COMP_QUESTION_MASTER_ID");
										System.out.println("count is:"+count);
										
										//printing quesion no and question samtance
										%>
										<p><b><%= adrRs12.getString("PASSAGE_QUESTION")%></b></p>
										<%
										String compQsnQry123 = "SELECT * FROM bpo_reading_comp_question_answer_master  where READING_COMP_MASTER_ID="+compQsnId+" and READING_COMP_QUESTION_MASTER_ID="+qsnID ;
										System.out.println("Qry is"+compQsnQry123);
										Statement adrStmt123 = con.createStatement();
										ResultSet adrRs124 = adrStmt123.executeQuery(compQsnQry123);
										int m = 0;
										while(adrRs124.next())
										{
										String opnId = " "+adrRs124.getString("PASSAGE_QUESTION_ANSWER");
										String qsnNopVal = USER_AUTOID+":"+compQsnId+":"+qsnID +":"+ adrRs124.getString("READING_COMP_QUESTION_ANSWER_MASTER_ID")+":"+adrRs124.getString("correct_answer");
										System.out.println("DATA:"+qsnNopVal);
										
										%>
										<p><input type="radio" name="opAns<%=count%>" id="opAns<%=count%>" value='<%=qsnNopVal%>' disabled="disabled" /><%=opnId%></p>
										<%
										 
										}
										count++;
										}
										%>
										 <input type="hidden" name="readComp" value="<%=count%>" />
										<%
									}
								catch(Exception ex)
								{
									ex.printStackTrace();
									System.out.println("out of question :"+ex.getMessage());
								}
								
								%>
								</div>
							</td>
							</tr>
							<tr>
								<td colspan="1" align="right">  
									<input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" disabled="disabled" onclick="return textvalidate();"/> 
									<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2">Processing, please wait...</font></b></span>
								</td>
							</tr>
						</table>
						</div>
					 </form>
				   </div>
				 </div>
			   </body>
			</html>