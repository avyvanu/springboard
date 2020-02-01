package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasArea complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasArea&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ZoneCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;AreaCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;AreaName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Active&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasArea", propOrder = { "zoneCode", "areaCode", "areaName",
		"active" })
public class EmpMasArea {

	@XmlElement(name = "ZoneCode")
	protected int zoneCode;
	@XmlElement(name = "AreaCode")
	protected int areaCode;
	@XmlElement(name = "AreaName")
	protected String areaName;
	@XmlElement(name = "Active")
	protected String active;

	/**
	 * Gets the value of the zoneCode property.
	 * 
	 */
	public int getZoneCode() {
		return zoneCode;
	}

	/**
	 * Sets the value of the zoneCode property.
	 * 
	 */
	public void setZoneCode(int value) {
		this.zoneCode = value;
	}

	/**
	 * Gets the value of the areaCode property.
	 * 
	 */
	public int getAreaCode() {
		return areaCode;
	}

	/**
	 * Sets the value of the areaCode property.
	 * 
	 */
	public void setAreaCode(int value) {
		this.areaCode = value;
	}

	/**
	 * Gets the value of the areaName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getAreaName() {
		return areaName;
	}

	/**
	 * Sets the value of the areaName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setAreaName(String value) {
		this.areaName = value;
	}

	/**
	 * Gets the value of the active property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getActive() {
		return active;
	}

	/**
	 * Sets the value of the active property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setActive(String value) {
		this.active = value;
	}

}
