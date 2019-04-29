---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/user/UserFilterParam.java
---
package <%= h.mgnPackage(h, locals) %>.service.user;

import <%= h.mgnPackage(h, locals) %>.service.AbstractFilterParam;


public class UserFilterParam extends AbstractFilterParam {

  private String loginName;
  private String name;
  private String status;

  public String getLoginName() {
    return loginName;
  }

  public void setLoginName(String loginName) {
    this.loginName = loginName;
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
    return null;
  }
}
