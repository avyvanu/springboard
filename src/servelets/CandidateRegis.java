package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.registry.CapabilityProfile;

import candOBJ.CandidateObject;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;
import util.ConnectDatabase;
import util.ConnectionDAO;
import util.PasswordGenerate;
import util.SMSFunction;

public class CandidateRegis extends HttpServlet 
{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		 resp.setContentType("text/html");
		 PrintWriter out = resp.getWriter();	
		 HttpSession session = req.getSession(true);
		 System.out.println("hello CandidateRegis Page "+session);
		 double calculationForState=0;
		 double previousEMP=0;
		 double highestQUI=0;
		 double primary58=0;
		 double primary43=0;
		 double primary0=0;
		 double defaultValue=-0.83;
		 Connection con= null;
		 double chkFinalValue=0;		 
		 String title=req.getParameter("title");
		 String firstName=req.getParameter("firstName");
		 String middleName=req.getParameter("middleName");
		 String lastName=req.getParameter("lastName");
		 
		 String firstAndLastName=firstName+" "+lastName;
		 
		 String dob=req.getParameter("dob");
		 String radiobutton=req.getParameter("radiobutton");
		 
		 // ==============-------------For Primery Source-----------------======================== //
		 String empID=req.getParameter("empID");
		 String empName=req.getParameter("empName");
		 String empPhone=req.getParameter("empPhone");
		 // ---------------------------------------------- //
		 String jobPortalD=req.getParameter("jobPortalD");
		 // ---------------------------------------------- // 
		 String jobFairD=req.getParameter("jobFairD");
		 String job_date=req.getParameter("job_date"); 
		 // ---------------------------------------------- //
		 String email=req.getParameter("email");
		 // ---------------------------------------------- //
		 String sms=req.getParameter("sms");
		 // --------------------------------------------- //
		 String consultD=req.getParameter("consultD");
		 // --------------------------------------------- //
		 String advtD=req.getParameter("advtD");
		 // --------------------------------------------- //
		 String campusD=req.getParameter("campusD");
		 // --------------------------------------------- //
		 String traingInsituteD=req.getParameter("traingInsituteD");
		 // --------------------------------------------- //
		 String xEmployeeD=req.getParameter("xEmployeeD");
		 // --------------------------------------------- //
		 String candiReferalD=req.getParameter("candiReferalD");
		 // --------------------------------------------- //
		 String WalkingD=req.getParameter("WalkingD");
		 // --------------------------------------------- //
		 String WebSiteD=req.getParameter("WebSiteD");
		 // --------------------------------------------- //
		 String Re_JoinD=req.getParameter("Re_JoinD");
		 // --------------------------------------------- //
		 String E_RecruitmentD=req.getParameter("E_RecruitmentD");
		 // --------------------------------------------- //
		 String otherD=req.getParameter("otherD");
		 
		 
		 // ==============-------------End For Primery Source-----------------======================== //
		 
		 
		 
		 
		// ====================================================================  
		 String nativeState=req.getParameter("nativeState");
		 if(nativeState.equals("KA") || nativeState.equals("KL") || nativeState.equals("AS"))
		 {
			 calculationForState=0.3;
			 System.out.println("calculationForState : :"+calculationForState);
		 }
		 else
		 {
			 calculationForState=0;
			 System.out.println("calculationForState : :"+calculationForState);
		 }
		 String Email_id=req.getParameter("Email_id");
		 String mobile=req.getParameter("mobile");
		 String SchoolName=req.getParameter("SchoolName");
		 
		// ==================================================================== 
		 String Qualification=req.getParameter("Qualification");
		 if(Qualification.equals("56"))
		 {
			 highestQUI=0.56;
			 System.out.println("highestQUI :: "+highestQUI);
	     }
		 else 
		 {
			 highestQUI=0;
			 System.out.println("highestQUI :: "+highestQUI);
		 }		 
		 
		 String Course=req.getParameter("Course");
		 String Studied=req.getParameter("Studied");
		 String CompletionYear=req.getParameter("CompletionYear");
		 String University=req.getParameter("University");
		 String ClassPer=req.getParameter("ClassPer");
		 String CurrentSkill=req.getParameter("CurrentSkill");
		 String ApplyingFor=req.getParameter("ApplyingFor");
		 String redioYes=req.getParameter("redioYes");
		 String RelevantExprience=req.getParameter("RelevantExprience");
		 String NONRelevantExprience=req.getParameter("NONRelevantExprience");
		 
		// ==================================================================== 
		 String PriviousORG=req.getParameter("PriviousORG");
		 if(PriviousORG!=null)
		 {
			 previousEMP=0.34;
			 System.out.println("previousEMP : :"+previousEMP);
		 }
		 else 
		 {
			 previousEMP=0;
			 System.out.println("previousEMP : :"+previousEMP);
		 }
		// ==================================================================== 
		 String PrimarySource=req.getParameter("PrimarySource");		 
		 
		 System.out.println("PrimarySource   : "+PrimarySource);
		 String Psource=null;
		 try
		 {
			 con= ConnectDatabase.getConnection();
			 Statement stmtS=con.createStatement();
			 ResultSet rssS=stmtS.executeQuery("SELECT * FROM source_from where source_id="+PrimarySource+"");
			 if(rssS.next())
			 {
				 Psource=rssS.getString(4);
			 }
		 }
		 catch(Exception ex)
		 {
			System.out.println(ex.getMessage()); 
			ex.printStackTrace();
		 }
		 String checkbox=req.getParameter("checkbox");	
		 //String ProcessFieldTeshSupport=req.getParameter("ProcessFieldTeshSupport");
		 String selectProcessFieldChat=req.getParameter("selectProcessFieldChat");
		// ProcessFieldSales=req.getParameter("ProcessFieldSales");
		 String location=req.getParameter("Location");
		 	
		 String pwGen = PasswordGenerate.getPassword(8);			
		 InetAddress ownIP=InetAddress.getLocalHost();
		 String ownIPS=ownIP.getHostAddress();
		 System.out.println("System IP Address : :"+ownIPS);
		 
		 // calculation for RGB	
		 chkFinalValue= defaultValue+previousEMP+calculationForState+Double.parseDouble(Psource)+highestQUI;
		 System.out.println("chkFinalValue : :"+chkFinalValue);
		 double chkInsert=(Math.exp(chkFinalValue)/(1+Math.exp(chkFinalValue)));		
		 System.out.println("chkInsert : : "+chkInsert);
		 int rag=0;
		 if(chkInsert<0.403)
		 {
			 rag=3;			 
		 }
		 else if(chkInsert>=0.403 || chkInsert< 0.614)		
		 {
			 rag=2;
		 }
		 else if(chkInsert >= 0.614)
		 {
			 rag=1; 
		 }
		 System.out.println("Status FOr the : "+rag);
		 CallableStatement proc=null;
		 boolean chkInsertCandReg=false;
		  try
		   {	
			  con= ConnectDatabase.getConnection();
		      proc = con.prepareCall("{ call uspInsertCandidate_test(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@iCandidateID)}");		      
		      System.out.println(proc);
		      proc.setString(1, pwGen);
		      proc.setString(2, title);		      
		      proc.setString(3, firstName);
		      proc.setString(4, middleName);
		      proc.setString(5, lastName);
		      proc.setString(6, dob);
		      proc.setString(7, radiobutton);
		      proc.setString(8, nativeState);
		      proc.setString(9, Email_id);
		      proc.setString(10, mobile);
		      proc.setString(11, SchoolName);
		      proc.setString(12, Qualification);
		      proc.setString(13, Course);
		      proc.setString(14, Studied);
		      proc.setString(15, CompletionYear);
		      proc.setString(16, University);
		      proc.setString(17, ClassPer);
		      proc.setString(18, CurrentSkill);
		      proc.setString(19, ApplyingFor);
		      proc.setString(20, redioYes);
		      proc.setString(21, PrimarySource);
		      proc.setString(22, RelevantExprience);
		      proc.setString(23, NONRelevantExprience);	
		      proc.setString(24, PriviousORG);
		      proc.setString(25, ownIPS);
		      proc.setString(26, checkbox);	
		      proc.setInt(27, rag);	
		      proc.execute();
		      // System.out.print(pwGen,title,firstName,middleName,lastName,dob,radiobutton,nativeState,Email_id,mobile,SchoolName,Qualification,Course,Studied,CompletionYear,University,ClassPer,CurrentSkill,ApplyingFor,redioYes,PrimarySource,RelevantExprience,RelevantExprience,NONRelevantExprience,PriviousORG,ownIPS,checkbox);
		      System.out.println(chkInsert);
		      proc.close();
		      int  goCamPage=0;
		    
		      
		
		      
		      if(goCamPage!=1)
		      {		    	 
		    	  String mainCandiID=null;		    	 
		    	  String candID_Auto=null;
		    	  String candID_String=null;
		    	  String latestID="SELECT @iCandidateID"; 
		    	  System.out.println("latestID" +latestID);
		    	  Statement st=con.createStatement();
		    	  ResultSet rs=st.executeQuery(latestID);		    	 
		    	  if(rs.next())
		    	  {		    		     		  
		    		  mainCandiID=rs.getString(1);
		    		  String candID[]=mainCandiID.split(",");
		    		  candID_String=candID[0];
		    		  candID_Auto=candID[1];
		    		  
		    		  
		    	      
				      // ***************************************************  //
				      if(PrimarySource.equals("1"))
				      {
				    	 PreparedStatement p1=con.prepareStatement("insert into prisource_empref(User_Id, Prv_Emp_Id, Prv_Emp_Name, Prv_Emp_Phone) values(?,?,?,?)");
				    	 p1.setInt(1, Integer.parseInt(candID_Auto));
				    	 p1.setString(2, empID);
				    	 p1.setString(3, empName);
				    	 p1.setString(4, empPhone);
				    	 p1.executeUpdate();
				    	 p1.close();
				      }
				      else if(PrimarySource.equals("2"))
				      {
				    	  PreparedStatement p2=con.prepareStatement("insert into prisource_jobfair(User_ID, Job_Portal) values(?,?)");
				    	  p2.setInt(1, Integer.parseInt(candID_Auto));
				    	  p2.setString(2, jobPortalD);
				    	  p2.executeUpdate();
				    	  p2.close();
				      }
				      else if(PrimarySource.equals("3"))
				      {
				    	  PreparedStatement p3=con.prepareStatement("insert into prisource_jobfairlocation(User_Id, Location_Job, Location_Date) values(?,?,?)");
				    	  p3.setInt(1, Integer.parseInt(candID_Auto));
				    	  p3.setString(2, jobFairD);
				    	  p3.setString(3, job_date);
				    	  p3.executeUpdate();
				    	  p3.close();				    	  
				      }
				      else if(PrimarySource.equals("4"))
				      {
				    	  PreparedStatement p4=con.prepareStatement("insert into prisource_email(User_Id, Email) values(?,?)");
				    	  p4.setInt(1, Integer.parseInt(candID_Auto));
				    	  p4.setString(2, email);
				    	  p4.executeUpdate();
				    	  p4.close();
				      }
				      else if(PrimarySource.equals("5"))
				      {
				    	  PreparedStatement p5=con.prepareStatement("insert into prisource_smsblast(User_Id, Sms_Blast) values(?,?)");
				    	  p5.setInt(1, Integer.parseInt(candID_Auto));
				    	  p5.setString(2, sms);
				    	  p5.executeUpdate();
				    	  p5.close();
				      }
				      else if(PrimarySource.equals("6"))
				      {
				    	  PreparedStatement p6=con.prepareStatement("insert into prisource_consultant(User_Id, Consultant) values(?,?)");
				    	  p6.setInt(1, Integer.parseInt(candID_Auto));
				    	  p6.setString(2, consultD);
				    	  p6.executeUpdate();
				    	  p6.close();
				      }
				      else if(PrimarySource.equals("7"))
				      {
				    	  PreparedStatement p7=con.prepareStatement("insert into prisource_eadvertisment(User_Id, Advertisment) values(?,?)");
				    	  p7.setInt(1, Integer.parseInt(candID_Auto));
				    	  p7.setString(2, advtD);
				    	  p7.executeUpdate();
				    	  p7.close();
				      }
				      else if(PrimarySource.equals("8"))
				      {
				    	  PreparedStatement p8=con.prepareStatement("insert into prisource_campus(User_Id, Campus) values(?,?)");
				    	  p8.setInt(1, Integer.parseInt(candID_Auto));
				    	  p8.setString(2, campusD);
				    	  p8.executeUpdate();
				    	  p8.close();  
				      }
				      else if(PrimarySource.equals("9"))
				      {
				    	  PreparedStatement p9=con.prepareStatement("insert into prisource_training_institute(User_Id, Training_Institute) values(?,?)");
				    	  p9.setInt(1, Integer.parseInt(candID_Auto));
				    	  p9.setString(2, campusD);
				    	  p9.executeUpdate();
				    	  p9.close(); 
				      }
				      else if(PrimarySource.equals("10"))
				      {				    	  
				    	  PreparedStatement p10=con.prepareStatement("insert into prisource_referalemp(User_Id, Referal_Employee) values(?,?)");
				    	  p10.setInt(1, Integer.parseInt(candID_Auto));
				    	  p10.setString(2, xEmployeeD);
				    	  p10.executeUpdate();
				    	  p10.close(); 
				      }
				      else if(PrimarySource.equals("11"))
				      {
				    	  PreparedStatement p11=con.prepareStatement("insert into prisource_candidate_referal(User_Id, Candidate_Referal) values(?,?)");
				    	  p11.setInt(1, Integer.parseInt(candID_Auto));
				    	  p11.setString(2, candiReferalD);
				    	  p11.executeUpdate();
				    	  p11.close(); 
				      }
				      else if(PrimarySource.equals("12"))
				      {
				    	  PreparedStatement p12=con.prepareStatement("insert into prisource_walking(User_Id, Walking) values(?,?)");
				    	  p12.setInt(1, Integer.parseInt(candID_Auto));
				    	  p12.setString(2, WalkingD);
				    	  p12.executeUpdate();
				    	  p12.close(); 
				      }
				      else if(PrimarySource.equals("13"))
				      {
				    	  PreparedStatement p13=con.prepareStatement("insert into prisource_website(User_Id, WebSite) values(?,?)");
				    	  p13.setInt(1, Integer.parseInt(candID_Auto));
				    	  p13.setString(2, WebSiteD);
				    	  p13.executeUpdate();
				    	  p13.close(); 
				      }
				      else if(PrimarySource.equals("14"))
				      {
				    	  PreparedStatement p14=con.prepareStatement("insert into prisource_rejoin(User_Id, Re_Join) values(?,?)");
				    	  p14.setInt(1, Integer.parseInt(candID_Auto));
				    	  p14.setString(2, Re_JoinD);
				    	  p14.executeUpdate();
				    	  p14.close(); 
				      }
				      else if(PrimarySource.equals("15"))
				      {
				    	  PreparedStatement p15=con.prepareStatement("insert into prisource_e_requirment(User_Id, E_Requirment) values(?,?)");
				    	  p15.setInt(1, Integer.parseInt(candID_Auto));
				    	  p15.setString(2, E_RecruitmentD);
				    	  p15.executeUpdate();
				    	  p15.close(); 
				      }
				      else
				      {
				    	  PreparedStatement p16=con.prepareStatement("insert into prisource_other(User_Id, Other) values(?,?)");
				    	  p16.setInt(1, Integer.parseInt(candID_Auto));
				    	  p16.setString(2, otherD);
				    	  p16.executeUpdate();
				    	  p16.close();   
				      }
				      
				      boolean cv=true;
				      String phoneNo=mobile;
				      String emailAddr=candID_String;
				      SMSFunction.sendSMS(phoneNo,pwGen,emailAddr);
				      if(cv==true)
				      {
				    	  PreparedStatement p16=con.prepareStatement("insert into Location_table(User_Id, Location_value, ProcessFieldChat, ApplyingFor) values(?,?,?,?)");
				    	  p16.setInt(1, Integer.parseInt(candID_Auto));
				    	  p16.setString(2, location);
				    	  p16.setString(3, selectProcessFieldChat);				    	 
				    	  p16.setString(4, ApplyingFor);
				    	  p16.executeUpdate();
				    	  p16.close(); 
				      }				      
				      // ***************************************************  //		    		  
		    		  int candID_Auto2=Integer.parseInt(candID_Auto);
		    		  session.setAttribute("Bpo_Cand_Id", candID_String);
		    		  session.setAttribute("USERID", candID_Auto2); //userID passing in session
		    		  session.setAttribute("password_random", pwGen); //password passing in session
		    		  session.setAttribute("ApplyingFor", ApplyingFor); // passing Applyingfor type test 
		    		  session.setAttribute("username", firstAndLastName);
		    		  session.setAttribute("ScriptType", selectProcessFieldChat);
		    		  
		    		  System.out.println(candID_Auto);
		    		  System.out.println(pwGen);
		    		  System.out.println(ApplyingFor);
		    		  System.out.println(candID_String);		    		  
		    		  System.out.println("firstName : "+firstName+" mainCandiID : "+mainCandiID+" password_random : "+pwGen+" ApplyingFor : "+ApplyingFor);
		    		  RequestDispatcher rds=req.getRequestDispatcher("247Recruit/jsp/camcanvas.jsp");
		    		  rds.forward(req, resp);
		    		  ConnectionDAO.closeConnection(con, st, rs);
		    	  }
		      }		      
			
		}
		catch(Exception ex)
		{
			System.out.println("Display Error : "+ex.getMessage());
			ex.printStackTrace();
		}
		finally
		{
			{		
				
				
			}
		}
		
		
	}

}
