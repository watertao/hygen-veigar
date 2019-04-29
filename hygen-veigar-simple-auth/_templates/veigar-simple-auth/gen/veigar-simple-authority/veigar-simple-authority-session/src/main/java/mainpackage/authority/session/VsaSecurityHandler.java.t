---
to: <%= h.sessionPomLocation(h, locals) %>/src/main/java/<%= h.sessionPackageDir(h, locals) %>/<%= h.changeCase.pascalCase(appName) %>SecurityHandler.java
---
package <%= h.sessionPackage(h, locals) %>;

import io.github.watertao.veigar.session.api.URIPatternMatcher;
import io.github.watertao.veigar.session.spi.AuthenticationObject;
import io.github.watertao.veigar.session.spi.SecurityHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Component
public class <%= h.changeCase.pascalCase(appName) %>SecurityHandler implements SecurityHandler {

  private static final Logger logger = LoggerFactory.getLogger(<%= h.changeCase.pascalCase(appName) %>SecurityHandler.class);

  private static final String ROLE_SUPERVISOR = "ROLE_SUPERVISOR";

  private Map<String, List<Map>> resourcesMap;

  @Autowired
  private SecurityCstmMapper securityCstmMapper;


  public <%= h.changeCase.pascalCase(appName) %>Resource identifyResource(String verb, String uri, AuthenticationObject authObj) {

    if (resourcesMap.get(verb) == null || resourcesMap.get(verb).size() == 0) {
      return null;
    }

    Map resource = null;
    for (Map resourceEntry : resourcesMap.get(verb)) {
      if (URIPatternMatcher.matches((String) resourceEntry.get("uri_pattern"), uri)) {
        resource = resourceEntry;
        break;
      }
    }

    if (resource == null) {
      return null;
    }

    <%= h.changeCase.pascalCase(appName) %>Resource <%= appName %>Resource = new <%= h.changeCase.pascalCase(appName) %>Resource();
    <%= appName %>Resource.setId((Integer) resource.get("id"));
    <%= appName %>Resource.setVerb((String) resource.get("verb"));
    <%= appName %>Resource.setUriPattern((String) resource.get("uri_pattern"));
    <%= appName %>Resource.setName((String) resource.get("name"));
    <%= appName %>Resource.setRemark((String) resource.get("remark"));
    <%= appName %>Resource.setAttributes(((Function<String, List<String>>) (role -> {
      List<String> attributes = new ArrayList();
      attributes.add(role);
      return attributes;
    })).apply(ROLE_SUPERVISOR));

    List<Map> roles = securityCstmMapper.findActiveRolesByResourceId(<%= appName %>Resource.getId());
    roles.forEach(role -> <%= appName %>Resource.getAttributes().add((String) role.get("code")));

    return <%= appName %>Resource;

  }

  @PostConstruct
  public void onApplicationEvent() {
    resourcesMap = new HashMap();
    List<Map> resourceList = securityCstmMapper.findFullResources();
    resourceList.forEach((item) -> {
      String verb = (String) item.get("verb");
      if (resourcesMap.get(verb) == null) {
        resourcesMap.put(verb, new ArrayList<>());
      }
      resourcesMap.get(verb).add(item);
    });

  }

}
