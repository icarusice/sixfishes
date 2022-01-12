package com.icarus.service;

import com.icarus.pojo.DepositoryRecordP;

import java.util.List;
import java.util.Map;

public interface DepositoryRecordService {
    Integer apply(Map<String,Object> map);

    List<DepositoryRecordP> findDepositoryRecordPByCondition(Map<String, Object> map);

    Integer findCountByCondition(Map<String, Object> map);

    Integer deleteDepositoryRecordById(Integer id);

    Integer deleteDepositoryRecordByIds(List<Integer> ids);
}
