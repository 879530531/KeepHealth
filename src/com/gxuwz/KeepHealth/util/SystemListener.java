package com.gxuwz.KeepHealth.util;

import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import net.sf.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 项目启动器
 * @author 叶城廷
 * @version 2019.03.08
 */
public class SystemListener  implements ServletContextListener {

    private ServletContext context = null;//web应用
    private Timer timer = null;
    public  SystemListener() {
        super();
    }


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        this.context = sce.getServletContext();//获取当前应用
        timer = new java.util.Timer(true);//相关线程为守护程序
        long delay1 = 10000;//tomcat启动后1秒开始执行
        timer.schedule(new SystemListener.YdXmTask(this.context), delay1);//（任务，延迟）
        sce.getServletContext().log("--------------->易道养生项目启动器正在完成最后部署");

    }


    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        timer.cancel();
        this.context.log("--------------->易道养生项目启动部署器已销毁");
        this.context = null;
    }

    /**
     * 任务器
     * @author 叶城廷
     * @version 2019.03.08
     */
    private class YdXmTask extends TimerTask {
        private ServletContext context = null;
        public YdXmTask(ServletContext context) {
         this.context=context;
        }

        @Override
        public void run() {
            context.log("--------------->易道养生项目启动器开始调试properties文件");
            //获取项目系统URL
            String SYSTEMURL = PropertyUtil.getProperty("SYSTEM_URL", "wxRequestPath.properties");
            //获取项目资源根路径
            String FILEPATH = URLDecoder.decode(Thread.currentThread().getContextClassLoader().getResource("").getPath().replace("WEB-INF/classes/", "").substring(1));
            //读取杂项
            String audio_root = PropertyUtil.getProperty("AUDIO_ROOT", "musicFilePath.properties");
            String wxaudio_root = PropertyUtil.getProperty("WXAUDIO_ROOT", "musicFilePath.properties");
            String wxaudio_root_temporary = PropertyUtil.getProperty("WXAUDIO_ROOT_TEMPORARY", "musicFilePath.properties");
            String playaudio_root = PropertyUtil.getProperty("PLAYAUDIO_ROOT", "musicFilePath.properties");
            String wx_playaudio_root = PropertyUtil.getProperty("WX_PLAYAUDIO_ROOT", "musicFilePath.properties");
            String wx_playaudio_root_temporary = PropertyUtil.getProperty("WX_PLAYAUDIO_ROOT_TEMPORARY", "musicFilePath.properties");

            context.log("--------------->读取到易道系统URL："+SYSTEMURL);
            context.log("--------------->读取到易道系统资源根路径："+FILEPATH);
            context.log("--------------->正在替换相应properties文件值");
            PropertyUtil.editProperty("FILE_PATH", FILEPATH,"wxRequestPath.properties");
            PropertyUtil.editProperty("AUDIO_ROOT", audio_root.replace("FILEPATH",FILEPATH),"musicFilePath.properties");
            PropertyUtil.editProperty("WXAUDIO_ROOT", wxaudio_root.replace("FILEPATH",FILEPATH),"musicFilePath.properties");
            PropertyUtil.editProperty("WXAUDIO_ROOT_TEMPORARY", wxaudio_root_temporary.replace("FILEPATH",FILEPATH),"musicFilePath.properties");
            PropertyUtil.editProperty("PLAYAUDIO_ROOT", playaudio_root.replace("SYSTEMURL",SYSTEMURL),"musicFilePath.properties");
            PropertyUtil.editProperty("WX_PLAYAUDIO_ROOT", wx_playaudio_root.replace("SYSTEMURL",SYSTEMURL),"musicFilePath.properties");
            PropertyUtil.editProperty("WX_PLAYAUDIO_ROOT_TEMPORARY", wx_playaudio_root_temporary.replace("SYSTEMURL",SYSTEMURL),"musicFilePath.properties");
            String audio_root2 = PropertyUtil.getProperty("AUDIO_ROOT", "musicFilePath.properties");
            String wxaudio_roo2t = PropertyUtil.getProperty("WXAUDIO_ROOT", "musicFilePath.properties");
            String wxaudio_root_temporary2 = PropertyUtil.getProperty("WXAUDIO_ROOT_TEMPORARY", "musicFilePath.properties");
            String playaudio_root2 = PropertyUtil.getProperty("PLAYAUDIO_ROOT", "musicFilePath.properties");
            String wx_playaudio_root2 = PropertyUtil.getProperty("WX_PLAYAUDIO_ROOT", "musicFilePath.properties");
            String wx_playaudio_root_temporary2 = PropertyUtil.getProperty("WX_PLAYAUDIO_ROOT_TEMPORARY", "musicFilePath.properties");

            context.log("--------------->更新后audio_root2："+audio_root2);
            context.log("--------------->更新后wxaudio_roo2t："+wxaudio_roo2t);
            context.log("--------------->wxaudio_root_temporary2："+wxaudio_root_temporary2);
            context.log("--------------->更新后playaudio_root2："+playaudio_root2);
            context.log("--------------->更新后wx_playaudio_root2："+wx_playaudio_root2);
            context.log("--------------->wx_playaudio_root_temporary2："+wx_playaudio_root_temporary2);
            context.log("--------------->properties文件值完成，准备进行微信公众号接口对接");
            context.log("--------------->易道系统正在进行微信公众号接口对接");
            String result = WeixinUtil.createMenu();
            context.log("--------------->"+result);
            context.log("--------------->易道系统进入微信公众号测试");
            context.log("--------------->查询易道养生微信公众平台菜单");
            JSONObject menuJsonStr = WeixinUtil.queryMenu();
            context.log("--------------->易道养生微信公众平台菜单:"+menuJsonStr);
            if(result.equals("success")){
                context.log("--------------->易道系统测试完成，接入微信公众平台成功");
            }else{
                context.log("----------------------------------->易道系统测试失败，请联系相关开发者！！！<-----------------------------------");
            }
            context.log("--------------->正在完成最后重置网络调试");
            String ipv4 = WeixinUtil.queryIpv4();
            if(ipv4==null){
                context.log("--------------->网络无连接，请联系相关网络管理员！！！<-----------------------------------");
            }else {
                PropertyUtil.editProperty("IPV4", ipv4,"wxRequestPath.properties");
                String ipv41 = PropertyUtil.getProperty("IPV4", "wxRequestPath.properties");
                if(ipv41.equals(ipv4)){
                    context.log("--------------->微信支付API调起服务器IPV4为："+ipv41+"测试成功");
                }else {
                    context.log("--------------->当前服务器IPV4为："+ipv4+"，系统读取文件IPV4为："+ipv41+"ipv4文件替换失败，请联系相关管理员！！！");
                }
            }
            //context.log("--------------->准备进行微信支付沙箱测试");
            //待写微信支付沙箱测试-叶城廷2019.3.19
            context.log("--------------->易道系统启动完成");

        }
    }
}


