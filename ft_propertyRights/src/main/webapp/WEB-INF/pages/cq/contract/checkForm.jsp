<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>合同备案管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h3>合同备案管理<span style="color: red"> 【数据状态：<tags:dataDict dataDict="合同数据状态" value="${contract.status}"/>】</span></h3>
</div>
<div class="content">
    <div class="doc-content">
        <div class="text-center">
            <button type="button" class="btn btn-primary" onclick="handUp(${contract.id});"><i
                    class="fa fa-check"></i> 锁定
            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-danger" onclick="backData();"><i
                    class="fa fa-arrow-down"></i> 退回
            </button>
        </div>
        <fieldset>
            <label>合同信息</label>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">申请编号：</td>
                    <td class="fieldValue">c</td>
                    <td class="fieldName">合同编号：</td>
                    <td class="fieldValue">${contract.contractCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">产权人姓名：</td>
                    <td class="fieldValue">${contract.name}</td>
                    <td class="fieldName">身份号码：</td>
                    <td class="fieldValue">${contract.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">项目名称：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="项目名称" value="${contract.family.projectName}"/></td>
                    <td class="fieldName">楼号：</td>
                    <td class="fieldValue">${contract.house.buildNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">单元：</td>
                    <td class="fieldValue">${contract.house.unitNum}</td>
                    <td class="fieldName">房号：</td>
                    <td class="fieldValue">${contract.house.houseNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积（㎡）：</td>
                    <td class="fieldValue">${contract.house.buildArea}</td>
                    <td class="fieldName">居室：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="居室" value="${contract.house.houseType}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">合同签订日期：</td>
                    <td class="fieldValue"><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd" /></td>
                    <td class="fieldName">经办人：</td>
                    <td class="fieldValue">${contract.person}</td>
                </tr>
                <tr>
                    <td class="fieldName">销售价格：</td>
                    <td class="fieldValue">${contract.price}</td>
                    <td class="fieldName">产权比例：</td>
                    <td class="fieldValue">${contract.propertyRight}</td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">${contract.memo}</td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <div class="text-center">
            <button type="button" class="btn btn-white" onclick="javascript:history.back();"><i
                    class="fa fa-backward"></i> 返回
            </button>
        </div>
    </div>
    <%--退回原因--%>
    <div class="modal" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-horizontal" id="myFormCs" method="post" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel2">请填写退回原因</h4>
                    </div>
                    <div class="modal-body" id="modalBodyCs">
                        <table class="table table-bordered">
                            <tr>
                                <td class="fieldName">退回原因</td>
                                <td class="fieldValue"><input type="text" id="reasonCs" class="form-control" name="memo"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button id="subButtonCs" type="button" class="btn btn-primary" onclick="submitData(${contract.id})">保存</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });

    //数据锁定
    function handUp(contractId){
        if (confirm("确定锁定此合同数据吗？")){
            $.get("dataHandUp",{contractId:contractId,_date:new Date().getTime()},function(data){
                //window.location.reload();
                if (data.code == "1111") {
                    alert("锁定成功");
                    window.location.href = "checkList?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }
    }

    //数据退回
    function backData() {
        $("#myModalCs").modal({backdrop: false});
    }

    function submitData(contractId) {
        var reasonCs = $("#reasonCs").val();
        if (reasonCs != null && reasonCs != "") {
            $.get("backData",{contractId:contractId,reason:reasonCs,_date:new Date().getTime()},function(data){
                if (data.code == "1111") {
                    alert("退回成功");
                    window.location.href = "checkList?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }else{
            alert("必须填写退回原因！");
        }
    }
</script>
</html>