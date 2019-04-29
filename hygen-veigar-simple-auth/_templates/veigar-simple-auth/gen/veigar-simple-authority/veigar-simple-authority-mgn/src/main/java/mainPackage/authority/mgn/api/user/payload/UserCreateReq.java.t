---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/role/payload/UserCreateReq.java
---
package <%= h.mgnPackage(h, locals) %>.api.user.payload;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class UserCreateReq {

  @NotEmpty
  private String login_name;

  @NotEmpty
  private String name;

  private String remark;

  @NotEmpty
  private String password;

  private List<Integer> role_ids;

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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public List<Integer> getRole_ids() {
    return role_ids;
  }

  public void setRole_ids(List<Integer> role_ids) {
    this.role_ids = role_ids;
  }

}
