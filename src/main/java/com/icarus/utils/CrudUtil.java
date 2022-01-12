package com.icarus.utils;

import com.icarus.pojo.RestResponse;
import com.icarus.pojo.StatusInfo;

public class CrudUtil {
    private static final RestResponse RESPONSE201=new RestResponse(201);
    public static final RestResponse RESPONSE204=new RestResponse().setStatus(204);
    private static final RestResponse RESPONSE304=new RestResponse().setStatus(304).
            setStatusInfo(new StatusInfo("资源未改变或未达到预期改变，错误码304。bug常有，请多多包含，请及时联系相关管理员，我们会尽快修复","资源未变化"));
    public static final RestResponse NOT_EXIST_USER_OR_ERROR_PWD_RESPONSE =new RestResponse
            ("",402,new StatusInfo("登录失败，账号或者密码错误！","错误码402，账号或者密码错误"));
    public static final RestResponse ID_MISS_RESPONSE=new RestResponse(0,400,new StatusInfo
            ("请求错误，错误码400","请求中必要参数(如id)丢失！"));
    public static final RestResponse CODE_ERROR=new RestResponse("",408,new StatusInfo
            ("验证码错误！","错误码408，验证码错误请重新输入！"));

    /**
     * 用户处理通常的post请求
     * @param result 执行service层insert方法的返回结果（即受影响数据的行数）
     * @param standard 正常执行所受影响的数据行数
     * @return 处理后的RestResponse
     */
    public static RestResponse postHandle(Integer result,Integer standard){
        if(result.equals(standard)){
            return RESPONSE201;
        }else {
            return RESPONSE304;
        }
    }
    public static RestResponse deleteHandle( Integer result,Integer standard){
        if (result>=standard){
            return RESPONSE204;
        }else {
            return RESPONSE304;
        }
    }
}
