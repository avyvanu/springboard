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
 *         &lt;element name=&quot;EmpMasCountryListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCountry&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCountryListResult" })
@XmlRootElement(name = "EmpMasCountryListResponse")
public class EmpMasCountryListResponse {

	@XmlElement(name = "EmpMasCountryListResult")
	protected ArrayOfEmpMasCountry empMasCountryListResult;

	/**
	 * Gets the value of the empMasCountryListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCountry }
	 * 
	 */
	public ArrayOfEmpMasCountry getEmpMasCountryListResult() {
		return empMasCountryListResult;
	}

	/**
	 * Sets the value of the empMasCountryListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCountry }
	 * 
	 */
	public void setEmpMasCountryListResult(ArrayOfEmpMasCountry value) {
		this.empMasCountryListResult = value;
	}

}
