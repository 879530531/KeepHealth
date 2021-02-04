<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <base href="<%= basePath%>"/>
		<title>系统功能菜单</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="js/jquery.js"></script>

		<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active");
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	});
</script>


	</head>

	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>功能菜单
		</div>

		<dl class="leftmenu">
			
			<p:permissions menu="addMumber,addTeacher,deleteMumber,deleteTeacher,editMumber,editTeacher,untreated,vip,editPassword">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>健康卡管理
				</div>
				<ul class="menuson">
					<p:permissions menu="addMumber,deleteMumber,editMumber,editPassword">
					<li>
						<cite></cite><a href="<%= basePath%>/biz/TbPersonalData_list.action?flagType=0" target="rightFrame">会员管理</a><i></i>
					</li>
					</p:permissions>
					<p:permissions menu="addTeacher,deleteTeacher,editTeacher,editPassword">
					<li>
						<cite></cite><a href="<%= basePath%>/biz/TbPersonalData_list.action?flagType=1" target="rightFrame">导师管理</a><i></i>
					</li>
					</p:permissions>
					<p:permissions menu="untreated">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbPersonalData_listUntreated.action" target="rightFrame">未处理咨询管理</a><i></i>
					</li>
					</p:permissions>
					<p:permissions menu="vip">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbPersonalData_listVip.action" target="rightFrame">VIP管理</a><i></i>
					</li>
					</p:permissions>
				</ul>
			</dd>
			</p:permissions>
			
			<p:permissions menu="healthDataCenter,healthData,servicesStatistics">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>健康数据中心
				</div>
				<ul class="menuson">
					<p:permissions menu="healthData">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbPersonalData_listHealthdata.action" target="rightFrame">健康数据</a><i></i>
					</li>
					</p:permissions>
					<p:permissions menu="servicesStatistics">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbFeedback_openMentorServicesStatistics.action" target="rightFrame">导师服务统计</a><i></i>
					</li>
					</p:permissions>
				</ul>
			</dd>
			</p:permissions>
			
			<p:permissions menu="studyGarden,curriculum,issueNumber,grantAuthorization">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>学习园地
				</div>
				<ul class="menuson">
					<p:permissions menu="studyGarden">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/Content_list.action" target="rightFrame">资料管理</a><i></i>
					</li>
					</p:permissions>
					<p:permissions menu="curriculum">
						<li>
							<cite></cite><a href="<%=basePath%>/biz/TbCurriculum_list.action" target="rightFrame">微课管理</a><i></i>
						</li>
					</p:permissions>
                    <p:permissions menu="issueNumber">
                        <li>
                            <cite></cite><a href="<%=basePath%>/biz/TbIssueNumber_list.action" target="rightFrame">期号管理</a><i></i>
                        </li>
                    </p:permissions>
                    <p:permissions menu="grantAuthorization">
                        <li>
                            <cite></cite><a href="<%=basePath%>/biz/TbGrantAuthorization_list.action?flagType=0" target="rightFrame">授权管理</a><i></i>
                        </li>
                    </p:permissions>
						</ul>
			</dd>
			</p:permissions>
			
		<%--2019.03.01因需求变更，暂停开发-叶城廷15177436102 	<p:permissions menu="typeStatistics,addType,editType,deleteType,goodsStatistics,addGoods,editGoods,deleteGoods,upGoods,downGoods,orderStatistics,deliverGoods,refundMoney,deleteOrder,editOrder,saleStatistics">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>商城数据
				</div>
				<ul class="menuson">
					<p:permissions menu="goodsStatistics,addGoods,editGoods,deleteGoods,upGoods,downGoods">
					<li>
						<cite></cite><a href="<%= basePath%>/biz/TbGoods_list.action" target="rightFrame">商品管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="typeStatistics,addType,editType,deleteType">
					<li>
						<cite></cite><a href="<%= basePath%>/biz/TbGoodType_typeList.action" target="rightFrame">商品类型管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="orderStatistics,deliverGoods,refundMoney,deleteOrder,editOrder">
					<li>
						<cite></cite><a href="<%= basePath%>/biz/TbOrder_list.action" target="rightFrame">订单管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="saleStatistics">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbStatistics_firstSaleList.action" target="rightFrame">销售统计</a><i></i>
					</li>
					</p:permissions>
					
				</ul>
			</dd>
			</p:permissions>
			
			<p:permissions menu="readDeviceDate">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>听读器数据
				</div>
				<ul class="menuson">
					<p:permissions menu="readDeviceDate,addReadDevice,editReadDevice,deleteReadDevice">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbReadDevice_list.action" target="rightFrame">听读器音频管理</a><i></i>
					</li>
					</p:permissions>
					
				</ul>
			</dd>
			</p:permissions>
			 --%>
			<p:permissions menu="addSoundSource,editSoundSource,deleteSoundSource,addAudio,editAudio,deleteAudio,addFormula,editFormula,deleteFormula">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>念数管理
				</div>
				<ul class="menuson">
					<p:permissions menu="addSoundSource,editSoundSource,deleteSoundSource">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbSoundSource_openList.action" target="rightFrame">音源管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="addAudio,editAudio,deleteAudio">
					<li>
						<cite></cite><a href="/biz/TbAudio_openList.action" target="rightFrame">音频管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="addFormula,editFormula,deleteFormula">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbFormula_openList.action" target="rightFrame">配方管理</a><i></i>
					</li>
					</p:permissions>
					
				</ul>
			</dd>
			</p:permissions>
			
			<p:permissions menu="viewConsultTeacher,addConsultTeacher,resetTeacherPwd,editConsultTeacher,viewConsumer,viewConsultRecord,viewConsultStatistics，viewExceptional，viewSettlement">
			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>咨询管理
				</div>
				<ul class="menuson">
					<p:permissions menu="viewConsultTeacher,addConsultTeacher,resetTeacherPwd,editConsultTeacher">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbTeacher_openList.action" target="rightFrame">咨询老师</a><i></i>
					</li>                 
					</p:permissions>
					
					<p:permissions menu="viewConsumer">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbConsumer_list.action"  target="rightFrame">咨询用户</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="viewConsultRecord">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbConsultationRecord_toRecordList.action" target="rightFrame">咨询记录</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="viewConsultStatistics">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbConsultationRecord_serviceStatistics.action" target="rightFrame">服务统计</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="viewExceptional">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbExceptional_openList.action" target="rightFrame">交易对账</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="viewSettlement">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbSettlement_list.action" target="rightFrame">结算管理</a><i></i>
					</li>
					</p:permissions>
					
					<p:permissions menu="viewSettlement">
					<li>
						<cite></cite><a href="<%=basePath%>/biz/TbFee_openEditMoney.action" target="rightFrame">咨询费用修改</a><i></i>
					</li>
					</p:permissions>

					<%--<p:permissions menu="viewSettlement">
						<li>
								<cite></cite><a href="<%=basePath%>/biz/TbSettlement_openEditMoney.action" target="rightFrame">金额管理</a><i></i>

						 </li>
            </p:permissions>--%>

        </ul>
    </dd>
    </p:permissions>

    <p:permissions menu="addCompany,deleteCompany,editCompany,addDepartment,deleteDepartment,
    editDepartment,addRole,editRole,deleteRole,addRole,editRole,deleteRole,addUser,editUser,deleteUsere">
    <dd>
        <div class="title">
            <span><img src="images/leftico04.png" /> </span>系统管理
        </div>
        <ul class="menuson">
            <p:permissions menu="addCompany,deleteCompany,editCompany">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysUnit_list.action" target="rightFrame">公司管理</a><i></i>
            </li>
            </p:permissions>
            <p:permissions menu="addDepartment,deleteDepartment,editDepartment">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysDepartment_list.action" target="rightFrame">部门管理</a><i></i>
            </li>
            </p:permissions>
            <p:permissions menu="addRight,editRight,deleteRight">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysRight_list.action" target="rightFrame">权限管理</a><i></i>
            </li>
            </p:permissions>
            <p:permissions menu="addRole,editRole,deleteRole">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysRole_list.action" target="rightFrame">角色管理</a><i></i>
            </li>
            </p:permissions>
            <p:permissions menu="addUser,editUser,deleteUsere">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysUser_list.action" target="rightFrame">用户管理</a><i></i>
            </li>
            </p:permissions>
        </ul>
    </dd>
    </p:permissions>

    <p:permissions menu="loginLog,deleteLoginRecord">
    <dd>
        <div class="title">
            <span><img src="images/leftico04.png" /> </span>登陆日志
        </div>
        <ul class="menuson">
            <p:permissions menu="loginLog,deleteLoginRecord">
            <li>
                <cite></cite><a href="<%=basePath%>/biz/SysLoginRecord_list.action" target="rightFrame">登陆日志</a><i></i>
            </li>
            </p:permissions>
        </ul>
    </dd>
    </p:permissions>

</dl>

</body>
</html>
