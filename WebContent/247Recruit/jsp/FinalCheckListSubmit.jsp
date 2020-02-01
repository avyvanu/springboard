<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="util.EmailDemo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.SMSFunction"%>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%

	String username1="247RecruitmentIS@247customer.com";
	String password1="123456@abc";
	PreparedStatement finalchkInsert = null;
	String canId = (String) session.getAttribute("Bpo_Cand_Id");
	Connection connection=ConnectDatabase.getConnection();
	String querycan="select AutoID from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'";
	Statement stmtcand=connection.createStatement();
	ResultSet rscand=stmtcand.executeQuery(querycan);
	int CandautoId=0;
	if(rscand.next())
	{
		CandautoId=rscand.getInt("AutoID");
		System.out.println("CandautoId::::::"+CandautoId);
	}
	String WorkExperience= request.getParameter("hidExp");
	System.out.println("FinalChkList:::WorkExperience::::"+WorkExperience);
	String query;
	int chkPhoto1=1;
	int chkID1=1;
	int chkAdd1=1;
	int chkBirth1=1;
	int chkEdu1=1;
	int chkEmp1=1;
	int chkEmp2=1;
	int chkEmp3=1;
	int chkSlip1=1;
	int chkResume1=1;
	int chkTransport1=1;
	
	//********Resume********//
	String selResume= request.getParameter("selResume");
	if(selResume==null)
	{
		selResume="";
	}
	String txtResumeVal="";
	if(selResume.equalsIgnoreCase("Other"))
	{
		txtResumeVal= request.getParameter("txtResume");
		if((txtResumeVal==null)||(txtResumeVal.equalsIgnoreCase("Other Details")))
		{
			txtResumeVal="";
		}
	}
	String chkResume= request.getParameter("chkResume");
	if(chkResume==null)
	{
		chkResume1=0;
	}
	//******** End Resume********//
	
	//********Photoes********//
	String selPassPhotos= request.getParameter("selPassPhotos");
	if(selPassPhotos==null)
	{
		selPassPhotos="";
	}
	String txtPassPhotos= "";
	if(selPassPhotos.equalsIgnoreCase("Other"))
	{
		txtPassPhotos=request.getParameter("txtPassPhotos");
		if((txtPassPhotos==null)||(txtPassPhotos.equalsIgnoreCase("Other Details")))
		{
			txtPassPhotos="";
		}
	}
	String chkPassPhotos= request.getParameter("chkPassPhotos");
	if(chkPassPhotos==null)
	{
		chkPhoto1=0;
	}
	//******** End of Photoes********//
	
	//******** ID proof********//
	String selID= request.getParameter("selID");
	if(selID==null)
	{
		selID="";
	}
	String txtID="";
	if(selID.equalsIgnoreCase("Other"))
	{
		txtID=request.getParameter("txtID");
		if((txtID==null)||(txtID.equalsIgnoreCase("Other Details")))
		{
			txtID="";
		}
	}
	String chkID= request.getParameter("chkID");
	if(chkID==null)
	{
		chkID1=0;
	}
	//******** End of ID proof********//
	
	//******** Address proof********//
	String selAddress= request.getParameter("selAddress");
	if(selAddress==null)
	{
		selAddress="";
	}
	String txtAddress="";
	if(selAddress.equalsIgnoreCase("Other"))
	{
		txtAddress=request.getParameter("txtAddress");
		if((txtAddress==null)||(txtAddress.equalsIgnoreCase("Other Details")))
		{
			txtAddress="";
		}
	}
	String chkAddress= request.getParameter("chkAddress");
	if(chkAddress==null)
	{
		chkAdd1=0;
	}
	//******** End of Address proof********//
	
	//********Birth proof********//
	String selBirth= request.getParameter("selBirth");
	if(selBirth==null)
	{
		selBirth="";
	}
	String txtBirth="";
	if(selBirth.equalsIgnoreCase("Other"))
	{
		txtBirth=request.getParameter("txtBirth");
		if((txtBirth==null)||(txtBirth.equalsIgnoreCase("Other Details")))
		{
			txtBirth="";
		}
	}
	String chkBirth= request.getParameter("chkBirth");
	if(chkBirth==null)
	{
		chkBirth1=0;
	}
	//******** End of Birth proof********//
	
	//******** Education proof********//
	String selEducation= request.getParameter("selEducation");
	if(selEducation==null)
	{
		selEducation="";
	}
	String txtEducation="";
	if(selEducation.equalsIgnoreCase("Other"))
	{
		txtEducation=request.getParameter("txtEducation");
		if((txtEducation==null)||(txtEducation.equalsIgnoreCase("Other Details")))
		{
			txtEducation="";
		}
	}
	String chkEducation= request.getParameter("chkEducation");
	if(chkEducation==null)
	{
		chkEdu1=0;
	}
	//******** End of Education proof********//
	
	//********Hold and Action********//
	String HoldReason= request.getParameter("txtactioncommentsVal");
	System.out.println("HoldReason:::"+HoldReason);
	if(HoldReason==null)
	{
		HoldReason="";
	}
	int CheckList_Action = Integer.parseInt(request.getParameter("select"));
	String selTransport= "Hard Copy";
	String txtTransportVal= request.getParameter("txtTransportVal");
	if((txtTransportVal==null)||(txtTransportVal.equalsIgnoreCase("Comments")))
	{
		txtTransportVal="";
	}
	String chkTransport= request.getParameter("chkTransport");
	if(chkTransport==null)
	{
		chkTransport1=0;
	}
//******** End of Hold and Action********//

   try
   {
      if(WorkExperience.equalsIgnoreCase("Y"))
	  {
			//******** Employment********//
			String selEmployment= request.getParameter("selEmployment");
			if(selEmployment==null)
			{
			selEmployment="";
			}
			String txtEmployment="";
			if(selEmployment.equalsIgnoreCase("Other"))
			{
				txtEmployment=request.getParameter("txtEmployment");
				if((txtEmployment==null)||(txtEmployment.equalsIgnoreCase("Comments")))
				{
				txtEmployment="";
				}
			  }
			String chkEmployment= request.getParameter("chkEmployment");
			if(chkEmployment==null)
			{
				chkEmp1=0;
			}
			//******** End of Employment********//
			
			//******** Employment2********//
			String selEmployment2= request.getParameter("selEmployment2");
			if(selEmployment2==null)
			{
			selEmployment2="";
			}
			if(selEmployment2.equalsIgnoreCase("select"))
			{
			selEmployment2 = "";
			}
			String txtEmployment2="";
			if(selEmployment2.equalsIgnoreCase("Other"))
			{
				txtEmployment2=request.getParameter("txtEmployment2");
				if((txtEmployment2==null)||(txtEmployment2.equalsIgnoreCase("Comments")))
				{
				txtEmployment2="";
				}
			}
			String chkEmployment2= request.getParameter("chkEmployment2");
			if(chkEmployment2==null)
			{
				chkEmp2=0;
			}
			//******** End of Employment2********//
			
			
			//********Employment3********//
			String selEmployment3= request.getParameter("selEmployment3");
			if(selEmployment3==null)
			{
			selEmployment3="";
			}
			if(selEmployment3.equalsIgnoreCase("select"))
			{
			selEmployment3 = "";
			}
			String txtEmployment3="";
			if(selEmployment3.equalsIgnoreCase("Other"))
			{
				txtEmployment3=request.getParameter("txtEmployment3");
				if((txtEmployment3==null)||(txtEmployment3.equalsIgnoreCase("Comments")))
				{
				txtEmployment3="";
				}
			}
			String chkEmployment3= request.getParameter("chkEmployment3");
			if(chkEmployment3==null)
			{
				chkEmp3=0;
			}
				
			//******** End of Employment3********//
			
			//********PaySlip********//
			String selPaySlip= request.getParameter("selPaySlip");
			if(selPaySlip==null)
			{
				selPaySlip="";
			}
			String txtPaySlip= "";
			if(selPaySlip.equalsIgnoreCase("Other"))
			{
				txtPaySlip=(String)request.getParameter("txtPaySlip");
				if((txtPaySlip==null)||(txtPaySlip.equalsIgnoreCase("Other Details")))
				{
					txtPaySlip="";
				}
			}
			String chkPaySlip= request.getParameter("chkPaySlip");
			if(chkPaySlip==null)
			{
				chkSlip1=0;
			}
			
			//******** End of PaySlip********//
			
			
              //query="INSERT INTO recruiter_finalchecklist(CandidateID, Photos, PhotosOther, PhotosChk, ID, IDOther, IDChk, Address, AddressOther, AddressChk, Birth, BirthOther, BirthChk, Education, EducationOther, EducationChk, Employment, EmploymentOther, EmploymentChk, Employment2, EmploymentOther2, EmploymentChk2, Employment3, EmploymentOther3, EmploymentChk3, PaySlip, PaySlipOther, PaySlipChk,Resume,ResumeComm,ResumeChk,Transport,TransportComm,TransportChk, UpdatedOn, CheckList_Action, Hold_Reason) VALUES('" + canId + "','" + selPassPhotos + "','" + txtPassPhotos + "'," + chkPhoto1 + ",'" + selID + "','" + txtID + "'," + chkID1 + ",'" + selAddress + "','" + txtAddress + "'," + chkAdd1 + ",'" + selBirth + "','" + txtBirth + "'," + chkBirth1 + ",'" + selEducation + "','" + txtEducation + "'," + chkEdu1 + ",'" + selEmployment + "','" + txtEmployment + "'," + chkEmp1 + ",'" + selEmployment2 + "','" + txtEmployment2 + "'," + chkEmp2 + ",'" + selEmployment3 + "','" + txtEmployment3 + "'," + chkEmp3 + ",'" + selPaySlip + "','" + txtPaySlip + "'," + chkSlip1 + ",'" + selResume + "','" + txtResumeVal + "'," + chkResume1 + ",'" + selTransport + "','" + txtTransportVal + "'," + chkTransport1 + ",NOW(), '"+CheckList_Action+"','"+HoldReason+"')";
              finalchkInsert =connection.prepareStatement("insert into recruiter_finalchecklist(CandidateID, Photos, PhotosOther, PhotosChk, ID, IDOther, IDChk, Address, AddressOther, AddressChk, Birth, BirthOther, BirthChk, Education, EducationOther, EducationChk, Employment, EmploymentOther, EmploymentChk, Employment2, EmploymentOther2, EmploymentChk2, Employment3, EmploymentOther3, EmploymentChk3, PaySlip, PaySlipOther, PaySlipChk,Resume,ResumeComm,ResumeChk,Transport,TransportComm,TransportChk, UpdatedOn, CheckList_Action, Hold_Reason) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)");
	    	  finalchkInsert.setString(1,canId);
	    	  finalchkInsert.setString(2,selPassPhotos);
	    	  if(!txtPassPhotos.equals(""))
	    	  {
	    	  	finalchkInsert.setString(3,txtPassPhotos);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(3,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkPhoto1 != 0)
	    	  {
	    	 	 finalchkInsert.setInt(4,chkPhoto1);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(4,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(5,selID);
	    	  if(!txtID.equals(""))
	    	  {
	    	  	finalchkInsert.setString(6,txtID);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(6,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkID1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(7,chkID1);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(7,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(8,selAddress);
	    	  if(!txtAddress.equals(""))
	    	  {
	    	  	finalchkInsert.setString(9,txtAddress);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(9,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkAdd1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(10,chkAdd1);
	    	  }
	    	  else
	    	  {
	    	   finalchkInsert.setNull(10,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(11,selBirth);
	    	  if(!txtBirth.equals(""))
	    	  {
	    	  	finalchkInsert.setString(12,txtBirth);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(12,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkBirth1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(13,chkBirth1);
	    	  }
	    	  else
	    	  {
	    	   	finalchkInsert.setNull(13,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(14,selEducation);
	    	  if(!txtEducation.equals(""))
	    	  {
	    	  	finalchkInsert.setString(15,txtEducation);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(15,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkEdu1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(16,chkEdu1);
	    	  }
	    	  else
	    	  {
	    	   	finalchkInsert.setNull(16,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(17,selEmployment);
	    	  if(!txtEmployment.equals(""))
	    	  {
	    	  	finalchkInsert.setString(18,txtEmployment);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(18,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkEmp1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(19,chkEmp1);
	    	  }
	    	  else
	    	  {
	    	   	finalchkInsert.setNull(19,java.sql.Types.INTEGER);
	    	  }
	    	  if(!selEmployment2.equals(""))
	    	  {
	    	  	finalchkInsert.setString(20,selEmployment2);
	    	  }
	    	  else
	    	  {
	    	   	finalchkInsert.setNull(20,java.sql.Types.VARCHAR);
	    	  }
	    	  if(!txtEmployment2.equals(""))
	    	  {
	    	  	finalchkInsert.setString(21,txtEmployment2);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(21,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkEmp2 != 0)
	    	  {
	    	  	finalchkInsert.setInt(22,chkEmp2);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(22,java.sql.Types.INTEGER);
	    	  }
	    	  if(!selEmployment3.equals(""))
	    	  {
	    	  	finalchkInsert.setString(23,selEmployment3);
	    	  }
	    	  else
	    	  {
	    	   finalchkInsert.setNull(23,java.sql.Types.VARCHAR);
	    	  }
	    	  if(!txtEmployment3.equals(""))
	    	  {
	    	  	finalchkInsert.setString(24,txtEmployment3);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(24,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkEmp3 != 0)
	    	  {
	    	 	 finalchkInsert.setInt(25,chkEmp3);
	    	  }
	    	  else
	    	  {
	    	    finalchkInsert.setNull(25,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(26,selPaySlip);
	    	  if(!txtPaySlip.equals(""))
	    	  {
	    	  	finalchkInsert.setString(27,txtPaySlip);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(27,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkSlip1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(28,chkSlip1);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(28,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(29,selResume);
	    	  if(!txtResumeVal.equals(""))
	    	  {
	    	  	finalchkInsert.setString(30,txtResumeVal);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(30,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkResume1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(31,chkResume1);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(31,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setString(32,selTransport);
	    	  if(!txtTransportVal.equals(""))
	    	  {
	    	  	finalchkInsert.setString(33,txtTransportVal);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(33,java.sql.Types.VARCHAR);
	    	  }
	    	  if(chkTransport1 != 0)
	    	  {
	    	  	finalchkInsert.setInt(34,chkTransport1);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(34,java.sql.Types.INTEGER);
	    	  }
	    	  finalchkInsert.setInt(35,CheckList_Action);
	    	  if(!HoldReason.equals(""))
	    	  {
	    	  	finalchkInsert.setString(36,HoldReason);
	    	  }
	    	  else
	    	  {
	    	  	finalchkInsert.setNull(36,java.sql.Types.VARCHAR);
	    	  }
		    }
            else
		     {
			   //******** Employment********//
				String selEmployment= request.getParameter("selEmployment");
				if(selEmployment.equalsIgnoreCase("select"))
				{
				selEmployment="";
				}
				String txtEmployment="";
				if(selEmployment.equalsIgnoreCase("Other"))
				{
					txtEmployment=request.getParameter("txtEmployment");
					if((txtEmployment==null)||(txtEmployment.equalsIgnoreCase("Comments")))
					{
					txtEmployment="";
					}
				  }
				String chkEmployment= request.getParameter("chkEmployment");
				if(chkEmployment==null)
				{
					chkEmp1=0;
				}
				//******** End of Employment********//
			  //query="INSERT INTO recruiter_finalchecklist(CandidateID, Photos, PhotosOther, PhotosChk, ID, IDOther, IDChk, Address, AddressOther, AddressChk, Birth, BirthOther, BirthChk, Education, EducationOther, EducationChk, Employment, EmploymentOther, EmploymentChk, PaySlip, PaySlipOther, PaySlipChk,Resume,ResumeComm,ResumeChk,Transport,TransportComm,TransportChk, UpdatedOn, CheckList_Action, Hold_Reason) VALUES('" + canId + "','" + selPassPhotos + "','" + txtPassPhotos + "'," + chkPhoto1 + ",'" + selID + "','" + txtID + "'," + chkID1 + ",'" + selAddress + "','" + txtAddress + "'," + chkAdd1 + ",'" + selBirth + "','" + txtBirth + "'," + chkBirth1 + ",'" + selEducation + "','" + txtEducation + "'," + chkEdu1 + ",'" + selEmployment + "','" + txtEmployment + "'," + chkEmp1 + ",'Fresher','',0,'" + selResume + "','" + txtResumeVal + "'," + chkResume1 + ",'" + selTransport + "','" + txtTransportVal + "'," + chkTransport1 + ",NOW(),'"+CheckList_Action+"','"+HoldReason+"')";
			  finalchkInsert =connection.prepareStatement("INSERT INTO recruiter_finalchecklist(CandidateID, Photos, PhotosOther, PhotosChk, ID, IDOther, IDChk, Address, AddressOther, AddressChk, Birth, BirthOther, BirthChk, Education, EducationOther, EducationChk, Employment, EmploymentOther, EmploymentChk, PaySlip, PaySlipOther, PaySlipChk,Resume,ResumeComm,ResumeChk,Transport,TransportComm,TransportChk, UpdatedOn, CheckList_Action, Hold_Reason) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)");
		      finalchkInsert.setString(1,canId);
		 	  finalchkInsert.setString(2,selPassPhotos);
		 	  if(!txtPassPhotos.equals(""))
		 	  {
		 	  	finalchkInsert.setString(3,txtPassPhotos);
		 	  }
		 	  else
		 	  {
		 	   finalchkInsert.setNull(3,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkPhoto1 != 0)
		      {
		 	    finalchkInsert.setInt(4,chkPhoto1);
		 	  }
		 	  else
		 	  {
		 	  	 finalchkInsert.setNull(4,java.sql.Types.INTEGER);
		 	  }
		 	  finalchkInsert.setString(5,selID);
		 	  if(!txtID.equals(""))
		 	  {
		 	 	 finalchkInsert.setString(6,txtID);
		 	  }
		 	  else
		 	  {
		 	 	 finalchkInsert.setNull(6,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkID1 != 0)
		      {
		 	  	finalchkInsert.setInt(7,chkID1);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(7,java.sql.Types.INTEGER);
		 	  }
		 	  finalchkInsert.setString(8,selAddress);
		 	  if(!txtAddress.equals(""))
		 	  {
		 	  	finalchkInsert.setString(9,txtAddress);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(9,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkAdd1 != 0)
		       {
		 	  	finalchkInsert.setInt(10,chkAdd1);
		 	   }
		 	   else
		 	   {
		 	    finalchkInsert.setNull(10,java.sql.Types.INTEGER);
		 	   }
		 	  finalchkInsert.setString(11,selBirth);
		 	  if(!txtBirth.equals(""))
		 	  {
		 	  	finalchkInsert.setString(12,txtBirth);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(12,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkBirth1 != 0)
		       {
		 	  	finalchkInsert.setInt(13,chkBirth1);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(13,java.sql.Types.INTEGER);
		 	  }
		 	  finalchkInsert.setString(14,selEducation);
		 	  if(!txtEducation.equals(""))
		 	  {
		 	  	finalchkInsert.setString(15,txtEducation);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(15,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkEdu1 != 0)
		      {
		 	  	finalchkInsert.setInt(16,chkEdu1);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(16,java.sql.Types.INTEGER);
		 	  }
		 	  if(!selEmployment.equals(""))
		 	  {
		 	  	finalchkInsert.setString(17,selEmployment);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(17,java.sql.Types.VARCHAR);
		 	  }
		 	  if(!selEmployment.equals(""))
		 	  {
		 	  	finalchkInsert.setString(18,txtEmployment);
		 	  }
		 	  else
		 	  {
		 	   	finalchkInsert.setNull(18,java.sql.Types.VARCHAR);
		 	  }
		 	  if(chkEmp1 != 0)
		 	  {
		 	  	finalchkInsert.setInt(19,chkEmp1);
		 	  }
		 	  else
		 	  {
		 	  	finalchkInsert.setNull(19,java.sql.Types.INTEGER);
		 	  }
		 	  finalchkInsert.setString(20,"Fresher");
		 	  finalchkInsert.setNull(21,java.sql.Types.VARCHAR);
		 	  finalchkInsert.setNull(22,java.sql.Types.VARCHAR);
		 	  finalchkInsert.setString(23,selResume);
		 	  if(!txtResumeVal.equals(""))
		 	  {
		   	  	finalchkInsert.setString(24,txtResumeVal);
		   	  }
		   	  else
		   	  {
		   	  	finalchkInsert.setNull(24,java.sql.Types.VARCHAR);
		   	  }
		   	  if(chkResume1 != 0)
		 	  {
		   	  	finalchkInsert.setInt(25,chkResume1);
		   	  }
		   	  else
		   	  {
		   	  	finalchkInsert.setNull(25,java.sql.Types.INTEGER);
		   	  }
		   	  finalchkInsert.setString(26,selTransport);
		   	  if(!txtTransportVal.equals(""))
		 	  {
		   	  	finalchkInsert.setString(27,txtTransportVal);
		   	  }
		   	  else
		   	  {
		   	  	finalchkInsert.setNull(27,java.sql.Types.VARCHAR);
		   	  }
		   	  if(chkTransport1 != 0)
		 	  {
		   	  	finalchkInsert.setInt(28,chkTransport1);
		   	  }
		   	  else
		   	  {
		   	  	finalchkInsert.setNull(28,java.sql.Types.INTEGER);
		   	  }
		   	  finalchkInsert.setInt(29,CheckList_Action);
		   	  if(!HoldReason.equals(""))
		   	  {
		   	 	 finalchkInsert.setString(30,HoldReason);
		   	  }
		   	  else
		   	  {
		   	  	finalchkInsert.setNull(30,java.sql.Types.VARCHAR);
		   	  }
            }
		
		finalchkInsert.executeUpdate();
		finalchkInsert.close();
		System.out.println("Inserted Successfully::::");

        PreparedStatement queryFinalSubmit = null;
		queryFinalSubmit = connection.prepareStatement("update bpo_candidatesreg_details set FinalChkListSubmit=?,cand_Status=? where Bpo_Cand_Id=?");
		queryFinalSubmit.setInt(1,1);
		queryFinalSubmit.setInt(2,8);
		queryFinalSubmit.setString(3,canId);
		queryFinalSubmit.executeUpdate();
		queryFinalSubmit.close();
		System.out.println("Updated Successfully::::");

     }
		catch(Exception ex)
		{
		ex.printStackTrace();
		ex.getCause();
		}
			String CandidateFirstname=null;
			String CandidateEmail=null;
			String Phonenumber=null;
			String msgsms=null;
			int LocationId=0;
			Statement stmts=null;
			ResultSet rss = null;
			CallableStatement cs=null;
			try
			{
				connection=ConnectDatabase.getConnection();									
				stmts = connection.createStatement();
				String strProcedure="{call CandEmailPhone_Encrypt_Proc(?,?,?)}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=connection.prepareCall(strProcedure);
				cs.setInt(1,CandautoId);
		        cs.setString(2,EDKey);
		        cs.setString(3,EDKPass);
				rss=cs.executeQuery();
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
		if (rss.next())
		 {
			 CandidateFirstname=rss.getString("First_Name");
			 CandidateEmail=rss.getString("Email");
			 Phonenumber=rss.getString("Phone");
			 LocationId=rss.getInt("Location");
		 }
		 
		 //***************************////
		    String ContactPhoneNo=null;
		    String ContactEmailId=null;
		    String QueryRecConInfo= "select Contact_Phone_No,Contact_Email_Id from cand_query_contact_info where Center_Id='"+ LocationId + "'";
			System.out.println("QueryRecConInfo " + QueryRecConInfo);
			Statement stmtContactInfo = connection.createStatement();
			ResultSet rssContactInfo = stmtContactInfo.executeQuery(QueryRecConInfo);
		if (rssContactInfo.next())
		 {
			 ContactPhoneNo=rssContactInfo.getString("Contact_Phone_No");
			 ContactEmailId=rssContactInfo.getString("Contact_Email_Id");
		 }
		 ///*********************//////
		    String msg=null;
		    if(CheckList_Action==1)
		    {
		    msgsms="Congratulations!!! Your documents have been reviewed and accepted. We would request you to log into out career website and complete the final registration.";
		    msg="<HTML><BODY>Hi "+CandidateFirstname+",<br/><br/> Congratulations!!! Your documents have been reviewed and accepted. We would request you to log into out career website(http://careers-india.247-inc.com/) and complete the final registration. For any questions or clarifications please feel free to reach out to us on:<br/><b>Email:</b> '"+ContactEmailId+"'<br/><b>Phone:</b>'"+ContactPhoneNo+"'<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career";
		    SMSFunction.sendSMSFinalCheckList(Phonenumber,msgsms);
	        EmailDemo.sendMailNew(username1,password1,CandidateEmail,msg,subject);
            }
            else if(CheckList_Action==2)
            {
            msgsms="Your documents have been reviewed. <b>Please note: </b>"+HoldReason+", We would request you to log into out career website and recheck and resubmit the highligted documents.";
		    msg="<HTML><BODY>Hi "+CandidateFirstname+",<br/><br/>Your documents have been reviewed.  Please note: "+HoldReason+" We would request you to log into out career website(http://careers-india.247-inc.com/) and recheck and resubmit the highligted documents. For any questions or clarifications please feel free to reach out to us on:<br/><b>Email:</b> '"+ContactEmailId+"'<br/><b>Phone: </b>'"+ContactPhoneNo+"'<br/><br/>Regards,<br/>Team [24]7</BODY></HTML>";
		    String subject="[24]7 Career";
		    SMSFunction.sendSMSFinalCheckList(Phonenumber,msgsms);
	        EmailDemo.sendMailNew(username1,password1,CandidateEmail,msg,subject);
            }
            
session.setAttribute( "Bpo_Cand_Id", canId );
%>

<%
					rss.close();
			        stmts.close();
					rssContactInfo.close();
					stmtContactInfo.close();
					connection.close();
					
					
					
				 %>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BioRegSubmit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
   	alert('Check list done successfully, for this candidate !');
 	parent.location.href= "<%=recruitPath%>jsp/Final_Check_List.jsp";
  
  </script>
  </head>
  
  <body>
    
  </body>
</html>
