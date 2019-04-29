---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/<%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter.java
---
package <%= h.authenticationDbPackage(h, locals) %>;

import <%= h.sessionPackage(h, locals) %>.<%= h.changeCase.pascalCase(appName) %>AuthenticationObject;
import <%= h.authenticationDbPackage(h, locals) %>.mapper.autogen.TAuthResourceMapper;
import <%= h.authenticationDbPackage(h, locals) %>.mapper.autogen.TAuthUserMapper;
import <%= h.authenticationDbPackage(h, locals) %>.mapper.custom.AuthenticationCstmMapper;
import <%= h.authenticationDbPackage(h, locals) %>.model.TAuthResource;
import <%= h.authenticationDbPackage(h, locals) %>.model.TAuthResourceExample;
import <%= h.authenticationDbPackage(h, locals) %>.model.TAuthUser;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.watertao.veigar.core.exception.InternalServerErrorException;
import io.github.watertao.veigar.core.filter.AbstractRequestAwareFilter;
import io.github.watertao.veigar.core.filter.FilterOrders;
import io.github.watertao.veigar.core.message.LocaleMessage;
import io.github.watertao.veigar.core.util.HttpRequestHelper;
import io.github.watertao.veigar.session.api.AuthObjHolder;
import io.github.watertao.veigar.core.exception.BadRequestException;
import io.github.watertao.veigar.core.exception.NotFoundException;
import io.github.watertao.veigar.core.exception.UnauthenticatedException;
import io.github.watertao.veigar.session.spi.AuthenticationObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.HibernateValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.util.*;

/**
 * Request Json Sample:
 * -----------------------------------------------------------
 * {
 *     "login_name": "watertao",
 *     "password": "888888"
 * }
 * -----------------------------------------------------------
 *
 */
public class <%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter extends AbstractRequestAwareFilter {

  private static final String VERB = "POST";
  private static final String URI = "/system/session";

  private static final Validator validator = Validation
    .byProvider(HibernateValidator.class).configure().failFast(true).buildValidatorFactory().getValidator();

  private ObjectMapper mapper = new Jackson2ObjectMapperBuilder().build();

  @Autowired
  private AuthenticationCstmMapper authenticationCstmMapper;

  @Autowired
  private TAuthResourceMapper resourceMapper;

  @Autowired
  private TAuthUserMapper userMapper;

  @Autowired
  private LocaleMessage localeMessage;

  @Autowired
  private Environment env;

  protected <%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter() {
    super(VERB, URI);
  }


  protected AuthenticationObject authenticate(HttpServletRequest request, Object requestBody) throws NotFoundException {

    AuthenticationRequest authenticationRequest = (AuthenticationRequest) requestBody;

    Set<ConstraintViolation<Object>> violations = validator.validate(authenticationRequest);
    if (violations.size() > 0) {
      ConstraintViolation<Object> violation = violations.iterator().next();
      throw new BadRequestException("{" + violation.getPropertyPath() + "} " + violation.getMessage());
    }

    Map user = authenticationCstmMapper.selectUserByLoginName(authenticationRequest.getLogin_name());

    if (user == null) {
      throw new UnauthenticatedException(
        localeMessage.bm("message.authority", "login.user.notExist")
      );
    }

    if (!StringUtils.equals((String) user.get("password"), DigestUtils.sha256Hex(authenticationRequest.getPassword()))) {
      throw new UnauthenticatedException(
        localeMessage.bm("message.authority", "login.password.mismatch")
      );
    }

    if (!"1".equals(user.get("status"))) {
      throw new UnauthenticatedException(
        localeMessage.bm("message.authority", "login.user.disabled")
      );
    }

    <%= h.changeCase.pascalCase(appName) %>AuthenticationObject authObj = null;
    String userType = (String) user.get("type");
    // supervisor
    if (StringUtils.equals("9", userType)) {
      List<Map> roles = new ArrayList<>();
      Map role = new HashMap();
      role.put("id", 0);
      role.put("code", "ROLE_SUPERVISOR");
      role.put("name", "超级用户");
      List<String> roleCodes = new ArrayList<>();
      roleCodes.add("ROLE_SUPERVISOR");
      TAuthResourceExample resourceExample = new TAuthResourceExample();
      List<TAuthResource> resources = resourceMapper.selectByExample(resourceExample);
      List<Map> resourcesMap = new ArrayList<>();
      resources.forEach(resource -> {
        Map resourceMap = new HashMap();
        resourceMap.put("id", resource.getId());
        resourceMap.put("verb", resource.getVerb());
        resourceMap.put("name", resource.getName());
        resourceMap.put("uri_pattern", resource.getUriPattern());
        resourceMap.put("remark", resource.getRemark());
        resourcesMap.add(resourceMap);
      });

      authObj = new <%= h.changeCase.pascalCase(appName) %>AuthenticationObject();
      authObj.setId((Integer) user.get("id"));
      authObj.setLogin_name((String) user.get("login_name"));
      authObj.setName((String) user.get("name"));
      authObj.setResources(resourcesMap);
      authObj.setRoles(roles);
      authObj.setAttributes(roleCodes);
      authObj.setType(userType);
    }
    // normal user
    else {
      List<Map> roles = authenticationCstmMapper.findActiveRolesByUserId((Integer) user.get("id"));
      List<Integer> roleIds = new ArrayList<>();
      List<String> roleCodes = new ArrayList<>();
      roles.forEach(role -> {
        roleIds.add((Integer) role.get("id"));
        roleCodes.add((String) role.get("code"));
      });
      List<Map> resources = null;
      if (roleIds.size() > 0) {
        resources = authenticationCstmMapper.findResourcesByRoleIds(roleIds);
      } else {
        resources = Collections.EMPTY_LIST;
      }
      authObj = new <%= h.changeCase.pascalCase(appName) %>AuthenticationObject();
      authObj.setId((Integer) user.get("id"));
      authObj.setLogin_name((String) user.get("login_name"));
      authObj.setName((String) user.get("name"));
      authObj.setResources(resources);
      authObj.setRoles(roles);
      authObj.setAttributes(roleCodes);
      authObj.setType(userType);
    }

    // update last access time and ip
    // retrieve remote ip
    String remoteIp = null;
    if (env.getProperty("auditLog.ip.header") != null) {
      remoteIp = request.getHeader(env.getProperty("auditLog.ip.header"));
    } else {
      remoteIp = request.getRemoteAddr();
    }

    TAuthUser userUptObj = new TAuthUser();
    userUptObj.setId((Integer) user.get("id"));
    userUptObj.setLastLoginIp(remoteIp);
    userUptObj.setLastLoginTime(new Date());
    userMapper.updateByPrimaryKeySelective(userUptObj);

    return authObj;

  }


  protected Class getReqBindingClass() {
    return AuthenticationRequest.class;
  }

  @Override
  protected void handle(HttpServletRequest request, HttpServletResponse response) {
    String content = HttpRequestHelper.retrieveRequestBodyAsString(request);
    Object requestBody = null;
    if (!org.springframework.util.StringUtils.isEmpty(content)) {
      try {
        requestBody = mapper.readValue(content, getReqBindingClass());
      } catch (Exception e) {
        throw new BadRequestException(e.getMessage(), e);
      }
    }

    Object result = handleJson(request, response, requestBody);

    response.setContentType("application/json;charset=UTF-8");
    try {
      response.getWriter().write(mapper.writeValueAsString(result));
    } catch (IOException e) {
      throw new InternalServerErrorException(e.getMessage(), e);
    }
  }


  protected Object handleJson(HttpServletRequest request, HttpServletResponse response, Object content) {

    AuthenticationObject authObj = authenticate(request, content);

    if (authObj == null) {
      throw new UnauthenticatedException(localeMessage.bm("message.auth", "authentication.error"));
    }

    AuthObjHolder.createSession(request, authObj);

    return authObj;

  }

  @Override
  public int getOrder() {
    return FilterOrders.AUTHENTICATE;
  }


  public static class AuthenticationRequest {

    @NotEmpty
    private String login_name;

    @NotEmpty
    private String password;

    public String getLogin_name() {
      return login_name;
    }

    public void setLogin_name(String login_name) {
      this.login_name = login_name;
    }

    public String getPassword() {
      return password;
    }

    public void setPassword(String password) {
      this.password = password;
    }
  }

}
