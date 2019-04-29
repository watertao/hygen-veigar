---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/api/pet/payload/PetRes.java
---
package <%= h.mainPackage(h, locals) %>.api.pet.payload;

public class PetRes {

  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
