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
 *         &lt;element name=&quot;EmpMasCourseTypeListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCourseType&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCourseTypeListResult" })
@XmlRootElement(name = "EmpMasCourseTypeListResponse")
public class EmpMasCourseTypeListResponse {

	@XmlElement(name = "EmpMasCourseTypeListResult")
	protected ArrayOfEmpMasCourseType empMasCourseTypeListResult;

	/**
	 * Gets the value of the empMasCourseTypeListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCourseType }
	 * 
	 */
	public ArrayOfEmpMasCourseType getEmpMasCourseTypeListResult() {
		return empMasCourseTypeListResult;
	}

	/**
	 * Sets the value of the empMasCourseTypeListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCourseType }
	 * 
	 */
	public void setEmpMasCourseTypeListResult(ArrayOfEmpMasCourseType value) {
		this.empMasCourseTypeListResult = value;
	}

}
