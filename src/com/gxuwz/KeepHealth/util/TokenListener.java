package com.gxuwz.KeepHealth.util;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.gxuwz.KeepHealth.business.wx.entity.WxAccessToken;
import com.gxuwz.KeepHealth.business.wx.entity.WxToken;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;

/**
 * 后台定时任务：刷新access_token和tickect
 * @author 叶城廷
 * @version 2019.03.08
 *
 */
public class TokenListener implements ServletContextListener{//xml中声明此监听

	private ServletContext context = null;//web应用
	private Timer timer = null;
	public  TokenListener() {
		super();
	}

	/**
	 * 两小时执行一次刷新，考虑网络延迟，实际时间会更短
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		this.context = sce.getServletContext();//获取当前应用
		timer = new java.util.Timer(true);//相关线程为守护程序
		sce.getServletContext().log("--------------->易道养生微信公众号票据更新定时器已启动");
		long delay1 = 1000;//tomcat启动后1秒开始执行
		long period = 5400000;//每隔1小时30分执行一次 5400000
		timer.schedule(new MyTask(this.context), delay1, period);//（任务，延迟，间隔）
		sce.getServletContext().log("--------------->易道养生微信公众号票据定时器已经添加任务调度表");

	}


	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		timer.cancel();
		this.context.log("--------------->易道养生微信公众号票据更新定时器销毁");
		this.context = null;
	}

	/**
	 * 刷新票据
	 * @author 叶城廷
	 * @version 2019.2.17
	 */
	public void freshTicket() {
		context.log("--------------->易道养生系统Token监听器正准备进行票据更新");
		boolean flag=false;
		//获取票据
		WxAccessToken accessToken = WeixinUtil.getAccessToken();
		String token = accessToken.getToken();
		//更新票据文件
		try {
			WxToken instance = WxToken.getInstance();
			instance.setToken(token);
			WxToken.setInstance(instance);
			//PropertyUtil.editProperty("TOKEN", token, "wxRequestPath.properties");
			context.log("--------------->正在进行票据测试");
			String token1=WxToken.getInstance().getToken();
			if(token.equals(token1)){
				context.log("--------------->票据测试完成,最近获取票据与当前票据相同");
			}else {
				context.log("--------------->票据测试失败,最近获取票据与当前票据不符");
			}
			context.log("--------------->票据为："+token1);

			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
		if(flag) {
			context.log("--------------->易道养生微信公众号更新微信票据成功");
		}else {
			context.log("----------------------------》更新票据失败，请联系相关程序员，否则将导致微信系统面临崩溃！《---------------------------------");
		}

	}
	/**
	 * 任务器
	 * @author 叶城廷
	 * @version 2019.2.17
	 */
	private class MyTask extends TimerTask {
		private ServletContext context = null;
		public MyTask(ServletContext context) {
			this.context = context;
		}

		// 下面的方法会按之前设定的每5秒执行一次，所以，此处不需要循环
		public void run() {
			context.log("--------------->易道养生微信公众号票据更新定时器开始执行更新任务");
			freshTicket();
			context.log("--------------->易道养生微信公众号票据更新定时器更新任务执行结束");
		}
	}
}
