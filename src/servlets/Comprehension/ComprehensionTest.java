package servlets.Comprehension;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.CompTestDTO;
import bl.UserManager;

import util.ConnectDatabase;
import util.RandomNumber;

public class ComprehensionTest extends HttpServlet
{
	ServletContext sctx=null;
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		System.out.println("This is Comprehension");
		HttpSession session = req.getSession();
		UserManager userManager = new UserManager();
		int ranNum = RandomNumber.doRawRandomNumber();
		String compID = req.getParameter("sesVal");
		Long USER_AUTOID = (Long)session.getAttribute("USER_AUTOID");
		ArrayList compList = new ArrayList();
		CompTestDTO comDt = null;
		Connection con = null;
		int readCompID=-1;
		String dateIS=null;
		String methodName = req.getParameter("methodName");
		int qid = 0;
		if(methodName!=null)
		{
			if(methodName.trim().equalsIgnoreCase("End Exam"))
			{
				System.out.println("End Exam");
				String upQry="UPDATE bpo_user_reading_comp_test_attempt set END_DATE_ACTIVE=sysdate() where USER_ID="+USER_AUTOID;
				System.out.println("Qry :"+upQry);
				try
				{
					  dateIS=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(new java.util.Date());
					  con = ConnectDatabase.getConnection();
					  PreparedStatement enPst = con.prepareStatement(upQry);
					  int l = enPst.executeUpdate();
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				  RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/TypingTest.jsp");
				  rd.forward(req,resp);
			}
			if(methodName.trim().equalsIgnoreCase("finish"))
			{
				System.out.println("Finish logic");
				String upQry="UPDATE bpo_user_reading_comp_test_attempt set END_DATE_ACTIVE=sysdate() where USER_ID="+USER_AUTOID;
				System.out.println("Qry :"+upQry);
				try
				{
					  dateIS=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(new java.util.Date());
					  con = ConnectDatabase.getConnection();
					  PreparedStatement enPst = con.prepareStatement(upQry);
					  int l = enPst.executeUpdate();
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				  RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/TypingTest.jsp");
				  rd.forward(req,resp);
			}
		}
		
		else
		{
			System.out.println("Step 1");
			long attempID=-1;
			dateIS=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(new java.util.Date());
			System.out.println("Step 2"+dateIS);
			try
    		{
    			//establish the connecion
				
    			con = ConnectDatabase.getConnection();
    			/**
    			 * insert values into Attempt table
    			 */
    			try
    			{
    				String drRegQry = "select READING_TEST_ATTEMPT_ID from bpo_user_reading_comp_test_attempt order by READING_TEST_ATTEMPT_ID DESC";
    				System.out.println("Step 3 Query "+drRegQry);
    				Statement drStmt = con.createStatement();
    				ResultSet drRs = drStmt.executeQuery(drRegQry);
    				if(drRs.next())
    				{
    					System.out.println("Step 4 READING_TEST_ATTEMPT_ID"+drRs.getInt("READING_TEST_ATTEMPT_ID"));
    					attempID = drRs.getInt("READING_TEST_ATTEMPT_ID");
    					attempID++;
    				}
    				else
    				{
    					attempID=1;
    				}
    			}
    			catch (Exception e) 
    			{
    				e.printStackTrace();
    			}
    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_reading_comp_test_attempt VALUES(?,?,sysdate(),?)");
    			oPst.setLong(1,attempID);
    			oPst.setLong(2,USER_AUTOID);
    			oPst.setString(3,null);
    			int k = oPst.executeUpdate();
    			System.out.println(k);
    			if(k!=0)
    			{
    				System.out.println("inserted");
    			}
    		}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			/**
			 *  fetch data according to id
			 */
		
			
			/**
			 * insert values into Attempt table
			 */
			try
			{
				con = ConnectDatabase.getConnection();
				String adrRegQry = "select a.READING_COMP_MASTER_ID,a.PASSAGE,b.PASSAGE_QUESTION,b.READING_COMP_QUESTION_MASTER_ID from bpo_reading_comp_master a,bpo_reading_comp_question_master b  where a.READING_COMP_MASTER_ID=b.READING_COMP_MASTER_ID and a.READING_COMP_MASTER_ID="+ranNum;
				System.out.println("Step 8 Query "+adrRegQry);
				Statement adrStmt = con.createStatement();
				ResultSet adrRs = adrStmt.executeQuery(adrRegQry);
				if(adrRs.next())
				{
					System.out.println("Step 4 Question Master ID:"+adrRs.getInt(4));
					qid=adrRs.getInt(4);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			
			/**
			 * Fetch records according to comp id
			 */
			compList = userManager.compList(ranNum,qid);
			if(!compList.isEmpty())
			{
				System.out.println("Step 5");
				System.out.println("Step 6 Array Size:"+compList.size());
				RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/ComprehensionTest.jsp");
				System.out.println("Forwarding to Compr test Page");
				req.setAttribute("ArrListData",compList);
				session.setAttribute("PassObjData",compList);
				session.setAttribute("comp_id_no",ranNum);
				rd.forward(req,resp);
			}
		}
	}
}
