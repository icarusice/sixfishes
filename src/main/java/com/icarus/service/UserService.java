package com.icarus.service;

import com.icarus.entity.User;
import com.icarus.pojo.UserP;

import java.util.List;
import java.util.Map;

public interface UserService {

    /**
     * 查询所有的审核人
     * @return 所有审核人对象
     */
    List<User> findReviewers();
    /**
     * 根据拥有的user对象包装成前端常用的UserP对象
     * @param user user对象
     * @return UserP对象
     */
    UserP singlePack(User user);

    User findUserByEmail(String principal);

    Integer insertUser(Map<String, Object> map);

    User findUserByCondition(Map<String, Object> map);
}
