package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpNewJoinee complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpNewJoinee&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;EmpID&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Name&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Center&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;RecSource&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;ReferralId&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;TypeofProgram&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpNewJoinee", propOrder = { "empID", "name", "center",
		"recSource", "referralId", "typeofProgram" })
public class EmpNewJoinee {

	@XmlElement(name = "EmpID")
	protected String empID;
	@XmlElement(name = "Name")
	protected String name;
	@XmlElement(name = "Center")
	protected String center;
	@XmlElement(name = "RecSource")
	protected String recSource;
	@XmlElement(name = "ReferralId")
	protected String referralId;
	@XmlElement(name = "TypeofProgram")
	protected String typeofProgram;

	/**
	 * Gets the value of the empID property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getEmpID() {
		return empID;
	}

	/**
	 * Sets the value of the empID property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setEmpID(String value) {
		this.empID = value;
	}

	/**
	 * Gets the value of the name property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the value of the name property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setName(String value) {
		this.name = value;
	}

	/**
	 * Gets the value of the center property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCenter() {
		return center;
	}

	/**
	 * Sets the value of the center property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCenter(String value) {
		this.center = value;
	}

	/**
	 * Gets the value of the recSource property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRecSource() {
		return recSource;
	}

	/**
	 * Sets the value of the recSource property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRecSource(String value) {
		this.recSource = value;
	}

	/**
	 * Gets the value of the referralId property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getReferralId() {
		return referralId;
	}

	/**
	 * Sets the value of the referralId property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setReferralId(String value) {
		this.referralId = value;
	}

	/**
	 * Gets the value of the typeofProgram property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getTypeofProgram() {
		return typeofProgram;
	}

	/**
	 * Sets the value of the typeofProgram property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setTypeofProgram(String value) {
		this.typeofProgram = value;
	}

}
