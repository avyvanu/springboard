package peopleInLive;

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
 *         &lt;element name=&quot;EmpMasAchievementListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasAchievement&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasAchievementListResult" })
@XmlRootElement(name = "EmpMasAchievementListResponse")
public class EmpMasAchievementListResponse {

	@XmlElement(name = "EmpMasAchievementListResult")
	protected ArrayOfEmpMasAchievement empMasAchievementListResult;

	/**
	 * Gets the value of the empMasAchievementListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasAchievement }
	 * 
	 */
	public ArrayOfEmpMasAchievement getEmpMasAchievementListResult() {
		return empMasAchievementListResult;
	}

	/**
	 * Sets the value of the empMasAchievementListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasAchievement }
	 * 
	 */
	public void setEmpMasAchievementListResult(ArrayOfEmpMasAchievement value) {
		this.empMasAchievementListResult = value;
	}

}
