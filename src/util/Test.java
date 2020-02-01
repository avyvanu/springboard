package util;

public class Test 
{
	private int age = 10;
	  private String name;
	  
	  public String toString() {
	     return String.format("%s (age: %d)", name, age);
   }
	  
   public int getAge() {
	    return age;
	   }
	   
	   public void setAge(int age) {
	     this.age = age;
	  }
	   
	   protected void setName(String name) {
	     this.name = name;
	   }
}
