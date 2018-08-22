package top.wintp.crud.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 类描述：返回结果json
 * Created by shaofei on 2017/12/16.
 * email: apk2sf@163.com
 * QQ：337081267
 */
public class Msg {

    /**
     * 结果码
     */
    private int resultCode;
    /**
     * 结果消息
     */
    private String resultMsg;

    /**
     * 结果数据
     */
    private Map<String, Object> resultBody = new HashMap<>();

    /**
     * 成功的返回码
     */
    public static final int SUCCESS_CODE = 200;
    /**
     * 失败的返回码
     */
    public static final int FAIL_CODE = 500;

    /**
     * 成功的返回
     *
     * @return
     */
    public static Msg resultSuccess() {
        Msg msg = new Msg();
        msg.setResultCode(SUCCESS_CODE);
        msg.setResultMsg("请求成功");

        return msg;
    }

    /**
     * 失败的返回
     *
     * @return
     */
    public static Msg resultFail() {
        Msg msg = new Msg();
        msg.setResultCode(FAIL_CODE);
        msg.setResultMsg("请求失败");

        return msg;
    }

    public Msg addResultBody(String key, Object value) {
        this.getResultBody().put(key, value);
        return this;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "resultCode=" + resultCode +
                ", resultMsg='" + resultMsg + '\'' +
                ", resultBody=" + resultBody +
                '}';
    }

    public int getResultCode() {
        return resultCode;
    }

    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public Map<String, Object> getResultBody() {
        return resultBody;
    }

    public void setResultBody(Map<String, Object> resultBody) {
        this.resultBody = resultBody;
    }
}