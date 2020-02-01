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
 *         &lt;element name=&quot;EmpMasCourseAppraisalListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCourseAppraisal&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCourseAppraisalListResult" })
@XmlRootElement(name = "EmpMasCourseAppraisalListResponse")
public class EmpMasCourseAppraisalListResponse {

	@XmlElement(name = "EmpMasCourseAppraisalListResult")
	protected ArrayOfEmpMasCourseAppraisal empMasCourseAppraisalListResult;

	/**
	 * Gets the value of the empMasCourseAppraisalListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCourseAppraisal }
	 * 
	 */
	public ArrayOfEmpMasCourseAppraisal getEmpMasCourseAppraisalListResult() {
		return empMasCourseAppraisalListResult;
	}

	/**
	 * Sets the value of the empMasCourseAppraisalListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCourseAppraisal }
	 * 
	 */
	public void setEmpMasCourseAppraisalListResult(
			ArrayOfEmpMasCourseAppraisal value) {
		this.empMasCourseAppraisalListResult = value;
	}

}
