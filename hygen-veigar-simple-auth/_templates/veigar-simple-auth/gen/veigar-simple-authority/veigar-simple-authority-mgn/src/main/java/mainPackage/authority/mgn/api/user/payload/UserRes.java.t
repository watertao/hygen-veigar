---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/user/payload/UserRes.java
---
package <%= h.mgnPackage(h, locals) %>.api.user.payload;

import java.util.Date;
import java.util.List;

public class UserRes {

  private Integer id;
  private String login_name;
  private String name;
  private String status;
  private String type;
  private String remark;
  private Date last_login_time;
  private String last_login_ip;
  private Date create_time;
  private Date update_time;
  private List<UserRoleRes> roles;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
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

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public Date getLast_login_time() {
    return last_login_time;
  }

  public void setLast_login_time(Date last_login_time) {
    this.last_login_time = last_login_time;
  }

  public String getLast_login_ip() {
    return last_login_ip;
  }

  public void setLast_login_ip(String last_login_ip) {
    this.last_login_ip = last_login_ip;
  }

  public Date getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Date create_time) {
    this.create_time = create_time;
  }

  public Date getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Date update_time) {
    this.update_time = update_time;
  }

  public List<UserRoleRes> getRoles() {
    return roles;
  }

  public void setRoles(List<UserRoleRes> roles) {
    this.roles = roles;
  }

  public static class UserRoleRes {

    private Integer id;
    private String code;
    private String name;
    private String remark;

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

}
