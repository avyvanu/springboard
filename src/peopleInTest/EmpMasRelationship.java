package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasRelationship complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasRelationship&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;RelationshipCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;RelationshipName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasRelationship", propOrder = { "relationshipCode",
		"relationshipName" })
public class EmpMasRelationship {

	@XmlElement(name = "RelationshipCode")
	protected int relationshipCode;
	@XmlElement(name = "RelationshipName")
	protected String relationshipName;

	/**
	 * Gets the value of the relationshipCode property.
	 * 
	 */
	public int getRelationshipCode() {
		return relationshipCode;
	}

	/**
	 * Sets the value of the relationshipCode property.
	 * 
	 */
	public void setRelationshipCode(int value) {
		this.relationshipCode = value;
	}

	/**
	 * Gets the value of the relationshipName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRelationshipName() {
		return relationshipName;
	}

	/**
	 * Sets the value of the relationshipName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRelationshipName(String value) {
		this.relationshipName = value;
	}

}
