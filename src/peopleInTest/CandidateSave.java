package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;Title&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;FirstName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;MiddleName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;LastName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Gender&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;FatherHusband&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;FatherHusbandName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;DateofBirth&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}dateTime&quot;/&gt;
 *         &lt;element name=&quot;CurrentAddress&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;CityCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CityOthers&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;StateCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;Pincode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;ResidencePhone&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;MobilePhone&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Source&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;ProgramCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;SubProgramCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CandidateID&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;QualificationGroupCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;RelevantExperience&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}double&quot;/&gt;
 *         &lt;element name=&quot;NonRelevantExperience&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}double&quot;/&gt;
 *         &lt;element name=&quot;RecruitmentSummary&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}base64Binary&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Photograph&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}base64Binary&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "title", "firstName", "middleName",
		"lastName", "gender", "fatherHusband", "fatherHusbandName",
		"dateofBirth", "currentAddress", "cityCode", "cityOthers", "stateCode",
		"pincode", "residencePhone", "mobilePhone", "source", "programCode",
		"subProgramCode", "candidateID", "qualificationGroupCode",
		"relevantExperience", "nonRelevantExperience", "recruitmentSummary",
		"photograph" })
@XmlRootElement(name = "CandidateSave")
public class CandidateSave {

	@XmlElement(name = "Title")
	protected String title;
	@XmlElement(name = "FirstName")
	protected String firstName;
	@XmlElement(name = "MiddleName")
	protected String middleName;
	@XmlElement(name = "LastName")
	protected String lastName;
	@XmlElement(name = "Gender")
	protected String gender;
	@XmlElement(name = "FatherHusband")
	protected String fatherHusband;
	@XmlElement(name = "FatherHusbandName")
	protected String fatherHusbandName;
	@XmlElement(name = "DateofBirth", required = true)
	@XmlSchemaType(name = "dateTime")
	protected XMLGregorianCalendar dateofBirth;
	@XmlElement(name = "CurrentAddress")
	protected String currentAddress;
	@XmlElement(name = "CityCode")
	protected int cityCode;
	@XmlElement(name = "CityOthers")
	protected String cityOthers;
	@XmlElement(name = "StateCode")
	protected int stateCode;
	@XmlElement(name = "Pincode")
	protected int pincode;
	@XmlElement(name = "ResidencePhone")
	protected String residencePhone;
	@XmlElement(name = "MobilePhone")
	protected String mobilePhone;
	@XmlElement(name = "Source")
	protected String source;
	@XmlElement(name = "ProgramCode")
	protected int programCode;
	@XmlElement(name = "SubProgramCode")
	protected int subProgramCode;
	@XmlElement(name = "CandidateID")
	protected String candidateID;
	@XmlElement(name = "QualificationGroupCode")
	protected int qualificationGroupCode;
	@XmlElement(name = "RelevantExperience")
	protected double relevantExperience;
	@XmlElement(name = "NonRelevantExperience")
	protected double nonRelevantExperience;
	@XmlElement(name = "RecruitmentSummary")
	protected byte[] recruitmentSummary;
	@XmlElement(name = "Photograph")
	protected byte[] photograph;

	/**
	 * Gets the value of the title property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets the value of the title property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setTitle(String value) {
		this.title = value;
	}

	/**
	 * Gets the value of the firstName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * Sets the value of the firstName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setFirstName(String value) {
		this.firstName = value;
	}

	/**
	 * Gets the value of the middleName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getMiddleName() {
		return middleName;
	}

	/**
	 * Sets the value of the middleName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setMiddleName(String value) {
		this.middleName = value;
	}

	/**
	 * Gets the value of the lastName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Sets the value of the lastName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setLastName(String value) {
		this.lastName = value;
	}

	/**
	 * Gets the value of the gender property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * Sets the value of the gender property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setGender(String value) {
		this.gender = value;
	}

	/**
	 * Gets the value of the fatherHusband property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getFatherHusband() {
		return fatherHusband;
	}

	/**
	 * Sets the value of the fatherHusband property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setFatherHusband(String value) {
		this.fatherHusband = value;
	}

	/**
	 * Gets the value of the fatherHusbandName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getFatherHusbandName() {
		return fatherHusbandName;
	}

	/**
	 * Sets the value of the fatherHusbandName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setFatherHusbandName(String value) {
		this.fatherHusbandName = value;
	}

	/**
	 * Gets the value of the dateofBirth property.
	 * 
	 * @return possible object is {@link XMLGregorianCalendar }
	 * 
	 */
	public XMLGregorianCalendar getDateofBirth() {
		return dateofBirth;
	}

	/**
	 * Sets the value of the dateofBirth property.
	 * 
	 * @param value
	 *            allowed object is {@link XMLGregorianCalendar }
	 * 
	 */
	public void setDateofBirth(XMLGregorianCalendar value) {
		this.dateofBirth = value;
	}

	/**
	 * Gets the value of the currentAddress property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCurrentAddress() {
		return currentAddress;
	}

	/**
	 * Sets the value of the currentAddress property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCurrentAddress(String value) {
		this.currentAddress = value;
	}

	/**
	 * Gets the value of the cityCode property.
	 * 
	 */
	public int getCityCode() {
		return cityCode;
	}

	/**
	 * Sets the value of the cityCode property.
	 * 
	 */
	public void setCityCode(int value) {
		this.cityCode = value;
	}

	/**
	 * Gets the value of the cityOthers property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCityOthers() {
		return cityOthers;
	}

	/**
	 * Sets the value of the cityOthers property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCityOthers(String value) {
		this.cityOthers = value;
	}

	/**
	 * Gets the value of the stateCode property.
	 * 
	 */
	public int getStateCode() {
		return stateCode;
	}

	/**
	 * Sets the value of the stateCode property.
	 * 
	 */
	public void setStateCode(int value) {
		this.stateCode = value;
	}

	/**
	 * Gets the value of the pincode property.
	 * 
	 */
	public int getPincode() {
		return pincode;
	}

	/**
	 * Sets the value of the pincode property.
	 * 
	 */
	public void setPincode(int value) {
		this.pincode = value;
	}

	/**
	 * Gets the value of the residencePhone property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getResidencePhone() {
		return residencePhone;
	}

	/**
	 * Sets the value of the residencePhone property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setResidencePhone(String value) {
		this.residencePhone = value;
	}

	/**
	 * Gets the value of the mobilePhone property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getMobilePhone() {
		return mobilePhone;
	}

	/**
	 * Sets the value of the mobilePhone property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setMobilePhone(String value) {
		this.mobilePhone = value;
	}

	/**
	 * Gets the value of the source property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSource() {
		return source;
	}

	/**
	 * Sets the value of the source property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSource(String value) {
		this.source = value;
	}

	/**
	 * Gets the value of the programCode property.
	 * 
	 */
	public int getProgramCode() {
		return programCode;
	}

	/**
	 * Sets the value of the programCode property.
	 * 
	 */
	public void setProgramCode(int value) {
		this.programCode = value;
	}

	/**
	 * Gets the value of the subProgramCode property.
	 * 
	 */
	public int getSubProgramCode() {
		return subProgramCode;
	}

	/**
	 * Sets the value of the subProgramCode property.
	 * 
	 */
	public void setSubProgramCode(int value) {
		this.subProgramCode = value;
	}

	/**
	 * Gets the value of the candidateID property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCandidateID() {
		return candidateID;
	}

	/**
	 * Sets the value of the candidateID property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCandidateID(String value) {
		this.candidateID = value;
	}

	/**
	 * Gets the value of the qualificationGroupCode property.
	 * 
	 */
	public int getQualificationGroupCode() {
		return qualificationGroupCode;
	}

	/**
	 * Sets the value of the qualificationGroupCode property.
	 * 
	 */
	public void setQualificationGroupCode(int value) {
		this.qualificationGroupCode = value;
	}

	/**
	 * Gets the value of the relevantExperience property.
	 * 
	 */
	public double getRelevantExperience() {
		return relevantExperience;
	}

	/**
	 * Sets the value of the relevantExperience property.
	 * 
	 */
	public void setRelevantExperience(double value) {
		this.relevantExperience = value;
	}

	/**
	 * Gets the value of the nonRelevantExperience property.
	 * 
	 */
	public double getNonRelevantExperience() {
		return nonRelevantExperience;
	}

	/**
	 * Sets the value of the nonRelevantExperience property.
	 * 
	 */
	public void setNonRelevantExperience(double value) {
		this.nonRelevantExperience = value;
	}

	/**
	 * Gets the value of the recruitmentSummary property.
	 * 
	 * @return possible object is byte[]
	 */
	public byte[] getRecruitmentSummary() {
		return recruitmentSummary;
	}

	/**
	 * Sets the value of the recruitmentSummary property.
	 * 
	 * @param value
	 *            allowed object is byte[]
	 */
	public void setRecruitmentSummary(byte[] value) {
		this.recruitmentSummary = ((byte[]) value);
	}

	/**
	 * Gets the value of the photograph property.
	 * 
	 * @return possible object is byte[]
	 */
	public byte[] getPhotograph() {
		return photograph;
	}

	/**
	 * Sets the value of the photograph property.
	 * 
	 * @param value
	 *            allowed object is byte[]
	 */
	public void setPhotograph(byte[] value) {
		this.photograph = ((byte[]) value);
	}

}
