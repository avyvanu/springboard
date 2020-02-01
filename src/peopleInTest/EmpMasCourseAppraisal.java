package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasCourseAppraisal complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasCourseAppraisal&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;CourseAppraisalCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CourseAppraisalName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasCourseAppraisal", propOrder = { "courseAppraisalCode",
		"courseAppraisalName" })
public class EmpMasCourseAppraisal {

	@XmlElement(name = "CourseAppraisalCode")
	protected int courseAppraisalCode;
	@XmlElement(name = "CourseAppraisalName")
	protected String courseAppraisalName;

	/**
	 * Gets the value of the courseAppraisalCode property.
	 * 
	 */
	public int getCourseAppraisalCode() {
		return courseAppraisalCode;
	}

	/**
	 * Sets the value of the courseAppraisalCode property.
	 * 
	 */
	public void setCourseAppraisalCode(int value) {
		this.courseAppraisalCode = value;
	}

	/**
	 * Gets the value of the courseAppraisalName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCourseAppraisalName() {
		return courseAppraisalName;
	}

	/**
	 * Sets the value of the courseAppraisalName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCourseAppraisalName(String value) {
		this.courseAppraisalName = value;
	}

}
