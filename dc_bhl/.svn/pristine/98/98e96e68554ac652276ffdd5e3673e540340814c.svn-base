<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
        <form class="form-inline" id="myForm" action="result">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName" style="width: 5%">分指：</td>
                    <td class="fieldValue" style="width: 95%">
                        <c:if test="${departmentCode eq '110'}">
                            <input type="hidden" name="search_bdCode_stringArray" value=""/>
                            <a href="javascript:void(0);" name="search_bdCode_string" isMore="true" value=""
                               class="btn btn-primary btn-sm">全部</a>
                            <c:forEach items="${bdMap}" var="bd">
                                <a href="javascript:void(0);" name="search_bdCode_string" isMore="true" value="${bd.value}"
                                   class="btn btn-link btn-sm one">${bd.key}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${departmentCode ne '110'}">
                            <input type="hidden" name="search_bdCode_stringArray" value="${departmentCode}"/>
                            ${bdMapForValue[departmentCode]}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 5%">组别：</td>
                    <td class="fieldValue" style="width: 95%">
                        <c:if test="${departmentCode eq '110'}">
                            <input type="hidden" name="search_groupCode_stringArray" value=""/>
                            <a href="javascript:void(0);" name="search_groupCode_string" isMore="true" value=""
                               class="btn btn-primary btn-sm">全部</a>
                            <c:forEach items="${groupMap}" var="group">
                                <a href="javascript:void(0);" name="search_groupCode_string" isMore="true" value="${group.value}"
                                   class="btn btn-link btn-sm one">${group.key}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${departmentCode ne '110'}">
                            <input type="hidden" name="search_groupCode_stringArray" value="${departmentCode}"/>
                            ${groupMapForValue[departmentCode]}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">家庭编号：</td>
                    <td class="fieldValue">
                        <tags:searchInput name="f.familyCode" size="30" className="form-control" fieldType="string" operator="like"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">地址门牌	：</td>
                    <td class="fieldValue">
                        <tags:searchInput name="f.address" size="30" className="form-control" fieldType="string" operator="like"/>
                    </td>
                </tr>

                <tr>
                    <td class="fieldName">被拆迁人：</td>
                    <td class="fieldValue">
                        姓名：<tags:searchInput name="f.name" className="form-control" fieldType="string" operator="like"/>
                        身份证号：<tags:searchInput name="f.idCard" size="30" className="form-control" fieldType="string" operator="like"/>
                        联系电话：<tags:searchInput name="f.tel" size="30" className="form-control" fieldType="string" operator="like"/>
                    </td>
                </tr>

                <tr>
                    <td class="fieldName">房屋产别：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_houseType_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_houseType_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${houseTypeMap}" var="houseType">
                            <a href="javascript:void(0);" name="search_houseType_integer" isMore="true" value="${houseType.value}"
                               class="btn btn-link btn-sm">${houseType.key}</a>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <td class="fieldName">房屋类型：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_houseStyle_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_houseStyle_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${houseStyleMap}" var="houseStyle">
                            <a href="javascript:void(0);" name="search_houseStyle_integer" isMore="true" value="${houseStyle.value}"
                               class="btn btn-link btn-sm">${houseStyle.key}</a>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <td class="fieldName">房屋用途：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_houseUse_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_houseUse_integer" isMore="true" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${houseUseMap}" var="houseUse">
                            <a href="javascript:void(0);" name="search_houseUse_integer" isMore="true" value="${houseUse.value}"
                               class="btn btn-link btn-sm">${houseUse.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">
                        使用面积：
                    </td>
                    <td class="fieldValue">
                        <tags:searchInput name="f.useArea" size="8" fieldType="bigDecimal" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.useArea" size="8" fieldType="bigDecimal" operator="le" className="form-control"/>&nbsp;㎡；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">
                        建筑面积：
                    </td>
                    <td class="fieldValue">
                       <tags:searchInput name="f.buildArea" size="8" fieldType="bigDecimal" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.buildArea" size="8" fieldType="bigDecimal" operator="le" className="form-control"/>&nbsp;㎡；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">
                        房屋间数：
                    </td>
                    <td class="fieldValue">
                      <tags:searchInput name="f.houseNum" size="8" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.houseNum" size="8" fieldType="integer" operator="le" className="form-control"/>&nbsp;间；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">移机项目：</td>
                    <td class="fieldValue">
                        空调：<tags:searchInput name="f.ktNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.ktNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;台；&nbsp;&nbsp;&nbsp;
                        电话：<tags:searchInput name="f.dhNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.dhNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;部；&nbsp;&nbsp;&nbsp;
                        有线电视：<tags:searchInput name="f.yxNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.yxNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;端；&nbsp;&nbsp;&nbsp;
                        热水器：<tags:searchInput name="f.rsqNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.rsqNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;台；&nbsp;&nbsp;&nbsp;
                        宽带：<tags:searchInput name="f.kdNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.kdNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;部；
                    </td>
                </tr>

                <tr>
                    <td class="fieldName">其他情况：</td>
                    <td class="fieldValue">
                        低保：<tags:searchInput name="f.dbNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.dbNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;证；&nbsp;&nbsp;&nbsp;
                        残疾：<tags:searchInput name="f.cjNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.cjNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;证；
                        大病：<tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;证；
                        低收入家庭救助：<tags:searchInput name="f.lowNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;证；
                        现役军人：<tags:searchInput name="f.armyNum" size="5" fieldType="integer" operator="ge" className="form-control"/>&nbsp;至&nbsp;
                        <tags:searchInput name="f.dabNum" size="5" fieldType="integer" operator="le" className="form-control"/>&nbsp;人；
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">补偿方式：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_bcType_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_bcType_integer" isMore="false" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${bcTypeMap}" var="bcType">
                            <a href="javascript:void(0);" name="search_bcType_integer" isMore="false" value="${bcType.value}"
                               class="btn btn-link btn-sm">${bcType.key}</a>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">签约状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_signStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_signStatus_integer" isMore="false" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${signMap}" var="signStatus">
                            <a href="javascript:void(0);" name="search_signStatus_integer" isMore="false" value="${signStatus.value}"
                               class="btn btn-link btn-sm">${signStatus.key}</a>
                        </c:forEach>
                        签约日期：<tags:searchInput name="f.signDate"  fieldType="date" operator="ge" className="form-control"/>至&nbsp;
                        <tags:searchInput name="f.signDate"  fieldType="date" operator="le" className="form-control"/>
                        <span style="font-weight: bold;color: red;">日期左包含右不含</span>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">交房状态：</td>
                    <td class="fieldValue">
                        <input type="hidden" name="search_jfStatus_integerArray" value=""/>
                        <a href="javascript:void(0);" name="search_jfStatus_integer" isMore="false" value="" class="btn btn-primary btn-sm">全部</a>
                        <c:forEach items="${jfMap}" var="jfStatus">
                            <a href="javascript:void(0);" name="search_jfStatus_integer" isMore="false" value="${jfStatus.value}"
                               class="btn btn-link btn-sm">${jfStatus.key}</a>
                        </c:forEach>
                        交房日期：<tags:searchInput name="f.jfDate"  fieldType="date" operator="ge" className="form-control"/>至&nbsp;
                        <tags:searchInput name="f.jfDate"  fieldType="date" operator="le" className="form-control"/>
                        <span style="font-weight: bold;color: red;">日期左包含右不含</span>
                    </td>
                </tr>
                </tbody>
            </table>
            <br/><br/><br/>
            <%@include file="modal.jsp" %>
        </form>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" onclick="searchForm()" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-search"></i>&nbsp;查询</button>
    <button class="btn btn-primary" onclick="chooseData()" style="width: 180px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;（筛选）导出Excel</button>
    <button class="btn btn-primary" onclick="location.href='houseStatusExcel'" style="width: 200px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出标准自建房信息</button>
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
