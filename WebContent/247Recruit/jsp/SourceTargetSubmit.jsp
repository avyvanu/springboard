<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
Connection con = null;

Statement st= null;
ResultSet rs= null;
CallableStatement call = null;
try
{
	con= ConnectDatabase.getConnection();
	
	String USER_ID = (String)session.getAttribute("USER_ID");
	String recId = request.getParameter("recId");

	String PS1Id = request.getParameter("PS1Id");
	String SS1Id = request.getParameter("SS1Id");
	String source1 = request.getParameter("source1");
	
	String PS2Id = request.getParameter("PS2Id");
	String SS2Id = request.getParameter("SS2Id");
	String source2 = request.getParameter("source2");

	String PS3Id = request.getParameter("PS3Id");
	String SS3Id = request.getParameter("SS3Id");
	String source3 = request.getParameter("source3");

	String PS4Id = request.getParameter("PS4Id");
	String SS4Id = request.getParameter("SS4Id");
	String source4 = request.getParameter("source4");

	String PS5Id = request.getParameter("PS5Id");
	String SS5Id = request.getParameter("SS5Id");
	String source5 = request.getParameter("source5");
	
	String SCount = request.getParameter("SCount");
	String TargetVal = request.getParameter("target");
	
	System.out.println(USER_ID+"-"+recId+" 1 "+PS1Id+""+SS1Id+" 2 "+PS2Id+""+SS2Id+" 3 "+PS3Id+""+SS3Id+" 4 "+PS4Id+""+SS4Id+" 5 "+PS5Id+""+SS5Id+"");	
	System.out.println("source1\t"+source1+" source2\t"+source2+" source3\t"+source3+" source4\t"+source4+" source5\t"+source5+" SCount\t"+SCount+" TargetVal\t"+TargetVal);
	
	String query = "SELECT recruiterid FROM recruiter_source_target_mapping WHERE DATE(DayTimeStamp) = DATE(NOW()) AND recruiterid = ?";
	PreparedStatement ps= con.prepareStatement(query);
	ps.setString(1,recId);
	rs = ps.executeQuery();
	boolean chkEntry = rs.next();
	System.out.println("chkEntry\t"+chkEntry);
	if(!chkEntry)
	{
		call = con.prepareCall("call Insert_Source_Target_Mapping(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	}
	else
	{
		call = con.prepareCall("call Update_Source_Target_Mapping(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	}

		call.setString(1,USER_ID);
		call.setString(2,recId);	
		if(!PS1Id.equals(""))
		{
			call.setInt(3,Integer.parseInt(PS1Id));
			call.setInt(4,Integer.parseInt(SS1Id));
			call.setString(5,source1);
		}
		else
		{
			call.setNull(3,java.sql.Types.INTEGER);
			call.setNull(4,java.sql.Types.INTEGER);
			call.setNull(5,java.sql.Types.VARCHAR);
		}
	
		if(!PS2Id.equals(""))
		{
			call.setInt(6,Integer.parseInt(PS2Id));
			call.setInt(7,Integer.parseInt(SS2Id));
			call.setString(8,source2);
		}
		else
		{
			call.setNull(6,java.sql.Types.INTEGER);
			call.setNull(7,java.sql.Types.INTEGER);
			call.setNull(8,java.sql.Types.VARCHAR);
		}
		if(!PS3Id.equals(""))
		{
			call.setInt(9,Integer.parseInt(PS3Id));
			call.setInt(10,Integer.parseInt(SS3Id));
			call.setString(11,source3);
		}
		else
		{
			call.setNull(9,java.sql.Types.INTEGER);
			call.setNull(10,java.sql.Types.INTEGER);
			call.setNull(11,java.sql.Types.VARCHAR);
		}
	
		if(!PS4Id.equals(""))
		{
			call.setInt(12,Integer.parseInt(PS4Id));
			call.setInt(13,Integer.parseInt(SS4Id));
			call.setString(14,source4);
		}
		else
		{
			call.setNull(12,java.sql.Types.INTEGER);
			call.setNull(13,java.sql.Types.INTEGER);
			call.setNull(14,java.sql.Types.VARCHAR);
		}
	
		if(!PS5Id.equals(""))
		{
			call.setInt(15,Integer.parseInt(PS5Id));
			call.setInt(16,Integer.parseInt(SS5Id));
			call.setString(17,source5);
		}
		else
		{
			call.setNull(15,java.sql.Types.INTEGER);
			call.setNull(16,java.sql.Types.INTEGER);
			call.setNull(17,java.sql.Types.VARCHAR);
		}
		
		call.setInt(18,Integer.parseInt(SCount));
		call.setInt(19,Integer.parseInt(TargetVal));	
		call.executeQuery();
	

}
catch(Exception e)
{
	System.out.println(e.getMessage());
	e.printStackTrace();
}
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" language="javascript">   		
 		location.href= "<%=recruitPath%>jsp/SourceTargetMapping.jsp";  
    </script>

  </head>
</html>
