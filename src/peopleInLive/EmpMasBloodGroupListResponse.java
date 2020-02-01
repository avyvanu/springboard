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
 *         &lt;element name=&quot;EmpMasBloodGroupListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasBloodGroup&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasBloodGroupListResult" })
@XmlRootElement(name = "EmpMasBloodGroupListResponse")
public class EmpMasBloodGroupListResponse {

	@XmlElement(name = "EmpMasBloodGroupListResult")
	protected ArrayOfEmpMasBloodGroup empMasBloodGroupListResult;

	/**
	 * Gets the value of the empMasBloodGroupListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasBloodGroup }
	 * 
	 */
	public ArrayOfEmpMasBloodGroup getEmpMasBloodGroupListResult() {
		return empMasBloodGroupListResult;
	}

	/**
	 * Sets the value of the empMasBloodGroupListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasBloodGroup }
	 * 
	 */
	public void setEmpMasBloodGroupListResult(ArrayOfEmpMasBloodGroup value) {
		this.empMasBloodGroupListResult = value;
	}

}
