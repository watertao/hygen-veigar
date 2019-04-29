---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/user/UserService.java
---
package <%= h.mgnPackage(h, locals) %>.service.user;

import io.github.watertao.veigar.core.exception.ForbiddenException;
import <%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthRoleMapper;
import <%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthUserMapper;
import <%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthUserRoleRelMapper;
import <%= h.mgnPackage(h, locals) %>.mapper.custom.UserCstmMapper;
import <%= h.mgnPackage(h, locals) %>.model.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.github.watertao.veigar.core.exception.ConflictException;
import io.github.watertao.veigar.core.exception.NotFoundException;
import io.github.watertao.veigar.core.message.LocaleMessage;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static java.util.stream.Collectors.toList;


@Service
public class UserService {


    @Autowired
    private TAuthRoleMapper roleMapper;

    @Autowired
    private TAuthUserMapper userMapper;

    @Autowired
    private TAuthUserRoleRelMapper userRoleRelMapper;

    @Autowired
    private UserCstmMapper userCstmMapper;

    @Autowired
    private LocaleMessage localeMessage;

    @Transactional
    public UserResult createUser(UserCreateParam userCreateParam) {

        // check whether role ids existence
        List<TAuthRole> roles = null;
        if (userCreateParam.getRoleIds() != null && userCreateParam.getRoleIds().size() > 0) {
            userCreateParam.setRoleIds(userCreateParam.getRoleIds().stream().distinct().collect(toList()));
            TAuthRoleExample roleExample = new TAuthRoleExample();
            roleExample.createCriteria().andIdIn(userCreateParam.getRoleIds());
            roles = roleMapper.selectByExample(roleExample);
            if (roles.size() != userCreateParam.getRoleIds().size()) {
                List<Integer> unexistRoleIds = new ArrayList<>();
                List<TAuthRole> finalRoles = roles;
                userCreateParam.getRoleIds().forEach(id -> {
                    for (TAuthRole role : finalRoles) {
                        if (role.getId() == id) {
                            return;
                        }
                    }
                    unexistRoleIds.add(id);
                });
                throw new NotFoundException(localeMessage.bm(
                        "message.authority",
                        "role.notExist",
                        new Object[]{StringUtils.join(unexistRoleIds)}
                ));
            }
        }

        // insert user
        TAuthUser user = new TAuthUser();
        user.setLoginName(userCreateParam.getLoginName());
        user.setName(userCreateParam.getName());
        user.setPassword(DigestUtils.sha256Hex(userCreateParam.getPassword()));
        user.setRemark(userCreateParam.getRemark());
        user.setStatus("1");
        user.setType("1");
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        try {
            userMapper.insertSelective(user);
        } catch (DuplicateKeyException e) {
            throw new ConflictException(localeMessage.bm(
                    "message.authority",
                    "user.loginName.duplicate",
                    new Object[]{user.getLoginName()}
            ));
        }

        // insert user-role relationship
        if (roles != null && roles.size() > 0) {
            roles.forEach(role -> {
                TAuthUserRoleRelKey userRoleRelKey = new TAuthUserRoleRelKey();
                userRoleRelKey.setUserId(user.getId());
                userRoleRelKey.setRoleId(role.getId());
                userRoleRelMapper.insert(userRoleRelKey);
            });
        }

        // construct result
        UserResult userResult = makeUserResult(user, roles);

        return userResult;

    }


    public UserResult selectUserById(Integer id) {

        TAuthUser user = userMapper.selectByPrimaryKey(id);
        if (user == null) {
            throw new NotFoundException(localeMessage.bm(
                    "message.authority",
                    "user.notExist",
                    new Object[]{id}
            ));
        }

        List<TAuthRole> roles = null;
        TAuthUserRoleRelExample userRoleRelExample = new TAuthUserRoleRelExample();
        userRoleRelExample.createCriteria().andUserIdEqualTo(id);
        List<TAuthUserRoleRelKey> userRoleRels = userRoleRelMapper.selectByExample(userRoleRelExample);
        if (userRoleRels.size() > 0) {
            List<Integer> roleIds = new ArrayList<>();
            userRoleRels.forEach(item -> {
                roleIds.add(item.getRoleId());
            });
            TAuthRoleExample roleExample = new TAuthRoleExample();
            roleExample.createCriteria().andIdIn(roleIds);
            roles = roleMapper.selectByExample(roleExample);
        }

        return makeUserResult(user, roles);

    }


    public PageInfo<UserResult> findUsers(UserFilterParam userFilterParam) {

        TAuthUserExample userExample = new TAuthUserExample();
        TAuthUserExample.Criteria criteria = userExample.createCriteria();

        if (!StringUtils.isEmpty(userFilterParam.getLoginName())) {
            criteria.andLoginNameLike("%" + userFilterParam.getLoginName() + "%");
        }
        if (!StringUtils.isEmpty(userFilterParam.getName())) {
            criteria.andNameLike("%" + userFilterParam.getName() + "%");
        }
        if (!StringUtils.isEmpty(userFilterParam.getStatus())) {
            criteria.andStatusEqualTo(userFilterParam.getStatus());
        }

        if (!userFilterParam.isInfinite_count()) {
            PageHelper.offsetPage(userFilterParam.getLast_cursor(), userFilterParam.getCount());
        }


        List<TAuthUser> users = userMapper.selectByExample(userExample);
        if (users.size() == 0) {
            return new PageInfo<>(Collections.EMPTY_LIST);
        }


        // retrieve roles
        Map<Integer, List<TAuthRole>> userRoleMap = new HashMap<>();
        List<Integer> userIds = new ArrayList<>();
        users.forEach(user -> {
            userIds.add(user.getId());
        });
        List<Map> userRoles = userCstmMapper.findRolesByUserIds(userIds);
        userRoles.forEach(item -> {
            Integer userId = (Integer) item.get("user_id");
            Integer roleId = (Integer) item.get("role_id");
            String code = (String) item.get("code");
            String name = (String) item.get("name");
            String status = (String) item.get("status");
            String remark = (String) item.get("remark");
            if (userRoleMap.get(userId) == null) {
                userRoleMap.put(userId, new ArrayList<>());
            }
            TAuthRole role = new TAuthRole();
            role.setId(roleId);
            role.setCode(code);
            role.setName(name);
            role.setRemark(remark);
            role.setStatus(status);
            userRoleMap.get(userId).add(role);
        });

        // construct results
        List<UserResult> userResults = new ArrayList<>();
        users.forEach(user -> {
            userResults.add(makeUserResult(user, userRoleMap.get(user.getId())));
        });

        PageInfo pageInfo = new PageInfo(users);
        pageInfo.setList(userResults);
        return pageInfo;

    }


    @Transactional
    public UserResult updateUser(UserUpdateParam userUpdateParam) {

        // check user existence
        TAuthUser user = userMapper.selectByPrimaryKey(userUpdateParam.getId());
        if (user == null) {
            throw new NotFoundException(localeMessage.bm(
                    "message.authority",
                    "user.notExist",
                    new Object[]{userUpdateParam.getId()}
            ));
        }
        // check supervisor
      if (StringUtils.equals("9", user.getType())) {
        throw new ForbiddenException(localeMessage.bm(
          "message.authority",
          "user.supervisor.forbidden"));
      }

        // check whether role ids existence
        List<TAuthRole> roles = null;
        if (userUpdateParam.getRoleIds() != null && userUpdateParam.getRoleIds().size() > 0) {
            userUpdateParam.setRoleIds(userUpdateParam.getRoleIds().stream().distinct().collect(toList()));
            TAuthRoleExample roleExample = new TAuthRoleExample();
            roleExample.createCriteria().andIdIn(userUpdateParam.getRoleIds());
            roles = roleMapper.selectByExample(roleExample);
            if (roles.size() != userUpdateParam.getRoleIds().size()) {
                List<Integer> unexistRoleIds = new ArrayList<>();
                List<TAuthRole> finalRoles = roles;
                userUpdateParam.getRoleIds().forEach(id -> {
                    for (TAuthRole role : finalRoles) {
                        if (role.getId() == id) {
                            return;
                        }
                    }
                    unexistRoleIds.add(id);
                });
                throw new NotFoundException(localeMessage.bm(
                        "message.authority",
                        "role.notExist",
                        new Object[]{StringUtils.join(unexistRoleIds)}
                ));
            }
        }

        // update user
        user.setLoginName(userUpdateParam.getLoginName());
        user.setName(userUpdateParam.getName());
        user.setRemark(userUpdateParam.getRemark());
        user.setStatus(userUpdateParam.getStatus());
        user.setUpdateTime(new Date());
        try {
            userMapper.updateByPrimaryKey(user);
        } catch (DuplicateKeyException e) {
            throw new ConflictException(localeMessage.bm(
                    "message.authority",
                    "user.loginName.duplicate",
                    new Object[]{user.getLoginName()}
            ));
        }

        // update user-role relationship
        TAuthUserRoleRelExample userRoleRelExample = new TAuthUserRoleRelExample();
        userRoleRelExample.createCriteria().andUserIdEqualTo(user.getId());
        userRoleRelMapper.deleteByExample(userRoleRelExample);
        if (roles != null && roles.size() > 0) {
            roles.forEach(role -> {
                TAuthUserRoleRelKey userRoleRelKey = new TAuthUserRoleRelKey();
                userRoleRelKey.setUserId(user.getId());
                userRoleRelKey.setRoleId(role.getId());
                userRoleRelMapper.insert(userRoleRelKey);
            });
        }

        // construct result
        UserResult userResult = makeUserResult(user, roles);

        return userResult;

    }


    @Transactional
    public void deleteUser(Integer userId) {

        // check user existence
        TAuthUser user = userMapper.selectByPrimaryKey(userId);
        if (user == null) {
            throw new NotFoundException(localeMessage.bm(
                    "message.authority",
                    "user.notExist",
                    new Object[]{userId}
            ));
        }

      // check supervisor
      if (StringUtils.equals("9", user.getType())) {
        throw new ForbiddenException(localeMessage.bm(
          "message.authority",
          "user.supervisor.forbidden"));
      }


        userMapper.deleteByPrimaryKey(userId);

        TAuthUserRoleRelExample userRoleRelExample = new TAuthUserRoleRelExample();
        userRoleRelExample.createCriteria().andUserIdEqualTo(userId);
        userRoleRelMapper.deleteByExample(userRoleRelExample);

    }


    private UserResult makeUserResult(TAuthUser user, List<TAuthRole> roles) {
        UserResult userResult = new UserResult();
        userResult.setId(user.getId());
        userResult.setLoginName(user.getLoginName());
        userResult.setName(user.getName());
        userResult.setRemark(user.getRemark());
        userResult.setStatus(user.getStatus());
        userResult.setLastLoginIp(user.getLastLoginIp());
        userResult.setLastLoginTime(user.getLastLoginTime());
        userResult.setType(user.getType());
        userResult.setCreateTime(user.getCreateTime());
        userResult.setUpdateTime(user.getUpdateTime());

        if (roles != null) {
            List<UserResult.UserRoleResult> rolesResult = new ArrayList<>();
            roles.forEach(role -> {
                UserResult.UserRoleResult rr = new UserResult.UserRoleResult();
                rr.setId(role.getId());
                rr.setCode(role.getCode());
                rr.setName(role.getName());
                rr.setRemark(role.getRemark());
                rolesResult.add(rr);
            });
            userResult.setRoles(rolesResult);
        }

        return userResult;
    }

}
