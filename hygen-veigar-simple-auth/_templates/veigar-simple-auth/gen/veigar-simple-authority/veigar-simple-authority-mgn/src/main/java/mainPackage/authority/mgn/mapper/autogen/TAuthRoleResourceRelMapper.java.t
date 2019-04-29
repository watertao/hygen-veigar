---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/autogen/TAuthRoleResourceRelMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.autogen;

import <%= h.mgnPackage(h, locals) %>.model.TAuthRoleResourceRelExample;
import <%= h.mgnPackage(h, locals) %>.model.TAuthRoleResourceRelKey;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthRoleResourceRelMapper")
public interface TAuthRoleResourceRelMapper {
    long countByExample(TAuthRoleResourceRelExample example);

    int deleteByExample(TAuthRoleResourceRelExample example);

    int deleteByPrimaryKey(TAuthRoleResourceRelKey key);

    int insert(TAuthRoleResourceRelKey record);

    int insertSelective(TAuthRoleResourceRelKey record);

    List<TAuthRoleResourceRelKey> selectByExample(TAuthRoleResourceRelExample example);

    int updateByExampleSelective(@Param("record") TAuthRoleResourceRelKey record, @Param("example") TAuthRoleResourceRelExample example);

    int updateByExample(@Param("record") TAuthRoleResourceRelKey record, @Param("example") TAuthRoleResourceRelExample example);
}
