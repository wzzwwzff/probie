<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${family.signStatus eq 1}">
    <div  style="margin-top: 20px;font-size: 30px;">
        该户还未签约！
    </div>
</c:if>
<c:if test="${family.signStatus eq 2}">
    <div style="height: 800px;">
        <iframe src="/cq/chooseHouse/printAgreementPDF?familyId=${family.id}#toolbar=0" style="width: 100%;height: 99%;"></iframe>
    </div>
</c:if>
<script>
    function printPage() {
        $(".printHide").hide();
        window.print();
        $(".printHide").show();
    }
</script>
