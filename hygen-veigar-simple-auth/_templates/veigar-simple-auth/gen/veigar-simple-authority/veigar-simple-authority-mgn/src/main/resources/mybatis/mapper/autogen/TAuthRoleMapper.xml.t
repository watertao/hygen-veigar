---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/resources/mybatis/mapper/autogen/TAuthRRoleMapper.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthRoleMapper">
  <resultMap id="BaseResultMap" type="io.github.watertao.veigar.vsa.mgn.model.TAuthRole">
    <id column="id" jdbcType="INTEGER" property="id" />
    <result column="code" jdbcType="VARCHAR" property="code" />
    <result column="name" jdbcType="VARCHAR" property="name" />
    <result column="level" jdbcType="INTEGER" property="level" />
    <result column="status" jdbcType="VARCHAR" property="status" />
    <result column="remark" jdbcType="VARCHAR" property="remark" />
    <result column="create_time" jdbcType="TIMESTAMP" property="createTime" />
    <result column="update_time" jdbcType="TIMESTAMP" property="updateTime" />
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
    id, code, name, level, status, remark, create_time, update_time
  </sql>
  <select id="selectByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleExample" resultMap="BaseResultMap">
    select
    <if test="distinct">
      distinct
    </if>
    <include refid="Base_Column_List" />
    from t_auth_role
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null">
      order by ${orderByClause}
    </if>
  </select>
  <select id="selectByPrimaryKey" parameterType="java.lang.Integer" resultMap="BaseResultMap">
    select 
    <include refid="Base_Column_List" />
    from t_auth_role
    where id = #{id,jdbcType=INTEGER}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
    delete from t_auth_role
    where id = #{id,jdbcType=INTEGER}
  </delete>
  <delete id="deleteByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleExample">
    delete from t_auth_role
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRole">
    <selectKey keyProperty="id" order="AFTER" resultType="java.lang.Integer">
      SELECT LAST_INSERT_ID()
    </selectKey>
    insert into t_auth_role (code, name, level, 
      status, remark, create_time, 
      update_time)
    values (#{code,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, #{level,jdbcType=INTEGER}, 
      #{status,jdbcType=VARCHAR}, #{remark,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, 
      #{updateTime,jdbcType=TIMESTAMP})
  </insert>
  <insert id="insertSelective" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRole">
    <selectKey keyProperty="id" order="AFTER" resultType="java.lang.Integer">
      SELECT LAST_INSERT_ID()
    </selectKey>
    insert into t_auth_role
    <trim prefix="(" suffix=")" suffixOverrides=",">
      <if test="code != null">
        code,
      </if>
      <if test="name != null">
        name,
      </if>
      <if test="level != null">
        level,
      </if>
      <if test="status != null">
        status,
      </if>
      <if test="remark != null">
        remark,
      </if>
      <if test="createTime != null">
        create_time,
      </if>
      <if test="updateTime != null">
        update_time,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
      <if test="code != null">
        #{code,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        #{name,jdbcType=VARCHAR},
      </if>
      <if test="level != null">
        #{level,jdbcType=INTEGER},
      </if>
      <if test="status != null">
        #{status,jdbcType=VARCHAR},
      </if>
      <if test="remark != null">
        #{remark,jdbcType=VARCHAR},
      </if>
      <if test="createTime != null">
        #{createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="updateTime != null">
        #{updateTime,jdbcType=TIMESTAMP},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRoleExample" resultType="java.lang.Long">
    select count(*) from t_auth_role
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map">
    update t_auth_role
    <set>
      <if test="record.id != null">
        id = #{record.id,jdbcType=INTEGER},
      </if>
      <if test="record.code != null">
        code = #{record.code,jdbcType=VARCHAR},
      </if>
      <if test="record.name != null">
        name = #{record.name,jdbcType=VARCHAR},
      </if>
      <if test="record.level != null">
        level = #{record.level,jdbcType=INTEGER},
      </if>
      <if test="record.status != null">
        status = #{record.status,jdbcType=VARCHAR},
      </if>
      <if test="record.remark != null">
        remark = #{record.remark,jdbcType=VARCHAR},
      </if>
      <if test="record.createTime != null">
        create_time = #{record.createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.updateTime != null">
        update_time = #{record.updateTime,jdbcType=TIMESTAMP},
      </if>
    </set>
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map">
    update t_auth_role
    set id = #{record.id,jdbcType=INTEGER},
      code = #{record.code,jdbcType=VARCHAR},
      name = #{record.name,jdbcType=VARCHAR},
      level = #{record.level,jdbcType=INTEGER},
      status = #{record.status,jdbcType=VARCHAR},
      remark = #{record.remark,jdbcType=VARCHAR},
      create_time = #{record.createTime,jdbcType=TIMESTAMP},
      update_time = #{record.updateTime,jdbcType=TIMESTAMP}
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRole">
    update t_auth_role
    <set>
      <if test="code != null">
        code = #{code,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        name = #{name,jdbcType=VARCHAR},
      </if>
      <if test="level != null">
        level = #{level,jdbcType=INTEGER},
      </if>
      <if test="status != null">
        status = #{status,jdbcType=VARCHAR},
      </if>
      <if test="remark != null">
        remark = #{remark,jdbcType=VARCHAR},
      </if>
      <if test="createTime != null">
        create_time = #{createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="updateTime != null">
        update_time = #{updateTime,jdbcType=TIMESTAMP},
      </if>
    </set>
    where id = #{id,jdbcType=INTEGER}
  </update>
  <update id="updateByPrimaryKey" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthRole">
    update t_auth_role
    set code = #{code,jdbcType=VARCHAR},
      name = #{name,jdbcType=VARCHAR},
      level = #{level,jdbcType=INTEGER},
      status = #{status,jdbcType=VARCHAR},
      remark = #{remark,jdbcType=VARCHAR},
      create_time = #{createTime,jdbcType=TIMESTAMP},
      update_time = #{updateTime,jdbcType=TIMESTAMP}
    where id = #{id,jdbcType=INTEGER}
  </update>
</mapper>