---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/mapper/custom/AuthenticationCstmMapper.java
---
package <%= h.authenticationDbPackage(h, locals) %>.mapper.custom;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("<%= h.authenticationDbPackage(h, locals) %>.AuthenticationCstmMapper")
@Mapper
public interface AuthenticationCstmMapper {
  
  Map selectUserByLoginName(
    @Param("loginName") String loginName
  );

  List<Map> findActiveRolesByUserId(Integer userId);


  List<Map> findResourcesByRoleIds(List<Integer> roleIds);

  Integer updateUserPassword(
    @Param("userId") Integer userId,
    @Param("originPassword") String originPassword,
    @Param("newPassword") String newPassword
  );

}
