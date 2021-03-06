---
to: <%= h.mgnPomLocation(h, locals) %>/pom.xml
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

  <artifactId><%= h.mgnPomName(h, locals) %></artifactId>
  
  <dependencies>
    <dependency>
      <groupId><%= groupId %></groupId>
      <artifactId><%= h.sessionPomName(h, locals) %></artifactId>
    </dependency>
    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-lang3</artifactId>
    </dependency>
    <dependency>
      <groupId>commons-codec</groupId>
      <artifactId>commons-codec</artifactId>
    </dependency>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <version>2.1.1.RELEASE</version>
    </dependency>
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>5.1.47</version>
      <scope>test</scope>
    </dependency>
  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.mybatis.generator</groupId>
        <artifactId>mybatis-generator-maven-plugin</artifactId>
        <version>1.3.7</version>
        <configuration>
          <configurationFile>mbg/generatorConfig.xml</configurationFile>
        </configuration>
        <dependencies>
          <dependency>
            <groupId>io.github.watertao</groupId>
            <artifactId>veigar-mbg-plugin</artifactId>
            <version>2.1.1</version>
          </dependency>
        </dependencies>
      </plugin>

    </plugins>
  </build>

</project>
