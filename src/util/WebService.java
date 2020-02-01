package util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.sql.CallableStatement;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import java.sql.SQLException;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.ws.soap.SOAPFaultException;

import java.text.SimpleDateFormat;

import peopleInTest.*; 
//import peopleInLive.*;

public class WebService {

	public static void  CandidateSave(String canId, String RecruiterId, int ProgramCode, int SubProgramCode,  String EDKey, String EDKPass) throws Exception
	{ 
				String Title=null;
				String FirstName=null;
				String MiddleName=null;
				String LastName=null;
				String Gender=null;
				String FatherHusband=null;
				String FatherHusbandName=null;
				String DateofBirth=null;
				String CurrentAddress=null;
				int CityCode=0;
				String CityOthers=null;
				int StateCode=0;
				int Pincode=0;
				String ResidencePhone=null;
				String MobilePhone=null;
				String source=null;
				String CandidateID=canId;
				int QualificationGroupCode=0;
				int RelevantExprienceMts=0;
				int NONRelevantExprienceMts=0;
				double RelevantExprienceYrs=0;
				double NONRelevantExprienceYrs=0;
				byte[] RecruitmentSummary=null;
				byte[] Photograph=null;
				String CandidateImagepath=null;
				String InitialImage=null;
				String TCV = "6.0";
				String PFP = "Program Files\\";
				String InitialImagePath="C:\\"+PFP+"Apache Software Foundation\\Tomcat "+TCV+"\\webapps\\247Recruitment\\canImage\\";
				String FinalImagePath="C:\\"+PFP+"Apache Software Foundation\\Tomcat "+TCV+"\\webapps\\247Recruitment\\CandImage-Final\\";
				
				int CandautoId=0;
				Connection con=null;
		try
		{
			    con=ConnectDatabase.getConnection();	
				/*String querycan="select * from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'";
				Statement stmtcand=con.createStatement();
				ResultSet rscand=stmtcand.executeQuery(querycan);*/
			    Statement stmtsbpo=null;
		    	ResultSet rsbpo = null;
		    	CallableStatement csbpo=null;
		    	con=ConnectDatabase.getConnection();									
		    	stmtsbpo = con.createStatement();
				String strProcedurebpo="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedure"+strProcedurebpo);
				csbpo=con.prepareCall(strProcedurebpo);
				csbpo.setString(1,canId);
				csbpo.setString(2,EDKey);
				csbpo.setString(3,EDKPass);
				rsbpo=csbpo.executeQuery();
		
		if(rsbpo.next())
		  	{
				source=rsbpo.getString("Primary_Source_Info");	
				if((source==null)||(source.equals("")))
				{
					source="";
				}
				CandautoId=rsbpo.getInt("AutoID");
				System.out.println("CandautoId::::::"+CandautoId);
				QualificationGroupCode=rsbpo.getInt("Qualification");
				Photograph=rsbpo.getBytes("ImagePath");	
				System.out.println("Imagepath:::::::"+Photograph);
				RelevantExprienceMts=rsbpo.getInt("RelevantExprience");
				NONRelevantExprienceMts=rsbpo.getInt("NONRelevantExprience");
				System.out.println("Total Exprience In Months:::::::"+RelevantExprienceMts+"_"+NONRelevantExprienceMts);
				RelevantExprienceYrs=(double)RelevantExprienceMts/12;
				NONRelevantExprienceYrs=(double)NONRelevantExprienceMts/12;
				System.out.println("Total Exprience In Years:::::::"+RelevantExprienceYrs+"_"+NONRelevantExprienceYrs);
	  		}
				rsbpo.close();
				stmtsbpo.close();
				Statement stmtsimage=null;
				ResultSet rsimage = null;
				CallableStatement csimage=null;
				con=ConnectDatabase.getConnection();									
				stmtsimage = con.createStatement();
				String strProcedureimage="{call RecrtmntSummryRtrv_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedureimage"+strProcedureimage);
				csimage=con.prepareCall(strProcedureimage);
				csimage.setString(1,canId);
				csimage.setString(2,EDKey);
				csimage.setString(3,EDKPass);
				rsimage=csimage.executeQuery();
				if(rsimage.next())	
				{
					RecruitmentSummary=rsimage.getBytes("Candidate_detailed_img");
					System.out.println("RecruitmentSummary"+RecruitmentSummary);
				}
				
				/*BufferedImage originalImage =ImageIO.read(new File(FinalImagePath+CandidateImagepath));
			    ByteArrayOutputStream baos = new ByteArrayOutputStream();
			    System.out.println(baos);
				ImageIO.write( originalImage, "jpg", baos );
				baos.flush();
				RecruitmentSummary = baos.toByteArray();
				System.out.println(RecruitmentSummary);
				baos.close();*/
				
				/*BufferedImage originalImage1 =ImageIO.read(new File(InitialImagePath+InitialImage));
				System.out.println(InitialImagePath+InitialImage);
			    ByteArrayOutputStream baos1 = new ByteArrayOutputStream();
			    System.out.println(baos1);
				ImageIO.write( originalImage1, "png", baos1 );
				baos1.flush();
				Photograph = baos1.toByteArray();
				System.out.println(Photograph);
				baos1.close();*/
				/*String secQsnQryfinal = "select * from cand_personal_details_final where Cand_Passed_Auto_Id="+CandautoId+" ";
				System.out.println("secQsnQryfinal-Personal Details::: " + secQsnQryfinal);
				Statement stmtfinal = con.createStatement();
				ResultSet rsfinal = stmtfinal.executeQuery(secQsnQryfinal);*/
				Statement stmts=null;
				ResultSet rss = null;
				CallableStatement cs=null;
				try
				{         
					con=ConnectDatabase.getConnection();									
					stmts = con.createStatement();
					String strProcedure="{call CandPersonalDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
					System.out.println("strProcedure"+strProcedure);
					cs=con.prepareCall(strProcedure);
					cs.setInt(1,CandautoId);
			        cs.setString(2,EDKey);
			        cs.setString(3,EDKPass);
					rss=cs.executeQuery();
		    	}
		    	catch(Exception e)
		    	{
		    		e.printStackTrace();
		    		e.getMessage();
		    		e.getCause();
		    		
		    	}
				if (rss.next()) {
				Title=rss.getString("Cand_Tital");
				FirstName=rss.getString("Cand_F_Name");
				MiddleName=rss.getString("Cand_M_Name");
				LastName=rss.getString("Cand_L_Name");
				Gender=rss.getString("Cand_Gender");
				FatherHusband=rss.getString("Cand_FName_HName");
				FatherHusbandName=rss.getString("Cand_Father_Name");
				DateofBirth=rss.getString("Cand_DOB");
				System.out.println("DOB:::"+DateofBirth);
				}
				rss.close();
				stmts.close();
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
				Date date=dateFormat.parse(DateofBirth);
				System.out.println("Initial Date::::"+date);
				GregorianCalendar c = new GregorianCalendar();
				c.setTime(date);
				XMLGregorianCalendar date2 = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
				System.out.println("Second Date:::"+date2);
		        
				Statement stmtsaddress=null;
				ResultSet rssaddress = null;
				CallableStatement csaddress=null;
				try
				{
					con=ConnectDatabase.getConnection();									
					stmtsaddress = con.createStatement();
					String strAddress="{call CandAddressDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
					System.out.println("strAddress"+strAddress);
					csaddress=con.prepareCall(strAddress);
					csaddress.setInt(1,CandautoId);
					csaddress.setString(2,EDKey);
					csaddress.setString(3,EDKPass);
					rssaddress=csaddress.executeQuery();
		    	}
		    	catch(Exception e)
		    	{
		    		e.printStackTrace();
		    		System.out.println(e.getMessage());
		    		e.getMessage();
		    		System.out.println(e.getCause());
		    		e.getCause();
		    	}
				if (rssaddress.next()) {
				CurrentAddress=rssaddress.getString("Cand_Current_address");
				System.out.println("CurrentAddress"+CurrentAddress);
				CityCode=rssaddress.getInt("Cand_Current_city");
				System.out.println("CityCode"+CityCode);
				CityOthers=rssaddress.getString("Cand_Current_city_Other");
				System.out.println("CityOthers"+CityOthers);
				if(CityOthers==null)
				{
					CityOthers="";
				}
				StateCode=rssaddress.getInt("Cand_Current_State");
				Pincode=rssaddress.getInt("Cand_Current_Pin_Code");
				MobilePhone=rssaddress.getString("Cand_Current_Mobile");
				System.out.println("MobilePhone"+MobilePhone);
				ResidencePhone=rssaddress.getString("Cand_Current_Phone");
				System.out.println("ResidencePhone"+ResidencePhone);
				}
		        rssaddress.close();
				stmtsaddress.close();
				
		        String message="Successfully Updated";
		        FormulaHRServices fhrS = new FormulaHRServices();
				FormulaHRServicesSoap fhrss = fhrS.getFormulaHRServicesSoap();
				boolean check=fhrss.candidateSave(Title,FirstName,MiddleName,LastName,Gender,FatherHusband,FatherHusbandName,date2,CurrentAddress, CityCode,CityOthers, StateCode, Pincode, ResidencePhone, MobilePhone, source, ProgramCode, SubProgramCode, CandidateID, QualificationGroupCode, RelevantExprienceYrs, NONRelevantExprienceYrs, RecruitmentSummary, Photograph);
				System.out.println("boolean check"+check);
				if(check)
				{
				PreparedStatement PUpdateWebservice=con.prepareStatement("update bpo_candidatesreg_details set WebService_SubmitState= ?,WebService_Response= ?,Offered_By = ?,Offered_On = now() where AutoID = ? ");
				System.out.println("Webservice Successfully Updated::"+PUpdateWebservice);
				PUpdateWebservice.setInt(1,1);
				PUpdateWebservice.setString(2,message);
				PUpdateWebservice.setString(3,RecruiterId);
				PUpdateWebservice.setInt(4,CandautoId);
				PUpdateWebservice.executeUpdate();
				PUpdateWebservice.close();
				System.out.println("Update Successfully::::");
				PUpdateWebservice = con.prepareStatement("insert into candidate_offer_attempt_history(CandidateID, Offered_By, Offered_On, WebService_SubmitState, WebService_Response) values(?,?,now(),?,?)");
				PUpdateWebservice.setString(1,canId);
				PUpdateWebservice.setString(2,RecruiterId);
				PUpdateWebservice.setInt(3,1);
				PUpdateWebservice.setString(4,message);
				PUpdateWebservice.executeUpdate();
				PUpdateWebservice.close();
				System.out.println("Inserted  Successfully Candidate_Offer_Attempt_Info::::");
				System.out.println("Web Service : \t"+check);
				}
			}
		      /* catch(SOAPFaultException ex){
			   //System.out.println(ex.getMessage());
			   StringWriter errors = new StringWriter();
			   ex.printStackTrace(new PrintWriter(errors));
			   errors.toString();
			   System.out.println("Error Occured is::::::"+errors);
			   PreparedStatement PUpdateWebservice=con.prepareStatement("update bpo_candidatesreg_details set WebService_Response='"+errors+"' where AutoID="+CandautoId+"");
			   System.out.println("Webservice Successfully Updated::"+PUpdateWebservice);
			   PUpdateWebservice.executeUpdate();
			   PUpdateWebservice.close(); 
			   
				}*/
			catch(Exception ex)
			{
				   try
				   {
				   StringWriter errors = new StringWriter();
				   ex.printStackTrace(new PrintWriter(errors));
				   String errorfinal=(errors.toString()).replaceAll("'", "''");
				   System.out.println("Error Occured is::::::"+errors);
				   PreparedStatement PUpdateWebservice = con.prepareStatement("update bpo_candidatesreg_details set WebService_SubmitState= ?,WebService_Response= ?,Offered_By = ?,Offered_On = now() where AutoID = ?");
				   System.out.println("Webservice Exception Updated::"+PUpdateWebservice);
				   PUpdateWebservice.setInt(1,0);
				   PUpdateWebservice.setString(2,errorfinal);
				   PUpdateWebservice.setString(3,RecruiterId);
				   PUpdateWebservice.setInt(4,CandautoId);
				   PUpdateWebservice.executeUpdate();
				   PUpdateWebservice.close();
				   System.out.println("Update Successfully::::");
				   
				   PUpdateWebservice = con.prepareStatement("insert into candidate_offer_attempt_history(CandidateID, Offered_By, Offered_On, WebService_SubmitState, WebService_Response) values(?,?,now(),?,?)");
				   PUpdateWebservice.setString(1,canId);
				   PUpdateWebservice.setString(2,RecruiterId);
				   PUpdateWebservice.setInt(3,0);
				   PUpdateWebservice.setString(4,errorfinal);
				   PUpdateWebservice.executeUpdate();
				   PUpdateWebservice.close();
				   System.out.println("Inserted  Successfully Candidate_Offer_Attempt_Info::::");
				   }
				   catch(Exception e)
				   {
					   e.printStackTrace();
					   System.out.println(e.getMessage());
					   e.getMessage();
					   System.out.println(e.getMessage());
					   e.getCause();
			    	   System.out.println(e.getCause());
				   }
				
			}
				con.close();
	}
}
