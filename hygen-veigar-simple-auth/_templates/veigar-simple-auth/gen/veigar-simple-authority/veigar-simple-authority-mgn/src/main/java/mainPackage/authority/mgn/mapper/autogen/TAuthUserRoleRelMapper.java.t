---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/autogen/TAuthUserRoleRelMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.autogen;

import <%= h.mgnPackage(h, locals) %>.model.TAuthUserRoleRelExample;
import <%= h.mgnPackage(h, locals) %>.model.TAuthUserRoleRelKey;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthUserRoleRelMapper")
public interface TAuthUserRoleRelMapper {
    long countByExample(TAuthUserRoleRelExample example);

    int deleteByExample(TAuthUserRoleRelExample example);

    int deleteByPrimaryKey(TAuthUserRoleRelKey key);

    int insert(TAuthUserRoleRelKey record);

    int insertSelective(TAuthUserRoleRelKey record);

    List<TAuthUserRoleRelKey> selectByExample(TAuthUserRoleRelExample example);

    int updateByExampleSelective(@Param("record") TAuthUserRoleRelKey record, @Param("example") TAuthUserRoleRelExample example);

    int updateByExample(@Param("record") TAuthUserRoleRelKey record, @Param("example") TAuthUserRoleRelExample example);
}
