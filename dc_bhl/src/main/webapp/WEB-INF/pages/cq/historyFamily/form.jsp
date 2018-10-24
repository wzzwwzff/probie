<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史签约数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#form").validate({
                rules: {
                    familyCode:{
                        remote: "checkRepeat?historyFamilyId=${historyFamily.id}&_mydate=" + new Date().getTime()
                    }
                },
                messages: {
                    familyCode: {
                        remote: "家庭编号已存在"
                    }
                }
            });
        });

        function addRow1() {
            var rowIndex = $("#personTable tr").length - 1;
            $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
            $("#personTable tr:last input").each(function () {
                $(this).val("");
            });
        }

        function addRow2() {
            var rowIndex = $("#houseTable tr").length - 1;
            $("#houseTable tr:last").clone().insertAfter($("#houseTable tr:eq(" + rowIndex + ")"))
            $("#houseTable tr:last input").each(function () {
                $(this).val("");
            });
        }
    </script>
</head>
<body>
<div class="title">
    <h5>历史签约数据登记</h5>
</div>
<form id="form" class="form-inline" method="post" action="save?<tags:searchParams/>">
    <input type="hidden" name="historyFamilyId" id="historyFamilyId" value="${historyFamily.id}"/>
    <div class="content">
        <fieldset>
            <legend>一、被拆迁人信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">编号</td>
                    <td class="fieldValue"><input type="text" class="form-control required" name="familyCode" placeholder="必填项" value="${historyFamily.familyCode}"/><span class="require">*</span></td>
                    <td class="fieldName">联系电话</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="tel" value="${historyFamily.tel}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人</td>
                    <td class="fieldValue"><input type="text" class="form-control required" name="name" placeholder="必填项" value="${historyFamily.name}"/><span class="require">*</span></td>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="idCard" size="36" value="${historyFamily.idCard}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">通信地址</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="mailAddress" size="30" value="${historyFamily.mailAddress}"/></td>
                    <td class="fieldName">邮政编码</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="mailCode" value="${historyFamily.mailCode}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">正式户口</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="hjNum" size="30" value="${historyFamily.hjNum}"/></td>
                    <td class="fieldName">安置人口</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="azPersonNum" value="${historyFamily.azPersonNum}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人与产权人/承租人关系</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="relation" value="${historyFamily.relation}"/></td>
                    <td class="fieldName">是否有补充协议</td>
                    <td class="fieldValue"><tags:dataDictRadio dataDict="是否" name="bcStatus" value="${historyFamily.bcStatus}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、房屋基本信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">地址门牌</td>
                    <td class="fieldValue" colspan="3"><input type="text" size="50" class="form-control" name="address" value="${historyFamily.address}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产别</td>
                    <td class="fieldValue">
                        <tags:dataDictRadio dataDict="房屋产别" name="houseType" value="${historyFamily.houseType}"/>
                    </td>
                    <td class="fieldName">产权单位</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="houseCompany" size="50" value="${historyFamily.houseCompany}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">房屋类型</td>
                    <td class="fieldValue">
                        <tags:dataDictRadio dataDict="房屋类型" name="houseStyle" value="${historyFamily.houseStyle}"/>
                    </td>
                    <td class="fieldName">间数</td>
                    <td class="fieldValue"><input type="text" class="form-control number" name="houseNum" size="5" value="${historyFamily.houseNum}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">使用面积</td>
                    <td class="fieldValue"><input type="text" class="form-control number" size="10" name="useArea" value="${historyFamily.useArea}"/>㎡</td>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue"><input type="text" class="form-control number" size="10" name="buildArea" value="${historyFamily.buildArea}"/>㎡</td>
                </tr>
                <tr>
                    <td class="fieldName">营业面积</td>
                    <td class="fieldValue"><input type="text" class="form-control number" size="10" name="businessArea" value="${historyFamily.businessArea}"/>㎡</td>
                    <td class="fieldName">营业执照号</td>
                    <td class="fieldValue"><input type="text" class="form-control" name="businessCode" value="${historyFamily.businessCode}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">用途</td>
                    <td class="fieldValue" colspan="3">
                        <tags:dataDictRadio dataDict="住宅房屋用途" name="houseUse" value="${historyFamily.houseUse}"/>
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>三、安置人口</legend>
            <table class="table table-bordered" id="personTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 20%">类别</td>
                    <td class="fieldName" style="text-align: center;width: 20%">姓名</td>
                    <td class="fieldName" style="text-align: center;width: 40%">身份证号</td>
                </tr>
                <c:forEach begin="0" end="${4+fn:length(historyFamilyPersonList)}" var="i">
                    <c:set var="historyFamilyPerson" value="${historyFamilyPersonList[i]}"/>
                    <tr>
                        <input type="hidden" name="hfp_id" value="${historyFamilyPerson.id}"/>
                        <td style="text-align: center;">
                            <tags:dataDictInput dataDict="安置人口类别" name="hfp_type" value="${historyFamilyPerson.type}" className="form-control" firstValue="-请选择-"/>
                        </td>
                        <td style="text-align: center;"><input type="text" class="form-control" name="hfp_name" value="${historyFamilyPerson.name}"/></td>
                        <td style="text-align: center;"><input type="text" size="40" class="form-control" name="hfp_idCard" value="${historyFamilyPerson.idCard}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow1()" value="添加新行"/></div>
        </fieldset>
        <fieldset>
            <legend>四、安置房源</legend>
            <table class="table table-bordered" id="houseTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 25%">项目名称</td>
                    <td class="fieldName" style="text-align: center;width: 10%">楼号</td>
                    <td class="fieldName" style="text-align: center;width: 10%">单元</td>
                    <td class="fieldName" style="text-align: center;width: 10%">房号</td>
                    <td class="fieldName" style="text-align: center;width: 10%">居室</td>
                    <td class="fieldName" style="text-align: center;width: 10%">户型</td>
                    <td class="fieldName" style="text-align: center;width: 10%">建筑面积/㎡</td>
                </tr>
                <c:forEach begin="0" end="${1+fn:length(historyFamilyHouseList)}" var="i">
                    <c:set var="historyFamilyHouse" value="${historyFamilyHouseList[i]}"/>
                    <tr>
                        <input type="hidden" name="fh_id" value="${historyFamilyPerson.id}"/>
                        <td><input type="text" class="form-control" name="fh_projectName" size="50" value="${historyFamilyHouse.projectName}"/></td>
                        <td><input type="text" class="form-control" name="fh_buildNum" value="${historyFamilyHouse.buildNum}"/></td>
                        <td><input type="text" class="form-control" name="fh_unitNum" value="${historyFamilyHouse.unitNum}"/></td>
                        <td><input type="text" class="form-control" name="fh_houseNum" value="${historyFamilyHouse.houseNum}"/></td>
                        <td>
                            <tags:dataDictInput dataDict="房屋居室" name="fh_houseType" value="${historyFamilyHouse.houseType}" className="form-control" firstValue="-请选择-"/>
                        </td>
                        <td><input type="text" class="form-control" name="fh_houseHold" value="${historyFamilyHouse.houseHold}"/></td>
                        <td><input type="text" class="form-control number" name="fh_buildArea" value="${historyFamilyHouse.buildArea}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow2()" value="添加新行"/></div>
        </fieldset>
        <fieldset>
            <legend>五、协议款项</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">购房款合计/元</td>
                    <td class="fieldValue"><input type="text" class="form-control number" name="buyHouseMoney" value="${historyFamily.buyHouseMoney}"/></td>
                    <td class="fieldName">公共维修基金/元</td>
                    <td class="fieldValue"><input type="text" class="form-control number" name="gwMoney" value="${historyFamily.gwMoney}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">贷款人民币/元</td>
                    <td class="fieldValue" colspan="3"><input type="text" class="form-control number" name="dkMoney" value="${historyFamily.dkMoney}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>六、其他信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName" style="width: 15%;">签约日期</td>
                    <fmt:formatDate var="signDate" value="${empty historyFamily.signDate ? '' : historyFamily.signDate}" pattern="yyyy-MM-dd"/>
                    <td class="fieldValue" style="width: 85%;"><input type="text" class="form-control form-date-time dateISO" style="width: 130px;height: 36px;" name="signDate" value="${signDate}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">备注</td>
                    <td class="fieldValue"><textarea class="form-control" type="text" name="memo" cols="120" rows="6">${historyFamily.memo}</textarea></td>
                </tr>
            </table>
        </fieldset>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
