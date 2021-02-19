package com.gxuwz.KeepHealth.business.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.SysUserDAO;
import com.gxuwz.KeepHealth.business.dao.TbPersonalDataDAO;
import com.gxuwz.KeepHealth.business.dao.WxLoginDAO;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.Untreated;
import com.gxuwz.KeepHealth.business.entity.Healthdata;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.core.pagination.Result;

/**
 * 
 * Title:TbPersonalDataServiceImpl
 * Description: 实现层
 * @author 梧州学院软件开发中心 杨世宇
 * @date 2017年7月5日
 */
@Service("tbPersonalDataService")
public class TbPersonalDataServiceImpl implements TbPersonalDataService{
	
	@Autowired
	private TbPersonalDataDAO tbPersonalDataDAO;
	
	@Autowired
	private WxLoginDAO wxLoginDAO;

	@Autowired
	private SysUserDAO sysUserDAO;
	
	@Autowired
	private SysUserService sysUserService;
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 * @author 杨世宇
	 * @date 2017.03.22
	 */
	public Result<TbPersonalData> find(TbPersonalData tbPersonalData, int page, int row) {
//		System.out.println("66666"+tbPersonalData.getMobilePhone());
		return tbPersonalDataDAO.find(tbPersonalData, page, row);
	}
	
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 */
	public Result<Untreated> findUntreated(Untreated untreated, int page, int row) {
//		System.out.println("66666"+tbPersonalData.getMobilePhone());
		return tbPersonalDataDAO.findUntreated(untreated, page, row);
	}
    
    
    /**
     * 根据条件查找分页
     * @param tbPersonalData 模型
     * @param page 第几页
     * @param row 长度
     * @author 陆云秋
     * @date 2017.03.22
     */
    public Result<Vip> findMember(Vip vip,int page, int row) {
        return tbPersonalDataDAO.findMember(vip,page, row);
    }
    
	/**
	 * 检验用户编号是否存在
	 * @param mobilePhone
	 * @return
	 * @author 杨世宇
	 * @data 2017.03.24
	 */
	@Override
	public boolean checkMobilePhone(String mobilePhone){
		boolean result = false;
		//将结果存入模型中，如果不为空，则存在用户编号
		List<TbPersonalData> tbPersonalData = tbPersonalDataDAO.checkMobilePhone(mobilePhone);
		if(null != tbPersonalData && 0 < tbPersonalData.size()){
			result = true;
		}
		return result;
	}
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 */
	public Result<Healthdata> findHealthdata(Healthdata healthdata, int page, int row) {
//		System.out.println("66666"+tbPersonalData.getMobilePhone());
		return tbPersonalDataDAO.findHealthdata(healthdata, page, row);
	}

	
	/**
	 * 添加用户角色
	 * @author 杨世宇
	 * @date 2017.04.07
	 */
	@Override
	public void add(TbPersonalData tbPersonalData) {
		//密码加密
		tbPersonalData.setPassword(SystemContext.passwdEncryption(tbPersonalData.getPassword()));
		
		tbPersonalDataDAO.save(tbPersonalData);
	}
	
	
	@Override
	public void update(TbPersonalData tbPersonalData,int flagtype) {
		
		//更新角色信息
		
		tbPersonalDataDAO.update1(tbPersonalData,flagtype);
		
	}	
	/**
	 * 微信端修改密码
	 * @author 莫然源
	 * @data 2017.04.26
	 */
	@Override
	public int updatePassword(TbPersonalData tbPersonalData,String oldPassword) {
		
		//更新角色密码
		int i=0;//修改状态。若等于1，则修改失败，等于其他则修改成功
		TbPersonalData TbPerson = null;
		TbPerson =tbPersonalDataDAO.findByID(tbPersonalData.getPersonalId());//根据id查找原来的密码信息
		
		   if(SystemContext.passwdDecryption(oldPassword,TbPerson.getPassword())){
			   //如果输入的旧密码等于原来的密码，则修改密码信息
		tbPersonalData.setPassword(SystemContext.passwdEncryption(tbPersonalData.getPassword()));
		tbPersonalDataDAO.updatePassword(tbPersonalData);
		    }else{
			   i=1;
		    }
		   if(TbPerson.getFlagType()==1){//如果用户为导师，则同时修改User表对应的密码
			    String password=tbPersonalData.getPassword();
				SysUser sysUser = sysUserService.findByUserName(TbPerson.getPersonalNumber());
				//System.out.println("why"+SystemContext.passwdEncryption(password));
				sysUser.setUserPassword(SystemContext.passwdEncryption(password));
				sysUserDAO.update(sysUser);
				}
		
		return i;
		
	}
	
	/**
	 * 会员管理，导师管理修改
	 * @author 杨世宇
	 * @data 2017.03.24
	 */
	
	@Override
	public List<TbPersonalData> updateWeb(TbPersonalData tbPersonalData, File[] uploadFile,
				String[] uploadFileName, String[] imageType) {
			List<TbPersonalData> imageList = new ArrayList<TbPersonalData>();
			//保存图片路径
			String savePath = ServletActionContext.getRequest().getRealPath("/upload");
			if(null != uploadFile){
				for(int i = 0; i < uploadFile.length; i++){
					if(null != uploadFileName[i] &&  !"".equals(uploadFileName[i])){
						String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),uploadFileName[i].length());
						//获取当前时间戳
						String currentTime = System.currentTimeMillis()+"";
						String newName = currentTime+fileType;
//						System.out.println(newName+imageList);
						File saveFile = new File(savePath,newName);
//						TbPersonalData tbPersonalData = new TbPersonalData();
						tbPersonalData.setImage(newName);
//						userImage.setImageCode(currentTime);
						//设置图片路径为相对路径
//						userImage.setImagePath("/upload/"+newName);
//						userImage.setStatus("01");
//						String personalId = (String) ServletActionContext.getRequest().getSession().getAttribute("personalId");
//						if(null != personalId && !"".equals(personalId)){
//							//查找当前登录用户的userId
//							TbPersonalData user = tbPersonalDataService.findByPersonalId(personalId);
//							if(null != user){
//								userImage.setUserId(tbPersonalData.getPersonalId());
//								userImage.setSumitter(user.getPersonalId()); 
//							}
//						}
						//设置照片类型
//						userImage.setImageType(imageType[i]);
//						Timestamp time = new Timestamp(new Date().getTime());
//						userImage.setUploadTime(time);
//						imageList.add(userImage);
						try {
							FileUtil.copyFile(uploadFile[i], saveFile);
						} catch (IOException e) {
							e.printStackTrace();
						}
						//调用压缩图片
						zipImageFile(tbPersonalData,new File(savePath,newName),150,100);
					}
				}
			}
		//保存修改信息
		tbPersonalDataDAO.update(tbPersonalData);
		return imageList;
	}
	
	/**
	 * 删除用户
     * @author 杨世宇
	 * @Date 2017.03.22
	 */
	@Override
	public void delete(int personalId) {
//		sysUserRoleService.deleteUserRole(userId);
		//根据用户ID查询返回对象
		TbPersonalData tbPersonalData = findByPersonalIdWeb(personalId);
		//如果为导师，反向删除user表中的数据
		if(tbPersonalData.getFlagType() == 1){
			SysUser sysUser = sysUserService.findByUserName(tbPersonalData.getPersonalNumber());
			sysUserDAO.remove(sysUser);
			//System.out.println("delete"+sysUser.getUserName());
		}
		tbPersonalDataDAO.remove(tbPersonalData);
	}
	
	/**
	 * 根据用户Id查询用户信息
	 * @author 杨世宇
	 * @data 2017.03.24
	 * @return
	 */
	@Override
	public TbPersonalData findByPersonalIdWeb(int personalId) {
		return tbPersonalDataDAO.get(TbPersonalData.class,personalId);
	}
	/**
	 * 
	 * 根据personalName查询用户对象
	 * @author 杨世宇
	 * @data 2017.05.15
	 */
	public TbPersonalData findByPersonalNameWeb(String personalName){
		return tbPersonalDataDAO.findByPersonalNumber(personalName);
	}
	/**
	 * 
	 * 根据mobilePhone查询用户对象
	 * @author 杨世宇
	 * @data 2017.07.12
	 */
	public TbPersonalData fingByMobilePhone(String mobilePhone){
		return tbPersonalDataDAO.fingByMobilePhone(mobilePhone);
	}
	
	
	
	/**
	 * 修改头像-微信
	 * @author 杨世宇
	 * @date 2017.04.27
	 */
	public void changeImg(int personalId, File[] uploadFile, String[] uploadFileName, String[] imageType){
//		System.out.println("实现层");
		TbPersonalData tbPersonalData = findByPersonalIdWeb(personalId);
		//修改头像-调用修改代码
		updateWeb(tbPersonalData, uploadFile, uploadFileName, imageType);
	}
	
	
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	
	public TbPersonalData find(TbPersonalData tbPersonalData) {

		

		return  wxLoginDAO.findWxLoginByProperty("mobilePhone",tbPersonalData.getMobilePhone());
		
	}
	
	/**
	 * 根据用户Id查询用户信息
	 * @author 杨世宇
	 * @data 2017.03.24
	 * @return
	 */
	public TbPersonalData findById(int personalId){
		
		
		return tbPersonalDataDAO.get(TbPersonalData.class,personalId);
		
	}
	
	/**
	 * 更新
	 * @author 黄子珍
	 * @date 2017.03.23
	 */
	public void updatePayNotes(int personalId,String startTime,String endTime,int level){
		
		tbPersonalDataDAO.updatePayNotes(personalId,startTime,endTime,level);
	}
	
	
	public List<TbPersonalData> findTh(){
		
		
		return tbPersonalDataDAO.findTh();
		
	}
	
	public List<TbPersonalData> findThp(){
		
		
		return tbPersonalDataDAO.findThp();
		
	}
	
	public List<TbPersonalData> findMember(){
		
		
		return tbPersonalDataDAO.findMember();
		
	}
	
	
	public List<TbPersonalData> findByPersonalId(int personalId){
		
		
		return tbPersonalDataDAO.findByPersonalId(personalId);
		
	}
	
	
	/*@Override
	public ArrayList findByMemberId(List<TbPersonalData> tbPersonalDataList) {
		return tbPersonalDataDAO.findByMemberId(tbPersonalDataList);
	}*/



	/*@Override
	public List<TbPersonalData> findByMentorId(List<TbReadme> tbReadmeList) {
		return tbRegisterDAO.findByMentorId(tbReadmeList);
	}*/
	
	
	/**
	 * 添加个人信息-包括上传图片
	 * @author 杨世宇
	 * @date 2017.03.26
	 */
	public List<TbPersonalData> addWeb(TbPersonalData tbPersonalData, File[] uploadFile,
			String[] uploadFileName, String[] imageType) {
		List<TbPersonalData> imageList = new ArrayList<TbPersonalData>();
		String savePath = ServletActionContext.getRequest().getRealPath("/upload");
		if(null != uploadFile){
			for(int i = 0; i < uploadFile.length; i++){
				if(null != uploadFileName[i] &&  !"".equals(uploadFileName[i])){
					String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),uploadFileName[i].length());
					//获取当前时间戳
					String currentTime = System.currentTimeMillis()+"";
					String newName = currentTime+fileType;
					//System.out.println(newName+imageList);
					File saveFile = new File(savePath,newName);
//					TbPersonalData tbPersonalData = new TbPersonalData();
					tbPersonalData.setImage(newName);
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
					try {
						FileUtil.copyFile(uploadFile[i], saveFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
					//调用压缩图片代码
					zipImageFile(tbPersonalData,new File(savePath,newName),300,200);
				}
			}
		}else{
			tbPersonalData.setImage("default_img.png");
		}
//		System.out.println(savePath);
//		System.out.println(savePath);
		add(tbPersonalData);
		return imageList;
	}

	/**  
     * 根据设置的宽高等比例压缩图片文件，先保存原文件到服务器，再修改服务器中的图片  
     * @param oldFile  要进行压缩的文件  
     * @param width  宽度 //设置宽度时（高度传入0，等比例缩放）  
     * @param height 高度 //设置高度时（宽度传入0，等比例缩放）  
     * @author 杨世宇
     * @date 2017.04.18
     * @return 返回压缩后的文件的全路径  
     */    
    public  List<TbPersonalData>  zipImageFile(TbPersonalData tbPersonalData, File oldFile, int width, int height) {
    	
		List<TbPersonalData> imageList = new ArrayList<TbPersonalData>();
        if (oldFile != null) { 
        try { 
//        	System.out.println("newImg");
            /** 对服务器上的临时文件进行处理 */    
            Image srcFile = ImageIO.read(oldFile);    
            int w = srcFile.getWidth(null);    
            int h = srcFile.getHeight(null);    
            double bili;    
            if(width>0){    
                bili=width/(double)w;    
                height = (int) (h*bili);    
            }else{    
                if(height>0){    
                    bili=height/(double)h;    
                    width = (int) (w*bili);    
                }    
            }    
            //对图片路径，后缀名进行处理  
            String srcImgPath = oldFile.getAbsoluteFile().toString();  
           // System.out.println(srcImgPath);  
            String subfix = "jpg";  
            subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());  
  
            BufferedImage buffImg = null;   
            if(subfix.equals("png")){  
                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);  
            }else{  
                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
            }  
  
            //设置颜色，背景颜色等
            Graphics2D graphics = buffImg.createGraphics();  
            graphics.setBackground(new Color(255,255,255));  
            graphics.setColor(new Color(255,255,255));  
            graphics.fillRect(0, 0, width, height);  
            graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);    
  
            ImageIO.write(buffImg, subfix, new File(srcImgPath));
            
        } catch (FileNotFoundException e) {    
            e.printStackTrace();    
        } catch (IOException e) {    
            e.printStackTrace();    
        }   
    }

        return imageList;    
    }



    /**
     * 重置密码
     * @author 陆云秋
     * @Data 2017.05.06
     */
    @Override
	public int resetPwd(int  personalId) {
    	int i = 0;
    	//System.out.println("?????????");
    	TbPersonalData tbPersonalData = findByPersonalIdWeb(personalId);
    
    	tbPersonalData.setPassword("0774123");
    	tbPersonalData.setPassword(SystemContext.passwdEncryption(tbPersonalData.getPassword()));
		tbPersonalDataDAO.update(tbPersonalData);
    	
		//System.out.println("?????????");
		return i;
	}
    /**
     * 重置导师密码
     * @author 莫然源
     * @Data 2017.05.15
     */
    @Override
	public void changePwd(int  personalId) {
    	TbPersonalData tbPersonalData = findByPersonalIdWeb(personalId);
    	if(tbPersonalData.getFlagType()==1){
        tbPersonalData.setPassword(SystemContext.passwdEncryption("0774123"));
		tbPersonalDataDAO.update(tbPersonalData);
		SysUser sysUser = sysUserService.findByUserName(tbPersonalData.getPersonalNumber());
		sysUser.setUserPassword("0774123");
		sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
		sysUserDAO.update(sysUser);
    	}else{
    		tbPersonalData.setPassword("0774123");
        	tbPersonalData.setPassword(SystemContext.passwdEncryption(tbPersonalData.getPassword()));
    		tbPersonalDataDAO.update(tbPersonalData);
    	}
    		
	}
    /**
     * 导师服务统计  
     * @author 陈洁
     * @Data 2017.05.15
     */
    public Result<TbPersonalData> findAllMentor(TbPersonalData tbPersonalData,int page, int row){
    	return tbPersonalDataDAO.findAllMentor(tbPersonalData,page,row);
    }
    /**
     * 导师服务统计   Excel导出
     * @author 陈洁
     * @Data 2017.05.15
     */
    public List<TbPersonalData> findAllMentorExcel(TbPersonalData tbPersonalData){
    	return tbPersonalDataDAO.findAllMentorExcel(tbPersonalData);
    }
}
