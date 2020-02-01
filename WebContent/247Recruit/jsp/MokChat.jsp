<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


    int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	if(USER_AUTOID==0)
	{
		response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");
	}
	String USER_Name =(String) session.getAttribute("USER_Name");
	if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");
	}



//String usernames = "Ritesh";
PreparedStatement oPst, pst, stp=null;

int qns = 5; 
int attempID = 0;
int quesID = 0;
Connection con = ConnectDatabase.getConnection();


String pageFromScriptId= (String) request.getParameter("page");
// out.println(pageFromScriptId);
int pageFrom=0;
if(pageFromScriptId==null)
{
	pageFrom=0;
}
else
{
	if(pageFromScriptId.equalsIgnoreCase("1000"))
	{
		String query2="select ScriptID from mokchat_scriptid_archive where UserID='" + USER_AUTOID + "' and UpdatedDate=curdate()";			
		Statement stmt=con.createStatement();
		ResultSet rs2=stmt.executeQuery(query2);
		
		
		
		String rdf = "select count(chat_question) from mock_chat_test_details  where USER_Id='"+USER_AUTOID+"'";
		Statement stdf = con.createStatement();
		ResultSet rs6 = stdf.executeQuery(rdf);

		if (rs6.next()) 
		{
			attempID = rs6.getInt(1);
			quesID= attempID+1;
		}
		else
		{
			attempID = 0;
			quesID=1;
		}

		if(rs2.next())
		{
			pageFrom=rs2.getInt("ScriptID");
		}
		else
		{
			pageFrom=Integer.parseInt(pageFromScriptId);
		}
	}
	
}


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MokTesting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/careers.css" />

<script type="text/javascript">

function showDivText()
{
  divObj = document.getElementById("chatwindow");
  
     if ( divObj )
     {
       transcrpt=divObj.textContent;
  	if ( transcrpt)
  	{   // FF
       alert(transcrpt);
       // transcrpt=divObj.textContent;
      document.getElementById("transcriptdump").value=transcrpt;
      
    }
    else
    {
      // IE
      
	      document.getElementById("transcriptdump").value=transcrpt;
	      transcrpt=divObj.innerText;
    }
    
    <%
       	 String chatResPage=basePath + "247Recruit/jsp/Chatresultcalc.jsp?transcrptQuery=";
    %> 
         parent.location.href="<%=chatResPage%>" + transcrpt;
  }  
}
</script>

<!-- Validate the User input field blank or not -->

<script type="text/javascript">
		function textvalidate()
		{
		var textval = document.getElementById("CHAT2").value;
		
		if(textval==null || textval=='' || textval==0)
		{
		   alert("Please enter some text");
		   document.getElementById('CHAT2').focus();
		   return false;
		}
		
		}

</script>

<script type="text/javascript">
		function focusset()
		{		
		var objDiv = document.getElementById("chatwindow").value;
		if(objDiv==null)
		{
			objDiv='noreplay';
		}
		objDiv.scrollTop = objDiv.scrollHeight;
		document.form2.CHAT2.focus();		
		}
</script>


<script language="javascript">
		var keyvalues;
		function document.onkeydown()
		{
		///alert(event.keyCode)
		///alert("you press F5")
		keyvalues=event.keyCode;
		
		if ( event.keyCode==116)
		{
		//window.location.href = "Login.jsp";
		top.window.location = 'Login.jsp';
		alert("you press F5/Back Space");
		
		
		return false;
		}
		}
</script>
<script type="text/javascript">
		var charfield=document.getElementById("char")
		charfield.onkeydown=function(e){
		var e=window.event || e
		document.getElementById("keycode").value=e.keyCode
		}

</script>


		<script language="javascript">
		function detectkey(evt,obj) {
		keycode = (evt.keyCode==0) ? evt.which : evt.keyCode;
		
		var test=keycode;
		
		if(test==116 || test==8)
		{
		alert("sorry u are not alowed to this !!");
		
		
		top.window.location = 'Login.jsp'
		return false;
		
		}
		
		
		}
</script>
		<SCRIPT LANGUAGE="JavaScript1.1">

//Disable right mouse click Script
//By Maximus (maximus@nsimail.com) w/ mods by DynamicDrive
//For full source code, visit http://www.dynamicdrive.com

var message="Mouse Right Click Disabled!";


			function clickIE4(){
			if (event.button==2){
			alert(message);
			return false;
			}
			}
			
			function clickNS4(e){
			if (document.layers||document.getElementById&&!document.all){
			if (e.which==2||e.which==3){
			alert(message);
			return false;
			}
			}
			}
			
			if (document.layers){
			document.captureEvents(Event.MOUSEDOWN);
			document.onmousedown=clickNS4;
			}
			else if (document.all&&!document.getElementById){
			document.onmousedown=clickIE4;
			}
			
			document.oncontextmenu=new Function("alert(message);return false")

</script>

</head>
  
  <body onLoad="focusset();" ondragstart="return false" onselectstart="return false">
  <%



	int ik =USER_AUTOID;	
	if(pageFrom==1000)
	{
		oPst = con.prepareStatement("INSERT INTO mock_chat_test_attempt_master( USER_ID, START_DATE_ACTIVE) VALUES(?,sysdate())");	
		oPst.setInt(1, ik);
		oPst.executeUpdate();	
		
	}
if(USER_AUTOID != 0) 
{
	String userdata = null;
	
	userdata = request.getParameter("CHAT2");
	System.out.println("userdata from Userinput field:"+userdata);
	if (userdata != null)
	{
		pst = con.prepareStatement("update mock_chat_test_details set User_Reply =? where User_Reply is null and USER_ID='"+ USER_AUTOID + "'");
		pst.setString(1, userdata);
		pst.executeUpdate();
		System.out.println("Updated mock_chat_test_details:"+pst);
	} 
	
			int mokchatscriptid=0;
		
			if(pageFrom==1000)
			{
		    	
				// out.println(quesID);
				String ScriptType=(String)session.getAttribute("ScriptType");
				// out.println(ScriptType);
				if(ScriptType==null)
				{
					String mokscriptrandomid="SELECT chat_script_id FROM mock_chat_script_master where isalive=1 and chat_type_id=3  ORDER BY RAND() LIMIT 1";
					System.out.println("Query ::"+mokscriptrandomid);
				           
					Statement stmtmokrandomid = con.createStatement();
					ResultSet rsmokchatrandomid = stmtmokrandomid.executeQuery(mokscriptrandomid);
					
					//ArrayList al= new ArrayList();
				
					if(rsmokchatrandomid.next())
					{
				
						mokchatscriptid =rsmokchatrandomid.getInt("chat_script_id");
						//al.add(mokchatscriptid);
			    		System.out.println("MockChat Script Randomid ::"+mokchatscriptid+"\t:");
					}
				}
				else
				{
					mokchatscriptid=Integer.parseInt(ScriptType);
				}
				
				
				String query="INSERT INTO mokchat_scriptid_archive(UserID, UpdatedDate,ScriptID) VALUES('" + USER_AUTOID + "',curdate()," + mokchatscriptid + ")";
				Statement stmt=con.createStatement();
				stmt.execute(query);
				
			}
			else
			{
				mokchatscriptid=pageFrom;
				
			}
		
		
			String  mokchatsrptquestion=null;
			String mokchatquestionid=null;
			String mokchatscript = "select chat_question_id,chat_question from mock_chat_scripts where chat_script_id="+mokchatscriptid+" and Chat_Question_Id="+quesID;
		    System.out.println("Mok chat Question script ::"+mokchatscript);
			           
			Statement stmtsrectt = con.createStatement();
			ResultSet rssrectt = stmtsrectt.executeQuery(mokchatscript);
			if(rssrectt.next())
			{
				mokchatsrptquestion=rssrectt.getString("chat_question");
				mokchatquestionid=rssrectt.getString("chat_question_id");
				System.out.println("Mok Chat Script question  ::"+mokchatsrptquestion);
			    System.out.println("Mok Chat Script question Id ::"+mokchatquestionid);
		    
	      	}
	      	        String attemptid=null;
			      	String mokscriptid = "select chat_test_attempt_id from mock_chat_test_attempt_master where USER_ID='"+USER_AUTOID+"'";
			      	System.out.println("Mok_attempt id for insert ::"+mokscriptid);
			      	Statement stmtscriptid = con.createStatement();
					ResultSet rssscriptid = stmtscriptid.executeQuery(mokscriptid);
			      	if(rssscriptid.next())
			      	{
			     		attemptid=rssscriptid.getString(1);
			      		System.out.println("Mok Attemp Id ::"+attemptid);	      	
			      	}
	      	
	if (attempID < qns) 
	{
		stp = con.prepareStatement("insert into mock_chat_test_details (user_id,chat_test_attempt_id,chat_question_id,chat_question) values(?,?,?,?)");
		System.out.println("Query : " + stp);
		stp.setInt(1, USER_AUTOID);
		stp.setString(2, attemptid);
		stp.setString(3, mokchatquestionid);
		stp.setString(4, mokchatsrptquestion);
		
		stp.executeUpdate();
		System.out.println("Update into mock_chat_test_details successful");
      }
    String sql4 = "select * from mock_chat_test_details  where USER_ID='"+ USER_AUTOID + "'";
	System.out.println("sql4 : " + sql4);
	Statement stmt4 = con.createStatement();
	ResultSet rs2 = stmt4.executeQuery(sql4);
	String questions = null;
	String answers = null;
	
 %>
   <div style="height: 10px;" onKeyUp="detectkey(event,this)">
			<b>Question Instruction:-Please reply to the question asked below</b>
		</div>
		<div class="wrapper">

			<div class="main-nav">
				<div class="main-nav-js">

				</div>
			</div>
			<div class="inner-content">
				<div class="invalid-log-alert"></div>
			
	<form id="form1" name="form1" method="post" onKeyUp="detectkey(event,this)">

					<div class="forms">

						<table border="0" cellpadding="6" width="100%" cellspacing="1" style="margin: 15px 0 0 0">
							<tr>
								<td colspan="4">
								
								<div class="quest_input_new" id="chatwindow">
								  	<%
								  		while(rs2.next())
								  		{
								  		    questions=rs2.getString(4);
								  			answers=rs2.getString(5);
								  			if(answers==null)
								  			{
								  				answers = "";
								  			}
								  	 %>
										<p>
											
												<b>[24]7:</b><%=questions%>!
										</p>
										<p style="color: red;">
											<b><%=USER_Name %>:</b><%=answers%>!	
										 </p>
										 
										<%
										}
													
												rs2.close();
										%>
										
										 
									</div>
								</td>
							</tr>
						</table>
					</div>
				</form>
             <form name="form2" action=""<%=basePath%>jsp/MokTesting.jsp" method="POST" autocomplete="off">
					<table>
						<tr>
							<td colspan="4">
								<div>
								<%
										if (attempID < qns) 
										{
									%>	
									<input type="text" class="" id="CHAT2"	style="color: red; font-size: 10px;  width: 665px; padding:5px; overflow: auto; background-color:#FFFFFF; border:1px solid #9BB168; font-family:Verdana,Arial,sans-serif; color:#000000; height:50px;" name="CHAT2" size="">
									
									
									<%
										}
									%>
								</div>
							</td>
						</tr>

						<tr onKeyUp="detectkey(event,this)">
							<td colspan="2">
								<div style="float: left;" onKeyUp="detectkey(event,this)">
							        <%
										if (attempID == qns) 
										{
										
												
									%>		
                       <input type="hidden" name="transcriptdump" id="transcriptdump" value="testbyritesh" />
					   <input type="button" value="" id="finish" class="finish" name="finish" onclick="showDivText()" onk />
						
								</div>
								<div style="float: right;" onKeyUp="detectkey(event,this)">
                                  <%
										}

											if (attempID < qns) 
											{
									%>
									<input type="submit" value="" id="submit" class="send" name="submit" onkeyup="detectkey(event,this)" onclick="return textvalidate();"/>

								</div>
							</td>
						</tr>
							        <%
											}
										%>			
					</table>
				</form>
	
			<%
			} 
				else 
			{
			%>

			<p style="color: red;">
				Sorry user session not available at this Moment
			</p>
		<% 
		 }
		%>
	</div>		
	</div>
  </body>
</html>