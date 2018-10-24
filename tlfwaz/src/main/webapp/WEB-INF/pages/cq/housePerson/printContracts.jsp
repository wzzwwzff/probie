<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/static/common/common.jsp" %>
    <title>协议打印</title>
    <script>
        function toPrintBg() {
            document.getElementById("printIframe").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe").contentWindow.print();
        }

        function toPrintBgjc() {
            document.getElementById("printIframe1").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe1").contentWindow.print();
        }

        function toPrintJg() {
            document.getElementById("printIframe2").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe2").contentWindow.print();
        }
        function toPrintRg() {
            document.getElementById("printIframe3").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe3").contentWindow.print();
        }
    </script>
</head>
<body>
<div class="title" id="printDiv">
    <h4>【${family.name}】协议</h4>
    <div id="printButton" style="position: absolute;top: 8px;right: 15px;">
        <button type="button" class="btn btn-primary" onclick="toPrint()"><i class="fa fa-print"></i>&nbsp;打印</button>
        <button type="button" class="btn btn-primary" onclick="location.href='list?<tags:searchParams/>'"><i class="fa fa-backward"></i>&nbsp;返回
        </button>
    </div>
</div>
<table width="100%">
    <tr>
        <td style="vertical-align: top;height: 100%;">
            <h3>　基础信息：</h3>
            <h3>　档案编号：${family.familyCode}</h3>
            <h3>　被征收人：${family.name}</h3>
            <h3>　联系地址：${family.address}</h3>
            <h3>　签约状态：
                <c:if test="${family.signStatus eq 2}">
                    <span style="color: green;font-weight: bold;">已签约</span>
                </c:if>
                <c:if test="${family.signStatus eq 1}">
                    <span class="require">暂未签约</span>
                </c:if>
            </h3>
            <hr/>
            <h3>　签约明细：</h3>
            <c:if test="${house.inheritType ne 1}">
                <h3>　第①步：<input type="button" class="btn btn-primary btn-lg" value="变更购房人申请书" onclick="toPrintBg()"/></h3>
            </c:if>
            <c:if test="${house.inheritType eq 1}">
                <h3>　第①步：<input type="button" class="btn btn-primary btn-lg" value="变更购房人申请书（继承）" onclick="toPrintBgjc()"/></h3>
            </c:if>
            <h3>　第②步：<input type="button" class="btn btn-primary btn-lg" value="变更购房人结果通知单" onclick="toPrintJg()"/></h3>
            <h3>　第③步：<input type="button" class="btn btn-primary btn-lg" value="认购协议（变更后购房人）" onclick="toPrintRg()"/></h3>
        </td>
        <td width="75%" height="850px">
            <center>
                <iframe id="printIframe" src="printApplyPDF?familyId=${family.id}&houseId=${house.id}#toolbar=0"
                        style="width: 100%;height: 99%;"></iframe>
            </center>
            <center hidden="">
                <iframe id="printIframe1" src="printApply2PDF?familyId=${family.id}&houseId=${house.id}#toolbar=0"
                        style="width: 100%;height: 99%;"></iframe>
            </center>
            <center hidden="">
                <iframe id="printIframe2" src="printResultPDF?familyId=${family.id}&houseId=${house.id}#toolbar=0"
                        style="width: 100%;height: 99%;"></iframe>
            </center>
            <center hidden="">
                <iframe id="printIframe3" src="printAgreementPDF?familyId=${family.id}&houseId=${house.id}#toolbar=0"
                        style="width: 100%;height: 99%;"></iframe>
            </center>
        </td>
    </tr>
</table>
</body>
</html>

