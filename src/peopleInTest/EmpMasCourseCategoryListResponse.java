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
 *         &lt;element name=&quot;EmpMasCourseCategoryListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCourseCategory&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCourseCategoryListResult" })
@XmlRootElement(name = "EmpMasCourseCategoryListResponse")
public class EmpMasCourseCategoryListResponse {

	@XmlElement(name = "EmpMasCourseCategoryListResult")
	protected ArrayOfEmpMasCourseCategory empMasCourseCategoryListResult;

	/**
	 * Gets the value of the empMasCourseCategoryListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCourseCategory }
	 * 
	 */
	public ArrayOfEmpMasCourseCategory getEmpMasCourseCategoryListResult() {
		return empMasCourseCategoryListResult;
	}

	/**
	 * Sets the value of the empMasCourseCategoryListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCourseCategory }
	 * 
	 */
	public void setEmpMasCourseCategoryListResult(
			ArrayOfEmpMasCourseCategory value) {
		this.empMasCourseCategoryListResult = value;
	}

}
