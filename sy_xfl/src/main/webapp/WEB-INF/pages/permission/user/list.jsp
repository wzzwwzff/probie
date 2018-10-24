<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.app.permission.utils.DepartmentUtils" %>
<%@ page import="com.app.permission.model.Department" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sqds.page.PageInfo" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page import="org.hibernate.annotations.SourceType" %>
<%@ page import="com.app.permission.model.User" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    Department department = (Department) request.getAttribute("department");
    List<Role> roleList = (List) request.getAttribute("roleList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
    <title>人员管理</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        function deleteUser(id){
            if(confirm('确认删除吗？')){
                $.get("delete",{id:id,_temp:new Date().getTime()},function(result){
                   if(result.success = "success"){
                       location.reload();
                   }
                });
            }
        }
    </script>
</head>
<body>
<DIV class="title"><h5>用户管理</h5></DIV>
<div class="content">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${message}
        </div>
    </c:if>
    <div class="search">
        <form name="form1" class="form-search">
            部门:<select name="search_eq_integer_d.id">
            <option value="">-请选择-</option>
            <%
                String departmentId = StringUtils.getNotNullString((String) pageInfo.getPostValue().get("eq_integer_d.id"));
                StringBuffer stringBuffer = new StringBuffer();
                DepartmentUtils.departmentOption(department, stringBuffer, departmentId, "id", 0);
                out.println(stringBuffer.toString());
            %>
        </select>
            角色:<select name="search_eq_integer_r.id">
            <option value="">-请选择-</option>
            <% String roleId = StringUtils.getNotNullString((String) pageInfo.getPostValue().get("eq_integer_r.id"));
                for (Role role : roleList) {
                    String sel = "";
                    if (role.getId().toString().equals(roleId)) {
                        sel = "selected";
                    }
                    out.println("<option value=\"" + role.getId() + "\"" + sel + " > " + role.getRoleName() + "</option >");
                }
            %>
        </select>
            人员姓名: <tags:searchInput name="u.realName" fieldType="string" operator="like"/>
            用户名:<tags:searchInput name="u.username" fieldType="string" operator="like"/>
            状态:
            <select name="search_eq_integer_u.activeFlag">
                <% String activeFlag = StringUtils.getNotNullString((String) pageInfo.getPostValue().get("eq_integer_u.activeFlag"));%>
                <option value="">-请选择-</option>
                <option value="1" <%=activeFlag.equals("1") ? "selected" : ""%>>有效</option>
                <option value="2"  <%=activeFlag.equals("2") ? "selected" : ""%>>无效</option>
            </select>
            <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>
            <button type="button" class="btn btn-sm btn-primary" onclick="addOrEdit();"><i class="fa fa-pencil"></i> 登记</button>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="4%">序号</th>
            <th class="text-center" width="10%">所在部门</th>
            <th class="text-center" width="10%">真实姓名</th>
            <th class="text-center" width="10%">用户帐号</th>
            <th class="text-center" width="5%">用户级别</th>
            <th class="text-center" width="20%">现角色</th>
            <th class="text-center" width="6%">有效状态</th>
            <th class="text-center" width="5%">操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> userList = pageInfo.getResult();
            if (userList != null && userList.size() > 0) {
                int i = 0;
                for (User u : userList) {
                    i++;
                    String btnCls = "btn-primary", showFlag = "有效";
                    if (u.getActiveFlag().intValue() == 2) {
                        btnCls = "btn-danger";
                        showFlag = "无效";
                    }
        %>
        <tr>
            <td class="text-center"><%=i%>
            </td>
            <td class="text-center"><%=u.getDepartment() != null ? u.getDepartment().getDepartmentName() : ""%>
            </td>
            <td class="text-center"><%=u.getRealName()%>
            </td>
            <td class="text-center"><%=u.getUsername()%>
            </td>
            <td class="text-center"><%=u.getUserLevel()%>
            </td>
            <td class="text-center">
                <%
                    List<Role> userRoleList = u.getRoles();
                    if (userRoleList != null && userRoleList.size() > 0) {
                        for (Role r : userRoleList) {
                            for (Role role : roleList) {
                                if (role.getId().intValue() == r.getId().intValue()) {
                                    out.println(role.getRoleName() + "&nbsp;&nbsp;");
                                }
                            }
                        }
                    }
                %>
            </td>
            <td class="text-center"><%=showFlag%></td>
            <td class="text-center">
                <a href="javascript:addOrEdit(<%=u.getId()%>)"><img src="/static/image/edit.gif"></a>
                <a href="javascript:deleteUser(<%=u.getId()%>)"><img src="/static/image/delete.gif"></a>
            </td>
        </tr>
        <%
                }
            }

        %>
        </tbody>
    </table>
    <tags:pageInfo/>
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">用户信息登记</h4>
                </div>
                <div class="modal-body" id="myModalBoday">加载中...</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="$('#inputForm').submit();">确定</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function addOrEdit(id) {
            //打开弹出层
            $("#myModal").modal({backdrop:false});
            $("#myModalBoday").html("加载中...");
            var url = "form?id=" + id + "&${pageInfo.searchParams}";
//            location.href=url;
            $.get(url, {datetime: new Date().getTime()}, function (data) {
                $("#myModalBoday").html(data);
            });
        }
        function setFlag(userId, flag) {
            $.get("setFlag", {userId: userId, flag: flag, mydate: new Date().getTime()}, function (result) {
                location.reload();
            });
        }
    </script>

</div>
</body>
</html>
