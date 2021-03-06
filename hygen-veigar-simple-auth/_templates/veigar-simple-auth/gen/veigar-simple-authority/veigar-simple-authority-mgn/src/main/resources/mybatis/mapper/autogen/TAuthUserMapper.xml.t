---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/resources/mybatis/mapper/autogen/TAuthUserMapper.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthUserMapper">
  <resultMap id="BaseResultMap" type="io.github.watertao.veigar.vsa.mgn.model.TAuthUser">
    <id column="id" jdbcType="INTEGER" property="id" />
    <result column="employee_no" jdbcType="VARCHAR" property="employeeNo" />
    <result column="name" jdbcType="VARCHAR" property="name" />
    <result column="status" jdbcType="VARCHAR" property="status" />
    <result column="password" jdbcType="VARCHAR" property="password" />
    <result column="remark" jdbcType="VARCHAR" property="remark" />
    <result column="last_login_ip" jdbcType="VARCHAR" property="lastLoginIp" />
    <result column="last_login_time" jdbcType="TIMESTAMP" property="lastLoginTime" />
    <result column="create_time" jdbcType="TIMESTAMP" property="createTime" />
    <result column="update_time" jdbcType="TIMESTAMP" property="updateTime" />
    <result column="dep_id" jdbcType="INTEGER" property="depId" />
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
    id, employee_no, name, status, password, remark, last_login_ip, last_login_time, 
    create_time, update_time, dep_id
  </sql>
  <select id="selectByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUserExample" resultMap="BaseResultMap">
    select
    <if test="distinct">
      distinct
    </if>
    <include refid="Base_Column_List" />
    from t_auth_user
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
    from t_auth_user
    where id = #{id,jdbcType=INTEGER}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
    delete from t_auth_user
    where id = #{id,jdbcType=INTEGER}
  </delete>
  <delete id="deleteByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUserExample">
    delete from t_auth_user
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUser">
    <selectKey keyProperty="id" order="AFTER" resultType="java.lang.Integer">
      SELECT LAST_INSERT_ID()
    </selectKey>
    insert into t_auth_user (employee_no, name, status, 
      password, remark, last_login_ip, 
      last_login_time, create_time, update_time, 
      dep_id)
    values (#{employeeNo,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR}, 
      #{password,jdbcType=VARCHAR}, #{remark,jdbcType=VARCHAR}, #{lastLoginIp,jdbcType=VARCHAR}, 
      #{lastLoginTime,jdbcType=TIMESTAMP}, #{createTime,jdbcType=TIMESTAMP}, #{updateTime,jdbcType=TIMESTAMP}, 
      #{depId,jdbcType=INTEGER})
  </insert>
  <insert id="insertSelective" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUser">
    <selectKey keyProperty="id" order="AFTER" resultType="java.lang.Integer">
      SELECT LAST_INSERT_ID()
    </selectKey>
    insert into t_auth_user
    <trim prefix="(" suffix=")" suffixOverrides=",">
      <if test="employeeNo != null">
        employee_no,
      </if>
      <if test="name != null">
        name,
      </if>
      <if test="status != null">
        status,
      </if>
      <if test="password != null">
        password,
      </if>
      <if test="remark != null">
        remark,
      </if>
      <if test="lastLoginIp != null">
        last_login_ip,
      </if>
      <if test="lastLoginTime != null">
        last_login_time,
      </if>
      <if test="createTime != null">
        create_time,
      </if>
      <if test="updateTime != null">
        update_time,
      </if>
      <if test="depId != null">
        dep_id,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides=",">
      <if test="employeeNo != null">
        #{employeeNo,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        #{name,jdbcType=VARCHAR},
      </if>
      <if test="status != null">
        #{status,jdbcType=VARCHAR},
      </if>
      <if test="password != null">
        #{password,jdbcType=VARCHAR},
      </if>
      <if test="remark != null">
        #{remark,jdbcType=VARCHAR},
      </if>
      <if test="lastLoginIp != null">
        #{lastLoginIp,jdbcType=VARCHAR},
      </if>
      <if test="lastLoginTime != null">
        #{lastLoginTime,jdbcType=TIMESTAMP},
      </if>
      <if test="createTime != null">
        #{createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="updateTime != null">
        #{updateTime,jdbcType=TIMESTAMP},
      </if>
      <if test="depId != null">
        #{depId,jdbcType=INTEGER},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUserExample" resultType="java.lang.Long">
    select count(*) from t_auth_user
    <if test="_parameter != null">
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map">
    update t_auth_user
    <set>
      <if test="record.id != null">
        id = #{record.id,jdbcType=INTEGER},
      </if>
      <if test="record.employeeNo != null">
        employee_no = #{record.employeeNo,jdbcType=VARCHAR},
      </if>
      <if test="record.name != null">
        name = #{record.name,jdbcType=VARCHAR},
      </if>
      <if test="record.status != null">
        status = #{record.status,jdbcType=VARCHAR},
      </if>
      <if test="record.password != null">
        password = #{record.password,jdbcType=VARCHAR},
      </if>
      <if test="record.remark != null">
        remark = #{record.remark,jdbcType=VARCHAR},
      </if>
      <if test="record.lastLoginIp != null">
        last_login_ip = #{record.lastLoginIp,jdbcType=VARCHAR},
      </if>
      <if test="record.lastLoginTime != null">
        last_login_time = #{record.lastLoginTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.createTime != null">
        create_time = #{record.createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.updateTime != null">
        update_time = #{record.updateTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.depId != null">
        dep_id = #{record.depId,jdbcType=INTEGER},
      </if>
    </set>
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map">
    update t_auth_user
    set id = #{record.id,jdbcType=INTEGER},
      employee_no = #{record.employeeNo,jdbcType=VARCHAR},
      name = #{record.name,jdbcType=VARCHAR},
      status = #{record.status,jdbcType=VARCHAR},
      password = #{record.password,jdbcType=VARCHAR},
      remark = #{record.remark,jdbcType=VARCHAR},
      last_login_ip = #{record.lastLoginIp,jdbcType=VARCHAR},
      last_login_time = #{record.lastLoginTime,jdbcType=TIMESTAMP},
      create_time = #{record.createTime,jdbcType=TIMESTAMP},
      update_time = #{record.updateTime,jdbcType=TIMESTAMP},
      dep_id = #{record.depId,jdbcType=INTEGER}
    <if test="_parameter != null">
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUser">
    update t_auth_user
    <set>
      <if test="employeeNo != null">
        employee_no = #{employeeNo,jdbcType=VARCHAR},
      </if>
      <if test="name != null">
        name = #{name,jdbcType=VARCHAR},
      </if>
      <if test="status != null">
        status = #{status,jdbcType=VARCHAR},
      </if>
      <if test="password != null">
        password = #{password,jdbcType=VARCHAR},
      </if>
      <if test="remark != null">
        remark = #{remark,jdbcType=VARCHAR},
      </if>
      <if test="lastLoginIp != null">
        last_login_ip = #{lastLoginIp,jdbcType=VARCHAR},
      </if>
      <if test="lastLoginTime != null">
        last_login_time = #{lastLoginTime,jdbcType=TIMESTAMP},
      </if>
      <if test="createTime != null">
        create_time = #{createTime,jdbcType=TIMESTAMP},
      </if>
      <if test="updateTime != null">
        update_time = #{updateTime,jdbcType=TIMESTAMP},
      </if>
      <if test="depId != null">
        dep_id = #{depId,jdbcType=INTEGER},
      </if>
    </set>
    where id = #{id,jdbcType=INTEGER}
  </update>
  <update id="updateByPrimaryKey" parameterType="io.github.watertao.veigar.vsa.mgn.model.TAuthUser">
    update t_auth_user
    set employee_no = #{employeeNo,jdbcType=VARCHAR},
      name = #{name,jdbcType=VARCHAR},
      status = #{status,jdbcType=VARCHAR},
      password = #{password,jdbcType=VARCHAR},
      remark = #{remark,jdbcType=VARCHAR},
      last_login_ip = #{lastLoginIp,jdbcType=VARCHAR},
      last_login_time = #{lastLoginTime,jdbcType=TIMESTAMP},
      create_time = #{createTime,jdbcType=TIMESTAMP},
      update_time = #{updateTime,jdbcType=TIMESTAMP},
      dep_id = #{depId,jdbcType=INTEGER}
    where id = #{id,jdbcType=INTEGER}
  </update>
</mapper>