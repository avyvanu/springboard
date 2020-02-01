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
System.out.println("USER_Name in chat Score sucess::::"+USER_Name);
String candidateID = (String) request.getParameter("canId");
System.out.println("candID===+++++"+candidateID);
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);
%>

<html>
  <head>
    <title>[24]7 Chat Score</title>
    
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
                //String canId= (String) request.getParameter("candId");
	    	    //System.out.println("canId from session\t"+canId);
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
                 //String canId= (String) request.getParameter("candId");
	    	     //System.out.println("canId from session\t"+canId);
	             //    String EDKey="[24]7";
				//	 String EDKPass="247Cust0m3r"; 
	                 String firstname=null; 
	                 String middlename=null; 
	                 String id=null;
	                 String higeduc=null;
	                 String Reveexp=null;
	                 String nonReveexp=null;
	                 String imagepath=null;
	                 String doe=null;
	                 String dobfinal=null;
	                // String secQsnxQry7 ="SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+candidateID+"'";
					// System.out.println("query "+secQsnxQry7);
					// Statement stmts = con.createStatement();
					// ResultSet rss = stmts.executeQuery(secQsnxQry7);
					 CallableStatement call = con.prepareCall("call ENCRYPT_ChatScorePOPUP_Proc(?,?,?)");
					 call.setString(1,candidateID);
					 call.setString(2,EDKey);
					 call.setString(3,EDKPass);
				     ResultSet rss = call.executeQuery();
				if(rss.next())
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
   
    <td width="250px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="150px" class="allBackColor" align="left"><%=higeduc%></td>
  </tr>
  <tr align="left">
    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
    <td class="allBackmain"><b>Customer Interaction Exp</b></td>
    <td class="allBackColor">
     <%if(Reveexp==null) {%>
      No Experience
        <%}else { %>
        <%=Reveexp %>
      <%} %>
    </td>
  </tr>
  <tr align="left">
    <td class="allBackColor">SIM</td>
    <td class="allBackmain"><b>Other Experience</b></td>
    <td class="allBackColor">
    <%if(nonReveexp==null){ %>
    No Experience
    <%}else{ %>
    <%=nonReveexp %>
    <%} %>
    </td>
  </tr>
              <% 
                int progid=0;
                float totalscores=0;
                float ppa1=0;
                float ppa2=0;
                float ppa3=0;
                float ppa4=0;
                float ppb1=0;
                float ppb2=0;
                float ppb3=0;
                float ppb4=0;
                float status=0;
                float ppascore1=0;
                float ppascore2=0;
                int totalerrors1=0;
                int totalerrors2=0;
                String recruiterID=null;
                String Scoredon=null;
                String progname=null;
                String dobfinals=null;
                String comment=null;
                String secprogid = "select * from candidate_chat_score where Cand_Id="+id+"";
                System.out.println("Query ::::::"+secprogid);
				Statement stprogid = con.createStatement();
				ResultSet rsprogid = stprogid.executeQuery(secprogid);
				if(rsprogid.next())
				{
				progid=rsprogid.getInt("Program_Id");
				totalscores=rsprogid.getFloat("Total_score");
				ppa1=rsprogid.getFloat("Chat_PPA1");
				ppa2=rsprogid.getFloat("Chat_PPA2");
				ppa3=rsprogid.getFloat("Chat_PPA3");
				ppa4=rsprogid.getFloat("Chat_PPA4");
				ppb1=rsprogid.getFloat("Chat_PPB1");
				ppb2=rsprogid.getFloat("Chat_PPB2");
				ppb3=rsprogid.getFloat("Chat_PPB3");
				ppb4=rsprogid.getFloat("Chat_PPB4");
				ppascore1=rsprogid.getFloat("Chat_PPC1_Score");
				ppascore2=rsprogid.getFloat("Chat_PPC2_Score");
				totalerrors1=rsprogid.getInt("Chat_Totalerror1");
				totalerrors2=rsprogid.getInt("Chat_Totalerror2");
				status=rsprogid.getInt("Statusi");
				recruiterID=rsprogid.getString("Recruiter_ID");
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
				String seccsrec = "select Emp_Name from user_master where Emp_ID='"+recruiterID+"'";
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
 
 <%
  
	String chkColorCode = null;
	String Chat_Totalerror1 = "";
	String Chat_Totalerror2 = "";
	String Chat_PPC1_Score = "";
	String Chat_PPC2_Score = "";
	String Chat_PartC_Comment = "";
	
	String trans = "SELECT Chat_Color_Trans, Chat_Totalerror1, Chat_Totalerror2, Chat_PPC1_Score, Chat_PPC2_Score, Chat_PartC_Comment FROM candidate_chat_score WHERE  cand_id ='"+id+"'";
	System.out.println("sectranscript "+trans);
	Statement stmttrans = con.createStatement();
	ResultSet rstrans = stmttrans.executeQuery(trans);
	if(rstrans.next())
	{
		chkColorCode = rstrans.getString("Chat_Color_Trans"); 	
		Chat_Totalerror1 = rstrans.getString("Chat_Totalerror1");
		Chat_Totalerror2 = rstrans.getString("Chat_Totalerror2");
		Chat_PPC1_Score = rstrans.getString("Chat_PPC1_Score");
		Chat_PPC2_Score = rstrans.getString("Chat_PPC2_Score");
		Chat_PartC_Comment = rstrans.getString("Chat_PartC_Comment");
		
	}
%>
  <tr>
 
 <td  class="allBackmain"> <div align="center"><b>Transcript</b></div></td>
   <% 

	if(chkColorCode == null || chkColorCode.equalsIgnoreCase("") || chkColorCode.length() == 0)
	{

   			String sectranscript = "select transcript from mock_chat_test_attempt_master where user_id='"+id+"'";
			System.out.println("sectranscript "+sectranscript);
			Statement stmttranscript = con.createStatement();
			ResultSet rstranscript = stmttranscript.executeQuery(sectranscript);
			System.out.println("rstranscript"+rstranscript);
			String transcript=null; 
         %>
    <td class="allBackColor" colspan="3">
   <div style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;" class="allTdBackColor">
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
 }else{
 %>
 <tr>	
	<td class="allBackmain" align="center" rowspan="2">
	   	<b>Transcript</b>&nbsp;<font color="red" size="1">*</font>
	   <br/>
	   <br/>
	   <br/>
    </td>
	<td colspan="4" class="allBackColor" style="font-size: 12px;">		
		<div class="allTdBackColor" style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;">
			<%=chkColorCode %>
		</div>
	</td>
</tr>
 <tr>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table>
			<tr>							
				<td style="background-color: #C6B0F0;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Chat_Totalerror1%> Sentence Construction Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td style="background-color: #FFBF00;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Chat_Totalerror2%> Sentence Construction Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
       <td class="allBackmain" align="center">
          <b> Language Score </b>
          <br/>
          <b> ( Part C ) </b>
       </td>
       <td align="center"class="allBackColor" style="width: 150px;">
	       <table border="0" cellpadding="3" cellspacing="3">
		       <tr>
		       		
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">       			
		       			<input type="text" value="<%=Chat_PPC1_Score%>" readonly="readonly" style="font-size: 10; width: 30px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center">       			
		       			<input type="text" value="<%=Chat_PPC2_Score%>" readonly="readonly" style="font-size: 10; width: 30px; text-align: center; border: none;"/>
		       		</td>
		       		<td>
		       			=
		       		</td>
		       		<td >         
		        		<%= Float.parseFloat(Chat_PPC1_Score)  + Float.parseFloat(Chat_PPC2_Score)%>
		       		</td>
		       </tr>
	       </table>
       </td>
       <td class="allBackmain" align="center" width="200">
        	<b> Comments </b>
       </td>
       <td align="center" width="400" class="allBackColor">
       		<div name="chat_partC_Comments" id="chat_partC_Comments" rows="2" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" > 
       			<%if(Chat_PartC_Comment != null ){%>
       				<%=Chat_PartC_Comment%>
       			<%}else{%>
					No comments       				
       			<%}%>
       			
       		</div>
       </td>
    </tr>
 
  


<%
}%>
	     <tr>
	       <td align="left" class="allBackheading" colspan="4">Part A - Chat Etiquette</td>
	    </tr> 
	
   <tr class="allBackmain">
    <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td  colspan="2"><b>Score</b></td>
  </tr> 
  
   <tr>
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Opening</td>
    <td class="allTdBackColor" colspan="2">
	<%= ppa1 %>
	</td>
	</tr> 
  
   <tr>
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Closing</td>
    <td class="allTdBackColor" colspan="2">
	<%= ppa2 %>
	</td>
  </tr>
  <tr>
    <td class="allBackColor" colspan="2">Did the Candidate take ownership of the situation</td>
    <td class="allTdBackColor" colspan="2">
		<%= ppa3 %>
	  </td>
  </tr>
  
  <tr>
    <td class="allBackColor" colspan="2">Did the Candidate ask for additional assistance before closing</td>
    <td class="allTdBackColor" colspan="2">
		<%= ppa4 %>
	</td>
  </tr>

 <tr>
   <td align="left" class="allBackheading" colspan="4">Part B - Customer Service</td>
    </tr>

  <tr class="allBackmain">
   <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td colspan="2"><b>Score</b></td>
 </tr>
  <tr>
   <td class="allBackColor" colspan="2">Was the Candidate Courteous/Polite</td>
    <td class="allTdBackColor" colspan="2">
		<%= ppb1 %>
	</td>
</tr>
  <tr>
   <td class="allBackColor" colspan="2">Did the Candidate Empathize/Showed concern</td>
    <td class="allTdBackColor" colspan="2">
    <%= ppb2 %>
	</td>
   </tr>
  <tr>
   <td class="allBackColor" colspan="2">Did the Candidate Comprehend the customer questions and statements </td>
    <td class="allTdBackColor" colspan="2">
	<%= ppb3 %>
	</td>
  </tr>
  <tr>
   <td class="allBackColor" colspan="2">Was the Candidate clear and concise with his explanations</td>
    <td class="allTdBackColor" colspan="2">
		<%= ppb4 %>
	</td>
  </tr>
<%
if(chkColorCode == null || chkColorCode.equalsIgnoreCase("") || chkColorCode.length() == 0)
{

%>
		 <tr>
		 	<td align="left"  class="allBackheading" colspan="4">Part C - Language </td> 
		 </tr>
		
		<tr class="allBackmain">
			 <td style="padding-left:10px;"  colspan="2"><b>Parameter</b></td> 
			 <td align="center"><b>Total Errors</b></td> 
		     <td align="center"><b>Score</b> </td> 
		 </tr>
		 <tr>
			 <td class="allBackColor" colspan="2">Grammar - (Verbs, Prepositions, Tenses, Articles etc) [9 for 0 errors and 0.25 deduction for every error]</td> 
			 <td class="allBackColor" align="center" valign="middle"><%=totalerrors1 %></td> 
		     <td class="allBackColor" id="grammarscore" align="center" valign="middle"><%=ppascore1 %></td> 
		 </tr>
		 <tr>
			 <td class="allBackColor" colspan="2">Sentence Construction [3 for 0 errors and 0.25 deduction for every error]</td> 
			 <td class="allBackColor" align="center" valign="middle"><%=totalerrors2 %></td> 
			 <td class="allBackColor" id="sentenceconstruction" align="center" valign="middle"><%=ppascore2 %></td> 
		 </tr> 
<%
}
%>		
<tr>
 <td class="allBackmain" align="center"><b>Comments</b></td>
 <td  class="allTdBackColor" colspan="3" align="left">
 	<%=comment %>
 </td>
 </tr>

<tr>
      <td  class="allBackmain" align="center"><b>TOTAL SCORE</b></td>
      <td class="allBackColor" align="center" colspan="3"><b><%=totalscores %></b></td>
   </tr>
   </table>
   
             <%  
				
				rsss.close();
				stssmt.close();
				rsprogid.close();  
				stprogid.close(); 
				rss.close();  
				//  stmts.close();
		        con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
				} 
				%>
  
</form>

			<!-- ############################################ -->    
	  </td>
	  </tr>
	  </table> 
     
  </body>
</html>


