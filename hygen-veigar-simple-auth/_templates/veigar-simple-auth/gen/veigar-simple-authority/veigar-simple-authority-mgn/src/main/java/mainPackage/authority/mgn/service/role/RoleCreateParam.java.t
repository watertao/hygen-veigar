---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/role/RoleCreateParam.java
---
package <%= h.mgnPackage(h, locals) %>.service.role;

import java.util.List;

public class RoleCreateParam {

  private String code;
  private String name;
  private String remark;

  private List<Integer> resourceIds;

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

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public List<Integer> getResourceIds() {
    return resourceIds;
  }

  public void setResourceIds(List<Integer> resourceIds) {
    this.resourceIds = resourceIds;
  }
}
