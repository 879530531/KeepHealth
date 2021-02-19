/**
 * 重置radio单选按钮选中
 * @author 叶城廷
 */
function radioSelect(){
var sel=document.getElementById("sel");
var selectButton=document.getElementById("selectButton").value;

//判断Action反馈重置按钮信息
if(selectButton=="method_mouth"){
	sel.value="option_month";
    }else if(selectButton=="method_year"){ 
    	sel.value="option_year";
    }else if(selectButton=="method_time"){
        	sel.value="option_time";
      }else{
    	  
      }
doit();
      }      
/**
 * 搜索-提交form表单检查
 * @author 叶城廷
 */
function selectCheck(){
	   var page=document.getElementById("page").value;
	      var radioSelect=document.getElementById("sel").value;
	      //按天查询表单 
	      if(radioSelect=="option_day"){
	         var selectDay_year=document.getElementById("selectDay_year").value;   
	          var selectDay_mouth=document.getElementById("selectDay_mouth").value;
	           var selectDay_days=document.getElementById("selectDay_days").value;
	            var select_total=selectDay_year+"-"+selectDay_mouth+"-"+selectDay_days;
	               this.select_from.action="TbStatistics_queryDate.action?select_total="+select_total+"&selectButton=method_day"+"&resetYear="+selectDay_year+"&resetMonth="+selectDay_mouth+"&resetDay="+selectDay_days+"&page="+page;
	                   this.select_from.submit();
	      }
	      //按月查询表单
	      else if(radioSelect=="option_month"){    
	        var selectMonth_year=document.getElementById("selectMonth_year").value;
	          var selectMonth_month=document.getElementById("selectMonth_month").value;     
	            var select_total=selectMonth_year+"-"+selectMonth_month;
	            this.select_from.action="TbStatistics_queryDate.action?select_total="+select_total+"&selectButton=method_mouth"+"&resetYear="+selectMonth_year+"&resetMonth="+selectMonth_month+"&page="+page;
	                   this.select_from.submit();
	      }    
	      //按年查询表单
	       else  if(radioSelect=="option_year"){
	         var selectYear_year=document.getElementById("selectYear_year").value;   
	            var select_total=selectYear_year;
	               this.select_from.action="TbStatistics_queryDate.action?select_total="+select_total+"&selectButton=method_year"+"&resetYear="+selectYear_year+"&page="+page;
	                   this.select_from.submit();
	      }
	   
	    }
      
//页面加载检查      @author 叶城廷
      window.onload=function(){
    
    	  
    	  var day=new Date();
    	  var newyear=day.getFullYear();
    	  //获取Action反馈重置日期信息
    	  var resetYear=document.getElementById("resetYear").value;
    	  var resetMonth=document.getElementById("resetMonth").value;
    	  var resetDay=document.getElementById("resetDay").value;
    	  
    	  //按日查询按钮
    	  var selectDay_year=document.getElementById("selectDay_year");
    	  var selectDay_mouth=document.getElementById("selectDay_mouth");
    	  var selectDay_days=document.getElementById("selectDay_days");
    	     for(var i=newyear;i>=2000;i--){
    	  selectDay_year.add(new Option(i,i),null);
    	  }
    	     for(var i=1;i<=12;i++){
    	      if(i<10){ 
    	       i="0"+i;
    	     }
    	  selectDay_mouth.add(new Option(i,i),null);
    	  }
    	  for(var i=1;i<=31;i++){
    	   if(i<10){ 
    	       i="0"+i;
    	     }
    	   selectDay_days.add(new Option(i,i),null);
    	  }
    	  //初始化或重置日期
    	  selectDay_year.value=resetYear;
    	  selectDay_mouth.value=resetMonth;
    	  selectDay_days.value=resetDay;
    	   //按月查询按钮
    	  var selectMonth_year=document.getElementById("selectMonth_year");
    	  var selectMonth_month=document.getElementById("selectMonth_month");
    	  
    	      for(var i=newyear;i>=2000;i--){
    	  selectMonth_year.add(new Option(i,i),null);
    	  }
    	     for(var i=1;i<=12;i++){
    	     if(i<10){ 
    	       i="0"+i;
    	     }
    	    selectMonth_month.add(new Option(i,i),null);
    	  }
    	     //初始化或重置日期
    	     selectMonth_year.value=resetYear;
    	     selectMonth_month.value=resetMonth;
    	  //按年查询按钮
    	  var selectYear_year=document.getElementById("selectYear_year");
    	  
    	       for(var i=newyear;i>=2000;i--){
    	  selectYear_year.add(new Option(i,i),null);
    	  }
    	   //初始化或重置日期
    	   selectYear_year.value=resetYear;
  
      }
     
      