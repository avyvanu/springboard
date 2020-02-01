package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasBloodGroup complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasBloodGroup&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;BloodGroupCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;BloodGroupName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasBloodGroup", propOrder = { "bloodGroupCode",
		"bloodGroupName" })
public class EmpMasBloodGroup {

	@XmlElement(name = "BloodGroupCode")
	protected int bloodGroupCode;
	@XmlElement(name = "BloodGroupName")
	protected String bloodGroupName;

	/**
	 * Gets the value of the bloodGroupCode property.
	 * 
	 */
	public int getBloodGroupCode() {
		return bloodGroupCode;
	}

	/**
	 * Sets the value of the bloodGroupCode property.
	 * 
	 */
	public void setBloodGroupCode(int value) {
		this.bloodGroupCode = value;
	}

	/**
	 * Gets the value of the bloodGroupName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getBloodGroupName() {
		return bloodGroupName;
	}

	/**
	 * Sets the value of the bloodGroupName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setBloodGroupName(String value) {
		this.bloodGroupName = value;
	}

}
