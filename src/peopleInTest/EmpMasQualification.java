package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasQualification complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasQualification&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;QualificationGroupCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;QualificationCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;QualificationName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasQualification", propOrder = { "qualificationGroupCode",
		"qualificationCode", "qualificationName" })
public class EmpMasQualification {

	@XmlElement(name = "QualificationGroupCode")
	protected int qualificationGroupCode;
	@XmlElement(name = "QualificationCode")
	protected int qualificationCode;
	@XmlElement(name = "QualificationName")
	protected String qualificationName;

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
	 * Gets the value of the qualificationCode property.
	 * 
	 */
	public int getQualificationCode() {
		return qualificationCode;
	}

	/**
	 * Sets the value of the qualificationCode property.
	 * 
	 */
	public void setQualificationCode(int value) {
		this.qualificationCode = value;
	}

	/**
	 * Gets the value of the qualificationName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getQualificationName() {
		return qualificationName;
	}

	/**
	 * Sets the value of the qualificationName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setQualificationName(String value) {
		this.qualificationName = value;
	}

}
