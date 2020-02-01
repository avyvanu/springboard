<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	 if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
 System.out.println("USER_Name in chat script print page::::"+USER_Name);
String candidateID = (String) request.getParameter("CandidateId");
System.out.println("candID===+++++"+candidateID);
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);

 %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
	 <link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">

<style type="text/css">
html,body

{

margin: 0px;

}

.logo

{

height: 69px;

width: 143px;

} 

</style>

</head>
  
  <body style="overflow-x:hidden" onload="window.print()">
    <%      
             try
             {
                Connection con = ConnectDatabase.getConnection(); 
                 %>
	      <!-- ******************Header code begins************** -->
  <form action="<%=request.getContextPath()%>/PrecisWritingScore" method="post" id="precisscoresubmitform" name="precisscoresubmitform" method="post" onsubmit="return CheckValidation();">
	<table width="100%" cellspacing="6" cellpadding="6" border="0">
		<tr>
                  <%            
                     String firstname=null; 
	                 String lastName=null; 
	                 String id=null;
	                 String secQsnxQry7 ="SELECT AutoID,Bpo_Cand_Id,First_Name,Last_Sir_Name FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+candidateID+"'";
					 System.out.println("query "+secQsnxQry7);
					 Statement stmts = con.createStatement();
					 ResultSet rss = stmts.executeQuery(secQsnxQry7);
					if(rss.next())
					{
					id=rss.getString("AutoID");
					System.out.println("Auto ID::::::"+id);
					candidateID=rss.getString("Bpo_Cand_Id");
					firstname=rss.getString("First_Name");
					lastName=rss.getString("Last_Sir_Name");
						
					}
                 	%>
			<td class="allBackColor"  width="120px" align="left" style="background-color: #D8D8D8;">
				<b>Candidate Id</b>
			</td>       
			<td  class="allBackColor" id="candidateid" align="left"><%=candidateID%></td>
			<td class="allBackColor"  width="120px" align="left" style="background-color: #D8D8D8;">
				<b>Candidate Name</b>
			</td>
			<td class="allBackColor"><%=firstname%>&nbsp;<%=lastName%></td>
		</tr>
	    <tr>
			<td class="allBackColor" style="background-color: #D8D8D8;"> <div align="left"><b>Transcript</b></div></td>
			   <% 
			            String sectranscript = "select transcript from mock_chat_test_attempt_master where user_id='"+id+"'";
						System.out.println("sectranscript "+sectranscript);
						Statement stmttranscript = con.createStatement();
						ResultSet rstranscript = stmttranscript.executeQuery(sectranscript);
						System.out.println("rstranscript"+rstranscript);
						String transcript=null; 
			         %>
			<td class="allBackColor" colspan="3">
	      		<div style="width:100%;height:100%;font-size:12px; overflow: hidden;" class="allTdBackColor">
					<%
				    if(rstranscript.next())
							{
								transcript= rstranscript.getString("transcript");
								System.out.println("Transcript "+transcript);	
								if((transcript==null)||(transcript==""))
								{
								out.print("No Transcript available for this candidate");
								}
								else
								{
								String stringsplit[]=transcript.split("::");
				                for(int i=1;i<stringsplit.length-1;i+=2)
				              {
				              	
				              	System.out.println(i);
				         if(i>1)
				         {
				   	%>
						<br/>
					<%
				         }
				         if(((i+1) % 4) != 0)
				         {
				   	%>
						<b>:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
					<%
				         }
				         else
				         {
				   	%>
						<b style="color: red;">:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
					<%
				         }
				         }
						}
						}
						else if (!rstranscript.next() ) {
							out.print("No Transcript available for this candidate");
							}
					 %>
	        	</div>
	       </td>
      </tr>
	        <%  
				rstranscript.close();
				stmttranscript.close();
				rss.close();  
				stmts.close();
		        con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
					
				} %>
  
            <!-- ############################################ -->    
	     </table>
     </form>
  </body>
</html>


