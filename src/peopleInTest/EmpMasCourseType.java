package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasCourseType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasCourseType&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;CourseTypeCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CourseTypeName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasCourseType", propOrder = { "courseTypeCode",
		"courseTypeName" })
public class EmpMasCourseType {

	@XmlElement(name = "CourseTypeCode")
	protected int courseTypeCode;
	@XmlElement(name = "CourseTypeName")
	protected String courseTypeName;

	/**
	 * Gets the value of the courseTypeCode property.
	 * 
	 */
	public int getCourseTypeCode() {
		return courseTypeCode;
	}

	/**
	 * Sets the value of the courseTypeCode property.
	 * 
	 */
	public void setCourseTypeCode(int value) {
		this.courseTypeCode = value;
	}

	/**
	 * Gets the value of the courseTypeName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCourseTypeName() {
		return courseTypeName;
	}

	/**
	 * Sets the value of the courseTypeName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCourseTypeName(String value) {
		this.courseTypeName = value;
	}

}
