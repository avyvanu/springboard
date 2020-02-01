package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * <p>
 * Java class for AMSRosterService complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;AMSRosterService&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ProgramName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;SubProgramName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Centername&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;CandidateID&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;RosterDate&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Shiftcode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;CreatedDate&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}dateTime&quot;/&gt;
 *         &lt;element name=&quot;ModifiedDate&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}dateTime&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AMSRosterService", propOrder = { "programName",
		"subProgramName", "centername", "candidateID", "rosterDate",
		"shiftcode", "createdDate", "modifiedDate" })
public class AMSRosterService {

	@XmlElement(name = "ProgramName")
	protected String programName;
	@XmlElement(name = "SubProgramName")
	protected String subProgramName;
	@XmlElement(name = "Centername")
	protected String centername;
	@XmlElement(name = "CandidateID")
	protected String candidateID;
	@XmlElement(name = "RosterDate")
	protected String rosterDate;
	@XmlElement(name = "Shiftcode")
	protected String shiftcode;
	@XmlElement(name = "CreatedDate", required = true)
	@XmlSchemaType(name = "dateTime")
	protected XMLGregorianCalendar createdDate;
	@XmlElement(name = "ModifiedDate", required = true)
	@XmlSchemaType(name = "dateTime")
	protected XMLGregorianCalendar modifiedDate;

	/**
	 * Gets the value of the programName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getProgramName() {
		return programName;
	}

	/**
	 * Sets the value of the programName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setProgramName(String value) {
		this.programName = value;
	}

	/**
	 * Gets the value of the subProgramName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSubProgramName() {
		return subProgramName;
	}

	/**
	 * Sets the value of the subProgramName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSubProgramName(String value) {
		this.subProgramName = value;
	}

	/**
	 * Gets the value of the centername property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCentername() {
		return centername;
	}

	/**
	 * Sets the value of the centername property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCentername(String value) {
		this.centername = value;
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
	 * Gets the value of the rosterDate property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRosterDate() {
		return rosterDate;
	}

	/**
	 * Sets the value of the rosterDate property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRosterDate(String value) {
		this.rosterDate = value;
	}

	/**
	 * Gets the value of the shiftcode property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getShiftcode() {
		return shiftcode;
	}

	/**
	 * Sets the value of the shiftcode property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setShiftcode(String value) {
		this.shiftcode = value;
	}

	/**
	 * Gets the value of the createdDate property.
	 * 
	 * @return possible object is {@link XMLGregorianCalendar }
	 * 
	 */
	public XMLGregorianCalendar getCreatedDate() {
		return createdDate;
	}

	/**
	 * Sets the value of the createdDate property.
	 * 
	 * @param value
	 *            allowed object is {@link XMLGregorianCalendar }
	 * 
	 */
	public void setCreatedDate(XMLGregorianCalendar value) {
		this.createdDate = value;
	}

	/**
	 * Gets the value of the modifiedDate property.
	 * 
	 * @return possible object is {@link XMLGregorianCalendar }
	 * 
	 */
	public XMLGregorianCalendar getModifiedDate() {
		return modifiedDate;
	}

	/**
	 * Sets the value of the modifiedDate property.
	 * 
	 * @param value
	 *            allowed object is {@link XMLGregorianCalendar }
	 * 
	 */
	public void setModifiedDate(XMLGregorianCalendar value) {
		this.modifiedDate = value;
	}

}
