package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasCourseCategory complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasCourseCategory&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;CourseCategoryCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CourseCategoryName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasCourseCategory", propOrder = { "courseCategoryCode",
		"courseCategoryName" })
public class EmpMasCourseCategory {

	@XmlElement(name = "CourseCategoryCode")
	protected int courseCategoryCode;
	@XmlElement(name = "CourseCategoryName")
	protected String courseCategoryName;

	/**
	 * Gets the value of the courseCategoryCode property.
	 * 
	 */
	public int getCourseCategoryCode() {
		return courseCategoryCode;
	}

	/**
	 * Sets the value of the courseCategoryCode property.
	 * 
	 */
	public void setCourseCategoryCode(int value) {
		this.courseCategoryCode = value;
	}

	/**
	 * Gets the value of the courseCategoryName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCourseCategoryName() {
		return courseCategoryName;
	}

	/**
	 * Sets the value of the courseCategoryName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCourseCategoryName(String value) {
		this.courseCategoryName = value;
	}

}
