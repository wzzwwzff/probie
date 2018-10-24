<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/1
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <title>安置人口数据修改</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
    <style>
        .grey {
            background-color: #ccc;
            border: 1px solid #000000;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".confir").hide();
            $("#inputForm").validate({
                rules: {
                    familyCode:{
                        remote: "checkRepeat?familyId=${family.id}&_mydate=" + new Date().getTime()
                    }
                },
                messages: {
                    familyCode: {
                        remote: "编号已经存在"
                    }
                }
            });
            //验证身份证号
            $(".idCard").each(function(){
                validateIdCard($(this));
            })
            $(".idCard").blur(function(){
                validateIdCard($(this));
            })
            $("input").each(function () {
                if ($(this).attr("readonly")) {
                    $(this).addClass("grey");
                }
            })
            $(".fee").change(function () {
                moneyTotal("fee");
            });
            //验证是否营业
            validateBusiness();
            $("input[name='isBussess']").click(function () {
                validateBusiness();
                validateManager();
            })
            //验证是否免税
            validateDutyFree();
            $("input[name='isDutyFree']").click(function () {
                validateDutyFree();
                validateManager();
            })
            validateManager();
            $("input[name='tctyfFee']").blur(function(){
                validateManager();
            })
            $("input[name='bussessArea']").blur(function(){
                validateManager();
            })

            $(".tt").change(function(){
                setTitle($(this));
            })
        });

        function wrapData(v) {
            var reg = /^[-\+]?\d+(\.\d+)?$/;
            v = !reg.test(v) ? 0 : v;
            return v;
        }
        function addRow1() {
            var rowIndex = $("#personTable tr").length - 1;
            $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
            $("#personTable tr:last input").each(function () {
                $(this).val("");
            });

            $("input[name='f_idCard']").blur(function(){
                validateIdCard($(this));
            });
            $("input[name='f_address']").change(function(){
                setTitle($(this));
            });
            $("input[name='f_memo']").change(function(){
                setTitle($(this));
            })
        }

        function deleteTr1(obj) {//删除人口行
            obj.parent().parent().remove();
        }

        //验证身份证号
        function validateIdCard(obj){
            var idCard = obj.val();
            idCard = idCard.split(" ").join("");
            if (idCard.length > 0) {
                if (idCard.length != 15 && idCard.length != 18) {
                    obj.parent().find("span").text("请输入正确的身份证号");
                }else{
                    obj.parent().find("span").text("");
                }
            }else{
                obj.parent().find("span").text("");
            }
        }

        function setTitle(obj){
            obj.prop("title", obj.val()) ;
        }
    </script>
</head>
<body>
<div class="title">
    <h5>安置人口数据修改</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="azPersonSave?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <fieldset>
            <table class="table table-bordered" id="personTable">
                <tr>
                    <th class="active" style="text-align: center;">删除</th>
                    <th class="active" style="text-align: center;width: 7%">姓名</th>
                    <th class="active" style="text-align: center;width: 6%;">性别</th>
                    <th class="active" style="text-align: center;width: 12%">身份证号</th>
                    <th class="active" style="text-align: center;width: 5%">年龄</th>
                    <th class="active" style="text-align: center;width: 7%">与户主关系</th>
                    <th class="active" style="text-align: center;width: 6%">婚姻状况</th>
                    <th class="active" style="text-align: center;">工作单位</th>
                    <th class="active" style="text-align: center;">是否是独生子女</th>
                    <th class="active" style="text-align: center;">是否怀孕</th>
                    <th class="active" style="text-align: center;">户口迁入时间</th>
                    <th class="active" style="text-align: center;">是否为安置人口</th>
                    <th class="active" style="text-align: center;">联系方式</th>
                    <th class="active" style="text-align: center;">现住址</th>
                    <th class="active" style="text-align: center;">备注</th>
                </tr>
                <c:forEach begin="0" end="${2+fn:length(familyPersonList)}" var="i" varStatus="status">
                    <tr id="${status.count}_tr">
                        <input type="hidden" class="form-control" name="f_id" value="${familyPersonList[i].id}"/>
                        <td class="active" style="text-align: center;">
                            <button type="button" class="btn btn-sm btn-danger" onclick="deleteTr1($(this))"><i
                                    class="fa fa-delicious"></i>&nbsp;删除
                            </button>
                        </td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control execute"
                                                                              name="f_personName"
                                                                              value="${familyPersonList[i].personName}"/></td>
                        <td class="active" style="text-align: center;"><tags:dataDictInput dataDict="性别" name="f_sex"
                                                                                           className="form-control"
                                                                                           type="select"
                                                                                           value="${familyPersonList[i].sex}"/></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control idCard"
                                                                              name="f_idCard"
                                                                              value="${familyPersonList[i].idCard}"/><span
                                style="color: red"></span></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control digits" name="f_age"
                                                                              value="${familyPersonList[i].age}"/></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control" name="f_relation"
                                                                              value="${familyPersonList[i].relation}"/></td>
                        <td class="active" style="text-align: center;"><tags:dataDictInput dataDict="婚姻状况"
                                                                                           name="f_marrType"
                                                                                           className="form-control"
                                                                                           type="select"
                                                                                           value="${familyPersonList[i].marrType}"/></td>
                        <td class="active" style="text-align: center;">
                            <input type="text" class="form-control" name="f_unit" value="${familyPersonList[i].unit}"/></td>
                        <td class="active" style="text-align: center;width: 6%">
                            <tags:dataDictInput dataDict="是否" name="f_oneType" className="form-control" type="select"
                                                value="${familyPersonList[i].oneType}"/></td>
                        <td class="active" style="text-align: center;width: 6%"><tags:dataDictInput dataDict="是否"
                                                                                                    name="f_pregnancyType"
                                                                                                    className="form-control"
                                                                                                    type="select"
                                                                                                    value="${familyPersonList[i].pregnancyType}"/></td>
                        <td class="active" style="text-align: center;width: 6%">
                            <input class="form-control form-date-time datepicker dateISO" name="f_qrDate" style="height: 35px;"
                                   value="<fmt:formatDate value="${familyPersonList[i].qrDate}" pattern="yyyy-MM-dd" />">
                        </td>
                        <td class="active" style="text-align: center;width: 6%"><tags:dataDictInput dataDict="是否"
                                                                                                    name="f_status"
                                                                                                    className="form-control"
                                                                                                    type="select"
                                                                                                    value="${empty familyPersonList[i].status ? 2 : familyPersonList[i].status}"/></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control" name="f_tel"
                                                                              value="${familyPersonList[i].tel}"/></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control tt" name="f_address"
                                                                              value="${familyPersonList[i].address}" title="${familyPersonList[i].address}"/></td>
                        <td class="active" style="text-align: center;"><input type="text" class="form-control tt" name="f_memo"
                                                                              value="${familyPersonList[i].memo}" title="${familyPersonList[i].memo}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow1();" value="添加新行"/></div>
        </fieldset>
        <div class="footer">
            <button class="btn btn-primary btn-sm" id="submitButton" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>
</div>
</body>
</html>
