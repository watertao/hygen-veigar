---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/mapper/custom/RoleCstmMapper.java
---
package <%= h.mgnPackage(h, locals) %>.mapper.custom;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("<%= h.mgnPackage(h, locals) %>.mapper.custom.RoleCstmMapper")
@Mapper
public interface RoleCstmMapper {

  List<Map> findResourcesByRoleIds(List<Integer> roleIds);

}
