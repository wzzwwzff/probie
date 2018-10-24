<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="com.app.permission.model.Department" %>
<%
    Department department = (Department) request.getAttribute("department");
%>

<form id="inputForm" action="save" method="post">
    <input type="hidden" name="parentId" value="${parentDepartment.id}"/>
    <input type="hidden" name="id" value="${department.id}"/>
    <input type="hidden" name="level" value=""/>
    <input type="hidden" name="check" value=""/>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">当前部门</td>
            <td class="fieldValue">${parentDepartment.departmentName}(${parentDepartment.departmentCode})
            </td>
        </tr>
        <tr>
            <td class="fieldName">部门编号</td>
            <td class="fieldValue">
                <input type="text" name="departmentCode" id="departmentCode" size="20" value="${department.departmentCode}" class="required"><span class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">部门名称</td>
            <td class="fieldValue"><input type="text" name="departmentName" value="${department.departmentName}" class="required"><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">顺序号</td>
            <td class="fieldValue"><input type="text" name="orderIndex" value="${department.orderIndex}" size="8" class="required"><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">是否有效</td>
            <td class="fieldValue">
                <input type="radio" name="activeFlag" value="1" <%if(department.getActiveFlag()==null||department.getActiveFlag()==1){out.println("checked");}%>>有效&nbsp;&nbsp;
                <input type="radio" name="activeFlag" value="0" <%if(department.getActiveFlag()!=null&&department.getActiveFlag()!=1){out.println("checked");}%>>无效
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script>
    $(document).ready(function () {
        $("#inputForm").validate({
            rules: {
                departmentCode: {
                    remote: "/permission/department/validationDepartment?id=${department.id}"
                }
            },
            messages: {
                departmentCode: {
                    remote: "部门编号已经存在"
                }
            }
        });
    });
</script>
