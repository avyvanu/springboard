package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.PreparedStatement;

import util.ConnectDatabase;
import util.ConnectionDAO;

public class AddEngGrammarTest extends HttpServlet 
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("--- Inside the AddEngGrammarTest Test ---");
		HttpSession session = request.getSession();
		Connection connection = null;
		PreparedStatement addCompMasterInsert = null;
		PreparedStatement addCompQnsInsert = null;
		PreparedStatement addCompOptionsInsert = null;

		try
		{
			int CompID = 0;
			connection=ConnectDatabase.getConnection();
			int totalQuestions = Integer.parseInt(request.getParameter("total_questions"));
			String USER_ID = (String)session.getAttribute("USER_ID");
			String TestName = request.getParameter("TestName");
			String TestHeader = request.getParameter("TestHeader");
			String ParagraphText = request.getParameter("ParagraphText");
			
			addCompMasterInsert = connection.prepareStatement("insert into bpo_eng_comp_master(Test_Name,Test_Header,PASSAGE,Is_Alive,Updated_By,Updated_On) values(?,?,?,?,?,now())");
			addCompMasterInsert.setString(1,TestName);
			addCompMasterInsert.setString(2,TestHeader);
			addCompMasterInsert.setString(3,ParagraphText);
			addCompMasterInsert.setInt(4,1);
			addCompMasterInsert.setString(5,USER_ID);
			addCompMasterInsert.executeUpdate();
			addCompMasterInsert.close();
			System.out.println("Inserted Successfully into bpo_eng_comp_master::::");
			
			String qryForengGrammarId  = "SELECT MAX(reading_comp_master_id) as compId FROM bpo_eng_comp_master";
			System.out.println("qryForengGrammarId:::"+qryForengGrammarId);
	        Statement stmtengGrmmrId = connection.createStatement();
	        ResultSet rsCompId = stmtengGrmmrId.executeQuery(qryForengGrammarId);
	        if(rsCompId.next())
	        {
	        	CompID = rsCompId.getInt("compId");
	        	System.out.println("CompID:::::"+CompID);
	        }
	        rsCompId.close();
	        stmtengGrmmrId.close();
			for(int i = 1; i < totalQuestions ; i++)
			{
				System.out.println("i::::::"+i);
				String Question = request.getParameter("part"+i+"Q"+i);
				System.out.println("Question::::::"+Question);
				int totalQnsOptions = Integer.parseInt(request.getParameter("part"+i+"_TotalQns"));
				System.out.println("totalQnsOptions::::::"+totalQnsOptions);
				addCompQnsInsert = connection.prepareStatement("insert into bpo_eng_comp_question_master(READING_COMP_QUESTION_MASTER_ID,READING_COMP_MASTER_ID,PASSAGE_QUESTION) values(?,?,?)");
				addCompQnsInsert.setInt(1,i);
				addCompQnsInsert.setInt(2,CompID);
				addCompQnsInsert.setString(3,Question);
				addCompQnsInsert.executeUpdate();
				addCompQnsInsert.close();
				System.out.println("Inserted Successfully into bpo_eng_comp_question_master::::");
				
				for(int j = 1; j <= totalQnsOptions ; j++)
				{
					String qnsOption = request.getParameter("part"+i+"Option"+j);
					System.out.println("qnsOption::::::"+qnsOption);
					String qnsOptionAns =  request.getParameter("part"+i+"AnsSeltd"+j);
					System.out.println("qnsOptionAns::::::"+qnsOptionAns);
					addCompOptionsInsert = connection.prepareStatement("insert into bpo_eng_comp_question_answer_master(READING_COMP_QUESTION_ANSWER_MASTER_ID,READING_COMP_MASTER_ID,READING_COMP_QUESTION_MASTER_ID,PASSAGE_QUESTION_ANSWER,correct_answer) values(?,?,?,?,?)");
					addCompOptionsInsert.setInt(1,j);
					addCompOptionsInsert.setInt(2,CompID);
					addCompOptionsInsert.setInt(3,i);
					addCompOptionsInsert.setString(4,qnsOption);
					addCompOptionsInsert.setString(5,qnsOptionAns);
					addCompOptionsInsert.executeUpdate();
					addCompOptionsInsert.close();
					System.out.println("Inserted Successfully into bpo_eng_comp_question_answer_master::::");
				}
			}
		}
		catch(Exception e)
		{
			e.getMessage();
			e.getCause();
			e.printStackTrace();			
		}
		finally
		{
			ConnectionDAO.closeConnection(connection, null, null);
		}
		System.out.println(" Admin Added successfully questions in eng Grammar test ");
		session.setAttribute("ZERO", "5");
		request.getRequestDispatcher("/247Recruit/jsp/EditEngGrammarStatus.jsp").forward(request, response);
		System.out.println(" After Forwarding the request eng Grammar test");
	}
}
