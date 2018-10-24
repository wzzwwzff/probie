<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/13
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>补偿安置意向书序号领取</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>补偿安置意向书序号领取</h5>
</div>
<div class="content">
    <div class="search form-inline">
        <div class="search">
            <div class="search_content">
                <form id="search" class="form-search">
                    <div class="form-group">
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">分指</div>
                            <select class='form-control selectBdClass' name="search_eq_string_f.bdCode" id="search_eq_string_f.bdCode">
                                <option value="">-全部-</option>
                            </select>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">组别</div>
                            <select class='form-control selectGroupClass' name="search_eq_string_f.groupCode" id="search_eq_string_f.groupCode">
                                <option value="">-全部-</option>
                            </select>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">编号</div>
                            <tags:searchInput name="f.familyCode" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">姓名</div>
                            <tags:searchInput name="f.name" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋坐落</div>
                            <tags:searchInput name="f.houseAddress" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋产别</div>
                            <tags:searchDataDict name="f.houseType" className="form-control" fieldType="integer"
                                                 dataDict="房屋产别"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋类型</div>
                            <tags:searchDataDict name="f.houseStyle" className="form-control" fieldType="integer"
                                                 dataDict="房屋类型"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">审计初审状态</div>
                            <tags:searchDataDict name="f.firstCheckStatus" fieldType="integer" dataDict="初审状态" className="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">分指</th>
                <th class="text-center">组别</th>
                <th class="text-center">家庭编号</th>
                <th class="text-center">被拆迁人</th>
                <th class="text-center">地址门牌</th>
                <th class="text-center">房屋产别</th>
                <th class="text-center">房屋类型</th>
                <th class="text-center">建筑面积/㎡</th>
                <th class="text-center">审计初审状态</th>
                <th class="text-center">补偿安置意向书顺序号</th>
                <th width="20%" class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                <tr>
                    <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                    <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                    <td class="text-center">${family.familyCode}</td>
                    <td class="text-center">${family.name}</td>
                    <td class="text-center">${family.address}</td>
                    <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
                    <td class="text-center">${family.buildArea}</td>
                    <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                    <td class="text-center"><fmt:formatNumber value="${family.signNum}" pattern="000"/></td>
                    <td class="text-center">
                        <c:set var="firstChecked" value="<%=CheckState.FIRSTCHECK.getIndex()%>"></c:set>
                        <c:if test="${family.firstCheckStatus eq firstChecked && family.signStatus ne 2 && family.signNum eq null}">
                            <a href="javascript:backData('${family.id}')" title="获取补偿安置意向书顺序号"><i
                                    class="fa fa-edit"></i>&nbsp;获取补偿安置意向书顺序号
                            </a>
                        </c:if>
                        <%--<c:if test="${family.signNum ne null && family.jfStatus ne 2}">--%>
                            <%--<a href="javascript:cancelSignNum('${family.id}')" title="撤销签约顺序号"><i--%>
                                    <%--class="fa fa-close"></i>&nbsp;撤销签约顺序号--%>
                            <%--</a>--%>
                        <%--</c:if>--%>
                        <c:if test="${family.signNum ne null}">
                            <a href='printFrame?familyId=${family.id}&${pageInfo.searchParams}'
                               title="打印协议"><i class="fa fa-print"></i>&nbsp;打印意向签约通知单
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>

<%--设置签约时间--%>
<div class="modal fade" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCs" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel2">请填写何时签订补偿安置意向书</h4>
                </div>
                <div class="modal-body" id="modalBodyCs">
                    <input type="hidden" name="familyId" value="${family.id}">
                    <table class="table table-bordered">
                        <tr>
                            <td class="active text-right" style="width: 20%;">意向签约时间：</td>
                            <td>
                                <c:set var="now" value="<%=new java.util.Date()%>" />
                                <input id="reasonCs" type="text" name="signXyDate" class="form-control datetimePicker dateISO" style="width: 8em" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="subButtonCs" type="button" class="btn btn-primary" onclick="submitData()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        $(".selectBdClass").empty();
        var option = "<option value=''>-全部-</option>";
        $(".selectBdClass").append(option);
        $.ajax({
            url: "/cq/family/rh/getBdList",
            type: "post",
            success: function (data) {
                for (var i = 0;i<data.length;i++){
                    var bdCode = data[i];
                    var options = "<option value='"+ bdCode + "' >" + bdCode + "分指</option>";
                    $(".selectBdClass").append(options);
                }
            }
        })
    });
    $(".selectBdClass").change(function () {
        $(".selectGroupClass").empty();
        var option = "<option value=''>-全部-</option>";
        $(".selectGroupClass").append(option);
        var bdCode = $(this).val();
        $.ajax({
            url: "/cq/family/rh/getGroupByArea",
            type: "post",
            data: {bdCode:bdCode},
            success: function (data) {
                for (var i = 0;i<data.length;i++){
                    var groupCode = data[i];
                    var options = "<option value='"+ groupCode + "' >" + groupCode + "组</option>";
                    $(".selectGroupClass").append(options);
                }
            }
        })
    });

    function backData(familyId) {
//        $.get(url, {familyId: familyId, _date: new Date().getTime()}, function (data) {
//            $("#modalBodyCs").html(data);
//        });
        $("#myModalCs").modal();
        $("input[name='familyId']").val(familyId);
    }
    function submitData() {
        var company = $("input[name='company']:checked").val();
        var reasonCs = $("#reasonCs").val();
        if (reasonCs != "") {
            $.ajax({
                url: "setSignNum",
                method: "post",
                data: $("#myFormCs").serialize(),
                success: function (data) {
                    if (data.success == "true") {
                        window.location.reload();
                    } else {
                        alert(data.message);
                    }
                }

            });
        } else {
            alert("必须填写意向签约时间！");
        }
    }


    function setSignNum(familyId) {
        if (confirm("确定要将该家庭设置为已签约状态吗？")) {
            $.get("setSignNum", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function cancelSignNum(familyId) {
        if (confirm("确定要撤销该家庭已签约状态吗？")) {
            $.get("cancelSignNum", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }

    //日期控件
    $(".datetimePicker").datetimepicker({
        format: 'yyyy-mm-dd',//显示格式
        language: 'zh-CN',
        todayHighlight: 1,//今天高亮
        minView: 2,  //日期最小选择的范围
        startView: 2, //设置开始视图为月
        forceParse: 0,
        showMeridian: 1,
        autoclose: 1,//选择后自动关闭
        showSecond: false, //显示秒
        todayBtn: true
    })
</script>

</html>
