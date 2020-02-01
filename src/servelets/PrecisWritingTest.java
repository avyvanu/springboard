package servelets;


import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ConnectDatabase;
import util.Dbconfiguration;

public class PrecisWritingTest extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{

		int candidateautoid = Integer.parseInt(req.getParameter("candidateautoid"));
		String candidategeneratedid = req.getParameter("candidategeneratedid");
		
		int precistypeid = Integer.parseInt(req.getParameter("typeid"));
		String precistypedtext=(req.getParameter("w")).trim();
		precistypedtext = precistypedtext.replaceAll("\\s+", " ");
		System.out.println("precistypedtext::::"+precistypedtext);
        int Isactive=1;
		Connection con=null;
      try
		{
			 //establish the connection	
		con = ConnectDatabase.getConnection();  
	    PreparedStatement Pst = con.prepareStatement("update  precis_test_attempt_master set  Cand_generated_Id='"+candidategeneratedid+"', Precis_passage_id='"+precistypeid+"', Precis_Typed_Area_Text='"+precistypedtext+"', End_Date=sysdate() ,Is_Active='"+Isactive+"' where user_id='"+candidateautoid+"'");
        System.out.println(Pst);
        Pst.execute();
        System.out.println("Updated  precis_test_attempt_master table::sucessfully");
    	RequestDispatcher rd=req.getRequestDispatcher("247Recruit/jsp/precis_success_test.jsp");
		rd.forward(req,resp);
		Pst.close();
		con.close();
		}
		
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	
		
	}	
	}