---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/role/RoleFilterParam.java
---
package <%= h.mgnPackage(h, locals) %>.service.role;

import <%= h.mgnPackage(h, locals) %>.service.AbstractFilterParam;


public class RoleFilterParam extends AbstractFilterParam {

  private String code;
  private String name;
  private String status;

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  protected String getRealSortField(String sortFieldInQueryParam) {
    if ("name".equals(sortFieldInQueryParam)) {
      return "name";
    } else if ("code".equals(sortFieldInQueryParam)) {
      return "code";
    }
    return null;
  }

}
