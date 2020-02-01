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
 *         &lt;element name=&quot;EmpMasQualGroupListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasQualGroup&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasQualGroupListResult" })
@XmlRootElement(name = "EmpMasQualGroupListResponse")
public class EmpMasQualGroupListResponse {

	@XmlElement(name = "EmpMasQualGroupListResult")
	protected ArrayOfEmpMasQualGroup empMasQualGroupListResult;

	/**
	 * Gets the value of the empMasQualGroupListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasQualGroup }
	 * 
	 */
	public ArrayOfEmpMasQualGroup getEmpMasQualGroupListResult() {
		return empMasQualGroupListResult;
	}

	/**
	 * Sets the value of the empMasQualGroupListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasQualGroup }
	 * 
	 */
	public void setEmpMasQualGroupListResult(ArrayOfEmpMasQualGroup value) {
		this.empMasQualGroupListResult = value;
	}

}
