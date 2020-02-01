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
 *         &lt;element name=&quot;EmpMasStateListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasState&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasStateListResult" })
@XmlRootElement(name = "EmpMasStateListResponse")
public class EmpMasStateListResponse {

	@XmlElement(name = "EmpMasStateListResult")
	protected ArrayOfEmpMasState empMasStateListResult;

	/**
	 * Gets the value of the empMasStateListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasState }
	 * 
	 */
	public ArrayOfEmpMasState getEmpMasStateListResult() {
		return empMasStateListResult;
	}

	/**
	 * Sets the value of the empMasStateListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasState }
	 * 
	 */
	public void setEmpMasStateListResult(ArrayOfEmpMasState value) {
		this.empMasStateListResult = value;
	}

}
