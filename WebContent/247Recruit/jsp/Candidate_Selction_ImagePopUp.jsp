<!DOCTYPE html  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ include file="GlobalDeclare.jsp"%>
<%
	String candidateID = (String) request.getParameter("canId");
	System.out.println("candID===+++++"+candidateID);

	//String imainImagepath= "http://localhost"; // Localhost
	// String imainImagepath="http://172.30.0.113:8080"; // Test
	 String imainImagepath="http://172.17.0.30:8080"; // Live
%>
<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">

  </head>
  
  <body>
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td align="center">
				<%
				    Connection connection=ConnectDatabase.getConnection();
				    String imagepath=null;
				    int autoid=0;
					String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+candidateID+"'";
					System.out.println("query " + secQsnxQry7);
					Statement stmts=null;
					ResultSet rss=null;
					stmts = connection.createStatement();
					rss = stmts.executeQuery(secQsnxQry7);
						if(rss.next())
						{
						autoid=rss.getInt("AutoID");
						imagepath=rss.getString("image_path");
						System.out.println("Image path:::"+imagepath);
						System.out.println("Image path:::"+imainImagepath+imagepath);
						}
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: left;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;" width="100%" align="center">
							Test Initialization Snapshot
						</td>
					</tr>
					<tr>
						<td>
						<%
           		     if(imagepath==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
					<img src="<%=imainImagepath %><%=imagepath%>" width="200" height="150"/>
				       <%
				    } 
				       %>
						</td>
					</tr>
				</table>
				<%
				    String imagepathtyping=null;
					String secQrytyping = "SELECT pict_path FROM pict_on_typingtest where user_id="+autoid+"";
					System.out.println("Query Typing " + secQrytyping);
					Statement stmttyping=null;
					ResultSet rsstyping=null;
					stmttyping = connection.createStatement();
					rsstyping = stmttyping.executeQuery(secQrytyping);
					if(rsstyping.next())
						{
					imagepathtyping=rsstyping.getString("pict_path");
					System.out.println("Image path Typing:::"+imagepathtyping);
					System.out.println("Image path Typing:::"+imainImagepath+imagepathtyping);
						}	
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: right;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;" align="center">
							Typing Test Snapshot
						</td>
					</tr>
					<tr>
						<td>
							<%
           		     if(imagepathtyping==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
							<img src="<%=imainImagepath %><%=imagepathtyping%>" width="200" height="150" alt="image" />
					   <%
					 } 
					  %>
						</td>
					</tr>
				</table>
				<%
				    String imagepathReadingComp=null;
					String secQryReadingComp= "SELECT pict_path FROM pict_on_readingtest where user_id="+autoid+"";
					System.out.println("Query Reading Comp::" + secQryReadingComp);
					Statement stmtReadingComp=null;
					ResultSet rssReadingComp=null;
					stmtReadingComp = connection.createStatement();
					rssReadingComp = stmtReadingComp.executeQuery(secQryReadingComp);
					if(rssReadingComp.next())
						{
					imagepathReadingComp=rssReadingComp.getString("pict_path");
					System.out.println("Image path ReadingComp:::"+imagepathReadingComp);
					System.out.println("Image path ReadingComp:::"+imainImagepath+imagepathReadingComp);
						}	
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: right;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;" align="center">
							Reading Comprehension Snapshot
						</td>
					</tr>
					<tr>
						<td>
						<%
           		     if(imagepathReadingComp==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
							<img src="<%=imainImagepath %><%=imagepathReadingComp%>" width="200" height="150" alt="image"/>
					 <%
					 } 
					  %>
						</td>
					</tr>
				</table>
				<%
				    String imagepathEnggrammar=null;
					String secQryEnggrammar= "SELECT pict_path FROM pict_on_engtest where user_id="+autoid+"";
					System.out.println("Query Eng Grammar test::::" + secQryEnggrammar);
					Statement stmtEnggrammar=null;
					ResultSet rssEnggrammar=null;
					stmtEnggrammar = connection.createStatement();
					rssEnggrammar = stmtEnggrammar.executeQuery(secQryEnggrammar);
					if(rssEnggrammar.next())
						{
					imagepathEnggrammar=rssEnggrammar.getString("pict_path");
					System.out.println("Image path Enggrammar:::"+imagepathEnggrammar);
					System.out.println("Image path Enggrammar:::"+imainImagepath+imagepathEnggrammar);
						}	
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: left;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;width: 200px;" align="center">
							English Grammar Test Snapshot
						</td>
					</tr>
					<tr>
						<td>
						<%
           		     if(imagepathEnggrammar==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
							<img src="<%=imainImagepath %><%=imagepathEnggrammar%>" width="200" height="150" alt="image" />
					    <%
					    }
					     %>
						</td>
					</tr>
				</table>
				<%
				    String imagepathprecis=null;
					String secQryprecis= "SELECT pict_path FROM pict_on_precistest where user_id="+autoid+"";
					System.out.println("Query Precis Writing TEst::::" + secQryEnggrammar);
					Statement stmtprecis=null;
					ResultSet rssprecis=null;
					stmtprecis = connection.createStatement();
					rssprecis = stmtprecis.executeQuery(secQryprecis);
					if(rssprecis.next())
						{
					imagepathprecis=rssprecis.getString("pict_path");
					System.out.println("Image path precis:::"+imagepathprecis);
					System.out.println("Image path precis:::"+imainImagepath+imagepathprecis);
						}	
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: left;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;" align="center">
							Precis Writing Test Snapshot
						</td>
					</tr>
					<tr>
						<td>
							<%
           		     if(imagepathprecis==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
							<img src="<%=imainImagepath %><%=imagepathprecis%>" width="200" height="150" alt="image" />
						<%
					}
					     %>	
						</td>
					</tr>
				</table>
				<%
				    String imagepathMokchat=null;
					String secQryMokchat= "SELECT pict_path FROM pict_on_moktest where user_id="+autoid+"";
					System.out.println("Query Mock Chat Test::::" + secQryMokchat);
					Statement stmtMokchat=null;
					ResultSet rssMokchat=null;
					stmtMokchat = connection.createStatement();
					rssMokchat = stmtMokchat.executeQuery(secQryMokchat);
					if(rssMokchat.next())
						{
					imagepathMokchat=rssMokchat.getString("pict_path");
					System.out.println("Image path Mokchat:::"+imagepathMokchat);
					System.out.println("Image path Mokchat:::"+imainImagepath+imagepathMokchat);
						}	
					rssMokchat.close();
					stmtMokchat.close();
					rssprecis.close();
					stmtprecis.close();
					rssEnggrammar.close();
					stmtEnggrammar.close();
					rssReadingComp.close();
					stmtReadingComp.close();
					rsstyping.close();
					stmttyping.close();
					rss.close();
					stmts.close();
					connection.close();	
				%>
				<table border="0" cellpadding="6" cellspacing="6" style="float: right;">
					<tr>
						<td class="allBackColor" style="background-color: #d8d8d8;" align="center">
							Mock Chat Test Snapshot
						</td>
					</tr>
					<tr>
						<td>
							<%
           		     if(imagepathprecis==null)
           		      {
            	        %>
            	    <img src="<%=recruitPath%>images/default_person.jpg" width="200" height="150" alt="image" />
            	        <%
            	      }
            	   else
            	     { 
            	        %>
							<img src="<%=imainImagepath %><%=imagepathMokchat%>" width="200" height="150" alt="image" />
						<%
						}
					    %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  </body>
</html>
