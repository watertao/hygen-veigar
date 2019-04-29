---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/DbAuthenticationConfig.java
---
package <%= h.authenticationDbPackage(h, locals) %>;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class DbAuthenticationConfig {

  private static final String DB_AUTHENTICATION_FILTER_VERB_KEY = "auth.authentication.db.verb";
  private static final String BD_AUTHENTICATION_FILTER_URI_KEY = "auth.authentication.db.uri";
  private static final String DB_CREDENTIAL_UPT_FILTER_VERB_KEY = "auth.credentialUpdate.db.verb";
  private static final String BD_CREDENTIAL_UPT_FILTER_URI_KEY = "auth.credentialUpdate.db.uri";

  private static final String DEFAULT_DB_AUTHENTICATION_FILTER_VERB = "POST";
  private static final String DEFAULT_DB_AUTHENTICATION_FILTER_URI = "/system/session";
  private static final String DEFAULT_DB_CREDENTIAL_UPT_FILTER_VERB = "PUT";
  private static final String DEFAULT_DB_CREDENTIAL_UPT_FILTER_URI = "/system/session/credential";

  @Autowired
  private Environment env;

  @Bean
  public <%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter dbAuthenticationFilter() {
    String verb = env.getProperty(DB_AUTHENTICATION_FILTER_VERB_KEY, DEFAULT_DB_AUTHENTICATION_FILTER_VERB);
    String uri = env.getProperty(BD_AUTHENTICATION_FILTER_URI_KEY, DEFAULT_DB_AUTHENTICATION_FILTER_URI);

    <%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter filter = new <%= h.changeCase.pascalCase(appName) %>DbAuthenticationFilter();
    filter.setVerb(verb);
    filter.setUri(uri);
    return filter;
  }

  @Bean
  public <%= h.changeCase.pascalCase(appName) %>DbCredentialUpdateFilter dbCredentialUpdateFilter() {
    String verb = env.getProperty(DB_CREDENTIAL_UPT_FILTER_VERB_KEY, DEFAULT_DB_CREDENTIAL_UPT_FILTER_VERB);
    String uri = env.getProperty(BD_CREDENTIAL_UPT_FILTER_URI_KEY, DEFAULT_DB_CREDENTIAL_UPT_FILTER_URI);

    <%= h.changeCase.pascalCase(appName) %>DbCredentialUpdateFilter filter = new <%= h.changeCase.pascalCase(appName) %>DbCredentialUpdateFilter();
    filter.setVerb(verb);
    filter.setUri(uri);
    return filter;
  }

}
