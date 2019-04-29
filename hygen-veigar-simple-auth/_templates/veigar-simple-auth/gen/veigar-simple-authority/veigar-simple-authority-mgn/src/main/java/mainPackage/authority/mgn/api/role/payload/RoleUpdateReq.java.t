---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/role/payload/RoleUpdateReq.java
---
package <%= h.mgnPackage(h, locals) %>.api.role.payload;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class RoleUpdateReq {

  @NotEmpty
  private String code;

  @NotEmpty
  private String name;

  private String remark;

  @NotEmpty
  private String status;

  private List<Integer> resource_ids;

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

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public List<Integer> getResource_ids() {
    return resource_ids;
  }

  public void setResource_ids(List<Integer> resource_ids) {
    this.resource_ids = resource_ids;
  }
}
