<%@tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.sqds.page.PageInfo" %>
<%@ tag import="java.util.List" %>
<%@ tag import="org.apache.logging.log4j.util.Strings" %>
<%@ tag import="com.app.cq.model.Project" %>
<%@ tag import="com.app.cq.utils.ProjectUtils" %>
<%@ attribute name="className" type="java.lang.String" required="false" %>
<%@ attribute name="areaFlag" type="java.lang.String" required="true" %>
<%@ attribute name="allFlag" type="java.lang.String" required="true" %>
<!--如果不为空且等于param，差的就是model里面的一个字段，否则，查的是关联类里面主键-->
<%@ attribute name="paramType" type="java.lang.String" required="false" %>
<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    List<Project> projectList = ProjectUtils.getProjectList(request);

    Integer projectId = 0;
    Integer areaId = 0;
    if(pageInfo!=null){
        try {
            projectId = Integer.valueOf(String.valueOf(pageInfo.getParameter("search_eq_integer_p.id")));
            areaId = Integer.valueOf(String.valueOf(pageInfo.getParameter("search_eq_integer_a.id")));
        } catch (Exception e) {
        }
    }
    StringBuffer classStr = new StringBuffer("");

    if (Strings.isNotEmpty(className)) {
        classStr.append(className);
    }
    String projectSelectName = "search_eq_integer_p.id";
    String areaSelectName = "search_eq_integer_a.id";
    if (paramType != null && paramType.equals("param")){
        projectSelectName = "search_eq_integer_projectId";
        areaSelectName = "search_eq_integer_areaId";
    }
%>
<div class="input-group input-group-sm">
    <div class="input-group-addon">项目名称</div>
    <select <%=classStr.length() > 0 ? "class='" + classStr.toString() + "'" : ""%> name="<%=projectSelectName%>"
                                                                                    id="projectId">
        <%
            if (allFlag.equals("true")) {
        %>
        <option value="">-全部-</option>
        <%}%>
        <%
            for (Project project : projectList) {
        %>
        <option value="<%=project.getId()%>" <%if (project.getId().intValue() == projectId.intValue()) {
            out.print("selected");
        }
        %>><%=project.getProjectName()%>
        </option>
        <%}%>
    </select>
</div>
<% if (areaFlag.equals("true")) {%>
<div class="input-group input-group-sm" id="areaDiv">
    <div class="input-group-addon">地块名称</div>
    <select  <%=classStr.length() > 0 ? "class='" + classStr.toString() + "'" : ""%> name="<%=areaSelectName%>"
                                                                                     id="areaId"></select>
</div>
<%}%>
<script>
    var areaFlag = "<%=areaFlag%>";
    $(function () {
        if (areaFlag == "true") {
            getAreaDiv("<%=projectId%>");
            $("#projectId").change(function () {
                var projectId = $(this).val();
                getAreaDiv(projectId);
            })
        }
    })

    function getAreaDiv(projectId){
        var areaId = "<%=areaId%>";
        if( projectId == 0){
            $("#areaId").empty();
            $("#areaId").append("<option value=''>-全部-</option>");
            return false;
        }
        /*动态获取地块信息*/
        $.ajax({
            url: "/cq/family/getAreaByProjectId",
            data: {projectId: projectId,myTime:new Date().getTime()},
            success: function (data) {
                if (data) {
                    $("#areaId").empty();

                    var list = eval("(" + data + ")");
                    if (list.length == 0){
                        $("#areaId").append("<option value=''>--</option>");
                    } else {
                        var familyZsAreaId = "${family.area.id}";
                        for (var i = 0; i < list.length; i++) {

                            var selectedText = "";
                            var id = list[i].id;

                            if (familyZsAreaId == id) {
                                selectedText = "selected";
                            }
                            var str = "<option value='" + id + "' " + selectedText + " >" + list[i].areaName + "</option>";

                            $("#areaId").append(str);
                        }
                    }
                }
            },
            error: function () {
                alert("系统错误，请联系系统支持人员！")
            }
        });
    }
</script>