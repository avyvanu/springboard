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
 *         &lt;element name=&quot;EmpMasCityListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCity&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCityListResult" })
@XmlRootElement(name = "EmpMasCityListResponse")
public class EmpMasCityListResponse {

	@XmlElement(name = "EmpMasCityListResult")
	protected ArrayOfEmpMasCity empMasCityListResult;

	/**
	 * Gets the value of the empMasCityListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCity }
	 * 
	 */
	public ArrayOfEmpMasCity getEmpMasCityListResult() {
		return empMasCityListResult;
	}

	/**
	 * Sets the value of the empMasCityListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCity }
	 * 
	 */
	public void setEmpMasCityListResult(ArrayOfEmpMasCity value) {
		this.empMasCityListResult = value;
	}

}
