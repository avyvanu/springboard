package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasNationality complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasNationality&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;NationalityCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;NationalityName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasNationality", propOrder = { "nationalityCode",
		"nationalityName" })
public class EmpMasNationality {

	@XmlElement(name = "NationalityCode")
	protected int nationalityCode;
	@XmlElement(name = "NationalityName")
	protected String nationalityName;

	/**
	 * Gets the value of the nationalityCode property.
	 * 
	 */
	public int getNationalityCode() {
		return nationalityCode;
	}

	/**
	 * Sets the value of the nationalityCode property.
	 * 
	 */
	public void setNationalityCode(int value) {
		this.nationalityCode = value;
	}

	/**
	 * Gets the value of the nationalityName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getNationalityName() {
		return nationalityName;
	}

	/**
	 * Sets the value of the nationalityName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setNationalityName(String value) {
		this.nationalityName = value;
	}

}
