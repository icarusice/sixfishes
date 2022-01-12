package com.icarus.controller;

import com.icarus.exception.MyException;
import com.icarus.pojo.DepositoryRecordP;
import com.icarus.pojo.RestResponse;
import com.icarus.service.DepositoryRecordService;
import com.icarus.utils.CrudUtil;
import com.icarus.utils.ObjectFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RestController
public class DepositoryRecordController {

    @Autowired
    private DepositoryRecordService depositoryRecordService;
    @GetMapping("/depositoryRecord")
    public RestResponse findDepositoryRecordByCondition(@RequestParam Map<String,Object> map){
        List<DepositoryRecordP> list=depositoryRecordService.findDepositoryRecordPByCondition(map);
        return new RestResponse(list,depositoryRecordService.findCountByCondition(map),200);
    }
    @DeleteMapping("/depositoryRecord")
    public RestResponse deleteDepositoryRecord(@RequestBody Map<String,Object> map){
        if (map.containsKey("id")){
            Integer id= ObjectFormatUtil.toInteger(map.get("id"));
            return CrudUtil.deleteHandle(depositoryRecordService.deleteDepositoryRecordById(id),1);
        }else if (map.containsKey("ids")){
            List<Integer> ids=(List<Integer>) map.get("ids");
            return CrudUtil.deleteHandle(depositoryRecordService.deleteDepositoryRecordByIds(ids),ids.size());
        }else {
            throw new MyException("所需请求参数缺失！");
        }
    }
}
