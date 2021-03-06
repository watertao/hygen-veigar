---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/resources/mybatis/mapper/autogen/TAuthRoleResourceRelMapper.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthRoleResourceRelMapper">
  <resultMap id="BaseResultMap" type="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelKey">
    <id column="role_id" jdbcType="INTEGER" property="roleId" />
    <id column="resource_id" jdbcType="INTEGER" property="resourceId" />
  </resultMap>
  <sql id="Example_Where_Clause">
    <where>
      <foreach collection="oredCriteria" item="criteria" separator="or">
        <if test="criteria.valid">
          <trim prefix="(" prefixOverrides="and" suffix=")">
            <foreach collection="criteria.criteria" item="criterion">
              <choose>
                <when test="criterion.noValue">
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue">
                  and ${criterion.condition} #{criterion.value}
                </when>
                <when test="criterion.betweenValue">
                  and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                </when>
                <when test="criterion.listValue">
                  and ${criterion.condition}
                  <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                    #{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Update_By_Example_Where_Clause">
    <where>
      <foreach collection="example.oredCriteria" item="criteria" separator="or">
        <if test="criteria.valid">
          <trim prefix="(" prefixOverrides="and" suffix=")">
            <foreach collection="criteria.criteria" item="criterion">
              <choose>
                <when test="criterion.noValue">
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue">
                  and ${criterion.condition} #{criterion.value}
                </when>
                <when test="criterion.betweenValue">
                  and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                </when>
                <when test="criterion.listValue">
                  and ${criterion.condition}
                  <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                    #{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Base_Column_List">
    role_id, resource_id
  </sql>
  <select id="selectByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelExample" resultMap="BaseResultMap">
    select
    <if test="distinct">
      distinct
    </if>
    <include refid="Base_Column_List" />
    from t_auth_role_resource_rel
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null">
      order by ${orderByClause}
    </if>
  </select>
  <delete id="deleteByPrimaryKey" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelKey">
    delete from t_auth_role_resource_rel
    where role_id = #{roleId,jdbcType=INTEGER}
      and resource_id = #{resourceId,jdbcType=INTEGER}
  </delete>
  <delete id="deleteByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelExample">
    delete from t_auth_role_resource_rel
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelKey">
    insert into t_auth_role_resource_rel (role_id, resource_id)
    values (#{roleId,jdbcType=INTEGER}, #{resourceId,jdbcType=INTEGER})
  </insert>
  <insert id="insertSelective" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelKey">
    insert into t_auth_role_resource_rel
    <trim prefix="(" suffix=")" suffixOverrides=",">
      <if test="roleId != null">
        role_id,
      </if>
      <if test="resourceId != null">
        resource_id,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
      <if test="roleId != null">
        #{roleId,jdbcType=INTEGER},
      </if>
      <if test="resourceId != null">
        #{resourceId,jdbcType=INTEGER},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleResourceRelExample" resultType="java.lang.Long">
    select count(*) from t_auth_role_resource_rel
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map">
    update t_auth_role_resource_rel
    <set>
      <if test="record.roleId != null">
        role_id = #{record.roleId,jdbcType=INTEGER},
      </if>
      <if test="record.resourceId != null">
        resource_id = #{record.resourceId,jdbcType=INTEGER},
      </if>
    </set>
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map">
    update t_auth_role_resource_rel
    set role_id = #{record.roleId,jdbcType=INTEGER},
      resource_id = #{record.resourceId,jdbcType=INTEGER}
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
</mapper>