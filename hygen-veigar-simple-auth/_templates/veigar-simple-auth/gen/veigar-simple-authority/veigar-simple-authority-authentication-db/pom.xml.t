---
to: <%= h.authenticationDbPomLocation(h, locals) %>/pom.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <parent>
    <groupId><%= groupId %></groupId>
    <artifactId><%= h.mainPomName(h, locals) %></artifactId>
    <version><%= version %></version>
  </parent>

  <artifactId><%= h.authenticationDbPomName(h, locals) %></artifactId>
  
  <dependencies>
    <dependency>
      <groupId><%= groupId%></groupId>
      <artifactId><%= h.sessionPomName(h, locals) %></artifactId>
    </dependency>
    <dependency>
      <groupId>io.github.watertao</groupId>
      <artifactId>veigar-auth</artifactId>
    </dependency>
    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-lang3</artifactId>
    </dependency>
    <dependency>
      <groupId>commons-codec</groupId>
      <artifactId>commons-codec</artifactId>
    </dependency>
  </dependencies>

</project>
