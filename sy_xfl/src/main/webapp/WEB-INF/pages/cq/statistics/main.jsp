<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>家庭综合查询</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title resizeLayout"><h4>家庭综合查询</h4></div>
<div class="content">
    <div>
        <form class="form-inline" id="myForm" action="result">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName" style="width: 5%">组别：</td>
                    <td class="fieldValue" style="width: 95%">
                        <c:if test="${departmentCode eq '01'}">
                            <input type="hidden" name="search_groupCode_stringArray" value=""/>
                            <a href="javascript:void(0);" name="search_groupCode_string" isMore="true" value=""
                               class="btn btn-primary btn-sm">全部</a>
                            <c:forEach items="${groupMap}" var="group">
                                <a href="javascript:void(0);" name="search_groupCode_string" isMore="true" value="${group.value}"
                                   class="btn btn-link btn-sm one">${group.key}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${departmentCode ne '01'}">
                            <input type="hidden" name="search_groupCode_stringArray" value="${departmentCode}"/>
                            ${groupMapForValue[departmentCode]}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">编号：</td>
                    <td class="fieldValue">
                        <tags:searchInput name="f.familyCode" size="30" className="form-control" fieldType="string" operator="like"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人：</td>
                    <td class="fieldValue">
                        姓名：<tags:searchInput name="f.name" className="form-control" fieldType="string" operator="like"/>
                        身份证号码：<tags:searchInput name="f.idCard" size="30" className="form-control" fieldType="string" operator="like"/>
                        联系电话：<tags:searchInput name="f.phone" size="30" className="form-control" fieldType="string" operator="like"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">房屋情况：</td>
                    <td class="fieldValue">
                        房屋坐落：<tags:searchInput name="f.houseAddress" size="30" className="form-control" fieldType="string" operator="like"/>　　　
                        合法宅基地面积：
                        <tags:searchInput name="f.confirmArea" size="8" fieldType="bigDecimal" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.confirmArea" size="8" fieldType="bigDecimal" operator="le" className="form-control"/>&nbsp;㎡；　　　
                        合法宅基地范围内正式房屋建筑面积：
                        <tags:searchInput name="f.buildArea" size="8" fieldType="bigDecimal" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.buildArea" size="8" fieldType="bigDecimal" operator="le" className="form-control"/>&nbsp;㎡；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">移机项目：</td>
                    <td class="fieldValue">
                        空调：<tags:searchInput name="f.airConditionerNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.airConditionerNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;台；&nbsp;&nbsp;&nbsp;
                        电话：<tags:searchInput name="f.telephoneNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.telephoneNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;部；&nbsp;&nbsp;&nbsp;
                        网络宽带：<tags:searchInput name="f.broadbandNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.broadbandNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;宗；
                        有线电视：<tags:searchInput name="f.tvNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.tvNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;宗；&nbsp;&nbsp;&nbsp;
                        热水器：<tags:searchInput name="f.waterHeaterNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.waterHeaterNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;台；&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td class="fieldName">其他情况：</td>--%>
                    <%--<td class="fieldValue">--%>
                        <%--低保数量：<tags:searchInput name="f.dbNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;--%>
                        <%--<tags:searchInput name="f.dbNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;人；&nbsp;&nbsp;&nbsp;--%>
                        <%--残疾数量：<tags:searchInput name="f.cjNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;--%>
                        <%--<tags:searchInput name="f.cjNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;人；--%>
                        <%--大病数量：<tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;--%>
                        <%--<tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;人；--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="fieldName">安置类型：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_type_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_type_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${azMap}" var="type">
                            <a href="javascript:void(0);" name="search_houseType_integer" isMore="true" value="${type.value}"
                               class="btn btn-link btn-sm">${type.key}</a>
                        </c:forEach>　　　
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">入户时间：</td>
                    <td class="fieldValue"><tags:searchInput name="f.addDate" size="15" fieldType="date" operator="ge" className="form-control_short"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.addDate" size="15" fieldType="date" operator="le" className="form-control_short"/>&nbsp;；</td>
                </tr>
                <tr>
                    <td class="fieldName">户口迁入时间：</td>
                    <td class="fieldValue"><tags:searchInput name="f.moveDate" size="15" fieldType="date" operator="ge" className="form-control_short"/>&nbsp;至&nbsp;
                    <tags:searchInput name="f.moveDate" size="15" fieldType="date" operator="le" className="form-control_short"/>&nbsp;；</td>
                </tr>
                <tr>
                    <td class="fieldName">审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_checkState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_checkState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${checkStateMap}" var="checkState">
                            <a href="javascript:void(0);" name="search_checkState_integer" isMore="true" value="${checkState.value}"
                               class="btn btn-link btn-sm">${checkState.key}</a>
                        </c:forEach>　　　
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">签约状态：</td>
                    <td class="fieldValue">
                        签约状态：<input type="hidden" name="search_qyState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_qyState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${signMap}" var="qyState">
                            <a href="javascript:void(0);" name="search_qyState_integer" isMore="true" value="${qyState.value}"
                               class="btn btn-link btn-sm">${qyState.key}</a>
                        </c:forEach>
                        　　签约时间：<tags:searchInput name="f.qyDate" size="15" fieldType="date" operator="ge" className="form-control_short"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.qyDate" size="15" fieldType="date" operator="le" className="form-control_short"/>&nbsp;；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">交房状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_jfState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_jfState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${jfMap}" var="jfState">
                            <a href="javascript:void(0);" name="search_jfState_integer" isMore="true" value="${jfState.value}"
                               class="btn btn-link btn-sm">${jfState.key}</a>
                        </c:forEach>
                        　　交房时间：<tags:searchInput name="f.jfDate" size="15" fieldType="date" operator="ge" className="form-control_short"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.jfDate" size="15" fieldType="date" operator="le" className="form-control_short"/>&nbsp;；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">拆除、结算状态：</td>
                    <td class="fieldValue">
                        拆除状态：<input type="hidden" name="search_ccState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_ccState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${ccMap}" var="ccState">
                            <a href="javascript:void(0);" name="search_ccState_integer" isMore="true" value="${ccState.value}" class="btn btn-link btn-sm">${ccState.key}</a>
                        </c:forEach>　　　
                        结算状态：<input type="hidden" name="search_jsState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_jsState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${jsMap}" var="jsState">
                            <a href="javascript:void(0);" name="search_ccState_integer" isMore="true" value="${jsState.value}" class="btn btn-link btn-sm">${jsState.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">补充协议签约状态：</td>
                    <td class="fieldValue">
                        签约状态：<input type="hidden" name="search_bcxyState_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_bcxyState_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${signMap}" var="bcxyState">
                            <a href="javascript:void(0);" name="search_bcxyState_integer" isMore="true" value="${bcxyState.value}"
                               class="btn btn-link btn-sm">${bcxyState.key}</a>
                        </c:forEach>
                        　　签约时间：<tags:searchInput name="f.bcxyDate" size="15" fieldType="date" operator="ge" className="form-control_short"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.bcxyDate" size="15" fieldType="date" operator="le" className="form-control_short"/>&nbsp;；
                    </td>
                </tr>
                </tbody>
            </table>
            <%@include file="modal.jsp" %>
        </form>
    </div>
</div>
<div class="footer">
    <%--<button class="btn btn-primary" onclick="searchForm()" style="width: 120px;letter-spacing: 2px;">--%>
        <%--<i class="fa fa-search"></i>&nbsp;查询--%>
    <%--</button>--%>
    <button class="btn btn-primary" onclick="chooseData()" style="width: 120px;letter-spacing: 2px;">
        <i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
<script>
    function searchForm(){
        $("#myForm").submit();
    }
    function setPropertyValues(name) {
        var inputValues = "";
        $("a[name='" + name + "']").each(function () {
            var has = $(this).hasClass("btn-primary");
            if (has) {
                var isMore = $(this).attr("isMore");
                if (isMore == "true") {
                    if (inputValues != "") {
                        inputValues = inputValues + ",";
                    }
                    inputValues = inputValues + $(this).attr("value");
                } else {
                    inputValues = $(this).attr("value");
                }


            }
        });
        $("input:hidden[name='" + name + "Array']").val(inputValues);
    }
    $(function () {
        $("table tr td a").click(function () {
            var name = $(this).attr("name");
            var v = $(this).attr("value");
            var has = $(this).hasClass("btn-primary");
            if (v == "") {//全部
                if (!has) {
                    $(this).addClass("btn-primary");
                }
                $("a[name='" + name + "'][value!='']").removeClass("btn-primary");
            } else {
                $("a[name='" + name + "'][value='']").removeClass("btn-primary");
                if (has) {
                    $(this).removeClass("btn-primary");
                } else {
                    $(this).addClass("btn-primary");
                }
                var isMore = $(this).attr("isMore");
                if (isMore == "false") {
                    $("a[name='" + name + "'][value!='" + v + "']").removeClass("btn-primary");
                }
            }
            setPropertyValues(name);
        });
    });
</script>
</body>
</html>