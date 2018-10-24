<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/19
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>审计终审列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5> 审计终审列表</h5>
</div>
<div class="content">
    <div class="search form-inline" >
        <div class="search">
            <div class="search_content">
                <form id="search" class="form-search">
                    <div class="form-group">
                        <%@include file="/WEB-INF/pages/cq/common/mainHead/checkHead.jsp"%>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">审计终审状态</div>
                            <tags:searchDataDict name="f.lastCheckStatus" fieldType="integer" dataDict="终审状态" className="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                        <a href="javascript:checkBoxTrue();" class="btn btn-primary btn-sm"><i class="fa fa-search" aria-hidden="true"></i> 批量终审通过</a>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th class="text-center">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="box" style="width: 15px;height: 15px;font-size: 20px" class="checkAll form-control"/>全选/反选
                    </label>
                </th>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">分指</th>
                <th class="text-center">组别</th>
                <th class="text-center">家庭编号</th>
                <th class="text-center">被拆迁人</th>
                <th class="text-center">地址门牌</th>
                <th class="text-center">房屋产别</th>
                <th class="text-center">房屋类型</th>
                <th class="text-center">建筑面积/㎡</th>
                <th class="text-center">是否有标准自建</th>
                <th class="text-center">数据锁定状态</th>
                <th class="text-center">审计初审状态</th>
                <th class="text-center">审计终审状态</th>
                <th width="20%" class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" style="width: 15px;height: 15px;" name="box" class="checkItem form-control" value="${family.id}"/>
                    </td>
                    <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                    <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                    <td class="text-center">${family.familyCode}</td>
                    <td class="text-center">${family.name}</td>
                    <td class="text-center">${family.address}</td>
                    <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
                    <td class="text-center">${family.buildArea}</td>
                    <td class="text-center"><tags:dataDict dataDict="是否" value="${family.houseStatus}"/></td>
                    <td class="text-left"><tags:dataDict dataDict="锁定状态" value="${family.sureStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="终审状态" value="${family.lastCheckStatus}"/></td>
                    <td class="text-center">
                        <a href='/cq/common/view/main?familyId=${family.id}'
                           title="查看"><i
                                class="fa fa-eye"></i>&nbsp;查看
                        </a>&nbsp;&nbsp;
                        <a href='lastCheckForm?familyId=${family.id}&<tags:searchParams></tags:searchParams>'
                           title="数据初审"><i class="fa fa-edit"></i>&nbsp;数据终审
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        checkMethod();
    });

    function checkMethod() {
        $(".checkAll").click(function () {
            var bl = $(this).is(":checked");      //检查class="checkAll1"的状态
            $(".checkItem").each(function (key, val) {
                $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
            });
        });
    }

    function checkBoxTrue() {
        if(confirm("确定被选中的家庭全部终审通过么？")){
            var a = new Array();
            $(".checkItem").each(function (key, val){
                var bl = $(this).is(":checked");
                if (bl){
                    var c = $(this).val();
                    a.push(c);
                }
            });
            location.href = "checkBoxTrueFinal?idItems=" + a;
        }
    }
</script>