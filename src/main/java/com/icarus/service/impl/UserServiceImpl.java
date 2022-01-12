package com.icarus.service.impl;

import com.icarus.entity.User;
import com.icarus.mapper.DepositoryMapper;
import com.icarus.mapper.UserMapper;
import com.icarus.pojo.UserP;
import com.icarus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    static final Map<String,Object> REVIVER_MAP=new HashMap<>(1);
    static {
        REVIVER_MAP.put("authority","审核人");
    }
    @Autowired
    UserMapper userMapper;
    @Autowired
    DepositoryMapper depositoryMapper;
    @Override
    public List<User> findReviewers() {
        return userMapper.findUsersByCondition(REVIVER_MAP);
    }

    @Override
    public UserP singlePack(User user) {
        UserP userP = new UserP(user);
        if(user.getDepositoryId()==-1){
            userP.setDepositoryName("全部仓库");
        }else{
            userP.setDepositoryName(depositoryMapper.findDepositoryNameById(user.getDepositoryId()));
        }
        return userP;
    }

    @Override
    public User findUserByEmail(String principal) {
        return userMapper.findUserByEmail(principal);
    }

    @Override
    public Integer insertUser(Map<String, Object> map) {
        return userMapper.insertUser(map);
    }

    @Override
    public User findUserByCondition(Map<String, Object> map) {
        return userMapper.findUserByCondition(map);
    }
}
