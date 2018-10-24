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
                <table class="excelTable table table-bordered">
                    <tr>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="jspShowMap" value="<%=FamilyExcelMap.familyShowMap()%>"/>
                            <c:forEach items="${jspShowMap}" var="item" varStatus="status">
                                <h2>${status.count}.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll1 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem1 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="rdShowMap" value="<%=FamilyExcelMap.houseShowMap()%>"/>
                            <c:forEach items="${rdShowMap}" var="item" varStatus="status">
                                <h2>2.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll2 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem2 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="faShowMap" value="<%=FamilyExcelMap.pgShowMap()%>"/>
                            <c:forEach items="${faShowMap}" var="item" varStatus="status">
                                <h2>3.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll3 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem3 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="xfShowMap" value="<%=FamilyExcelMap.otherShowMap()%>"/>
                            <c:forEach items="${xfShowMap}" var="item" varStatus="status">
                                <h2>4.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll4 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem4 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="qyShowMap" value="<%=FamilyExcelMap.faShowMap()%>"/>
                            <c:forEach items="${qyShowMap}" var="item" varStatus="status">
                                <h2>5.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll5 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem5 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                        <td style="width: 16%;vertical-align: top">
                            <c:set var="xfShowMap" value="<%=FamilyExcelMap.stateShowMap()%>"/>
                            <c:forEach items="${xfShowMap}" var="item" varStatus="status">
                                <h2>6.${item.key}<label class="checkbox-inline"><input type="checkbox" style="width: 20px;height: 20px;font-size: 22px" class="checkAll6 form-control"/>全选/反选</label></h2>
                                <div class="checkbox" style="text-align: left">
                                    <c:forEach items="${item.value}" var="child" varStatus="status1">
                                        <label><input style="width: 20px;height: 20px;" type="checkbox" name="${child.key}" class="checkItem6 form-control"/>
                                        <span style="vertical-align: middle">${child.value}&nbsp;&nbsp;</span></label><c:if test="${status1.index !=0 && (status1.index) %2 == 0}"><br/></c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </td>
                    </tr>
                </table>
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

