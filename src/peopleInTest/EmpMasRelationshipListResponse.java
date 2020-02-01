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
 *         &lt;element name=&quot;EmpMasRelationshipListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasRelationship&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasRelationshipListResult" })
@XmlRootElement(name = "EmpMasRelationshipListResponse")
public class EmpMasRelationshipListResponse {

	@XmlElement(name = "EmpMasRelationshipListResult")
	protected ArrayOfEmpMasRelationship empMasRelationshipListResult;

	/**
	 * Gets the value of the empMasRelationshipListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasRelationship }
	 * 
	 */
	public ArrayOfEmpMasRelationship getEmpMasRelationshipListResult() {
		return empMasRelationshipListResult;
	}

	/**
	 * Sets the value of the empMasRelationshipListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasRelationship }
	 * 
	 */
	public void setEmpMasRelationshipListResult(ArrayOfEmpMasRelationship value) {
		this.empMasRelationshipListResult = value;
	}

}
