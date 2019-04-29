---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/user/controller/UserController.java
---
package <%= h.mgnPackage(h, locals) %>.api.user.controller;

import <%= h.mgnPackage(h, locals) %>.api.user.payload.UserCreateReq;
import <%= h.mgnPackage(h, locals) %>.api.user.payload.UserRes;
import <%= h.mgnPackage(h, locals) %>.api.user.payload.UserUpdateReq;
import <%= h.mgnPackage(h, locals) %>.service.user.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;

@RestController
@RequestMapping("/auth/users")
public class UserController {


  @Autowired
  private UserService userService;


  @GetMapping("/{userId}")
  public UserRes getUser(
    @PathVariable Integer userId
  ) {

    UserResult userResult = userService.selectUserById(userId);

    UserRes userRes = makeUserResponse(userResult);

    return userRes;

  }


  @GetMapping
  public List<UserRes> findUsers(
    @RequestParam(value = "name", required = false) String name,
    @RequestParam(value = "login_name", required = false) String loginName,
    @RequestParam(value = "status", required = false) String status,
    @RequestParam(value = "last_cursor", required = false) Integer lastCursor,
    @RequestParam(value = "count", required = false) Integer count,
    @RequestParam(value = "infinite_count",required = false) boolean infiniteCount,
    HttpServletResponse response
  ) {

    UserFilterParam userFilterParam = new UserFilterParam();
    userFilterParam.setLoginName(loginName);
    userFilterParam.setName(name);
    userFilterParam.setStatus(status);
    userFilterParam.setLast_cursor(lastCursor);
    userFilterParam.setCount(count);
    userFilterParam.setInfinite_count(infiniteCount);
    PageInfo<UserResult> userResultPageInfo = userService.findUsers(userFilterParam);

    List<UserRes> userReses = new ArrayList<>();

    userResultPageInfo.getList().forEach(userResult -> {
      userReses.add(makeUserResponse(userResult));
    });

    response.setHeader("X-Total-Count", String.valueOf(userResultPageInfo.getTotal()));
    return userReses;

  }


  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public UserRes createUser(
    @Valid @RequestBody UserCreateReq userCreateReq
    ) {

    UserCreateParam userCreateParam = new UserCreateParam();
    userCreateParam.setLoginName(userCreateReq.getLogin_name());
    userCreateParam.setName(userCreateReq.getName());
    userCreateParam.setPassword(userCreateReq.getPassword());
    userCreateParam.setRoleIds(userCreateReq.getRole_ids());
    userCreateParam.setRemark(userCreateReq.getRemark());

    UserResult userResult = userService.createUser(userCreateParam);

    UserRes userRes = makeUserResponse(userResult);

    return userRes;
  }

  @PutMapping("/{userId}")
  public UserRes modifyUser(
    @PathVariable(value = "userId", required = true) Integer userId,
    @Valid @RequestBody UserUpdateReq userModifyReq
  ) {

    UserUpdateParam userUpdateParam = new UserUpdateParam();
    userUpdateParam.setId(userId);
    userUpdateParam.setLoginName(userModifyReq.getLogin_name());
    userUpdateParam.setName(userModifyReq.getName());
    userUpdateParam.setRemark(userModifyReq.getRemark());
    userUpdateParam.setStatus(userModifyReq.getStatus());
    userUpdateParam.setRoleIds(userModifyReq.getRole_ids());

    UserResult userResult = userService.updateUser(userUpdateParam);

    UserRes userRes = makeUserResponse(userResult);

    return userRes;

  }


  @DeleteMapping("/{userId}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void deleteUser(
    @PathVariable(value = "userId", required = true) Integer userId
  ) {
    userService.deleteUser(userId);
  }


  private UserRes makeUserResponse(UserResult userResult) {
    UserRes userRes = new UserRes();
    userRes.setId(userResult.getId());
    userRes.setLogin_name(userResult.getLoginName());
    userRes.setName(userResult.getName());
    userRes.setRemark(userResult.getRemark());
    userRes.setStatus(userResult.getStatus());
    userRes.setType(userResult.getType());
    userRes.setCreate_time(userResult.getCreateTime());
    userRes.setUpdate_time(userResult.getUpdateTime());
    userRes.setLast_login_ip(userResult.getLastLoginIp());
    userRes.setLast_login_time(userResult.getLastLoginTime());
    userRes.setRoles(((Function<List<UserResult.UserRoleResult>, List<UserRes.UserRoleRes>>) (roleResults -> {
      List<UserRes.UserRoleRes> userReses = new ArrayList<>();
      roleResults.forEach(item -> {
        UserRes.UserRoleRes roleRes = new UserRes.UserRoleRes();
        roleRes.setId(item.getId());
        roleRes.setCode(item.getCode());
        roleRes.setName(item.getName());
        roleRes.setRemark(item.getRemark());
        userReses.add(roleRes);
      });
      return userReses;
    })).apply(userResult.getRoles() == null ? Collections.EMPTY_LIST : userResult.getRoles()));

    return userRes;

  }


}
