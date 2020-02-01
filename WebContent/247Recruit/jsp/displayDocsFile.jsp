<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
	OutputStream o = null;       
	try
	{
		Connection con = null;
		CallableStatement  cs = null;
		ResultSet rs = null;

//		  String EDKey="[24]7";
//		  String EDKPass="247Cust0m3r";		
		 String candidateID = request.getParameter("CIDrec");
		 String DocumentID = request.getParameter("DocumentID");
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>   candidateID   >>>>> "+candidateID);
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>   DocumentID    >>>>> "+DocumentID);

		 byte[] filedata=null;
		 String Docs_FileName = null;
		 String 	Docs_FileNameLOWER = null;
		 try
		 {	
			con = ConnectDatabase.getConnection();
			cs = con.prepareCall("call Cand_Resume_Disp_Proc(?,?,?,?)");
			cs.setString(1,candidateID);
			cs.setString(2,DocumentID);
			cs.setString(3,EDKey);
			cs.setString(4,EDKPass);
			rs=cs.executeQuery();
			if (rs .next()) 
			{			   
			   Blob blb=rs.getBlob("Documet_DataFile");
			   filedata=  blb.getBytes(1,(int)blb.length());	
			   Docs_FileName = rs.getString("Docs_FileName");
			   System.out.println("Docs_FileName   >>>>>>>>>>>>>>   "+Docs_FileName);
			   Docs_FileNameLOWER = Docs_FileName.toLowerCase();
			   System.out.println("after lower case file name  >>>>>>>>>>>>>>   "+Docs_FileNameLOWER);
			   System.out.println(blb);
			}	
		}
		catch(Exception e)
		{
			System.out.println("Exception :"+e);
			e.printStackTrace();
		}
		finally
		{
			rs.close();
			cs.close();
		    con.close();
		}
			
		if(Docs_FileNameLOWER.endsWith(".txt"))
		{
			System.out.println("Docs_FileName txt  >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
	       	response.setContentType("text/plain");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".pdf"))
		{			
			System.out.println("Docs_FileName  pdf >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
	       	response.setContentType("application/pdf");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".doc"))
		{		
			System.out.println("Docs_FileName  doc >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
			response.setHeader("Content-type","application/.doc");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".docx"))
		{			
			System.out.println("Docs_FileName   docx >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
			response.setHeader("Content-type","application/.docx");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".xls"))
		{			
			System.out.println("Docs_FileName   xls >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
			response.setHeader("Content-type","application/.xls");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		
		else if (Docs_FileNameLOWER.endsWith(".xlsx"))
		{			
			System.out.println("Docs_FileName  xlsx >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
			response.setHeader("Content-type","application/.xlsx");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".jpg"))
		{			
			System.out.println("Docs_FileName  jpg >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
	       	response.setContentType("image/jpg");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}
		else if (Docs_FileNameLOWER.endsWith(".jpeg"))
		{			
			System.out.println("Docs_FileName  jpeg >>>>>>>>>>>>>>   "+Docs_FileName);
			response.reset();
	       	response.setContentType("image/jpeg");
			response.setHeader("Content-disposition","inline; filename="+Docs_FileName);	
		}

		byte[] fileDisplayData = filedata;  
       	o = response.getOutputStream();
       	o.write(fileDisplayData);
	}
	catch(Exception e)
	{
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