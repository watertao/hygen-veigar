---
to: <%= h.mainPomLocation(h, locals) %>/pom.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <groupId><%= groupId %></groupId>
  <artifactId><%= h.mainPomName(h, locals) %></artifactId>
  <version><%= version %></version>

  <packaging>pom</packaging>

  <properties>
    <java.version>1.8</java.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <veigar.version>2.1.1</veigar.version>
    <project.version><%= version %></project.version>
    <commonsLang3.version>3.8.1</commonsLang3.version>
    <commonsCodec.version>1.11</commonsCodec.version>
  </properties>

  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-session</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-audit-log</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-core</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-auth</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-session-redis</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId>io.github.watertao</groupId>
        <artifactId>veigar-db</artifactId>
        <version>${veigar.version}</version>
      </dependency>
      <dependency>
        <groupId><%= groupId %></groupId>
        <artifactId><%= h.authenticationDbPomName(h, locals) %></artifactId>
        <version>${project.version}</version>
      </dependency>
      <dependency>
        <groupId><%= groupId %></groupId>
        <artifactId><%= h.mgnPomName(h, locals) %></artifactId>
        <version>${project.version}</version>
      </dependency>
      <dependency>
        <groupId><%= groupId %></groupId>
        <artifactId><%= h.sessionPomName(h, locals) %></artifactId>
        <version>${project.version}</version>
      </dependency>
      <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>${commonsLang3.version}</version>
      </dependency>
      <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>${commonsLang3.version}</version>
      </dependency>
      <dependency>
        <groupId>commons-codec</groupId>
        <artifactId>commons-codec</artifactId>
        <version>${commonsCodec.version}</version>
      </dependency>
    </dependencies>
  </dependencyManagement>

  <modules>
    <module><%= h.sessionPomName(h, locals) %></module>
    <module><%= h.authenticationDbPomName(h, locals) %></module>
    <module><%= h.mgnPomName(h, locals) %></module>
  </modules>

</project>
