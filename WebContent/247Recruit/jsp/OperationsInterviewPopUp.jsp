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
     if(USER_Name==null)
	  	{
	  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
System.out.println("USER_Name in Ops  Pop up page::::"+USER_Name);
String candidateID = (String) request.getParameter("canId");
System.out.println("candID===+++++"+candidateID);
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);

 %>
 <%
	String SID = request.getParameter("stabilityid");
	System.out.println("SID" + SID);
	if (SID == null) {

		Integer partid = 1;
		int questionid = 1;
%>

<html>
  <head>
    <title>[24]7 Operations Interview</title>
    
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

<table width="600px" cellspacing="6" cellpadding="6" border="0">
  <tr>
 <%            
               		 String firstname=null; 
	                 String middlename=null; 
	                 String CandAutoId=null;
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
					CandAutoId =rss.getString("AutoID");
					System.out.println("Auto ID::::::"+CandAutoId);
					candidateID=rss.getString("Bpo_Cand_Id");
					firstname=rss.getString("First_Name");
					middlename=rss.getString("Middle_Name");
					higeduc=rss.getString("Qualification");
					Reveexp=rss.getString("RelevantExprience");
					nonReveexp=rss.getString("NONRelevantExprience");
					doe= rss.getString("system_date_time");
				    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-mm-dd");
					SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-mm-yyyy");
					Date date=dateFormat.parse(doe);
					imagepath=rss.getString("ImagePath");
				    dobfinal=dateFormat2.format(date);
				}
                 %>
            	<%     
            	if(imagepath==null)
           		{
            	 %>
	            	<td width="120px" rowspan="4" style="padding: 0px;"> 
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="150px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
   					<td width="120px" rowspan="4" style="padding: 0px;"> 
     					<img src="<%=recruitPath%>/jsp/displayImageView.jsp?CID=<%=candidateID%>" width="120px" height="150px" alt="image" />
     				</td>
    				<%} %>
    <td width="200px" class="allBackColor" id="candidateid" align="left"><%=candidateID%>
     <input type="hidden" name="candidateid" value="<%=CandAutoId %>"/>
     <input type="hidden" name="pagevalue" value="<%=pagevalue%>">
     </td>
   
    <td width="150px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="150px" class="allBackColor" align="left"><%=higeduc%></td>
  </tr>
  <tr align="left">
    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
    <td class="allBackmain"><b>Customer Interaction Experience</b></td>
    <td class="allBackColor"> <%if(Reveexp==null){ %>No Experience<%}else{ %><%=Reveexp%><%} %></td>
  </tr>
  <tr align="left">
    <td class="allBackColor">SIM</td>
    <td class="allBackmain"><b>Other Experience</b></td>
    <td class="allBackColor"><%if(nonReveexp==null){ %>No Experience<%}else{ %><%=nonReveexp%><%} %></td>
  </tr>
  <tr align="left">
    <td class="allBackColor">DOE : <%=dobfinal %></td>
    <td class="allBackmain"><b>Scored For Program</b></td>
    <td class="allTdBackColor">
	  
              <% 
                
                int totalscores=0;
                int status=0;
                String recruiterid=null;
                String Scoredon=null;
                String progname=null;
                String dobfinals=null;
                String comment=null;
                String recruitername=null;
                String operationschkid=null;
                String programid=null;
                String secprogid = "select * from operations_interview_master where Candidate_ID="+CandAutoId+"";
                System.out.println("Query ::::::"+secprogid);
				Statement stprogid = con.createStatement();
				ResultSet rsprogid = stprogid.executeQuery(secprogid);
				if(rsprogid.next())
				{
				
					totalscores=rsprogid.getInt("Score");
					status=rsprogid.getInt("Result_Status");
					recruiterid=rsprogid.getString("User_Id");
					comment=rsprogid.getString("Overall_comment");
					Scoredon=rsprogid.getString("End_Date");
					operationschkid=rsprogid.getString("operations_interview_ID"); 
					programid=rsprogid.getString("Program_Id");
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-mm-dd");
					//SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-mm-yyyy");
					Date date=dateFormat.parse(Scoredon);
					dobfinals=dateFormat.format(date);
				}
              	String seccsQsnQry = "select Program_Name from program_names_master where Program_id="+programid+"";
				System.out.println("Query::::::"+seccsQsnQry);
				Statement stssmt = con.createStatement();
				ResultSet rsss = stssmt.executeQuery(seccsQsnQry);
				if(rsss.next())
				{
					progname=rsss.getString("Program_Name");
				}
				String seccsrec = "select Emp_Name from user_master where Emp_ID="+recruiterid+"";
				System.out.println("Query::::::"+seccsrec);
				Statement stsrec = con.createStatement();
				ResultSet rsrec = stsrec.executeQuery(seccsrec);
				if(rsrec.next())
				{
					recruitername = rsrec.getString("Emp_Name");
				}
			%>
           <%=progname%>    
          	</td>
  </tr>
<tr>
    <td class="allBackmain" align="center"><b>Scored By</b></td>
    <td class="allBackColor" align="left"><%=recruitername %></td>
    <td class="allBackmain" align="left"><b>Scored On</b></td>
    <td class="allBackColor" align="left"><%=dobfinals %></td>
  </tr>
<%
						//Integer partid=0;
						//int questionid=0;
						int rowcnt = 0;
						String PIDs = "";
						String QIDs = "";
						String QCounts = "";
						String description = null;
						String Porderno = null;
						Statement stmtpartid,stmtpart=null;
						Statement stmt=null;
						ResultSet rsspartid,rsspart=null;
						ResultSet rs=null;
						String secqrypartid = "select Part_Description,Part_Id,order_no from operations_interview_part_master where Program_Id='"+programid+"' and isalive=1 order by order_no";
						System.out.println("Part id " + secqrypartid);
						stmtpartid = con.createStatement();
						rsspartid = stmtpartid.executeQuery(secqrypartid);
					    while (rsspartid.next())
					    {
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
						<td colspan="4" class="allBackheading">
							Part-<%=Porderno%>&nbsp;<%=description%></td>
					</tr>
					<tr class="allBackmain">
						<td colspan="1" align="center">Sl.No</td>
						<td>Question</td>
						<td>Comments</td>
					    <td>Score</td>
					</tr>
	                <%
		                	String Question = null;
							String qorderno = null;
							String secpart = "select Question_Id,Question,order_no from operations_interview_question_master where isalive=1 and  part_id="+ partid + " order by order_no";
							System.out.println("Stability table details " + secpart);
							stmtpart = con.createStatement();
							rsspart = stmtpart.executeQuery(secpart);
							while (rsspart.next())
							{
								questionid = rsspart.getInt("Question_Id");
								Question = rsspart.getString("Question");
								qorderno = rsspart.getString("order_no");
								
								String CommentsInputed = "";
								String ScoreInputed = "";
								String secqrypartid12 = "select Comments,Score from operations_interview_part_qustn_scores where Part_Id=" + partid + " and Question_Id=" + questionid + " and operations_interview_Id="+operationschkid+"";
								System.out.println("Part id " + secqrypartid12);
								stmt = con.createStatement();
								rs = stmt.executeQuery(secqrypartid12);
								if(rs.next())
							    {
									CommentsInputed = rs.getString("Comments");
									ScoreInputed = rs.getString("Score");
									if(ScoreInputed.equalsIgnoreCase("0"))
									{
										ScoreInputed="NA";
									}
					    }   
						%>
						<tr align="left">
						<td class="allBackColor" align="center" colspan="1"><%=qorderno%></td>
						<td class="allBackColor"><%=Question%></td>
						<td class="allBackColor" style="background-color: #F2F2F2;">
							<%=CommentsInputed%>
						</td>
						<td class="allBackColor" align="center">
					     <%=ScoreInputed%>
                        </td>
					</tr>
	                    <%
					     }
						}
						%>
					 <tr>
				       <td class="allBackheading" align="center" colspan="4">Mention all verbatim - in the interview form
					 </td>
				    </tr>

			  <tr>
				 <td class="allBackmain" align="center" colspan="1"><b>Comments</b></td>
				 <td  class="allTdBackColor" colspan="3">
				 		<%=comment%>
				 </td>
			 </tr>

		     <tr>
			      <td  class="allBackmain" align="center" colspan="1"><b>TOTAL SCORE</b></td>
			      <td class="allBackColor" align="center" ><b><%=totalscores %></b></td>
			     <td  class="allBackmain" align="center"><b>Status </b></td>
			     <td  class="allBackColor" align="center" >
			     <%if(status==1){ %>
			     Selected
			     <%} else if(status==2) { %>
			     On Hold
			     <%} else if(status==3) {%>
			     Rejected
			     <%} %>
			     </td>
		   </tr>
   </table>
   
             <%  
                rs.close();
				stmt.close();
				rsspart.close();
				stmtpart.close();
				rsspartid.close();
				stmtpartid.close();
				rsss.close();
				stssmt.close();
				rsprogid.close();
				stprogid.close(); 
				rss.close(); 
			// 	stmts.close();
		        con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
					
				} 
				}%>
  </form>
		<!-- ############################################ -->    
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


