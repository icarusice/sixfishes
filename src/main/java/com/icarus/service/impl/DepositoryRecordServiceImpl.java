package com.icarus.service.impl;

import com.icarus.entity.DepositoryRecord;
import com.icarus.mapper.DepositoryMapper;
import com.icarus.mapper.DepositoryRecordMapper;
import com.icarus.mapper.UserMapper;
import com.icarus.pojo.DepositoryRecordP;
import com.icarus.service.DepositoryRecordService;
import com.icarus.utils.ObjectFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DepositoryRecordServiceImpl implements DepositoryRecordService {
    @Autowired
    private DepositoryRecordMapper depositoryRecordMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DepositoryMapper depositoryMapper;
    @Override
    public Integer apply(Map<String, Object> map) {
        map.put("applyTime",new Date());
        map.put("status","待审核");
        return depositoryRecordMapper.insertDepositoryRecord(map);
    }

    @Override
    public List<DepositoryRecordP> findDepositoryRecordPByCondition(Map<String,Object> map) {
        Integer size = 8,page=1;
        if (map.containsKey("size")){
            size= ObjectFormatUtil.toInteger(map.get("size"));
            map.put("size", size);
        }
        if (map.containsKey("page")){
            page=ObjectFormatUtil.toInteger(map.get("page"));
            map.put("begin",(page-1)*size);
        }
        return pack(depositoryRecordMapper.findDepositoryRecordByCondition(map));
    }

    @Override
    public Integer findCountByCondition(Map<String, Object> map) {
        return depositoryRecordMapper.findCountByCondition(map);
    }

    @Override
    public Integer deleteDepositoryRecordById(Integer id) {
        return depositoryRecordMapper.deleteDepositoryRecordById(id);
    }

    @Override
    public Integer deleteDepositoryRecordByIds(List<Integer> list) {
        return depositoryRecordMapper.deleteDepositoryRecordByIds(list);
    }

    /**
     * 对查出来的记录进行包装，包装成前端需要的数据
     * @param list DepositoryRecord集合
     * @return 包装好的集合
     */
    private List<DepositoryRecordP> pack(List<DepositoryRecord> list){
        List<DepositoryRecordP> result=new ArrayList<>(list.size());
        for (DepositoryRecord record: list){
            result.add(singlePack(record));
        }
        return result;
    }
    private DepositoryRecordP singlePack(DepositoryRecord record){
        DepositoryRecordP d=new DepositoryRecordP(record);
        d.setApplicantName(userMapper.findUserNameById(record.getApplicantId()));
        d.setDepositoryName(depositoryMapper.findDepositoryNameById(record.getDepositoryId()));
        if (record.getReviewerId()!=null){
            d.setReviewerName(userMapper.findUserNameById(record.getReviewerId()));
        }
        if (record.getCheckerId()!=null){
            d.setCheckerName(userMapper.findUserNameById(record.getCheckerId()));
        }
        return d;
    }
}
