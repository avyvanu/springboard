package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;EmpMasZoneListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasZone&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasZoneListResult" })
@XmlRootElement(name = "EmpMasZoneListResponse")
public class EmpMasZoneListResponse {

	@XmlElement(name = "EmpMasZoneListResult")
	protected ArrayOfEmpMasZone empMasZoneListResult;

	/**
	 * Gets the value of the empMasZoneListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasZone }
	 * 
	 */
	public ArrayOfEmpMasZone getEmpMasZoneListResult() {
		return empMasZoneListResult;
	}

	/**
	 * Sets the value of the empMasZoneListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasZone }
	 * 
	 */
	public void setEmpMasZoneListResult(ArrayOfEmpMasZone value) {
		this.empMasZoneListResult = value;
	}

}
