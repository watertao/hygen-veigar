---
to: <%= h.sessionPomLocation(h, locals) %>/src/main/java/<%= h.sessionPackageDir(h, locals) %>/SecurityCstmMapper.java
---
package <%= h.sessionPackage(h, locals) %>;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("<%= h.sessionPackage(h, locals) %>.SecurityCstmMapper")
@Mapper
public interface SecurityCstmMapper {

  List<Map> findActiveRolesByResourceId(
    @Param("resourceId") Integer resourceId
  );

  List<Map> findFullResources();

}
