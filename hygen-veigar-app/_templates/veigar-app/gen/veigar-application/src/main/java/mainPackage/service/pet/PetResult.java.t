---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/service/pet/PetResult.java
---
package <%= h.mainPackage(h, locals) %>.service.pet;

public class PetResult {

  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
