<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>

<%
	String chkURI=request.getHeader("Referer");
	System.out.println("Display URI\t"+chkURI);
	if(chkURI==null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
	else
	{
		chkURI = chkURI.toLowerCase();
		System.out.println("Check\t"+chkURI.indexOf(request.getContextPath().toLowerCase()));
		if(chkURI.indexOf(request.getContextPath().toLowerCase()) < 1)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
		
		String data = null;
		String countryId=request.getParameter("countryId");
		System.out.println(":::::::::::::     "+countryId);
		
       Connection con = ConnectDatabase.getConnection();
       //String qry = "SELECT LOOKUP_CODE,DESCRIPTION FROM bpo_state_lookups where LOOKUP_TYPE='"+countryId+"'";       
       String qry = "SELECT * FROM mstcity WHERE StateId='"+countryId+"'";     
       System.out.println("Query     :  "+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
			   data = "";
               while(rs.next())
               {
                       data+=rs.getInt("cityId")+":"+rs.getString("cityName")+",";
               }
               rs.close();
               st.close();
               rs=null;
               st=null;
       }       
       catch(Exception ex)
       {
            ex.printStackTrace();
       }
       finally
       {
             con.close();
             con=null;      
       }
       System.out.println("Set values are ----->"+data);
       out.println(data);	
%>