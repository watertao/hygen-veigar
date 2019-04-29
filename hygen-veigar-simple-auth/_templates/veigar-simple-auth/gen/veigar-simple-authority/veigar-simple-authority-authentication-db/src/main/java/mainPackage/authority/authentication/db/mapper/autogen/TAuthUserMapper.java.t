---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/mapper/autogen/TAuthUserMapper.java
---
package <%= h.authenticationDbPackage(h, locals) %>.mapper.autogen;

import <%= h.authenticationDbPackage(h, locals) %>.model.TAuthUser;
import <%= h.authenticationDbPackage(h, locals) %>.model.TAuthUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.authenticationDbPackage(h, locals) %>.mapper.autogen.TAuthUserMapper")
public interface TAuthUserMapper {
    long countByExample(TAuthUserExample example);

    int deleteByExample(TAuthUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TAuthUser record);

    int insertSelective(TAuthUser record);

    List<TAuthUser> selectByExample(TAuthUserExample example);

    TAuthUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TAuthUser record, @Param("example") TAuthUserExample example);

    int updateByExample(@Param("record") TAuthUser record, @Param("example") TAuthUserExample example);

    int updateByPrimaryKeySelective(TAuthUser record);

    int updateByPrimaryKey(TAuthUser record);
}