<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<form class="form-horizontal" id="myForm" method="post" action="turnSaleSave">
    <input type="hidden" name="houseId" id="houseId" value="${house.id}"/>
    <table class="table table-bordered">
        <%--未分配--%>
        <c:if test="${house.status eq 1}">
            <tr>
                <td class="fieldName">项目名称</td>
                <td class="fieldValue"> ${project.projectName} </td>
                <td class="fieldName">楼号</td>
                <td class="fieldValue"> ${house.buildNum} </td>
            </tr>
            <tr>
                <td class="fieldName">单元</td>
                <td class="fieldValue"> ${house.unitNum} </td>
                <td class="fieldName">房号</td>
                <td class="fieldValue"> ${house.houseNum} </td>
            </tr>
            <tr>
                <td class="fieldName">居室</td>
                <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
                <td class="fieldName">建筑面积</td>
                <td class="fieldValue"> ${house.buildArea} </td>
            </tr>
        </c:if>
        <%--转售--%>
        <c:if test="${house.status eq 4 || house.status eq 5}">
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue">${house.name}</td>
                <td class="fieldName">身份号码：</td>
                <td class="fieldValue">${house.idCard}</td>
            </tr>
            <tr>
                <td class="fieldName">项目名称</td>
                <td class="fieldValue"> ${project.projectName} </td>
                <td class="fieldName">楼号</td>
                <td class="fieldValue"> ${house.buildNum} </td>
            </tr>
            <tr>
                <td class="fieldName">单元</td>
                <td class="fieldValue"> ${house.unitNum} </td>
                <td class="fieldName">房号</td>
                <td class="fieldValue"> ${house.houseNum} </td>
            </tr>
            <tr>
                <td class="fieldName">居室</td>
                <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
                <td class="fieldName">建筑面积</td>
                <td class="fieldValue"> ${house.buildArea} </td>
            </tr>
            <tr>
                <td class="fieldName">房源状态：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="分配状态" value="${house.status}"/>
                </td>
                <td class="fieldName">转售人：</td>
                <td class="fieldValue">${house.rentName}</td>
            </tr>
            <tr>
                <td class="fieldName">转售日期：</td>
                <td class="fieldValue"><fmt:formatDate value="${house.rentDate}" pattern="yyyy-MM-dd" /></td>
                <td class="fieldName">转售人身份证号：</td>
                <td class="fieldValue">${house.rentIdCard}</td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">${house.memo}</td>
            </tr>
        </c:if>
        <%--已分配--%>
        <c:if test="${house.status eq 2}">
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue">${house.name}</td>
                <td class="fieldName">身份号码：</td>
                <td class="fieldValue">${house.idCard}</td>
            </tr>
            <tr>
                <td class="fieldName">项目名称</td>
                <td class="fieldValue"> ${project.projectName} </td>
                <td class="fieldName">楼号</td>
                <td class="fieldValue"> ${house.buildNum} </td>
            </tr>
            <tr>
                <td class="fieldName">单元</td>
                <td class="fieldValue"> ${house.unitNum} </td>
                <td class="fieldName">房号</td>
                <td class="fieldValue"> ${house.houseNum} </td>
            </tr>
            <tr>
                <td class="fieldName">居室</td>
                <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
                <td class="fieldName">建筑面积</td>
                <td class="fieldValue"> ${house.buildArea} </td>
            </tr>
            <tr>
                <td class="fieldName">房源状态：</td>
                <td class="fieldValue">
                    <div style="float: left;">
                        <select class="form-control required" name="status">
                            <option value="4">分配后转售给个人</option>
                            <option value="5">分配后回购</option>
                        </select>
                        <%--<tags:dataDictInput name="status" className="form-control houseType" dataDict="分配状态" value="${house.status}"/>--%>
                    </div>
                </td>
                <td class="fieldName">转售人：</td>
                <td class="fieldValue"><input type="text" name="rentName" class="form-control required"
                                              style="width: 10em"/></td>
            </tr>
            <tr>
                <td class="fieldName">转售日期：</td>
                <td class="fieldValue">
                    <input type="text" name="rentDate" class="form-control form-date-time dateISO required" style="width: 130px;height: 33px;"/>
                </td>
                <td class="fieldName">转售人身份证号：</td>
                <td class="fieldValue"><input type="text" name="rentIdCard" class="form-control required"
                                              style="width: 20em"/></td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">
                    <textarea class="form-control" cols="60" rows="4" name="memo"></textarea>
                </td>
            </tr>
        </c:if>
        <%--转租。。--%>
        <c:if test="${house.status eq 3}">
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue">${house.name}</td>
                <td class="fieldName">身份号码：</td>
                <td class="fieldValue">${house.idCard}</td>
            </tr>
            <tr>
                <td class="fieldName">项目名称</td>
                <td class="fieldValue"> ${project.projectName} </td>
                <td class="fieldName">楼号</td>
                <td class="fieldValue"> ${house.buildNum} </td>
            </tr>
            <tr>
                <td class="fieldName">单元</td>
                <td class="fieldValue"> ${house.unitNum} </td>
                <td class="fieldName">房号</td>
                <td class="fieldValue"> ${house.houseNum} </td>
            </tr>
            <tr>
                <td class="fieldName">居室</td>
                <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
                <td class="fieldName">建筑面积</td>
                <td class="fieldValue"> ${house.buildArea} </td>
            </tr>
            <tr>
                <td class="fieldName">房源状态：</td>
                <td class="fieldValue">
                    <div style="float: left;">
                        <tags:dataDictInput name="status" className="form-control houseType" dataDict="分配状态" value="${house.status}"/>
                    </div>
                </td>
                <td class="fieldName">租房人：</td>
                <td class="fieldValue"><input type="text" name="rentName" class="form-control required"
                                              style="width: 10em"/></td>
            </tr>
            <tr>
                <td class="fieldName">出租日期：</td>
                <td class="fieldValue">
                    <input type="text" name="rentDate" class="form-control form-date-time datetime dateISO" style="width: 130px;height: 33px;"/>
                </td>
                <td class="fieldName">租房人身份证号：</td>
                <td class="fieldValue"><input type="text" name="rentIdCard" class="form-control required"
                                              style="width: 20em"/></td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">
                    <textarea class="form-control" cols="60" rows="4" name="memo"></textarea>
                </td>
            </tr>
        </c:if>
    </table>
    <div class="modal-footer">
        <c:if test="${house.status ne 2}">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
        </c:if>
        <c:if test="${house.status eq 2}">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        </c:if>
    </div>
 </form>
<script>
    //必填校验
    $().ready(function() {
        $("#myForm").validate( );
    });
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });
</script>

