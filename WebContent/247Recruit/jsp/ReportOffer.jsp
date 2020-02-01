<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isELIgnored="false" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.ParseException"%>
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
	System.out.println("User_Center_Id  +++++++\t"+User_Center_Id);
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	System.err.println("+++++++++\t"+df.format(new Date()));
	
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
		System.out.println("strFrom \t"+strFrom);	
		request.setAttribute("F",FromDAte);
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	try
	{
		forToSplit=ToDAte.split("-");
		strTo=forToSplit[2]+"-"+forToSplit[1]+"-"+forToSplit[0];
		System.out.println("strTo \t"+strTo);
		request.setAttribute("T",ToDAte);
	}
	catch(Exception e)
	{
		//    System.out.println(e.getMessage());
		e.printStackTrace();
	}
	String incDate ="";	
	String locationBase = (String)request.getParameter("locationBase");
	System.out.println("locationBase \t"+locationBase);
	if(locationBase == null)
	{
		locationBase = "0";
	}
	System.out.println("locationBase \t"+locationBase);
	Connection con = null;
	ResultSet rs, rs1 = null;
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
  					<option value="1">Bangalore</option>
  					<option value="2">Hyderabad</option>
  				</select>
  			</td>
  			
  			<td><input type="submit" name="searchCand" class="buttonSmall" value="Go"  /></td>
  	</tr>
 </table>
 	<table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">

        


        
     <tr>
     <th>
         Date
     </th>
     
<%


	int getDaysVal =0;
	String getDays  = "SELECT DATEDIFF('"+strTo+" 00:00:00' , '"+strFrom+" 23:59:59') AS RetDate";
	System.out.println("getSource  \t"+getDays);
	Statement stgetDay = con.createStatement();
	ResultSet rsgetDays = stgetDay.executeQuery(getDays);
	while(rsgetDays.next())
	{
			getDaysVal = rsgetDays.getInt("RetDate");
			System.out.println("getDaysVal  \t"+getDaysVal);

	}

	 String getSource  = "SELECT * FROM source_from ORDER BY order_no";
	 System.out.println("getSource  \t"+getSource);
	 st = con.createStatement();
	 rs = st.executeQuery(getSource);
	 ArrayList SumArr = new ArrayList();
	 
	 while(rs.next())
	 {
		 //rs.getString("source_id")
		 SumArr.add(0);
%>
       <th>
          <%=rs.getString("source_name")%>
       </th>            
<%
	}
	 SumArr.add(0);
%>    
	<th> 
      Total Offer 
     </th>                  
    </tr>
    
 <%
 
// start  yyyy - mm - dd format code.	
	String dateinner = strFrom;
	System.out.println("Starting  date from :" + dateinner);
	SimpleDateFormat sdfinner = new SimpleDateFormat("yyyy-MM-dd");
	Calendar calinner = Calendar.getInstance();
	try 
	{
		calinner.setTime(sdfinner.parse(dateinner));
		
	} 
	catch (ParseException e) 
	{
		e.printStackTrace();
	}
// end  yyyy - mm - dd format code.	

// dd - mm - yyyyy format code 
	String date = FromDAte;
	System.out.println("Starting Date:" + date);
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	Calendar cal = Calendar.getInstance();
	try 
	{
		cal.setTime(sdf.parse(date));
	} 
	catch (ParseException e) 
	{
		e.printStackTrace();
	}
	
 	int a =0;
	for(int i = 0; i <= getDaysVal; i++)
	{
		// yyyy - dd - mm format
			if( i == 0)
			{
				calinner.add(Calendar.DATE, 0);
			}
			else
			{
				calinner.add(Calendar.DATE, 1);
			}
			System.out.println("calinner.getTime()::::" + calinner.getTime());
			incDate = sdfinner.format(calinner.getTime());
			System.out.println("inner query Date: " + incDate);	
		
		// dd - mm - yyyyy format		
			if( i == 0)
			{
				cal.add(Calendar.DATE, 0);
			}
			else
			{
				cal.add(Calendar.DATE, 1);
			}
			System.out.println("cal.getTime()::::" + cal.getTime());
			SimpleDateFormat sdfDISP = new SimpleDateFormat("dd-MMM-yyyy");
			String incDateDISP = sdfDISP.format(cal.getTime());
			System.out.println("Incremented Date::::" + incDate);		
		
	%>
	<tr>
		<td nowrap="nowrap">
           <%=incDateDISP %>  <!--  Date From -->
     	</td>
     	
	<%		
		rs.beforeFirst();
		int iCounter = 0;
		int totalOffer = 0;
		String getSrcDayCt = "";
		while(rs.next())
		{
			if(locationBase.equalsIgnoreCase("0"))
			{
				getSrcDayCt = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE cand_status > 8 AND offered_on BETWEEN '"+incDate+" 00:00:00' AND '"+incDate+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			}
			else
			{
				getSrcDayCt = "SELECT COUNT(Primary_Source) as totalOffer FROM bpo_candidatesreg_details WHERE cand_status > 8 AND Location = "+locationBase+" AND offered_on BETWEEN '"+incDate+" 00:00:00' AND '"+incDate+" 23:59:59' AND Primary_Source = "+rs.getString("source_id");
			}
			System.out.println(" >> "+getSrcDayCt);
			Statement stinside = con.createStatement();
			ResultSet rsinside = stinside.executeQuery(getSrcDayCt);
			if(rsinside.next())
			{
				totalOffer = totalOffer + (rsinside.getInt("totalOffer"));
				int iTempC = (Integer)SumArr.get(iCounter) + rsinside.getInt("totalOffer");
				SumArr.set(iCounter, iTempC);
	%>
	       <td align="center">
					<%=rsinside.getString("totalOffer")%>
		   </td>   
	<%    	}     
			System.out.println("final >>>>>> "+totalOffer);
			iCounter = iCounter + 1;
	 	}
		int iTempR = (Integer)SumArr.get(iCounter) + totalOffer;
		SumArr.set(iCounter, iTempR);
	%>
    
 		<td align="center">
        <%=totalOffer%>  <!--  Total Offer -->
     	</td>
     
	</tr>
		
<%
	a = a+1;
	System.out.println("a \t"+a);
	}
 %>  
	<tr>
		<td nowrap="nowrap">Total</td>
	<%		
		
		Iterator ir = SumArr.iterator();
		while(ir.hasNext())
		{
	%>
	       <td align="center">
				<%=ir.next()%>
		   </td>   
	<%
		}
	%>
    
 		
	</tr>
 </table>		
  </form>
  </body>
</html>
