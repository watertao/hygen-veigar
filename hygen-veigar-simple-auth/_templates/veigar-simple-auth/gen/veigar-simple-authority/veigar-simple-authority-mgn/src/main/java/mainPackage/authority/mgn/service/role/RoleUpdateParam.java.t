---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/role/RoleUpdateParam.java
---
package <%= h.mgnPackage(h, locals) %>.service.role;

import java.util.List;

public class RoleUpdateParam {

  private Integer id;
  private String code;
  private String name;
  private String remark;
  private String status;
  private List<Integer> resourceIds;

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public List<Integer> getResourceIds() {
    return resourceIds;
  }

  public void setResourceIds(List<Integer> resourceIds) {
    this.resourceIds = resourceIds;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

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

}
