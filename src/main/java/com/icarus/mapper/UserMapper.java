package com.icarus.mapper;

import com.icarus.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface UserMapper {
    /**
     * 根据条件查询用户(此方法只能在确认结果只有一条记录时调用)
     * @param map
     * @return
     */
    User findUserByCondition(Map<String,Object> map);

    User findUserByEmail(String principal);

    /**
     * 根据参数插入一条用户信息
     * @param map 参数map
     * @return 受影响的行数，0表示插入失败，1表示成功
     */
    Integer insertUser(Map<String, Object> map);

    List<User> findUsersByCondition(Map<String, Object> reviverMap);

    String findUserNameById(int id);
}
