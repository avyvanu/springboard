package servelets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.*;

@SuppressWarnings("serial")
public class CanRegPage extends HttpServlet 
{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		System.out.println("============================== START ==============================");		
		resp.setContentType("text/html");
		HttpSession session = req.getSession(true);
		// System.out.println("hello CandidateRegis Page "+session);
		String EDKey="";
		String EDKPass="";
		try
		{
			if((String)session.getAttribute("EDKey") != "AD")
			{
				 EDKey = (String)session.getAttribute("EDKey");
				 EDKPass = (String)session.getAttribute("EDKPass");
			}
			else
			{
				resp.sendRedirect(req.getContextPath() + "/247Recruit/jsp/Index.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(" GETTING KAY AND PASS EXCEPTION + "+e);
		}
		
   	     ResultSet rsw = null;
		 Connection con= null;
 
		 String title=req.getParameter("title");
		 //   System.out.println("title \t"+title);
		 
		 String firstName=req.getParameter("firstName");
		 //   System.out.println("firstName \t"+firstName);
		 
		 String middleName=req.getParameter("middleName");
		 //   System.out.println("middleName \t"+middleName);
		 
		 String lastName=req.getParameter("lastName");	
		 //   System.out.println("lastName \t"+lastName);
		 
		 String firstAndLastName=firstName+" "+lastName;
		 //   System.out.println("firstAndLastName \t"+firstAndLastName);
		 
		 String dob=req.getParameter("dob");
		 //   System.out.println("dob \t"+dob);
		 
		 String radiobutton=req.getParameter("radiobutton");
		 //   System.out.println("radiobutton \t"+radiobutton);
		 
		 String nativeState=req.getParameter("nativeState");
		 //   System.out.println("nativeState \t"+nativeState);
		 
		 String Current_Location=req.getParameter("Current_Location");
		 //   System.out.println("Current_Location \t"+Current_Location);
		 
		 String Current_city=req.getParameter("Current_city");		 	 
		 //   System.out.println("Current_city \t"+Current_city);
		 
		 String Email_id=req.getParameter("Email_id");
		 //   System.out.println("Email_id \t"+Email_id);
		 
		 String mobile=req.getParameter("mobile");
		 //   System.out.println("mobile \t"+mobile);
		 
		 if(mobile.equalsIgnoreCase("Mobile"))
		 {
			 mobile="";
			 //   System.out.println("mobile='' \t"+mobile);
		 }
		 String STDCode=req.getParameter("preFixLand");
		 if(STDCode.equalsIgnoreCase("STD"))
		 {
			 STDCode="";
			 //   System.out.println("STDCode='' \t"+STDCode);
		 }
		 String Landline=req.getParameter("Landline");		 
		 if(Landline.equalsIgnoreCase("Landline"))
		 {
			 Landline="";
			 //   System.out.println("Landline='' \t"+Landline);
		 }
		 
		 String SchoolName=req.getParameter("SchoolName");
		 //   System.out.println("SchoolName \t"+SchoolName);

		 String Qualification=req.getParameter("Qualification");
		 //   System.out.println("Qualification \t"+Qualification);
 
		 String CompletionYear=req.getParameter("CompletionYear");
		 //   System.out.println("CompletionYear \t"+CompletionYear);

		 String ClassPer=req.getParameter("ClassPer");
		 //   System.out.println("ClassPer \t"+ClassPer);

		 String redioYes=req.getParameter("redioYes");
		 //   System.out.println("redioYes \t"+redioYes);
		 
		 String RelevantExprience=null;
		 String CurrentSkill=null;
		 String NONRelevantExprience=null;
		 String PriviousORG=null;
		 
		 if(redioYes.equalsIgnoreCase("Y"))
		 {  
			  PriviousORG = req.getParameter("PriviousORG");
			  //   System.out.println("PriviousORG \t"+PriviousORG);		 
			 
			  RelevantExprience=req.getParameter("RelevantExprience");
			  //   System.out.println("RelevantExprience \t"+RelevantExprience);
			  
			  CurrentSkill=req.getParameter("CurrentSkill");
			  //   System.out.println("CurrentSkill \t"+CurrentSkill);

			  NONRelevantExprience=req.getParameter("NONRelevantExprience");		 
			  //   System.out.println("NONRelevantExprience \t"+NONRelevantExprience);
		 }
		 
		 String PrimarySource=req.getParameter("PrimarySource"); 
		 //   System.out.println("PrimarySource \t"+PrimarySource);
 
		 int ragvalue = MatchCandDetails.VerifyCandNameEmailPhone(firstName, lastName, mobile, Email_id, EDKey, EDKPass);
		 System.out.println("ragvalue  \t"+ragvalue );
// Start Primary Source Drop Down List //		 
		 String primery_Source_Info="";
		 String Psource_Name=req.getParameter("SourceLBLHF");	
		 //   System.out.println("Psource_Name \t"+Psource_Name);
		 String Referal_Id=req.getParameter("RefID");
		 //   System.out.println("Referal_Id \t"+Referal_Id);
		 if(Referal_Id.equals("Details") || Referal_Id.equals("Referal Id"))
		 {
			 Referal_Id = "";
			 //   System.out.println("Referal_Id == '' \t"+Referal_Id);
		 }
		 String empID=req.getParameter("empID");
		 //   System.out.println("empID \t"+empID);
		 if(empID.equals("Details")|| empID.equals("Employee Id"))
		 {
			 empID = "";
			 //   System.out.println("empID == '' \t"+empID);
		 }
		 String empName=req.getParameter("empName");
		 //   System.out.println("empName \t"+empName);
		 if(empName.equals("Details") || empName.equals("Employee Name"))
		 {
			 empName = "";
			 //   System.out.println("empName ==''  \t"+empName);
		 }
		 String empPhone=req.getParameter("empPhone");		 
		 //   System.out.println("empPhone \t"+empPhone);
		 if(empPhone.equals("Details") || empPhone.equals("Phone Number"))
		 {
			 empPhone = "";
			 //   System.out.println(" Details Data "+empPhone);
		 }
		 String jobPortalD=req.getParameter("jobPortalD");  // jobPortalD
		 //   System.out.println("jobPortalD \t"+jobPortalD);
		 String JPOther=req.getParameter("JPOther");
		 //   System.out.println("JPOther \t"+JPOther);
		 if(JPOther.equals("Details"))
		 {
			 empPhone = "";
			 //   System.out.println(" Details Data "+empPhone);
		 }
		 String jobPortalHF=req.getParameter("jobPortalHF");
		 //   System.out.println("jobPortalHF \t"+jobPortalHF);

		 String jobPortalOtherHF=req.getParameter("jobPortalOtherHF");
		 //   System.out.println("jobPortalOtherHF \t"+jobPortalOtherHF);
		 if(jobPortalOtherHF.equals("") || jobPortalOtherHF==null)
		 {
			 jobPortalOtherHF="";
			 //   System.out.println(" Details Data "+jobPortalOtherHF);
		 }
		 String consultD=req.getParameter("Consultant");  // Consultant
		 //   System.out.println("consultD \t"+consultD);
		 String ConsOther=req.getParameter("ConsOther");
		 //   System.out.println("ConsOther \t"+ConsOther);
		 if(ConsOther.equals("Details"))
		 {
			 ConsOther = "";
			 //   System.out.println(" Details Data "+ConsOther);
		 }
		 String ConsOtherHF=req.getParameter("ConsOtherHF");
		 //   System.out.println("ConsOtherHF \t"+ConsOtherHF);
		 String ConsultantOtherHF=req.getParameter("ConsultantOtherHF");
		 //   System.out.println("ConsultantOtherHF \t"+ConsultantOtherHF);
		 if(ConsultantOtherHF.equals("") || ConsultantOtherHF==null)
		 {
			 ConsultantOtherHF="";
		 }

		 String advtD=req.getParameter("Advertisment"); // Advertisment
		 //   System.out.println("advtD \t"+advtD);
		 String AdvertisOther=req.getParameter("AdvertisOther");
		 //   System.out.println("AdvertisOther \t"+AdvertisOther);
		 if(AdvertisOther.equals("Details"))
		 {
			 AdvertisOther = "";
			 //   System.out.println(" Details Data "+AdvertisOther);
		 }

		 String AdvertismentOtherHF=req.getParameter("AdvertismentOtherHF");
		 //   System.out.println("AdvertismentOtherHF \t"+AdvertismentOtherHF);
		 
		 String AdvertismentOtherDispHF=req.getParameter("AdvertismentOtherDispHF");
		 //   System.out.println("AdvertismentOtherDispHF \t"+AdvertismentOtherDispHF);
		 
		 if(AdvertismentOtherDispHF.equals("") || AdvertismentOtherDispHF==null)
		 {
			 AdvertismentOtherDispHF="";
		 }
		 String jobFairD=req.getParameter("jobFairD"); // jobFairD
		 //   System.out.println("jobFairD \t"+jobFairD);
		 String jobFOther=req.getParameter("jobFOther");
		 //   System.out.println("jobFOther \t"+jobFOther);
		 if(jobFOther.equals("Details"))
		 {
			 jobFOther = "";
			 //   System.out.println(" Details Data "+jobFOther);
		 }
		 String jobFairOtherHF=req.getParameter("jobFairOtherHF");
		 //   System.out.println("jobFairOtherHF \t"+jobFairOtherHF);
		 String jobFairOtherDispHF=req.getParameter("jobFairOtherDispHF");
		 //   System.out.println("jobFairOtherDispHF \t"+jobFairOtherDispHF);
		 if(jobFairOtherDispHF.equals("") || jobFairOtherDispHF==null)
		 {
			 jobFairOtherDispHF="";
		 }
		 String emailMailers=req.getParameter("emailMailers"); // emailMailers
		 //   System.out.println("emailMailers \t"+emailMailers);
		 String emailOther=req.getParameter("emailOther");
		 //   System.out.println("emailOther \t"+emailOther);
		 if(emailOther.equals("Details"))
		 {
			 emailOther = "";
			 //   System.out.println(" Details Data "+emailOther);
		 }
		 String emailMailersOtherDISPHF=req.getParameter("emailMailersOtherDISPHF");
		 //   System.out.println("emailMailersOtherDISPHF \t"+emailMailersOtherDISPHF);
		 String emailOtherDispHF=req.getParameter("emailOtherDispHF");
		 //   System.out.println("emailOtherDispHF \t"+emailOtherDispHF);
		 if(emailOtherDispHF.equals("") || emailOtherDispHF == null)
		 {
			 emailOtherDispHF="";
		 }
		 // ---------------------------------------------- //
		 String sms=req.getParameter("sms"); // sms
		 //   System.out.println("sms \t"+sms);
		 String smsOtherField=req.getParameter("smsOtherField");
		 //   System.out.println("smsOtherField \t"+smsOtherField);
		 if(smsOtherField.equals("Details"))
		 {
			 smsOtherField = "";
			 //   System.out.println(" Details Data "+smsOtherField);
		 }
		 String smsOtherIDHF=req.getParameter("smsOtherIDHF");
		 //   System.out.println("smsOtherIDHF \t"+smsOtherIDHF);
		 String smsOtherDispHF=req.getParameter("smsOtherDispHF");
		 //   System.out.println("smsOtherDispHF \t"+smsOtherDispHF);
		 if(smsOtherField.equalsIgnoreCase("Details"))
		 {
			 smsOtherField="";
		 }
		 // --------------------------------------------- //
		 String candiReferalD=req.getParameter("candiReferalD");
		 //   System.out.println("candiReferalD \t"+candiReferalD);
		 if(candiReferalD.equals("Details") || candiReferalD.equals("Candidate Name"))
		 {
			 candiReferalD = "";
			 //   System.out.println(" Details Data "+candiReferalD);
		 }
		 
		 String candiPhoneD=req.getParameter("candiPhoneD");
		 //   System.out.println("candiPhoneD \t"+candiPhoneD);
		 if(candiPhoneD.equals("Details") || candiPhoneD.equals("Phone Number"))
		 {
			 candiPhoneD = "";
			 //   System.out.println(" Details Data "+candiPhoneD);
		 }
		 // --------------------------------------------- //
		 String campusD=req.getParameter("campusD"); // campusD
		 //   System.out.println("campusD \t"+campusD);
		 String campusOtherField=req.getParameter("campusOtherField");
		 //   System.out.println("campusOtherField \t"+campusOtherField);
		 if(campusOtherField.equals("Details"))
		 {
			 campusOtherField = "";
			 //   System.out.println(" Details Data "+campusOtherField);
		 }

		 String campusOtherIDHF=req.getParameter("campusOtherIDHF");
		 //   System.out.println("campusOtherIDHF \t"+campusOtherIDHF);
		 String campusOtherDispHF=req.getParameter("campusOtherDispHF");		 
		 //   System.out.println("campusOtherDispHF \t"+campusOtherDispHF);
		 if(campusOtherDispHF.equals("") || campusOtherDispHF==null)
		 {
			 campusOtherDispHF="";
		 }

		 // --------------------------------------------- //
		 String traingInsituteD=req.getParameter("traingInsituteD"); // traingInsituteD
		 //   System.out.println("traingInsituteD \t"+traingInsituteD);
		 String traingInsituteOtherField=req.getParameter("traingInsituteOtherField");
		 //   System.out.println("traingInsituteOtherField \t"+traingInsituteOtherField);
		 if(traingInsituteOtherField.equals("Details"))
		 {
			 traingInsituteOtherField = "";
			 //   System.out.println(" Details Data "+traingInsituteOtherField);
		 }
		 
		 String traingInsituteOtherIDHF=req.getParameter("traingInsituteOtherIDHF");
		 //   System.out.println("traingInsituteOtherIDHF \t"+traingInsituteOtherIDHF);
		 String traingInsituteOtherDispHF=req.getParameter("traingInsituteOtherDispHF");
		 //   System.out.println("traingInsituteOtherDispHF \t"+traingInsituteOtherDispHF);
		 if(traingInsituteOtherDispHF.equals("traingInsituteOtherDispHF") || traingInsituteOtherDispHF==null)
		 {
			 traingInsituteOtherDispHF="";
		 }
		 
		 // --------------------------------------------- //
		 String xEmployeeD=req.getParameter("xEmployeeD");
		 //   System.out.println("xEmployeeD \t"+xEmployeeD);
		 if(xEmployeeD.equals("Details") || xEmployeeD.equals("Emp Name"))
		 {
			 xEmployeeD = "";
			 //   System.out.println(" Details Data "+xEmployeeD);
		 }
		 
		 String xEmployeePhoneD=req.getParameter("xEmployeePhoneD");		 
		 //   System.out.println("xEmployeePhoneD \t"+xEmployeePhoneD);
		 if(xEmployeePhoneD.equals("Details") || xEmployeePhoneD.equals("Phone Number"))
		 {
			 xEmployeePhoneD = "";
			 //   System.out.println(" Details Data "+xEmployeePhoneD);
		 }

		 // --------------------------------------------- //		 

		 // ---------------------------------------------- //	
		 String TeleCallTeam_REC_Name=req.getParameter("TeleCallTeam_REC_Name"); // TeleCallTeam_REC_Name  
		 //   System.out.println("TeleCallTeam_REC_Name \t"+TeleCallTeam_REC_Name);
		 String callingOther=req.getParameter("callingOther");
		 //   System.out.println("callingOther \t"+callingOther);
		 if(callingOther.equals("Details"))
		 {
			 callingOther = "";
		 }
		 
		 String callingTeamOtherHF=req.getParameter("callingTeamOtherHF");
		 //   System.out.println("callingTeamOtherHF \t"+callingTeamOtherHF);
		 String callingteamOtherDispHF=req.getParameter("callingteamOtherDispHF");
		 //   System.out.println("callingteamOtherDispHF \t"+callingteamOtherDispHF);
		 if(callingteamOtherDispHF.equals("") || callingteamOtherDispHF==null)
		 {
			 callingteamOtherDispHF="";
		 }
		 String VenderCity = req.getParameter("VendorCity");
		 //   System.out.println("VenderCity  \t"+VenderCity );
		 if(VenderCity.equals("") || VenderCity.length()==0 || VenderCity.equals("Other"))
		 {
			 VenderCity = "";
		 }
		 String VenderCityHF = req.getParameter("VendorCityHF");
		 //   System.out.println("VenderCityHF  \t"+VenderCityHF );
		 
		 String VenderName = req.getParameter("VendorName").trim();
		 //   System.out.println("VenderName  \t"+VenderName );
		 String VenderNameHF = req.getParameter("VendorNameHF");
		 //   System.out.println("VenderNameHF  \t"+VenderNameHF );
		 
		 String VenderNameOtherVal = req.getParameter("VendorNameOtherVal");
		 //   System.out.println("VenderNameOtherVal  \t"+VenderNameOtherVal );
		 if(VenderNameOtherVal.equals("Vendor"))
		 {
			 VenderNameOtherVal ="";
		 }
		
		 String VenderCityOtherVal = req.getParameter("VendorCityOtherVal");
		 //   System.out.println("VenderCityOtherVal  \t"+VenderCityOtherVal );
		 if(VenderCityOtherVal.equals("City"))
		 {
			 VenderCityOtherVal = "";
		 }
		 String location = req.getParameter("location");
		 //   System.out.println("location  \t"+location );
		 String otherD=req.getParameter("otherD"); 
		 //   System.out.println("otherD  \t"+otherD );
		 if(otherD.equals("Details"))
		 {
			 otherD = "";
			 //   System.out.println(" CITY VENDER"+otherD);
		 }
		 
		 String secondData = "0";		 
		 // ==============-------------End For Primery Source-----------------======================== //
		 String checkbox=req.getParameter("checkbox");
		 //   System.out.println("checkbox  \t"+checkbox );

		 @SuppressWarnings("unused")
		 boolean IsInvalid = false;
		 
		 if(!DataValidator.CommonValidator(dob))
		 {
			 System.out.println("DataValidator.CommonValidator(dob)  \t"+dob );
			 IsInvalid = true;
			 dob = "1900-01-01";
			 // req.setAttribute("DOB", "Date of birth cannot be blank");
		 }
		 if(!DataValidator.CommonValidator(Email_id))
		 {
			 System.out.println("DataValidator.CommonValidator(Email_id)  \t"+Email_id );
			 IsInvalid = true;
			 Email_id = "abc@xyz.com";
			 // req.setAttribute("EMAIL", "Email field cannot be blank");
		 }
		 if(!DataValidator.CommonValidator(Qualification))
		 {
			 System.out.println("DataValidator.CommonValidator(Qualification)  \t"+Qualification );
			 IsInvalid = true;
			 // req.setAttribute("QULAFICATION", "Qualafication cannot be blank");
		 }
		 if(!DataValidator.CommonValidator(CompletionYear))
		 {
			 System.out.println("DataValidator.CommonValidator(CompletionYear)  \t"+CompletionYear );
			 IsInvalid = true;
			 // req.setAttribute("CPMLETEYEAR", "Year of completion cannot be blank");
		 }
		 if(!DataValidator.CommonValidator(PrimarySource))
		 {
			 System.out.println("DataValidator.CommonValidator(PrimarySource)  \t"+PrimarySource );
			 IsInvalid = true;
			 // req.setAttribute("PRIMARYSOURCE", "Primary source cannot be blank");
		 }
		 
/*		 if (IsInvalid)
		 {
			 req.setAttribute("Title", title);
			 req.setAttribute("Fname", firstName);
			 req.setAttribute("Mname", middleName);
			 req.setAttribute("Lname", lastName);
			 
			 req.setAttribute("dob", dob);
			 req.setAttribute("radiobutton", radiobutton);
			 
			 req.setAttribute("nativeState", nativeState);
			 req.setAttribute("Current_city", Current_city);
			 req.setAttribute("location", location);
			 
			 
			 req.setAttribute("emailMailers", Email_id);
			 req.setAttribute("mobile", mobile);
			 req.setAttribute("STDCode", STDCode);
			 req.setAttribute("Landline", Landline);
			 
			 req.setAttribute("SchoolName", SchoolName);
			 req.setAttribute("Qualification", Qualification);
			 req.setAttribute("CompletionYear", CompletionYear);
			 req.setAttribute("ClassPer", ClassPer);			 
			 
			 req.setAttribute("redioYes", redioYes);
			 req.setAttribute("PrimarySource", PrimarySource);
			 req.setAttribute("location", location);
			 
			 req.setAttribute("checkbox", checkbox);
			 
			 RequestDispatcher rds=req.getRequestDispatcher("247Recruit/jsp/CandidateRegPage.jsp");
	    	 rds.forward(req, resp);
		 }
		 else
		 {
*/		 
		 String pwGen = PasswordGenerate.getPassword(8);
		 String ownIPS  = req.getHeader("X-FORWARDED-FOR");  
         if(ownIPS == null)  
	      {  
        	 ownIPS = req.getRemoteAddr();  
	      }  
 		  System.out.println("User System ipAddress: "+ownIPS);

		  if(PrimarySource.equals("2"))
	      {
			 primery_Source_Info = Psource_Name+", Ref Id : "+Referal_Id+", Emp Id : "+empID+", Emp Name : "+empName+", Phone # : "+	 empPhone;
	      }
	      else if(PrimarySource.equals("3"))
	      {
	    	  primery_Source_Info = Psource_Name+","+jobPortalHF+""+jobPortalOtherHF;
	    	  secondData = jobPortalD;
	      }
	      else if(PrimarySource.equals("4"))
	      {
    	      primery_Source_Info = Psource_Name+","+ConsOtherHF+" "+ConsultantOtherHF;
    	      secondData = consultD;
	      }
	      else if(PrimarySource.equals("5"))
	      {
 		      primery_Source_Info = Psource_Name+","+AdvertismentOtherHF+""+AdvertismentOtherDispHF;
 		      secondData = advtD;
	      }
	      else if(PrimarySource.equals("6"))
	      {
	 		  primery_Source_Info = Psource_Name+", Details: "+otherD;
	      }
	      else if(PrimarySource.equals("8"))
	      {
	 		  primery_Source_Info = Psource_Name+","+jobFairOtherHF+""+jobFairOtherDispHF;
 		      secondData = jobFairD;
	      }			      
	      else if(PrimarySource.equals("9"))
	      {
	 		  primery_Source_Info = Psource_Name+","+emailMailersOtherDISPHF+""+emailOtherDispHF;
	 		  secondData = emailMailers;
	      }	
	      else if(PrimarySource.equals("11"))
	      {
	 		  primery_Source_Info = Psource_Name+","+smsOtherIDHF+" "+smsOtherDispHF;
	 		  secondData = sms;
	      }
	      else if(PrimarySource.equals("13"))
	      {
	 		  primery_Source_Info = Psource_Name+", Name : "+candiReferalD+", Phone# : "+candiPhoneD;
	      }
	      else if(PrimarySource.equals("14"))
	      {
	 		  primery_Source_Info = Psource_Name+","+campusOtherIDHF+" "+campusOtherDispHF;
	 		  secondData = campusD;
	      }
	      else if(PrimarySource.equals("15"))
	      {
	 		  primery_Source_Info = Psource_Name+","+traingInsituteOtherIDHF+""+traingInsituteOtherDispHF;
	 		  secondData = traingInsituteD;
	      }
	      else if(PrimarySource.equals("16"))
	      {
	 		  primery_Source_Info = Psource_Name+", Emp Name : "+xEmployeeD+", Phone# : "+xEmployeePhoneD;
	      }
	      else if(PrimarySource.equals("17"))
	      {
	    	  primery_Source_Info = Psource_Name+","+callingTeamOtherHF+" "+callingteamOtherDispHF;
	      }
	      else if(PrimarySource.equals("18"))
	      {
	    	  primery_Source_Info = Psource_Name+", "+VenderCityHF+(VenderCityOtherVal.equals("")? "" : (" - "+VenderCityOtherVal))+" "+VenderNameHF+(VenderNameOtherVal.equals("")? "" : (" - "+VenderNameOtherVal));
	    	  secondData = VenderCity;
	      }
	      else
	      {
	    	  primery_Source_Info = Psource_Name;
	      }
		  System.out.println("Second Data... "+secondData);
		  System.out.println("Primery Source Info... "+primery_Source_Info);
 		  
    	  String candID_Auto=null;
    	  String candID_String=null;
		  CallableStatement proc=null;
		  try
		   {	
			  con= ConnectDatabase.getConnection();
		      // proc = con.prepareCall("{ call uspInsertCandidate_test_Final(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		      
		      proc = con.prepareCall("{ call Create_Candidate(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
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
		      proc.setString(11, STDCode);
		      proc.setString(12, Landline);
		      proc.setString(13, SchoolName);
		      proc.setString(14, Qualification);
		      proc.setString(15, Current_Location);
		      proc.setString(16, Current_city);
		      proc.setString(17, CompletionYear);		     
		      proc.setString(18, ClassPer);
		      proc.setString(19, CurrentSkill);	
		      proc.setString(20, redioYes);	
		      proc.setString(21, PrimarySource);
		      proc.setString(22, RelevantExprience);
		      proc.setString(23, NONRelevantExprience);	
		      proc.setString(24, PriviousORG);
		      proc.setString(25, ownIPS);
		      proc.setString(26, checkbox);	
		      proc.setInt(27, ragvalue);
		      
		      proc.setString(28, EDKey);
		      proc.setString(29, EDKPass);
		      
		      proc.setString(30, primery_Source_Info);
		      proc.setString(31, secondData);
		      proc.setString(32, location);
		      
	    	  rsw=proc.executeQuery();
		      System.out.println(" Main Registration (" + pwGen + ","
					+ title + "," + firstName + "," + middleName + ","
					+ lastName + "," + dob + "," + radiobutton + ","
					+ nativeState + "," + Email_id + "," + mobile + ","
					+ STDCode + "," + Landline + "," + SchoolName + ","
					+ Qualification + "," + Current_Location + ","
					+ Current_city + "," + CompletionYear + "," + ClassPer + ","
					+ CurrentSkill + "," + redioYes + "," + PrimarySource + ","
					+ RelevantExprience + "," + NONRelevantExprience + ","
					+ PriviousORG + "," + ownIPS + "," + checkbox + ","
					+ ragvalue + "," + primery_Source_Info + "," +  secondData + "," 
					+ location + ")");
		      
	    	  if(rsw.next())
	    	  {
	    		  candID_String=rsw.getString("Bpo_cand_Id");
	    		  candID_Auto=rsw.getString("AutoId");
			      proc.close();
	    		  System.out.println(candID_String + " :: " + candID_Auto);
			      // ***************************************************  //			      
	    		  if(PrimarySource.equals("2"))
			      {
			    	 PreparedStatement p1=con.prepareStatement("insert into prisource_empref(Referal_Id, User_Id, Prv_Emp_Id, Prv_Emp_Name, Prv_Emp_Phone) values(?,?,?,?,?)");
			    	 p1.setString(1, Referal_Id);
			    	 p1.setInt(2, Integer.parseInt(candID_Auto));
			    	 p1.setString(3, empID);
			    	 p1.setString(4, empName);
			    	 p1.setString(5, empPhone);
			    	 p1.executeUpdate();
			    	 p1.close();
			      }
			      else if(PrimarySource.equals("3"))
			      {
			    	  PreparedStatement p2=con.prepareStatement("insert into prisource_jobPortal(User_ID, Job_Portal, Other_Details) values(?,?,?)");
			    	  p2.setInt(1, Integer.parseInt(candID_Auto));
			    	  p2.setString(2, jobPortalD);
			    	  p2.setString(3, JPOther);
			    	  p2.executeUpdate();
			    	  p2.close();
			      }
			      else if(PrimarySource.equals("4"))
			      {
			    	  PreparedStatement p6=con.prepareStatement("insert into prisource_consultant(User_Id, Consultant, Other_Details) values(?,?,?)");
			    	  p6.setInt(1, Integer.parseInt(candID_Auto));
			    	  p6.setString(2, consultD);
			    	  p6.setString(3, ConsOther);
			    	  p6.executeUpdate();
			    	  p6.close();
			      }
			      else if(PrimarySource.equals("5"))
			      {
			    	  PreparedStatement p7=con.prepareStatement("insert into prisource_eadvertisment(User_Id, Advertisment, Other_Details) values(?,?,?)");
			    	  p7.setInt(1, Integer.parseInt(candID_Auto));
			    	  p7.setString(2, advtD);
			    	  p7.setString(3, AdvertisOther);
			    	  p7.executeUpdate();
			    	  p7.close();
			      }
			      else if(PrimarySource.equals("6"))
			      {
			    	  PreparedStatement p16=con.prepareStatement("insert into prisource_other(User_Id, Other) values(?,?)");
			    	  p16.setInt(1, Integer.parseInt(candID_Auto));
			    	  p16.setString(2, otherD);
			    	  p16.executeUpdate();
			    	  p16.close();   
			      }
			      else if(PrimarySource.equals("8"))
			      {
			    	  PreparedStatement p3=con.prepareStatement("insert into prisource_jobfairs(User_Id, Job_Fairs, Other_Details) values(?,?,?)");
			    	  p3.setInt(1, Integer.parseInt(candID_Auto));
			    	  p3.setString(2, jobFairD);				    	 
			    	  p3.setString(3, jobFOther);				    	 
			    	  p3.executeUpdate();
			    	  p3.close();				    	  
			      }			      
			      else if(PrimarySource.equals("9"))
			      {
			    	  PreparedStatement p3=con.prepareStatement("insert into prisource_emailMailers(User_Id, emailMailers, Other_Details) values(?,?,?)");
			    	  p3.setInt(1, Integer.parseInt(candID_Auto));
			    	  p3.setString(2, emailMailers);	
			    	  p3.setString(3, emailOther);
			    	  p3.executeUpdate();
			    	  p3.close();			    	  
			      }	
			      else if(PrimarySource.equals("11"))
			      {
			    	  PreparedStatement p5=con.prepareStatement("insert into prisource_smsblast(User_Id, Sms_Blast, Other_Details) values(?,?,?)");
			    	  p5.setInt(1, Integer.parseInt(candID_Auto));
			    	  p5.setString(2, sms);
			    	  p5.setString(3, smsOtherField);
			    	  p5.executeUpdate();
			    	  p5.close();
			      }
			      else if(PrimarySource.equals("13"))
			      {
			    	  PreparedStatement p11=con.prepareStatement("insert into prisource_candidate_referal(User_Id, Cand_Name, Cand_Phone) values(?,?,?)");
			    	  p11.setInt(1, Integer.parseInt(candID_Auto));
			    	  p11.setString(2, candiReferalD);
			    	  p11.setString(3, candiPhoneD);				    	  
			    	  p11.executeUpdate();
			    	  p11.close(); 
			      }
			      else if(PrimarySource.equals("14"))
			      {
			    	  PreparedStatement p8=con.prepareStatement("insert into prisource_campus(User_Id, Campus, Other_Details) values(?,?,?)");
			    	  p8.setInt(1, Integer.parseInt(candID_Auto));
			    	  p8.setString(2, campusD);
			    	  p8.setString(3, campusOtherField);
			    	  p8.executeUpdate();
			    	  p8.close();  
			      }
			      else if(PrimarySource.equals("15"))
			      {
			    	  PreparedStatement p9=con.prepareStatement("insert into prisource_training_institute(User_Id, Training_Institute, Other_Details) values(?,?,?)");
			    	  p9.setInt(1, Integer.parseInt(candID_Auto));
			    	  p9.setString(2, traingInsituteD);
			    	  p9.setString(3, traingInsituteOtherField);
			    	  p9.executeUpdate();
			    	  p9.close(); 
			      }
			      else if(PrimarySource.equals("16"))
			      {
			    	  PreparedStatement p11=con.prepareStatement("insert into prisourcex_referal(User_Id, Cand_X_referal, Cand_X_Phone) values(?,?,?)");
			    	  p11.setInt(1, Integer.parseInt(candID_Auto));
			    	  p11.setString(2, xEmployeeD);
			    	  p11.setString(3, xEmployeePhoneD);				    	  
			    	  p11.executeUpdate();
			    	  p11.close(); 
			      }
			      else if(PrimarySource.equals("17"))
			      {
			    	  PreparedStatement p11=con.prepareStatement("insert into prisource_calling_team(User_Id, CallingTeam_EmpId, calling_Team_Other) values(?,?,?)");
			    	  p11.setInt(1, Integer.parseInt(candID_Auto));
			    	  p11.setString(2, TeleCallTeam_REC_Name);
			    	  p11.setString(3, callingOther);
			    	  p11.executeUpdate();
			    	  p11.close();   
			      }
			      else if(PrimarySource.equals("18"))
			      {
			    	  PreparedStatement p11=con.prepareStatement("insert into prisource_vender(User_Id, Vender_city_name, Vender_city_name_other, Vender_name, Vender_name_Other) values(?,?,?,?,?)");
			    	  p11.setInt(1, Integer.parseInt(candID_Auto));			    	 
			    	  p11.setString(2, VenderCity);
			    	  p11.setString(3, VenderCityOtherVal);
			    	  p11.setString(4, VenderName.trim());
			    	  p11.setString(5, VenderNameOtherVal);			    	 
			    	  p11.executeUpdate();
			    	  p11.close();   
			     }
				 
		    	 String username1="247RecruitmentIS@247customer.com";
		    	 String password1="123456@abc";
		    	 String msg=new String();
		    	 msg="<HTML><BODY>Hi "+firstName+",<br/><br/>Your registration with [24]7 was successful.<br/><br/><b>Id:</b>&nbsp;"+candID_String+"<br/><b>Password:</b>&nbsp;"+pwGen+"<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    	 //   System.out.println("MessageFormat"+msg);
		    	 String subject="Registration Details";
		    	 SMSFunction.sendSMS(mobile,pwGen,candID_String);
		    	 EmailDemo.sendMailNew(username1,password1,Email_id,msg,subject);
		    	 int candID_Auto2 = Integer.parseInt(candID_Auto);
				 session.setAttribute("User_Center_Id", location);
		    	 //session.setAttribute("Bpo_Cand_Id", candID_String);
				 session.setAttribute("USER_ID", candID_String);
		    	 session.setAttribute("USER_AUTOID", candID_Auto2); //userID passing in session
		    	 session.setAttribute("password_random", pwGen); //password passing in session		    		
		    	 //session.setAttribute("username", firstAndLastName);
		    	 session.setAttribute("USER_Name", firstAndLastName);
		    	 System.out.println("Location : " + location + ", Cand ID : " + candID_String + ", Auto ID : " + candID_Auto2 + ", PWD : " + pwGen + ", Name : " + firstAndLastName);
		    	 RequestDispatcher rds=req.getRequestDispatcher("247Recruit/jsp/MainCanvas.jsp");
		    	 rds.forward(req, resp);		
		    }	   	      
		}
		catch(Exception ex)
		{
			System.out.println("Display Error : "+ex.getMessage());
			ex.printStackTrace();
		}
		finally
		{
			System.out.println("============================== END ==============================");		
			ConnectionDAO.closeConnection(con, null, rsw);				  
		}
	}
		
	//   }

}
