<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
System.out.println("USER_Name in home page::::"+USER_Name);
String candidateID = (String) request.getParameter("canId");
System.out.println("candID===+++++"+candidateID);
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);

 %>

<html>
  <head>
    <title>[24]7 SPRINBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
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
  
  <body style="overflow-x:hidden">
    <%      
             try
             {
                Connection con = ConnectDatabase.getConnection(); 
                
                 %>
	     <table>
	     <tr>
	     <td >
	        <!-- ******************Header code begins************** -->
 
 <form action="<%=request.getContextPath()%>/PrecisWritingScore" method="post" id="precisscoresubmitform" name="precisscoresubmitform" method="post" onsubmit="return CheckValidation();">
		<table width="650px" cellspacing="6" cellpadding="6" border="0">
  			<tr>
 				<%            
                 	String firstname=null; 
	                 String middlename=null; 
	                 String id=null;
	                 String higeduc=null;
	                 String Reveexp=null;
	                 String nonReveexp=null;
	                 String imagepath=null;
	                 String doe=null;
	                 String dobfinal=null;
                	 CallableStatement call = con.prepareCall("call ENCRYPT_ChatScorePOPUP_Proc(?,?,?)");
					 call.setString(1,candidateID);
					 call.setString(2,EDKey);
					 call.setString(3,EDKPass);
				     ResultSet rss = call.executeQuery();					 
				while(rss.next())
				{
					id=rss.getString("AutoID");
					System.out.println("Auto ID::::::"+id);
					candidateID=rss.getString("Bpo_Cand_Id");
					firstname=rss.getString("First_Name");
					middlename=rss.getString("Middle_Name");
					higeduc=rss.getString("Qualification");
					Reveexp=rss.getString("RelevantExprience");
					nonReveexp=rss.getString("NONRelevantExprience");
					doe= rss.getString("system_date_time");
				    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-MMM-yyyy");
					Date date=dateFormat.parse(doe);
					imagepath=rss.getString("ImagePath");
				    dobfinal=dateFormat2.format(date);
				}
                 %>
            <%     if(imagepath==null)
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
			   		<img src="<%=recruitPath%>/jsp/displayImageView.jsp?CID=<%=candidateID%>" width="120px" height="90px" alt="image" />
			   	</td>
			    <%} %>
			
			    <td width="150px" class="allBackColor" id="candidateid" align="left"><%=candidateID%>
			     </td>
			   
			    <td width="200px" class="allBackmain"><b>Highest Education</b></td>
			    <td width="200px" class="allBackColor"><%=higeduc%></td>
  		</tr>
  		<tr>
		    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
		    <td class="allBackmain"><b>Customer Interaction Exp</b></td>
		    <td class="allBackColor">
		            <%if(Reveexp==null)
							{ %>
							No Experience
							<%}
							else
							{ %>
							<%=Reveexp%>
							<%} %>
		    </td>
  		</tr>
  	<tr>
	    <td class="allBackColor">Voice</td>
	    <td class="allBackmain"><b>Other Experience</b></td>
	    <td class="allBackColor">
	    <%if(nonReveexp==null){ %> No Experience<%}else{ %><%=nonReveexp%><%} %>
	    </td>
   </tr>
 	  
              <% 
                int progid=0;
                int totalscores=0;
                int ppa1=0;
                int ppa2=0;
                int ppb1=0;
                int ppb2=0;
                int ppc1=0;
                int ppc2=0;
                float status=0;
                String recruiterId=null;
                String Scoredon=null;
                String progname=null;
                String dobfinals=null;
                String comment=null;
                String secprogid = "select * from candidate_voice_score where Cand_id="+id+"";
                System.out.println("Query ::::::"+secprogid);
				Statement stprogid = con.createStatement();
				ResultSet rsprogid = stprogid.executeQuery(secprogid);
				if(rsprogid.next())
				{
				progid=rsprogid.getInt("Program_Id");
				totalscores=rsprogid.getInt("Total_score");
				ppa1=rsprogid.getInt("PPA1");
				ppa2=rsprogid.getInt("PPA2");
				ppb1=rsprogid.getInt("PPB1");
				ppb2=rsprogid.getInt("PPB2");
				ppc1=rsprogid.getInt("PPC1");
				ppc2=rsprogid.getInt("PPC2");
				
				
				status=rsprogid.getInt("Statusi");
				recruiterId=rsprogid.getString("Recruiter_ID");
				comment=rsprogid.getString("Comments");
				Scoredon=rsprogid.getString("Last_Scored_Date");
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-mm-dd");
				//SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-mm-yyyy");
				Date date=dateFormat.parse(Scoredon);
				dobfinals=dateFormat.format(date);
				}
              	String seccsQsnQry = "select Program_Name from program_names_master where Program_id="+progid+"";
				System.out.println("Query::::::"+seccsQsnQry);
				Statement stssmt = con.createStatement();
				ResultSet rsss = stssmt.executeQuery(seccsQsnQry);
				if(rsss.next())
				{
				progname=rsss.getString("Program_Name");
				}
				
				//*****Recruiter Name*****//
				String recruiternameDISP=null;
				String seccsrec = "select Emp_Name from user_master where Emp_ID='"+recruiterId+"'";
				System.out.println("Query::::::"+seccsrec);
				Statement stsrec = con.createStatement();
				ResultSet rsrec = stsrec.executeQuery(seccsrec);
				if(rsrec.next())
				{
				recruiternameDISP=rsrec.getString("Emp_Name");
				}
				rsrec.close();
				stsrec.close();
				//*****Recruiter Name*****//
			%>

	<tr>
	    <td class="allBackmain" align="center"><b>Scored By</b></td>
	    <td class="allBackColor"><%=recruiternameDISP %></td>
	    <td class="allBackmain"><b>Scored On</b></td>
	    <td class="allBackColor"><%=dobfinals %></td>
	</tr>
	<tr>
		<td class="allBackmain" align="left">
			<b>Audio File</b>
		</td>
			<%
			    String media = null;
				String secmedia = "SELECT VAUploadPath FROM bpo_candidatesreg_details where bpo_cand_id='"+ candidateID + "'";
				System.out.println("File name:: " + secmedia);
				Statement stmtmedia = con.createStatement();
				ResultSet rsmedia = stmtmedia.executeQuery(secmedia);
				if (rsmedia.next()) {
					media = rsmedia.getString("VAUploadPath");
					System.out.println("media file name:: " + media);
				}
			%>
		<td class="allBackColor" colspan="3" align="left">
			<%
			if (media == null)
			 {
				out.print("No Audio file found for this candidate");
			 } 
			else
			 {
			%>
			<A class=media href="<%=voicePath%><%=media%>"></A>
			<%
			}
			%>
		</td>
	 </tr>
  	<tr class="allBackheading">
		<td align="left"  colspan="4">
			Part A - Language
		</td>
	</tr>
    <tr class="allBackmain">
		<td  style="padding-left: 10px;" colspan="2">
			<b>Parameter</b>
		</td>					
		<td align="center" colspan="2">
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Sentence Structure
		</td>
					 <% 
		       int desiredscore=0;
		       String qrydesired = "select Desired_score from voice_desired_score where Program_Id='"+progid+"'";
		       System.out.println("Query Desired score"+qrydesired);
		       Statement stdesired = con.createStatement();
		       ResultSet rsdesired = stdesired.executeQuery(qrydesired);
		       ArrayList ar=new ArrayList();
		       while(rsdesired.next())
		               {
		               	desiredscore=rsdesired.getInt("desired_score");
		               	ar.add(desiredscore);
		               }
              %> 
		<td class="allTdBackColor" align="center" colspan="2">
 				 <%= ppa1%>
		</td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Clarity of Thought
		</td>					
		<td class="allTdBackColor" align="center"  colspan="2">
			<%= ppa2%>
        </td>
	</tr>
    <tr class="allBackheading">
		<td colspan="4">
			Part B - Accent
		</td>
	</tr>
    <tr class="allBackmain">
		<td  style="padding-left: 10px;" colspan="2">
			<b>Parameter</b>
		</td>					
		<td align="center" colspan="2">
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Pronunciation
		</td>					
		<td class="allTdBackColor" align="center" colspan="2">
			<%= ppb1%>
        </td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Clarity of Speech
		</td>					
		<td class="allTdBackColor" align="center" colspan="2">
						<%= ppb2%>
		</td>
	</tr>
     <tr class="allBackheading">
		<td colspan="4">
			Part C - Overall Performance
		</td>
	</tr>
       <tr class="allBackmain">
		<td  style="padding-left: 10px;" colspan="2">
			<b>Parameter</b>
		</td>					
		<td align="center" colspan="2">
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Rate of speech
		</td>					
		<td class="allTdBackColor" align="center" colspan="2">
			<%= ppc1%>
		</td>
	</tr>
	<tr>
		<td class="allBackColor" style="padding-left: 10px;" colspan="2">
			Creativity
		</td>					
		<td class="allTdBackColor" align="center" colspan="2">
		<%= ppc2%>
		</td>
	</tr>

	<tr>
		 <td class="allBackmain" align="center" colspan="1"><b>Comments</b></td>
		 <td  class="allTdBackColor" colspan="3">
		 	<%=comment %>
		 </td>
	 </tr>
	<tr>
	      <td  class="allBackmain" align="center" colspan="1"><b>TOTAL SCORE</b></td>
	      <td class="allBackColor" align="center" colspan="3"><b><%=totalscores %></b></td>     
   </tr>
   </table>
   
             <%  
                  rsdesired.close();
                  stdesired.close();
                  rsss.close();
                  stssmt .close(); 
		          con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
					
				} %>
  
</form>

			<!-- ############################################ -->    
	  </td>
	  </tr>
	  </table> 
     
  </body>
</html>


