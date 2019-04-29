---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/autogen/TAuthUserMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.autogen;

import java.util.List;
import <%= h.mgnPackage(h, locals) %>.model.TAuthUser;
import <%= h.mgnPackage(h, locals) %>.model.TAuthUserExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthUserMapper")
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