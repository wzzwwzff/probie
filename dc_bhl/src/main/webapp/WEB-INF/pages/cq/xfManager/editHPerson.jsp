<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>变更购房人管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>变更购房人管理</h5>
</div>
<div class="content">
    <form action="save" class="form-inline" method="post">
        <input type="hidden" name="familyId" value="${family.id}"/>
        <fieldset>
            <legend>一、被拆迁人状况</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">姓名</td>
                    <td class="fieldValue">${family.name}</td>
                    <td class="fieldName">档案编号</td>
                    <td class="fieldValue">${family.familyCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${family.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue">${family.buildArea}㎡</td>
                    <td class="fieldName">地址门牌</td>
                    <td class="fieldValue">${family.address}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、登记变更购房人信息</legend>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="fieldName" colspan="2">变更房源</td>
                    <td class="fieldValue" colspan="5">
                        <input type="hidden" name="id" value="${house.id}"/>
                        <span style="font-size: 30px;">${house.project.projectName}项目${house.buildNum}号楼${house.unitNum}单元${house.houseNum}室&nbsp;<tags:dataDict
                                dataDict="房屋居室" value="${house.houseType}"/>${house.buildArea}㎡</span>
                        <%--<button type="button" class="btn btn-primary" onclick="changesInheritType(${house.id},${family.id});">变更房屋继承人</button>--%>
                    </td>
                </tr>
                <tr>
                <tr><td class="fieldName" colspan="8" style="text-align: center;">家庭成员情况</td></tr>
                <tr>
                    <th class="text-center"><input type="checkbox" id="chk"/></th>
                    <th class="text-center">姓名</th>
                    <th class="text-center">年龄</th>
                    <th class="text-center">身份证号</th>
                    <th class="text-center">与户主关系</th>
                    <th class="text-center">是否在册</th>
                    <th class="text-center">变更</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${familyPersonList}" var="familyPerson">
                    <tr>
                        <td class="text-center"><input type="checkbox" name="ids" value="${familyPerson.id}"/></td>
                        <td class="text-center">${familyPerson.name}</td>
                        <td class="text-center">${familyPerson.age}</td>
                        <td class="text-center">${familyPerson.idCard}</td>
                        <td class="text-center">${familyPerson.hzRelation}</td>
                        <td class="text-center"><tags:dataDict dataDict="是否在本址" value="${familyPerson.type}"/></td>
                        <td class="text-center"><a title="点击变更购房人信息" onclick="change(${familyPerson.id},${house.id},${family.id})" style="cursor: pointer;"><font color='green'>变更</font></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <%--<button type="button" class="btn btn-primary" onclick="location.href='addPeople?familyId=${family.id}&houseId=${house.id}<tags:searchParams></tags:searchParams>'"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加家庭人口</button>--%>
                <button type="button" class="btn btn-primary" onclick="location.href='addPeople?familyId=${family.id}&houseId=${house.id}&<tags:searchParams></tags:searchParams>'"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加家庭人口</button>
                <button type="button" class="btn btn-primary" onclick="changes(${house.id},${family.id});"><i class="fa fa-edit"></i>&nbsp;&nbsp;批量变更</button>
                <button type="button" class="btn btn-primary" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;&nbsp;返回
                </button>
                <%--<button class="btn btn-white" type="button" onclick="location.href='list?<tags:searchParams></tags:searchParams>'"><i class="fa fa-backward"></i>&nbsp;返回列表</button>--%>
        </div>
    </form>
</div>
<script>
    function change(params,houseId,familyId){
        if(confirm("确定变更该购房人吗？")){
            $.get("editSave", {
                params: params,
                houseId: houseId,
                familyId: familyId,
                _time: new Date().getTime()
            }, function (data) {
                alert(data.message);
                if (data.success == "true"){
                    window.location.reload();
                }
            });
        }
    }

    $(function(){
        $("#chk").click(function(){
            var chked=this.checked;
            if(chked){
                $("[name='ids']").prop("checked",'true');//全选
            }else{
                $("[name='ids']").prop("checked",false);//取消全选
            }
        });
    });

    function changes(houseId,familyId){
        var str="";
        $("[name='ids']").each(function(){
            if(this.checked){
                str+=$(this).val()+",";
            }
        })
        if(str==""){
            alert("请选择所要变更的数据");
            return;
        }
        var params=str.substring(0,str.lastIndexOf(","));
        if(confirm("确定变更信息吗？")){
            $.get("editSave", {
                params: params,
                houseId: houseId,
                familyId: familyId,
                _time: new Date().getTime()
            }, function (data) {
                alert(data.message);
                if (data.success == "true"){
                    window.location.reload();
                }
            });
        }
    }

//    function changesInheritType(houseId,familyId){
//        var str="";
//        $("[name='ids']").each(function(){
//            if(this.checked){
//                str+=$(this).val()+",";
//            }
//        })
//        if(str==""){
//            alert("请选择所要变更的数据");
//            return;
//        }
//        var params=str.substring(0,str.lastIndexOf(","));
//        if(confirm("确定变更信息吗？")){
//            $.get("changeInheritType", {
//                params: params,
//                houseId: houseId,
//                familyId: familyId,
//                _time: new Date().getTime()
//            }, function (data) {
//                alert(data.message);
//                if (data.success == "true"){
//                    window.location.reload();
//                }
//            });
//        }
//    }
</script>
</body>
</html>
