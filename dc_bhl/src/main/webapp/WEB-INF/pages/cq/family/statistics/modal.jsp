<%@ page import="com.app.cq.map.FamilyExcelMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1200px;height: 1200px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">筛选导出信息</h4>
            </div>
            <style>
                .checkbox label input{width: 20px;height: 20px;}
                .checkbox  label{font-size: 18px}
            </style>
            <div class="modal-body" id="modalBody">
                <c:set var="jspShowMap" value="<%=FamilyExcelMap.jspShowMap()%>"/>
                <c:forEach items="${jspShowMap}" var="item" varStatus="status">
                    <c:if test="${status.count ne 1}">
                        <hr/>
                    </c:if>
                    <h2>${status.count}.${item.key}
                        <label class="checkbox-inline">
                            <input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll${status.count} form-control"/>全选/反选
                        </label>
                    </h2>
                    <div class="checkbox">&nbsp;
                        <c:forEach items="${item.value}" var="child">
                            <label class="checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}"
                                       class="checkItem${status.count} form-control"/>${child.value}
                            </label>
                        </c:forEach>
                    </div>
                </c:forEach>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary btn-sm" type="button" onclick="resultExcel()"><i
                            class="fa fa-save"></i>&nbsp;导出
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function chooseData() {
        $("#myModal").modal();
    }

    function resultExcel() {
        location.href = "resultExcel?" + $("#myForm").serialize();
    }

    $(function () {
        checkMethod();
    });
    function checkMethod() {
        $(".checkAll1").click(function () {
            var bl = $(this).is(":checked");      //检查class="checkAll1"的状态
            $(".checkItem1").each(function (key, val) {
                $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
            });
        });
    }
    $(".checkAll2").click(function () {
        var bl = $(this).is(":checked");      //检查class="checkAll2"的状态
        $(".checkItem2").each(function (key, val) {
            $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
        });
    });
    $(".checkAll3").click(function () {
        var bl = $(this).is(":checked");      //检查class="checkAll3"的状态
        $(".checkItem3").each(function (key, val) {
            $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
        });
    });
    $(".checkAll4").click(function () {
        var bl = $(this).is(":checked");      //检查class="checkAll4"的状态
        $(".checkItem4").each(function (key, val) {
            $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
        });
    });
    $(".checkAll5").click(function () {
        var bl = $(this).is(":checked");      //检查class="checkAll5"的状态
        $(".checkItem5").each(function (key, val) {
            $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
        });
    });
    $(".checkAll6").click(function () {
        var bl = $(this).is(":checked");      //检查class="checkAll5"的状态
        $(".checkItem6").each(function (key, val) {
            $(val).prop("checked", bl);       //将name="schemeId"的状态置为和class="allId"的状态一致
        });
    });
</script>

