package com.gxuwz.KeepHealth.business.service;

import com.gxuwz.KeepHealth.business.dao.TbFormulaDao;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.core.pagination.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 念数机配方Service实现类
 * @author yechengting
 *@version 2019.2.16
 */
@Service("tbFormulaService")
public class TbFormulaServiceImpl implements TbFormulaService {
	@Autowired
	TbFormulaDao tbFormulaDao;

	/**
	 * 查询所有配方信息（包含条件查询）
	 * @param string 模糊查询字段
	 * @param page 页数
	 * @param row 每页个数
	 * @return
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public Result<TbFormula> queryFormulaList(String string, int page, int row) {
		//将配方内容拆分处理
		Result<TbFormula> tbFormulaResult = tbFormulaDao.queryFormulaList(string, page, row);
		List<TbFormula> tbFormulaList=new ArrayList<TbFormula>();
		for (int i=0;i<tbFormulaResult.getData().size();i++){
			TbFormula formula = tbFormulaResult.getData().get(i);
			String formulaContext = formula.getFormulaContext();
			String replace = formulaContext.replace(",", "<br>");
			formula.setFormulaContext(replace);
			tbFormulaList.add(formula);
		}
		tbFormulaResult.setData(tbFormulaList);
		return tbFormulaResult;
	}

	/**
	 * 通过Id查询指定配方
	 * @param formulaId
	 * @return
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public TbFormula queryFormulaById(Integer formulaId) {		
		return tbFormulaDao.queryFormulaById(formulaId);
	}

	/**
	 *删除一整个配方
	 * @param formulaId
	 * @return 删除失败0 删除成功1
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public String deleteFormula(Integer formulaId) {
		boolean flag=false;
		String actionState = "0";
		//执行删除
		flag=tbFormulaDao.deleteFormula(formulaId);		
		   if(flag) {
				actionState="1";		
			}
			
		return actionState;
	}

	/**
	 * actionState 上线成功2失败3，下线成功4失败5
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public String changeState(Integer formulaId) {
		String actionState = "2";
		//根据ID查询当前配方信息
		TbFormula formula = queryFormulaById(formulaId);
		//抽取配方状态
		int state=formula.getFormulaState();
		//配方下线状态0
		if(state==0) {
			formula.setFormulaState(1);
		}else {
			formula.setFormulaState(0);
			actionState="4";
		}
		try {
			tbFormulaDao.update(formula);
		} catch (Exception e) {
			if(actionState=="4") {
				actionState="5";
			}else {
				actionState="3";
			}
			e.printStackTrace();
			
		}
		return actionState;
	}

	/**
	 * 添加配方
	 * @param tbFormula
	 * @return 配方雷同2 配方规则不规范3 删除成功1 删除失败0
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public String addFormula(TbFormula tbFormula) {
		String allFormulaContext=tbFormula.getFormulaContext();
		boolean flag=false;
		String actionState = "0";
		//配方内容规则二次检查
		try {
			String formulaContext=tbFormula.getFormulaContext();
			String[] split = formulaContext.split(",");
			if (split.length<2) {
				split=formulaContext.split("，");
			}else{}
		/*	for (int i=0;i<split.length;i++){
				//循环规则检查和雷同检查
				flag=false;
				flag=DetectionOneToEight(split[i]);
				if(flag){
					flag=false;
					TbFormula sampleFormula=tbFormula;
					sampleFormula.setFormulaContext(split[i]);
					flag=tbFormulaDao.queryFormulaByContext(sampleFormula);
					if(flag){
						flag=true;
					}else {
						actionState="2";
						break;
					}
				}else{
					actionState="3";
					break;
				}
			}*/
		}catch (Exception e){
			e.printStackTrace();
		}
			if(true){
				flag=false;
				//规则通过，进行数据规范化
				tbFormula.setFormulaContext(allFormulaContext);
				String replace = tbFormula.getFormulaContext().replace("，", ",");
				String replace1 = replace.replace("•", "·");
				String replace2 = replace1.replace("`", "·");
				tbFormula.setFormulaContext(replace2);
				//组装entity未填信息
				tbFormula.setFormulaState(0);
				//执行添加
				try {
					tbFormulaDao.save(tbFormula);
					flag=true;
				} catch (Exception e) {
					flag=false;
					e.printStackTrace();
				}
				//判断更新结果
				if(flag) {
					actionState="1";		
				}
			}
		return actionState;
	}

	/**
	 * @Author zuofengwei
	 * @Description 根据配方类型查询配方集合
	 * @Date 2019/4/14 17:00
	 * @param formulaType
	 * @return java.util.List<com.gxuwz.KeepHealth.business.entity.TbFormula>
	 **/
	@Override
	public List<TbFormula> queryTbFormulaListByformulaType(String formulaType) {

		return tbFormulaDao.getHibernateTemplate().find("from TbFormula where formulaType='"+formulaType+"' and formulaState = 1 ");

	}

	/**
	 * @Author zuofengwei
	 * @Description 通过配方的症状和详情获取配方内容
	 * @Date 2019/4/14 17:04
	 * @param formulaSymptom
	 * @param formulaSymptomDetails
	 * @return java.lang.String
	 **/
	@Override
	public String queryFormulaContext(String formulaSymptom, String formulaSymptomDetails) {
		return tbFormulaDao.queryFormulaContext(formulaSymptom,formulaSymptomDetails);
	}


	/**
	 * 更改配方
	 * @param tbFormula
	 * @return 配方雷同2 配方规则不规范3 更新成功1 更新失败0
	 * @author 叶城廷
	 * @version 2019.04.04
	 */
	@Override
	public String updateFormula(TbFormula tbFormula) {
		String allFormulaContext=tbFormula.getFormulaContext();
		boolean flag=false;
		String actionState = "0";
		//配方内容规则二次检查
		try {
			String formulaContext=tbFormula.getFormulaContext();
			String[] split = formulaContext.split(",");
			if (split.length<2) {
				split=formulaContext.split("，");
			}else{}
			/*for (int i=0;i<split.length;i++){
				//循环规则检查和雷同检查
				flag=false;
				flag=DetectionOneToEight(split[i]);
				if(flag){
					flag=false;
					TbFormula sampleFormula=tbFormula;
					sampleFormula.setFormulaContext(split[i]);
					flag=tbFormulaDao.queryFormulaByContext(sampleFormula);
					if(flag){
						flag=true;
					}else {
						actionState="2";
						break;
					}
				}else{
					actionState="3";
					break;
				}
			}*/
		}catch (Exception e){
			e.printStackTrace();
		}
		if(true){
			flag=false;
			//规则通过，进行数据规范化
			tbFormula.setFormulaContext(allFormulaContext);
			String replace = tbFormula.getFormulaContext().replace("，", ",");
			String replace1 = replace.replace("•", "·");
			String replace2 = replace1.replace("`", "·");
			tbFormula.setFormulaContext(replace2);
			//执行更新
			try {
				tbFormulaDao.update(tbFormula);
				flag=true;
			} catch (Exception e) {
				flag=false;
				e.printStackTrace();
			}
			//判断更新结果
			if(flag) {
				actionState="1";
			}
		}
		return actionState;
	}

	/**
	 * 检查字符串数组中的每个字符是否全为0-8
	 * @param str 被检查的字符串
	 * @return 全为数字返回true，否则返回false;
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private boolean DetectionOneToEight(String str) {
		String [] strList =new String[str.length()];
	     for(int i=0;i<str.length();i++) {
	    	 strList[i]=str.substring(i,i+1);	    	 
	     }
		
		boolean flag=true;
		Pattern pattern = Pattern.compile("[0-8]*"); 		  
		for (int i = 0; i < strList.length; i++) {
		//System.out.println("正在检测第"+i+"个字符");
	    Matcher matcher = pattern.matcher(strList[i]);
        if(!matcher.matches()) {
        	//如不为数字1-8，则判断是否为
			if(strList[i].equals("·")){

			}else if(strList[i].equals("`")){

			}else if(strList[i].equals("•")){

			}else {
				flag=false;
				//System.out.println("第"+i+"个字符不为数字或者点←");
			}
          }
		}
		//System.out.println("检测完成");
		return flag;
	}


}
