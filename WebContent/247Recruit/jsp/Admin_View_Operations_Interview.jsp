<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String username=((String)session.getAttribute("USER_Name")).trim();
	if(username==null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Login.jsp");
	}
	System.out.println("username==="+username);
	String ProgramId =(String)request.getParameter("ProgramId");
	if(ProgramId == null)
     {
	   response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
     }
	System.out.println("program Value+++==="+ProgramId);
	

	String SID = request.getParameter("operationsChkid");
	if (SID == null)
	{
	
	Integer partid=1;
	int questionid=1;
    try
      {
        Connection con = ConnectDatabase.getConnection(); 
		//String canId= (String) request.getParameter("candId");
   	    //System.out.println("canId from session\t"+canId); 
   	    String recruiterName=null;
   	    String recruiterid=null;
   	    String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_Name='"+username+"'";
		System.out.println("query "+secqryrecruiter);
		Statement stmtsrec = con.createStatement();
		ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
		if(rssrec.next())
		{
			recruiterName=rssrec.getString("Emp_Name");
			recruiterid=rssrec.getString("Emp_ID");
			System.out.println("recruiterid::::"+recruiterid);
		}
         String CandidateID = "Candidate Id";
         String higeduc = "Candidate Qualification";
         String fullName = "Candidate FullName";
         String ApplyingFor= "Applied for";
         String CandExp = "Work Experience";
         String CandExpOther = "Other Experience";
         
                
		Statement stmts=null;
		ResultSet rss = null;
		CallableStatement cs=null;
		con=ConnectDatabase.getConnection();									
		stmts = con.createStatement();
		
			
	   
%>
           
<html>
	<head>
	    <title>[24]7 SPRINGBOARD </title>
	    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
	
	
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
			else if (( operationsubmitform.select[0].checked == false ) && ( operationsubmitform.select[1].checked == false )&&( operationsubmitform.select[2].checked == false ) ) 
			{ 
				alert ( "Please choose the status(Select/Hold/Reject)" );
				return false;
			}
			document.getElementById('Submit').style.display="none";
			document.getElementById("processing").style.display="";
		}	
		</script>
	
		<!-- Char allowing scripts --> 
		<script type="text/javascript">
		function AllowChars(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
			      // alert(charCode);
			if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
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
		<!-- End of script -->
	
		<style type="text/css">
		
		html,body,form
		
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
  
  <body >

  	 <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	      <td colspan="2" align="center">
	        <!-- ############################################ -->
		<div class="wrapper">
		<div class="contentSize">	        
		<form action="<%=request.getContextPath()%>/OperationsInterview" method="post" id="operationsubmitform" name="operationsubmitform" method="post" onsubmit="return CheckValidation();">
		<table width="920px" cellspacing="6" cellpadding="6" border="0">
            <tr>
                <td width="120px" rowspan="3" style="padding: 0px;"> 
	            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="90px" alt="image" />
	            </td>
            	<td width="350px" class="allBackColor" id="candidateid" align="left"> &lt;<%=CandidateID%>&gt;
		          <input type="hidden" name="recruitername" value="<%= recruiterName%>">
		        </td>
			    <td width="300px"  class="allBackmain" align="left" ><b>Highest Education</b></td>
			    <td width="170px" class="allBackColor" align="left">
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
				  &lt;<%=CandExpOther%> &gt;
				</td>
			  </tr>

              <%  
                
                int rowcnt=0;
		        String PIDs="";
		        String QIDs="";
		        String QCounts="";
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
				while(rsspartid.next())
				{
				description=rsspartid.getString("part_description");
				rowcnt = rsspartid.getRow();
				System.out.println("Row number::"+rowcnt);
				Porderno=rsspartid.getString("order_no");
				partid=rsspartid.getInt("part_id");
				System.out.println("Part id "+partid);
				
				%>
		<tr>
		<td colspan="4" class="allBackheading" align="left">Part-<%= Porderno%>&nbsp;<%= description%></td>
		  </tr> 
		<tr class="allBackmain" align="center" >
		   <td colspan="1">Sl.No</td>
		  <td align="left">Question</td>
		  <td>Comments</td>
		  <td>Score</td>
		</tr>
     <% 
        String Question=null;
        String qorderno=null;
        String secpart ="select Question_Id,Question,order_no from operations_interview_question_master where isalive=1 and  part_id="+partid+" order by order_no"; 
        System.out.println("operations_interview_question_master table details "+secpart);
        stmtpart = con.createStatement();
		rsspart= stmtpart.executeQuery(secpart);
		while(rsspart.next())
		{
         questionid=rsspart.getInt("Question_Id");
         Question=rsspart.getString("Question");
         qorderno=rsspart.getString("order_no");
      %>
  <tr align="center">
     <td class="allBackColor" ><%=qorderno %></td>
    <td class="allBackColor" align="left"><%=Question %></td>
    <td style="background-color: #F2F2F2;"> <textarea name="P<%=Porderno%>Q<%=qorderno%>Comment"  id="P<%=Porderno%>Q<%=qorderno%>Comment"  rows="2" style="width: 100%;resize:none" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);" disabled="disabled"></textarea></td>
    <td class="allBackColor">
    <select name="P<%=Porderno%>Q<%=qorderno%>Score" size="1" id="P<%=Porderno%>Q<%=qorderno%>Score" onchange="calcscore()" style="width: 100%; height: 20px; color: #342826;text-align: center" disabled="disabled">
     <option value="">Select</option>
              <% String secQsnQry1 = "select *  from operations_interview_scores_master order by score";
				 System.out.println("query "+secQsnQry1);
				 stmt1 = con.createStatement();
				 rs1 = stmt1.executeQuery(secQsnQry1);
				while(rs1.next())
				{ %>
					<option value="<%=rs1.getString("score")%>"><%=rs1.getString("score")%></option>	
			<%	}
              if (QIDs!="")
              {
              QIDs = QIDs + '-' + questionid;
              }
              else
              {
              QIDs = "" + questionid;
              }
             %>
             <option value="0">NA</option>  
            </select>
    </td>
   
  </tr>

              <% }
	              if (PIDs!="")
	              {
	              PIDs = PIDs + '-' + partid;
	              }
	              else
	              {
	              PIDs = "" + partid;
	              }
	              if (QCounts!="")
	              {
	              QCounts = QCounts + '-' + qorderno;
	              }
	              else
	              {
	              QCounts = "" + qorderno;
	              }
				} 
				System.out.println("value:::::"+PIDs);
				System.out.println("value:::::"+QIDs);
				System.out.println("value:::::"+QCounts);
				%>
          <tr>
           <td class="allBackheading" align="center" colspan="4">Mention all verbatim - in the interview form
			   <input id="hPIDs" type="hidden" name="hPIDs" value="<%=PIDs%>"/>
			   <input id="hQIDs" type="hidden" name="hQIDs" value="<%=QIDs%>"/>
			   <input id="hQCounts" type="hidden" name="hQCounts" value="<%=QCounts%>"/>
			   <input type="hidden" name="progrmvalues" id="progrmvalues" value="0"/>
			   <input type="hidden" name="prgmvalues" id="prgmvalues" value="<%=ProgramId %>"/></td>
	      </tr>
 
           <tr>
		      <td class="allBackmain" align="center" colspan="1"><b>Overall Comments</b></td>
		      <td  colspan="3" class="allTdBackColor"  >
		        <textarea name="comments" style="width: 100%" rows="4" id="comments" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);" disabled="disabled"></textarea>
		      </td>
          </tr>
         <tr>
		      <td colspan="1" class="allBackmain" align="center" ><b>TOTAL SCORE</b></td>
		      <td colspan="1" class="allBackColor" align="center" ><b>
		      	<input type="text" id="display" name="display" value="0" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/>
	   		   </b></td>
	   
		  <td colspan="2">
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
	        <input name="Submit" id="Submit" type="submit" value="Submit"  class="buttonSmallnoPointer" onClick="return CheckValidation(this.form);" disabled="disabled"/>
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
				rssrec.close();
				stmtsrec.close();
                con.close(); 
	            }
					catch(Exception ex)
					{
						System.out.println("========="+ex.getMessage());
						ex.printStackTrace();
					} 
	}
		%>
		</table>		
		</form>	
		</div>
		</div>	
			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <%-- <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
			</td>
	    </tr> --%>
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
