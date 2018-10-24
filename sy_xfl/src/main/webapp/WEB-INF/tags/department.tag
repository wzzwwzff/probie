<%@tag pageEncoding="UTF-8"%>
<%@ tag import="com.app.permission.service.DepartmentService" %>
<%@ tag import="com.sqds.spring.SpringUtils" %>
<%@ tag import="java.util.Map" %>
<%@ tag import="com.app.permission.model.Department" %>
<%@ tag import="com.sqds.utils.StringUtils" %>
<%@ attribute name="departmentCode" type="java.lang.String" required="true"%>
<%@ attribute name="showParent" type="java.lang.Boolean" required="false"%>
<%
    if(showParent==null){
        showParent = false;
    }
    DepartmentService departmentService = SpringUtils.getWebApplicationContext(request).getBean(DepartmentService.class);

    if(showParent){
        Department department = departmentService.getDepartment(departmentCode);
        if(department.getParentDepartment()!=null){
            out.print(department.getParentDepartment().getDepartmentName());
        }
        out.print(department.getDepartmentName());
    }else{
        Map<String,Department> departmentMap = departmentService.getAllDepartmentMap();
        Department department = departmentMap.get(StringUtils.getNotNullString(departmentCode));
        if(department!=null){
            out.print(department.getDepartmentName());
        }

    }
%>
