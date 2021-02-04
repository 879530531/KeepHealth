package com.gxuwz.KeepHealth.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.*;

/**
 * Map工具类
 * @author 叶城廷
 * @version 2019.3.22
 */
public class MapUtil {

    /**
     * Bean转Map方法
     * @author 叶城廷
     * @version 2019.03.21
     * @param obj
     * @return
     */
    // Bean --> Map 1: 利用Introspector和PropertyDescriptor 将Bean --> Map
     public static Map<String, String> transBean2Map(Object obj) {
         if (obj == null) {
             return null;
         }
     Map<String, String> map = new HashMap<String, String>();
     try {
         BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
         PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
         for (PropertyDescriptor property : propertyDescriptors) {
            String key = property.getName();     // 过滤class属性
              if (!key.equals("class")) {      // 得到property对应的getter方法
             Method getter = property.getReadMethod();
              String value =  String.valueOf(getter.invoke(obj));
              //过滤空的字段
              if (isEmpty(value)||value.equals("null")){

              }else {
                  map.put(key, value);
              }
              }
             }
            } catch (Exception e) {
             e.printStackTrace();
     }
     return map;
   }

    public static boolean isEmpty(Object obj){
        return obj == null || obj.toString().length() == 0;
    }

}
