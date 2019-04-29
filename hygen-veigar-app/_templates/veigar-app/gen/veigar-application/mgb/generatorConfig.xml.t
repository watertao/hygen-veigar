---
to: "<%= (database == 'yes' ? (h.mainPomLocation(h, locals) + '/mgb/generatorConfig.xml') : null) %>"
---
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
  PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
  "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
  <properties resource="application.properties" ></properties>
  <classPathEntry location="/Users/watertao/.m2/repository/mysql/mysql-connector-java/5.1.47/mysql-connector-java-5.1.47.jar" />
  <context id="mbgTables" targetRuntime="MyBatis3">
    <plugin type="org.mybatis.generator.plugins.MapperAnnotationPlugin"></plugin>
    <plugin type="io.github.watertao.veigar.mbgplugin.ComponentAnnotationPlugin"></plugin>
    <commentGenerator>
      <property name="suppressAllComments" value="true"/>
    </commentGenerator>
    <jdbcConnection driverClass="${spring.datasource.driverClassName}"
                    connectionURL="${spring.datasource.url}"
                    userId="${spring.datasource.username}"
                    password="${spring.datasource.password}">
    </jdbcConnection>
    <javaTypeResolver>
      <property name="forceBigDecimals" value="false"/>
    </javaTypeResolver>
    <javaModelGenerator targetPackage="${app.basePackage}.model" targetProject="mbg/output/">
      <property name="enableSubPackages" value="true"/>
      <property name="trimStrings" value="true"/>
    </javaModelGenerator>
    <sqlMapGenerator targetPackage="mapper" targetProject="mbg/output/">
      <property name="enableSubPackages" value="true"/>
    </sqlMapGenerator>
    <javaClientGenerator type="XMLMAPPER" targetPackage="${app.basePackage}.mapper.autogen" targetProject="mbg/output/">
      <property name="enableSubPackages" value="true"/>
    </javaClientGenerator>
    <table schema="myschema" tableName="t_test" enableSelectByExample="true" enableDeleteByExample="true"
           enableCountByExample="true" enableUpdateByExample="true">
      <generatedKey sqlStatement="Mysql" column="id" identity="true"></generatedKey>
    </table>
  </context>
</generatorConfiguration>
