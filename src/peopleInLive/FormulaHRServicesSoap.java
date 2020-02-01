package peopleInLive;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * 
 */
@WebService(name = "formulaHRServicesSoap", targetNamespace = "http://tempuri.org/")
public interface FormulaHRServicesSoap {

	/**
	 * 
	 * @param fromDate
	 * @param toDate
	 * @param password
	 * @return returns webServiceLive.ArrayOfEmpNewJoinee
	 */
	@WebMethod(operationName = "GetNewJoineeDetails", action = "http://tempuri.org/GetNewJoineeDetails")
	@WebResult(name = "GetNewJoineeDetailsResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "GetNewJoineeDetails", targetNamespace = "http://tempuri.org/", className = "webServiceLive.GetNewJoineeDetails")
	@ResponseWrapper(localName = "GetNewJoineeDetailsResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.GetNewJoineeDetailsResponse")
	public ArrayOfEmpNewJoinee getNewJoineeDetails(
			@WebParam(name = "Password", targetNamespace = "http://tempuri.org/") String password,
			@WebParam(name = "FromDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar fromDate,
			@WebParam(name = "ToDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar toDate);

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfOrgMasProgram
	 */
	@WebMethod(operationName = "OrgMasProgramList", action = "http://tempuri.org/OrgMasProgramList")
	@WebResult(name = "OrgMasProgramListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "OrgMasProgramList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.OrgMasProgramList")
	@ResponseWrapper(localName = "OrgMasProgramListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.OrgMasProgramListResponse")
	public ArrayOfOrgMasProgram orgMasProgramList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfOrgMasSubProgram
	 */
	@WebMethod(operationName = "OrgMasSubProgramList", action = "http://tempuri.org/OrgMasSubProgramList")
	@WebResult(name = "OrgMasSubProgramListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "OrgMasSubProgramList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.OrgMasSubProgramList")
	@ResponseWrapper(localName = "OrgMasSubProgramListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.OrgMasSubProgramListResponse")
	public ArrayOfOrgMasSubProgram orgMasSubProgramList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasNationality
	 */
	@WebMethod(operationName = "EmpMasNationalityList", action = "http://tempuri.org/EmpMasNationalityList")
	@WebResult(name = "EmpMasNationalityListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasNationalityList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasNationalityList")
	@ResponseWrapper(localName = "EmpMasNationalityListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasNationalityListResponse")
	public ArrayOfEmpMasNationality empMasNationalityList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasReligion
	 */
	@WebMethod(operationName = "EmpMasReligionList", action = "http://tempuri.org/EmpMasReligionList")
	@WebResult(name = "EmpMasReligionListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasReligionList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasReligionList")
	@ResponseWrapper(localName = "EmpMasReligionListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasReligionListResponse")
	public ArrayOfEmpMasReligion empMasReligionList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasLanguage
	 */
	@WebMethod(operationName = "EmpMasLanguageList", action = "http://tempuri.org/EmpMasLanguageList")
	@WebResult(name = "EmpMasLanguageListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasLanguageList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasLanguageList")
	@ResponseWrapper(localName = "EmpMasLanguageListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasLanguageListResponse")
	public ArrayOfEmpMasLanguage empMasLanguageList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasBloodGroup
	 */
	@WebMethod(operationName = "EmpMasBloodGroupList", action = "http://tempuri.org/EmpMasBloodGroupList")
	@WebResult(name = "EmpMasBloodGroupListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasBloodGroupList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasBloodGroupList")
	@ResponseWrapper(localName = "EmpMasBloodGroupListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasBloodGroupListResponse")
	public ArrayOfEmpMasBloodGroup empMasBloodGroupList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasAccommodationType
	 */
	@WebMethod(operationName = "EmpMasAccommodationTypeList", action = "http://tempuri.org/EmpMasAccommodationTypeList")
	@WebResult(name = "EmpMasAccommodationTypeListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasAccommodationTypeList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAccommodationTypeList")
	@ResponseWrapper(localName = "EmpMasAccommodationTypeListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAccommodationTypeListResponse")
	public ArrayOfEmpMasAccommodationType empMasAccommodationTypeList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasState
	 */
	@WebMethod(operationName = "EmpMasStateList", action = "http://tempuri.org/EmpMasStateList")
	@WebResult(name = "EmpMasStateListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasStateList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasStateList")
	@ResponseWrapper(localName = "EmpMasStateListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasStateListResponse")
	public ArrayOfEmpMasState empMasStateList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCity
	 */
	@WebMethod(operationName = "EmpMasCityList", action = "http://tempuri.org/EmpMasCityList")
	@WebResult(name = "EmpMasCityListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCityList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCityList")
	@ResponseWrapper(localName = "EmpMasCityListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCityListResponse")
	public ArrayOfEmpMasCity empMasCityList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCountry
	 */
	@WebMethod(operationName = "EmpMasCountryList", action = "http://tempuri.org/EmpMasCountryList")
	@WebResult(name = "EmpMasCountryListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCountryList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCountryList")
	@ResponseWrapper(localName = "EmpMasCountryListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCountryListResponse")
	public ArrayOfEmpMasCountry empMasCountryList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasRelationship
	 */
	@WebMethod(operationName = "EmpMasRelationshipList", action = "http://tempuri.org/EmpMasRelationshipList")
	@WebResult(name = "EmpMasRelationshipListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasRelationshipList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasRelationshipList")
	@ResponseWrapper(localName = "EmpMasRelationshipListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasRelationshipListResponse")
	public ArrayOfEmpMasRelationship empMasRelationshipList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCaste
	 */
	@WebMethod(operationName = "EmpMasCasteList", action = "http://tempuri.org/EmpMasCasteList")
	@WebResult(name = "EmpMasCasteListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCasteList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCasteList")
	@ResponseWrapper(localName = "EmpMasCasteListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCasteListResponse")
	public ArrayOfEmpMasCaste empMasCasteList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasQualificationGroup
	 */
	@WebMethod(operationName = "EmpMasQualificationGroupList", action = "http://tempuri.org/EmpMasQualificationGroupList")
	@WebResult(name = "EmpMasQualificationGroupListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasQualificationGroupList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualificationGroupList")
	@ResponseWrapper(localName = "EmpMasQualificationGroupListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualificationGroupListResponse")
	public ArrayOfEmpMasQualificationGroup empMasQualificationGroupList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasQualGroup
	 */
	@WebMethod(operationName = "EmpMasQualGroupList", action = "http://tempuri.org/EmpMasQualGroupList")
	@WebResult(name = "EmpMasQualGroupListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasQualGroupList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualGroupList")
	@ResponseWrapper(localName = "EmpMasQualGroupListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualGroupListResponse")
	public ArrayOfEmpMasQualGroup empMasQualGroupList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasQualification
	 */
	@WebMethod(operationName = "EmpMasQualificationList", action = "http://tempuri.org/EmpMasQualificationList")
	@WebResult(name = "EmpMasQualificationListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasQualificationList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualificationList")
	@ResponseWrapper(localName = "EmpMasQualificationListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasQualificationListResponse")
	public ArrayOfEmpMasQualification empMasQualificationList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasSpecialisation
	 */
	@WebMethod(operationName = "EmpMasSpecialisationList", action = "http://tempuri.org/EmpMasSpecialisationList")
	@WebResult(name = "EmpMasSpecialisationListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasSpecialisationList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasSpecialisationList")
	@ResponseWrapper(localName = "EmpMasSpecialisationListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasSpecialisationListResponse")
	public ArrayOfEmpMasSpecialisation empMasSpecialisationList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasAchievement
	 */
	@WebMethod(operationName = "EmpMasAchievementList", action = "http://tempuri.org/EmpMasAchievementList")
	@WebResult(name = "EmpMasAchievementListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasAchievementList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAchievementList")
	@ResponseWrapper(localName = "EmpMasAchievementListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAchievementListResponse")
	public ArrayOfEmpMasAchievement empMasAchievementList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCourseAppraisal
	 */
	@WebMethod(operationName = "EmpMasCourseAppraisalList", action = "http://tempuri.org/EmpMasCourseAppraisalList")
	@WebResult(name = "EmpMasCourseAppraisalListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCourseAppraisalList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseAppraisalList")
	@ResponseWrapper(localName = "EmpMasCourseAppraisalListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseAppraisalListResponse")
	public ArrayOfEmpMasCourseAppraisal empMasCourseAppraisalList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCourseCategory
	 */
	@WebMethod(operationName = "EmpMasCourseCategoryList", action = "http://tempuri.org/EmpMasCourseCategoryList")
	@WebResult(name = "EmpMasCourseCategoryListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCourseCategoryList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseCategoryList")
	@ResponseWrapper(localName = "EmpMasCourseCategoryListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseCategoryListResponse")
	public ArrayOfEmpMasCourseCategory empMasCourseCategoryList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasCourseType
	 */
	@WebMethod(operationName = "EmpMasCourseTypeList", action = "http://tempuri.org/EmpMasCourseTypeList")
	@WebResult(name = "EmpMasCourseTypeListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasCourseTypeList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseTypeList")
	@ResponseWrapper(localName = "EmpMasCourseTypeListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasCourseTypeListResponse")
	public ArrayOfEmpMasCourseType empMasCourseTypeList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasZone
	 */
	@WebMethod(operationName = "EmpMasZoneList", action = "http://tempuri.org/EmpMasZoneList")
	@WebResult(name = "EmpMasZoneListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasZoneList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasZoneList")
	@ResponseWrapper(localName = "EmpMasZoneListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasZoneListResponse")
	public ArrayOfEmpMasZone empMasZoneList();

	/**
	 * 
	 * @return returns webServiceLive.ArrayOfEmpMasArea
	 */
	@WebMethod(operationName = "EmpMasAreaList", action = "http://tempuri.org/EmpMasAreaList")
	@WebResult(name = "EmpMasAreaListResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "EmpMasAreaList", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAreaList")
	@ResponseWrapper(localName = "EmpMasAreaListResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.EmpMasAreaListResponse")
	public ArrayOfEmpMasArea empMasAreaList();

	/**
	 * 
	 * @param middleName
	 * @param lastName
	 * @param photograph
	 * @param dateofBirth
	 * @param cityCode
	 * @param stateCode
	 * @param programCode
	 * @param residencePhone
	 * @param cityOthers
	 * @param candidateID
	 * @param pincode
	 * @param relevantExperience
	 * @param qualificationGroupCode
	 * @param title
	 * @param subProgramCode
	 * @param source
	 * @param mobilePhone
	 * @param fatherHusbandName
	 * @param currentAddress
	 * @param recruitmentSummary
	 * @param gender
	 * @param firstName
	 * @param fatherHusband
	 * @param nonRelevantExperience
	 * @return returns boolean
	 */
	@WebMethod(operationName = "CandidateSave", action = "http://tempuri.org/CandidateSave")
	@WebResult(name = "CandidateSaveResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "CandidateSave", targetNamespace = "http://tempuri.org/", className = "webServiceLive.CandidateSave")
	@ResponseWrapper(localName = "CandidateSaveResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.CandidateSaveResponse")
	public boolean candidateSave(
			@WebParam(name = "Title", targetNamespace = "http://tempuri.org/") String title,
			@WebParam(name = "FirstName", targetNamespace = "http://tempuri.org/") String firstName,
			@WebParam(name = "MiddleName", targetNamespace = "http://tempuri.org/") String middleName,
			@WebParam(name = "LastName", targetNamespace = "http://tempuri.org/") String lastName,
			@WebParam(name = "Gender", targetNamespace = "http://tempuri.org/") String gender,
			@WebParam(name = "FatherHusband", targetNamespace = "http://tempuri.org/") String fatherHusband,
			@WebParam(name = "FatherHusbandName", targetNamespace = "http://tempuri.org/") String fatherHusbandName,
			@WebParam(name = "DateofBirth", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar dateofBirth,
			@WebParam(name = "CurrentAddress", targetNamespace = "http://tempuri.org/") String currentAddress,
			@WebParam(name = "CityCode", targetNamespace = "http://tempuri.org/") int cityCode,
			@WebParam(name = "CityOthers", targetNamespace = "http://tempuri.org/") String cityOthers,
			@WebParam(name = "StateCode", targetNamespace = "http://tempuri.org/") int stateCode,
			@WebParam(name = "Pincode", targetNamespace = "http://tempuri.org/") int pincode,
			@WebParam(name = "ResidencePhone", targetNamespace = "http://tempuri.org/") String residencePhone,
			@WebParam(name = "MobilePhone", targetNamespace = "http://tempuri.org/") String mobilePhone,
			@WebParam(name = "Source", targetNamespace = "http://tempuri.org/") String source,
			@WebParam(name = "ProgramCode", targetNamespace = "http://tempuri.org/") int programCode,
			@WebParam(name = "SubProgramCode", targetNamespace = "http://tempuri.org/") int subProgramCode,
			@WebParam(name = "CandidateID", targetNamespace = "http://tempuri.org/") String candidateID,
			@WebParam(name = "QualificationGroupCode", targetNamespace = "http://tempuri.org/") int qualificationGroupCode,
			@WebParam(name = "RelevantExperience", targetNamespace = "http://tempuri.org/") double relevantExperience,
			@WebParam(name = "NonRelevantExperience", targetNamespace = "http://tempuri.org/") double nonRelevantExperience,
			@WebParam(name = "RecruitmentSummary", targetNamespace = "http://tempuri.org/") byte[] recruitmentSummary,
			@WebParam(name = "Photograph", targetNamespace = "http://tempuri.org/") byte[] photograph);

	/**
	 * 
	 * @param fromDate
	 * @param toDate
	 * @param type
	 * @param password
	 * @return returns webServiceLive.ArrayOfAMSRosterService
	 */
	@WebMethod(operationName = "RosterDetail", action = "http://tempuri.org/RosterDetail")
	@WebResult(name = "RosterDetailResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "RosterDetail", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetail")
	@ResponseWrapper(localName = "RosterDetailResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetailResponse")
	public ArrayOfAMSRosterService rosterDetail(
			@WebParam(name = "Password", targetNamespace = "http://tempuri.org/") String password,
			@WebParam(name = "FromDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar fromDate,
			@WebParam(name = "ToDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar toDate,
			@WebParam(name = "Type", targetNamespace = "http://tempuri.org/") String type);

	/**
	 * 
	 * @param fromDate
	 * @param programCode
	 * @param toDate
	 * @param type
	 * @param password
	 * @return returns webServiceLive.ArrayOfAMSRosterService
	 */
	@WebMethod(operationName = "RosterDetailProgramFilter", action = "http://tempuri.org/RosterDetailProgramFilter")
	@WebResult(name = "RosterDetailProgramFilterResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "RosterDetailProgramFilter", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetailProgramFilter")
	@ResponseWrapper(localName = "RosterDetailProgramFilterResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetailProgramFilterResponse")
	public ArrayOfAMSRosterService rosterDetailProgramFilter(
			@WebParam(name = "Password", targetNamespace = "http://tempuri.org/") String password,
			@WebParam(name = "FromDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar fromDate,
			@WebParam(name = "ToDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar toDate,
			@WebParam(name = "Type", targetNamespace = "http://tempuri.org/") String type,
			@WebParam(name = "ProgramCode", targetNamespace = "http://tempuri.org/") int programCode);

	/**
	 * 
	 * @param subProgramCode
	 * @param fromDate
	 * @param toDate
	 * @param type
	 * @param password
	 * @return returns webServiceLive.ArrayOfAMSRosterService
	 */
	@WebMethod(operationName = "RosterDetailSubProgramFilter", action = "http://tempuri.org/RosterDetailSubProgramFilter")
	@WebResult(name = "RosterDetailSubProgramFilterResult", targetNamespace = "http://tempuri.org/")
	@RequestWrapper(localName = "RosterDetailSubProgramFilter", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetailSubProgramFilter")
	@ResponseWrapper(localName = "RosterDetailSubProgramFilterResponse", targetNamespace = "http://tempuri.org/", className = "webServiceLive.RosterDetailSubProgramFilterResponse")
	public ArrayOfAMSRosterService rosterDetailSubProgramFilter(
			@WebParam(name = "Password", targetNamespace = "http://tempuri.org/") String password,
			@WebParam(name = "FromDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar fromDate,
			@WebParam(name = "ToDate", targetNamespace = "http://tempuri.org/") XMLGregorianCalendar toDate,
			@WebParam(name = "Type", targetNamespace = "http://tempuri.org/") String type,
			@WebParam(name = "SubProgramCode", targetNamespace = "http://tempuri.org/") int subProgramCode);

}