package servlets.Comprehension;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;
import util.ConnectionDAO;
import util.RandomNumber;

public class EnglishGrammerTest  extends HttpServlet 
{
	ServletContext sctx=null;
	
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String methodName = req.getParameter("methodName");
		HttpSession session = req.getSession();		
		int attempID=-1;
		int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
		
		if(methodName!=null)
		{
			ArrayList arr = new ArrayList();
			
			if(methodName.trim().equalsIgnoreCase("storeRes"))
			{				
				String countQuesNo=req.getParameter("countQuesNo");				
				System.out.println(countQuesNo);				
				for(int zx=0;zx< Integer.parseInt(countQuesNo);zx++)
				{
					String opVal = req.getParameter("opAns"+zx);
					if(opVal!=null)
					{
						arr.add(opVal);
					}
					System.out.println("The Answer Is added In ArrayList : "+opVal);
				}
				insertDataCompTest(arr);
				
				
				// **************** START Calculation for the READING COMPREHENSION **********************  ///
					        String quryForGet_Y ="SELECT DISTINCT(READING_COMP_MASTER_ID) as IDs_Master, COUNT(STATUS) as answer FROM bpo_user_eng_comp_test WHERE STATUS='Y' AND User_ID="+USER_AUTOID;
					        System.out.println("Display no of currect answer and distinct(READING_COMP_MASTER_ID)\t"+quryForGet_Y);
					        Connection conVA = null;
					        Statement stmt_Y=null;
					        String getID_of_RCMID=null;
					        String total_ans_get=null;
					        int no_Of_Question=0;
					        try
					        {	
					        	conVA = ConnectDatabase.getConnection();
					        	stmt_Y=conVA.createStatement();
					          	ResultSet rsGet_Y = stmt_Y.executeQuery(quryForGet_Y);													
								if (rsGet_Y.next()) 
								{
									getID_of_RCMID=rsGet_Y.getString("IDs_Master");
									total_ans_get=rsGet_Y.getString("answer");
									String quryforRCQM ="SELECT COUNT(*) as QCount FROM bpo_eng_comp_question_master  WHERE READING_COMP_MASTER_ID="+getID_of_RCMID;
									System.out.println("Display the reading com qs master ids \t"+quryforRCQM);
									stmt_Y=conVA.createStatement();;
									ResultSet rs_IDS = stmt_Y.executeQuery(quryforRCQM);
									if (rs_IDS.next()) 
									{
										no_Of_Question=Integer.parseInt(rs_IDS.getString("QCount"));
										System.out.println("Dispaly Tatal no of question \t"+no_Of_Question);
									}									
									String quryFor_GET_total_Maxscore="SELECT pass_percentage FROM maximum_english_grammar";
									stmt_Y=conVA.createStatement();
									ResultSet rs_maxScore=stmt_Y.executeQuery(quryFor_GET_total_Maxscore);
									int get_passPERCENT=0;
									if(rs_maxScore.next())
									{
										get_passPERCENT=Integer.parseInt(rs_maxScore.getString("pass_percentage"));
										System.out.println("Dispaly pass percentage \t"+get_passPERCENT);
									}
									double can_marks=0.0;
									can_marks =(double)((Integer.parseInt(total_ans_get)/no_Of_Question)*100);									
									System.out.println("Display the value of the Each Question of marks : \t"+can_marks);									
									String result_status="";
									
									if(can_marks<get_passPERCENT)
									{
										result_status="Fail";
									}
									else
									{
										result_status="Pass";
									}									
									PreparedStatement upd_score_read=conVA.prepareStatement("update bpo_user_eng_comp_test_attempt set Final_Score=? , Final_Status=? where user_id="+USER_AUTOID+"");
									upd_score_read.setDouble(1, can_marks);
									upd_score_read.setString(2, result_status);
									upd_score_read.executeUpdate();
								}											
							}
							catch(Exception e)
							{
								e.getStackTrace();
								System.out.println(e.getCause());
								System.out.println(e.getMessage());				
							}			
				// **************** ENDS Calculation for the READING COMPREHENSION **********************  ///				
				
				RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/EnglishGrammarSuccessPage.jsp?engmessage=engTestComplete");
				System.out.println("Forwarding to Compr test Page");
				rd.forward(req,resp);				
			}
		}
		else
		{
			Connection con = null;
			Statement drStmt=null;
			ResultSet drRs=null;
			try
    		{
    			con = ConnectDatabase.getConnection();
    			try
    			{
    				String drRegQry = "select READING_TEST_ATTEMPT_ID from bpo_user_eng_comp_test_attempt order by READING_TEST_ATTEMPT_ID DESC";
    				System.out.println("Step 3 Query "+drRegQry);
    				drStmt = con.createStatement();
    				drRs = drStmt.executeQuery(drRegQry);
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
    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_eng_comp_test_attempt(READING_TEST_ATTEMPT_ID, USER_ID, START_DATE_ACTIVE) VALUES(?,?,sysdate())");
    			oPst.setLong(1,attempID);
    			oPst.setLong(2,USER_AUTOID);
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
			finally
			{
				ConnectionDAO.closeConnection(con, drStmt, drRs);
			}
			System.out.println(con+"=========="+drStmt+"============="+drRs);
			System.out.println("This is Comprehension");
			int ranNum = RandomNumber.doRawRandomNumber();
			RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/EnglishGrammarTest.jsp");
			System.out.println("Forwarding to English Grammer Test");
			req.setAttribute("RANNUM",ranNum);
			rd.forward(req,resp);
		}
		
	}
	void insertDataCompTest(ArrayList arr)
	{
		System.out.println("op1"+arr.size());
		int readCompID=-1;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs =null;		
		for(int i =0;i<arr.size();i++)
		{
			String arrStr = (String)arr.get(i);
			String[] valStr = arrStr.split(":");
			System.out.println("Ln: "+valStr.length);
			String userStrId = null;
			String qsnStrId = null;
			String compStrId = null;
			String opStrId = null;
			Long userId = null;
			Long qsnId = null;
			Long compId = null;
			Long opId = null;
			String status=null;
			for(int k=0;k<valStr.length;k++)
			{
				userStrId = valStr[0];
				userId = Long.parseLong(userStrId);
				compStrId = valStr[1];
				compId=Long.parseLong(compStrId);
				qsnStrId =  valStr[2];
				qsnId= Long.parseLong(qsnStrId);
				opStrId =   valStr[3];
				opId= Long.parseLong(opStrId);
				status=valStr[4];
				System.out.println("User Id:"+userId+"comprehension Id:"+compId+"Question Id:"+qsnId+"option Id"+opId+"\n\t");
			}
			System.out.println("User Id:"+userId+"comprehension Id:"+compId+"Question Id:"+qsnId+"option Id"+opId);
			try
			{
				con = ConnectDatabase.getConnection();;
				String regQry = "select READING_TEST_ID from bpo_user_eng_comp_test order by READING_TEST_ID DESC";
				System.out.println("query "+regQry);
				stmt = con.createStatement();
				rs = stmt.executeQuery(regQry);
				if(rs.next())
				{
					System.out.println("READING_TEST_ID"+rs.getInt("READING_TEST_ID"));
					readCompID = rs.getInt("READING_TEST_ID");
					readCompID++;
				}
				else
				{
					readCompID=1;
				}
				System.out.println("user id"+userId);
				PreparedStatement pst = con.prepareStatement("INSERT INTO bpo_user_eng_comp_test VALUES(?,?,?,?,?,?)");
				pst.setLong(1,readCompID);
				pst.setLong(2,userId);
				pst.setLong(3,compId);
				pst.setLong(4,qsnId);
				pst.setLong(5,opId);
				pst.setString(6,status);
				int il = pst.executeUpdate();
				System.out.println(il);
				if(il!=0)
				{
					System.out.println("inserted");					
					String fg="Y";					
					String stausrrr="SELECT count(status) FROM bpo_user_eng_comp_test where user_id="+userId+" and status like '"+fg+"'";
					System.out.println("status+....."+stausrrr);
					Statement st=con.createStatement();
					int totalerror=0;
					ResultSet rs2=st.executeQuery(stausrrr);
					boolean bs=false;
					 bs=rs2.next();
					if(bs==true)
					{
						totalerror=rs2.getInt(1);
						PreparedStatement pstss=con.prepareStatement("update result_total set eng_common_err=? where user_id="+userId+"");
						pstss.setInt(1, totalerror);
						pstss.executeUpdate();						
					}
					else
					{
						totalerror=0;
						PreparedStatement pstssss=con.prepareStatement("update result_total set eng_common_err=? where user_id="+userId+"");
						pstssss.setInt(1, totalerror);
						pstssss.executeUpdate();
					}	
				}				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			finally
			{
				ConnectionDAO.closeConnection(con, stmt, rs);
			}
		}
	}
	
}































