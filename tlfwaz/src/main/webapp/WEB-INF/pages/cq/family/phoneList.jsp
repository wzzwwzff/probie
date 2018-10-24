<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/5
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电话通知</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        #info ul li {
            list-style-type: none;
            background-color: #00AA88;
            width: 150px;
            font-size: 17px;
            margin-left: 10px;
            margin-bottom: 10px;
            float: left;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="form-inline" id="hideCls" style="padding-bottom: 20px;">
        <ul class="nav nav-tabs">
            <li class="active"><a href="phoneList">批次电话通知管理</a></li>
            <li><a href="handed">已有批次家庭</a></li>
        </ul>
    </div>
    <table class="table table-bordered" style="text-align: center;">
        <tr>
            <td style="width: 62%;font-size: 24px;font-weight: bold;">本批次电话通知家庭</td>
            <td style="font-size: 24px;font-weight: bold;">未通知家庭</td>
        </tr>
        <tr>
            <td>
                <div id="chart1" style="overflow-y: auto">
                    <div id="info">
                        <ul id="infoUL">
                        </ul>
                    </div>
                </div>
            </td>
            <td>
                <div id="chart2">
                    <div class="search_content resizeLayout">
                        <form class="form-inline" role="form">
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon">家庭编号</div>
                                    <input type="text" id="searchFamilyCode" class="form-control search2" size="10"/>
                                </div>
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon">姓名：</div>
                                    <input type="text" id="searchName" class="form-control search2" size="10"/>
                                </div>
                                <button type="button" onclick="getSearchList()" class="btn btn-primary" ><i class="fa fa-search"></i>&nbsp;查询</button>

                                <script>
                                    function getSearchList() {
                                        var name = $("#searchName").val();
                                        var familyCode = $("#searchFamilyCode").val();
                                        $.get("searchHead",{familyCode: familyCode,name: name,myTime:new Date().getTime()},function(data){
                                            $("#searchBody").html(data);
                                        })
                                    }
                                </script>
                            </div>
                        </form>
                    </div>
                    <div id="searchBody">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center">序号</th>
                                <th class="text-center">家庭编号</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                                <tr>
                                    <td class="text-center">${status.count}</td>
                                    <td class="text-center">${family.familyCode}</td>
                                    <td class="text-center">${family.name}</td>
                                    <td><a href="javascript:add($(this),'${family.id}','${family.name}','${family.familyCode}')"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <tags:pageInfo/>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="footer">
        <button type="button" onclick="backData()" class="btn btn-danger"><i class="fa fa-magic"></i>&nbsp;生成批次</button>
</div>
<%--家庭信息模态框--%>
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">家庭信息</h4>
            </div>
            <div class="modal-body" id="myModalBoday">
            </div>
            <div class="modal-footer" id="modalFoot">
                <button class="btn btn-danger" id="printButton" onclick="location.reload()"><i class="fa fa-print" ></i>&nbsp;移除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>&nbsp;关闭</button>
            </div>
        </div>
    </div>
</div>

<%--批次时间模态框--%>
<div class="modal fade" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCs" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel2">请填写批次时间</h4>
                </div>
                <div class="modal-body" id="modalBodyCs">
                    <input type="hidden" name="familyId" value="${family.id}">
                    <table class="table table-bordered">
                        <tr>
                            <td class="active text-right" style="width: 20%;">批次时间：</td>
                            <td>
                                <input type="text" id="handDate" name="handDate" value="" class="form-control datetimePicker dateISO" style="width: 130px;height: 33px;background-image:url(../../../../static/plugin/datepicker/img/icon.png); background-repeat:no-repeat; background-position:right center;"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button id="closeModal" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="subButtonCs" type="button" class="btn btn-primary" onclick="submitData()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function add(obj,familyId,familyName,familyCode){
//        if (confirm("确定要将该家庭加入到本批次吗？")){
//            location.reload();
            $("#infoUL").append('<li title="查看详情" id="' + familyId + '" onclick="javascript:view(' + familyId + ');">' + familyName + '<br/>' + familyCode + '</span></li>');
            obj.parent().parent().remove();
//        }
    }

    function view(familyId){//弹出详情
        $.get("phoneBody",{familyId:familyId, _time: new Date().getTime()},function(data){
            $("#myModalBoday").html(data);
            $("#myModal").modal({backdrop: false});
            $("#printButton").attr("onclick","deleteObj(" + familyId + ")");
        });
    }

    function deleteObj(familyId){
        if (confirm("移除该家庭吗？")){
            $("#" + familyId + "").remove();
        }
    }

    function backData(familyId) {
        $("#myModalCs").modal();
    }
    function submitData() {
        var handDate = $("#handDate").val();
        if (handDate != "") {
            var lis = $("#infoUL").find("li");
            for(var i=0;i<lis.length;i++){
                var id = lis[i].id;
                var handUpDate = $("#handDate").val();
                $.get("handPcNum",{xfFamilyId:id,handUpDate:handUpDate, _time: new Date().getTime()},function(){
                })
            }
            window.location="/cq/family/handed";
        } else {
            alert("必须填写批次时间！");
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