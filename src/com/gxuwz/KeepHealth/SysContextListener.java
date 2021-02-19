package com.gxuwz.KeepHealth;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;

public class SysContextListener implements ServletContextListener {

	private Timer timer = null;
	@Autowired
	private TbReadmeService tbReadmeService;//健康自述接口
	private List<TbReadme> tbReadmeList;//健康自述列表
	
	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
	    timer = new Timer();
		Calendar calendar = Calendar.getInstance();
	    calendar.set(Calendar.HOUR_OF_DAY, 0); // 控制时
	    calendar.set(Calendar.MINUTE, 0);    // 控制分
	    calendar.set(Calendar.SECOND, 0);    // 控制秒
	 
	    Date time = calendar.getTime();     // 得出执行任务的时间,此处为今天的01：00：00
	    Date time1=new Date();
	    long m=1000 * 60 * 60 * 24-(time1.getTime()-time.getTime());
	    timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("conf/applicationContext-*.xml");
				tbReadmeService=(TbReadmeService) ctx.getBean("tbReadmeService");
				tbReadmeList=tbReadmeService.findReadmeByMentorId();
				//查询所有未答复的指定导师的健康咨询
		   	     for(TbReadme tbReadme:tbReadmeList){//更新所有的健康咨询
		   		  tbReadme.setMentorId(0);
		   		  tbReadme.setMentorName("");
		   		  //设置不指定导师
		   		  tbReadmeService.update(tbReadme);
		   	     }
		      }
		    }, m, 1000*60*60*24);// 这里设定将延时每天固定执行

	}

}
