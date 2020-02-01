<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
try
{

String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
String userCentreName = "";
String centreAddress = ""; 
String User_Center_Id = ((String)session.getAttribute("User_Center_Id")).trim();
 if(User_Center_Id == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
Connection connection=ConnectDatabase.getConnection();
String qrycentrename = "select Centre_Name,Address from centre_master where Centre_Id = '"+User_Center_Id+"' and Is_Alive = 1";
Statement stmtCentrename = connection.createStatement();
ResultSet rsCentrename = stmtCentrename.executeQuery(qrycentrename);
 if(rsCentrename.next())
 {
 	userCentreName = rsCentrename.getString("Centre_Name");
 	centreAddress = rsCentrename.getString("Address");
 }
 else
 {
 	userCentreName = "NA";
 }
 rsCentrename.close();
 stmtCentrename.close();
String candidateID = (String) request.getParameter("CandidateId");
if(candidateID==null)
{
		response.sendRedirect("../247Recruit/jsp/SessionTimeout.jsp");
}
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				int familycount = 0;
				int familycountChild = 0;
                String Title = null;
                String firstname = null;
				String middlename = null;
				String lastName = null;
				String FullName = null;
				String firstLastName = null;
				String Gender = null;
				int programId = 0;
				int subProgramId = 0;
				String programName = null;
				String subProgramName = null;
				Date Cand_DOB = null;
				String DOB = null;
				String candAGE = null;
				String Day = null;
		        String Month = null;
		        String Year = null;
		        String currentDay = null;
		        String currentMonth = null;
		        String currentYear = null;
		        String dateMarriage = null;
				String marriageDay = null;
		        String marriageMonth = null;
		        String marriageYear = null;
				String cityOfBirth = null;
				int bloodGroupID = 0;
				String bloodGroup = "";
				int domicileStateId = 0;
				String domicileState = null;
				String panNo = null;
				int NationalityId = 0;
				String NationalityName = null;
				int CountryId = 0;
				String CountryName = null;
				String MaritalStatus = null;
				String MaritalStatusTxt = null;
				String Email = null;
				Date MarriageDate = null;
				String MarriageDateDisp = null;
				String PermanentAddress = null;
				int PermanentCityCode = 0;
				String PermanentCity = null;
				int PermanentStateCode = 0;
				String PermanentState = null;
				String PermanentPinCode = null;
				String PermanentPhoneNo = null;
				String Mother_Tongue_id = null;
				String Mother_Tongue = null;
				String candFHState = null;
				String candFHName = null;
				int Religion_Id= 0;
				String Religion_Name = null;
				String CurrentAddress = null;
				int CurrentCityCode = 0;
				String CurrentCity = null;
				String CurrentCityOther = null;
				int CurrentStateCode = 0;
				int Current_Area_Id = 0;
				String Current_Area_Name = null;
				String Current_LandMark = null;
				String CurrentState = null;
				String CurrentPinCode = null;
				String CurrentPhoneNo = null;
				String CurrentMobileNo = null;
				String EmergencyAddress = null;
				int EmergencyCityCode = 0;
				String EmergencyCity = null;
				int EmergencyStateCode = 0;
				String EmergencyState = null;
				int EmergencyCountryCode = 0;
				String EmergencyCountry = null;
				String EmergencyPinCode = null;
				String EmergencyPhoneNo = null;
				String EmergencyMobileNo = null;
				
				String primarySource = null;
				String secondarySource = null;
				String primarySourceInfo = null;
				String advertisementName = null;
				String ConsultancyName = null;
				String CurrDAte = null;
				String CurrDAteDisp = null;
				Statement stmt=null;
				ResultSet rs=null;
				String imagepath = null;
				String autoID = null;
				String Work_Experience = null;
				ResultSet rss = null;
				CallableStatement cs=null;
				CallableStatement csFamilyDtls = null;
				CallableStatement csEducationDtls = null;
				CallableStatement csWorkDtls = null;
				CallableStatement csLangDtls = null;
				CallableStatement csEmergencyDtls = null;
				CallableStatement csReferenceDtls = null;
				
				ArrayList<String> familyMemberNames = new ArrayList<String>();
				ArrayList<String> familyMemberRelationships = new ArrayList<String>();
				ArrayList<String> familyRealtionShipNames = new ArrayList<String>();
				ArrayList<String> familyMemberDOBs = new ArrayList<String>();
				ArrayList<String> familyMemberAges = new ArrayList<String>();
				ArrayList<String> familyMemberOccupations = new ArrayList<String>();
				String familyMemberName = null;
				String familyMemberRelationship = null;
				String familyRealtionShipName = null;
				String familyMemberAge = null;
				String familyMemberDOB = null;
				String familyMemberOccupation = null;
				
				ArrayList<String> familyMemberChildNames = new ArrayList<String>();
				ArrayList<String> familyMemberChildRelationships = new ArrayList<String>();
				ArrayList<String> familyRealtionShipChildNames = new ArrayList<String>();
				ArrayList<String> familyMemberChildDOBs = new ArrayList<String>();
				ArrayList<String> familyMemberChildAges = new ArrayList<String>();
				ArrayList<String> familyMemberChildOccupations = new ArrayList<String>();
				String familyMemberChildName = null;
				String familyMemberChildRelationship = null;
				String familyRealtionChildShipName = null;
				String familyMemberChildAge = null;
				String familyMemberChildDOB = null;
				String familyMemberChildOccupation = null;
				
				ArrayList<String> Educ_Institue_Names = new ArrayList<String>();
				ArrayList<String> Educ_Qualification_Courses = new ArrayList<String>();
				ArrayList<Integer> qualificationGroupID_Degrees = new ArrayList<Integer>();
				ArrayList<String> Educ_Year_of_Joinings = new ArrayList<String>();
				ArrayList<String> Educ_Year_of_Completions = new ArrayList<String>();
				ArrayList<String> Educ_Universitys = new ArrayList<String>();
				ArrayList<String> Educ_Class_In_Percentages = new ArrayList<String>();
				ArrayList<String> Educ_Specialization1s = new ArrayList<String>();
				ArrayList<String> Educ_Specialization2s = new ArrayList<String>();
				ArrayList<String> Educ_Edu_Grades = new ArrayList<String>();
				int qualificationGroupID_Degree = 0; 
				String Educ_Institue_Name = null;
				String Educ_Qualification_Course = null;
				String Educ_Year_of_Joining = null;
				String Educ_Year_of_Completion = null;
				String Educ_University = null;
				String Educ_Class_In_Percentage = null;
				String Educ_Specialization1 = null;
				String Educ_Specialization2 = null;
				String Edu_Grade = null;
				ArrayList<String> Work_CompanyNames = new ArrayList<String>();
				ArrayList<String> Work_Froms = new ArrayList<String>();
				ArrayList<String> Work_Tos = new ArrayList<String>();
				ArrayList<String> Work_Designations = new ArrayList<String>();
				ArrayList<String> Work_LeavingReasons = new ArrayList<String>();
				ArrayList<String> Work_SalaryDrawns = new ArrayList<String>();
				String Work_CompanyName = null;
				String Work_From = null;
				String Work_To = null;
				String Work_Designation = null;
				String Work_LeavingReason = null;
				String Work_SalaryDrawn = null;
				
				ArrayList<String> Languages_Names = new ArrayList<String>();
				ArrayList<String> Languages_RWS = new ArrayList<String>();
				String Language_ID = null;
				String Language_Name = null;
				String Language_RWS = null;
				
				ArrayList<String> Emergency_Contact_Names = new ArrayList<String>();
				ArrayList<String> Emergency_Realtionships = new ArrayList<String>();
				ArrayList<String> Emergency_Addresss = new ArrayList<String>();
				ArrayList<String> Emergency_Phone1s = new ArrayList<String>();
				ArrayList<String> Emergency_Phone2s = new ArrayList<String>();
				String Emergency_Contact_Name = null;
				String Emergency_Realtionship_Id = null;
				String Emergency_Realtionship = null;
				String Emergency_Address = null;
				String Emergency_Phone1 = null;
				String Emergency_Phone2 = null;
				
				ArrayList<String> Reference_Contact_Names = new ArrayList<String>();
				ArrayList<String> Reference_Addresss = new ArrayList<String>();
				ArrayList<String> Reference_Phone1s = new ArrayList<String>();
				String Reference_Contact_Name = null;
				String Reference_Contact_Name2 = null;
				String Reference_Address = null;
				String Reference_Address2 = null;
				String Reference_Phone1 = null;
				String Reference_Phone2 = null;
				
				connection=ConnectDatabase.getConnection();									
				String strProcedure="{call GetCandCompleteInfo(?,?,?)}"; 
				stmt = connection.createStatement();
				cs=connection.prepareCall(strProcedure);
				cs.setString(1,candidateID);
		        cs.setString(2,EDKey);
		        cs.setString(3,EDKPass);
				rs=cs.executeQuery();
			if (rs.next())
			 {
				autoID = rs.getString("AutoID");
				Title = rs.getString("Title");
				firstname = rs.getString("First_Name");
				firstname = firstname.toUpperCase();
				middlename = rs.getString("Middle_Name");
				middlename = middlename.toUpperCase();
				lastName = rs.getString("Last_Sir_Name");
				lastName = lastName.toUpperCase();
				firstLastName = firstname + " "+ lastName; 
				FullName = firstname + " "+ middlename + " " + lastName;
				Gender = rs.getString("Gender");
				Work_Experience = rs.getString("Work_Experience");
				Cand_DOB =  rs.getDate("Cand_DOB");
				String qrycandAGE = "select year(now()) - year('"+Cand_DOB+"') as age";
				rss = stmt.executeQuery(qrycandAGE);
				if(rss.next())
				{
				candAGE = rss.getString("age");
				}
				rss.close();
				DOB = formatter.format(Cand_DOB);
		        String[] DateDOB = DOB.split("-");
		        Day = DateDOB[0];
		        Month = DateDOB[1];
		        Year = DateDOB[2];
		        imagepath = rs.getString("ImagePath");
				cityOfBirth = rs.getString("CityOfBirth");
				cityOfBirth = cityOfBirth.toUpperCase();
				bloodGroupID = rs.getInt("BloodGroup");
				if(bloodGroupID != 0)
				{
					String qrybloodGroup = "SELECT bloodGroupName FROM mstbloodgroup where bloodGroupId ='"+bloodGroupID+"'";
					rss = stmt.executeQuery(qrybloodGroup);
					if(rss.next())
					{
						bloodGroup = rss.getString("bloodGroupName");
					}
					rss.close();
				}
				candFHState = rs.getString("Cand_FName_HName");
				candFHName = rs.getString("Cand_Father_Name");
				Mother_Tongue_id = rs.getString("Mother_tongue");
				String qrymotherTongue = "SELECT languageName FROM mstlanguage where languageId ='"+Mother_Tongue_id+"'";
				rss = stmt.executeQuery(qrymotherTongue);
				if(rss.next())
				{
					Mother_Tongue = rss.getString("languageName");
				}
				rss.close();
				programId = rs.getInt("Program");
				String qryProgramName = "Select ProgramName from mstprogram where ProgramId = '"+programId+"'";
				rss = stmt.executeQuery(qryProgramName);
				if(rss.next())
				{
					programName = rss.getString("ProgramName");
				}
				rss.close();
				subProgramId = rs.getInt("SubProgram");
				String qrysubProgramName = "Select SubProgramName from mstsubprogram where SubProgramId = '"+subProgramId+"'";
				rss = stmt.executeQuery(qrysubProgramName);
				if(rss.next())
				{
					subProgramName = rss.getString("SubProgramName");
				}
				rss.close();
				Religion_Id= rs.getInt("Religion");
				String qryReligion = "Select religionName from mstreligion where religionId = '"+Religion_Id+"'";
				rss = stmt.executeQuery(qryReligion);
				if(rss.next())
				{
					Religion_Name = rss.getString("religionName");
				}
				rss.close();
				domicileStateId = rs.getInt("DomicileState");
				if(domicileStateId != 0)
				{
				String qrydomicileState = "SELECT stateName FROM mststate WHERE stateId ='"+domicileStateId+"'";
				rss = stmt.executeQuery(qrydomicileState);
				if(rss.next())
				{
					domicileState = rss.getString("stateName");
					domicileState = domicileState.toUpperCase();
				}
				rss.close();
				}
				else
				{
				domicileState = "";
				}
				CountryId = rs.getInt("CountryOfBirth");
				if(CountryId != 0)
				{
					String qryCountry = "SELECT countryName FROM mstcountry where countryId = '"+CountryId+"'";
					rss = stmt.executeQuery(qryCountry);
					if(rss.next())
					{
					CountryName = rss.getString("countryName");
					CountryName = CountryName.toUpperCase();
					}
				rss.close();
				}
				else
				{
					CountryName = "";
				}
				panNo = rs.getString("PanNo");
				panNo = panNo.toUpperCase();
				NationalityId =  rs.getInt("NationalityId");
				String qryNationality = "select nationalityName from mstnationality where nationalityid = '"+NationalityId+"'";
				rss = stmt.executeQuery(qryNationality);
				if(rss.next())
				{
					NationalityName = rss.getString("nationalityName");
					NationalityName = NationalityName.toUpperCase();
				}
				rss.close();
				try
				{
					MaritalStatus = rs.getString("MaritalStatus");
					if(MaritalStatus.equalsIgnoreCase("Y"))
					{
					dateMarriage = rs.getString("MarriageDate");
					if(!dateMarriage.equalsIgnoreCase(""))
					{
						MarriageDate = dateFormat.parse(dateMarriage);
						MarriageDateDisp = formatter.format(MarriageDate);
				        String[] DateMarriage = MarriageDateDisp.split("-");
				        marriageDay = DateMarriage[0];
				        marriageMonth = DateMarriage[1];
				        marriageYear = DateMarriage[2];
			        }
						MaritalStatusTxt = "MARRIED";
					}
					else
					{
						MaritalStatusTxt = "SINGLE";
					}
				}
				catch(Exception ee)
				{
				ee.printStackTrace();
				}
				Email = rs.getString("Email");
				PermanentAddress = rs.getString("PermanentAddress");
				PermanentCityCode = rs.getInt("PermanentCity");
				if(PermanentCityCode != 0)
				{
				String qryPermanentCity = "SELECT cityName FROM mstcity where cityId = '"+PermanentCityCode+"'";
				rss = stmt.executeQuery(qryPermanentCity);
				if(rss.next())
				{
					PermanentCity = rss.getString("cityName");
					PermanentCity = PermanentCity.toUpperCase();
				}
				rss.close();
				}
				else
				{
				PermanentCity = "";
				}
				PermanentStateCode = rs.getInt("PermanentState");
				String qryPermanentState = "SELECT stateName FROM mststate where StateId = '"+PermanentStateCode+"'";
				rss = stmt.executeQuery(qryPermanentState);
				if(rss.next())
				{
					PermanentState = rss.getString("stateName");
					PermanentState = PermanentState.toUpperCase();
				}
				rss.close();
				
				PermanentPinCode = rs.getString("PermanentPinCode");
				PermanentPhoneNo = rs.getString("PermanentPhoneNo");
				CurrentAddress = rs.getString("CurrentAddress");
				CurrentCityCode = rs.getInt("CurrentCity");
				if(CurrentCityCode != 0)
				{
					String qryCurrentCity = "SELECT cityName FROM mstcity where cityId = '"+CurrentCityCode+"'";
					rss = stmt.executeQuery(qryCurrentCity);
					if(rss.next())
					{
						CurrentCity = rss.getString("cityName");
						CurrentCity = CurrentCity.toUpperCase();
					}
					rss.close();
				}
				if(CurrentCityCode == 0)
				{
					CurrentCityOther = rs.getString("CurrentCityOther");
				}
				CurrentStateCode = rs.getInt("CurrentState");
				String qryCurrentState = "SELECT stateName FROM mststate where StateId = '"+CurrentStateCode+"'";
				rss = stmt.executeQuery(qryCurrentState);
				if(rss.next())
				{
					CurrentState = rss.getString("stateName");
					CurrentState = CurrentState.toUpperCase();
				}
				rss.close();
				Current_Area_Id = rs.getInt("Current_Area");
				String qryCurrentArea = "select areaName from mstarea where areaid =  '"+Current_Area_Id+"'";
				rss = stmt.executeQuery(qryCurrentArea);
				if(rss.next())
				{
					Current_Area_Name = rss.getString("areaName");
				}
				rss.close();
				Current_LandMark = rs.getString("Current_LandMark");
				CurrentPinCode = rs.getString("CurrentPinCode");
				CurrentPhoneNo = rs.getString("CurrentPhoneNo");
				CurrentMobileNo = rs.getString("CurrentMobileNo");
				EmergencyAddress = rs.getString("EmergencyAddress");
				EmergencyCityCode = rs.getInt("EmergencyCity");
				if(EmergencyCityCode != 0)
				{
					String qryEmergencyCity = "SELECT cityName FROM mstcity where cityId = '"+EmergencyCityCode+"'";
					rss = stmt.executeQuery(qryEmergencyCity);
					if(rss.next())
					{
					EmergencyCity = rss.getString("cityName");
					EmergencyCity = EmergencyCity.toUpperCase();
					}
				rss.close();
				}
				EmergencyStateCode = rs.getInt("EmergencyState");
				String qryEmergencyState = "SELECT stateName FROM mststate where StateId = '"+EmergencyStateCode+"'";
				rss = stmt.executeQuery(qryEmergencyState);
				if(rss.next())
				{
					EmergencyState = rss.getString("stateName");
				}
				rss.close();
				EmergencyCountryCode = rs.getInt("EmergencyCountry");
				String qryEmergencyCountry = "SELECT countryName FROM mstcountry where countryId = '"+EmergencyCountryCode+"'";
				rss = stmt.executeQuery(qryEmergencyCountry);
				if(rss.next())
				{
					EmergencyCountry = rss.getString("countryName");
				}
				rss.close();
				EmergencyPinCode = rs.getString("EmergencyPinCode");
				EmergencyPhoneNo = rs.getString("EmergencyPhone");
				EmergencyMobileNo = rs.getString("EmergencyMobile");
				primarySource = rs.getString("Primary_Source");
				secondarySource = rs.getString("Secondary_Source");
				if(!primarySource.equalsIgnoreCase("6"))
				{
					primarySourceInfo = rs.getString("Primary_Source_Info");
				}
				else
				{
					String qryprimarySrcInfo = "SELECT Other FROM prisource_other where User_id = '"+autoID+"'";
					rss = stmt.executeQuery(qryprimarySrcInfo);
					if(rss.next())
					{
					primarySourceInfo = rss.getString("Other");
					}
					rss.close();
				}
				String strFamilyDtls="{call GetCandFamilyInfo(?,?,?,?)}"; 
				csFamilyDtls=connection.prepareCall(strFamilyDtls);
				csFamilyDtls.setString(1,autoID);
				csFamilyDtls.setInt(2,1);
		        csFamilyDtls.setString(3,EDKey);
		        csFamilyDtls.setString(4,EDKPass);
				rss =csFamilyDtls.executeQuery();
				rss.last();
				familycount = rss.getRow();
				rss.beforeFirst();
				while(rss.next())
				{
					familyMemberName = rss.getString("Family_BG_Member_Name");
					familyMemberNames.add(familyMemberName);
					familyMemberRelationship = rss.getString("Family_BG_Relationship");
					familyMemberRelationships.add(familyMemberRelationship);
					String QueryFamilyRelationName = "select relationshipname from mstrelationship where relationshipId =  '"+familyMemberRelationship+"'";
					Statement stmtRelationshipName = connection.createStatement();
					ResultSet rsRelationshipName = stmtRelationshipName.executeQuery(QueryFamilyRelationName);
				   if (rsRelationshipName.next()) 
				    {
						familyRealtionShipName = rsRelationshipName.getString("relationshipname");
					}
					familyRealtionShipNames.add(familyRealtionShipName);
					rsRelationshipName.close();
					stmtRelationshipName.close();
					familyMemberAge = rss.getString("Family_BG_AGE");
					familyMemberAges.add(familyMemberAge);
				    familyMemberDOB = rss.getString("Family_BG_DOB");
				    if(!familyMemberDOB.equals(""))
				    {
				    Date date = dateFormat.parse(familyMemberDOB);
					familyMemberDOB = formatter.format(date);
					}
					familyMemberDOBs.add(familyMemberDOB);
					familyMemberOccupation = rss.getString("Cand_Family_BG_Occupation");
					familyMemberOccupations.add(familyMemberOccupation);
				}
				csFamilyDtls.close();
				rss.close();
				
				String strFamilyChdlDtls = "{call GetCandFamilyInfo(?,?,?,?)}"; 
				csFamilyDtls=connection.prepareCall(strFamilyChdlDtls);
				csFamilyDtls.setString(1,autoID);
				csFamilyDtls.setInt(2,2);
		        csFamilyDtls.setString(3,EDKey);
		        csFamilyDtls.setString(4,EDKPass);
				rss =csFamilyDtls.executeQuery();
				rss.last();
				familycountChild = rss.getRow();
				rss.beforeFirst();
				while(rss.next())
				{
					familyMemberChildName  = rss.getString("Family_BG_Member_Name");
					familyMemberChildNames.add(familyMemberChildName);
					familyMemberChildRelationship = rss.getString("Family_BG_Relationship");
					familyMemberChildRelationships.add(familyMemberChildRelationship);
					String QueryFamilyChildRelationName = "select relationshipname from mstrelationship where relationshipId =  '"+familyMemberChildRelationship+"'";
					Statement stmtRelationshipName = connection.createStatement();
					ResultSet rsRelationshipName = stmtRelationshipName.executeQuery(QueryFamilyChildRelationName);
				   if (rsRelationshipName.next()) 
				    {
						familyRealtionChildShipName = rsRelationshipName.getString("relationshipname");
					}
					familyRealtionShipChildNames.add(familyRealtionChildShipName);
					rsRelationshipName.close();
					stmtRelationshipName.close();
					familyMemberChildAge = rss.getString("Family_BG_AGE");
					familyMemberChildAges.add(familyMemberChildAge);
				    familyMemberChildDOB = rss.getString("Family_BG_DOB");
				    if(!familyMemberChildDOB.equals(""))
				    {
					    Date date = dateFormat.parse(familyMemberChildDOB);
						familyMemberChildDOB = formatter.format(date);
					}
					familyMemberChildDOBs.add(familyMemberChildDOB);
					familyMemberChildOccupation = rss.getString("Cand_Family_BG_Occupation");
					familyMemberChildOccupations.add(familyMemberChildOccupation);
				}
				csFamilyDtls.close();
				rss.close();
				
				ResultSet rseducqlftn = null;
				String strEducationDtls="{call GetCandEducationInfo(?,?,?)}"; 
				csEducationDtls=connection.prepareCall(strEducationDtls);
				csEducationDtls.setString(1,autoID);
		        csEducationDtls.setString(2,EDKey);
		        csEducationDtls.setString(3,EDKPass);
				rss = csEducationDtls.executeQuery();
				while(rss.next())
				{
					Educ_Institue_Name = rss.getString("Edu_Institue_Name");
					Educ_Institue_Names.add(Educ_Institue_Name);
					Educ_Qualification_Course = rss.getString("Qualification_Course");
					Educ_Qualification_Courses.add(Educ_Qualification_Course);
					String qryeducqlftn = "select QualificationGroupId from mstqualification where qualificationid='"+Educ_Qualification_Course+"'"; 
					rseducqlftn = stmt.executeQuery(qryeducqlftn);
					if(rseducqlftn.next())
					{
						qualificationGroupID_Degree = rseducqlftn.getInt("QualificationGroupId");
						qualificationGroupID_Degrees.add(qualificationGroupID_Degree);
					}
					rseducqlftn.close();
					Educ_Year_of_Joining = rss.getString("Edu_Year_Of_Joining");
					Educ_Year_of_Joinings.add(Educ_Year_of_Joining);
				    Educ_Year_of_Completion = rss.getString("Edu_Year_Of_Completion");
					Educ_Year_of_Completions.add(Educ_Year_of_Completion);
				    Educ_University = rss.getString("University");
					Educ_Universitys.add(Educ_University);
				    Educ_Class_In_Percentage = rss.getString("Class_In_Percentage");
					Educ_Class_In_Percentages.add(Educ_Class_In_Percentage);
				    Educ_Specialization1 = rss.getString("Specialization1");
					Educ_Specialization1s.add(Educ_Specialization1);
				    Educ_Specialization2 = rss.getString("Specialization2");
					Educ_Specialization2s.add(Educ_Specialization1);
				    Edu_Grade = rss.getString("Edu_Grade");
					Educ_Edu_Grades.add(Edu_Grade);
				}
				csEducationDtls.close();
				rss.close();
				String strWorkDtls="{call GetCandWorkInfo(?,?,?)}"; 
				csWorkDtls=connection.prepareCall(strWorkDtls);
				csWorkDtls.setString(1,autoID);
		        csWorkDtls.setString(2,EDKey);
		        csWorkDtls.setString(3,EDKPass);
				rss = csWorkDtls.executeQuery();
				while(rss.next())
				{
					Work_CompanyName = rss.getString("CompanyName");
					Work_CompanyNames.add(Work_CompanyName);
					Work_From = rss.getString("DurationFrom");
					Date Work_Fromdate = null;
					String Works_From = "";
					if(!Work_From.equalsIgnoreCase(""))
					{
					Work_Fromdate = dateFormat.parse(Work_From);
					Works_From = formatter.format(Work_Fromdate);
					}
					Work_Froms.add(Works_From);
					Work_To = rss.getString("DurationTo");
					Date Work_Todate = null;
					String Works_To = "";
					if(!Work_To.equalsIgnoreCase(""))
					{
					Work_Todate = dateFormat.parse(Work_To);
					Works_To = formatter.format(Work_Todate);
					}
					Work_Tos.add(Works_To);
					Work_Designation = rss.getString("Designation");
					Work_Designations.add(Work_Designation);
				    Work_LeavingReason = rss.getString("LeavingReason");
					Work_LeavingReasons.add(Work_LeavingReason);
					Work_SalaryDrawn = rss.getString("Salary");
					Work_SalaryDrawns.add(Work_SalaryDrawn);
				}
				csWorkDtls.close();
				rss.close();
				
				ResultSet rslangname = null;
				String strLanguageDtls="{call GetCandLangInfo(?,?,?)}"; 
				csLangDtls=connection.prepareCall(strLanguageDtls);
				csLangDtls.setString(1,autoID);
		        csLangDtls.setString(2,EDKey);
		        csLangDtls.setString(3,EDKPass);
				rss = csLangDtls.executeQuery();
				while(rss.next())
				{
					Language_ID = rss.getString("Language_Name");
					String QueryLangName = "SELECT languageName FROM mstlanguage where languageId = '"+Language_ID+"'";
					rslangname = stmt.executeQuery(QueryLangName);
				   if (rslangname.next()) 
				    {
						Language_Name = rslangname.getString("languageName");
					}
					rslangname.close();
					Languages_Names.add(Language_Name);
					Language_RWS = rss.getString("Lang_RWS");
					Languages_RWS.add(Language_RWS);
				}
				
				rss.close();
				csLangDtls.close();
				
				ResultSet rsEmergencyname = null;
				String strEmergencyDtls="{call GetCandEmergencyInfo(?,?,?)}"; 
				csEmergencyDtls=connection.prepareCall(strEmergencyDtls);
				csEmergencyDtls.setString(1,autoID);
		        csEmergencyDtls.setString(2,EDKey);
		        csEmergencyDtls.setString(3,EDKPass);
				rss = csEmergencyDtls.executeQuery();
				while(rss.next())
				{
					Emergency_Realtionship_Id = rss.getString("Cand_Em_Con_Relationship");
					String QueryEmergencyName = "select relationshipname from mstrelationship where relationshipId =  '"+Emergency_Realtionship_Id+"'";
					rsEmergencyname = stmt.executeQuery(QueryEmergencyName);
				   if (rsEmergencyname.next()) 
				    {
					Emergency_Realtionship = rsEmergencyname.getString("relationshipname");
					}
					rsEmergencyname.close();
					Emergency_Realtionships.add(Emergency_Realtionship);
				Emergency_Contact_Name = rss.getString("Contact_Name");
			    Emergency_Contact_Names.add(Emergency_Contact_Name);
				Emergency_Address = rss.getString("Address");
			    Emergency_Addresss.add(Emergency_Address);
			    Emergency_Phone1 = rss.getString("Phone1");
			    Emergency_Phone1s.add(Emergency_Phone1);
				Emergency_Phone2 = rss.getString("Phone2");
			    Emergency_Phone2s.add(Emergency_Phone2);
				}
				rss.close();
				csEmergencyDtls.close();
				
				String strReferenceDtls="{call GetCandReferenceInfo(?,?,?)}"; 
				csReferenceDtls=connection.prepareCall(strReferenceDtls);
				csReferenceDtls.setString(1,autoID);
		        csReferenceDtls.setString(2,EDKey);
		        csReferenceDtls.setString(3,EDKPass);
				rss = csReferenceDtls.executeQuery();
				while(rss.next())
				{
					Reference_Contact_Name = rss.getString("Reference_Name1");
					Reference_Contact_Names.add(Reference_Contact_Name);
					Reference_Contact_Name2 = rss.getString("Reference_Name2");
					Reference_Contact_Names.add(Reference_Contact_Name2);
					Reference_Address = rss.getString("Ref_Address1");
					Reference_Addresss.add(Reference_Address);
					Reference_Address2 = rss.getString("Ref_Address2");
					Reference_Addresss.add(Reference_Address2);
					Reference_Phone1 = rss.getString("Ref_Phone1");
				    Reference_Phone1s.add(Reference_Phone1);
				    Reference_Phone2 = rss.getString("Ref_Phone2");
				    Reference_Phone1s.add(Reference_Phone2);
				}
				rss.close();
				csReferenceDtls.close();
				String insertQuery = "SELECT CURDATE()";
				rss = stmt.executeQuery(insertQuery);
			if (rss.next()) 
			  {
				CurrDAte = rss.getString(1);
				Date date = dateFormat.parse(CurrDAte);
				CurrDAteDisp = formatter.format(date);
				String[] currentDate = CurrDAteDisp.split("-");
		        currentDay = currentDate[0];
		        currentMonth = currentDate[1];
		        currentYear = currentDate[2];
			  }
			  rss.close();
		    } 
		    String ValidatedOn = null;
			int ResumeChk = 0;
			int PhotosChk = 0;
			int IdProofChk = 0;
			int AddressProofChk = 0;
			int DOBchk = 0; 
			int EducationChk = 0; 
			int Experience1Chk = 0; 
			int Experience2Chk = 0; 
			int Experience3Chk = 0; 
			int PaySlipChk = 0; 
			int TransportChk = 0; 
		    String getValidatedInfo = "select * from validate_candidate_offer_master where CandidateID = '"+candidateID+"'";
			rs = stmt.executeQuery(getValidatedInfo);
			if(rs.next())
			{
			Date Validated_On = rs.getDate("Validate_On"); 
			ValidatedOn = formatter.format(Validated_On); 
			ResumeChk = rs.getInt("ResumeChk");
			PhotosChk = rs.getInt("PhotosChk");
			IdProofChk = rs.getInt("IdProofChk");
			AddressProofChk = rs.getInt("AddressProofChk");
			DOBchk = rs.getInt("DOBchk"); 
			EducationChk = rs.getInt("EducationChk"); 
			Experience1Chk = rs.getInt("Experience1Chk"); 
			Experience2Chk = rs.getInt("Experience2Chk"); 
			Experience3Chk = rs.getInt("Experience3Chk"); 
			PaySlipChk = rs.getInt("PaySlipChk"); 
			TransportChk = rs.getInt("TransportChk"); 
			}
			rs.close();
			
		    
 %>

<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Candidate_Complete_Info">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	
<style>
	.break  
	    {
			page-break-after : always;
	    }
	@page
		{
			 /*size: auto;   auto is the initial value */
			margin: 0mm; /* this affects the margin in the printer settings */
	    }
	.fontsize
	{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 12px;
		font-weight: bold;
	}
	.fontsizeInput
	{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 12px;
		font-weight: normal;
	}
	.fontsizeInputSmallest
	{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 11px;
		font-weight: normal;
	}
	.fontsizeSmall
	{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 10px;
		font-weight: bold;
	}
	.fontsizeBig
	{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 14px;
		font-weight: bolder;
	}
	.borderbottom
	{
		border-bottom:1px solid black;
	}
	.borderrightBottom
	{
		border-bottom:1px solid black;
		border-right:1px solid black;
	}
	.bordertopBottomright
	{
		border-top:1px solid black;
		border-bottom:1px solid black;
		border-right:1px solid black;
	}
</style>
  </head>
  
   <body  onload="window.print()">
   		<div class="break" style="width: 100%;" align="center">
	   		<table border="0"  width="820"  height="1000"  cellpadding="0" cellspacing="0" align="center">
	   		<tr>
	   		  <td align="center">
	   		     <img src="<%=recruitPath%>images/01.jpg" width="820">
	   		  </td>
	   		</tr>
	   		</table>
	    </div>
   		<div class="break" style="width: 100%;" align="center">
	       <table border="0" width="820" height="1000"  cellpadding="0" cellspacing="0" align="center">
			  <tr>
				  <td style="height: 35px;">&nbsp;</td>
			  </tr>
		   		<tr>
				    <td align="center"> 
					  <font style="font-family: Arial,Helvetica,sans-serif;font-size: 19px;font-weight: bold">CHECKLIST - EMPLOYEE FILE</font>
					</td>
				</tr>
			  <tr>
				  <td style="height: 35px;">&nbsp;</td>
			  </tr>
		   		<tr>
			   		<td align="center">
			   			 <table width="750" height="700" rules="all" style="border:1px solid black;background-color:white;margin:0;">
							<tr>
							    <td style="border:1px solid black;margin:0;border-top:1px solid black;margin:0 ;font-family: Arial,Helvetica,sans-serif;padding-left: 15px;font-size: 14px;" width="100" align="left"><b>Sl.No.</b></td>
								<td style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;padding-left: 15px;font-size: 14px;" width="400" align="left"><b>DOCUMENTS</b></td>
								<td style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;" width="100" align="center"><b>YES / NO</b></td>
								<td style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;padding-left: 15px;font-size: 14px;" width="200" align="left"><b>COMMENTS</b></td>
							</tr>
							<%
							int i=1;
							int Doc_Id = 0;
							String Doc_AvailableDISP = "";
							connection=ConnectDatabase.getConnection();	
							String queryForDocs="select * from candidate_documents_master where Is_Alive = 1"; 
							rss =stmt.executeQuery(queryForDocs);
							while(rss.next())
					         {
					        	int DocType = rss.getInt("Cand_Doc_Id");
					        	if(DocType == 1)
					        	{
					        		Doc_Id = ResumeChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 2)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 3)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 4)
					        	{
					        		Doc_Id = DOBchk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 5)
					        	{
					        		Doc_Id = EducationChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 6)
					        	{
					        		Doc_Id = Experience1Chk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 7)
					        	{
					        		Doc_Id = PaySlipChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 8)
					        	{
					        		Doc_Id = AddressProofChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 9)
					        	{
					        		Doc_Id = IdProofChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 10)
					        	{
					        		Doc_Id = TransportChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        	if(DocType == 11)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 12)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 13)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 14)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 15)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 16)
					        	{
					        		Doc_AvailableDISP = "";
					        	}
					        	if(DocType == 17)
					        	{
					        		Doc_Id = PhotosChk;
					        		if(Doc_Id == 1)
					        		{
					        			Doc_AvailableDISP = "Yes";
					        		}
					        		else if(Doc_Id == 2)
					        		{
					        			Doc_AvailableDISP = "No";
					        		}
					        		else
					        		{
					        			Doc_AvailableDISP = "";
					        		}
					        	}
					        %>
					        <tr id="<%=i%>" >
								<td align="left"  style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;padding-left: 15px;font-size: 14px;">
									<b> <%=i %> </b>
								</td>
								<td  style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;padding-left: 15px;font-size: 14px;">
									<b> <%=rss.getString("Document_name")%> </b>
								</td>
								<td align="center"  style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;">
									<%=Doc_AvailableDISP %>
								</td>
								<td align="left"  style="border:1px solid black;margin:0;font-family: Arial,Helvetica,sans-serif;font-size: 14px;">
								  &nbsp;
								</td>
						  </tr>
								<%
								i = i+1;
								
								}%>
					</table>
				  </td>
			  </tr>
			  <tr>
				  <td style="height: 45px;">&nbsp;</td>
			  </tr>
			   	<tr>
				  <td align="center">
				     <table width="750">
					       <tr>
					          <td style="width: 30px;"></td>
					          <td style="width: 60px;"></td>
					          <td style="width: 15px;"></td>
					          <td style="width: 210px;"></td>
					          <td style="width: 215px;"></td>
					          <td style="width: 30px;"></td>
					          <td style="width: 19px;"></td>
					          <td style="width: 0px;"></td>
					          <td style="width: 240px;"></td>
					       </tr>
					       <tr>
					          <td colspan="2" align="left" nowrap="nowrap">
					               <font class="fontsize"> 
					                 Employee Name : 
					                </font>
					          </td>
					          <td class="fontsizeInput" colspan="2" align="left" style="border-bottom: thin solid;">
					           <%=FullName %>
					          </td>
					          <td></td>
					          <td colspan="2" align="left" nowrap="nowrap">
					              <font class="fontsize"> 
					                 HR Name: 
					               </font>
					          </td>
					          <td colspan="2" align="left" style="border-bottom: thin solid;">
					          &nbsp;
					          </td>
					       </tr>
						  <tr>
							  <td colspan="9" style="height: 15px;"></td>
						  </tr>
					       <tr>
					          <td colspan="3" align="left" nowrap="nowrap">
					               <font class="fontsize"> 
					                 Employee Signature : 
					               </font>
					          </td>
					          <td align="left" style="border-bottom: thin solid;">
					          &nbsp;
					          </td>
					          <td></td>
					          <td colspan="3" align="left" nowrap="nowrap">
					              <font class="fontsize"> 
					               Signature: 
					               </font>
					          </td>
					          <td align="left" style="border-bottom: thin solid;">
					          &nbsp;
					          </td>
					       </tr>
						  <tr>
							  <td colspan="9" style="height: 15px;"></td>
						  </tr>
					       <tr>
					          <td align="left" nowrap="nowrap">
					              <font class="fontsize"> 
					               Date : 
                                  </font>
					          </td>
					          <td class="fontsizeInput" colspan="3" align="left" style="border-bottom: thin solid;">
					          <%=CurrDAteDisp %>
					          </td>
					          <td></td>
					          <td align="left" nowrap="nowrap">
					            <font class="fontsize"> 
					             Date : 
					            </font>
					          </td>
					          <td class="fontsizeInput" colspan="3" align="left" style="border-bottom: thin solid;">
					           <%=CurrDAteDisp %>
					          </td>
					       </tr>
				     </table>
				  </td>
				</tr>	
			  <tr>
				  <td style="height: 45px;">&nbsp;</td>
			  </tr>
				<tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				  <td style="height: 5px;">&nbsp;</td>
			  </tr>
			</table>
   		</div>
   		<div class="break" style="width: 100%;" align="center">
	       <table border="0" width="820" height="1000" cellpadding="0" cellspacing="0">
			  <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
	   		  <tr>
				  <td align="center">
				     <table width="750">
					    <tr>
				   		     <td align="left">
				                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
				             </td>
		             		<td align="center" valign="middle" >
		             			<font style="font-family: arial,sans-serif;font-size: 25px;font-weight: bold"> <u> EMPLOYEE INFORMATION </u> </font>
		             		 </td>
				   		     <td rowspan="2" align="right">
				   		          <%
			                     if(imagepath==null)
			           		     {
			            	      %>
				            	   <img src="<%=recruitPath%>images/default_person.jpg" width="100" height="120" alt="image" />
					             <%
					             }
			            		else
			            		{
			            	    %>
								<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candidateID%>" width="100" height="120" alt="image" />
				   		       <%
				   		       }
				   		        %>
				   		     </td>
		             	 </tr>
		             	<tr>
		             		 <td></td>
		             		 <td align="center" valign="middle" style="height: 25px;">
			   		    		 <font style="font-family: arial,sans-serif;font-size: 16px;"><b>PERSONAL DETAILS</b> please fill the form in <b>BLOCK LETTERS</b> only</font>
			   		    	 </td>
		             	</tr>	             	
	             	</table> 
	             </td>
			  </tr>
	   		  <tr>
				  <td align="center">
		            <table width="750" cellspacing="0" cellpadding="6" style="border:1px solid black;">
				      <tr class="fontsize">
                        <td width="243">
                          Full Name: <%=Title %>
                         </td>
				        <td width="163" class="fontsizeInput">
				         <%=firstname %>
				        </td>
				        <td width="192" class="fontsizeInput">
				         <%=middlename %>
				        </td>
				        <td width="186" class="fontsizeInput">
				        <%=lastName %>
				        </td>
                      </tr>
				      <tr class="fontsize">
				        <td>
				             Block Letters
                        </td>
				        <td style=" border-bottom:1px solid black;border-top:1px solid black;">
				            First Name
				        </td>
				        <td style=" border-bottom:1px solid black;border-top:1px solid black;">
				            Middle Name
				        </td>
				        <td style=" border-bottom:1px solid black;border-top:1px solid black;">
				            Last Name
				        </td>
				      </tr>
					  <tr class="fontsize" >
				        <td  style=" border-right:1px solid black;border-top:1px solid black;border-bottom:1px solid black;">
				           Designation at the time of Joining 24/7 : 
				        </td>
				        <td class="borderbottom">
				           __________________
				        </td>
				        <td class="borderbottom">
				            Gender  : 
				        </td>
				        <td class="borderbottom">
				           <table>
				             <tr class="fontsize" >
				               <td width="25" height="25" style="border:1px solid black;" align="center">&nbsp;
				                 <%if(Gender.equalsIgnoreCase("Male")) {%>
				                 <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
				                 <%} %>
				               </td>
				               <td>
				                <p>Male</p>
				               </td>
				              <td width="25" height="25" style="border:1px solid black;">&nbsp;
				              <%if(Gender.equalsIgnoreCase("Female")) {%>
				                <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
				              <%} %>
				              </td>
				              <td>
				               <p>Female</p>
				              </td>
				             </tr>
				           </table>
				        </td>
				      </tr>
				      <tr class="fontsize">
				        <td class="borderbottom">
				         Date of Birth : 
				       </td>
				        <td  class="fontsizeInput" style=" border-bottom:1px solid black; border-right:1px solid black;">
				           <%=Day %> / <%=Month %> / <%=Year %>&nbsp;
				        </td>
				        <td class="borderbottom">
				               City of Birth : 
				       </td>
				        <td style=" border-bottom:1px solid black;" class="fontsizeInput">
				             <%=cityOfBirth %>
				             &nbsp;
				        </td>
				      </tr>
				      <tr class="fontsize">
				        <td  class="fontsize" style=" border-bottom:1px solid black;">
				             Blood Group :
				       </td>
				        <td class="fontsizeInput" style=" border-bottom:1px solid black;border-right:1px solid black;">
				          <%=bloodGroup %>&nbsp;
				        </td>
				        <td class="borderbottom">
				             Domicile (State of Birth) :
				       </td>
				        <td style=" border-bottom:1px solid black;" class="fontsizeInput">
				            <%= domicileState %>&nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style=" border-bottom:1px solid black;">
				              Pan No.
				       </td>
				        <td  class="fontsizeInput" style=" border-bottom:1px solid black; border-right:1px solid black;">
				               <%=panNo %>&nbsp;
				        </td>
				        <td class="fontsize" style=" border-bottom:1px solid black;">
				             Nationality :
				        <td style=" border-bottom:1px solid black;" class="fontsizeInput">
				            <%=NationalityName %>&nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td class="fontsize">
				              Marital Status:
				        </td>
				        <td  class="fontsizeInput" style="border-right:1px solid black;">
				              <%=MaritalStatusTxt %>&nbsp;
				        </td>
				        <td rowspan="3" valign="top">
				               <table>
				                <tr>
				                  <td valign="top" class="fontsize">
				                  	Personal Email ID :
				                  </td>
				                </tr>
				                <tr>
				                  <td  class="fontsizeInput" valign="bottom" style="border-bottom:1px solid black;">
				                  	 <%=Email%>&nbsp;
				                  </td>
				                </tr>
				               </table>
				        </td>
				      </tr>
				      <tr>
				        <td class="fontsize">
				               Marriage Date(If Married)
				       </td>
				        <td class="fontsizeInput" style="border-right:1px solid black;">
		                  <%if(dateMarriage != null) { %>
		                  <%=marriageDay %> - <%=marriageMonth %> - <%=marriageYear %>
		                  <%} else {%>
		                  &nbsp; ___/___/_____ &nbsp;
		                  <%} %>
				        </td>
				      </tr>
				      <tr class="fontsize">
				        <td>
				               No Of Children :
				        </td>
				        <td style="border-right:1px solid black;">
				               &nbsp;
				        </td>
				      </tr>
                   </table>
                 <td>
                </tr> 
                <tr>
				  <td align="center">
                   <table width="750" border="0" cellspacing="0" cellpadding="4">
				      <tr >
				        <td class="fontsize" width="270" style="border-bottom:1px solid black;border-left:1px solid black;">
				               Permanent Residential Address : 
				        </td>
				        <td colspan="5" class="borderrightBottom">
				                 <%=PermanentAddress %>
				         </td>
				      </tr>
				      <tr>
				        <td class="fontsize" colspan="3" style="border-bottom:1px solid black;border-left:1px solid black;" align="right">
				          City
				        </td>
				        <td colspan="3" style="border-bottom:1px solid black;border-right:1px solid black;" class="fontsizeInput">
				                <%=PermanentCity %>&nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				          State
				        </td>
				        <td width="109" style="border-bottom:1px solid black;" class="fontsizeInput">
				             <%=PermanentState %>&nbsp;
				        </td>
				        <td class="fontsize" width="106" style="border-bottom:1px solid black;">
				             Country
				        </td>
				        <td width="98" style="border-bottom:1px solid black;" class="fontsizeInput">
				            <%=CountryName %>&nbsp;
				        </td>
				        <td class="fontsize" width="148" style="border-bottom:1px solid black;">
				            Pin Code 
				         </td>
				        <td width="231" class="borderrightBottom">
				             <%=PermanentPinCode %>&nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				             Phone
				         </td>
				        <td colspan="2" class="borderbottom">
				            <%if(!PermanentPhoneNo.equals("")) {%>
				           <%=PermanentPhoneNo %>
				            <%} else {%>
				            &nbsp;
				            <%} %>
				        </td>
				        <td class="fontsize" style="border-bottom:1px solid black;">
				             Mobile No.
				        </td>
				        <td colspan="2" class="borderrightBottom">
				           &nbsp;
				         </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style="border-bottom:1px solid black;border-left:1px solid black;">
				            Present Residential Address :
				        </td>
				        <td colspan="5" class="borderrightBottom">
				            <%=CurrentAddress %>&nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" colspan="3" style="border-bottom:1px solid black;border-left:1px solid black;" align="right">
				          City
				        </td>
				        <td colspan="3" style="border-bottom:1px solid black;border-right:1px solid black;" class="fontsizeInput">
				               <%if(CurrentCity != null) { %>
				                <%=CurrentCity %>
				                <%} else { %>
				               <%=CurrentCityOther %> 
				               <%} %>
				        </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				          State
				        </td>
				        <td width="109" style="border-bottom:1px solid black;" class="fontsizeInput">
				            <%if(CurrentState != null){ %>
				            <%=CurrentState %>
				            <%} else { %>
				            &nbsp;
				            <%} %>
				        </td>
				        <td class="fontsize" width="106"  style="border-bottom:1px solid black;">
				             Country
				        </td>
				        <td width="98" style="border-bottom:1px solid black;" class="fontsizeInput">
				            &nbsp;
				        </td>
				        <td  class="fontsize" width="148" style="border-bottom:1px solid black;">
				            Pin Code 
				         </td>
				        <td width="231" class="borderrightBottom">
				             <%=CurrentPinCode %>&nbsp;
				        </td>
				      </tr>
				       <tr>
				        <td class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				             Phone
				         </td>
				        <td colspan="2" class="borderbottom">
				           <%if(!CurrentPhoneNo.equals("")) {%>
				           <%=CurrentPhoneNo %>
				            <%} else {%>
				            &nbsp;
				            <%} %>
				            &nbsp;
				        </td>
				        <td  class="fontsize" style="border-bottom:1px solid black;">
				             Mobile No.
				        </td>
				        <td colspan="2" class="borderrightBottom">
				           <%if(!CurrentMobileNo.equals("")) {%>
				            <%=CurrentMobileNo %>
				            <%} else {%>
				            &nbsp;
				            <%} %>
				            &nbsp;
				         </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style="border-bottom:1px solid black;border-left:1px solid black;">
				            Emergency Address :
				        </td>
				        <td colspan="5" class="borderrightBottom">
				        <%if(!EmergencyAddress.equalsIgnoreCase("")) {%>
				           <%=EmergencyAddress %>
				           <%} else { %>
				           &nbsp;
				           <%} %>
				           &nbsp;
				         </td>
				      </tr>
				      <tr>
				        <td class="fontsize"  colspan="3" style="border-bottom:1px solid black;border-left:1px solid black;" align="right">
				           City
				        </td>
				        <td colspan="3" style="border-bottom:1px solid black;border-right:1px solid black;" class="fontsizeInput">
				                <%if(EmergencyCity != null) {%>
				                <%=EmergencyCity %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td  class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				          State
				        </td>
				        <td width="109" class="fontsizeInput" style="border-bottom:1px solid black;">
				             <%if(EmergencyState != null) {%>
				                <%=EmergencyState %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				        </td>
				        <td class="fontsize" width="106" style="border-bottom:1px solid black;">
				             Country
				        </td>
				        <td width="98" style="border-bottom:1px solid black;" class="fontsizeInput">
				             <%if(EmergencyCountry != null) {%>
				                <%=EmergencyCountry %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				        </td>
				        <td class="fontsize" width="148" style="border-bottom:1px solid black;">
				            Pin Code 
				         </td>
				        <td width="231" style="border-bottom:1px solid black;border-right:1px solid black;">
				             <%if(EmergencyPinCode != null) {%>
				                <%=EmergencyPinCode %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				        </td>
				      </tr>
				      <tr>
				        <td class="fontsize" style="border-left:1px solid black;border-bottom:1px solid black;">
				             Phone
				         </td>
				        <td colspan="2" class="borderbottom">
				           <%if(!EmergencyPhoneNo.equalsIgnoreCase("")) {%>
				                <%=EmergencyPhoneNo %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				        </td>
				        <td  class="fontsize" style="border-bottom:1px solid black;">
				             Mobile No.
				        </td>
				        <td colspan="2" class="borderrightBottom">
				            <%if(!EmergencyMobileNo.equalsIgnoreCase("")) {%>
				                <%=EmergencyMobileNo %>
				                <% } else { %>
				                &nbsp;
				                <%} %>
				                &nbsp;
				         </td>
				      </tr>
                 </table>
                </td>
               </tr>
               <tr>
				 <td align="center">  
                  <table width="750" border="0" cellspacing="0" cellpadding="2">
				      <tr class="fontsize">
				        <td colspan="6">
				       		  <table>
				       		    <tr class="fontsize">
					       		    <td width="100">
					       		      Passport No. :
					       		    </td>
					       		    <td width="170">
					       		      &nbsp;
					       		    </td>
					       		    <td width="80">
					       		      Valid Till :
					       		    </td>
					       		    <td width="130">
					       		      &nbsp;
					       		    </td>
					       		     <td width="120">
					       		      Place of Issue :
					       		    </td>
					       		    <td width="180">
					       		      &nbsp;
					       		    </td>
				       		    </tr>
				       		  </table>
				       	  </td>
				      </tr>
				      <tr>
				        <td colspan="6">
				        	  <table>
				        	   	<tr class="fontsize">
				        	   	  <td>
				        	   	     Issued On : 
				        	   	  </td>
				        	   	  <td>
				        	   	    <span>
				        	   	     
				        	   	    </span>
				        	   	    _______________
				        	   	  </td>
				        	   	</tr>
				        	  </table>
				        </td>
				      </tr>
				      <tr class="fontsizeBig">
				        <td colspan="6">
				             <b>Bank Details :
				              </b>
				        </td>
				      </tr>
				      <tr class="fontsize">
				        <td>
				             <table border="0" cellpadding="0" cellspacing="0">
				               <tr class="fontsize">
				                 <td>
				                   Name
				                 </td>
				                 <td>
				                    _____________________________________________
				                 </td>
				               </tr>
				             </table>
				         </td>
				        <td>
				            Bank :
				        </td>
				        <td colspan="3">
				             <table>
				              <tr>
				               <td>
				                 <table>
				                  <tr>
				                   <td width="16" height="16" align="center" style="border:1px solid black;">&nbsp;
				                   </td>
				                   <td class="fontsize">
				                     Axis
				                   </td>
				                  </tr>
				                 </table>
				               </td>
				               <td>
				                 <table>
				                  <tr>
				                   <td width="16" height="16" align="center" style="border:1px solid black;">&nbsp;
				                   </td>
				                   <td class="fontsize">
				                     ICICI
				                   </td>
				                  </tr>
				                 </table>
				               </td>
				               <td>
				                 <table>
				                  <tr>
				                   <td width="16" height="16" align="center" style="border:1px solid black;">&nbsp;
				                   </td>
				                   <td class="fontsize">
				                   Citibank
				                   </td>
				                  </tr>
				                 </table>
				               </td>
				              </tr>
				             </table>
				        </td>
				      </tr>
				      <tr>
				        <td colspan="3">
				              <table>
				                <tr class="fontsize">
				                   <td>
				                     Account No. (Savings Account)
				                   </td>
				                   <td>
				                     ____________________________________
				                   </td>
				                </tr>
				              </table>
				        </td>
				        <td colspan="3">
				       		 <table>
				                <tr class="fontsize">
				                   <td>
				                     Branch
				                   </td>
				                   <td>
				                     __________________
				                   </td>
				                </tr>
				              </table> 
				         </td>
				       </tr>
                 </table>
                </td>
              </tr>
              <tr>
				 <td align="center">  
                   <table width="750" border="0" cellspacing="0" cellpadding="4">
				      <tr class="fontsizeBig">
				        <td colspan="5">
				           <b>RECRUIMENT SOURCE
					          </b>
				          </td>
				      </tr>
				      <tr class="fontsize">
				        <td colspan="5">
				        	  Source Details
				         </td>
				      </tr>
				      <tr class="fontsize">
				        <td style="border:1px solid black;">
				        	 Advertisement
				        </td>
				        <td class="bordertopBottomright">
				        	  Consultant
				        </td>
				        <td class="bordertopBottomright">
				        	  Employee Referral
				         </td>
				        <td class="bordertopBottomright">
				        	  Walk-in / Campus
				         </td>
				        <td class="bordertopBottomright">
				        	 Other (Specify)
				        </td>
				      </tr>
				      <tr class="fontsizeInput">
				        <td style="border-left:1px solid black;border-bottom:1px solid black;border-right:1px solid black;">
				        	<%if(primarySource.equalsIgnoreCase("5")){ %>
				           <%=primarySourceInfo %>
				           <%} else { %>
				          &nbsp;
				          <%} %>
				          &nbsp;
				        </td>
				        <td class="borderrightBottom">
				        <%if(primarySource.equalsIgnoreCase("4")){ %>
				           <%=primarySourceInfo %>
				           <%} else { %>
				          &nbsp;
				        <%} %>
				        &nbsp;
				        </td>
				        <td class="borderrightBottom">
				         <%if(primarySource.equalsIgnoreCase("2")){ %>
				           <%=primarySourceInfo %>
				           <%} else { %>
				          &nbsp;
				        <%} %>
				        &nbsp;
				        </td>
				        <td class="borderrightBottom">
				        <%if((primarySource.equalsIgnoreCase("19")) || (primarySource.equalsIgnoreCase("14"))){ %>
				           <%=primarySourceInfo %>
				           <%} else { %>
				          &nbsp;
				        <%} %>
				        &nbsp;
				        </td>
				        <td class="borderrightBottom">
				         <%if(primarySource.equalsIgnoreCase("6")){ %>
				           <%=primarySourceInfo %>
				           <%} else if((!primarySource.equalsIgnoreCase("2")) && (!primarySource.equalsIgnoreCase("14")) && (!primarySource.equalsIgnoreCase("5")) && (!primarySource.equalsIgnoreCase("4")) && (!primarySource.equalsIgnoreCase("19"))) { %>
				          <%=primarySourceInfo %>
				        <%} %>
				        &nbsp;
				        </td>
				      </tr>
				  </table>
	             </td>
			  </tr>
			  <tr>
				<td style="height: 10px;"> </td>
			 </tr>
			  <tr>
			    <td class="fontsizeSmall" align="center">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				<td style="height: 5px;"> </td>
			 </tr>
				<tr>
				<td align="center"  class="fontsizeSmall" valign="bottom">1</td>
			</tr>
	   		</table>
         </div>
   		
   		<div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		       <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left" style="vertical-align: top;">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	         <tr>
	            <td class="fontsizeBig" align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				 FAMILY BACKGROUND
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center">
	               <table width="750" border="1" cellspacing="0" cellpadding="6">
					    <tr class="fontsize" align="left">
					      <td width="156">Name  </td>
					      <td width="98">Relationship</td>
					      <td width="114">Age / DOB </td>
					      <td width="180">Qualification</td>
					      <td width="200">Occupation</td>
					    </tr>
					    
					    <tr class="fontsizeInput">
					      <td>
					     <% 
					     for(i= 0; i<familycount;i++ )
					      {
						     if(familyMemberNames.get(i) != null)
						      {
							      if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
							      {
							       %>
							      <%=familyMemberNames.get(i) %>
							      <%
							      }
							   }
						   else 
						      {
						      %>
						      &nbsp;
						      <%
						      }
					        }
					      %>
					      &nbsp;
					      </td>
					      <td>Father</td>
					      <td>
					     <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if((familyMemberAges.get(i) != null))
							      {
								      if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
								      {
								       %>
								      <%=familyMemberAges.get(i) %>
								      <%
								      }
								  }
								  if((familyMemberDOBs.get(i) != null))
								  {
								  	if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
								      {
								       %>
								     	/ <%=familyMemberDOBs.get(i) %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
						       <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if(familyMemberOccupation != null)
							      {
								     if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
								      {
								       %>
								      <%=familyMemberOccupations.get(i) %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					    </tr>
					    <tr class="fontsizeInput">
					      <td>
						      <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if(familyMemberRelationship != null)
							      {
								      if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
								      {
								       %>
								      <%=familyMemberNames.get(i).trim() %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					      <td>Mother</td>
					      <td>
					      <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if((familyMemberAges.get(i) != null))
							      {
								      if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
								      {
								       %>
								      <%=familyMemberAges.get(i) %>
								      <%
								      }
								  }
								  if((familyMemberDOBs.get(i) != null))
								  {
								  	if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
								      {
								       %>
								     	/ <%=familyMemberDOBs.get(i) %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					        <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if(familyMemberOccupation != null)
							      {
								     if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
								      {
								       %>
								      <%=familyMemberOccupations.get(i).trim() %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					    </tr>
					    <tr class="fontsizeInput">
					      <td>
						      <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if(familyMemberRelationship != null)
							      {
								      if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
								      {
								       %>
								      <%=familyMemberNames.get(i) %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					      <td>Spouse</td>
					      <td>
					      <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if((familyMemberAges.get(i) != null))
							      {
								      if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
								      {
								       %>
								      <%=familyMemberAges.get(i) %>
								      <%
								      }
								  }
								  if((familyMemberDOBs.get(i) != null))
								  {
								  	if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
								      {
								       %>
								     	/ <%=familyMemberDOBs.get(i) %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
						         <% 
						     for(i= 0; i<familycount;i++ )
						      {
							     if(familyMemberOccupation != null)
							      {
								     if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
								      {
								       %>
								      <%=familyMemberOccupations.get(i).trim() %>
								      <%
								      }
								  }
								  else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
						      }
						      %>
					      &nbsp;
					      </td>
					    </tr>
					    <tr class="fontsizeInput">
					      <td>
					      <% 
					     if(familycountChild > 0)
					      {
					     	if((familyMemberChildNames.get(0).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildNames.get(0).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					      <td>Child 1</td>
					      <td>
					        <% 
					     if(familycountChild > 0)
					      {
					     	if((familyMemberChildAges.get(0).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildAges.get(0).trim() %>
						      <%
						      }
						      if((familyMemberChildDOBs.get(0).trim()) != null)
						      {
						      %>
						      / <%=familyMemberChildDOBs.get(0).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					      <td>&nbsp;</td>
					      <td>
					          <% 
					     if(familycountChild > 0)
					      {
					     	if((familyMemberChildOccupations.get(0).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildOccupations.get(0).trim() %>
						      <%
						      }
						  }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					    </tr>
					     <tr class="fontsizeInput">
					      <td>
					      <% 
					     if(familycountChild > 1)
					      {
					     	if((familyMemberChildNames.get(1).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildNames.get(1).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					      <td>Child 2</td>
					      <td>
					        <% 
					     if(familycountChild > 1)
					      {
					     	if((familyMemberChildAges.get(1).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildAges.get(1).trim() %>
						      <%
						      }
						      if((familyMemberChildDOBs.get(1).trim()) != null)
						      {
						      %>
						      / <%=familyMemberChildDOBs.get(1).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					      <td>&nbsp;</td>
					      <td>
					          <% 
					     if(familycountChild > 1)
					      {
					     	if((familyMemberChildOccupations.get(1).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildOccupations.get(1).trim() %>
						      <%
						      }
						  }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      </td>
					    </tr>
					    <tr class="fontsizeInput">
					      <td>
					     	&nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					    </tr>
					     <tr class="fontsizeInput">
					      <td>
					     	&nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					    </tr>
					     <tr class="fontsizeInput">
					      <td>
					     	&nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					      <td>&nbsp;</td>
					      <td>
					      &nbsp;
					      </td>
					    </tr>
				   </table>
	            </td>
	          </tr>
	           <tr>
	            <td class="fontsizeBig" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				EDUCATIONAL QUALIFICATION
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	             <td align="center">
	                 <table width="750" border="1" cellspacing="0" cellpadding="6">
					   <tr class="fontsize">
						    <td width="143" height="85" align="center">Name of Institute</td>
						    <td width="83" align="center">Qualification</td>
						    <td width="145" align="center">Specilization Course ( B.Com., B.E., PCMB) </td>
						    <td width="68" align="center"><p>Year of Joining </p>
						    </td>
						    <td width="68" align="center">Year of Passing </td>
						    <td width="137" align="center">University</td>
						    <td width="76" align="center">Class/ % </td>
					   </tr>
					   <tr class="fontsizeInput">
						    <%
							int Educcount = 0;
							String qryEducCount = "select count(*) as count from cand_education_qualification_details where Candidate_Id_Auto_Id = '"+autoID+"'";	
							rss = stmt.executeQuery(qryEducCount);
							if(rss.next())
							{
							Educcount = rss.getInt("count");
							}
							rss.close();
					     %>
						    <td>
								<% 
							     for(i= 0; i< Educcount;i++ )
							      {
							      if(Educ_Institue_Names.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
									      {
									       %>
									      <%=Educ_Institue_Names.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>(10th)</td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							       if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								      {
								      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
								      {
									      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
									      rss = stmt.executeQuery(qryeduc);
										  String SpecialisationName = "";
										  if(rss.next())
											{
											SpecialisationName  = rss.getString("specialisationName");
											if(SpecialisationName == null)
											{
												SpecialisationName = "";
											}
											}
									      %>
									      <%=SpecialisationName %> 
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      rss.close();
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Joinings.get(i) != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
									      {
									       %>
									      <%=Educ_Year_of_Joinings.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Completions.get(i) != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
									      {
									       %>
									      <%=Educ_Year_of_Completions.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
								  }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Universitys.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
									      {
									       %>
									      <%=Educ_Universitys.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						        <% 
							     for(i= 0; i<Educcount;i++ )
							      {
								      if(Educ_Edu_Grades.get(i).trim() != null)
									      {
										      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
										      {
										       %>
										      <%=Educ_Edu_Grades.get(i).trim() %>
										      <%
										      }
									      }
								      if(Educ_Class_In_Percentages.get(i).trim() != null)
									      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113")) 
									      {
									       %>
									     / <%=Educ_Class_In_Percentages.get(i).trim() %>
									      <%
									      }
									      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							        }
							       %>
						       &nbsp;
						    </td>
					   </tr>
					   <tr class="fontsizeInput">
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Institue_Names.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									      <%=Educ_Institue_Names.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							       &nbsp;
						    </td>
						    <td>(12th)</td>
						    <td>
						     <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							       if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								      {
								      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
								      {
								      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
								      rss = stmt.executeQuery(qryeduc);
									  String SpecialisationName = "";
									  if(rss.next())
										{
										SpecialisationName  = rss.getString("specialisationName");
										if(SpecialisationName == null)
										{
										SpecialisationName = "";
										}
										}
								      %>
								      <%=SpecialisationName %> 
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      rss.close();
							      %>
							       &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Joinings.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									      <%=Educ_Year_of_Joinings.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							       &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Completions.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									      <%=Educ_Year_of_Completions.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							       &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Universitys.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									      <%=Educ_Universitys.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							       &nbsp;
						    </td>
						    <td>
						      <% 
							     for(i= 0; i<Educcount;i++ )
							      {
								      if(Educ_Edu_Grades.get(i).trim() != null)
									      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									      <%=Educ_Edu_Grades.get(i).trim() %>
									      <%
									      }
									     }
								      if(Educ_Class_In_Percentages.get(i).trim() != null)
									      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78")) 
									      {
									       %>
									     / <%=Educ_Class_In_Percentages.get(i).trim() %>
									      <%
									      }
									      }
									      else 
									      {
									      %>
									      &nbsp;
									      <%
									      }
							        }
							       %>
						       &nbsp;
						    </td>
					  </tr>
					   <tr class="fontsizeInput">
						    <td>
						      <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(Educ_Institue_Names.get(i).trim() != null)
								      {
									      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
									      {
									       %>
									      <%=Educ_Institue_Names.get(i).trim() %>
									      <%
									      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						      (Diploma)
						    </td>
						    <td>
						    <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							       if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								      {
								       if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
								      rss = stmt.executeQuery(qryeduc);
									  String SpecialisationName = "";
									  if(rss.next())
										{
										SpecialisationName  = rss.getString("specialisationName");
										if(SpecialisationName == null)
										{
										SpecialisationName = "";
										}
										}
								      %>
								      <%=SpecialisationName %> 
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      rss.close();
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i=0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Joinings.get(i).trim() != null)
								      {
								       if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Year_of_Joinings.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i=0; i<Educcount;i++ )
							      {
							      if(Educ_Year_of_Completions.get(i).trim() != null)
								      {
								     if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Year_of_Completions.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							     for(i=0; i<Educcount;i++ )
							      {
							      if(Educ_Universitys.get(i).trim() != null)
								      {
								      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Universitys.get(i).trim() %>
								      <%
								      }
								     }
								     else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						     <% 
							     for(i= 0; i <Educcount;i++ )
							      {
							      if(Educ_Class_In_Percentages.get(i).trim() != null)
								      {
								      if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Class_In_Percentages.get(i).trim() %>
								      <%
								      }
								      }
								      if(Educ_Edu_Grades.get(i).trim() != null)
								      {
								       if((Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								     / <%=Educ_Edu_Grades.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
							      }
							      %>
							      &nbsp;
						    </td>
					   </tr>
					     <tr class="fontsizeInput">
						    <td>
						      <% 
							     for(i= 0; i<Educcount;i++ )
							      {
							      if(qualificationGroupID_Degrees.get(i) == 2) 
								  {
							        if(Educ_Institue_Names.get(i).trim() != null)
								      {
								      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								      %>		
										<%=Educ_Institue_Names.get(i).trim() %>
								      <%
								       }
									   
								      }
								      else 
									    {
									     %>
									      &nbsp;
									      <%
									     }
								     }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						      (Degree)
						    </td>
						    <td>
						    <% 
							   for(i=0; i<Educcount;i++ )
							      {
							       if(qualificationGroupID_Degrees.get(i) == 2) 
								    {
							       if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								     {
								       if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
								      rss = stmt.executeQuery(qryeduc);
									  String SpecialisationName = "";
									  if(rss.next())
										{
										SpecialisationName  = rss.getString("specialisationName");
											if(SpecialisationName == null)
											{
											SpecialisationName = "";
											}
										}
								      %>
								      <%=SpecialisationName %> 
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
							      }
							     }
							      rss.close(); %>
							     &nbsp;
							</td>
						    <td>
						    <% 
						    for(i=0; i<Educcount;i++ )
							 {
							   if(qualificationGroupID_Degrees.get(i) == 2)
						         {
							      if(Educ_Year_of_Joinings.get(i).trim() != null)
								      {
								       if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Year_of_Joinings.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
							      }
							    }
							     %>
							     &nbsp;
							</td>
						    <td>
						    <% 
							 for(i=0; i<Educcount;i++ )
							   {
							    if(qualificationGroupID_Degrees.get(i) == 2)
						         {
							      if(Educ_Year_of_Completions.get(i).trim() != null)
								      {
								      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Year_of_Completions.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
							      }
							    }
							     %>
							     &nbsp;
							</td>
						    <td>
						    <% 
							   for(i=0; i<Educcount;i++ )
							     {
							     if(qualificationGroupID_Degrees.get(i) == 2) 
						          {
							      if(Educ_Universitys.get(i).trim() != null)
								      {
								      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								      <%=Educ_Universitys.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
							      }
							    }
							    %> 
							    &nbsp; 
							</td>
						    <td>
						     <% 
							   for(i= 0; i<Educcount;i++ )
							      {
							      if(qualificationGroupID_Degrees.get(i) == 2) 
						           {
							       if(Educ_Edu_Grades.get(i).trim() != null)
								      {
								       if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								       <%=Educ_Edu_Grades.get(i).trim() %>
								      <%
								      }
								      }
							      if(Educ_Class_In_Percentage != null)
								      {
								       if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352")) 
								      {
								       %>
								     / <%=Educ_Class_In_Percentages.get(i).trim() %>
								      <%
								      }
								      }
								    else 
								      {
								      %>
								      &nbsp;
								      <%} 
							      }
							      }
							       %>
							       &nbsp;
							 </td>
					   </tr>
					    <tr class="fontsizeInput">
						    <td>
						      <% 
							   for(i= 0; i<Educcount;i++ )
							    {
							     if(qualificationGroupID_Degrees.get(i) == 3) 
								  {
							       if(Educ_Institue_Names.get(i).trim() != null)
								      {
								      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
								      {
								       %>		
								       	<%=Educ_Institue_Names.get(i).trim() %>
								      <% 		
								       }
								      }
								       else 
								      {
								      %>
								      &nbsp;
								      <%}
								  }
							    }
							      %>
							      &nbsp;
						    </td>
						    <td>
						   		(PG)
						   </td>
						    <td>
						     <% 
							   for(i=0; i<Educcount;i++ )
							    {
							     if(qualificationGroupID_Degrees.get(i) == 3) 
							      {
							      if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								   {
								    if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2))  
								     {
									      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
									      rss = stmt.executeQuery(qryeduc);
										  String SpecialisationName = "";
										  if(rss.next())
											{
											SpecialisationName  = rss.getString("specialisationName");
											if(SpecialisationName == null)
											{
											SpecialisationName = "";
											}
											}
								      %>
								      <%=SpecialisationName %> 
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
								    }
							      }
							      rss.close();
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							 for(i=0; i<Educcount;i++ )
							   {
							   if(qualificationGroupID_Degrees.get(i) == 3)
							    {
							     if(Educ_Year_of_Joinings.get(i).trim() != null)
								    {
								    if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
								     {
								      %>
								      <%=Educ_Year_of_Joinings.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
								     }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							  for(i=0; i<Educcount;i++ )
							   {
							   if(qualificationGroupID_Degrees.get(i) == 3)
							    {
							     if(Educ_Year_of_Completions.get(i).trim() != null)
								  {
								  if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
								     {
								     %>
								      <%=Educ_Year_of_Completions.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
								     }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							  for(i=0; i<Educcount;i++ )
							    {
							    if(qualificationGroupID_Degrees.get(i) == 3)
							    {
							     if(Educ_Universitys.get(i).trim() != null)
								  {
								     if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
								      {
								       %>
								       <%=Educ_Universitys.get(i).trim() %>
								       <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
								    }
							      }
							      %>
							      &nbsp;
						    </td>
						    <td>
						     <% 
							   for(i= 0; i<Educcount;i++ )
							    {
							    if(qualificationGroupID_Degrees.get(i) == 3)
							     {
								  if(Educ_Edu_Grades.get(i).trim() != null)
								   {
									if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
									  {
									    %>
									     <%=Educ_Edu_Grades.get(i).trim() %>
									      <%
									      }
									      }
								     if(Educ_Class_In_Percentages.get(i).trim() != null)
									      {
									      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2)) 
									      {
									       %>
									     / <%=Educ_Class_In_Percentages.get(i).trim() %>
									      <%
									      }
									      }
									      else 
									      {
									      %>
									      &nbsp;
									      <%}
									    }  
								    }
							      %>
							    &nbsp;  
						    </td>
					   </tr>
					    <tr class="fontsizeInput">
						    <td>
						     <% 
							   for(i= 0; i<Educcount;i++ )
							    {
							    if(Educ_Institue_Names.get(i).trim() != null)
								      {
								      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) &&  (qualificationGroupID_Degrees.get(i) != 3) ) 
								      {
								       %>		
								       	<%=Educ_Institue_Names.get(i).trim() %>
								      <% 		
								       }
								      }
								       else 
								      {
								      %>
								      &nbsp;
								      <%}
								 }
							      %>
							      &nbsp;</td>
						    <td>(Others)</td>
						    <td>
						    <% 
							   for(i=0; i<Educcount;i++ )
							    {
							     if((Educ_Specialization1 != null) && (Educ_Specialization2 != null))
								   {
								    if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) && (qualificationGroupID_Degrees.get(i) != 3) )  
								     {
									      String qryeduc = "select specialisationName from mstspecialisation where specialisationId = '"+Educ_Specialization1s.get(i)+"'"; 
									      rss = stmt.executeQuery(qryeduc);
										  String SpecialisationName = "";
										  if(rss.next())
											{
											SpecialisationName  = rss.getString("specialisationName");
											if(SpecialisationName == null)
											{
											SpecialisationName = "";
											}
											}
								      %>
								      <%=SpecialisationName %> 
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
								  }
								  rss.close();
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							 for(i=0; i<Educcount;i++ )
							   {
							   if(Educ_Year_of_Joinings.get(i).trim() != null)
								    {
								     if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) &&  (qualificationGroupID_Degrees.get(i) != 3)) 
								     {
								      %>
								      <%=Educ_Year_of_Joinings.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%
								      }
								   }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							  for(i=0; i<Educcount;i++ )
							   {
							   if(Educ_Year_of_Completions.get(i).trim() != null)
								  {
								  if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) &&  (qualificationGroupID_Degrees.get(i) != 3)) 
								     {
								     %>
								      <%=Educ_Year_of_Completions.get(i).trim() %>
								      <%
								      }
								      }
								      else 
								      {
								      %>
								      &nbsp;
								      <%}
								  }
							      %>
							      &nbsp;
						    </td>
						    <td>
						     <% 
							  for(i=0; i<Educcount;i++ )
							    {
							    if(Educ_Universitys.get(i).trim() != null)
								  {
								     if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) &&  (qualificationGroupID_Degrees.get(i) != 3)) 
								      {
								       %>
								       <%=Educ_Universitys.get(i).trim() %>
								       <%
								      }
							      }
							      else 
							      {
							      %>
							      &nbsp;
							      <%
							      }
								  }
							      %>
							      &nbsp;
						    </td>
						    <td>
						    <% 
							   for(i= 0; i<Educcount;i++ )
							    {
							    if(Educ_Edu_Grades.get(i).trim() != null)
								   {
									if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) && (qualificationGroupID_Degrees.get(i) != 3)) 
									  {
									    %>
									     <%=Educ_Edu_Grades.get(i).trim() %>
									      <%
									      }
									      }
								     if(Educ_Class_In_Percentages.get(i).trim() != null)
									      {
									      if(!(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("78") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("113") && !(Educ_Qualification_Courses.get(i)).equalsIgnoreCase("352") && (qualificationGroupID_Degrees.get(i) != 2) && (qualificationGroupID_Degrees.get(i) != 3)) 
									      {
									       %>
									      <%=Educ_Class_In_Percentages.get(i).trim() %>
									      <%
									      }
									      }
									      else 
									      {
									      %>
									      &nbsp;
									      <%}
									}
							      %>
							     &nbsp; 
						    </td>
					   </tr>
					</table>
	             </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				WORK EXPERIENCE (START WITH LAST EMPLOYEMENT)
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	         <tr>
	            <td align="center">
	               <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td width="163" align="center">Name of the Company / Organisation </td>
					    <td width="134" align="center">Duration From (DD-MMM-YYYY) </td>
					    <td width="127" align="center">Duration To (DD-MMM-YYYY) </td>
					    <td width="110" align="center">Designation</td>
					    <td width="110">Reason for Leaving </td>
					    <td width="90" align="center">Last Salary Drawn / CTC</td>
					  </tr>
					  <tr class="fontsizeInput">
					     <%
							int Workccount = 0;
							String qryWorkCount = "select count(*) as count from cand_work_exp_details where cand_passed_auto_id = '"+autoID+"'";	
							rss = stmt.executeQuery(qryWorkCount);
							if(rss.next())
							{
							Workccount = rss.getInt("count");
							}
							rss.close();
					     %>
					    <td>
					    <% 
					     if(Work_Experience.equalsIgnoreCase("Y"))
					     {
					     if(Workccount >= 1)
					     {
					     if(Work_CompanyName != null)
						      {
						      %>
						      <%=Work_CompanyNames.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  }
						  else
						  {
						  %>
						  Fresher
						  <%
						  }
						  %>
					    &nbsp;</td>
					    <td>
					    <% 
					     if(Workccount >= 1)
					     {
					     if(Work_From != null)
						      {
						      %>
						      <%=Work_Froms.get(0) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 1)
					     {
					     if(Work_To != null)
						      {
						      %>
						      <%=Work_Tos.get(0) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 1)
					     {
					     if(Work_Designation != null)
						      {
						      %>
						      <%=Work_Designations.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 1)
					     {
					     if(Work_LeavingReason != null)
						      {
						      %>
						      <%=Work_LeavingReasons.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 1)
					     {
					     if(Work_SalaryDrawn != null)
						      {
						      %>
						      <%=Work_SalaryDrawns.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					     <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_CompanyName != null)
						      {
						      %>
						      <%=Work_CompanyNames.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					    <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_From != null)
						      {
						      %>
						      <%=Work_Froms.get(1) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_To != null)
						      {
						      %>
						      <%=Work_Tos.get(1) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_Designation != null)
						      {
						      %>
						      <%=Work_Designations.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_LeavingReason != null)
						      {
						      %>
						      <%=Work_LeavingReasons.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 2)
					     {
					     if(Work_SalaryDrawn != null)
						      {
						      %>
						      <%=Work_SalaryDrawns.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					      <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_CompanyName != null)
						      {
						      %>
						      <%=Work_CompanyNames.get(2).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					    <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_From != null)
						      {
						      %>
						      <%=Work_Froms.get(2) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_To != null)
						      {
						      %>
						      <%=Work_Tos.get(2) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_Designation != null)
						      {
						      %>
						      <%=Work_Designations.get(2).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_LeavingReason != null)
						      {
						      %>
						      <%=Work_LeavingReasons.get(2).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 3)
					     {
					     if(Work_SalaryDrawn != null)
						      {
						      %>
						      <%=Work_SalaryDrawns.get(2).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					       <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_CompanyName != null)
						      {
						      %>
						      <%=Work_CompanyNames.get(3).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					    <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_From != null)
						      {
						      %>
						      <%=Work_Froms.get(3) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_To != null)
						      {
						      %>
						      <%=Work_Tos.get(3) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_Designation != null)
						      {
						      %>
						      <%=Work_Designations.get(3).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_LeavingReason != null)
						      {
						      %>
						      <%=Work_LeavingReasons.get(3).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >= 4)
					     {
					     if(Work_SalaryDrawn != null)
						      {
						      %>
						      <%=Work_SalaryDrawns.get(3).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					       <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_CompanyName != null)
						      {
						      %>
						      <%=Work_CompanyNames.get(4).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					    <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_From != null)
						      {
						      %>
						      <%=Work_Froms.get(4) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_To != null)
						      {
						      %>
						      <%=Work_Tos.get(4) %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_Designation != null)
						      {
						      %>
						      <%=Work_Designations.get(4).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_LeavingReason != null)
						      {
						      %>
						      <%=Work_LeavingReasons.get(4).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(Workccount >=5)
					     {
					     if(Work_SalaryDrawn != null)
						      {
						      %>
						      <%=Work_SalaryDrawns.get(4).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					</table>
	            </td>
	          </tr>
	          <tr>
				  <td style="height: 45px;">&nbsp;</td>
			  </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				<td style="height: 10px;"> </td>
			 </tr>
				<tr>
				<td  class="fontsizeSmall" align="center" valign="bottom">2</td>
			</tr>
   		   </table>
   		</div>
   		<div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left" style="vertical-align: top;">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				LANGUAGE DETAILS
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr> 
	            <td align="center">
	               <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td width="160" align="center">Language</td>
					    <td width="115" align="center">Speak</td>
					    <td width="104" align="center">Read</td>
					    <td width="104" align="center">Write</td>
					    <td width="265" align="center">Mother Tongue </td>
					  </tr>
					  <tr class="fontsizeInput">
					    <%
							int langcount = 0;
							int RWS_Length = 0;
							String[] LanguageRWS = null;
							String qrylangCount = "select count(*) as count from cand_language_skills_details where cand_passed_auto_id = '"+autoID+"'";	
							rss = stmt.executeQuery(qrylangCount);
							if(rss.next())
							{
							langcount = rss.getInt("count");
							}
							rss.close();
					     %>
					    <td>
					    <% 
					     if(langcount >=1)
					     {
					     if(Language_Name != null)
						      {
						      %>
						      <%=Languages_Names.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <% 
					     if(langcount >=1)
					     {
					      if(Language_Name != null)
						  	{
						      LanguageRWS = (Languages_RWS.get(0)).split("-");
						      RWS_Length = LanguageRWS.length;
							   if(RWS_Length >= 1)   
							   {
							      if((LanguageRWS[0] != null) && (!LanguageRWS[0].equalsIgnoreCase("")))
							       {
							       %>
							      <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							       }
							      else 
							      {
							      %>
							      &nbsp;
							      <%}
							    }
						    }
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <%
					    if(RWS_Length >= 2)   
					     {
					     if((LanguageRWS[1] != null) && (!LanguageRWS[1].equalsIgnoreCase("")))
							  {
						      %>
						     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
						      <%
						      }
						      else 
						      {
						      %>
						      &nbsp;
						     <%
						      }
						  }
					     %>
					    &nbsp;</td>
					    <td align="center">
					    <%
					    if(RWS_Length >= 3)   
					     {
					     if((LanguageRWS[2] != null) && (!LanguageRWS[2].equalsIgnoreCase("")))
							  {
						      %>
						     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
						      <%
						      }
						      else 
						      {
						      %>
						      &nbsp;
						     <%
						      }
						  }
					     %>
					    &nbsp;
					    </td>
					    <td rowspan="4" align="center">
					    <%= Mother_Tongue%>
					    &nbsp;</td>
					  </tr>
					  <tr class="fontsizeInput">
					     <td>
					    <% 
					     if(langcount >= 2)
					     {
					     if(Language_Name != null)
						      {
						      %>
						      <%=Languages_Names.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <% 
					     if(langcount >=2)
					     {
					      if(Language_Name != null)
						  	{
						      LanguageRWS = (Languages_RWS.get(1)).split("-");
						      RWS_Length = LanguageRWS.length;
							   if(RWS_Length >= 1)   
							   {
							      if((LanguageRWS[0] != null) && (!LanguageRWS[0].equalsIgnoreCase("")))
							       {
							       %>
							      <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							       }
							      else 
							      {
							      %>
							      &nbsp;
							      <%}
							    }
						    }
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <%
						   if(langcount >=2)
					       { 
						    if(RWS_Length >= 2)   
						     {
						     if((LanguageRWS[1] != null) && (!LanguageRWS[1].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
							  }
							}  
					     %>
					    &nbsp;</td>
					    <td align="center">
					    <%
					    if(langcount >=2)
					    {
						    if(RWS_Length >= 3)   
						     {
						     if((LanguageRWS[2] != null) && (!LanguageRWS[2].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
						}	  }
					     %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					    <td>
					    <% 
					     if(langcount >= 3)
					     {
					     if(Language_Name != null)
						      {
						      %>
						      <%=Languages_Names.get(2).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <% 
					     if(langcount >= 3)
					     {
					      if(Language_Name != null)
						  	{
						      LanguageRWS = (Languages_RWS.get(2)).split("-");
						      RWS_Length = LanguageRWS.length;
							   if(RWS_Length >= 1)   
							   {
							      if((LanguageRWS[0] != null) && (!LanguageRWS[0].equalsIgnoreCase("")))
							       {
							       %>
							      <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							       }
							      else 
							      {
							      %>
							      &nbsp;
							      <%}
							    }
						    }
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <%
					    if(langcount >= 3)
					     {
						    if(RWS_Length >= 2)   
						     {
						     if((LanguageRWS[1] != null) && (!LanguageRWS[1].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
							  }
						 }  
					     %>
					    &nbsp;</td>
					    <td align="center">
					    <%
					    if(langcount >= 3)
					     {
						    if(RWS_Length >= 3)   
						     {
						     if((LanguageRWS[2] != null) && (!LanguageRWS[2].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
							  }
							}  
					     %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr class="fontsizeInput">
					     <td>
					    <% 
					     if(langcount >= 4)
					     {
					     if(Language_Name != null)
						      {
						      %>
						      <%=Languages_Names.get(3).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <% 
					     if(langcount >= 4)
					     {
					      if(Language_Name != null)
						  	{
						      LanguageRWS = (Languages_RWS.get(3)).split("-");
						      RWS_Length = LanguageRWS.length;
							   if(RWS_Length >= 1)   
							   {
							      if((LanguageRWS[0] != null) && (!LanguageRWS[0].equalsIgnoreCase("")))
							       {
							       %>
							      <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							       }
							      else 
							      {
							      %>
							      &nbsp;
							      <%}
							    }
						    }
						  }
						  %>
					    &nbsp;
					    </td>
					    <td align="center">
					    <%
					     if(langcount >= 4)
					     {
						    if(RWS_Length >= 2)   
						     {
						     if((LanguageRWS[1] != null) && (!LanguageRWS[1].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
							  }
						 }	  
					     %>
					    &nbsp;</td>
					    <td align="center">
					    <%
					    if(langcount >= 4)
					     {
						    if(RWS_Length >= 3)   
						     {
						     if((LanguageRWS[2] != null) && (!LanguageRWS[2].equalsIgnoreCase("")))
								  {
							      %>
							     <img src="<%=recruitPath%>images/check-mark-md.png" width="18" height="16">
							      <%
							      }
							      else 
							      {
							      %>
							      &nbsp;
							     <%
							      }
							  }
						 }	  
					     %>
					    &nbsp;
					    </td>
					  </tr>
					</table>
	            </td>
	          </tr>
	         <tr>
	            <td class="fontsizeBig" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				MEDICAL INSURANCE - DEPENDANTS' DETAILS
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	         <tr>
	           <td align="center">
	             <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td width="270" align="center">Name</td>
					    <td width="216" align="center">Relationship</td>
					    <td width="290" align="center">Age / Date of Birth </td>
					  </tr>
					  <tr  class="fontsizeInput">
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberNames.get(i) != null) && !((familyMemberNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
						     	 {
							     %>
							     	<%= familyMemberNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
						</td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyRealtionShipNames.get(i) != null) && !((familyRealtionShipNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
						     	 {
							     %>
							     	<%= familyRealtionShipNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
					    </td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberAges.get(i) != null) && !((familyMemberAges.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
						     	 {
							     %>
							     	<%= familyMemberAges.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
							if((familyMemberDOBs.get(i) != null) && !((familyMemberDOBs.get(i)).equalsIgnoreCase("")))
						    {
						    	if((familyMemberRelationships.get(i)).equalsIgnoreCase("1")) 
						     	 {
							     %>
							     	/ <%= familyMemberDOBs.get(i) %>
							     <%
							     }
						    }
						}
						%>
						&nbsp;
					   	</td>
					  </tr>
					 <tr  class="fontsizeInput">
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberNames.get(i) != null) && !((familyMemberNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
						     	 {
							     %>
							     	<%= familyMemberNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
						</td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyRealtionShipNames.get(i) != null) && !((familyRealtionShipNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
						     	 {
							     %>
							     	<%= familyRealtionShipNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
					    </td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberAges.get(i) != null) && !((familyMemberAges.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
						     	 {
							     %>
							     	<%= familyMemberAges.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
							if((familyMemberDOBs.get(i) != null) && !((familyMemberDOBs.get(i)).equalsIgnoreCase("")))
						    {
						    	if((familyMemberRelationships.get(i)).equalsIgnoreCase("2")) 
						     	 {
							     %>
							     	/ <%= familyMemberDOBs.get(i) %>
							     <%
							     }
						    }
						}
						%>
						&nbsp;
					   	</td>
					  </tr>
					  <tr  class="fontsizeInput">
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberNames.get(i) != null) && !((familyMemberNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
						     	 {
							     %>
							     	<%= familyMemberNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
						</td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyRealtionShipNames.get(i) != null) && !((familyRealtionShipNames.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
						     	 {
							     %>
							     	<%= familyRealtionShipNames.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
						}
						%>
						&nbsp;
					    </td>
					    <td>
					    <%
					    for(i= 0; i < familycount;i++ )
					     {
					     if((familyMemberAges.get(i) != null) && !((familyMemberAges.get(i)).equalsIgnoreCase("")))
						    {
							    if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
						     	 {
							     %>
							     	<%= familyMemberAges.get(i) %>
							     <%
							     }
						     }
						     else
						     {
						     %>
						     &nbsp;
						<% 
							}
							if((familyMemberDOBs.get(i) != null) && !((familyMemberDOBs.get(i)).equalsIgnoreCase("")))
						    {
						    	if((familyMemberRelationships.get(i)).equalsIgnoreCase("3")) 
						     	 {
							     %>
							     	/ <%= familyMemberDOBs.get(i) %>
							     <%
							     }
						    }
						}
						%>
						&nbsp;
					   	</td>
					  </tr>
					 <tr  class="fontsizeInput">
					    <td>
					    <% 
					     if(familycountChild > 0)
					      {
					     	if((familyMemberChildNames.get(0).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildNames.get(0).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
						</td>
					    <td>
					     <% 
					     if(familycountChild > 0)
					      {
					     	if((familyRealtionShipChildNames.get(0).trim()) != null)
						      {
						      %>
						      <%=familyRealtionShipChildNames.get(0).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
					    </td>
					    <td>
					    <% 
					     if(familycountChild > 0)
					      {
					     	if((familyMemberChildAges.get(0).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildAges.get(0).trim() %>
						      <%
						      }
						      if((familyMemberChildDOBs.get(0).trim()) != null)
						      {
						      %>
						      / <%=familyMemberChildDOBs.get(0).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
						</td>
					  </tr>
					   <tr  class="fontsizeInput">
					    <td>
					    <% 
					     if(familycountChild > 1)
					      {
					     	if((familyMemberChildNames.get(1).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildNames.get(1).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
						</td>
					    <td>
					     <% 
					     if(familycountChild > 1)
					      {
					     	if((familyRealtionShipChildNames.get(1).trim()) != null)
						      {
						      %>
						      <%=familyRealtionShipChildNames.get(1).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
					    </td>
					    <td>
					    <% 
					     if(familycountChild > 1)
					      {
					     	if((familyMemberChildAges.get(1).trim()) != null)
						      {
						      %>
						      <%=familyMemberChildAges.get(1).trim() %>
						      <%
						      }
						      if((familyMemberChildDOBs.get(1).trim()) != null)
						      {
						      %>
						      / <%=familyMemberChildDOBs.get(1).trim() %>
						      <%
						      }
					      }
					      else
					      {
					      %>
					      	&nbsp;
					      <%
					      }
					      %>
					      &nbsp;
						</td>
					  </tr>
			    </table>
			   </td>
	          </tr>
	          <tr>
	          	<td align="center">
	          		 <table width="750" cellspacing="0" cellpadding="0" >
					 <tr>
					     <td height="45" colspan="3" class="fontsizeInput">
					       <em> Note : <br/>
					        a) The Dependents would include immediate family members - Parents, Spouse & Children
					       </em>
					     </td>
					  </tr>
			    	</table>
	          	</td>
	          </tr>
	         <tr>
	            <td class="fontsizeBig" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				NOMINEE FOR LIFE INSURANCE
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center">
	               <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td width="270" align="center">Name</td>
					    <td width="216" align="center">Relationship</td>
					    <td width="290" align="center">Age / Date of Birth</td>
					  </tr>
					  <tr class="fontsizeInput">
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
					</table>
				</td>
	          </tr>
	          <tr>
	          	<td align="center">
	          		<table>
					 <tr>
					     <td height="60" colspan="3" class="fontsizeInput">
					      <em> Note : <br/>
					        a) The Dependents would include only one or any of the immediate family members - Parents, Spouse & Children for Life Insurance
					     </em>
					     </td>
					  </tr>
			       </table>
	          	</td>
	          </tr>
	          <tr>
				  <td height="250">&nbsp;</td>
			  </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			   <tr>
				<td style="height: 15px;"> </td>
			 </tr>
				<tr>
				<td align="center"  class="fontsizeSmall" valign="bottom">3</td>
			</tr>
	       </table>
	    </div>  
	    <div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 10px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				EMERGENCY CONTACT (LOCAL NUMBER PREFERABLE)
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center">
	               <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr>
					  <%
							int emergencycount = 0;
							String qryemergencyCount = "select count(*) as count from cand_emergency_contact_details where Cand_Em_CandID = '"+autoID+"'";	
							rss = stmt.executeQuery(qryemergencyCount);
							if(rss.next())
							{
							emergencycount = rss.getInt("count");
							}
							rss.close();
					     %>
					    <td width="130" height="55"  class="fontsize">Contact Name </td>
					    <td width="250" class="fontsizeInput">
					    <% 
					     if(emergencycount >=1)
					     {
					     if(Emergency_Contact_Name != null)
						      {
						      %>
						      <%=Emergency_Contact_Names.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td width="130" class="fontsize">Contact Name </td>
					    <td width="252" class="fontsizeInput">
					    <% 
					     if(emergencycount >=2)
					     {
					     if(Emergency_Contact_Name != null)
						      {
						      %>
						      <%=Emergency_Contact_Names.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					  </tr>
					  <tr>
					    <td class="fontsize">Relationship</td>
					    <td class="fontsizeInput">
					    <% 
					     if(emergencycount >=1)
					     {
					     if(Emergency_Realtionship != null)
						      {
						      %>
						      <%=Emergency_Realtionships.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;</td>
					    <td class="fontsize">Relationship</td>
					    <td class="fontsizeInput">
					    <% 
					     if(emergencycount >=2)
					     {
					     if(Emergency_Realtionship != null)
						      {
						      %>
						      <%=Emergency_Realtionships.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr>
					    <td height="80" class="fontsize">Address</td>
					    <td class="fontsizeInput">
					    <% 
					     if(emergencycount >= 1)
					     {
					     if(Emergency_Address != null)
						      {
						      %>
						      <%=Emergency_Addresss.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td class="fontsize">Address</td>
					    <td class="fontsizeInput">
					    <% 
					     if(emergencycount >= 2)
					     {
					     if(Emergency_Address != null)
						      {
						      %>
						      <%=Emergency_Addresss.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr>
					    <td class="fontsize">Telephone No </td>
					    <td class="fontsizeInput">
					     <% 
					     if(emergencycount >= 1)
					     {
					     if(Emergency_Phone1 != null)
						      {
						      %>
						      <%=Emergency_Phone1s.get(0).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td class="fontsize">Telephone No </td>
					    <td class="fontsizeInput">
					    <% 
					     if(emergencycount >= 2)
					     {
					     if(Emergency_Phone2 != null)
						      {
						      %>
						      <%=Emergency_Phone1s.get(1).trim() %>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					</table>
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeBig">
	            				REFERENCES :
	            			</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeInput">
						    ( If Fresher- Reference will be either Lecturers/HOD/Principal/Doctors/Municipal Authority/Gazzeted Officer)<br/>
						    (Employees with work Experience- References will be the previous reporting Manager/TL/HR)
						    </td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center">
	                    <%
							int referencecount = 0;
							String qryreferenceCount = "select count(*) as count from cand_references_details where Cand_Passed_Auto_Id = '"+autoID+"'";	
							rss = stmt.executeQuery(qryreferenceCount);
							if(rss.next())
							{
							referencecount = rss.getInt("count");
							}
							rss.close();
						%>
	              <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr>
					    <td>
					    <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Contact_Name != null)
						      {
						      %>
						     <font class="fontsize">Name : </font> &nbsp;<font class="fontsizeInput"><%=Reference_Contact_Names.get(0).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Contact_Name2 != null)
						      {
						      %>
						       <font class="fontsize"> Name2 : </font> &nbsp;  <font class="fontsizeInput"><%=Reference_Contact_Names.get(1).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr>
					    <td>
					    <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Address != null)
						      {
						      %>
						      <font class="fontsize">Address1 : </font>&nbsp; <font class="fontsizeInput"><%=Reference_Addresss.get(0).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					    <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Address2 != null)
						      {
						      %>
						      <font class="fontsize">Address2 : </font>&nbsp; <font class="fontsizeInput"><%=Reference_Addresss.get(1).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr>
					    <td>
					    <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Phone1 != null)
						      {
						      %>
						      <font class="fontsize">Phone1 : </font>&nbsp; <font class="fontsizeInput"><%=Reference_Phone1s.get(0).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					    <td>
					     <% 
					     if(referencecount >=1)
					     {
					     if(Reference_Phone2 != null)
						      {
						      %>
						     <font class="fontsize">Phone2 :</font> &nbsp; <font class="fontsizeInput"><%=Reference_Phone1s.get(1).trim() %></font>
						      <%
						     }
						      else 
						      {
						      %>
						      &nbsp;
						      <%}
						  }
						  %>
					    &nbsp;
					    </td>
					  </tr>
					  <tr>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
				   </table>
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeInput" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeInput">
	            				Have you been convicted of any offence involving moral turpitude and which is punishable for a team exceeding 3 months; if yes, please mention the details below
	            			</td>
	            		</tr>
	            		<tr>
						    <td style="padding-top: 10px;">
						     	<hr width="100%">
						    </td>
						  </tr>
						  <tr>
						    <td style="padding-top: 10px;">
						    	<hr width="100%">
						    </td>
						  </tr>
	            	</table>
	             </td>
	          </tr>
	         
			  <tr>
				  <td style="height: 30px;">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">
			      <table width="750" border="0" cellspacing="0" cellpadding="6">
					  <tr>
					    <td width="410">
					      <table>
					        <tr>
					          <td class="fontsize">
					            Name :
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					           <%if(FullName != null) { %>
					           <%=FullName %> 
					           <%} else { %>
					           &nbsp;
					           <% }%>
					          </td>
					        </tr>
					      </table>
					    </td>
					    <td width="410">
					       <table>
					        <tr class="fontsizeBig">
					          <td>
					            Signature:
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					           &nbsp;
					          </td>
					        </tr>
					      </table>
					   </td>
					  </tr>
					  <tr>
					    <td colspan="2">
					      <table>
					        <tr class="fontsizeBig">
					          <td>
					             Date :
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					          <%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
				  </table>
			    </td>
			  </tr>
			  <tr>
				  <td style="height: 25px;">&nbsp;</td>
			  </tr>
			  <tr class="fontsizeBig">
			    <td  align="center">
			       DECLARATION
			    </td>
			  </tr>
			  <tr>
	            <td class="fontsizeInput" align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr class="fontsizeInput">
						    <td height="43">
						      This is to certify that I have not been convicted by any court of law for any criminal offence.I do not willfully indulge in drug abuse. All information furnished by me is correct in all aspects,and I take responsibility for the authenticity for the same.
						    </td>
						  </tr>
	            	</table>
	             </td>
	          </tr>
			  
			  <tr>
			    <td align="center">
			        <table width="750" border="0" cellspacing="0" cellpadding="6">
					 <tr>
					    <td>
					      <table>
					        <tr class="fontsizeBig">
					          <td>
					             Signature : 
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="165">
					           &nbsp;
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					  <tr>
					    <td>
					     <table>
					        <tr>
					          <td class="fontsize">
					            Name :
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					          <%if(FullName != null) { %>
					            <%=FullName %> 
					           <%} else { %>
					           &nbsp;
					           <% }%>
					           </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					  <tr>
					    <td>
					       <table>
					        <tr class="fontsizeBig">
					          <td>
					             Date : 
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					            <%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					</table>
			    </td>
			  </tr>
			   <tr>
				<td style="height: 10px;"> </td>
			 </tr>
			  <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			   <tr>
				<td style="height: 10px;"> </td>
			 </tr>
				<tr>
				<td align="center" class="fontsizeSmall" valign="bottom">4</td>
			</tr>
	       </table>
	    </div>
	    <div class="break" style="width: 100%;" align="center">
   		   <table width="820" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left" width="180">
	   		         <table>
	   		           <tr>
	   		             <td align="left">
	   		                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	   		             </td>
	   		              <td class="fontsizeBig" align="center" rowspan="2"> 
	                       EMPLOYEE UNDERTAKING
	                      </td>
	   		           </tr>
	   		           <tr>
	   		             <td class="fontsizeInput" align="left">
	   		               <ol type="none">
		   		               	<li type="none">
		   		               		[24]7 Customer Pvt. Ltd.,<br/>
									Embassy Golf Links Software <br/>
									Survey No.2/1,2/2,2/3 &5/1,<br/>
									Challaghatta Village, Varthur Hobli,<br/>
									Bangalore South Taluk, Bangalore 560071 
		   		               	</li>
	   		               </ol>
	   		               
	   		             </td>
	   		           </tr>
	   		         </table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		 <tr>
				            <td class="fontsizeInput" align="justify">
				               <br/>
				               <ol type="none">
					               	<li type="none">
					               		<p> In consideration of my employment by [24]7 Customer Pvt. Ltd., (herein after referred to as the company) and the salary or wages paid to me, I agree:</p>
					               	</li>
				               </ol>
				               <ol>
				                   <li>
				                        <p>
				                         To abide by the rules and regulation of the company which are in force and/or may be framed from time to time.
				                       </p>
				                   </li>
				                   <li>
				                      <p>
				                        To maintain confidentiality associated with my work behaviour and breach of this work behaviour would attract very severe disciplinary action.
				                      </p>
				                   </li>
				                   <li>
				                      <p>
				                        That in the job position offered to me ,the company will trust me with assignments and responsibilities as it may deem fit and it would expect me to accept such assignments and responsibilities with high faith and commitment.
				                      </p>
				                   </li>
				                   <li>
				                      <p>
				                        Not to engage myself directly or indirectly in any service or be concerned in any manner in any business other than that of the company and shall not associate myself nor let my work,name,image or personality be used by any other organization without the express consent of company in writing by head of the division and Head of the Human Resources Department.
				                      </p>
				                   </li>
				                   <li>
				                      <p>
				                        To be responsible for the safe-keeping of all the company's property and observance of all safety protocols failing which the company reserves its right to take appropriate disciplinary action against me. The disciplinary action may include fine or termination from services of the organization depending on the extent of the misconduct.
				                      </p>
				                   </li>
				                   <li>
				                      <p>
				                        To keep the company informed of any changes in my residential address or civil status.
				                      </p>
				                   </li>
				                   <li>
				                       To disclose and assign to the company as its exclusive property, all invention and technical or business innovations copyrights,trademarks, designs and any other intellectual property developed , conceived or produced by me solely or jointly with others during the period of my employment.
				                      <ol type="a">
				                        <li>
				                          That are along the lines of  the business work or investigations the company or its affiliates to which my employment relates  or as to which I may receive information due to my employment.
				                        </li>
				                        <li>
				                          That result from or are suggested by any work which I may do for the company or
				                        </li>
				                        <li>
				                           That are otherwise made through the use of company time ,facilities or materials.
				                        </li>
				                        <li>
				                           The copyright in any class of work  i.e..
				                            <ol type="i">
				                              <li>
				                                Original literary , dramatic, musical and artistic works.
				                              </li>
				                              <li>
				                                Cinematography film and
				                              </li>
				                              <li>
				                                Records
				                              </li>
				                              <li>
				                                E-Commerce
				                              </li>
				                            </ol>
				                         </li>
				                      </ol>
				                      <p> Produced in the course of my employment ,which shall remain its exclusive property during                                     
			                            and after the said employment .
			                          </p>
				                   </li>
				                   <li>
				                     <p>
				                       To execute all necessary  documents and provide proper assistance during and subsequent to my
			                           employment to enable the company to obtain for itself or for its nominees copyrights, patents or other legal protection for such inventions or innovations in any and all countries.
				                     </p>
				                   </li>
				                   <li>
				                     <p>
				                       To make and maintain for the company adequate and current written records of such inventions or innovations.
				                     </p>
				                   </li>
				                   <li>
				                         To maintain all information/documents/materials gathered by me during the course of my                                               
							              employment in strict confidence. Not the copy or make notes of such information /documents    
							              except in conjunction with my work for the company. I will not divulge to anyone outside the  
							              company or use any of the information /  documents/materials gathered during the course of  
							              my employment for my own or anyone else's benefit,either during or after the term of 
							              employment with the company. The aforesaid 
				                   </li>
				                </ol>
				            </td>
				          </tr>
				           <tr>
							<td style="height: 20px;"> </td>
						 </tr>
				           <tr>
				            <td class="fontsizeInput">
					           <ol type="none">
					           	<li type="none">
					           		<p>
					              		I Agree__________________
					            	</p>
					           	</li>
					           </ol>
					        </td>
				          </tr>
	            	</table>
	             </td>
	          </tr>
	         <tr>
				  <td style="height: 30px;">&nbsp;</td>
			  </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			   <tr>
				<td style="height: 10px;"> </td>
			 </tr>
				<tr>
				<td align="center"  class="fontsizeSmall" valign="bottom">5</td>
			</tr>
	       </table>
	   </div>   
	   <div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		 <tr>
				            <td class="fontsizeInput" align="justify">
				              <ol type="none">
				              	<li type="none">
					                obligation shall also apply to proprietary/confidential information/documents of third parties 
				                    received by me or the company in the normal course of my employment with the company.
				              	</li>
				              </ol>
				            </td>
				          </tr>
				          <tr>
				            <td align="justify" class="fontsizeInput">
				               <ol>
				                 <li value=11>
			                       <p>
			                       		Upon severance of my employment for whatever reason, to deliver to the company, promptly all items which belong to the company or what by there nature is for the use of company employees only, including without Limitation, all written and other internals which are of a secret or confidential nature relating to the business of the company or its Affiliates.
				                   </p>
				                 </li>
				                 <li>
								 	<p>
										Not to use, publish or otherwise disclose or (divulge except as my company duties may        
										require)either during or subsequent to my employment any information/documents/material      
										secret or confidential information or data of the company is obligated to maintain in confidence.    
				               	 	</p>
				                 </li>
				                 <li>
									 <p>
										Not to disclose or utilize in my work with the company any secret or confidential
				                        information of others( including any prior employers).
				                 	</p>
				                 </li>
				                 <li>
									<p>
									Not to solicit, encourage , or cause others to solicit or encourage any employees of the 
			                        company to terminate their employment with the company and for a period of twenty four months thereafter.
				                 	</p>
				                 </li>
				                 <li>
									<p>
									Not to solicit or accept any business from, or perform any services for,any individual or 
									entity that I may have soliciated, served, contacted or became aware of as a result of or arising                       
									out of employment with company, for the period beginning upon the seperation of employment                    
									and continuing thereafter until the expiration of twelve(12) months.
				                   <br/>
					                This undertaking supersedes and replaces any existing agreement between the company and me 
				                    relating generally to the same subject matter. I represent that expect as stated below . I have no 
				                    agreements with or obligations to others in conflict with the obligations undertaken herein.
				                 	</p>
				                 </li>
				               </ol>
				            </td>
				          </tr>
	            	</table>
	             </td>
	          </tr>
	         <tr>
	            <td align="center">
	            	<table width="750" border="0" cellpadding="0" cellspacing="0">
			          <tr>
			            <td class="fontsizeInput">
			               <p>(Please state NIL if there are none)</p>
			            </td>
			          </tr>
			          <tr>
			            <td style="padding-top: 20px;" class="fontsizeInput">
			               <p>I Agree______________</p>
			               <p>___________________________________</p>
			            </td>
			          </tr>
			          <tr>
			            <td style="padding-top: 20px;" class="fontsizeInput">
			                    I understand that the terms used are in the ordinary sense. Without limitation, examples of 
					             material ,information and data which may be of a secret or confidential nature are    
					             designs,drawings,manuals,note books,reports,processes,source,codes,object codes,computer 
					             programs,accounting methods,trade secrets,financial information,sales data,business and 
					             marketing plans and information systems including such materials,information and data which 
					             are in machine readable form.
			            </td>
			          </tr>
			         <tr align="left">
			            <td style="padding-top: 20px;">
			              <table width="750" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td width="330">
							      <table border="0" cellspacing="0" cellpadding="6">
							        <tr>
							          <td class="fontsize">
							             Full Name :
							          </td>
							         <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="213">
											 <%if(FullName != null) { %>
								           			<%=FullName %> 
								           		<%} else { %>
								           			&nbsp;
								           		<% }%>
										</td>
							        </tr>
							      </table>
							    </td>
							    <td width="330">
							      <table border="0" cellspacing="0" cellpadding="6">
							        <tr class="fontsize">
							          <td>
							             Employee Code :
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
							           &nbsp;
							          </td>
							        </tr>
							      </table>
							    </td>
							  </tr>
							  <tr>
							    <td>
							      <table border="0" cellspacing="0" cellpadding="6">
							        <tr class="fontsize">
							          <td>
							             Department :
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
							            PMG&nbsp;
							          </td>
							        </tr>
							      </table>
							    </td>
							    <td>
							    	<table border="0" cellspacing="0" cellpadding="6">
							        <tr class="fontsize">
							          <td>
							             Location : 
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="237">
							           <%=userCentreName %>
							          </td>
							        </tr>
							      </table>
							    </td>
							  </tr>
							  <tr>
							    <td>
							    	<table border="0" cellspacing="0" cellpadding="6">
							        <tr class="fontsize">
							          <td>
							             Signature :
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="210">
							           &nbsp;
							          </td>
							        </tr>
							      </table>
							    </td>
							    <td>
							       <table border="0" cellspacing="0" cellpadding="6">
							        <tr class="fontsize">
							          <td>
							             Date :
							          </td>
							           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="260">
							            <%=CurrDAteDisp %>
							          </td>
							        </tr>
							      </table>
							    </td>
							  </tr>
							  <tr>
							    <td>
							       	<table border="0" cellspacing="0" cellpadding="6">
									  <tr>
									    <td colspan="2" class="fontsize">Witnessed By : </td>
									  </tr>
							        <tr class="fontsize">
							          <td>
							             Name :
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="220">
							            &nbsp;
							          </td>
							        </tr>
							      </table>
							    </td>
							    <td>
							    	<table>
							        <tr class="fontsize">
							          <td>
							            Designation : 
							          </td>
							          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="230">
							           &nbsp;
							          </td>
							        </tr>
							      </table>
							    </td>
							  </tr>
							</table>
			            </td>
			          </tr>
			          <tr class="fontsizeBig">
					    <td style="padding-top: 20px;" align="center">
					       Declaration of Acceptance
					    </td>
					  </tr>
					  <tr>
					    <td style="padding-top: 10px;">
					       <table width="750" border="0" cellspacing="0" cellpadding="6">
							  <tr class="fontsize">
							    <td>I hereby declare that I have read the employee handbook and accept the terms laid down,herein.</td>
							  </tr>
							  <tr>
							    <td>
							     <table>
							       <tr>
								      <td class="fontsize">
								      	 Name of Employee :
								      </td>
								      <td  class="fontsizeInput">
								        <%=FullName %>
								      </td>
								   </tr>
							     </table>
							   </td>
							  </tr>
							  <tr class="fontsize">
							    <td>Signature :</td>
							  </tr>
							  <tr class="fontsize">
							   <td>
							     <table>
							       <tr>
								      <td class="fontsize">
								      	 Date :
								      </td>
								      <td  class="fontsizeInput">
								        &nbsp;<%=CurrDAteDisp %>
								      </td>
								   </tr>
							     </table>
							   </td>
							  </tr>
							  <tr class="fontsize">
							   <td>
							     <table>
							       <tr>
								      <td class="fontsize">
								      	 Place :
								      </td>
								      <td  class="fontsizeInput">
								        &nbsp;<%=userCentreName %>
								      </td>
								   </tr>
							     </table>
							   </td>
							  </tr>
							</table>
					    </td>
					  </tr>
	            	</table>
	            </td>
	          </tr>
			  <tr>
				  <td height="20"></td>
			  </tr>
			  <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			   <tr>
				<td style="height: 15px;"> </td>
			 </tr>
				<tr>
				<td align="center"  class="fontsizeSmall" valign="bottom">6</td>
			</tr>
	      </table>
	   </div>
	    <div class="break" style="width: 100%;" align="center">
   		    <table width="820" height="1000" align="center" cellpadding="0" cellspacing="0">
   		      <tr>
   		        <td align="center" height="25">
   		        </td>
   		      </tr>
   		      <tr>
   		        <td align="center" class="fontsizeBig">
   		           NON-DISCLOSURE AGREEMENT
   		        </td>
   		      </tr>
   		      <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
			   		        <td class="fontsizeInputSmallest" align="justify">
			   		           <ol type="none">
			   		           	<li type="none">
				   		           This NON-DISCLOSURE AGREEMENT ("Agreement") is entered in to as of this <u><font style="font-weight: bold;"><%=currentDay %></font></u> day of &nbsp;<u><font style="font-weight: bold;"><%=currentMonth %></font></u> <u><font style="font-weight: bold;"><%=currentYear %></font></u>, by and between [24]7 Customer Pvt. Ltd.., a company duly registered  under the companies Act,1958 and having its registered office at Embassy Golf Links Business Park,Survey Nos. 2/1,2/2,2/3 &5/1, Challaghatta Village, Varthur Hobli, Bangalore South Taluk, Bangalore 560 071 and <u><font style="font-weight: bold;"><%=firstLastName%></font></u>
				   		            <%if(Gender.equalsIgnoreCase("Male")) 
											    	{
											    	%>
											    	 (s/o,<strike>d/o</strike>,<strike>w/o</strike>)
											    	<%
											    	}
											    	else if(Gender.equalsIgnoreCase("Female"))
											    	{
											    		if(MaritalStatus.equalsIgnoreCase("Y"))
											    		{
											    			%>
											    			(<strike>s/o</strike>,<strike>d/o</strike>,w/o)
											    			<%
											    		}
											    		else
											    		{
											    			%>
											    			(<strike>s/o</strike>,d/o,<strike>w/o</strike>)
											    			<%
											    		}
											    	}
											    	%>
				   		            <u><font style="font-weight: bold;"><%=candFHName %></font></u>,aged about <u><font style="font-weight: bold;"><%=candAGE %></font></u>&nbsp;years,residing at &nbsp;<u><font style="font-weight: bold;"><%=CurrentAddress %></font></u>("Employee")
				                     (each a "Party"and collectively, the "Parties")
				   		        </li>
				   		       </ol>
			   		           <ol>
			   		             <li>
			   		                In connection with the employment of the Employee with [24]7 Customer Pvt. Ltd..,[24]7 may from time to time disclose to the Employee certain confidential Information.As used herein, "Confidential Information" shall mean any written or oral information concerning [24]7 Customer Pvt. Ltd..,clients,business of [24]7 Customer Pvt. Ltd..,including but not limited to past ,present or future plans,forms,methods,technology,inventions,computer software programs,copyrights,research and development activities,customer,financial and business information, trade secrets or other confidential or proprietary information of [24]7 Customer Pvt. Ltd., or its subsidiaries or affiliates.
			   		             </li>
			   		             
			   		             <li style="padding-top: 3px;">
			   		                 In consideration of the disclosure reffered to in Section 1 hereof, and notwithstanding anything contained anywhere in the contract of employment with employee ,the Employee agrees that (a) the confidential information must be kept strictly confidential using an optimum degree of care , but in no event less than a reasonable degree of care, (b) the employee shall not sell, trade, publish or otherwise disclose to anyone in any manner whatsoever including by means of photocopy or reproduction ,any of the Confidential Information without [24]7 Customer Pvt. Ltd..,prior written consent  and (c) the confidential Information will not be used by the Employee except in connection with his/her employment with [24]7 Customer Pvt. Ltd..,
			   		             </li>
			   		             <li style="padding-top: 3px;">
			   		                    Disclosure of information by [24]7 Customer Pvt. Ltd.., to the Employee,including but 
										not limited to confidential information shall not be, or be deemed to be, a license or transfer 
										of any rights,including those pretaining to ownership ,trademarks,copyrights or patents 
										relating to such disclosed information. The Confidential information shall remain the 
										property of [24]7 Customer Pvt. Ltd..,and [24]7 Customer Pvt. Ltd..,may demand the return 
										thereof at any time from the Employee.On receipt of such notice or upon termination of this 
										Agreement ,the Employee shall return forthwith,all of the original confidential information in 
										his/her  possession, including notes and work papers containing  confidential information. 
			   		               
			   		             </li>
			   		             <li style="padding-top: 3px;">
			   		                   
			   		                    If the Employee becomes legally compelled to disclose any of the Confidential Information 
										of [24]7 Customer Pvt. Ltd.,such Employee will provide [24]7 Customer Pvt. Ltd.,with prompt
										notice prior to any disclosure to a third party so that [24]7 Customer Pvt. Ltd..,may seek a 
										protective oreder or other appropriate remedy.If such protective order or other remedy is not 
										obtained the employee will furnish only that portion of the confidential Information which is 
										legally required , and the Employee will cooperate with [24]7 Customer Pvt. Ltd..,counsel to 
										enable [24]7 Customer Pvt. Ltd..,to obtain a protective order or other reliable assurance that 
										confidential treatment will be accorded the same.
									
			   		             </li>
			   		             <li style="padding-top: 3px;">
			   		                   
			   		                   [24]7 Customer Pvt. Ltd.., may terminate this Agreement at any time. The obligations,which
			                            require surviving by nature ,shall survive the termination of this Agreement.
			   		                   
			   		              </li>
			   		             <li style="padding-top: 3px;">
			   		                 
			   		                    [24]7 Customer Pvt. Ltd..,makes no representations or warranties express or implied,as to 
										the quality, accuracy, and compeletness of the confidential information disclosed hereunder.
										[24]7 Customer Pvt. Ltd.., its affiliates and their officers, directors  and employees shall have 
										no liability whatsoever with respect to the use of or relaince upon the Confidential 
										Information by the Employee.
			   		                
			   		             </li>
			   		              <li style="padding-top: 3px;">
			   		                  This Agreement shall be governed by and interpreted in accordance with the laws of India.
			   		              </li>
			   		             <li style="padding-top: 3px;">
			   		                    No amendments, changes or modifications to this Agreement shall be valid except if the 
										same are in writing and signed by a duly authorized representative of [24]7 Customer Pvt                           
										Ltd..,Waiver of any breach of this Agreement must be in writing to be effective and shall not 
										be a waiver of any subsequent breach,nor shall it be a waiver of the underlying obligation.This
										Agreement comprises the full and complete agreement of the parties hereto with respect to the 
										disclosure of the confidential Information and supersedes and cancels all prior communication,
										understandings, and agreements between the parties hereto,whether written or oral,expressed 
										or implied with respect thereto.All provisions of this Agreement are severable,and the 
										unenforceability or invalidity of any of the provisions of this Agreement shall not affect the 
										validity or enforceability of  the remaining provisions of this Agreement.
			   		             </li>
			   		              <li style="padding-top: 3px;">
			   		                    [24]7 Customer Pvt. Ltd..,shall be entitled to injunctive and other equitable relief, without 
										the posting of a bond if permitted by law,in the event of a breach or threatened breach of this 
										Agreement by the Employee .The Employee shall not plead as a defense that there would be an 
										adequate remedy at law. Any such relief shall be in addition to, and not in lieu of, money 
										damages or any other legal or equitable remedy available to  [24]7 Customer Pvt. Ltd..,
			   		             </li>
			   		             <li style="padding-top: 3px;">
			   		                    This Agreement may be executed in counterparts, each of which when executed and 
			                            delivered shall be an original, but all of which shall constitute one and the same instrument.
			                     </li>
			   		           </ol>
			   		           <ol type="none">
			   		           	 <li type="none">
			   		           		IN WITNESS WHEREOF, the duly the parties have caused this Non-Disclosure Agreement to be executed on the date first written above.
			   		            </li>
			   		           </ol>
			   		          </td>
			   		      </tr>
	            	</table>
	             </td>
	          </tr>
   		      <tr>
   		        <td align="center">
   		         <table width="750" cellspacing="2" cellpadding="0" border="0">
					  <tr>
					    <td width="430">
					     <table>
					      <tr>
					        <td class="fontsize">
					        	Name of Employee : 
					        </td>
					        <td class="fontsizeInput">
					        	<u><%=FullName %></u>
					        </td>
					      </tr>
					     </table>
					    
					    </td>
					    <td width="360" class="fontsize">Witness : </td>
					  </tr>
					  <tr>
					    <td class="fontsizeInput"></td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             By :
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="220">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Sign :
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	 
					    </td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Name : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Date : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
								<%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>
					    </td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Title : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="208">
					            &nbsp;
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					  <tr>
					    <td>&nbsp;</td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Date : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="205">
								<%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td class="fontsizeBig">[24]7 Customer Pvt. Ltd. </td>
					     <td>
					    	<table>
					        <tr class="fontsize">
					           <td>
					             By :
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="220">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td>
					    	<table>
					        <tr class="fontsize">
					           <td>
					             By :
					          </td>
					           <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="220">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Name : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Name : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					            &nbsp;
					          </td>
					        </tr>
					      </table>	
					    </td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Title : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="208">
					            &nbsp;
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					  <tr>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Title : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="208">
					            &nbsp;
					          </td>
					        </tr>
					      </table>
					    </td>
					    <td>
					    	<table>
					        <tr class="fontsize">
					          <td>
					             Date : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="205">
								<%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					  <tr>
					    <td colspan="2">
					    	<table>
					        <tr class="fontsize">
					         <td>
					             Date : 
					          </td>
					          <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="205">
								<%=CurrDAteDisp %>
					          </td>
					        </tr>
					      </table>	
					    </td>
					  </tr>
					</table>
   		        </td>
   		      </tr>
   		      <tr>
   		        <td align="center" height="10">
   		        </td>
   		      </tr>
   		     <tr>
			    <td class="fontsizeSmall" align="center">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			 <tr>
				<td align="center" class="fontsizeSmall">7</td>
			</tr>
   		    </table>
   	    </div>
   	    <div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center"> 
	              TRANSPORTATION DECLARATION FORM
	            </td>
	          </tr>
	          <tr>
	            <td align="center">
	               <table width="750" border="0" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td>
					      <table border="0" cellspacing="0" cellpadding="0">
					        <tr>
					          <td class="fontsize">
					           Name :
					          </td>
					          <td  class="fontsizeInput" style="border-bottom: thin solid;" width="650">
					             &nbsp; <%= FullName %>
					          </td>
					        </tr>
					      </table>
					    </td>
					  </tr>
					  <tr class="fontsize">
					    <td>
					      <table border="0" cellspacing="0" cellpadding="0">
					        <tr>
					          <td class="fontsize">
					           Emp ID : 
					          </td>
					          <td class="fontsizeInput" style="border-bottom: thin solid;" width="643">
					          &nbsp;
					          </td>
					        </tr>
					      </table>
					    </td>
					   </tr>
					  <tr class="fontsize">
					    <td>
					      <table border="0" cellspacing="0" cellpadding="0">
					        <tr>
					          <td class="fontsize">
					           Current Address :  
					          </td>
					          <td class="fontsizeInput" style="border-bottom: thin solid;"  width="587">
					          &nbsp;
					          <%if((CurrentAddress != null) && (!CurrentAddress.equals(""))) { %>
					          <%= CurrentAddress%>
					          <% } else { %>
					           &nbsp;
					           <%} %>
					          </td>
					        </tr>
					      </table>
					    </td>
					 </tr>
					  <tr class="fontsize">
					    <td>
					      <table border="0" cellspacing="0" cellpadding="0">
					        <tr>
					          <td class="fontsize">
					           Current Address2 :  
					          </td>
					          <td class="fontsizeInput" style="border-bottom: thin solid;"  width="580">
					          &nbsp;
					          <%if((Current_Area_Name != null) && (!Current_Area_Name.equals(""))) { %>
					           Area : <%=Current_Area_Name %>,&nbsp;City : <%=CurrentCity %>,&nbsp;State : <%=CurrentState %>,&nbsp;Pincode : <%=CurrentPinCode %>
					          <% } else { %>
					           &nbsp;
					           <%} %>
					          </td>
					        </tr>
					      </table>
					    </td>
					 </tr>
					 <tr class="fontsize">
					     <td>
					      <table>
					        <tr>
					          <td class="fontsize">
					           Land Mark : 
					          </td>
					          <td class="fontsizeInput" style="border-bottom: thin solid;"  width="613">
					          <%if((Current_LandMark != null) && (!Current_LandMark.equals(""))) { %>
					          <%=Current_LandMark %>
					          <%} else { %>
					          &nbsp;
					          <%} %>
					          </td>
					        </tr>
					      </table>
					    </td>
					   </tr>
					  <tr class="fontsize">
					   <td> 
					      <table>
					        <tr>
					          <td class="fontsize">
					           Contact Nos :
					          </td>
					          <td class="fontsizeInput" style="border-bottom: thin solid;"   width="603">
					          <%if((CurrentMobileNo != null) && (!CurrentMobileNo.equals(""))) { %>
					          Mobie #  &nbsp;: &nbsp;<%= CurrentMobileNo%>
					          <%} else { %>
					          &nbsp;
					          <%} %>
					          <%if((CurrentPhoneNo != null) && (!CurrentPhoneNo.equals(""))) { %>
					          ,&nbsp;Phone #  &nbsp;: &nbsp;<%= CurrentPhoneNo%>
					          <%} else { %>
					          &nbsp;
					          <%} %>
					          </td>
					        </tr>
					        <tr>
					            <td style="padding-top: 30px;" colspan="3" class="fontsize">
					              <p> I hereby declare that the above mentioned details are accurate and can be used for all future correspondence.</p>
					            </td>
				          	</tr>
				          	 <tr>
					            <td height="45">
					            </td>
					          </tr>
					          <tr>
					            <td  class="fontsize" colspan="3">
					               ___________________
					            </td>
					          </tr>
					         <tr>
					            <td class="fontsize" colspan="3">
					              Signature of the Employee
					            </td>
					          </tr>
					          <tr>
					            <td height="45">
					            </td>
					          </tr>
					      </table>
					    </td>
					    <td>
					  </tr>
					</table>
	            </td>
	          </tr>
	          
	          <tr>
	            <td class="fontsizeBig" align="center">
	               VOLUNTARY DECLARATION FOR WORKING IN NIGHT SHIFT
	            </td>
	          </tr>
	          <tr>
	            <td height="10">
	            </td>
	          </tr>
	          <tr>
				<td align="center">
					<table width="750" cellspacing="0" cellpadding="6" border="0">
						 <tr>
				            <td class="fontsize" align="left">
								<p>
								[24]7 Customer Pvt. Ltd.,<br/>
								Embassy Golf Links Software<br/> 
								Survey No.2/1,2/2,2/3 &5/1,<br/>
								Challaghatta Village, Varthur Hobli,<br/>
								Bangalore South Taluk, Bangalore 560 071 
								</p>
				            </td>
				          </tr>
				          <tr>
				            <td height="25">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsize" align="left">
				              Dear Sir,
				            </td>
				          </tr>
				          <tr>
				            <td height="25">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsize" align="left">
				              I understand that my work responsibilities at 24/7 requires me to work during the night also on certain occasions.
				            </td>
				          </tr>
				          <tr>
				            <td height="10">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsize" align="left">
				             I hereby agree to work during the night shift.
				            </td>
				          </tr>
				           <tr>
				            <td height="25">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsize" align="left">
				             Signature of the Employee : _______________________
				            </td>
				          </tr>
				           <tr>
				            <td height="15">
				            </td>
				          </tr>
				          <tr>
				            <td align="left">
				              <table>
				               <tr>
				                 <td class="fontsize">
				                 	Name of the Employee : 
				                 </td>
				                 <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="175">
									<%if(FullName != null)
			                 		 {
			                 		 %>
			                           <%=FullName %>
			                        <%} 
			                        else 
			                        { 
			                        %>
			                       &nbsp;
				                   <%
				                   } 
				                   %>
				                 </td>
				               </tr>
				              </table>
				            </td>
				          </tr>
					</table>
				</td>
			  </tr>
	          <tr>
	            <td height="120">
	            </td>
	          </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				<td style="height: 15px;"> </td>
			 </tr>
	          <tr>
	            <td align="center"  class="fontsizeSmall" valign="bottom">8
	            </td>
	          </tr>
	       </table>
	   </div>
	   <div class="break" style="width: 100%;" align="center">
   		   <table width="820" height="1000" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
				  <td style="height: 20px;">&nbsp;</td>
			  </tr>
   		      <tr>
	   		     <td align="left">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td height="45">
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center" >
	              GUIDELINES FOR CUSTOMER CARE, TELESALES AND TECHNICAL SUPPORT PROFFESIONALS
	            </td>
	          </tr>
	           <tr>
	            <td height="45">
	            </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		 <tr>
				            <td class="fontsizeInput" align="justify" >
				               <ol type="none">
					              <li type="none">
					               		<p>
					                   I  <u style="font-weight: bold;"> <%=FullName %></u>, by my signature below hereby acknowledge , agree and certify as follows:
					                  </p>
					               	</li>
				               </ol>
				               <ol>
				                  <li>
				                     <p>I have completed [24]7 Customer Pvt. Ltd., HR Policies training program. I certify that I understand the procedures set forth in the training program regarding acceptable and unacceptable conduct during contact with customer of our clients.</p>
				                  </li>
				                  <li>
				                    <p>I will be guided by the following conduct standards when interacting with customer of our clients:</p>  
				                         <p>
					                     	 - I will be commited to the customer's satisfaction.
					                     </p>
					                     <p>
					                     	 - I will do my utmost  to be clear, honest and accurage in my representations.
					                     </p>
					                     <p>
					                      	- I will communicate in a respectful and courteous manner.
					                     </p>
					                     <p>
					                     	-  I will  respond to inquiries and complaints in a constructive,timely way.
					                     </p>
					               </li>
					               <li>
					                 <p> I  covenant and agree never to engage in any  of the   following activity:</p>
					                  <p>
					                   	- Using threats of any kind during the transaction with the customer ( whether by threats  to bodily injury,financial  ruin,threats to credit or otherwise)
					                  </p>
					                  <p>
					                  	- Attempting to intimidate a customer,including engaging in any act or making any statement that puts undue pressure on a customer or questions the customer's intelligence,honesty ,reliability or concern for the family.
					                  </p>
					                  <p>
					                  	- Using profane, Vulgar ,obscence or abusive language ( regardless of the language that the customer uses).
					                  </p>
					                  <p>
					                  	- Disparaging any person or group.
					                  </p>
					                  <p>
					                  	- Making misrepresentations ( whether by making a material misstatement or omitting to state a necessary fact)of any kind,including regarding aproduct or a service or about a refund or cancellation policy (if applicable)
					                  </p>
					               </li>
					               <li>
					                <p>
					                 	I  understand  that particular clients of [24]7 Customer Pvt. Ltd., have  specific  conduct requirements for customer interactions. Specially I have been assigned to the <font class="fontsize"><u><%=programName %>,&nbsp;<%=subProgramName %></u>&nbsp;</font>Programe&nbsp;(the Program).Under this program,I have been informed  of examples of "non-negotiable behaviour"(NNB).I have read and am familiar with the NNB and I will comply with the rules against NNB  during my work on the program.
					                </p>
					               </li>
					               <li>
					                <p>
					                 	I understand that during the course of my employment with  [24]7 Customer Pvt. Ltd., I may be 
										transferred to work on programs of other clients.I agree to uphold the prohibitions against NNB of other clients that I may be provided with from time to time during my employment with [24]7 Customer Pvt. Ltd.,
					                </p>
					                 <p>
					                 	I understand that the consequences of conduct contrary to [24]7 Customer Pvt. Ltd.,Guidelines,could include immediate termination of my employment.
					                </p>
					               </li>
				                 </ol>
				            </td>
				          </tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td height="180">
	            </td>
	          </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				<td style="height: 15px;"> </td>
			 </tr>
	          <tr>
	            <td align="center"  class="fontsizeSmall" valign="bottom">9
	            </td>
	          </tr>
	       </table>
	  </div>
	   <div class="break" style="width: 100%;" align="center">
   		   <table width="820" align="center" cellpadding="3" cellspacing="0">
   		     <tr>
	            <td height="20">
	            </td>
	          </tr>
   		      <tr>
	   		     <td align="left">
	                <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo"/>
	             </td>
	          </tr>
	          <tr>
	            <td height="60">
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center">
	            	 ACKNOWLEDGEMENT OF RECEIPT
	            </td>
	          </tr>
	          <tr>
	            <td height="10">
	            </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
				            <td class="fontsizeInput" align="justify" >
				              <p>
				                  I have received and read the [24]7 Customer Pvt. Ltd.,code of Business Conduct and Ethics dated as of November 2009(hereafter this "code of Ethics").I understand the standards and polcies contained in this Code of Ethics.I agree to comply with this Code of Ethics at all  times during my employment with the company.I understand that my failure to comply with these requirements may result in disciplinary action against me,up to the including termination of my employment with [24]7 Customer Pvt. Ltd.,
				              </p>
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsizeInput" align="justify"  style="padding-top: 20px;">
				              <p>
				                  If I have questions concerning the meaning or application of this Code of Ethics,any company policies or the legal and regulatory requirement applicable to my job ,I know I can consult my manager ,the Human Resources Department or the Legal Department. I further understand that this Code of Ethics may be amended or modified from time to time by [24]7 Customer Pvt. Ltd.,
				              </p>
				            </td>
				          </tr>
	            	</table>
	             </td>
	          </tr>
	          <tr>
	            <td height="55">
	            </td>
	          </tr>
	          <tr>
	          	<td align="center">
	          	 <table width="750" border="0" cellspacing="0" cellpadding="0">
	          	 	 <tr>
			            <td class="fontsize" align="left">
				          <table>
			               <tr>
			                 <td class="fontsize">
			                 	Employee Name : 
			                 </td>
		                	 <td class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="200">
					           <%if(FullName != null) { %>
					           <%=FullName %> 
					           <%} else { %>
					           &nbsp;
					           <% }%>
				          	</td>
			               </tr>
			              </table>
			            </td>
			          </tr>
			           <tr>
			            <td height="40">
			            </td>
			          </tr>
			          <tr>
			            <td class="fontsize" align="left">
			              <table>
						        <tr class="fontsize">
						          <td>
						             Signature :
						          </td>
						          <td width="230" align="left" style="border-bottom: thin solid;" class="fontsizeInput">
						            &nbsp;
						          </td>
						        </tr>
						   </table>
			            </td>
			          </tr>
			           <tr>
			            <td height="40">
			            </td>
			          </tr>
			          <tr>
			            <td class="fontsize" align="left">
			             <table>
						        <tr class="fontsize">
						          <td>
						             Date :
						          </td>
						          <td width="230" align="left" style="border-bottom: thin solid;" class="fontsizeInput">
						            <%=CurrDAteDisp %>
						          </td>
						        </tr>
						   </table>
			            </td>
			          </tr>
			          <tr>
			            <td height="45">
			            </td>
			          </tr>
			          <tr>
			            <td class="fontsizeInput" align="left" >
			              <p> 
			                Please sign and return this form to the Human Resources Department.
			              </p>
			            </td>
			          </tr>
	          	 </table>
	          	</td>
	          </tr>
	         
	          <tr>
	            <td height="380">
	            </td>
	          </tr>
	          <tr>
			    <td class="fontsizeSmall" align="center" valign="bottom">
			       This document contains unpublished, non-binding, confidential and proprietary information of [24]7. No disclosure, duplication or use of any portions <br/>of the contents of these materials, for any purpose may be made without the prior express written consent of [24]7.<b>Version 1.4</b>
			    </td>
			  </tr>
			  <tr>
				<td style="height: 15px;"> </td>
			 </tr>
	          <tr>
	            <td  class="fontsizeSmall" align="center" valign="bottom">10</td>
	          </tr>
	      </table>
	 </div>
	 <div class="break" style="width: 100%;" align="center">
   		   <table width="820" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
	            <td height="60">
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center">
	            	 <p> Payment of Gratuity (Central) Rules, 1972<br/> Form 'F' </p>
	            </td>
	          </tr>
	          <tr>
	            <td height="10">
	            </td>
	          </tr>
	           <tr>
	            <td class="fontsize" align="center">
	              <p> See sub-rule(1) of Rule 6 </p>
	            </td>
	          </tr>
	           <tr>
	            <td height="10">
	            </td>
	          </tr>
	          <tr>
	            <td align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
			            <td class="fontsize" align="left">
			              <p> Nomination </p>
			            </td>
			          </tr>
			          <tr>
			            <td height="10">
			            </td>
			          </tr>
			          	<tr>
				            <td height="10">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsizeInput" align="left">
				              <p> To, <br/> (Give here name or description of the establishment with full address) </p>
				            </td>
				          </tr>
				          <tr>
				            <td height="10">
				            </td>
				          </tr>
				          <tr>
				            <td align="left" class="fontsize"><u><%=centreAddress %></u>&nbsp; </td>
				          </tr>
				          <tr>
				            <td height="10">
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table width="750" border="0" cellspacing="0" cellpadding="0">
				                <tr>
				                 <td class="fontsizeInput" align="left" width="130"> 
				                    I, Shri/Shrimati/Kumari
				                 </td>
				                 <td align="center" class="fontsize" style="border-bottom: thin solid;width: 690px;">
				                  <%if(FullName != null) {%>
					              <%=FullName %> 
					             <%} else { %>
					             &nbsp;
					             <%} %>
				             </td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsizeInput" align="center">
				              <p>  (Name in full here) </p>
				            </td>
				          </tr>
				           <tr>
				            <td height="10">
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsizeInput" align="justify">
				              <p>  whose particulars are given in the statement below,hereby nominate the person(s) mentioned  below to receive the gratuity payable after my death as also the gratuity standing to my credit in the event of my death before that amount has become payable, or having become payable has not been paid and direct that the said amount of gratuity shall be paid in proportion indicated against the name(s)of the nominee(s) </p>
				            </td>
				          </tr>
				           <tr>
				            <td height="10">
				            </td>
				          </tr>
			        </table>
	             </td>
	          </tr>
	          <tr>
	            <td align="center"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
				            <td class="fontsizeInput" align="left">
				              <ol>
				                <li value="2">
				                  <p> I hereby certify that the person(s) mentioned is/are a member(s) of  my family within the meaning of clause (h) of section 2 of the Payment of Gratuity Act, 1972.</p>
				                </li>
				                <li>
				                  <p>
				                    I hereby declare that I have no family within the meaning of clause(h)of Section-2 of the said Act.
				                  </p>
				                </li>
				                <li>
				                  <p>
				                  	 (a)My father/mother/parents is/are not dependent on  me.
				                  </p>
				                </li>
				                <li>
				                  <p>
				                  	 I have excluded my husband from my family by a notice dated the _______________ to the controlling 
			                         authority in terms of the proviso to clause(h) of Section 2 of the said Act.
				                  </p>
				                </li>
				                <li>
				                  <p>
				                  	Nomination made herein invalidates my previous nomination.
				                  </p>
				                </li>
				              </ol>
				            </td>
				          </tr>
				           <tr>
				            <td height="10">
				            </td>
				          </tr>
				           <tr>
				            <td class="fontsizeBig" align="center">
				              <p>  Nominee(s)</p>
				            </td>
				          </tr> 
				           <tr>
				            <td height="10">
				            </td>
				          </tr>
	            	</table>
	             </td>
	          </tr>
	           
	          <tr>
	            <td align="center">
	              <table width="750" border="1" cellspacing="0" cellpadding="6">
					  <tr class="fontsize">
					    <td width="400" align="center">Name in full with full address of Nominee(s)  </td>
					    <td width="125" align="center">Relationship with the Employee </td>
					    <td width="62" align="center">Age of Nominee </td>
					    <td width="175" align="center">Proportion by which the gratuity will be shared (1%) </td>
					  </tr>
					  <tr class="fontsize">
					    <td align="center">(1)</td>
					    <td align="center">(2)</td>
					    <td align="center">(3)</td>
					    <td align="center">(4)</td>
					  </tr>
					  <tr class="fontsize">
					    <td height="52"><p>1.</p></td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
					  <tr class="fontsize">
					    <td height="52"><p>2.</p></td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
					  <tr class="fontsize">
					    <td height="52"><p>3.</p></td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
					  <tr class="fontsize">
					    <td height="71"><p>So <br/>on</p>
					    </td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					    <td>&nbsp;</td>
					  </tr>
				   </table>
	            </td>
	          </tr>
	           <tr>
	            <td height="100">
	            </td>
	          </tr>
	           <tr>
	            <td  class="fontsizeSmall" align="center" valign="bottom">11
	            </td>
	          </tr>
	        </table>
      </div>
       <div class="break" style="width: 100%;" align="center">
   		   <table width="820" align="center" cellpadding="3" cellspacing="0">
   		      <tr>
	            <td height="40">
	            </td>
	          </tr>
	          <tr>
	            <td class="fontsizeBig" align="center">
	            	 <p> Statement </p>
	            </td>
	          </tr>
	          <tr>
	            <td height="10">
	            </td>
	          </tr>
	          <tr>
	          	<td align="center">
	          		<table width="750" border="0" cellspacing="0" cellpadding="0">
	          			 <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="180"> 
				                   1.  Name of employee in full
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 660px;font-family: Arial,Helvetica,sans-serif;font-size: 12px;">
				                   <%if(FullName != null) {%>
					              <%=FullName %> 
					             <%} else { %>
					             &nbsp;
					             <%} %>
				                 &nbsp;
				                 </td>
				                </tr>
				              </table>
				            </td>
	         			 </tr>
	         			 <tr>
				            <td>
				             <table>
				                <tr>
				                 <td  class="fontsize" align="left" width="40"> 
				                   2.  Sex
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 780px;font-family: Arial,Helvetica,sans-serif;font-size: 12px;">
				                   <%if(Gender != null) {%>
					              <%=Gender %> 
					             <%} else { %>
					             &nbsp;
					             <%} %>
				                 &nbsp;
				                 </td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="60"> 
				                   3.  Religion
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 760px;font-family: Arial,Helvetica,sans-serif;font-size: 12px;">
				                  <%if(Religion_Name != null) {%>
					              <%=Religion_Name %> 
					             <%} else { %>
					             &nbsp;
					             <%} %>
				                 &nbsp;
				                 </td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="300"> 
				                   4.  Whether unmarried/married/widow/widower
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 550px;font-family: Arial,Helvetica,sans-serif;font-size: 12px;">
				                  <%if(MaritalStatus != null) {%>
					              <%=MaritalStatusTxt %> 
					             <%} else { %>
					             &nbsp;
					             <%} %>
				                 &nbsp;
				                 </td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="320"> 
				                   5.  Department/Branch/Section where employed
				                 </td>
				                 <td align="left" class="fontsizeInput" style="border-bottom: thin solid;width: 620px;">PMG&nbsp;</td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="330"> 
				                   6.Post held with Ticket No. or Serial No..,if any
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 610px;">&nbsp;</td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				           <tr>
				            <td>
				              <table>
				                <tr>
				                 <td class="fontsize" align="left" width="150"> 
				                   7.  Date of appointment
				                 </td>
				                 <td align="left" style="border-bottom: thin solid;width: 690px;"  class="fontsizeInput"><%=CurrDAteDisp %>&nbsp;</td>
				                </tr>
				              </table>
				            </td>
				          </tr>
				          <tr>
				              <td height="5"> 
				              </td>
				          </tr>
				          <tr>
				              <td class="fontsize" align="left" width="130"> 
				                   <font class="fontsize"> 8.  Permanent Address :</font>&nbsp;<font class="fontsizeInput"><u><%=PermanentAddress %></u></font>
				              </td>
				          </tr>
				         <tr>
				            <td height="20">
				            </td>
				          </tr>
				           <tr>
				            <td>
				              <table cellspacing="0" cellpadding="6">
								  <tr align="left">
								    <td width="40" class="fontsize">Place : </td>
								    <td width="100" style="border-bottom: thin solid;" class="fontsizeInput"><%=userCentreName %></td>
								  </tr>
								</table>
				            </td>
				          </tr>
				          <tr>
				            <td height="30">
				            </td>
				         </tr>
				         <tr>
				           <td class="fontsize" align="right">
				             <p> Signature/Thumb-impression of the Employee </p>
				           </td>
				         </tr>
				         <tr>
				            <td>
				              <table cellspacing="0" cellpadding="6">
								  <tr align="left">
								    <td width="35" class="fontsize">Date : </td>
								    <td width="100" style="border-bottom: thin solid;" class="fontsizeInput"><%=CurrDAteDisp %></td>
								  </tr>
								</table>
				            </td>
				          </tr>
				          <tr>
				            <td height="20">
				            </td>
				         </tr>
				          <tr>
				            <td class="fontsizeBig" align="center">
				            	 <p> Declaration of Witness </p>
				            </td>
				          </tr>
				          <tr>
				            <td height="20">
				            </td>
				         </tr>
				         <tr>
				           <td class="fontsize" align="left"> 
				             <p> Nomination signed/thumb impressed before me </p>
				           </td>
				         </tr>
				          <tr>
				            <td height="10">
				            </td>
				         </tr>
				         <tr>
				          <td>
				            <table border="0" cellspacing="0" cellpadding="6">
							  <tr class="fontsize">
							    <td colspan="3">Name in full and full address of witnesses. </td>
							    <td width="116">&nbsp;</td>
							    <td colspan="2">Signature of witnesses. </td>
							  </tr>
							  <tr class="fontsize">
							    <td width="40">1.</td>
							    <td width="211" style="border-bottom: thin solid;">&nbsp;</td>
							    <td width="35">&nbsp;</td>
							    <td>&nbsp;</td>
							    <td width="40">1.</td>
							    <td width="292" style="border-bottom: thin solid;">&nbsp;</td>
							  </tr>
							  <tr class="fontsize">
							    <td>&nbsp;</td>
							    <td style="border-bottom: thin solid;">&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							  <tr class="fontsize">
							    <td>2.</td>
							    <td style="border-bottom: thin solid;">&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>2.</td>
							    <td style="border-bottom: thin solid;">&nbsp;</td>
							  </tr>
							  <tr class="fontsize">
							    <td>&nbsp;</td>
							    <td style="border-bottom: thin solid;">&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>
				          </td>
				         </tr>
				         <tr>
				            <td height="10">
				            </td>
				         </tr>
				         <tr>
				           <td class="fontsize" align="left">
				             	<font class="fontsize"> </font>Place : &nbsp; <font class="fontsizeInput"><%=userCentreName%> </font>
				           </td>
				         </tr>
				         <tr>
				            <td height="10">
				            </td>
				         </tr>
				         <tr>
				           <td class="fontsize" align="left">
				             <font class="fontsize"> </font>Date :  &nbsp; <font class="fontsizeInput"><%=CurrDAteDisp %> </font>
				           </td>
				         </tr>
				         <tr>
				            <td height="10">
				            </td>
				         </tr>
				          <tr>
				            <td class="fontsizeBig" align="center">
				            	 <p> Certificate by the Employer </p>
				            </td>
				          </tr>
				          <tr>
				            <td height="10">
				            </td>
				         </tr>
				         <tr>
				            <td class="fontsize" align="left">
				            	 <p> Certified that the particulars of the above nomination have been verified and recorded in this establishment.</p>
				            </td>
				          </tr>
				          <tr>
				            <td class="fontsize" align="left">
				            	 <p> Employer's Reference No..,If any..............</p>
				            </td>
				          </tr> 
				           <tr>
				            <td height="40">
				            </td>
				         </tr>
				         <tr>
				            <td class="fontsize" align="right">
				            	 <p> Signature of the employer/Officer authorised Designation</p>
				            </td>
				          </tr>
				          <tr>
				            <td height="45">
				            </td>
				          </tr>
				          <tr>
				            <td>
				              <table border="0" cellspacing="0" cellpadding="6">
								  <tr class="fontsize">
								    <td width="35">Date : </td>
								    <td width="135" style="border-bottom: thin solid;">&nbsp;</td>
								    <td width="282">&nbsp;</td>
								    <td width="310">Name and address of the establishment or rubber stamp thereof</td>
								  </tr>
								  <tr class="fontsize">
								    <td colspan="3" rowspan="2">&nbsp;</td>
								    <td style="border-bottom: thin solid;">&nbsp;</td>
								  </tr>
								  <tr>
								    <td style="border-bottom: thin solid;">&nbsp;</td>
								  </tr>
							  </table>
				            </td>
				          </tr>
					</table>
	          	</td>
	          </tr>
	         <tr>
	            <td height="80">
	            </td>
	         </tr>
	          <tr>
	            <td class="fontsizeSmall" align="center">12
	            </td>
	         </tr>
	      </table>
	  </div>
	  
	  <div class="break" style="width: 100%;" align="center">
   		   <table width="820" align="center" cellpadding="0" cellspacing="0" border="0">
	   		   	 <tr>
		            <td height="20">
		            </td>
	         	</tr>
	   		   	 <tr>	
	   		   		<td align="center" class="fontsizeBig">
	   		           FORM NO. 2 (Revised)
	   		        </td>
	   		      </tr>  
	   		      <tr>
	   		      	<td align="center" class="fontsizeBig">
   		           		NOMINATION AND DECLARATION FORM
   		        	</td>
	   		      </tr>
	   		      <tr>
	   		      	<td align="center" class="fontsizeInput">
   		           		(For Unexempted/Exempted Establishment)
   		        	</td>
	   		      </tr>
	   		      <tr>
	   		      	<td align="center" class="fontsizeInput">
   		           		<p> Declaration and Nomination Form under the Employees Provident Fund & Employees Pension Scheme
   		        	</td>
	   		      </tr>
	   		      <tr>
	   		      	<td align="center" class="fontsizeInputBig">
   		           		(Paragraph 33 and 61 (1) of the Employees Provident Fund Scheme, 1952 & <br/>Paragraph 18 of the Employees Pension Scheme, 1995)
   		        	</td>
	   		      </tr>
	   		      <tr>
	   		      	<td align="center">
	   		      		<table border="0" cellspacing="6" cellpadding="6" width="750">
      		  				 <tr>
      		  				 	<td style="width: 36px;">
      		  				 	</td>
      		  				 	<td style="width: 1px;">
      		  				 	</td>
      		  				 	<td style="width: 10px;">
      		  				 	</td>
      		  				 	<td style="width: 1px;">
      		  				 	</td>
      		  				 	<td style="width: 10px;">
      		  				 	</td>
      		  				 	<td>
      		  				 	</td>
      		  				 	<td style="width: 40px;">
      		  				 	</td>
      		  				 	<td style="width: 60px;">
      		  				 	</td>
      		  				 	<td>
      		  				 	</td>
      		  				 	<td>
      		  				 	</td>
      		  				 	<td>
      		  				 	</td>
      		  				 </tr>
      		  				 <tr>
							    <td colspan="2" class="fontsize">
							    1. Name
							    </td>
							    <td colspan="9" class="fontsizeInput" align="left" style="border-bottom: thin solid;" ><%= FullName%>&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="1" class="fontsize">2. 
							    	<%if(Gender.equalsIgnoreCase("Male")) 
							    	{
							    	%>
							    	S/O
							    	<%
							    	}
							    	else if(Gender.equalsIgnoreCase("Female"))
							    	{
							    		if(MaritalStatus.equalsIgnoreCase("Y"))
							    		{
							    			%>
							    			W/O
							    			<%
							    		}
							    		else
							    		{
							    			%>
							    			D/O
							    			<%
							    		}
							    	}
							    	%>
							    </td>
							    <td colspan="10" class="fontsizeInput" align="left" style="border-bottom: thin solid;" ><%=candFHName %>&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="3" class="fontsize">3. Date of Birth </td>
							    <td colspan="3" class="fontsizeInput" align="left" style="border-bottom: thin solid;" width="150"><%=DOB %>&nbsp;</td>
							    <td class="fontsize" nowrap="nowrap">4. Sex</td>
							    <td colspan="2" class="fontsizeInput" align="left" style="border-bottom: thin solid;"  width="150"><%=Gender %>&nbsp;</td>
							    <td class="fontsize" nowrap="nowrap">5. Date of Joining </td>
							    <td class="fontsizeInput" align="left" style="border-bottom: thin solid;"  width="150"><%=CurrDAteDisp %>&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="4" class="fontsize">6. Maritul Status </td>
							    <td colspan="2" class="fontsizeInput" align="left" style="border-bottom: thin solid;" ><%=MaritalStatusTxt %>&nbsp;</td>
							    <td colspan="2" class="fontsize">7. P.F. Account No.</td>
							    <td colspan="3" class="fontsizeInput" align="left" style="border-bottom: thin solid;" >&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="5" nowrap="nowrap" class="fontsize">8. (A) Address Permanent </td>
							    <td colspan="6" class="fontsizeInput" align="left" style="border-bottom: thin solid;" > <%=PermanentAddress %>&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="11" class="fontsizeInput" align="left" style="border-bottom: thin solid;" >&nbsp;</td>
							  </tr>
							  <tr>
							    <td colspan="5" nowrap="nowrap" class="fontsize">(B) Address Temporary </td>
							    <td colspan="6" class="fontsizeInput" align="left" style="border-bottom: thin solid;" >&nbsp;</td>
							  </tr>
							   <tr>
							    <td colspan="11" class="fontsizeInput" align="left" style="border-bottom: thin solid;" >&nbsp;</td>
							  </tr>
						</table>
	   		      	 </td>
	   		      </tr>
	   		      <tr>	
	   		   		<td height="20">
	   		          &nbsp;
	   		        </td>
	   		      </tr>
	   		      <tr>	
	   		   		<td align="center" class="fontsizeBig">
	   		           PART A (EPF)
	   		        </td>
	   		      </tr>
	   		      <tr>
	   		      	<td align="center">
	   		      		<table width="750" border="1" cellspacing="0" cellpadding="0">
						  <tr align="center" class="fontsize">
						    <td width="150">Name of the Nominee/Nominees</td>
						    <td width="180">Address</td>
						    <td width="120">Nominees relation with the member</td>
						    <td width="100">Date of Birth</td>
						    <td width="120">Total amount of share of Accumulation in PF to be paid to each Nominee</td>
						    <td width="120">If the Nominee is a minor, Name & Relationship & Address of the guardian who may receive the amount during minority of nominee</td>
						  </tr>
						  <tr height="10" align="center">
						    <td>1</td>
						    <td>2</td>
						    <td>3</td>
						    <td>4</td>
						    <td>5</td>
						    <td>6</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr height="45">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						</table>
	   		      	</td>
	   		      </tr> 
	   		      <tr>
	   		      	<td height="10">
	   		      	</td>
	   		      </tr>
	   		      <tr>
		            <td align="center" style="padding-top: 20px;"> 
		            	<table width="750" border="0" cellspacing="0" cellpadding="0">
		            		 <tr>	
				   		   		<td align="left" class="fontsizeInput">
				   		          <p>
				   		          1. *Certified that I have no family as defined in para 2(g) of the Employee’s Provident Fund Scheme, 1952 and should I acquire a family hereafter the above nomination should be deemed as cancelled.
				   		          </p>
				   		          <p>
				   		          	2. *Certified that my father/mother is/are dependent upon me.
				   		          </p>
				   		        </td>
				   		      </tr>
				   		      <tr>
				   		      	<td height="30">
				   		      	</td>
				   		      </tr>
				   		      <tr>
				   		       	<td>
				   		       		<table>
				   		       			<tr class="fontsizeInput">
				   		       				<td width="360">
				   		       					<p style="text-decoration: overline">*Strike out whichever is not applicable</p>
				   		       				</td>
				   		       				<td width="100">
				   		       				</td>
				   		       				<td width="360">
				   		       					<p style="text-decoration: overline">Signature or thumb impression of the subscriber</p>
				   		       				</td>
				   		       			</tr>
				   		       		</table>
				   		       	</td>
				   		      </tr>
		            	</table>
		             </td>
		          </tr>
	   		     <tr>
		            <td height="10">
		            </td>
	         	</tr>
	         	 <tr valign="bottom">
		            <td class="fontsizeSmall" align="center">13
		            </td>
	        	 </tr>
	       </table>
   	 </div>
   	 <div class="break" style="width: 100%;" align="center">
		   <table width="820" align="center" cellpadding="0" cellspacing="0" border="0">
		   		<tr>
		            <td height="20">
		            </td>
	         	</tr>
		   		<tr>	
	   		   		<td align="center" class="fontsizeBig">
	   		           PART B (EPS) (Para 18)
	   		        </td>
   		       </tr>
   		       <tr>
	            <td align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	            			<td class="fontsizeInput">
			        	 		<p> I hereby furnish below particulars of the members of my family who would be eligible to receive widow children pension in the event of my death.</p>
			        	 	</td>
	            		</tr>
	            	</table>
	             </td>
	          </tr>
        	 	<tr>
        	 		<td align="center">
        	 			<table border="1" cellpadding="3" cellspacing="0">
        	 				<tr>
        	 					<td class="fontsize">
        	 						Name and Address of the Family member(s)
        	 					</td>
        	 				</tr>
        	 			</table>
        	 		</td>
        	 	</tr>
        	 	<tr>
        	 		<td align="center">
						<table width="750" border="1" cellspacing="0" cellpadding="8">
						  <tr align="center" class="fontsize">
						    <td width="50">Sl. No.</td>
						    <td width="150">Name</td>
						    <td width="350">Address</td>
						    <td width="120">Date of Birth</td>
						    <td width="150">Relationship with member</td>
						  </tr>
						  <tr align="center" class="fontsize">
						    <td>1</td>
						    <td>2</td>
						    <td>3</td>
						    <td>4</td>
						    <td>5</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>1</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>2</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>3</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>4</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>5</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						</table>
        	 		</td>
        	 	</tr>
        	 	<tr>
	            <td align="center" style="padding-top: 15px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr class="fontsizeInput">
		        	 		<td>
		        	 			<p>
		        	 				** Certified that I have no family as defined in Para 2 (vii) of Employees’ Pension Sheme, 1995 and should I acquire a family hereafter I shall furnish particulars thereon in the above form.
										I hereby nominate the following person for receiving the monthly pension (admissible under Para 16 2(a) (i) & (ii) in event of my death without leaving any eligible family member for receiving pension.
		        	 			</p>
		        	 		</td>
		        	 	</tr>
		            	</table>
	              </td>
	            </tr>
        	 	<tr>
        	 		<td height="10">
        	 		</td>
        	 	</tr>
        	 	<tr>
        	 		<td align="center">
        	 			<table width="750" border="1" cellspacing="0" cellpadding="8">
						  <tr align="center" class="fontsize">
						    <td width="50">Sl. No.</td>
						    <td width="450">Name & address of the Nominee</td>
						   	<td width="120">Date of Birth</td>
						    <td width="200">Relationship with member</td>
						  </tr>
						  <tr align="center" class="fontsize">
						    <td>1</td>
						    <td>2</td>
						    <td>3</td>
						    <td>4</td>
						   </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>1</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>2</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>3</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>4</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>5</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr align="center" class="fontsizeInput">
						    <td>6</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						</table>
        	 		</td>
        	 	</tr>
        	 	<tr>
            	 <td align="center" style="padding-top: 20px;"> 
	            	<table width="750" border="0" cellspacing="0" cellpadding="0">
	            		<tr align="left">
		        	 		<td>
		        	 			<table>
							       <tr class="fontsize">
							          <td>
							             Date :
							          </td>
							          <td width="230" align="left" class="fontsizeInput" style="border-bottom: thin solid;">
							            <%=CurrDAteDisp %>
							          </td>
							        </tr>
						   		</table>
		        	 		</td>
		        	 	</tr>
		        	 	<tr>
			   		       	<td>
			   		       		<table>
			   		       			<tr class="fontsizeInput">
			   		       				<td width="300" style="border-bottom: thin solid;">
			   		       					&nbsp;
			   		       				</td>
			   		       				<td width="200">
			   		       				</td>
			   		       				<td width="300" style="border-bottom: thin solid;">
			   		       					&nbsp;
			   		       				</td>
			   		       			</tr>
			   		       			<tr class="fontsizeInput">
			   		       				<td width="300">
			   		       					&nbsp;
			   		       				</td>
			   		       				<td width="200">
			   		       				</td>
			   		       				<td width="300" align="right">
			   		       					Signature or thumb impression of the subscriber
			   		       				</td>
			   		       			</tr>
			   		       		</table>
			   		       	</td>
			   		      </tr>
			   		      <tr>
			   		      	<td style="border-bottom: thin solid;">
			   		      		&nbsp;
			   		      	</td>
			   		      </tr>
			   		      <tr>
				   		       	<td height="5">
				   		       	</td>
			       		  </tr>
			   		      <tr>	
			   		   		<td align="center" class="fontsizeBig">
			   		           CERTIFICATE BY EMPLOYER
			   		        </td>
		   		          </tr>
			   		       <tr>
				   		       	<td height="5">
				   		       	</td>
			   		       </tr>
			   		        <tr>
				   		       	<td align="center"  class="fontsizeInput">
				   		       		<p> Certified that the above declaration and nomination has been signed/thumb impressed before me by <br/>Shri/Smt./Kum___________employed in my establishment after he/she has read the entries have read over to him/her by me and got confirmed by him/her.</p>
				   		       	</td>
			   		       </tr>
			   		       <tr>
				   		       	<td height="20">
				   		       	</td>
			   		       </tr>
			   		       <tr>
				   		       	<td>
				   		       		<table>
			   		       			<tr class="fontsizeInput">
			   		       				<td width="230">
			   		       					&nbsp;
			   		       				</td>
			   		       				<td width="230">
			   		       				<p> Signature of the employer or other<br/>	Authorized officers of the establishment :-</p>
			   		       				</td>
			   		       				<td width="280" style="border-bottom: thin solid;">
			   		       					&nbsp;
			   		       				</td>
			   		       			</tr>
			   		       			</table>
				   		       	</td>
			   		       </tr>
			   		       <tr>
				   		       	<td height="15">
				   		       	</td>
			   		       </tr>
			   		       <tr>
			   		       		<td>
			   		       			<table>
				   		       			<tr class="fontsizeInput">
				   		       				<td width="230">
				   		       					Place : _________________________
				   		       				</td>
				   		       				<td width="200">
				   		       				</td>
				   		       				<td width="400">
				   		       					Designation : __________________________________
				   		       				</td>
				   		       			</tr>
			   		       			</table>
			   		       		</td>
			   		       </tr>
			   		       <tr>
				   		       	<td height="10">
				   		       	</td>
			   		       </tr>
			   		       <tr class="fontsize" align="center">
				   		       	<td>
				   		       	<p>Name and address of the factory</p>
				   		       	</td>
			   		       </tr>
			   		       <tr>
				   		       	<td height="5">
				   		       	</td>
			   		       </tr>
			   		       <tr>
			   		       		<td>
			   		       			<table>
				   		       			<tr class="fontsizeInput">
				   		       				<td width="300">
				   		       					Dated : _________________________
				   		       				</td>
				   		       				<td width="100">
				   		       				</td>
				   		       				<td width="500">
				   		       					 Establishment or rubber stamp there of : ________________________
				   		       				</td>
				   		       			</tr>
			   		       			</table>
			   		       		</td>
			   		       </tr>
	            	</table>
	             </td>
	           </tr>
        	 	<tr>
		            <td height="10">
		            </td>
         		</tr>
	         	 	<tr>
			            <td  class="fontsizeSmall" align="center">14
			            </td>
	        	 	</tr>
		   </table>
	 </div>
	 <div class="break" style="width: 100%;" align="center">
	   		<table>
	   		<tr>
	   		  <td align="center">
	   		     <img src="<%=recruitPath%>images/14.jpg" width="820">
	   		  </td>
	   		</tr>
	   		</table>
	    </div>
	    <div class="break" style="width: 100%;" align="center">
	   		<table>
	   		<tr>
	   		  <td align="center">
	   		     <img src="<%=recruitPath%>images/15.jpg" width="820">
	   		  </td>
	   		</tr>
	   		</table>
	    </div>
	    <%
	    stmt.close();
	    }
	    catch(Exception ex)
	    {
	    ex.printStackTrace();
	    }
	     %>
   	<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->
 </body>
</html>
		