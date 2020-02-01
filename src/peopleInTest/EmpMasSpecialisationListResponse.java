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
 *         &lt;element name=&quot;EmpMasSpecialisationListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasSpecialisation&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasSpecialisationListResult" })
@XmlRootElement(name = "EmpMasSpecialisationListResponse")
public class EmpMasSpecialisationListResponse {

	@XmlElement(name = "EmpMasSpecialisationListResult")
	protected ArrayOfEmpMasSpecialisation empMasSpecialisationListResult;

	/**
	 * Gets the value of the empMasSpecialisationListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasSpecialisation }
	 * 
	 */
	public ArrayOfEmpMasSpecialisation getEmpMasSpecialisationListResult() {
		return empMasSpecialisationListResult;
	}

	/**
	 * Sets the value of the empMasSpecialisationListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasSpecialisation }
	 * 
	 */
	public void setEmpMasSpecialisationListResult(
			ArrayOfEmpMasSpecialisation value) {
		this.empMasSpecialisationListResult = value;
	}

}
