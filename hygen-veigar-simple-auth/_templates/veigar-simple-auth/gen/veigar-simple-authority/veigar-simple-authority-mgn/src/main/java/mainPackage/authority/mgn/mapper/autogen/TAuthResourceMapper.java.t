---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/autogen/TAuthResourceMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.autogen;

import <%= h.mgnPackage(h, locals) %>.model.TAuthResource;
import <%= h.mgnPackage(h, locals) %>.model.TAuthResourceExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("<%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthResourceMapper")
public interface TAuthResourceMapper {
    long countByExample(TAuthResourceExample example);

    int deleteByExample(TAuthResourceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TAuthResource record);

    int insertSelective(TAuthResource record);

    List<TAuthResource> selectByExample(TAuthResourceExample example);

    TAuthResource selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TAuthResource record, @Param("example") TAuthResourceExample example);

    int updateByExample(@Param("record") TAuthResource record, @Param("example") TAuthResourceExample example);

    int updateByPrimaryKeySelective(TAuthResource record);

    int updateByPrimaryKey(TAuthResource record);
}
