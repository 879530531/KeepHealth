package com.gxuwz.KeepHealth.util;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.lang.reflect.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.gxuwz.KeepHealth.business.entity.*;
import org.apache.poi.hssf.record.formula.functions.Time;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.ServletActionContext;

import static org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING;

@SuppressWarnings("deprecation")
public class ExportExcel<T> {

	public void exportExcel(Collection<T> dataset, OutputStream out) {
		
        exportExcel("测试POI导出EXCEL文档", null, dataset, out, "yyyy-MM-dd");
    }

    public void exportExcel(String[] headers, Collection<T> dataset,
            OutputStream out) {
        exportExcel("测试POI导出EXCEL文档", headers, dataset, out, "yyyy-MM-dd");
    }

    public void exportExcel(String[] headers, Collection<T> dataset,
            OutputStream out, String pattern) {
        exportExcel("测试POI导出EXCEL文档", headers, dataset, out, pattern);
    }

    HttpServletResponse response = ServletActionContext.getResponse();
    /**改成返回一个HSSFWorkbook 对象   pdx**/
    public HSSFWorkbook exportExcel2(String abc ,String[] headers, Collection<T> dataset, String pattern,String type) {
    	// 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格,并命名文件名称
        HSSFSheet sheet = workbook.createSheet(abc);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.WHITE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.BLACK.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.WHITE.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);

        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        // 遍历集合数据，产生数据行
        Iterator<T> it = dataset.iterator();
        Iterator<T> it2 = dataset.iterator(); //用这个取，如果用it的话循环取值的时候就会少一行。
        
        // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
        /**获取一个bean对象的反射实体,因为一个对象包含了所有属性字段了,所以获取一个可以了**/
        T tt = (T) it2.next();
        Field[] fields = tt.getClass().getDeclaredFields();
        String fieldName="";
        Field field=null;
        /**定义一个经过反射过滤后的字段**/
        List<String> listss=new ArrayList<String>();
        for(int k=0;k<3;k++)
        {
        	field = fields[k];
        	fieldName = field.getName();
        	 /**过滤掉bean实体中含有 ALIAS 和 FORMAT开头的属性,因为代码生成器生成的属性有这几个开头,去掉ID**/
        	
        	/**箱柜信息表**/
        	if("qrcodeInfo".equals(type))
        	{
       			listss.add(fieldName);
        	}
        }
        
        int index = 0;
       
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            T t = (T) it.next();
            
            for (short i = 0; i < listss.size(); i++) {
            	
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(style2);
                String getMethodName = "get"
                        + listss.get(i).substring(0, 1).toUpperCase()
                        + listss.get(i).substring(1);
               // System.out.println("getMethodName"+getMethodName);
                try {
                    Class tCls = t.getClass();
                    Method getMethod = tCls.getMethod(getMethodName,
                            new Class[] {});
                    Object value = getMethod.invoke(t, new Object[] {});
                   // System.out.println("value----------"+value);
                    // 判断值的类型后进行强制类型转换
                    String textValue = null;
                    // if (value instanceof Integer) {
                    // int intValue = (Integer) value;
                    // cell.setCellValue(intValue);
                    // } else if (value instanceof Float) {
                    // float fValue = (Float) value;
                    // textValue = new HSSFRichTextString(
                    // String.valueOf(fValue));
                    // cell.setCellValue(textValue);
                    // } else if (value instanceof Double) {
                    // double dValue = (Double) value;
                    // textValue = new HSSFRichTextString(
                    // String.valueOf(dValue));
                    // cell.setCellValue(textValue);
                    // } else if (value instanceof Long) {
                    // long longValue = (Long) value;
                    // cell.setCellValue(longValue);
                    // }
                    if (value instanceof Boolean) {
                        boolean bValue = (Boolean) value;
                        textValue = "男";
                        if (!bValue) {
                            textValue = "女";
                        }
                    } else if (value instanceof Date) {
                        Date date = (Date) value;
                        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                        textValue = sdf.format(date);
                    } else if (value instanceof byte[]) {
                        // 有图片时，设置行高为60px;
                        row.setHeightInPoints(60);
                        // 设置图片所在列宽度为80px,注意这里单位的一个换算
                        sheet.setColumnWidth(i, (short) (35.7 * 80));
                        // sheet.autoSizeColumn(i);
                        byte[] bsValue = (byte[]) value;
                        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0,
                                1023, 255, (short) 6, index, (short) 6, index);
                        anchor.setAnchorType(2);
                        patriarch.createPicture(anchor, workbook.addPicture(
                                bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
                    } else {
                        // 其它数据类型都当作字符串简单处理
                    	/**如果不为空才转换2014-3-21**/
                    	if(null!=value)
                    	{
                    	 textValue = value.toString();
                    	}
                    }
                    // 如果不是图片数据，就利用正则表达式判断textValue是否全部由数字组成
                    if (textValue != null) {
                        Pattern p = Pattern.compile("^//d+(//.//d+)?$");   
                        Matcher matcher = p.matcher(textValue);
                        if (matcher.matches()) {
                            // 是数字当作double处理
                            cell.setCellValue(Double.parseDouble(textValue));
                        } else {
                            HSSFRichTextString richString = new HSSFRichTextString(
                                    textValue);
                            HSSFFont font3 = workbook.createFont();
                            font3.setColor(HSSFColor.BLACK.index);
                            richString.applyFont(font3);
                            cell.setCellValue(richString);
                        }
                    }
                } catch (SecurityException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } finally {
                    // 清理资源
                }
            }
        }
        return workbook;
        
    }
    
    
    
    /**
     * 这是一个通用的方法，利用了JAVA的反射机制，可以将放置在JAVA集合中并且符号一定条件的数据以EXCEL 的形式输出到指定IO设备上
     * 
     * @param title
     *            表格标题名
     * @param headers
     *            表格属性列名数组
     * @param dataset
     *            需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
     *            javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
     * @param out
     *            与输出设备关联的流对象，可以将EXCEL文档导出到本地文件或者网络中
     * @param pattern
     *            如果有时间数据，设定输出格式。默认为"yyy-MM-dd"
     */
    @SuppressWarnings("unchecked")
    public void exportExcel(String title, String[] headers,
            Collection<T> dataset, OutputStream out, String pattern) {
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格,并命名文件名称
        HSSFSheet sheet = workbook.createSheet(title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.WHITE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.BLACK.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.WHITE.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);

        // 声明一个画图的顶级管理器
       /* HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");*/

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        // 遍历集合数据，产生数据行
        Iterator<T> it = dataset.iterator();
        int index = 0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            T t = (T) it.next();
            System.out.println("1111111111111111");
            // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
            Field[] fields = t.getClass().getDeclaredFields();
            System.out.println("222222222222");
            for (short i = 0; i < fields.length; i++) {
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(style2);
                Field field = fields[i];
                String fieldName = field.getName();
                System.out.println("4444444444444444"+fieldName);
                String getMethodName = "get"
                        + fieldName.substring(0, 1).toUpperCase()
                        + fieldName.substring(1);
                System.out.println("getMethodName---------"+getMethodName);
                try {
                    Class tCls = t.getClass();
                    Method getMethod = tCls.getMethod(getMethodName,
                            new Class[] {});
                    Object value = getMethod.invoke(t, new Object[] {});
                    // 判断值的类型后进行强制类型转换
                    String textValue = null;
                    // if (value instanceof Integer) {
                    // int intValue = (Integer) value;
                    // cell.setCellValue(intValue);
                    // } else if (value instanceof Float) {
                    // float fValue = (Float) value;
                    // textValue = new HSSFRichTextString(
                    // String.valueOf(fValue));
                    // cell.setCellValue(textValue);
                    // } else if (value instanceof Double) {
                    // double dValue = (Double) value;
                    // textValue = new HSSFRichTextString(
                    // String.valueOf(dValue));
                    // cell.setCellValue(textValue);
                    // } else if (value instanceof Long) {
                    // long longValue = (Long) value;
                    // cell.setCellValue(longValue);
                    // }
                    if (value instanceof Boolean) {
                        boolean bValue = (Boolean) value;
                        textValue = "男";
                        if (!bValue) {
                            textValue = "女";
                        }
                    } else if (value instanceof Date) {
                        Date date = (Date) value;
                        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                        textValue = sdf.format(date);
                    } else if (value instanceof byte[]) {
                        // 有图片时，设置行高为60px;
                        row.setHeightInPoints(60);
                        // 设置图片所在列宽度为80px,注意这里单位的一个换算
                        sheet.setColumnWidth(i, (short) (35.7 * 80));
                        // sheet.autoSizeColumn(i);
                        byte[] bsValue = (byte[]) value;
                        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0,
                                1023, 255, (short) 6, index, (short) 6, index);
                        anchor.setAnchorType(2);
                       /* patriarch.createPicture(anchor, workbook.addPicture(
                                bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));*/
                    } else {
                        // 其它数据类型都当作字符串简单处理
                        textValue = value.toString();
                    }
                    // 如果不是图片数据，就利用正则表达式判断textValue是否全部由数字组成
                    if (textValue != null) {
                        Pattern p = Pattern.compile("^//d+(//.//d+)?$");   
                        Matcher matcher = p.matcher(textValue);
                        if (matcher.matches()) {
                            // 是数字当作double处理
                            cell.setCellValue(Double.parseDouble(textValue));
                        } else {
                            HSSFRichTextString richString = new HSSFRichTextString(
                                    textValue);
                            HSSFFont font3 = workbook.createFont();
                            font3.setColor(HSSFColor.BLUE.index);
                            richString.applyFont(font3);
                            cell.setCellValue(richString);
                        }
                    }
                } catch (SecurityException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } finally {
                    // 清理资源
                }
            }

        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    
   /* public static void main(String[] args) throws IOException {

        // 测试学生

        ExportExcel<Student> ex = new ExportExcel<Student>();

        String[] headers = { "学号", "姓名", "年龄", "性别", "出生日期" };

        List<Student> dataset = new ArrayList<Student>();

        dataset.add(new Student(10000001, "张三", 20, true, new Date()));

        dataset.add(new Student(20000002, "李四", 24, false, new Date()));

        dataset.add(new Student(30000003, "王五", 22, true, new Date()));

        // 测试图书

           OutputStream out = new FileOutputStream("E://a.xls");


           ex.exportExcel(headers, dataset, out);
          // ex.exportExcel2("箱柜信息表",headers, dataset,"yyyy-MM-dd" );


           out.close();

           JOptionPane.showMessageDialog(null, "导出成功!");

           System.out.println("excel导出成功！");

        } 


*/
    //导师服务记录     导出Excel.
	public void ExportTeacherExcel(List<TbPersonalData> tbPersonalDataList,List<MentorServicesStatistics> mentorServicesStatisticsList,List<listserviceNumber> listserviceNumberList){
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet();
         // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 20);
            // 生成一个样式
            HSSFCellStyle style = workbook.createCellStyle();
            // 设置这些样式
            /*style.setFillForegroundColor(HSSFColor.WHITE.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);*/
            // 生成一个字体
            HSSFFont font = workbook.createFont();
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 12);// 设置字体大小
            font.setFontName("宋体");
            
            HSSFCellStyle headstyle =workbook.createCellStyle();    
            headstyle.setFont(font);    
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中    
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中    
            headstyle.setLocked(true);    
            headstyle.setWrapText(true);// 自动换行 
            // 把字体应用到当前的样式
            style.setFont(font);
            // 生成并设置另一个样式
            HSSFCellStyle style2 = workbook.createCellStyle();
           /* style2.setFillForegroundColor(HSSFColor.WHITE.index);
            style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);*/
            // 生成另一个字体
            HSSFFont font2 = workbook.createFont();
            font2.setFontHeightInPoints((short) 15);// 设置字体大小
            font2.setFontName("宋体");
            font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
            // 把字体应用到当前的样式
            style2.setFont(font2);
            HSSFCellStyle headstyle1 =workbook.createCellStyle();    
            headstyle1.setFont(font2);    
            headstyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中    
            headstyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中    
            headstyle1.setLocked(true);    
            headstyle1.setWrapText(true);// 自动换行 
            HSSFRow row_title = sheet.createRow(0);
            row_title.setRowStyle(style2);//设置row_title样式
            HSSFCell cell_title1 = row_title.createCell(0);
            HSSFCell cell_title2 = row_title.createCell(1);
            HSSFCell cell_title3 = row_title.createCell(2);
            HSSFCell cell_title4 = row_title.createCell(3);
            HSSFCell cell_title5 = row_title.createCell(4);
            HSSFCell cell_title6 = row_title.createCell(5);
            HSSFCell cell_title7 = row_title.createCell(6);
            HSSFCell cell_title8 = row_title.createCell(7);
            HSSFCell cell_title9 = row_title.createCell(8);
            cell_title1.setCellValue("序号");
            cell_title1.setCellStyle(headstyle1);
            cell_title2.setCellValue("导师编号");
            cell_title2.setCellStyle(headstyle1);
            cell_title3.setCellValue("导师姓名");
            cell_title3.setCellStyle(headstyle1);
            cell_title4.setCellValue("服务总数量");
            cell_title4.setCellStyle(headstyle1);
            cell_title5.setCellValue("差");
            cell_title5.setCellStyle(headstyle1);
            cell_title6.setCellValue("一般");
            cell_title6.setCellStyle(headstyle1);
            cell_title7.setCellValue("满意");
            cell_title7.setCellStyle(headstyle1);
            cell_title8.setCellValue("很满意");
            cell_title8.setCellStyle(headstyle1);
            cell_title9.setCellValue("非常满意");
            cell_title9.setCellStyle(headstyle1);
           	int size = tbPersonalDataList.size();
           	int s = 0;
           	int k = 0;
            for(int i = 0; i < size;i++){
        	HSSFRow row = sheet.createRow(i+1);
        	row.setRowStyle(style);//设置row样式
            HSSFCell cell1 = row.createCell(0);
            HSSFCell cell2 = row.createCell(1);
            HSSFCell cell3 = row.createCell(2);
            HSSFCell cell4 = row.createCell(3);
            HSSFCell cell5 = row.createCell(4);
            HSSFCell cell6 = row.createCell(5);
            HSSFCell cell7 = row.createCell(6);
            HSSFCell cell8 = row.createCell(7);
            HSSFCell cell9 = row.createCell(8);
            cell1.setCellValue(i+1);//序号
            cell1.setCellStyle(headstyle);
            cell2.setCellValue(tbPersonalDataList.get(i).getPersonalNumber());//导师编号
            cell2.setCellStyle(headstyle);
            cell3.setCellValue(tbPersonalDataList.get(i).getRealName());//导师姓名
            cell3.setCellStyle(headstyle);
				for (int j = 0; j < listserviceNumberList.size(); j++) {
					if (tbPersonalDataList.get(i).getPersonalId().equals(listserviceNumberList.get(j).getPersonalId())) {
						cell4.setCellValue(listserviceNumberList.get(j).getServiceNumber());// 服务总数量
						cell4.setCellStyle(headstyle);
						s++;
					} else if (s != 1) {
						cell4.setCellValue(0);// 服务总数量
						cell4.setCellStyle(headstyle);
					}
				}
           	for(int z = 0; z < mentorServicesStatisticsList.size();z++){
           	if(tbPersonalDataList.get(i).getPersonalId().equals(mentorServicesStatisticsList.get(z).getPersonalId())){
	            cell5.setCellValue(mentorServicesStatisticsList.get(z).getBadNumber());//差
	            cell5.setCellStyle(headstyle);
	            cell6.setCellValue(mentorServicesStatisticsList.get(z).getBettergoodNumber());//一般
	            cell6.setCellStyle(headstyle);
	            cell7.setCellValue(mentorServicesStatisticsList.get(z).getGeneralNumber());//满意
	            cell7.setCellStyle(headstyle);
	            cell8.setCellValue(mentorServicesStatisticsList.get(z).getGoodNumber());//很满意
	            cell8.setCellStyle(headstyle);
	            cell9.setCellValue(mentorServicesStatisticsList.get(z).getSatisfaction());//非常满意
	            cell9.setCellStyle(headstyle);
	            k++;
            }else if (k != 1) {
            	cell5.setCellValue(0);//差
                cell5.setCellStyle(headstyle);
                cell6.setCellValue(0);//一般
                cell6.setCellStyle(headstyle);
                cell7.setCellValue(0);//满意
                cell7.setCellStyle(headstyle);
                cell8.setCellValue(0);//很满意
                cell8.setCellStyle(headstyle);
                cell9.setCellValue(0);//非常满意
                cell9.setCellStyle(headstyle);
            }
            }
           	k=0;s=0;}
            //把响应头数据类型设置为任意二进制流，用于上传下载
           response.setContentType("application/octet-stream");
           //告诉浏览器通过下载方式打开，并设置下载文件名
           ServletOutputStream sos = response.getOutputStream();
            response.setHeader("Content-Disposition", "attachment;fileName="//
                    + new String("导师服务记录.xls".getBytes(),"ISO8859-1"));
            workbook.write(sos);
            /*workbook.close();*/
            if(sos != null){
                sos.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }}
	
	//健康记录    导出Excel
	public void ExportRecordExcel(List<FatherHealth> fatherHealthList,List<TbAdvice> fatherAdviceList,List<TbFeedback> throughFeedbackList){
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet();
         // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 28);
            // 生成一个样式
            HSSFCellStyle style = workbook.createCellStyle();
            // 设置这些样式
            /*style.setFillForegroundColor(HSSFColor.WHITE.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);*/
            // 生成一个字体
            HSSFFont font = workbook.createFont();
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 12);// 设置字体大小
            font.setFontName("宋体");
            
            HSSFCellStyle headstyle =workbook.createCellStyle();    
            headstyle.setFont(font);    
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中    
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中    
            headstyle.setLocked(true);    
            headstyle.setWrapText(true);// 自动换行 
            // 把字体应用到当前的样式
            style.setFont(font);
            // 生成并设置另一个样式
            HSSFCellStyle style2 = workbook.createCellStyle();
            /*style2.setFillForegroundColor(HSSFColor.WHITE.index);
            style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);*/
            // 生成另一个字体
            HSSFFont font2 = workbook.createFont();
            font2.setFontHeightInPoints((short) 15);// 设置字体大小
            font2.setFontName("宋体");
            font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
            // 把字体应用到当前的样式
            style2.setFont(font2);
            HSSFCellStyle headstyle1 =workbook.createCellStyle();    
            headstyle1.setFont(font2);    
            headstyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中    
            headstyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中    
            headstyle1.setLocked(true);    
            headstyle1.setWrapText(true);// 自动换行 
            HSSFRow row_title = sheet.createRow(0);
            row_title.setRowStyle(style2);//设置row_title样式
            HSSFCell cell_title1 = row_title.createCell(0);
            HSSFCell cell_title2 = row_title.createCell(1);
            HSSFCell cell_title3 = row_title.createCell(2);
            HSSFCell cell_title4 = row_title.createCell(3);
            HSSFCell cell_title5 = row_title.createCell(4);
            HSSFCell cell_title6 = row_title.createCell(5);
            HSSFCell cell_title7 = row_title.createCell(6);
            HSSFCell cell_title8 = row_title.createCell(7);
            cell_title1.setCellValue("序号");
            cell_title1.setCellStyle(headstyle1);
            cell_title2.setCellValue("健康自述");
            cell_title2.setCellStyle(headstyle1);
            cell_title3.setCellValue("自述时间");
            cell_title3.setCellStyle(headstyle1);
            cell_title4.setCellValue("调理建议");
            cell_title4.setCellStyle(headstyle1);
            cell_title5.setCellValue("建议时间");
            cell_title5.setCellStyle(headstyle1);
            cell_title6.setCellValue("导师");
            cell_title6.setCellStyle(headstyle1);
            cell_title7.setCellValue("效果反馈");
            cell_title7.setCellStyle(headstyle1);
            cell_title8.setCellValue("反馈时间");
            cell_title8.setCellStyle(headstyle1);
        	
        	
           	int size1 = fatherHealthList.size();
           	int size2 = fatherAdviceList.size();
           	int size3 = throughFeedbackList.size();
            for(int i = 0; i < size1;i++){
            	HSSFRow row = sheet.createRow(i+1);
            	row.setRowStyle(style);//设置row样式
                HSSFCell cell1 = row.createCell(0);
                HSSFCell cell2 = row.createCell(1);
                HSSFCell cell3 = row.createCell(2);
                HSSFCell cell4 = row.createCell(3);
                HSSFCell cell5 = row.createCell(4);
                HSSFCell cell6 = row.createCell(5);
                HSSFCell cell7 = row.createCell(6);
                HSSFCell cell8 = row.createCell(7);
          //遍历健康自述内容
            cell1.setCellValue(i+1);//编号
            cell1.setCellStyle(headstyle);
            cell2.setCellValue(fatherHealthList.get(i).getReadmeContent());//健康自述
            cell2.setCellStyle(headstyle);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//时间显示类型
            cell3.setCellValue(sdf.format(fatherHealthList.get(i).getReadmeTime()));//自述时间
            cell3.setCellStyle(headstyle);
            //遍历调理建议内容
            for(int s = 0; s < size2;s++){
            if(fatherHealthList.get(i).getReadmeId().equals(fatherAdviceList.get(s).getReadmeId())){
            cell4.setCellValue(fatherAdviceList.get(s).getAdviceContent());//调理建议
            cell4.setCellStyle(headstyle);
            cell5.setCellValue(sdf.format(fatherAdviceList.get(s).getAdviceTime()));//建议时间   转换成string类型的数据
            cell5.setCellStyle(headstyle);
            cell6.setCellValue(fatherAdviceList.get(s).getMentorName());//导师名称
            cell6.setCellStyle(headstyle);
            }}
            //遍历效果反馈内容
            for(int w = 0; w < size3;w++){
            if(fatherHealthList.get(i).getReadmeId().equals(throughFeedbackList.get(w).getReadmeId())){
            cell7.setCellValue(throughFeedbackList.get(w).getFeedbackContent());//反馈内容
            cell7.setCellStyle(headstyle);
            cell8.setCellValue(sdf.format(throughFeedbackList.get(w).getFeedbackTime()));//反馈时间
            cell8.setCellStyle(headstyle);
            }}
            }
            //把响应头数据类型设置为任意二进制流，用于上传下载
           response.setContentType("application/octet-stream");
           //告诉浏览器通过下载方式打开，并设置下载文件名
           ServletOutputStream sos = response.getOutputStream();
            response.setHeader("Content-Disposition", "attachment;fileName="//
                    + new String("健康数据记录.xls".getBytes(),"ISO8859-1"));
            workbook.write(sos);
            /*workbook.close();*/
            if(sos != null){
                sos.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }}

        /**
         * 导出指定时间的交易对账表格
         * @author 叶城廷
         * @date 2019-07-13 14:39:46
         **/
    public void ExportExceptionalExcel(List<TbExceptional> data) {
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet();
            // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 20);
            sheet.setDefaultRowHeight((short) 500);
            sheet.setColumnWidth(1, 12000);//设置流水单号宽度
            sheet.setColumnWidth(2, 10000);//设置流水单号宽度
            sheet.setColumnWidth(4, 10000);//设置openId宽度
            // 生成一个样式
            HSSFCellStyle style = workbook.createCellStyle();
            // 生成一个字体
            HSSFFont font = workbook.createFont();
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 12);// 设置字体大小
            font.setFontName("宋体");
            HSSFCellStyle headstyle =workbook.createCellStyle();
            headstyle.setFont(font);
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle.setLocked(true);
            headstyle.setWrapText(true);// 自动换行

            HSSFFont font3 = workbook.createFont();
            font3.setColor(HSSFColor.RED.index);
            font3.setFontHeightInPoints((short) 12);// 设置字体大小
            font3.setFontName("宋体");
            HSSFCellStyle headstyle3 =workbook.createCellStyle();
            headstyle3.setFont(font3);
            headstyle3.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
            headstyle3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle3.setLocked(true);
            headstyle3.setWrapText(true);// 自动换行

            HSSFFont font4 = workbook.createFont();
            font4.setColor(HSSFColor.GREEN.index);
            font4.setFontHeightInPoints((short) 12);// 设置字体大小
            font4.setFontName("宋体");
            HSSFCellStyle headstyle4 =workbook.createCellStyle();
            headstyle4.setFont(font4);
            headstyle4.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
            headstyle4.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle4.setLocked(true);
            headstyle4.setWrapText(true);// 自动换行

            HSSFFont font5 = workbook.createFont();
            font5.setColor(HSSFColor.YELLOW.index);
            font5.setFontHeightInPoints((short) 12);// 设置字体大小
            font5.setFontName("宋体");
            HSSFCellStyle headstyle5 =workbook.createCellStyle();
            headstyle5.setFont(font5);
            headstyle5.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
            headstyle5.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle5.setLocked(true);
            headstyle5.setWrapText(true);// 自动换行
            // 把字体应用到当前的样式
            style.setFont(font);
            // 生成并设置另一个样式
            HSSFCellStyle style2 = workbook.createCellStyle();
            // 生成另一个字体
            HSSFFont font2 = workbook.createFont();
            font2.setFontHeightInPoints((short) 15);// 设置字体大小
            font2.setFontName("宋体");
            font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
            // 把字体应用到当前的样式
            style2.setFont(font2);
            HSSFCellStyle headstyle1 =workbook.createCellStyle();
            headstyle1.setFont(font2);
            headstyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
            headstyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle1.setLocked(true);
            headstyle1.setWrapText(true);// 自动换行
            HSSFRow row_title = sheet.createRow(0);
            row_title.setRowStyle(style2);//设置row_title样式
            HSSFCell cell_title1 = row_title.createCell(0);
            HSSFCell cell_title2 = row_title.createCell(1);
            HSSFCell cell_title3 = row_title.createCell(2, CELL_TYPE_STRING);
            HSSFCell cell_title4 = row_title.createCell(3);
            HSSFCell cell_title5 = row_title.createCell(4);
            HSSFCell cell_title6 = row_title.createCell(5);
            HSSFCell cell_title7 = row_title.createCell(6);
            cell_title1.setCellValue("序号");
            cell_title1.setCellStyle(headstyle1);
            cell_title2.setCellValue("流水单号");
            cell_title2.setCellStyle(headstyle1);
            cell_title3.setCellValue("时间");
            cell_title3.setCellStyle(headstyle1);
            cell_title4.setCellValue("老师姓名");
            cell_title4.setCellStyle(headstyle1);
            cell_title5.setCellValue("用户openId");
            cell_title5.setCellStyle(headstyle1);
            cell_title6.setCellValue("金额");
            cell_title6.setCellStyle(headstyle1);
            cell_title7.setCellValue("交易状态");
            cell_title7.setCellStyle(headstyle1);
            int size = data.size();
            int s = 0;
            int k = 0;
            for(int i = 0; i < size;i++){
                HSSFRow row = sheet.createRow(i+1);
                row.setRowStyle(style);//设置row样式
                HSSFCell cell1 = row.createCell(0);
                HSSFCell cell2 = row.createCell(1);
                HSSFCell cell3 = row.createCell(2);
                HSSFCell cell4 = row.createCell(3);
                HSSFCell cell5 = row.createCell(4);
                HSSFCell cell6 = row.createCell(5);
                HSSFCell cell7 = row.createCell(6);
                cell1.setCellValue(i+1);//序号
                cell1.setCellStyle(headstyle);
                cell4.setCellValue(data.get(i).getTeacherName());//老师名字
                cell4.setCellStyle(headstyle);
                cell5.setCellValue(data.get(i).getTeacherOpenId());//用户openId
                cell5.setCellStyle(headstyle);
                cell6.setCellValue(data.get(i).getExceptionalMoney());//金额
                cell6.setCellStyle(headstyle);
                Integer dealStatus = data.get(i).getDealStatus();
                if (dealStatus==2){
                    cell7.setCellValue("交易中");//交易状态
                    cell7.setCellStyle(headstyle5);
                    cell2.setCellValue(data.get(i).getPrepayId());//流水单号
                }else {
                    cell3.setCellValue(data.get(i).getExceptionalTime().toString());//时间
                    cell3.setCellStyle(headstyle);
                    cell2.setCellValue(data.get(i).getWaterNumber());//流水单号
                    if (dealStatus==0){
                        cell7.setCellValue("交易失败");//交易状态
                        cell7.setCellStyle(headstyle3);
                    }else if (dealStatus==1){
                        cell7.setCellValue("交易成功");//交易状态
                        cell7.setCellStyle(headstyle4);
                    }
                }
                cell2.setCellStyle(headstyle);
                k=0;s=0;}
            //把响应头数据类型设置为任意二进制流，用于上传下载
            response.setContentType("application/octet-stream");
            //告诉浏览器通过下载方式打开，并设置下载文件名
            ServletOutputStream sos = response.getOutputStream();
            response.setHeader("Content-Disposition", "attachment;fileName="//
                    + new String("交易对账.xls".getBytes(),"ISO8859-1"));
            workbook.write(sos);
            /*workbook.close();*/
            if(sos != null){
                sos.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
