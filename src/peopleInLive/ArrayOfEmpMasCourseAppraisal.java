package peopleInLive;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ArrayOfEmpMasCourseAppraisal complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;ArrayOfEmpMasCourseAppraisal&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;EmpMasCourseAppraisal&quot; type=&quot;{http://tempuri.org/}EmpMasCourseAppraisal&quot; maxOccurs=&quot;unbounded&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfEmpMasCourseAppraisal", propOrder = { "empMasCourseAppraisal" })
public class ArrayOfEmpMasCourseAppraisal {

	@XmlElement(name = "EmpMasCourseAppraisal", nillable = true)
	protected List<EmpMasCourseAppraisal> empMasCourseAppraisal;

	/**
	 * Gets the value of the empMasCourseAppraisal property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the empMasCourseAppraisal property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getEmpMasCourseAppraisal().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link EmpMasCourseAppraisal }
	 * 
	 * 
	 */
	public List<EmpMasCourseAppraisal> getEmpMasCourseAppraisal() {
		if (empMasCourseAppraisal == null) {
			empMasCourseAppraisal = new ArrayList<EmpMasCourseAppraisal>();
		}
		return this.empMasCourseAppraisal;
	}

}
