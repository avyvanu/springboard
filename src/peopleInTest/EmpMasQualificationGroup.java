package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasQualificationGroup complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasQualificationGroup&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;QualificationGroupCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;QualificationGroupName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasQualificationGroup", propOrder = {
		"qualificationGroupCode", "qualificationGroupName" })
public class EmpMasQualificationGroup {

	@XmlElement(name = "QualificationGroupCode")
	protected int qualificationGroupCode;
	@XmlElement(name = "QualificationGroupName")
	protected String qualificationGroupName;

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
	 * Gets the value of the qualificationGroupName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getQualificationGroupName() {
		return qualificationGroupName;
	}

	/**
	 * Sets the value of the qualificationGroupName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setQualificationGroupName(String value) {
		this.qualificationGroupName = value;
	}

}
