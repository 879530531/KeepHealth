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
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.TbTeacherDao;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;

@Service("tbTeacherService")
public class TbTeacherServiceImpl implements TbTeacherService {
	@Autowired
	TbTeacherDao tbTeacherDao;

	@Override
	public Result<TbTeacher> queryTeacherList(String string, int page, int row) {
		// TODO Auto-generated method stub
		return tbTeacherDao.queryTeacherList(string, page, row);
	}

	@Override
	public Result<TbTeacher> find(String string, int page, int row) {
		// System.out.println("8888"+tbPersonalData.getMobilePhone());
		return tbTeacherDao.find(string, page, row);
	}

	/**
	 * 添加用户角色
	 * 
	 * @author 陈紫丽
	 * @date 2019.03.07
	 */
	@Override
	public void add(TbTeacher tbTeacher) {
		// 密码加密
		tbTeacher.setTeacherPasswork(SystemContext.passwdEncryption(tbTeacher.getTeacherPasswork()));

		tbTeacherDao.save(tbTeacher);
	}

	/**
	 * 添加个人信息-包括上传图片
	 * 
	 * @author 陈紫丽
	 * @date 2019.03.10
	 */
	@Override
	public List<TbTeacher> addWeb(TbTeacher tbTeacher, File[] uploadFile, String[] uploadFileName, String[] imageType) {
		List<TbTeacher> imageList = new ArrayList<TbTeacher>();
		String savePath = ServletActionContext.getRequest().getRealPath("/upload");
		if (null != uploadFile) {
			for (int i = 0; i < uploadFile.length; i++) {
				if (null != uploadFileName[i] && !"".equals(uploadFileName[i])) {
					String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),
							uploadFileName[i].length());
					// 获取当前时间戳
					String currentTime = System.currentTimeMillis() + "";
					String newName = currentTime + fileType;
					// System.out.println(newName+imageList);
					File saveFile = new File(savePath, newName);
					// TbPersonalData tbPersonalData = new TbPersonalData();
					tbTeacher.setImage(newName);
					// System.out.println("newName"+newName);
					// String ImagePath = savePath + newName;
					// userImage.setImageCode(currentTime);
					// 设置图片路径为相对路径
					// userImage.setImagePath("/upload/"+newName);
					//// userImage.setStatus("01");
					// String personalId = (String)
					// ServletActionContext.getRequest().getSession().getAttribute("personalId");
					// if(null != personalId && !"".equals(personalId)){
					// //查找当前登录用户的userId
					// TbPersonalData user =
					// tbPersonalDataService.findByPersonalId(personalId);
					// if(null != user){
					// userImage.setUserId(tbPersonalData.getPersonalId());
					// userImage.setSumitter(user.getPersonalId());
					// }
					// }
					// //设置照片类型
					// userImage.setImageType(imageType[i]);
					// Timestamp time = new Timestamp(new Date().getTime());
					// userImage.setUploadTime(time);
					// imageList.add(userImage);
					try {
						FileUtil.copyFile(uploadFile[i], saveFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
					// 调用压缩图片代码
					zipImageFile(tbTeacher, new File(savePath, newName), 300, 200);
				}
			}
		} else {
			tbTeacher.setImage("default_img.png");
		}
		// System.out.println(savePath);
		// System.out.println(savePath);
		add(tbTeacher);
		return imageList;
	}

	/**
	 * 根据设置的宽高等比例压缩图片文件，先保存原文件到服务器，再修改服务器中的图片
	 * 
	 * @param oldFile
	 *            要进行压缩的文件
	 * @param width
	 *            宽度 //设置宽度时（高度传入0，等比例缩放）
	 * @param height
	 *            高度 //设置高度时（宽度传入0，等比例缩放）
	 * @author 陈紫丽
	 * @date 2019.03.10
	 * @return 返回压缩后的文件的全路径
	 */
	@Override
	public List<TbTeacher> zipImageFile(TbTeacher tbTeacher, File oldFile, int width, int height) {
		List<TbTeacher> imageList = new ArrayList<TbTeacher>();
		if (oldFile != null) {
			try {
				// System.out.println("newImg");
				/** 对服务器上的临时文件进行处理 */
				Image srcFile = ImageIO.read(oldFile);
				int w = srcFile.getWidth(null);
				int h = srcFile.getHeight(null);
				double bili;
				if (width > 0) {
					bili = width / (double) w;
					height = (int) (h * bili);
				} else {
					if (height > 0) {
						bili = height / (double) h;
						width = (int) (w * bili);
					}
				}
				// 对图片路径，后缀名进行处理
				String srcImgPath = oldFile.getAbsoluteFile().toString();
				// System.out.println(srcImgPath);
				String subfix = "jpg";
				subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".") + 1, srcImgPath.length());

				BufferedImage buffImg = null;
				if (subfix.equals("png")) {
					buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
				} else {
					buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				}

				// 设置颜色，背景颜色等
				Graphics2D graphics = buffImg.createGraphics();
				graphics.setBackground(new Color(255, 255, 255));
				graphics.setColor(new Color(255, 255, 255));
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
	 * 根据用户Id查询用户信息
	 * 
	 * @author 陈紫丽
	 * @data 2019.03.10
	 * @return
	 */
	@Override
	public TbTeacher findByTeacherIdWeb(int teacherId) {
		return tbTeacherDao.get(TbTeacher.class, teacherId);
	}

	@Override
	public boolean checkTeacherPhone(String teacherPhone) {
		boolean result = false;
		// 将结果存入模型中，如果不为空，则存在用户编号
		List<TbTeacher> tbTeacher = tbTeacherDao.checkTeacherPhone(teacherPhone);
		if (null != tbTeacher && 0 < tbTeacher.size()) {
			result = true;
		}
		return result;
	}

	/**
	 * 老师管理修改
	 * 
	 * @author 陈紫丽
	 * @data 2019.03.10
	 */

	@Override
	public List<TbTeacher> updateWeb(TbTeacher tbTeacher, File[] uploadFile, String[] uploadFileName,
			String[] imageType) {
		List<TbTeacher> imageList = new ArrayList<TbTeacher>();
		// 保存图片路径
		String savePath = ServletActionContext.getRequest().getRealPath("/upload");
		if (null != uploadFile) {
			for (int i = 0; i < uploadFile.length; i++) {
				if (null != uploadFileName[i] && !"".equals(uploadFileName[i])) {
					String fileType = uploadFileName[i].substring(uploadFileName[i].indexOf("."),
							uploadFileName[i].length());
					// 获取当前时间戳
					String currentTime = System.currentTimeMillis() + "";
					String newName = currentTime + fileType;
					// System.out.println(newName+imageList);
					File saveFile = new File(savePath, newName);
					// TbPersonalData tbPersonalData = new TbPersonalData();
					tbTeacher.setImage(newName);
					// userImage.setImageCode(currentTime);
					// 设置图片路径为相对路径
					// userImage.setImagePath("/upload/"+newName);
					// userImage.setStatus("01");
					// String personalId = (String)
					// ServletActionContext.getRequest().getSession().getAttribute("personalId");
					// if(null != personalId && !"".equals(personalId)){
					// //查找当前登录用户的userId
					// TbPersonalData user =
					// tbPersonalDataService.findByPersonalId(personalId);
					// if(null != user){
					// userImage.setUserId(tbPersonalData.getPersonalId());
					// userImage.setSumitter(user.getPersonalId());
					// }
					// }
					// 设置照片类型
					// userImage.setImageType(imageType[i]);
					// Timestamp time = new Timestamp(new Date().getTime());
					// userImage.setUploadTime(time);
					// imageList.add(userImage);
					try {
						FileUtil.copyFile(uploadFile[i], saveFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
					// 调用压缩图片
					zipImageFile(tbTeacher, new File(savePath, newName), 150, 100);
				}
			}
		}
		// 保存修改信息
		tbTeacherDao.update(tbTeacher);
		return imageList;
	}

	// @Override
	// public void changeImg(int teacherId, File[] uploadFile, String[]
	// uploadFileName, String[] imageType) {
	// System.out.println("实现层");
	// TbTeacher tbTeacher = findByTeacherIdWeb(teacherId);
	// //修改头像-调用修改代码
	// updateWeb(tbTeacher, uploadFile, uploadFileName, imageType);
	// }

	//
	@Override
	public Result<TbTeacher> queryTeacherListByQueryText(String query, int page, int row) {
		if (query == null) {
			query = "";
		}

		return tbTeacherDao.queryTeacherListByQueryText(query, page, row);
	}

	/**
	 * 验证老师用户名
	 * 
	 * @param tbTeacher
	 *            被验证老师
	 * @author 陈紫丽
	 * @version 2019.03.09（3.20）
	 * @return
	 */
	@Override
	public TbTeacher queryTeacher(TbTeacher tbTeacher) {
		// boolean flag=false;
		try {
			TbTeacher teacher = tbTeacherDao.findByTeacherPhone(tbTeacher.getTeacherPhone());
			// System.out.println(Teacher.getTeacherPasswork());
			// System.out.println(Teacher.getTeacherPhone());
			// if (Teacher==null){
			// flag=false;
			// }else{
			// flag=true;
			// }
			return teacher;
		} catch (Exception e) {
			// flag=false;
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检查老师是否首次登录，如首次登录补齐微信唯一码
	 * 
	 * @param tbTeacher
	 *            被检查老师
	 *            微信唯一码
	 * @author 陈紫丽
	 * @version 2019.03.09（3.20）
	 * @return
	 * 
	 */
	@Override
	public boolean queryFirstLogin(TbTeacher tbTeacher, TbConsumer tbConsumer) {
		if(tbTeacher.getOpenId()==null||tbTeacher.getOpenId().equals("")){
			String newOpenId = tbConsumer.getOpenId();
			tbTeacher.setOpenId(newOpenId);
			tbTeacherDao.update(tbTeacher);
		}
        return true;
	}

	/**
	 * 重置老师密码
	 * 
	 * @author 陈紫丽
	 * @Data 2019.03.10
	 */
	@Override
	public void changePwd(int teacherId) {
		TbTeacher tbTeacher = findByTeacherIdWeb(teacherId);
		if (tbTeacher.getTeacherLevel() == 1) {
			tbTeacher.setTeacherPasswork(SystemContext.passwdEncryption("0774123"));
			tbTeacherDao.update(tbTeacher);

		} else {
			tbTeacher.setTeacherPasswork("0774123");
			tbTeacher.setTeacherPasswork(SystemContext.passwdEncryption(tbTeacher.getTeacherPasswork()));
			tbTeacherDao.update(tbTeacher);
		}

	}

	@Override
	public List<TbTeacher> queryTeacher() {

		List<TbTeacher> list = tbTeacherDao.getHibernateTemplate().find("from TbTeacher where isDelete != '1' order by topId desc");
		return list;
	}

	@Override
	public TbTeacher findByTeacherId(Integer teacherId) {
		return tbTeacherDao.getByTeacherId(teacherId);
	}

	/**
	 * @Author zuofengwei
	 * @Description 获得所有老师中topId的最大值
	 * @Date 2019/5/9 15:27
	 * @param
	 * @return int
	 **/
	@Override
	public int getMaxNumber() {
		return tbTeacherDao.getMaxNumber();
	}

	/**
	 * @Author zuofengwei
	 * @Description 更改topid置顶老师
	 * @Date 2019/5/9 15:43
	 * @param tbTeacher
	 * @param currMaxNum
	 * @return void
	 **/
	@Override
	public void updateTopId(TbTeacher tbTeacher, int currMaxNum) {
		tbTeacher.setTopId(currMaxNum);
		tbTeacherDao.update(tbTeacher);
	}

	/**
	 * @Author zuofengwei
	 * @Description 更新老师
	 * @Date 2019/5/9 16:03
	 * @param teacher
	 * @return void
	 **/
	@Override
	public void updateTeacher(TbTeacher teacher) {
		tbTeacherDao.update(teacher);
	}

    @Override
    public int getMinNumber() {
        return tbTeacherDao.getMinNumber();
    }

    @Override
    public int getTopId(Integer teacherId) {

        return tbTeacherDao.getByTeacherId(teacherId).getTopId();
    }

    /**
	 * 微信端修改密码
	 * 
	 * @author 陈紫丽
	 * @data 2019.03.30
	 */
	@Override
	public int updatePassword(TbTeacher tbTeacher, String oldPassword, String teacherPasswork) {

		// 更新角色密码
		int i = 0;// 修改状态。若等于1，则修改失败，等于其他则修改成功
		TbTeacher TbTeache1 = null;
		TbTeache1 = tbTeacherDao.findByID(tbTeacher.getTeacherId());// 根据id查找原来的密码信息

		if (SystemContext.passwdDecryption(oldPassword, TbTeache1.getTeacherPasswork())) {
			// 如果输入的旧密码等于原来的密码，则修改密码信息
			tbTeacher.setTeacherPasswork(SystemContext.passwdEncryption(teacherPasswork));
			tbTeacherDao.updateTeacherPasswork(tbTeacher);
		} else {
			i = 1;
		}
		return i;

	}

	@Override
	public void delete(int teacherId) {
		
		tbTeacherDao.list1(teacherId);
		
	}

	@Override
	public List<TbTeacher> findByTeacherName() {
		return tbTeacherDao.getByTeacherName();
		 
	}

	@Override
	public TbTeacher findByTeacherNameLike(String teacherName) {
		return tbTeacherDao.getByTeacherNameLike(teacherName);
	}

}
