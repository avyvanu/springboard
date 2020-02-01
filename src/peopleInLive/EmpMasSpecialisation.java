package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasSpecialisation complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasSpecialisation&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;SpecialisationCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;SpecialisationName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasSpecialisation", propOrder = { "specialisationCode",
		"specialisationName" })
public class EmpMasSpecialisation {

	@XmlElement(name = "SpecialisationCode")
	protected int specialisationCode;
	@XmlElement(name = "SpecialisationName")
	protected String specialisationName;

	/**
	 * Gets the value of the specialisationCode property.
	 * 
	 */
	public int getSpecialisationCode() {
		return specialisationCode;
	}

	/**
	 * Sets the value of the specialisationCode property.
	 * 
	 */
	public void setSpecialisationCode(int value) {
		this.specialisationCode = value;
	}

	/**
	 * Gets the value of the specialisationName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSpecialisationName() {
		return specialisationName;
	}

	/**
	 * Sets the value of the specialisationName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSpecialisationName(String value) {
		this.specialisationName = value;
	}

}
