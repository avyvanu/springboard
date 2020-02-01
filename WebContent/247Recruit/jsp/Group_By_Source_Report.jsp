<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isELIgnored="false" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="util.ConnectDatabase"%><html>
  <head>
  	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css">
	
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
html,body,form

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
  
   </head>
 <%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
    if(USER_Name==null)
 	{
 	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
	//       System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	
	String User_Center_Id = (String)session.getAttribute("User_Center_Id");
	if(User_Center_Id==null)
  	{
  	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	//       System.out.println("User_Center_Id  +++++++\t"+User_Center_Id);
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	System.err.println("+++++++++\t"+df.format(new Date()));
	
//********************************************************** From And TO Date 


	
	String FromDAte=request.getParameter("ReoprtVOICEfrom");
	String ToDAte=request.getParameter("ReoprtVOICEto");
	if(FromDAte==null || FromDAte.equalsIgnoreCase(""))
	{
		FromDAte=df.format(new Date());
		System.err.println(">>>>++++++++++>>>>\t"+FromDAte);
		ToDAte=FromDAte;
		System.err.println(">>>>++++++++++>>>>\t"+ToDAte);
	}
	String[] forFROMSplit=null;
	String[] forToSplit=null;
	String strFrom=null;
	String strTo=null;
	try
	{
		forFROMSplit=FromDAte.split("-");
		strFrom=forFROMSplit[2]+"-"+forFROMSplit[1]+"-"+forFROMSplit[0];
		//       System.out.println("strFrom \t"+strFrom);	
		request.setAttribute("F",FromDAte);
	}
	catch(Exception e)
	{
		//       System.out.println(e.getMessage());
		e.printStackTrace();
	}
	try
	{
		forToSplit=ToDAte.split("-");
		strTo=forToSplit[2]+"-"+forToSplit[1]+"-"+forToSplit[0];
		//       System.out.println("strTo \t"+strTo);
		request.setAttribute("T",ToDAte);
	}
	catch(Exception e)
	{
		//    //       System.out.println(e.getMessage());
		e.printStackTrace();
	}
	
//************************************************************ End FROM And TO Date 
	String locationBase = (String)request.getParameter("locationBase");
	//       System.out.println("locationBase \t"+locationBase);
	if(locationBase == null)
	{
		locationBase = "0";
	}
	//       System.out.println("locationBase \t"+locationBase);
	
	Connection con = null;
	ResultSet rs, rsGroup = null;
	Statement st = null;
	CallableStatement callproc = null;
	try
	{
		con = ConnectDatabase.getConnection();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

	 int g_Id = 0;
	 String header= "";
	 String getGroup_Master  = "SELECT * FROM group_by_source_master";
	 //       System.out.println("getGroup_Master  \t"+getGroup_Master);
	 st = con.createStatement();
	 rsGroup = st.executeQuery(getGroup_Master);
	 ArrayList arrGID = new ArrayList();
	 ArrayList arrGName = new ArrayList();
	 while(rsGroup.next())
	 {
	 	g_Id = rsGroup.getInt("Group_Id");
	 	header = rsGroup.getString("Group_Name");
	 	arrGName.add(header);
	 	arrGID.add(g_Id);
	 }

 %> 
  <body>
  <form action="" method="post">
  <table border="0" cellpadding="0" cellspacing="0">
  	<tr>
  			<td>From:<input type="text" name="ReoprtVOICEfrom" id="ReoprtVOICEfrom" value="${F}"/></td>
  			<td> To:<input type="text" name="ReoprtVOICEto" id="ReoprtVOICEto" value="${T}"/> </td>
  		
  			<td nowrap="nowrap">
  				<select name="locationBase" id="locationBase">
  					<option value="0" selected="selected">All</option>
				<%  
					con = ConnectDatabase.getConnection();
					Statement smt = con.createStatement();
	              	String qry = "SELECT centre_id,centre_name FROM centre_master WHERE is_alive=1";
					
					ResultSet rst = smt.executeQuery(qry);
					while(rst.next())
					{
				%>
					<option value="<%=rst.getString("centre_id")%>"><%=rst.getString("centre_name")%></option>	
			    <%
					}
					rst.close();
                %>  				
                </select>
  			</td>
  			
  			<td><input type="submit" name="searchCand" class="buttonSmall" value="Go"  /></td>
  	</tr>
 </table>
 	
<%


%> 	
 	
 	<table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
<%
	 double getWalkin = 0.0;
	 double getoffer = 0.0;
	 
	 double get_joinee = 0.0;

	 double calc_sim_Joinee = 0.0;
	 double calc_voice_Joinee = 0.0;
   	 
	 DecimalFormat f = new DecimalFormat("0.00");
	 
	 
	 for(int i = 0; i<arrGID.size(); i++)
	 {

%>
     <tr>
	     <th colspan="9">
	     	<%=arrGName.get(i) %> team Contribution from  <%=FromDAte%> to <%=ToDAte%>
	     </th>
     </tr>
     <tr>
	     <th>
	         Source
	     </th>
	     <th> 
	     	Overall Walkin	     		    
	     </th> 
	     <th> 
	     	Over All Offers 
	     </th>
	     <th> 
	     	Overall Walkin to Offers Conversion %
	     </th>
	     <th> 
	     	Overall Joinees
	     </th>
	     <th> 
	     	Voice Joinees 
	     </th>
	     <th> 
	     	Voice Contribution %
	     </th>
	     <th> 
	     	SIM Joinees
	     </th>          
		 <th> 
		 	SIM Contribution %
	     </th>
    </tr>

<%
		double final_vaoic_Contribute = 0;
		double total_walkin = 0.0;
		double total_offer = 0.0;
		
		double total_voice = 0.0;
		double total_sim = 0.0;
		
		double total_vaoic_Contribute = 0.0;
		double total_sim_contribute = 0.0;
		
		double all_sim_count = 0.0;
		double all_voice_count = 0.0;
		 
		String qry_all_sim_count = "";
		String qry_all_voice_count = "";

		
		String getSourceIDs = "SELECT Source_Id FROM source_from WHERE Group_Id = "+arrGID.get(i)+" ORDER BY order_no";
		//       //       System.out.println("getSource  \t \n"+getSourceIDs);
     	
	 	if(locationBase.equalsIgnoreCase("0"))
		{
	 		qry_all_sim_count = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE  Applying_For = 2 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source in ("+getSourceIDs+")";
	 		qry_all_voice_count = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE  Applying_For = 1 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source in ("+getSourceIDs+")";
		}
		else
		{
			qry_all_sim_count = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND Applying_For = 2 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source in ("+getSourceIDs+")";
			qry_all_voice_count = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND Applying_For = 1 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source in ("+getSourceIDs+")";
		}
		//       System.out.println("qry_all_sim_count \t"+qry_all_sim_count);
		//       System.out.println("qry_all_voice_count \t"+qry_all_voice_count);

		Statement stForAll = con.createStatement();
		ResultSet rsAll_voice = stForAll.executeQuery(qry_all_voice_count);
		if(rsAll_voice.next())
		{
			all_voice_count = rsAll_voice.getInt("totalOffer");
		}
		//       System.out.println("all_voice_count \t"+all_voice_count);
		
		rsAll_voice.close();
		ResultSet rsAll_sim = stForAll.executeQuery(qry_all_sim_count);
		if(rsAll_sim.next())
		{
			all_sim_count = rsAll_sim.getInt("totalOffer");
		}
		//       System.out.println("all_sim_count \t"+all_sim_count);
		
		Statement st_All = con.createStatement();
		String getSource = "SELECT * FROM source_from WHERE Group_Id = "+arrGID.get(i)+" ORDER BY order_no";
		//       System.out.println("getSource  \t \n"+getSource);
		st = con.createStatement();
		rs = st.executeQuery(getSource);
		while(rs.next())
		{
	%>    
	 	<tr>
			<td><!--  Source Display  -->
			      <%=rs.getString("source_name")%>  				
			</td>
			<td align="center"> <!--Overall Walkin -->
			     <%
			     	
			     	String get_Overall_Walkin = "";
			     	if(locationBase.equalsIgnoreCase("0"))
			     	{
			     		get_Overall_Walkin = "SELECT COUNT(AutoID) AS overAllWalkin FROM bpo_candidatesreg_details WHERE  System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			     	}
			     	else
			     	{
			     		get_Overall_Walkin = "SELECT COUNT(AutoID) AS overAllWalkin FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			     	}
	     			
	     			//       System.out.println("get_Overall_Walkin  1 \t"+get_Overall_Walkin);
					
		 			ResultSet rs_Overwalkin = st_All.executeQuery(get_Overall_Walkin);
					if(rs_Overwalkin.next())
					{
						getWalkin = rs_Overwalkin.getDouble("overAllWalkin");
						//       System.out.println("getWalkin inside  \t"+getWalkin);						
					} 
					rs_Overwalkin.close();
					//       System.out.println("getWalkin outside >>  \t"+getWalkin);
					
					total_walkin = total_walkin + getWalkin;
										
			      %>
			      <%=Math.round(getWalkin)%>	 
			    </td>	
				<td align="center"> <!-- Over All Offers -->
			     <%
			     	String get_Overall_offer = "";
			     	if(locationBase.equalsIgnoreCase("0"))
			     	{
			     		get_Overall_offer = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE cand_status > 8 AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			     	}
			     	else
			     	{
			     		get_Overall_offer = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND cand_status > 8 AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			     	}	
	     			//       System.out.println("get_Overall_offer  2 \t"+get_Overall_offer);
					
		 			ResultSet rs_Overoffer = st_All.executeQuery(get_Overall_offer);
					if(rs_Overoffer.next())
					{
						getoffer =  rs_Overoffer.getDouble("totalOffer");
						//       System.out.println("getoffer inside  \t"+getoffer);						
					}
					//       System.out.println("getoffer outside >>  \t"+getoffer);
					total_offer = total_offer + getoffer;
					rs_Overoffer.close();
			      %>
			      <%= Math.round(getoffer)%>	 
			    </td>
			    <td align="center"> <!-- Overall Walkin to Offers Conversion % -->
			     	<%
			     		double  totalvalOW = 0;
			     		if(getoffer != 0 || getWalkin != 0)
			     		{
				     		try
				     		{
				     			totalvalOW = (getoffer / getWalkin)*100;
				     			
				     		}
				     		catch(Exception ex)
				     		{
				     			totalvalOW = 0.0;
				     		}
				     		
			     		}
			     		else
			     		{
			     			totalvalOW = 0.0;
			     		}
			     		
			     	%>
			     	
			     	<%=f.format(totalvalOW)%>&nbsp;%
			     		    
			     </td>  
			     
			     <td align="center"> <!-- Overall Joinees % --> 
			     <%
			     	//**************** Start  Voice Joinnee ********************** //
			     	String get_voice_Joinee = "";
			     	if(locationBase.equalsIgnoreCase("0"))
					{
						get_voice_Joinee = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Applying_For = 1 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
					}
					else
					{
						get_voice_Joinee = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND Applying_For = 1 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
					}
			     	
	     			//       System.out.println("get_voice_Joinee  4\t"+get_voice_Joinee);
					
		 			ResultSet rs_voice_Joinee = st_All.executeQuery(get_voice_Joinee);
					if(rs_voice_Joinee.next())
					{						
						calc_voice_Joinee =  rs_voice_Joinee.getDouble("totalOffer");	
					} 
					
					total_voice = total_voice + calc_voice_Joinee;
					rs_voice_Joinee.close();
					
			     	//**************** End  Voice Joinnee ********************** //
			     	
			     	// ************************ Start Sim Joinee ****************** //
					
			     	String get_sim_Joinee = "";
			     	if(locationBase.equalsIgnoreCase("0"))
					{
						get_sim_Joinee = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE  Applying_For = 2 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
					}
					else
					{
						get_sim_Joinee = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE Location = "+locationBase+" AND Applying_For = 2 AND EmployeeID IS NOT NULL AND System_Date_Time BETWEEN '"+strFrom+" 00:00:00' AND '"+strTo+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
					}
					
	     			//       System.out.println("get_sim_Joinee  5\t"+get_sim_Joinee);
					
		 			ResultSet rs_sim_Joinee = st_All.executeQuery(get_sim_Joinee);
					if(rs_sim_Joinee.next())
					{
						calc_sim_Joinee =  rs_sim_Joinee.getDouble("totalOffer");	
					} 
					total_sim = total_sim + calc_sim_Joinee; 
					rs_sim_Joinee.close();				
					
			     	// ************************ End Sim Joinee *******************//
			     	
		         %>
			      	<%=Math.round(calc_voice_Joinee + calc_sim_Joinee)%>	    
			     </td>
			     
			     <td align="center"> <!-- Voice Joinees % --> 			     
			     
			      <%=Math.round(calc_voice_Joinee)%>				     		    
			     
			     </td>
			     
			     <td align="center">  <!-- Voice Contribution % --> 
			     <%
			     	double vaoic_Contribute = 0.0;
			     	if(calc_voice_Joinee != 0 || total_voice != 0)
			     	{
				     	try
				     	{
				     		vaoic_Contribute = (calc_voice_Joinee/all_voice_count)*100;
				     	}
				     	catch(Exception e)
				     	{
				     		vaoic_Contribute = 0.0;
				     	}
			     	}
			     	else
			     	{
			     		vaoic_Contribute = 0.0;
			     	}
			     	final_vaoic_Contribute = final_vaoic_Contribute + vaoic_Contribute;
			     %>	
		     		<%=f.format(vaoic_Contribute)%>&nbsp;%   
			     </td>
			     
			     <td align="center"> <!-- SIM Joinees -->
			     	<%=Math.round(calc_sim_Joinee)%>		
			     </td>          
				
				 <td align="center"> <!-- SIM Contribution % -->
				 <%
			     	double sim_contribute = 0.0;
			     	
				    if(calc_sim_Joinee != 0 || total_sim != 0)
			     	{
				     	try
				     	{
				     		sim_contribute = (calc_sim_Joinee/all_sim_count)*100;
				     	}
				     	catch(Exception e)
				     	{
				     		sim_contribute = 0.0;
				     	}
			     	}
			     	else
			     	{
			     		sim_contribute = 0.0;
			     	}
			     	
			     	total_sim_contribute = total_sim_contribute + sim_contribute;
			     	
			     %>	
		     		<%=f.format(sim_contribute)%>&nbsp;%  
			     </td>       
	</tr>
	
<%
		}
%>
 
     <tr>
	     <td>
	         Total
	     </td>
	     
	     <td align="center"> 
	     	<b> <%=Math.round(total_walkin)%></b>  
	     </td>
	      
	     <td align="center"> 
	     	<b><%=Math.round(total_offer)%></b>    
	     </td>
	     <td align="center"> 
	     	<b>
	     	<%
	     	double calcW_O = 0;
	     	if(total_offer != 0 || total_walkin != 0)
	     	{
	     		try
	     		{
	     			calcW_O = (total_offer/total_walkin)*100;
	     		}
	     		catch(Exception e)
	     		{
	     			calcW_O = 0;
	     		}
	     	
	     	}
	     	%>
	     	<%=f.format(calcW_O)%>&nbsp;%</b>
	     		    
	     </td>
	     <td align="center"> 
	     	<b>	     	 
	     	 <%=Math.round(total_voice + total_sim)%>
	     	</b>    
	     </td>
	     <td align="center"> 
	     	<b><%=Math.round(total_voice)%></b>	    
	     </td>
	     <td align="center"> 
	     	<b><%=f.format(final_vaoic_Contribute)%>&nbsp;%</b> 
	     </td>
	     <td align="center"> 
	     	<b><%=Math.round(total_sim)%></b>	    
	     </td>          
		
		 <td align="center"> 
		 	<b><%=f.format(total_sim_contribute)%>&nbsp;%</b>
	     </td>
    </tr>
 
    <tr>
	     <td colspan="9" style="height: 10px; border-left: hidden; border-right: hidden; border-bottom: hidden;">
	     </td>
    </tr>
<%		
	}
%>	

 </table>	
  </form>
  </body>
</html>
