---
to: <%= h.sessionPomLocation(h, locals) %>/src/main/java/<%= h.sessionPackageDir(h, locals) %>/<%= h.changeCase.pascalCase(appName) %>AuthenticationObject.java
---
package <%= h.sessionPackage(h, locals) %>;


import io.github.watertao.veigar.session.spi.AuthenticationObject;

import java.util.List;
import java.util.Map;

public class <%= h.changeCase.pascalCase(appName) %>AuthenticationObject extends AuthenticationObject {

  private String login_name;
  private Integer id;
  private String name;
  private String type;
  private List<Map> roles;
  private List<Map> resources;
  private List<String> attributes;

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getLogin_name() {
    return login_name;
  }

  public void setLogin_name(String login_name) {
    this.login_name = login_name;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public List<Map> getRoles() {
    return roles;
  }

  public void setRoles(List<Map> roles) {
    this.roles = roles;
  }

  public List<Map> getResources() {
    return resources;
  }

  public void setResources(List<Map> resources) {
    this.resources = resources;
  }

  @Override
  public List<String> getAttributes() {
    return attributes;
  }

  public void setAttributes(List<String> attributes) {
    this.attributes = attributes;
  }


}
