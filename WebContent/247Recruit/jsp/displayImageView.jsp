<%@ page import="java.io.OutputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="util.ConnectDatabase" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
    OutputStream o = null;
    try
    { 
 		String CandidateID= request.getParameter("CID");
 		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>iDATA DIAPLAY IMAGE VIEW>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+CandidateID);
    	Connection con= null;
		CallableStatement cs = null;
		ResultSet rs = null;
		byte[] imgdata=null;
		
		try
		{			
			//String EDKey="[24]7";
			//String EDKPass="247Cust0m3r";
			con = ConnectDatabase.getConnection();
			String strProcedure="{call CandImageDisp_Encrypt_Proc(?,?,?)}"; //your procedure name
			System.out.println("strProcedure:::::::;CandImageDisp_Encrypt_Proc::::"+strProcedure);
			cs = con.prepareCall(strProcedure);
			cs.setString(1,CandidateID);
			cs.setString(2,EDKey);
			cs.setString(3,EDKPass);
			rs=cs.executeQuery();
			if(rs.next())
			{
			   	Blob blb=rs.getBlob("imagePath");
			   	imgdata=  blb.getBytes(1,(int)blb.length());	
			}
		}
		catch(SQLException ex)
		{
		   	System.out.println("SQLExcexception............");
		   	ex.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			rs.close();
			cs.close();
		    con.close();
		}
		
       	byte[] imgDisplayData = imgdata;
       	response.setContentType("image/png");
       	o = response.getOutputStream();
       	o.write(imgDisplayData);
    }
    catch (Exception e)
    {
    	System.out.println(" Exception " +e);
    	e.printStackTrace();
    }
    finally
    {
    	if (o != null)
    	{
	       	o.flush();
	       	o.close();
    	}
       	out.clear();
       	out = pageContext.pushBody(); 
    }
%>