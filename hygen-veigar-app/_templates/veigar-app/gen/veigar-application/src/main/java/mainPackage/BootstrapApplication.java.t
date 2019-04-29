---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/BootstrapApplication.java
---
package <%= h.mainPackage(h, locals) %>;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(
  scanBasePackages={
    "<%= groupId %>",
    "io.github.watertao.veigar"
  }
)
public class BootstrapApplication {
  public static void main(String[] args) {
    SpringApplication.run(BootstrapApplication.class, args);
  }
}
