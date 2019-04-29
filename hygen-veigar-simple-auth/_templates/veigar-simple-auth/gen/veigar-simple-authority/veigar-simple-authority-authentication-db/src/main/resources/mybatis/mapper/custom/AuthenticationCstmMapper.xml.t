---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/resources/mybatis/mapper/custom/AuthenticationCstmMapper.xml
---
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="<%= h.authenticationDbPackage(h, locals) %>.AuthenticationCstmMapper" >

  <select id="selectUserByLoginName" resultType="java.util.HashMap">
    <![CDATA[

      SELECT
        u.id id,
        u.login_name,
        u.name name,
        u.status status,
        u.password password,
        u.type type
      FROM t_auth_user u
      WHERE
        u.login_name = #{loginName}

    ]]>
  </select>

  <select id="findActiveRolesByUserId" resultType="java.util.HashMap">
    <![CDATA[

      SELECT
        r.id id,
        r.code code,
        r.name name,
        r.remark remark
      FROM t_auth_role r
      INNER JOIN t_auth_user_role_rel urr ON r.id = urr.role_id
      WHERE
        urr.user_id = #{userId} AND
        r.status = '1'

    ]]>
  </select>

  <select id="findResourcesByRoleIds" resultType="java.util.HashMap">
    <![CDATA[

      SELECT
      DISTINCT
        r.id id,
        r.verb verb,
        r.uri_pattern uri_pattern,
        r.name name,
        r.remark remark
      FROM t_auth_resource r
      INNER JOIN t_auth_role_resource_rel rrr ON rrr.resource_id = r.id
      WHERE
        rrr.role_id IN

    ]]>

    <foreach item="roleId" index="index" collection="list"
             open="(" separator="," close=")">
    <![CDATA[

      #{roleId}

    ]]>
    </foreach>

  </select>

  <update id="updateUserPassword">
    <![CDATA[

      UPDATE
        t_auth_user r
      SET
        r.password = #{newPassword}
      WHERE
        r.password = #{originPassword} AND
        r.id = #{userId}

      ]]>
  </update>

</mapper>
