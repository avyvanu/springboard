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
 *         &lt;element name=&quot;EmpMasNationalityListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasNationality&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasNationalityListResult" })
@XmlRootElement(name = "EmpMasNationalityListResponse")
public class EmpMasNationalityListResponse {

	@XmlElement(name = "EmpMasNationalityListResult")
	protected ArrayOfEmpMasNationality empMasNationalityListResult;

	/**
	 * Gets the value of the empMasNationalityListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasNationality }
	 * 
	 */
	public ArrayOfEmpMasNationality getEmpMasNationalityListResult() {
		return empMasNationalityListResult;
	}

	/**
	 * Sets the value of the empMasNationalityListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasNationality }
	 * 
	 */
	public void setEmpMasNationalityListResult(ArrayOfEmpMasNationality value) {
		this.empMasNationalityListResult = value;
	}

}
