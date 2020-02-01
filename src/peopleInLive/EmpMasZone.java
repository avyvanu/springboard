package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasZone complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasZone&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ZoneCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;ZoneName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;CenterCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CenterName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasZone", propOrder = { "zoneCode", "zoneName",
		"centerCode", "centerName" })
public class EmpMasZone {

	@XmlElement(name = "ZoneCode")
	protected int zoneCode;
	@XmlElement(name = "ZoneName")
	protected String zoneName;
	@XmlElement(name = "CenterCode")
	protected int centerCode;
	@XmlElement(name = "CenterName")
	protected String centerName;

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
	 * Gets the value of the zoneName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getZoneName() {
		return zoneName;
	}

	/**
	 * Sets the value of the zoneName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setZoneName(String value) {
		this.zoneName = value;
	}

	/**
	 * Gets the value of the centerCode property.
	 * 
	 */
	public int getCenterCode() {
		return centerCode;
	}

	/**
	 * Sets the value of the centerCode property.
	 * 
	 */
	public void setCenterCode(int value) {
		this.centerCode = value;
	}

	/**
	 * Gets the value of the centerName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCenterName() {
		return centerName;
	}

	/**
	 * Sets the value of the centerName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCenterName(String value) {
		this.centerName = value;
	}

}
