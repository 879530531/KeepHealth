package com.gxuwz.KeepHealth.business.service;

import java.awt.Color;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.SysUserDAO;
import com.gxuwz.KeepHealth.business.dao.TbReadDeviceDao;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadDevice;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.pagination.Result;

/**
 * 自助听读器管理Service实现类
 * @author yechengting
 *@version 2019.1.21
 */

@Service("tbReadDeviceService")
public class TbReadDeviceServiceImpl implements TbReadDeviceService {
	
	private Logger logger = Logger.getLogger(TbReadDeviceServiceImpl.class);
	
	@Autowired
	TbReadDeviceDao  tbReadDeviceDao;

	/**
	 * 根据条件查找分页
	 * @param TbReadDevice 模型
	 * @param page 第几页
	 * @param row 长度
	 * @author 陈紫丽
	 * @date 2019.01.24
	 */
	public Result<TbReadDevice> find(TbReadDevice tbReadDevice, int page, int row) {
//		System.out.println("8888"+tbPersonalData.getMobilePhone());
		return tbReadDeviceDao.find(tbReadDevice, page, row);
	}

	/**
	 * 根据听读器编号查询听读器对象
	 * @param TbReadDevice 模型
	 * @author 陈紫丽
	 * @date 2019.01.27
	 */
	@Override
	public TbReadDevice findByReadIdWeb(int readId){
		return tbReadDeviceDao.get(TbReadDevice.class,readId);
	}
	/**
	 * 删除听读器数据→增添移除文件代码
     * @author 陈紫丽→叶城廷
	 * @Date 2019.01.27→2019.2.17
	 */
	@Override
	public void delete(int readId) {
//		sysUserRoleService.deleteUserRole(userId);
		//根据用户ID查询返回对象
		TbReadDevice tbReadDevice = findByReadIdWeb(readId);
		
		//移除文件
		com.gxuwz.KeepHealth.util.FileUtil.delectFile(tbReadDevice.getReadFilePath());
		
		tbReadDeviceDao.remove(tbReadDevice);
		
		
	}
	
	/**
	 * 添加听读器信息-包括上传文件→修正文件存放路径
	 * @author 陈紫丽→叶城廷
	 * @date 2019.01.31→2019.2.17
	 */
	public List<TbReadDevice> addWeb(TbReadDevice tbReadDevice, File[] uploadFile,
			String[] uploadFileName, String[] fType) {
		List<TbReadDevice> fList = new ArrayList<TbReadDevice>();
		//String savePath = ServletActionContext.getRequest().getRealPath("/upload");//"D:\\upload\\";
		//String savePath = ServletActionContext.getRequest().getRealPath("readDeviceMusic/");
		//String savePath = TbReadDeviceServiceImpl.class.getClass().getResource("/").getPath() + "/readDeviceMusic/";
		String savePath = PropertyUtil.getProperty("AUDIO_ROOT", "musicFilePath.properties");
		File file = new File(savePath);
		if(!file.exists()){
			file.mkdir();
		}
		if(null != uploadFile){
			for(int i = 0; i < uploadFile.length; i++){
				if(null != uploadFileName[i] &&  !"".equals(uploadFileName[i])){
					//String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),uploadFileName[i].length());
					//获取当前时间戳
					//String currentTime = System.currentTimeMillis()+"";
					//String newName = currentTime+fileType;
					//System.out.println("文件保存路径："+savePath + newName);
					String newName =tbReadDevice.getReadNumber()+".mp3";
					logger.info("文件保存路径："+savePath);
					//System.out.println(newName+imageList);
					File saveFile = new File(savePath,newName);
//					TbPersonalData tbPersonalData = new TbPersonalData();
					tbReadDevice.setReadFilePath(savePath+newName);
					try {
						FileUtil.copyFile(uploadFile[i], saveFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
					BufferedInputStream bfis = null;
					FileInputStream fis = null;
					BufferedOutputStream bfos = null;
					FileOutputStream fos = null;
					try{
						//获取文件字节流
						fis = new FileInputStream(uploadFile[i]);
						bfis = new BufferedInputStream(fis);
						
						//写入文件字节流
						fos = new FileOutputStream(saveFile);
						bfos = new BufferedOutputStream(fos);
						
						byte[] b = new byte[1024];
						int len = 0;
						while(( len = bfis.read(b)) != -1){
							bfos.write(b, 0, len);
						}
					}catch(Exception e){
						logger.error("上传文件写入时出错了");
						e.printStackTrace();
					}finally{
						close(bfis, fis, bfos, fos);
					}
					//调用压缩图片代码
					//zipImageFile(tbReadDevice,new File(savePath,newName));
					//System.out.println("newName"+newName);
//					String ImagePath = savePath + newName;
//					userImage.setImageCode(currentTime);
					//设置图片路径为相对路径
//					userImage.setImagePath("/upload/"+newName);
////					userImage.setStatus("01");
//					String personalId = (String) ServletActionContext.getRequest().getSession().getAttribute("personalId");
//					if(null != personalId && !"".equals(personalId)){
//						//查找当前登录用户的userId
//						TbPersonalData user = tbPersonalDataService.findByPersonalId(personalId);
//						if(null != user){
//							userImage.setUserId(tbPersonalData.getPersonalId());
//							userImage.setSumitter(user.getPersonalId()); 
//						}
//					}
//					//设置照片类型
//					userImage.setImageType(imageType[i]);
//					Timestamp time = new Timestamp(new Date().getTime());
//					userImage.setUploadTime(time);
//					imageList.add(userImage);
				}
			}
		}else{
			tbReadDevice.setReadFilePath(savePath+"default_img.mp3");
		}
//		System.out.println(savePath);
//		System.out.println(savePath);
		add(tbReadDevice);
		return fList;
	}

	protected void close(BufferedInputStream bfis, FileInputStream fis, BufferedOutputStream bfos,
			FileOutputStream fos) {
		try{
			if(bfos != null){
				bfos.close();
			}
			if(fos != null){
				fos.close();
			}
			if(bfis != null){
				bfis.close();
			}
			if(fis != null){
				fis.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加听读器
	 * @author 陈紫丽
	 * @date 2019.01.31
	 */
	@Override
	public void add(TbReadDevice tbReadDevice) {
		
		tbReadDeviceDao.save(tbReadDevice);
	}
	
	/**
	 * 听读器修改→增添移除文件代码并修正文件存放路径
	 * @author 陈紫丽→叶城廷
	 * @data 2019.01.31→2019.2.17
	 */
	
	@Override
	public List<TbReadDevice> updateWeb(TbReadDevice tbReadDevice, File[] uploadFile,
				String[] uploadFileName, String[] imageType) {
		//添加前移除文件
		com.gxuwz.KeepHealth.util.FileUtil.delectFile(tbReadDevice.getReadFilePath());
		
		List<TbReadDevice> fList = new ArrayList<TbReadDevice>();
		//String savePath = ServletActionContext.getRequest().getRealPath("/upload");//"D:\\upload\\";
		//String savePath = ServletActionContext.getRequest().getRealPath("readDeviceMusic/");
		//String savePath = TbReadDeviceServiceImpl.class.getClass().getResource("/").getPath() + "/readDeviceMusic/";
		//String savePath = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/") + "readDeviceMusic/";
		String savePath = PropertyUtil.getProperty("AUDIO_ROOT", "musicFilePath.properties");
		File file = new File(savePath);
		if(!file.exists()){
			file.mkdir();
		}
		if(null != uploadFile){
			for(int i = 0; i < uploadFile.length; i++){
				if(null != uploadFileName[i] &&  !"".equals(uploadFileName[i])){
					String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),uploadFileName[i].length());
					//获取当前时间戳
				      
					//String currentTime = System.currentTimeMillis()+"";
					//String newName = currentTime+fileType;
					String newName =tbReadDevice.getReadNumber()+".mp3";															
				//	System.out.println("文件保存路径："+savePath + newName);
					logger.info("文件保存路径："+savePath);
					//System.out.println(newName+imageList);
					File saveFile = new File(savePath,newName);
//					TbPersonalData tbPersonalData = new TbPersonalData();
					tbReadDevice.setReadFilePath(savePath+newName);
					try {
						FileUtil.copyFile(uploadFile[i], saveFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
					BufferedInputStream bfis = null;
					FileInputStream fis = null;
					BufferedOutputStream bfos = null;
					FileOutputStream fos = null;
					try{
						//获取文件字节流
						fis = new FileInputStream(uploadFile[i]);
						bfis = new BufferedInputStream(fis);
						
						//写入文件字节流
						fos = new FileOutputStream(saveFile);
						bfos = new BufferedOutputStream(fos);
						
						byte[] b = new byte[1024];
						int len = 0;
						while(( len = bfis.read(b)) != -1){
							bfos.write(b, 0, len);
						}
					}catch(Exception e){
						logger.error("上传文件写入时出错了");
						e.printStackTrace();
					}finally{
						close(bfis, fis, bfos, fos);
					}
					
						
						
				}
				}
			}
		//保存修改信息
			tbReadDeviceDao.update(tbReadDevice);
		return fList;
	}
	
	
	/**  
     * 根据设置的宽高等比例压缩图片文件，先保存原文件到服务器，再修改服务器中的图片  
     * @param oldFile  要进行压缩的文件  
     * @author 陈紫丽
     * @date 2019.01.31
     * @return 返回压缩后的文件的全路径  
      */  
//    public  List<TbReadDevice>  zipImageFile(TbReadDevice tbReadDevice, File oldFile) {
//    	
//		List<TbReadDevice> fList = new ArrayList<TbReadDevice>();
//        if (oldFile != null) { 
//        try { 
////        	System.out.println("newImg");
//            /** 对服务器上的临时文件进行处理 */    
//            Image srcFile = ImageIO.read(oldFile);    
//           
//            //对图片路径，后缀名进行处理  
//            String srcImgPath = oldFile.getAbsoluteFile().toString();  
//           // System.out.println(srcImgPath);  
//            String subfix = "mp3";  
//            subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());  
//  
//            BufferedImage buffImg = null;   
//     
//            ImageIO.write(buffImg, subfix, new File(srcImgPath));
//            
//        } catch (FileNotFoundException e) {    
//            e.printStackTrace();    
//        } catch (IOException e) {    
//            e.printStackTrace();    
//        }   
//    }
//
//        return fList;    
//    }
    
//    /**
//	 * 检验听读器数字是否存在
//	 * @param mobilePhone
//	 * @return
//	 * @author 陈紫丽
//	 * @data 2019.01.31
//	 */
//	@Override
//	public boolean checkReadNumber(String readNumber){
//		boolean result = false;
//		//将结果存入模型中，如果不为空，则存在用户编号
//		List<TbReadDevice> tbReadDevice = tbReadDeviceDao.checkReadNumber(readNumber);
//		if(null != tbReadDevice && 0 < tbReadDevice.size()){
//			result = true;
//		}
//		return result;
//	}
}

