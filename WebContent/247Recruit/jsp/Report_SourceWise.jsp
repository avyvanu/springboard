<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>


<%
  	
 
String reportFilter=(String) request.getParameter("monthFilter");
//String User_Center_Id = (String)session.getAttribute("User_Center_Id");
String User_Center_Id = request.getParameter("LocId");
//if(User_Center_Id==null)
//	  	{
//	  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
//	  	}
System.out.println("User_Center_Id  >>>>>>>>\t"+User_Center_Id);
Connection connection=ConnectDatabase.getConnection();
ResultSet rs;


// String strProcedure="{call rptSourceWise('" + reportFilter + "')}"; //your procedure name
CallableStatement cs=connection.prepareCall("call rptSourceWise(?,?)");
cs.setString(1,reportFilter);
cs.setString(2,User_Center_Id);
rs=cs.executeQuery();

DecimalFormat f = new DecimalFormat("00.00"); 


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>247Recruitment - Source wise Report</title>
    
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
		.tblGRID { 
    width: 100%; 
    background-color: #fff; 
    margin: 5px 0 10px 0; 
    border: solid 1px #525252; 
    border-collapse:collapse; 
}
.tblGRID td { 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #717171; 
}
.tblGRID th { 
    padding: 4px 2px; 
    color: #fff; 
    background: #424242 url(../images/grd_head.png) repeat-x top; 
    border-left: solid 1px #525252; 
    font-size: 0.9em; 
}

	</style>
	

  </head>
  
  <body>
  	<table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
        <tr>
            <th rowspan="3">
                Date
            </th>
            <th colspan="42">
                Channel Wise Contribution
            </th>
            <th rowspan="3">
                Total Walk In
            </th>
            <th rowspan="3"> 
                Total Offer 
            </th>          
        </tr>
        <tr>
            
            <th colspan="2">
                [24]7 Tele Calling Team
            </th>
            <th colspan="2">
                [24]7 Website
            </th>
            <th colspan="2">
                Employee Referral
            </th>
            <th colspan="2">
                Job Portal
            </th>
            <th colspan="2">
                Consultant
            </th>
            <th colspan="2">
                Advertisement
            </th>
            <th colspan="2">
                Friends & Relatives
            </th>
			<th colspan="2">
                Job Fairs
            </th>
            <th colspan="2">
                Email
            </th>
            <th colspan="2">
                Internal Job Posting
            </th>
            <th colspan="2">
                SMS
            </th>
            <th colspan="2">
                Re-hire
            </th>
            <th colspan="2">
                Candidate Referral
            </th>
            <th colspan="2">
                Campus
            </th>
			<th colspan="2">
                Training Institute
            </th>
            <th colspan="2">
                Referral by Ex Employee
            </th>
            <th colspan="2">
                Others
            </th>
            
            
            
            <th colspan="2">
                Outstation
            </th>
            
            <th colspan="2">
                Train & Hire
             </th>
             
            <th colspan="2">
                Facebook
             </th>
             
            <th colspan="2">
               Direct WalkIn
            </th>
                     
        </tr>
        <tr>           
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
<th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
<th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            
            
            
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            
            <th>
                Walk In
            </th>
            <th>
                Offers
            </th>
            
                      
        </tr>
        <%
   		
   		while(rs.next())
   		{
   			String firstCol=(String)rs.getString("dMonthYear");
   			
   			if(firstCol.equalsIgnoreCase("Total"))
   			{
   				%>
		        <tr>
		            <td align="center" style="font-weight: bold;">
		            	<%=firstCol%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wTeleCallTeam")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oTeleCallTeam")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wWebsite")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oWebsite")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wEmployeeReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oEmployeeReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wJobportal")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oJobportal")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wConsultant")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oConsultant")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wAdvertisement")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oAdvertisement")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wFriends")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oFriends")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wJobfairs")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oJobfairs")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wEmail")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oEmail")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wInternal")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oInternal")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wSMSVendor")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oSMSVendor")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wRehire")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oRehire")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wCandReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oCandReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wCampus")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oCampus")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wTrainingInst")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oTrainingInst")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wExReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oExReferral")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("wOthers")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("oOthers")%>
		            </td>
		            
		           
		           
		           
		           
		           
					<td align="center">
						<%=rs.getString("wOutstation_Vendor")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oOutstation_Vendor")%>
					</td>
					
					<td align="center">
						<%=rs.getString("wTrain_Hire")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oTrain_Hire")%>
					</td>

					<td align="center">
						<%=rs.getString("wFacebook")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oFacebook")%>
					</td>

					<td align="center">
						<%=rs.getString("wWalk_In")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oWalk_In")%>
					</td>
		           
		           
		           
		           
		           
		           
		           
		           
		           
		           
		           
		           
		            <td align="center">
		            	<%=rs.getString("TotalWalkin")%>
		            </td>
		            
		            <td align="center">
		            	<%=rs.getString("TotalOffer")%>
		            </td>
		                  
		        </tr>
		        <tr>
		            <td align="center" style="font-weight: bold;">
		            	Stage Wise Conversion
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oTeleCallTeam")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wTeleCallTeam")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oTeleCallTeam")/rs.getDouble("wTeleCallTeam"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
					<td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oWebsite")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wWebsite")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oWebsite")/rs.getDouble("wWebsite"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oEmployeeReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wEmployeeReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oEmployeeReferral")/rs.getDouble("wEmployeeReferral"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oJobportal")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wJobportal")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oJobportal")/rs.getDouble("wJobportal"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oConsultant")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wConsultant")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oConsultant")/rs.getDouble("wConsultant"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oAdvertisement")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wAdvertisement")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oAdvertisement")/rs.getDouble("wAdvertisement"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oFriends")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wFriends")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oFriends")/rs.getDouble("wFriends"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oJobfairs")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wJobfairs")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oJobfairs")/rs.getDouble("wJobfairs"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oEmail")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wEmail")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oEmail")/rs.getDouble("wEmail"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oInternal")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wInternal")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oInternal")/rs.getDouble("wInternal"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oSMSVendor")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wSMSVendor")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oSMSVendor")/rs.getDouble("wSMSVendor"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oRehire")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wRehire")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oRehire")/rs.getDouble("wRehire"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oCandReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wCandReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oCandReferral")/rs.getDouble("wCandReferral"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oCampus")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wCampus")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oCampus")/rs.getDouble("wCampus"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oTrainingInst")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wTrainingInst")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oTrainingInst")/rs.getDouble("wTrainingInst"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oExReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wExReferral")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oExReferral")/rs.getDouble("wExReferral"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>	            
		           
		            
		           
		            
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oOthers")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wOthers")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oOthers")/rs.getDouble("wOthers"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            



		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oOutstation_Vendor")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wOutstation_Vendor")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oOutstation_Vendor")/rs.getDouble("wOutstation_Vendor"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>


		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oTrain_Hire")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wTrain_Hire")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oTrain_Hire")/rs.getDouble("wTrain_Hire"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>


		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oFacebook")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wFacebook")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oFacebook")/rs.getDouble("wFacebook"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>



		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getDouble("oWalk_In")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getDouble("wWalk_In")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=f.format(rs.getDouble("oWalk_In")/rs.getDouble("wWalk_In"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>

		            
		            <td align="center" colspan="2">
		            	<%
		            		if(rs.getInt("TotalOffer")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else if(rs.getInt("TotalWalkin")==0)
		            		{
		            			%>
		            				0%
		            			<%
		            		}
		            		else
		            		{
		            			%>
		            				<%=Math.round(rs.getInt("TotalOffer")/rs.getInt("TotalWalkin"))%>%
		            			<%
		            			
		            		}
		            		
		            	 %>
		            	
		            </td>
		            
		                  
		        </tr>
		        <%
   			}
   			else
   			{
   			
		   			Date dateStr2 = rs.getDate("dMonthYear");
		 			SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
		   			String reportDate = formatter.format(dateStr2);
		   		%>
		        <tr>
		            <td align="center" style="font-weight: bold;">
		            	<%=reportDate%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wTeleCallTeam")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oTeleCallTeam")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wWebsite")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oWebsite")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wEmployeeReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oEmployeeReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wJobportal")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oJobportal")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wConsultant")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oConsultant")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wAdvertisement")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oAdvertisement")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wFriends")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oFriends")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wJobfairs")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oJobfairs")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wEmail")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oEmail")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wInternal")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oInternal")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wSMSVendor")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oSMSVendor")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wRehire")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oRehire")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wCandReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oCandReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wCampus")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oCampus")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wTrainingInst")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oTrainingInst")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wExReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oExReferral")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("wOthers")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("oOthers")%>
		            </td>
		            
					<td align="center">
						<%=rs.getString("wOutstation_Vendor")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oOutstation_Vendor")%>
					</td>
					
					<td align="center">
						<%=rs.getString("wTrain_Hire")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oTrain_Hire")%>
					</td>

					<td align="center">
						<%=rs.getString("wFacebook")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oFacebook")%>
					</td>

					<td align="center">
						<%=rs.getString("wWalk_In")%>
					</td>
					
					<td align="center">
						<%=rs.getString("oWalk_In")%>
					</td>
		            
		            
		            
		            <td align="center">
		            	<%=rs.getString("TotalWalkin")%>
		            </td>
		            <td align="center">
		            	<%=rs.getString("TotalOffer")%>
		            </td>
		                  
		        </tr>
		        <%
		     }
        }
        rs.close();
         %>
   </table>
  	
  </body>
</html>
                                                                                                                                                                                   