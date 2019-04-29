---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/user/payload/UserUpdateReq.java
---
package <%= h.mgnPackage(h, locals) %>.api.user.payload;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class UserUpdateReq {

  @NotEmpty
  private String login_name;

  @NotEmpty
  private String name;

  private String remark;

  @NotEmpty
  private String status;

  private List<Integer> role_ids;

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getLogin_name() {
    return login_name;
  }

  public void setLogin_name(String login_name) {
    this.login_name = login_name;
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


  public List<Integer> getRole_ids() {
    return role_ids;
  }

  public void setRole_ids(List<Integer> role_ids) {
    this.role_ids = role_ids;
  }

}
