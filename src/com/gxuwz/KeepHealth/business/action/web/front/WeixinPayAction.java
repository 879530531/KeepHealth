package com.gxuwz.KeepHealth.business.action.web.front;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordService;
import com.gxuwz.KeepHealth.business.service.TbExceptionalService;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.PrintWriter;

public class WeixinPayAction  extends BaseAction implements Preparable, ModelDriven {
    private String recordId;
    private String waterNumber;

    protected static final String WXPAY_CALLBACK = "/weixin/WxPay_callback.jsp";


    @Autowired
    private TbConsultationRecordService tbConsultationRecordService;

    @Autowired
    private TbExceptionalService tbExceptionalService;

    @Autowired
    private WeixinUtil weixinUtil;
    @Override
    public Object getModel() {
        return null;
    }

    @Override
    public void prepare() throws Exception {

    }


    /**
     * 易道微信打赏异步下单
     * @author 叶城廷
     * @version 2019.03.21
     * @return
     */
    public  String  unifiedOrder(){
        //获取当前openId
        TbConsumer tbConsumer= (TbConsumer) getSession().getAttribute("currentConsumer");
        String data=null;
        //调取业务层检查该单是否已经支付
        boolean flag=tbConsultationRecordService.queryOrder(recordId);
        if(flag){
            setForwardView(WXPAY_CALLBACK);
            return SUCCESS;
        }else {
            TbConsultationRecord tbConsultationRecord = tbConsultationRecordService.symptom_description(Integer.valueOf(recordId));
            //未支付
            //调用微信工具类发送下单请求并返回调起微信所需的数据
            data=weixinUtil.unifiedOrder(tbConsumer.getOpenId(),recordId,tbConsultationRecord.getWaterNumber());//暂定测试1001咨询记录付款
            System.out.println("返回前端数据："+data);
            PrintWriter writer = getPrintWriter();
            try{
                writer.print(data);
                writer.flush();
            }finally{
                writer.close();
            }
            return null;
        }
    }

/**
 * 向微信发送查单请求
 * @return
 */
    public String queryOrder(){
        System.out.println("执行查单");
        //调取业务层检查该单是否已经支付
        boolean flag=tbConsultationRecordService.queryOrder(recordId);
        if (flag){
            //已支付，添加流水和打赏状态
            tbConsultationRecordService.successOrder(recordId);
        }
        //本地跳转再次刷新显示
        getRequest().setAttribute("recordId",recordId);
        setForwardView(WXPAY_CALLBACK);
        return SUCCESS;
    }

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }

    public String getWaterNumber() {
        return waterNumber;
    }

    public void setWaterNumber(String waterNumber) {
        this.waterNumber = waterNumber;
    }

    public WeixinUtil getWeixinUtil() {
        return weixinUtil;
    }

    public void setWeixinUtil(WeixinUtil weixinUtil) {
        this.weixinUtil = weixinUtil;
    }
}
