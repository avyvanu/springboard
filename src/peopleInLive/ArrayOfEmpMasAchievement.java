package peopleInLive;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ArrayOfEmpMasAchievement complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;ArrayOfEmpMasAchievement&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;EmpMasAchievement&quot; type=&quot;{http://tempuri.org/}EmpMasAchievement&quot; maxOccurs=&quot;unbounded&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfEmpMasAchievement", propOrder = { "empMasAchievement" })
public class ArrayOfEmpMasAchievement {

	@XmlElement(name = "EmpMasAchievement", nillable = true)
	protected List<EmpMasAchievement> empMasAchievement;

	/**
	 * Gets the value of the empMasAchievement property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the empMasAchievement property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getEmpMasAchievement().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link EmpMasAchievement }
	 * 
	 * 
	 */
	public List<EmpMasAchievement> getEmpMasAchievement() {
		if (empMasAchievement == null) {
			empMasAchievement = new ArrayList<EmpMasAchievement>();
		}
		return this.empMasAchievement;
	}

}
