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
 *         &lt;element name=&quot;EmpMasQualificationListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasQualification&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasQualificationListResult" })
@XmlRootElement(name = "EmpMasQualificationListResponse")
public class EmpMasQualificationListResponse {

	@XmlElement(name = "EmpMasQualificationListResult")
	protected ArrayOfEmpMasQualification empMasQualificationListResult;

	/**
	 * Gets the value of the empMasQualificationListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasQualification }
	 * 
	 */
	public ArrayOfEmpMasQualification getEmpMasQualificationListResult() {
		return empMasQualificationListResult;
	}

	/**
	 * Sets the value of the empMasQualificationListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasQualification }
	 * 
	 */
	public void setEmpMasQualificationListResult(
			ArrayOfEmpMasQualification value) {
		this.empMasQualificationListResult = value;
	}

}
