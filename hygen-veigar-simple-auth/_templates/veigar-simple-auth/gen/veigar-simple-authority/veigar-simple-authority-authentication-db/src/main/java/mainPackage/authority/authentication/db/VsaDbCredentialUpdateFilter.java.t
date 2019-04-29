---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/<%= h.changeCase.pascalCase(appName) %>DbCredentialUpdateFilter.java
---
package <%= h.authenticationDbPackage(h, locals) %>;

import <%= h.sessionPackage(h, locals) %>.<%= h.changeCase.pascalCase(appName) %>AuthenticationObject;
import <%= h.authenticationDbPackage(h, locals) %>.mapper.custom.AuthenticationCstmMapper;
import io.github.watertao.veigar.core.exception.UnauthenticatedException;
import io.github.watertao.veigar.core.message.LocaleMessage;
import io.github.watertao.veigar.auth.filter.CredentialUpdateFilter;
import io.github.watertao.veigar.core.exception.BadRequestException;
import io.github.watertao.veigar.core.exception.ConflictException;
import io.github.watertao.veigar.session.spi.AuthenticationObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.validator.HibernateValidator;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

/**
 * Request Json Sample:
 * -----------------------------------------------------------
 * {
 *     "origin_password": "111111",
 *     "new_password": "888888"
 * }
 * -----------------------------------------------------------
 *
 */
public class <%= h.changeCase.pascalCase(appName) %>DbCredentialUpdateFilter extends CredentialUpdateFilter {

  @Autowired
  private AuthenticationCstmMapper authenticationCstmMapper;

  @Autowired
  private LocaleMessage localeMessage;

  private static final Validator validator = Validation
    .byProvider(HibernateValidator.class).configure().failFast(true).buildValidatorFactory().getValidator();


  @Override
  protected void updateCredential(AuthenticationObject authObj, Object requestBody) {

    CredentialUpdateRequest credentialUpdateRequest = (CredentialUpdateRequest) requestBody;

    Set<ConstraintViolation<Object>> violations = validator.validate(credentialUpdateRequest);
    if (violations.size() > 0) {
      ConstraintViolation<Object> violation = violations.iterator().next();
      throw new BadRequestException("{" + violation.getPropertyPath() + "} " + violation.getMessage());
    }

    <%= h.changeCase.pascalCase(appName) %>AuthenticationObject <%= appName%>AuthenticationObject = (<%= h.changeCase.pascalCase(appName) %>AuthenticationObject) authObj;

    if (<%= appName%>AuthenticationObject == null) {
      throw new UnauthenticatedException(
        localeMessage.bm("message.session", "session.notExist")
      );
    }


    String originPasswordSHA256Hex = DigestUtils.sha256Hex(credentialUpdateRequest.getOrigin_password());
    String newPasswordSha256Hex = DigestUtils.sha256Hex(credentialUpdateRequest.getNew_password());

    int result = authenticationCstmMapper.updateUserPassword(
      <%= appName%>AuthenticationObject.getId(),
      originPasswordSHA256Hex,
      newPasswordSha256Hex
    );

    if (result <= 0) {
      throw new ConflictException("原密码错误");
    }
  }

  @Override
  protected Class getReqBindingClass() {
    return CredentialUpdateRequest.class;
  }


  public static class CredentialUpdateRequest {

    @NotEmpty
    private String origin_password;

    @NotEmpty
    private String new_password;

    public String getOrigin_password() {
      return origin_password;
    }

    public void setOrigin_password(String origin_password) {
      this.origin_password = origin_password;
    }

    public String getNew_password() {
      return new_password;
    }

    public void setNew_password(String new_password) {
      this.new_password = new_password;
    }
  }

}
