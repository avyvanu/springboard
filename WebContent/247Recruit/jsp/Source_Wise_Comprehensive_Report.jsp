<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" isELIgnored="false" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="GlobalDeclare.jsp" %>



<html>
  <head>
    <title>[24]7 Source Wise Comprehensive Report</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script type="text/javascript" language="javascript">	
		
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
	</script>
	
	<style>
.tblGRID 
{ 
    width: 100%; 
    background-color: #fff; 
    margin: 5px 0 10px 0; 
    border: solid 1px #525252; 
    border-collapse:collapse; 
}
.tblGRID td { 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #333333; 
    font-size: 12px; 
}
.tblGRID th { 
    padding: 4px 2px; 
    color: #fff; 
    background-color: #424242; 
    border-left: solid 1px #525252; 
    font-size: 12px; 
}
html,body

{

margin: 0px;

}
	</style>
		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->
	
			<script type="text/javascript">
		$(function() {
		$("#ReoprtVOICEfrom").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2050',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true		
		    });
	    });
	   </script>  
		<!-- end birth_City calender  -->
		
		<!--  from date and to date start -->
		<script type="text/javascript">
		$(function() {
		$("#ReoprtVOICEto").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2050',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->

  </head>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	     if(USER_Name==null)
		  	{
		  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	
	String User_Center_Id = (String)session.getAttribute("User_Center_Id");
	if(User_Center_Id==null)
		  	{
		  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	System.err.println(">>>>>>>>\t"+df.format(new Date()));
	String FromDAte=request.getParameter("ReoprtVOICEfrom");
	String ToDAte=request.getParameter("ReoprtVOICEto");
	if(FromDAte==null || FromDAte.equalsIgnoreCase(""))
	{
		FromDAte=df.format(new Date());
		System.err.println(">>>>11111111111111>>>>\t"+FromDAte);
		ToDAte=FromDAte;
		System.err.println(">>>>22222222222>>>>\t"+ToDAte);
	}
	String[] forFROMSplit=null;
	String[] forToSplit=null;
	String strFrom=null;
	String strTo=null;
	try
	{
		forFROMSplit=FromDAte.split("-");
		strFrom=forFROMSplit[2]+"-"+forFROMSplit[1]+"-"+forFROMSplit[0];
		//    System.out.println("strFrom \t"+strFrom);	
		
		request.setAttribute("F",FromDAte);
	}
	catch(Exception e)
	{
		//    System.out.println(e.getMessage());
		e.printStackTrace();
	}
	try
	{
		forToSplit=ToDAte.split("-");
		strTo=forToSplit[2]+"-"+forToSplit[1]+"-"+forToSplit[0];
		//    System.out.println("strTo \t"+strTo);
		request.setAttribute("T",ToDAte);
	}
	catch(Exception e)
	{
		//    System.out.println(e.getMessage());
		e.printStackTrace();
	}
	
							    		
	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	ResultSet rsCommon = null;
%>

  
  <body>
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Reports_Home_Page.jsp">Reports</a> > </font>
	            <font class="nonLink">Source Wise Comprehensive Report</font>
	        </td>
	        <td align="right"  style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="padding-left:10px;padding-right: 10px;" align="center">
	        <br/>
	            <table border="0" cellpadding="0" cellspacing="0" width="1200px">
		            <tr>
			            <td colspan="2">
			            	<form action="" method="post">
			            	<table border="0" cellpadding="0" cellspacing="0">
			            		<tr>
			            			<td>From:<input type="text" name="ReoprtVOICEfrom" id="ReoprtVOICEfrom" value="${F}"/></td>
			            			<td> To:<input type="text" name="ReoprtVOICEto" id="ReoprtVOICEto" value="${T}"/> </td>
			            			<td><input type="submit" name="searchCand" class="buttonSmall" value="Go"  /></td>
			            		
			            			<td nowrap="nowrap"></td>
			            		</tr>
			            	</table>
			            	</form>
						    <table border="1" cellpadding="3" cellspacing="0" rules="all" width="100%">
							    	<tr style="font-weight: bold; font-size: 12px; background-color: #424242; color: white;">
						    		<th>
						    			Sl No  <!-- 1 -->
						    		</th>
						    		<th>
						    			Source  <!-- 2 -->
						    		</th>
						    		<th>
						    			Initial Registration <!-- 3 -->
						    		</th>
						    		<th>
						    			Photo Identification <!-- 4 -->
						    		</th>						    		
						    		<th>
						    			Test Initiated <!-- 5 -->
						    		</th>						    		
						    		<th>
						    			Test Completed <!-- 6 -->
						    		</th>
						    		<th>
						    			Stability Check Done<!-- 7 -->
						    		</th>
						    		<th>
						    			Test Scored   <!-- 8  -->
						    		</th>
						    		<th>
						    			Candidate Selected   <!-- 8  -->
						    		</th>
						    		<th>
						    			OPS Round Done <!-- 9 -->
						    		</th>
						    		<th>
						    			Documents Checked <!-- 10 -->
						    		</th>	
						    		<th>
						    			Offer Made <!-- 11 -->
						    		</th>
						    		<th>
						    			Offer Generated <!-- 12 -->
						    		</th>
						    		<th>
						    			Offer Pending<!-- 13 -->
						    		</th>			    		
						    		<th>
						    			Offer Rejected<!-- 14 -->
						    		</th>
						    		<th>
						    			Offered (not moved to appointment)<!-- 15 -->
						    		</th>
						    		<th>
						    			Joinee<!-- 16 -->
						    		</th>
						    		<th>
						    			Total <!-- 17 -->
						    		</th>
					    	</tr>
						    <%
								String queryForSource=null;
								int totalOf_InitalREG = 0;
								int totalOf_Photo = 0;
								int totalOf_Test_Initiated = 0;
								int totalOf_Test_Completed  = 0;
								int totalOf_StabilityChk  = 0;
								int totalOf_Test_Scored   = 0; 
								int totalOf_Candiate_Score   = 0; 
								int totalOf_OPS_Round   = 0;
								int totalOf_Documents_chk = 0; 
								int totalOf_Offer_Made = 0;
								int totalOf_Joinee = 0;
								
								int totalOf_Row_Source = 0;
								try
								{
									con=ConnectDatabase.getConnection();
									queryForSource = "SELECT source_id, source_name FROM source_from WHERE is_Active=0";
									stmt = con.createStatement();
									rs = stmt.executeQuery(queryForSource);									
						    	}
						    	catch(Exception e)
						    	{
						    		e.printStackTrace();
						    	}	

					    		String toatalGetReg ="";
					    		String priSourceVal = "";	
					    							  		
					    		int iCounter=0;
					    		while(rs.next())
					    		{
					    			iCounter=iCounter+1;
					    			String sourceDisp = rs.getString("source_name");
					    			String sourceDispId = rs.getString("source_id");						    			
					    			//    System.out.println("\t"+sourceDispId+"\t"+sourceDisp);
					    	%>
					    	<tr style="font-size: 12px; color: black; background-color: #f8f8ff;">
					    		<td align="center" valign="middle">
					    			<%=iCounter%>		<!-- 1 -->
					    		</td> 
					    		<td>
					    			<%=sourceDisp%>			<!-- 2 -->
					    		</td>
					    		<td align="center" valign="middle">
					        <%
					  			String queryForPrimarySource = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 1  AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
						    	stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(queryForPrimarySource);
					    		int priData1 = 0;
					    		if(rsCommon.next())
					    		{
									priData1 = rsCommon.getInt("val");
									//    System.out.println("priData1  Inside  \t"+priData1);
									if(priData1 > 0)
				    				{
				    					
									%>
										<%=priData1%>
									<%
										totalOf_InitalREG = totalOf_InitalREG + priData1;
									}
									totalOf_Row_Source = priData1;
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    								<!-- Registered 3 -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_PHOTO = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 2 AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_PHOTO \t"+query_PHOTO);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_PHOTO);
					    		int priData2 = 0;
					    		if(rsCommon.next())
					    		{
									priData2 = rsCommon.getInt("val");
									if(priData2 > 0)
				    				{
									%>
										<%=priData2%>
									<%
									totalOf_Photo = totalOf_Photo + priData2;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData2;
									
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    		
					    	%>	
					    								<!-- 4 Photo Identification Done -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_pendingInter = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 3 AND primary_source = " + sourceDispId +"  AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_pendingInter \t"+query_pendingInter);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_pendingInter);
					    		
					    		int priData3 = 0; 
					    		if(rsCommon.next())
					    		{					    				
									priData3 = rsCommon.getInt("val");
									if(priData3 > 0)
				    				{
									%>
										<%=priData3%>
									<%
									totalOf_Test_Initiated = totalOf_Test_Initiated + priData3;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData3;									
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
 												    		
					    					<!-- 5 Test Initiated  -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_FinalSelect = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 4 AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_FinalSelect \t"+query_FinalSelect);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_FinalSelect);
					    		int priData4 = 0;
					    		if(rsCommon.next())
					    		{
					    			
									priData4 = rsCommon.getInt("val");
									if(priData4 > 0)
				    				{
									%>
										<%=priData4%>
									<%
									totalOf_Test_Completed = totalOf_Test_Completed + priData4 ;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData4;
									
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    					<!-- 6 Test Completed -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_Reject = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 5 AND primary_source = " + sourceDispId +"  AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_Reject  \t"+query_Reject);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_Reject);
					    		int priData5 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData5 = rsCommon.getInt("val");
									if(priData5 > 0)
				    				{
									%>
										<%=priData5%>
									<%
									totalOf_StabilityChk = totalOf_StabilityChk + priData5;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData5;
									
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    		
					    					<!-- 7  Stability Check Done - Join & Check Result -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_Hold = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 6 and init_result != 1 AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_Hold  \t"+query_Hold);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_Hold);
					    		int priData6 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData6 = rsCommon.getInt("val");
									if(priData6 > 0)
				    				{
									%>
										<%=priData6%>
									<%
									totalOf_Test_Scored = totalOf_Test_Scored + priData6;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData6;
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    					<!-- 8 Test Scored   -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_Hold_1 = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 6 and init_result = 1 AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_Hold  \t"+query_Hold_1);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_Hold_1);
					    		int priData11 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData11 = rsCommon.getInt("val");
									if(priData11 > 0)
				    				{
									%>
										<%=priData11%>
									<%
									totalOf_Candiate_Score = totalOf_Candiate_Score + priData11;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData11;
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    					<!-- 8 Candidate Selected  -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_ops = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 7 AND primary_source = " + sourceDispId +"  AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_ops  \t"+query_ops);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_ops);
					    		int priData7 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData7 = rsCommon.getInt("val");
									if(priData7 > 0)
				    				{
									%>
										<%=priData7%>
									<%
									totalOf_OPS_Round = totalOf_OPS_Round + priData7;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData7;
					    		}
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    					<!-- 9 OPS Round Done -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_Docs = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 8 AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_Docs  \t"+query_Docs);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_Docs);
					    		int priData8 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData8 = rsCommon.getInt("val");
									if(priData8 > 0)
				    				{
									%>
										<%=priData8%>
									<%
									totalOf_Documents_chk = totalOf_Documents_chk + priData8; 
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData8;
					    		}
					    		
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    					<!-- 10 Documents Checked -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					        <%
					  			String query_OfferMade = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 9 AND EmployeeId IS NULL AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_OfferMade  \t"+query_OfferMade);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_OfferMade);
					    		int priData9 = 0;
					    		if(rsCommon.next())
					    		{
					    				
									priData9 = rsCommon.getInt("val");
									if(priData9 > 0)
				    				{
									%>
										<%=priData9%>
									<%
									totalOf_Offer_Made = totalOf_Offer_Made + priData9;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData9;
					    		}
					    		
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    		
					    					<!-- 11 Offer Made -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					    				NA	<!-- 12 Offer Generated -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					    				NA	<!-- 13 Offer Pending -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					    				NA	<!-- 14 Offer Rejected -->
					    		</td>
					    		
					    		<td align="center" valign="middle">
					    				NA	<!-- 15 Offered (not moved to appointment)-->
					    		</td>
					    		
					    		<td>
					        <%
					  			String query_Joinee = "SELECT COUNT(primary_source) AS val FROM bpo_candidatesreg_details WHERE cand_status = 9 AND EmployeeId IS NOT NULL AND primary_source = " + sourceDispId +" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00.000' AND '"+strTo+" 23:59:59.999'";
								//    System.out.println("query_Joinee  \t"+query_Joinee);

						    	//    stmt = con.createStatement();
					    		rsCommon = stmt.executeQuery(query_Joinee);
					    		int priData10 = 0;
					    		if(rsCommon.next())
					    		{
					    			
									priData10 = rsCommon.getInt("val");
									if(priData10 > 0)
				    				{
									%>
										<%=priData10%>
									<%
									totalOf_Joinee = totalOf_Joinee + priData10;
									}
									totalOf_Row_Source = totalOf_Row_Source+ priData10;
					    		}
					    		
					    		//    System.out.println("1 toString Value for the  rsCommon  \t"+rsCommon.toString());
					    		rsCommon.close();
					    	%>	
					    					<!-- 16 Joinee -->
					    		</td>
					    		
					    		<td align="center" valign="middle" style="font-weight: bold; font-size: 12px; background-color: lightgray;">
				    				<%=totalOf_Row_Source%>
			    			<%
					    		rsCommon.close();
					    		stmt.close();
				    		%>	
					    		<!-- 17 Total -->
					    		</td>						    		
					    	</tr>	
					    	<%		
					    		}
					    	%>
					    	<tr style="font-weight: bold; font-size: 12px; background-color: lightgray;">
				    		<td colspan="2" align="center" valign="middle">
				    			TOTAL  <!-- 2 -->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_InitalREG %><!-- 3 Initial Registration -->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_Photo%> <!-- 4 Photo Identification-->
				    		</td>						    		
				    		<td align="center" valign="middle">
				    			<%=totalOf_Test_Initiated%> <!-- 5 Test Initiated -->
				    		</td>						    		
				    		<td align="center" valign="middle">
				    			<%=totalOf_Test_Completed%> <!-- 6  Test Completed-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_StabilityChk%>  <!-- 7 Stability Check Done - Join & Check Result-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_Test_Scored%>    <!-- 8  Test Scored-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_Candiate_Score%>    <!-- 8  Test Scored-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_OPS_Round%>  <!-- 9 OPS Round Done-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_Documents_chk%>  <!-- 10 Documents Checked-->
				    		</td>	
				    		<td align="center" valign="middle">
				    			<%=totalOf_Offer_Made%> <!-- 11 Offer Made -->
				    		</td>
				    		<td align="center" valign="middle">
				    			0 <!-- 12 Offer Generated -->
				    		</td>
				    		<td align="center" valign="middle">
				    			0<!-- 13 Offer Pending -->
				    		</td>			    		
				    		<td align="center" valign="middle">
				    			0<!-- 14 Offer Rejected-->
				    		</td>
				    		<td align="center" valign="middle">
				    			0<!-- 15 Offered (not moved to appointment)-->
				    		</td>
				    		<td align="center" valign="middle">
				    			<%=totalOf_Joinee%> <!-- 16 Joinee -->
				    		</td>
				    		<td align="center" valign="middle" style="font-weight: bold; font-size: 12px; background-color: #424242; color: white;">
<%=totalOf_InitalREG + totalOf_Photo + totalOf_Test_Initiated + totalOf_Test_Completed + totalOf_StabilityChk + totalOf_Test_Scored + totalOf_Candiate_Score + totalOf_OPS_Round +  totalOf_Documents_chk + totalOf_Offer_Made + totalOf_Joinee%>
				    			<!-- 17 Total -->
				    		</td>
			    	</tr>
						    	
						    </table>
			            </td>
		            </tr>
	            </table>
	            <br/>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
   	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%//=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px; font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%//=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
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
