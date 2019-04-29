---
to: <%= h.sessionPomLocation(h, locals) %>/src/main/resources/mybatis/mapper/custom/SecurityCstmMapper.xml
---
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="<%= h.sessionPackage(h, locals) %>.SecurityCstmMapper" >

  <select id="findFullResources" resultType="java.util.HashMap">
    <![CDATA[

      SELECT
        r.id id,
        r.verb verb,
        r.uri_pattern uri_pattern,
        r.name name,
        r.remark remark
      FROM t_auth_resource r

    ]]>
  </select>

  <select id="findActiveRolesByResourceId" resultType="java.util.HashMap">
    <![CDATA[

      SELECT
        r.id id,
        r.code code,
        r.name name,
        r.remark remark,
        r.status status
      FROM t_auth_role r
      INNER JOIN t_auth_role_resource_rel rrr on r.id = rrr.role_id
      WHERE
        rrr.resource_id = #{resourceId}

    ]]>
  </select>

</mapper>
