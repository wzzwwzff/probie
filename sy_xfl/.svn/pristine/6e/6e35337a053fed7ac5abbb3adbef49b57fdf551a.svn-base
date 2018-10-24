<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>评估数据复核上报</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
</head>
<body>


<div class="title"><h4>复核页面【${family.name}，<font color="red">当前状态：</font><font color="green"><tags:dataDict
        dataDict="上报状态" value="${family.pgState}"/></font>】</h4></div>
<div class="content">
    <%@include file="/WEB-INF/pages/cq/common/view/pgView.jsp" %>
    <div class="footer" style="text-align: center">
        <button class="btn btn-success btn-lg" <c:if test="${family.pgState eq 2}"> disabled </c:if>
                onclick="javascript:handUp('${family.id}')"><i class="fa fa-check"></i>复核上报
        </button>
        <button class="btn btn-white btn-lg" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
        </button>
    </div>
</div>
<script>
    // 评估数据上报
    function handUp(familyId, searchParams) {
        var type = "pg";
        if (confirm("确定上报评估数据吗？")) {
            $.get("handUp", {
                familyId: familyId,
                type: type,
                _date: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    window.location.href = "pgCheckList?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }
    }

</script>
</body>
</html>
