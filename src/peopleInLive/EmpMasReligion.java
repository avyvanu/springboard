package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasReligion complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasReligion&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ReligionCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;ReligionName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasReligion", propOrder = { "religionCode", "religionName" })
public class EmpMasReligion {

	@XmlElement(name = "ReligionCode")
	protected int religionCode;
	@XmlElement(name = "ReligionName")
	protected String religionName;

	/**
	 * Gets the value of the religionCode property.
	 * 
	 */
	public int getReligionCode() {
		return religionCode;
	}

	/**
	 * Sets the value of the religionCode property.
	 * 
	 */
	public void setReligionCode(int value) {
		this.religionCode = value;
	}

	/**
	 * Gets the value of the religionName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getReligionName() {
		return religionName;
	}

	/**
	 * Sets the value of the religionName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setReligionName(String value) {
		this.religionName = value;
	}

}
