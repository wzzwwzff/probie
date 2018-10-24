<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/7/25
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fieldset>
    <legend>一、被拆迁人情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">组别：</td>
            <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
            <td class="fieldName">编号：</td>
            <td class="fieldValue">${family.familyCode} </td>
        </tr>
        <tr>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">${family.name}
            </td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue">${family.idCard}
        </tr>
        <tr>
            <td class="fieldName">安置人口：</td>
            <td class="fieldValue" colspan="3">${personStr},共${family.personNum}人,其中独生子女为：${empty personOne?"/":personOne},共${family.personOne}人。
                <span style="font-size: 15px;"><b><a href="azPersonForm?familyId=${family.id}">修改</a></b></span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue">${family.phone}</td>
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue" colspan="3">${family.houseAddress}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、其他信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">低保【证】：</td>
            <td class="fieldValue"><input class="form-control_short digits" type="text" name="dbNum" size="8"
                                          value="${family.dbNum}"/>
            </td>
            <td class="fieldName">残疾【证】：</td>
            <td class="fieldValue"><input class="form-control_short digits" type="text" name="cjNum" size="8"
                                          value="${family.cjNum}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">大病【人】：</td>
            <td class="fieldValue"><input class="form-control_short digits" type="text" name="dabNum" size="8" value="${family.dabNum}"/></td>
            <td class="fieldName">独生子女人口【人】：</td>
            <td class="fieldValue"><input class="form-control_short digits" style="background-color: lightgrey;" readonly type="text" name="personOne" size="8" value="${family.personOne}"/></td>
        </tr>
        <tr>
            <td class="fieldName">是否符合住房困难补助标准：</td>
            <td class="fieldValue"><tags:dataDictRadio name="isZfkn" dataDict="是否符合住房困难补助标准" value="${family.isZfkn}"/></td>
            <td class="fieldName"><span class="confir">住房困难补助费：</span></td>
            <td class="fieldValue"><span class="confir"><input type="text" class="form-control_short number" name="zfknFee"
                                                               size="8" value="${family.zfknFee}"/></span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">是否符合停产停业补助标准：</td>
            <td class="fieldValue"><tags:dataDictRadio name="isTcty" dataDict="是否符合停产停业补助标准" value="${family.isTcty}"/></td>
            <td class="fieldName"><span class="confirFree">停产停业补助：</span></td>
            <td class="fieldValue"><span class="confirFree"><input type="text" class="form-control_short number" name="tctyfFee"
                                                               size="8" value="${family.tctyfFee}"/></span>
            </td>
        </tr>
        </tbody>
    </table>
    <script>
        $(document).ready(function () {
            $(".confir").hide();
            $(".confirFree").hide();

            //验证是否符合住房困难补助标准
            validateBusiness();
            $("input[name='isZfkn']").click(function () {
                validateBusiness();
            })
            //验证是否符合住房困难补助标准，并选择显示confir内容
            function validateBusiness() {
                var value = $("input[name='isZfkn']:checked").val();
                if (value == "2") {
                    $(".confir").show();
                }
                if (value == "1") {
                    $(".confir").hide();
                }
            }

            //验证是否符合停产停业补助标准
            validateTcty();
            $("input[name='isTcty']").click(function () {
                validateTcty();
            })
            //验证是否符合停产停业补助标准，并选择显示confirFree内容
            function validateTcty() {
                var value = $("input[name='isTcty']:checked").val();
                if (value == "2") {
                    $(".confirFree").show();
                }
                if (value == "1") {
                    $(".confirFree").hide();
                }
            }
        });
    </script>
</fieldset>
