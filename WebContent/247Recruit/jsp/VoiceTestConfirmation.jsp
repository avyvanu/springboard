<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.EmailDemo"%>
<%@page import="util.SMSFunction"%>
<%String username1="247RecruitmentIS@247customer.com";
String password1="123456@abc";
%>
<html>
  <head>
	<title>[24]7 SPRINGBOARD</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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
		    width: 100%;
		}
	
		.wrapper
		{
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 900px;
		}
	</style>
	<script type="text/javascript">
	function logOut()
	{
		parent.location.href="<%=request.getContextPath()%>/jsp/Login.jsp";
	}
	
	</script>
 </head>
 <body>
	<% 		
		try
	    {
			int USER_AUTOID=(Integer)session.getAttribute("USER_AUTOID");
			System.out.println("USER_AUTOID : "+USER_AUTOID);
			if(USER_AUTOID==0)
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
		  
			Connection con = null;
		
		    con = ConnectDatabase.getConnection();
		    String Recruiterphone = "";
		    String RecruiterEmailId = "";
		    ArrayList<String> Phonenumbers = new ArrayList<String>();
		    String Candidatename = null;
			String CandidateFirstname = null;
			String CandidateMiddlename = null;
			String CadidateId = null;
			String Phonenumber = null;
			String msgsms = null;
			int Location = 0;
			Statement stmts = null;
			ResultSet rss = null;
			CallableStatement cs=null;
			try
			{
				con=ConnectDatabase.getConnection();									
				stmts = con.createStatement();
				String strProcedure = "{call CandPhone_Encrypt_Proc("+USER_AUTOID+",'"+EDKey+"','"+EDKPass+"')}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=con.prepareCall(strProcedure);
				rss=cs.executeQuery();
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}

			if (rss.next())
			{
				 CandidateFirstname=rss.getString("First_Name");
				 CandidateMiddlename=rss.getString("Middle_Name");
				 if(CandidateMiddlename==null)
				 {
				 	CandidateMiddlename="";
				 }
				 Candidatename=CandidateFirstname+" "+CandidateMiddlename+" "+rss.getString("Last_Sir_Name");
				 CadidateId=rss.getString("Bpo_Cand_Id");
				 Phonenumber=rss.getString("Phone");
				 Location=rss.getInt("Location");
			} 

		    String secQsnrec = "SELECT Emp_email,Emp_Mobile_No FROM user_master where User_Type_Id=1 and SendAlerts=1 and Is_Active=1 and Centre_Id='"+Location+"'";
			System.out.println("secQsnrec " + secQsnrec);
			Statement stmtrec = con.createStatement();
			ResultSet rssrec = stmtrec.executeQuery(secQsnrec);
			int ctr = 0;
			while (rssrec.next())
		    {
				 Recruiterphone = rssrec.getString("Emp_Mobile_No");
				 Phonenumbers.add(Recruiterphone);
				 RecruiterEmailId += rssrec.getString("Emp_email")+",";
				 ctr = ctr + 1;
		    }
			System.out.println("Email Id's ::: " + RecruiterEmailId);
		 	rssrec.close();
		    stmtrec.close();
		    rss.close();
		    stmts.close();
		  
		    if(ctr > 0)
		    {
			    String msg=new String();
			    msgsms=CandidateFirstname+" ("+CadidateId+")";
				msg="<HTML><BODY>"+Candidatename+", Candidate Id : "+CadidateId+", has completed HR (Voice) round on [24]7 career. <b>Mobile Number</b> :"+Phonenumber+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
			    String subject="[24]7 Career Voice Confirmation";
			    for(int j=0;j<Phonenumbers.size();j++)
		        {
			    	SMSFunction.sendSMSRecVoice(Phonenumbers.get(j).toString(),msgsms,Phonenumber);
			    }
		        EmailDemo.sendMail(username1,password1,RecruiterEmailId,msg,subject);
		    }
			
		    String USER_ID =((String) session.getAttribute("USER_ID")).trim();
		    System.out.println("USER_ID : "+USER_ID);
		    
		    String password_random=(String) session.getAttribute("password_random");
			System.out.println("password_random : "+password_random);
			
			String USER_Name =(String)session.getAttribute("USER_Name");
			System.out.println("USER_Name : "+USER_Name);
			
			PreparedStatement p17 = con.prepareStatement("update bpo_candidatesreg_details set cand_Status = 4 where AutoID = " + USER_AUTOID);
			System.out.println(" updated to canvas 2 data =="+p17);
			p17.executeUpdate();
			p17.close();
			con.close();
	 %>
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
	       	<td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Voice Test > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Confirmation</font> 
	        </td>
			<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logOut()" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        <br/>  
	        <!-- ############################################ -->
	          <div class="wrapper">
					<div class="contentSize">
					
					
					
					  <form id="canvasForm" name="canvasForm" method="post" action="">
	
	    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal">
	    	<tr class="allTdBackColor">
	    	   <td valign="top">
	    	     <p>Thank you for completing the voice round. If you have successfully completed this round - you will receive a confirmation for the next round in your personal email id and your mobile number registered with us</p>										
				 <p>Please note down your ID for all further communication in future.</p>
				 <p>Your Candidate Id number is: <b><%=USER_ID%></b></p>				
	    	   </td>
	        </tr>
	        <tr>
	        	<td style="height: 10px">
	        	</td>
	        </tr>	        <tr>
	        	<td align="center" style="height: 41px">
	        		
	        		<input type="button" name="btnNewWindow" class="buttonLarge" value="Visit [24]7 Website" onClick="window.open('http://www.247-inc.com', '_self');">
	        	</td>
	        </tr>
	        </table>
		</form>

				</div>
			  </div>
			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>
 	<%
			session.removeAttribute("USERID");
			session.removeAttribute("Bpo_Cand_Id");	
			session.removeAttribute("password_random");	
			session.removeAttribute("username");	
			session.invalidate();	
		}
		catch(Exception ex)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
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
