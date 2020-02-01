package peopleInTest;

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
 *         &lt;element name=&quot;EmpMasAccommodationTypeListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasAccommodationType&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasAccommodationTypeListResult" })
@XmlRootElement(name = "EmpMasAccommodationTypeListResponse")
public class EmpMasAccommodationTypeListResponse {

	@XmlElement(name = "EmpMasAccommodationTypeListResult")
	protected ArrayOfEmpMasAccommodationType empMasAccommodationTypeListResult;

	/**
	 * Gets the value of the empMasAccommodationTypeListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasAccommodationType }
	 * 
	 */
	public ArrayOfEmpMasAccommodationType getEmpMasAccommodationTypeListResult() {
		return empMasAccommodationTypeListResult;
	}

	/**
	 * Sets the value of the empMasAccommodationTypeListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasAccommodationType }
	 * 
	 */
	public void setEmpMasAccommodationTypeListResult(
			ArrayOfEmpMasAccommodationType value) {
		this.empMasAccommodationTypeListResult = value;
	}

}
