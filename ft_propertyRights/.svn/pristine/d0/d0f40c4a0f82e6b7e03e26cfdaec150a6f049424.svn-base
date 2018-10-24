<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>综合统计查询</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        table {
            borde: 1px;
        }
    </style>
</head>
<body style="overflow: auto;">
<div class="title">
    <h4 id="installing"> <b>综合统计查询</b></h4>
</div>
<div class="content">
        <form class="form-inline" id="myForm" action="result">
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName" style="width: 15%">项目名称：</td>
                    <td class="fieldValue" style="width: 85%">
                        <input type="hidden" name="search_f.projectName_stringArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.projectName_string" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${projectName}" var="projectName">
                            <a href="javascript:void(0);" name="search_f.projectName_string" isMore="false"
                               value="${projectName.value}" class="btn btn-sm">${projectName.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">申请编号：</td>
                    <td class="fieldValue"><tags:searchInput name="f.familyCode" fieldType="string" size="40" operator="like"/></td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">申请人：</td>
                    <td class="fieldValue"><tags:searchInput name="f.name" fieldType="string" size="40" operator="like"/></td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">身份证号：</td>
                    <td class="fieldValue"><tags:searchInput name="f.idCard" fieldType="string" size="40" operator="like"/></td>

                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">户籍：</td>
                    <td class="fieldValue"><tags:searchInput name="f.address" fieldType="string" size="40" operator="like"/></td>
                </tr>
                <%--<tr>
                    <td class="fieldName" style="width: 10%">通讯地址：</td>
                    <td class="fieldValue"><tags:searchInput name="f.currentAddres" fieldType="string" size="40" operator="like"/></td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">联系电话：</td>
                    <td class="fieldValue"><tags:searchInput name="f.phone" fieldType="string" size="40" operator="like"/></td>
                </tr>--%>
                <tr>
                    <td class="fieldName" style="width: 10%">学历层次：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.education_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.education_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${education}" var="education">
                            <a href="javascript:void(0);" name="search_f.education_integer" isMore="false"
                               value="${education.value}" class="btn btn-sm">${education.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">学习形式：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.learning_stringArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.learning_string" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${learning}" var="learning">
                            <a href="javascript:void(0);" name="search_f.learning_string" isMore="false"
                               value="${learning.value}" class="btn btn-sm">${learning.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">签约状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.signStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.signStatus_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${signStatusMap}" var="signStatusMap">
                            <a href="javascript:void(0);" name="search_f.signStatus_integer" isMore="false"
                               value="${signStatusMap.value}" class="btn btn-sm">${signStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">数据状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.dataStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.dataStatus_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${dataStatusMap}" var="dataStatusMap">
                            <a href="javascript:void(0);" name="search_f.dataStatus_integer" isMore="false"
                               value="${dataStatusMap.value}" class="btn btn-sm">${dataStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">合同数据状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_c.status_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_c.status_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${statusMap}" var="statusMap">
                            <a href="javascript:void(0);" name="search_c.status_integer" isMore="false"
                               value="${statusMap.value}" class="btn btn-sm">${statusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">家庭类型：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.familyType_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.familyType_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${familyTypeMap}" var="familyTypeMap">
                            <a href="javascript:void(0);" name="search_f.familyType_integer" isMore="false"
                               value="${familyTypeMap.value}" class="btn btn-sm">${familyTypeMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <td class="fieldName" style="width: 10%">住房审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.houseStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.houseStatus_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${houseStatusMap}" var="houseStatusMap">
                            <a href="javascript:void(0);" name="search_f.houseStatus_integer" isMore="false"
                               value="${houseStatusMap.value}"
                               class="btn btn-sm">${houseStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">社保审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.socialStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.socialStatus_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${socialStatusMap}" var="socialStatusMap">
                            <a href="javascript:void(0);" name="search_f.socialStatus_integer" isMore="false"
                               value="${socialStatusMap.value}"
                               class="btn btn-sm">${socialStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">婚姻审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.marriageStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.marriageStatus_integer" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${marriageStatusMap}" var="marriageStatusMap">
                            <a href="javascript:void(0);" name="search_f.marriageStatus_integer" isMore="false"
                               value="${marriageStatusMap.value}"
                               class="btn btn-sm">${marriageStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">年龄审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.ageStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.ageStatus_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${ageStatusMap}" var="ageStatusMap">
                            <a href="javascript:void(0);" name="search_f.ageStatus_integer" isMore="false"
                               value="${ageStatusMap.value}"
                               class="btn btn-sm">${ageStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">学历审核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.educationStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.educationStatus_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${educationStatusMap}" var="educationStatusMap">
                            <a href="javascript:void(0);" name="search_f.educationStatus_integer" isMore="false"
                               value="${educationStatusMap.value}"
                               class="btn btn-sm">${educationStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">资格复核状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.seniorityStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.seniorityStatus_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${reviewStatusMap}" var="reviewStatusMap">
                            <a href="javascript:void(0);" name="search_f.seniorityStatus_integer" isMore="false"
                               value="${reviewStatusMap.value}"
                               class="btn btn-sm">${reviewStatusMap.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">是否本区：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.thisArea_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.thisArea_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${isBeijingArea}" var="isBeijingArea">
                            <a href="javascript:void(0);" name="search_f.thisArea_integer" isMore="false"
                               value="${isBeijingArea.value}"
                               class="btn btn-sm">${isBeijingArea.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">是否优先组：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.firstOrNot_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.firstOrNot_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${isFirstGroup}" var="isFirstGroup">
                            <a href="javascript:void(0);" name="search_f.firstOrNot_integer" isMore="false"
                               value="${isFirstGroup.value}"
                               class="btn btn-sm">${isFirstGroup.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 10%">是否园区：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_f.thisPark_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_f.thisPark_integer"
                                              value=""
                                              class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${thisPark}" var="thisPark">
                            <a href="javascript:void(0);" name="search_f.thisPark_integer" isMore="false"
                               value="${thisPark.value}"
                               class="btn btn-sm">${thisPark.key}</a>
                        </c:forEach>
                    </td>
                </tr>
            </table>
            <hr>
            <%@include file="modal.jsp" %>
            <div class="footer">
                <button class="btn btn-primary" type="button" onclick="searchForm();"><i class="fa fa-search"></i>&nbsp;查询
                </button>
                <button class="btn btn-primary" type="button" onclick="chooseData();"><i class="fa fa-search"></i>&nbsp;筛选导出
                </button>
            </div>
        </form>
</div>
</body>
<script>

    function searchForm() {
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

    function setPropertyValues(name) {
        var inputValues = "";
        $("a[name='" + name + "']").each(function () {
            var has = $(this).hasClass("btn-primary");
            if (has) {
//                var isMore = $(this).attr("isMore");
//                if (isMore == "true") {
//                    if (inputValues != "") {
//                        inputValues = inputValues + ",";
//                    }
//                    inputValues = inputValues + $(this).attr("value");
//                } else {
                inputValues = $(this).attr("value");
//                }
            }
        });
        $("input:hidden[name='" + name + "Array']").val(inputValues);
    }

    //处理复选框
    $(".tit .all").click(function () {
        var status = $(this).is(":checked");
        var type = $(this).parent().parent().parent().attr("id");
        if (status == false) {
            $("." + type).each(function () {
                $(this).remove("checked");
                $(this).attr("checked", false);
            });
        } else {
            $("." + type).each(function () {
//                $(this).remove("checked");
                $(this).prop('checked', true);
            });
        }
    });

    function getForm() {
        //设置数据回显
        var nameList = "${sessionScope.checkBox_nameList}";
        var array = new Array();
        <c:forEach items="${sessionScope.checkBox_nameList}" var="name">
        array.push('${name}');
        </c:forEach>
        for (var i = 0; i < array.length; i++) {
            var name = array[i];
            $("input[name='" + name + "']").prop("checked", true);
        }
        if (nameList == null) {
            $("input[type='checkbox']").each(function () {
                $(this).attr("checked", "true");
            });
        }

        $("#myModal").modal();
    }
</script>
</html>