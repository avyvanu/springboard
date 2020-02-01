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
 *         &lt;element name=&quot;EmpMasQualificationGroupListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasQualificationGroup&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasQualificationGroupListResult" })
@XmlRootElement(name = "EmpMasQualificationGroupListResponse")
public class EmpMasQualificationGroupListResponse {

	@XmlElement(name = "EmpMasQualificationGroupListResult")
	protected ArrayOfEmpMasQualificationGroup empMasQualificationGroupListResult;

	/**
	 * Gets the value of the empMasQualificationGroupListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasQualificationGroup }
	 * 
	 */
	public ArrayOfEmpMasQualificationGroup getEmpMasQualificationGroupListResult() {
		return empMasQualificationGroupListResult;
	}

	/**
	 * Sets the value of the empMasQualificationGroupListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasQualificationGroup }
	 * 
	 */
	public void setEmpMasQualificationGroupListResult(
			ArrayOfEmpMasQualificationGroup value) {
		this.empMasQualificationGroupListResult = value;
	}

}
