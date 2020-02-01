<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
  <head>
    	<title> [24]7 SPRINGBOARD </title>
  </head>
  
  <body>
<%
		String deleteTestId = request.getParameter("deleteTestId");
		System.out.println("== >>>>>>>"+deleteTestId);
		String deleteTestIdStatus = request.getParameter("deleteTestIdStatus");
		System.out.println("== >>>>>>>"+deleteTestIdStatus);
		String reason = request.getParameter("reason");
		System.out.println("==  >>>>> "+reason);
		Connection con = null;
		Statement st = null;
		CallableStatement call = null;
		int getIsActiveCount = 0;
		boolean task = false;
		try
		{
			String USER_ID = (String)session.getAttribute("USER_ID");
			if(deleteTestIdStatus.equalsIgnoreCase("1"))
			{
				getIsActiveCount = (Integer)session.getAttribute("ActiveTestCount");
				if(getIsActiveCount > 1)
				{
					task = true;
				}
				else
				{
					session.setAttribute("ZERO", "4");
				}
			}
			else
			{
				task = true;			
			}
			
			if(task)
			{
				con = ConnectDatabase.getConnection();
				call = con.prepareCall("call language_test_master_history_Proc(?,?,?)");
				call.setInt(1,Integer.parseInt(deleteTestId));
				call.setString(2,reason);
				call.setString(3,USER_ID);
				int delTest = call.executeUpdate();
				
				if(delTest > 0)
				{
					System.out.println("Deleted language Record successfully ");
					session.setAttribute("ZERO", "3");
				}
			}
			request.getRequestDispatcher("/247Recruit/jsp/EditLanguageStatus.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			ConnectionDAO.closeConnection(con, st, null);
		}
 %>


  </body>
</html>
