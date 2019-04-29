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

  <properties>
    <java.version>1.8</java.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <veigar.version>2.2.0-SNAPSHOT</veigar.version>
    <commonsLang3.version>3.8.1</commonsLang3.version>
    <commonsCodec.version>1.11</commonsCodec.version>
<% if(database == 'yes'){ -%>
    <mysqlConnector.version>5.1.47</mysqlConnector.version>
<% } -%>

  </properties>

  <dependencies>
    <dependency>
      <groupId>io.github.watertao</groupId>
      <artifactId>veigar-core</artifactId>
      <version>${veigar.version}</version>
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
<% if(database == 'yes'){ -%>
    <dependency>
      <groupId>io.github.watertao</groupId>
      <artifactId>veigar-db</artifactId>
      <version>${veigar.version}</version>
    </dependency>
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>${mysqlConnector.version}</version>
    </dependency>
<% } -%>
  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
        <executions>
          <execution>
            <id>repackage</id>
            <goals>
              <goal>repackage</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <mainClass>${start-class}</mainClass>
        </configuration>
      </plugin>
<% if(database == 'yes'){ -%>
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
<% } -%>
    </plugins>
  </build>

</project>
