package com.icarus.mapper;

import com.icarus.entity.DepositoryRecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface DepositoryRecordMapper {
     Integer insertDepositoryRecord(Map<String,Object> map);

    List<DepositoryRecord> findDepositoryRecordByCondition(Map<String, Object> map);

    Integer findCountByCondition(Map<String, Object> map);

    Integer deleteDepositoryRecordById(Integer id);

    Integer deleteDepositoryRecordByIds(List<Integer> list);
}
