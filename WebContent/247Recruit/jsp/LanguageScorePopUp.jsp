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
System.out.println("USER_Name in Language Score page::::"+USER_Name);
String candidateID = (String) request.getParameter("canId");
System.out.println("candID===+++++"+candidateID);
String chkColorCode_C = null;
String chkColorCode_B = null;

int Cot_Error_B= 0;
int Cot_Score_B= 0;
int Pun_Error_B= 0;
int Pun_Score_B= 0; 
int Scn_Error_B= 0;
int Scn_Score_B= 0; 
int Cot_Error_C= 0;
int Cot_Score_C= 0; 
int Pun_Error_C= 0;
int Pun_Score_C= 0;
int Scn_Error_C= 0;
int Scn_Score_C= 0;
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
 <script type="text/javascript">
 function showScriptPartA()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguagePassagePrint.jsp?CandidateId=<%=candidateID%>&Part=Partb"
		someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showScriptPartB()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguagePassagePrint.jsp?CandidateId=<%=candidateID%>&Part=Partc"
		someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
 </script>
 </head>
  
  <body>
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

<table width="650px" cellspacing="6" cellpadding="6" border="0">
  <tr>
 <%            
                     //String canId= (String) request.getParameter("candId");
	    	        //System.out.println("canId from session\t"+canId);
	                // String EDKey="[24]7";
					// String EDKPass="247Cust0m3r"; 
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
					 CallableStatement call = con.prepareCall("call ENCRYPT_LangScorePOPUP_Proc(?,?,?)");
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
			    <%}%>
    <td width="150px" class="allBackColor" id="candidateid" align="left"><%=candidateID%>
     <input type="hidden" name="candidateid" value="<%=id %>"/>
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
                float totalscores=0;
                int ppa1=0;
                int ppa2=0;
                int ppa3=0;
                int ppa4=0;
                int status=0;
                Statement stmt = null,stmtCandDtls=null;
				ResultSet rs = null,rsCandDtls=null;
			
				String Lang_Test_ID = "";
				String Lang_Passage = "";
				String PartA_Header = "";
				String PartA_Part1_Header = "";
				String PartA_Part2_Header = "";
				
				String PartB_Header = "";
				String PartB_Q = "";
				String PartC_Header = "";
				String PartC_Q1 = "";
				String PartC_Q2 = "";
				String PartC_Q3 = "";
				
				String Lang_Test_Id=null;
				String PartA_A1=null;
				String PartA_A2=null;
				String PartA_A3=null;
				String PartA_A4=null;
				String PartA_A5=null;
				String PartA_A6=null;
				String PartA_A7=null;
				String PartA_A8=null;
				String PartA_A9=null;
				String PartA_A10=null;
				String PartB_A=null;
				String PartC_A=null;
				String PartB_A_temp=null;
				String PartC_A_temp=null;
                String recruiterid=null;
                Date Scoredon=null;
                String progname=null;
                String dobfinals=null;
                String comment=null;
                float PartB_Score=0;
                String PartB_Comments=null;
                float PartC_Score=0;
                String PartC_Comments=null;
                String PartA_Selections[]={"","","","","","","","","","",""};
                String secprogid = "select * from candidate_language_testscore where Cand_Id="+id+"";
                System.out.println("Query ::::::"+secprogid);
				Statement stprogid = con.createStatement();
				ResultSet rsprogid = stprogid.executeQuery(secprogid);
				if(rsprogid.next())
				{
				progid=rsprogid.getInt("Program_Id");
				System.out.println("progid ::::::"+secprogid);
				totalscores=rsprogid.getFloat("Total_score");
				System.out.println("totalscores ::::::"+totalscores);
				status=rsprogid.getInt("Statusi");
				System.out.println("status ::::::"+status);
				recruiterid=rsprogid.getString("Recruiter_Id");
				System.out.println("recruiterid ::::::"+recruiterid);
				PartB_Score=rsprogid.getFloat("PartB_Score");
				System.out.println("PartB_Score ::::::"+PartB_Score);
				PartB_Comments=rsprogid.getString("PartB_Comments");
				System.out.println("PartB_Comments ::::::"+PartB_Comments);
				PartC_Score=rsprogid.getFloat("PartC_Score");
				System.out.println("PartC_Score ::::::"+PartC_Score);
				PartC_Comments=rsprogid.getString("PartC_Comments");
				System.out.println("PartC_Comments ::::::"+PartC_Comments);
				comment=rsprogid.getString("Comments");
				System.out.println("comment ::::::"+comment);
				
				try
				     {
						for(int i=1;i<11;i++)
						{
							System.out.println("i"+i);	
							PartA_Selections[i]=rsprogid.getString("PartA_RS"+i);
							if(PartA_Selections[i].equalsIgnoreCase("1"))	
							{
							PartA_Selections[i]="Correct";
							System.out.println("PartA_Selections ::::::"+PartA_Selections);
							}
							else
							{
							PartA_Selections[i]="In Correct";
							}
							System.out.println("PartA_Selections:::::"+PartA_Selections[i]+"i  "+i);
						}	
					}
					catch(Exception ee)
					{
					ee.getCause();
					ee.printStackTrace();
					}
				Scoredon=rsprogid.getDate("Last_scored_Date");
				SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
			    dobfinals=formatter.format(Scoredon);
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
				String seccsrec = "select Emp_Name from user_master where Emp_ID='"+recruiterid+"'";
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
			//***Candidate Answered Details****//
					String PartA_Ans[]={"","","","","","","","","","",""};
					String paragraph=null;
					String[] wordCountPartB = null;
					String[] wordCountPartC = null;
					int wordCount_PartB = 0;
					int wordCount_PartC = 0;
					String getLangCandDtls="SELECT * FROM language_test_attempt_master where Cand_Id="+id+"";
					System.out.println("getLangCandDtls  : " + getLangCandDtls);
					con= ConnectDatabase.getConnection();
					stmtCandDtls=con.createStatement();
					rsCandDtls = stmtCandDtls.executeQuery(getLangCandDtls);
				if(rsCandDtls.next())
				{
				    Lang_Test_Id=rsCandDtls.getString("Lang_Test_Id");
					System.out.println("Lang_Test_Id  : " + Lang_Test_Id);
				    try
				     {
						for(int i=1;i<11;i++)
						{
							System.out.println("i"+i);	
							PartA_Ans[i]=rsCandDtls.getString("PartA_A"+i);	
							System.out.println("PartA_Ans:::::"+PartA_Ans[i]+"i  "+i);
								
						}	
					}
					catch(Exception ee)
					{
					ee.getCause();
					ee.printStackTrace();
					}
					PartB_A = rsCandDtls.getString("PartB_A");
					System.out.println("PartB_A::::::" + PartB_A);
					PartB_A_temp = PartB_A;
					if(PartB_A.trim() != null && !PartB_A.trim().equalsIgnoreCase("") && PartB_A.trim().length() != 0)
					 {
						PartB_A_temp = PartB_A_temp.replaceAll("\\s+", " ");
						System.out.println("PartB_A_temp::::::" + PartB_A_temp);
						wordCountPartB = PartB_A_temp.split(" ");
						wordCount_PartB = wordCountPartB.length;
						System.out.println("wordCountPartB::::::" + wordCountPartB.length);
					}
					PartC_A = rsCandDtls.getString("PartC_A");
					System.out.println("PartC_A::::::" + PartC_A);
					PartC_A_temp = PartC_A;
					if(PartC_A.trim() != null && !PartC_A.trim().equalsIgnoreCase("") && PartC_A.trim().length() != 0)
					 {
						PartC_A_temp = PartC_A_temp.replaceAll("\\s+", " ");
						System.out.println("PartC_A_temp::::::" + PartC_A_temp);
						wordCountPartC = PartC_A_temp.split(" ");
						wordCount_PartC = wordCountPartC.length;
						System.out.println("wordCountPartC::::::" + wordCountPartC.length);
					}
				}
					String getLanguagePA = "SELECT * FROM language_test_master where lang_test_id = '"+Lang_Test_Id+"'";
					System.out.println("getLanguagePA  : " + getLanguagePA);
					con= ConnectDatabase.getConnection();
					stmt = con.createStatement();
					rs = stmt.executeQuery(getLanguagePA);
	
	
				if(rs.next())
				{
					paragraph=rs.getString("Lang_Passage");
					paragraph = paragraph.replaceAll("\\s+", " ");
					System.out.println("paragraph::"+paragraph);
					
					Lang_Test_ID = rs.getString("Lang_Test_Id");
					PartA_Header = rs.getString("PartA_Header");
					Lang_Passage = rs.getString("Lang_Passage");
			
					// PART A
					PartA_Part1_Header = rs.getString("PartA_Part1_Header");
					PartA_Part2_Header = rs.getString("PartA_Part2_Header");
					
					// PART B
					PartB_Header = rs.getString("PartB_Header");
					PartB_Q = rs.getString("PartB_Q");
					
					// PART C
					PartB_Header = rs.getString("PartB_Header");
					PartB_Q = rs.getString("PartB_Q");
					PartC_Header = rs.getString("PartC_Header");
					PartC_Q1 = rs.getString("PartC_Q1");
					PartC_Q2 = rs.getString("PartC_Q2");
					PartC_Q3 = rs.getString("PartC_Q3");		
				}
	        //******End of Answered Details********// 	
                 %>

<tr>
    <td class="allBackmain" align="center"><b>Scored By</b></td>
    <td class="allBackColor" align="left"><%=recruiternameDISP %></td>
    <td class="allBackmain" align="left"><b>Scored On</b></td>
    <td class="allBackColor" align="left"><%=dobfinals %></td>
  </tr>
  <tr>
   <td class="allBackmain" align="center"><b>Passage</b></td>
  <td class="allBackColor" colspan="3" align="left">
		<div class="allBackColor" style="overflow-x: hidden; overflow-y: scroll; width: 100%; height: 150px;">
			<%if(paragraph==null)
			 {
			 out.print("No Passage Available!");
			 } else 
			 {%><%=paragraph%><%}%>
		</div>
    </td>
</tr>
  
   <!-- Start of Part A -->
    <tr>
		<td class="allBackmain" align="left" colspan="4"><b>Part A</b></td>
	</tr>
    <tr>
       <td colspan="4" style="padding: 0px;">
          <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
               <%
				boolean fPart2 = false;
				for(int i = 1;i<11;i++)
				{
					if(i==1)
					{
					%>
					<tr>						
						<td colspan="4" class="allBackmain" style="font-weight: bold; font-size: 12px;">
							<%=PartA_Part1_Header %>
						</td>
					</tr>
					<tr>
						<td width="250" class="allBackColor" style="padding-left: 5px;"><%=rs.getString("PartA_Q1") %></td>
						<td align="left" width="100" class="allBackColor"><input type="text" name="partA1" id="partA1" value="<%= PartA_Ans[i]%>" class="allBackColor" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="120" class="allBackColor">
							<input type="text" class="allBackColor"  name="AnsSlctQ1" id="AnsSlctQ1" VALUE="<%=PartA_Selections[i] %>"  style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"">  
						</td>
					</tr>
					<%
					}
					else
					{	
						String tempPartA_Part = rs.getString("PartA_Q"+i+"_Part");
						if(tempPartA_Part.equals("1"))
						{
					%>
					<tr>
						<td width="250" class="allBackColor"><%=rs.getString("PartA_Q"+i) %></td>
						<td align="left" class="allBackColor" width="100"><input type="text" name="partA<%=i%>" id="partA<%=i%>" value="<%= PartA_Ans[i]%>" class="allBackColor" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="120" class="allBackColor">
							<input type="text" class="allBackColor"  name="AnsSlctQ1" id="AnsSlctQ1" VALUE="<%=PartA_Selections[i] %>"  style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"">
						</td>
					</tr>
					<%
						}
						else
						{
							if(fPart2 == true)
							{
					%>
					<tr>
						<td width="250" class="allBackColor"><%=rs.getString("PartA_Q"+i) %>	</td>
					    <td align="left" width="100" class="allBackColor"><input type="text" name="partA<%=i%>" id="partA<%=i%>" value="<%= PartA_Ans[i]%>" class="allBackColor" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="120" class="allBackColor">
							<input type="text" class="allBackColor"  name="AnsSlctQ1" id="AnsSlctQ1" VALUE="<%=PartA_Selections[i] %>"  style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"">
						</td>						
					</tr>
					<%
							}
							else
							{
								fPart2 = true;
					%>
					
					<tr>
						<td colspan="4" style="font-weight: bold; font-size: 12px;" class="allBackmain">
							<%=PartA_Part2_Header %>
						</td>
					</tr>
					<tr>
						<td width="250" class="allBackColor"><%=rs.getString("PartA_Q"+i) %></td>
					    <td align="left" width="100" class="allBackColor"><input type="text" name="partA<%=i%>" id="partA<%=i%>" class="allBackColor" value="<%= PartA_Ans[i]%>" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
					    <td width="120" class="allBackColor">
							<input type="text" class="allBackColor"  name="AnsSlctQ1" id="AnsSlctQ1" VALUE="<%=PartA_Selections[i] %>"  style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"">
						</td>						
					</tr>
						<%
								}
							}
						}
					}
						%>
            </table>
         </td>
     </tr>
 <!-- End of partA -->
 
 <!-- Start of partB -->
     <tr>
	    <td class="allBackmain" align="left" colspan="4"><b>Part B</b></td>
    </tr>
     <tr>
	   <td colspan="4" style="padding: 0px;">
		  <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
		     <%if(PartB_Header!=null){ %>
			  <tr>
				<td class="allBackmain" style="font-weight: bold; font-size: 12px;" colspan="4">
				<%=PartB_Header %>
				</td>
			 </tr>
			   <%} %>
			 <%if(PartB_Q!=null){ %>
			 <tr>
				<td align="left" class="allBackColor" width="250" nowrap="nowrap">
				<%=PartB_Q %>
				</td>
			</tr>
		 </table>
		</td>
	 </tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
			
			<%
			int totalScore_b = 0;
			int totalScore_C = 0;
			String trans = "SELECT PartB_Color_Passage, PartC_Color_Passage,Cot_Error_B,Cot_Score_B,Pun_Error_B,Pun_Score_B,Scn_Error_B,Scn_Score_B,Cot_Error_C,Cot_Score_C,Pun_Error_C,Pun_Score_C, Scn_Error_C,Scn_Score_C FROM candidate_language_testscore WHERE Cand_Id = "+id+"";
			System.out.println("sectranscript "+trans);
			Statement stmttrans = con.createStatement();
			ResultSet rstrans = stmttrans.executeQuery(trans);
			if(rstrans.next())
			{
				chkColorCode_B = rstrans.getString("PartB_Color_Passage"); 		
				chkColorCode_C = rstrans.getString("PartC_Color_Passage"); 	
				
				Cot_Error_B = rstrans.getInt("Cot_Error_B");	
				Cot_Score_B = rstrans.getInt("Cot_Score_B");	
				
				Pun_Error_B = rstrans.getInt("Pun_Error_B");	
				Pun_Score_B = rstrans.getInt("Pun_Score_B");	
				
				Scn_Error_B = rstrans.getInt("Scn_Error_B");	
				Scn_Score_B = rstrans.getInt("Scn_Score_B");	
				
				
				Cot_Error_C = rstrans.getInt("Cot_Error_C");	
				Cot_Score_C = rstrans.getInt("Cot_Score_C");	
				
				Pun_Error_C = rstrans.getInt("Pun_Error_C");	
				Pun_Score_C = rstrans.getInt("Pun_Score_C");	
				
				Scn_Error_C = rstrans.getInt("Scn_Error_C");	
				Scn_Score_C = rstrans.getInt("Scn_Score_C");	
			}
			System.out.println("chkColorCode_B "+chkColorCode_B);
			if(chkColorCode_B == null)
			{
				
				System.out.println("chkColorCode_B "+chkColorCode_B);
			%>
	<tr>
	 <td colspan="1" class="allBackmain"> <div align="center"><b>Summary</b></div></td>
	 <td colspan="3" class="allBackColor">
		<%if(PartB_A.trim()==null || PartB_A.trim().equals("") || PartB_A.trim().length() == 0)
		{%>
			No Passage Tagged for this Candidate!
		<%} else 
		{%><%=PartB_A%><%}%>
	</td>
</tr>
    <tr>
       <td class="allBackmain" align="center" colspan="1">
          <b> Score </b>
       </td>
       <td align="center" colspan="1" class="allBackColor" >
        <input type="text" name="PartB_Score" id="PartB_Score" value="<%=PartB_Score %>" class="allBackColor" type="text" readonly="readonly" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%"/>
       </td>
       <td class="allBackmain" align="center" width="100">
         <b> Comments  </b>
       </td>
       <td align="center" width="200" class="allBackColor" >
       		<%=PartB_Comments %>
       </td>
    </tr>
<%}else{%>
			
	 <tr>
	 	<td rowspan="1" class="allBackmain"> 
	 		<div align="center"><b>Summary</b></div>
	 	</td>
	 	<td colspan="3" class="allBackColor">
				<div class="allTdBackColor" style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;" name="Composition" id="Composition" LANGUAGE="javascript" readonly="readonly">
					<%=chkColorCode_B %>
				</div>
		</td>
	</tr>
	<tr style="display: none;">
		<td colspan="2" align="left" nowrap="nowrap" class="allBackColor">
			<input type="button" value="Clarity of thought" id="sbut" name="cmdsub" style="background-color: #007FFF; font-size: 11; font-weight: bold; height: 24px; border: 0px;">
			<input type="button" value="Punctuation" id="sbut" name="cmdsub" style="background-color: #FFBF00; font-size: 11; font-weight: bold; height: 24px;border: 0px;">
			<input type="button" value="Sentence Construction" id="sbut" name="cmdsub" style="background-color: #C6B0F0; font-size: 11; font-weight: bold; height: 24px;border: 0px;">
		</td>
	</tr>
<tr>
	<td class="allBackmain" align="center">
		<font style="color: red;font-weight: bold;"><%=wordCount_PartB %>&nbsp; Words</font>
	</td>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="background-color: #007FFF;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Cot_Error_B%> Clarity of Thought Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td style="background-color: #FFBF00;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Pun_Error_B%> Punctuation Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td style="background-color: #C6B0F0;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Scn_Error_B%> Sentence Construction Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
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
          <b> Score </b>
       </td>
       <td align="center" class="allBackColor">
	       <table border="0" cellpadding="3" cellspacing="3">
		       <tr>
		       		<td style="font-size: 9px; background-color: #007FFF;" align="center">       			
		       			<input type="text" name="blueColorB" id="blueColorB" value="<%=Cot_Score_B %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center">       			
		       			<input type="text" name="orangeColorB" id="orangeColorB" value="<%=Pun_Score_B %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">       			
		       			<input type="text" name="purpleColorB" id="purpleColorB" value="<%=Scn_Score_B %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>=</td>
		       		<td>
		       			<%
			       			int totalB = Cot_Score_B + Pun_Score_B + Scn_Score_B ;
			       			System.out.println("B Score " +totalB);
		       			%>
		       			<%=totalB%>
		       		</td>
		       </tr>
	       </table>
       </td>
       <td class="allBackmain" align="center" width="200">
        	<b> Comments </b>
       </td>
       <td align="center" width="400" class="allBackColor" >
       		<%=PartB_Comments %>
       </td>
	</tr>	
	
	<%}} %>


 <!-- End of partB -->
 
  <!-- Start of partC -->
	  <tr>
		<td class="allBackmain" align="left" colspan="4"><b>Part C</b></td>
	  </tr>
	 <tr>
	   <td colspan="4" style="padding: 0px;">
		 <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
		 <%if(PartC_Header!= null){ %>
	 <tr>
		<td align="left" style="font-weight: bold; font-size: 12px;background-color: #D8D8D8;font-family: Arial;">
		<%= PartC_Header%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q1 != null){ %>
	<tr>
		<td class="allBackColor" width="250" nowrap="nowrap">
		<%= PartC_Q1%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q2 != null){ %>
	<tr>
		<td class="allBackColor" width="250" nowrap="nowrap">
		<%= PartC_Q2%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td class="allBackColor" width="250" nowrap="nowrap">
		<%= PartC_Q3%>
		</td>
	</tr>
	</table>
   </td>
 </tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>

<%
	System.out.println("chkColorCode_C "+chkColorCode_C);
	if(chkColorCode_C == null)
	{
		System.out.println("chkColorCode_C "+chkColorCode_C);	
%>
	<tr>
		 <td colspan="1" class="allBackmain"> <div align="center"><b>Summary</b></div></td>
		  
		<td colspan="3" class="allBackColor">
			<%if(PartC_A==null)
			{
			out.print("No Passage available for this Candidate!");
			} else 
			{%><%=PartC_A%><%}%>
		</td>
	</tr>
	
	    <tr>
       <td class="allBackmain" align="center" colspan="1">
          <b> Score </b>
       </td>
       <td align="center" colspan="1" class="allBackColor" >
        <input type="text" name="PartC_Score" id="PartC_Score" value="<%= PartC_Score%>" class="allBackColor" type="text" readonly="readonly" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%"/>
       </td>
       <td class="allBackmain" align="center" width="100">
         <b> Comments  </b>
       </td>
       <td align="center" width="200" class="allBackColor" >
       		<%=PartC_Comments %>
       </td>
    </tr>
	
<%

	} 
	else{
%>


	 <tr>
	 	<td rowspan="1" class="allBackmain"> 
	 		<div align="center"><b>Summary</b></div>
	 	</td>
	 	<td colspan="3" class="allBackColor">
				<div class="allTdBackColor" style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;" name="Composition" id="Composition" LANGUAGE="javascript" readonly="readonly">
					<%=chkColorCode_C %>
				</div>
		</td>
	</tr>

<tr>
	<td class="allBackmain" align="center">
		<font style="color: red;font-weight: bold"><%=wordCount_PartC %>&nbsp; Words</font>
	</td>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="background-color: #007FFF;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Cot_Error_C%> Clarity of Thought Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td style="background-color: #FFBF00;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Pun_Error_C%> Punctuation Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
					       </td>
						</tr>
					</table>
				</td>
				<td style="width: 5px;">&nbsp;</td>
				<td style="background-color: #C6B0F0;">
					<table cellpadding="3" cellspacing="3" border="0">
						<tr>
					       <td>
								<input type="text" value="<%=Scn_Error_C%> Sentence Construction Errors" readonly="readonly" style="font-size: 11; text-align: center; border: none; width: 180px;">
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
          <b> Score </b>
       </td>
       <td align="center" class="allBackColor">
	       <table border="0" cellpadding="3" cellspacing="3">
		       <tr>
		       		<td style="font-size: 9px; background-color: #007FFF;" align="center">       			
		       			<input type="text" name="blueColorB" id="blueColorB" value="<%=Cot_Score_C %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center">       			
		       			<input type="text" name="orangeColorB" id="orangeColorB" value="<%=Pun_Score_C %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">       			
		       			<input type="text" name="purpleColorB" id="purpleColorB" value="<%=Scn_Score_C %>" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>=</td>
		       		<td>
		       			<%
			       			int totalC = Cot_Score_C + Pun_Score_C + Scn_Score_C ;
			       			System.out.println("B Score " +totalC);
		       			%>
		       			<%=totalC%>
		       		</td>
		       </tr>
	       </table>
       </td>
       <td class="allBackmain" align="center" width="200">
        	<b> Comments </b>
       </td>
       <td align="center" width="400" class="allBackColor" >
       		<%=PartC_Comments %>
       </td>
	</tr>	
	

<%
 }}
%>

   <!-- End of partC -->
<tr>
 <td class="allBackmain" align="center" colspan="1"><b>Comments</b></td>
 <td  class="allTdBackColor" colspan="3" align="left">
 	<%=comment %>
 </td>
 </tr>

	<tr>
      <td  class="allBackmain" align="center" colspan="1"><b>TOTAL SCORE</b></td>
      <td class="allBackColor" align="center" colspan="3"><b><%=totalscores %></b></td>
    </tr>
   </table>
   
             <%  
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


