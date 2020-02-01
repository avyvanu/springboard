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
String candidateID = (String) request.getParameter("canId");
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
  
  <body>
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
<%            		 String firstname=null; 
	                 String middlename=null; 
	                 String id=null;
	                 String higeduc=null;
	                 String Reveexp=null;
	                 String nonReveexp=null;
	                 String imagepath=null;
	                 String doe=null;
	                 String dobfinal=null;
	                 CallableStatement call = con.prepareCall("call ENCRYPT_PrecisScorePOPUP_Proc(?,?,?)");
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
	            	<td rowspan="3" style="width:100px;" colspan="1" valign="middle">
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="120px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
   <td width="100px" rowspan="3"> 
   	 <img src="<%=recruitPath%>/jsp/displayImageView.jsp?CID=<%=candidateID%>" width="120px" height="120px" alt="image" /></td>
    <%} %>
    <td width="150px" class="allBackColor" id="candidateid" align="left"><%=candidateID%>
     <input type="hidden" name="candidateid" value="<%=id %>"/>
     <input type="hidden" name="pagevalue" value="<%=pagevalue%>">
     </td>
   
    <td width="200px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="200px" class="allBackColor" align="left"><%=higeduc%></td>
  </tr>
  <tr align="left">
    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
    <td class="allBackmain"><b>Customer Interaction Exp</b></td>
    <td class="allBackColor">
            <%if(Reveexp==null){ %>No Experience<%}else{ %><%=Reveexp%><%} %>
    </td>
  </tr>
  <tr align="left">
    <td class="allBackColor">SIM</td>
    <td class="allBackmain"><b>Other Experience</b></td>
    <td class="allBackColor">
     <%if(nonReveexp==null){ %>No Experience<%}else{ %><%=nonReveexp%><%} %>
    </td>
  </tr>
 
	  
              <% 
                int progid=0;
                int totalscores=0;
                int ppa1=0;
                int ppa2=0;
                int ppa3=0;
                int ppa4=0;
                int status=0;
                String recruiterId=null;
                String Scoredon=null;
                String progname=null;
                String dobfinals=null;
                String comment=null;
                String secprogid = "select * from candidate_precis_writing_score where Cand_Id="+id+"";
                System.out.println("Query ::::::"+secprogid);
				Statement stprogid = con.createStatement();
				ResultSet rsprogid = stprogid.executeQuery(secprogid);
				if(rsprogid.next())
				{
				progid=rsprogid.getInt("Program_Id");
				totalscores=rsprogid.getInt("Total_score");
				ppa1=rsprogid.getInt("Precis_PPA1");
				ppa2=rsprogid.getInt("Precis_PPA2");
				ppa3=rsprogid.getInt("Precis_PPA3");
				ppa4=rsprogid.getInt("Precis_PPA4");
				status=rsprogid.getInt("Statusi");
				totalscores=rsprogid.getInt("Total_score");
				recruiterId=rsprogid.getString("Recruiter_Id");
				comment=rsprogid.getString("Comments");
				Scoredon=rsprogid.getString("Last_scored_Date");
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
    <td class="allBackColor" align="left"><%=recruiternameDISP %></td>
    <td class="allBackmain" align="left"><b>Scored On</b></td>
    <td class="allBackColor" align="left"><%=dobfinals %></td>
  </tr>
  <tr>
   <td class="allBackmain" align="center" colspan="1"><b>Passage</b></td>
    <%
                String paragraph=null;
                String secpara = "select pm.precis_writing_passage from precis_writing_passages_master pm, precis_test_attempt_master pt  where pm.precis_passage_id=pt.precis_passage_id and pt.user_id='"+id+"'";
                System.out.println("query "+secpara);
				Statement stmenpara = con.createStatement();
				ResultSet rsss_para = stmenpara.executeQuery(secpara);
				while(rsss_para.next())
				{
				paragraph=rsss_para.getString(1);
				System.out.println("paragraph "+paragraph);
				}
	%>
    
     
    <td colspan="3" align="left">
    <textarea style="width:100%;resize:none;height:90px;font-size:13px;border: white;" readonly="readonly" id="w" class="allTdBackColor">
<%if(paragraph==null)
 {
 out.print("No Passage Available!");
 } else 
 {%><%=paragraph%><%}%></textarea>
         </td>
</tr>
  
  <tr>
   <td class="allBackmain" align="center" colspan="1"><b>Summary</b></td>
   <%
                String typedpara=null;
                String secquery = "select Precis_Typed_Area_Text  from precis_test_attempt_master where user_id="+id+"";
                System.out.println("query "+secquery);
				Statement stments = con.createStatement();
				ResultSet rssss = stments.executeQuery(secquery);
				
				while(rssss.next())
				{
				
				typedpara=(rssss.getString("Precis_Typed_Area_Text")).trim();
				System.out.println("typedpara "+typedpara);
				}
	  %>
   <td class="allBackColor" colspan="3" align="left"> 
<textarea style="width:100%;resize:none;height:60px;font-size:13px;border: white;" readonly="readonly" id="w" class="allTdBackColor"><%if((typedpara==null)||(typedpara=="")){out.print("No Passage Summary Available!");}else{%><%=typedpara%><%}%></textarea>  	 
 </td>
 </tr>
  <tr>
  <% 
       int desiredscore=0;
       String qrydesired = "select desired_score from precis_desired_score where program_id='"+progid+"'";
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
            
    <td  class="allBackmain" colspan="2" align="left"><b>Parameter</b></td>
 
    <td  class="allBackmain" align="center" colspan="2" align="left"><b>Score</b></td>
  </tr>
 <tr>
    <td  class="allBackColor" colspan="2" align="left">Clarity/ logical flow of thought</td>  
    <td  class="allTdBackColor" align="center" colspan="2">
	<%=ppa1 %>
	</td>
  </tr>
  <tr>
    <td class="allBackColor" colspan="2" align="left">Punctuation</td>
    <td class="allTdBackColor" align="center"  colspan="2">
	<%=ppa2 %>
	</td>
  </tr>
  <tr>
    <td class="allBackColor" colspan="2" align="left">Spellings</td>
    <td class="allTdBackColor" align="center"  colspan="2">
	<%=ppa3 %>
	</td>
  </tr>
   <tr>
    <td class="allBackColor" colspan="2" align="left">Sentence construction (Grammatical errors)</td>
    <td class="allTdBackColor"  colspan="2" align="center">
	<%=ppa4 %>
	</td>
  </tr>
<tr>
 <td class="allBackmain" align="center" colspan="1"><b>Comments</b></td>
 <td  class="allTdBackColor" colspan="3" align="left">
 <textarea name="comments" id="comments" rows="4" style="resize:none;width:100%;height:30px;background-color: #F2F2F2;border: #F2F2F2;" readonly="readonly" ><%=comment %></textarea>
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
				rssss.close();
				stments.close();
				rsss_para.close();
				stmenpara.close();
				rsss.close();
				stssmt.close();
				rsprogid.close();
				stprogid.close();
				rss.close();
			//	stmts.close();
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


