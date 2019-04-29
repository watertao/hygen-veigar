---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/autogen/TAuthRoleMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.autogen;

import <%= h.mgnPackage(h, locals) %>.model.TAuthRole;
import <%= h.mgnPackage(h, locals) %>.model.TAuthRoleExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthRoleMapper")
public interface TAuthRoleMapper {
    long countByExample(TAuthRoleExample example);

    int deleteByExample(TAuthRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TAuthRole record);

    int insertSelective(TAuthRole record);

    List<TAuthRole> selectByExample(TAuthRoleExample example);

    TAuthRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TAuthRole record, @Param("example") TAuthRoleExample example);

    int updateByExample(@Param("record") TAuthRole record, @Param("example") TAuthRoleExample example);

    int updateByPrimaryKeySelective(TAuthRole record);

    int updateByPrimaryKey(TAuthRole record);
}
