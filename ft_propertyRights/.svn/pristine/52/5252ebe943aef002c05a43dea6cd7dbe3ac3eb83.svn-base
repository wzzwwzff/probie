<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.app.common.model.DataDict" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page import="java.util.List" %>
<%
    DataDict dd = (DataDict) request.getAttribute("dataDict");
    List<DataDict> items = (List) request.getAttribute("items");
    int num = items.size() + 10;
    if (num < 10) {
        num = 10;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>管理数据字典</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<DIV class="title"><h5>数据字典管理</h5></DIV>
<div class="content">
    <form action="save?<tags:searchParams/>" method="post">
        <input type="hidden" name="num" value="<%=num%>"/>
        <input type="hidden" name="id" value="<%=StringUtils.getNotNullInt(dd.getId())%>"/>
        <div class="search">数据字典名称：<input name="parentName" type="text" size="40" value="<%=StringUtils.getNotNullString(dd.getAttributeName())%>"/></div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="20%">属性名称(<font color="red">不填写系统自动删除</font>)</th>
                <th class="text-center" width="15%">属性名称颜色</th>
                <th class="text-center" width="20%">属性值</th>
                <th class="text-center" width="6%">是否有效</th>
                <th class="text-center" width="4%">排序</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < num; i++) {
                    DataDict dict = null;
                    String name = "", color = "", value = "", orderId = "";
                    int valid = 1;
                    if (i < items.size()) {
                        dict = (DataDict) items.get(i);
                        name = dict.getAttributeName();
                        color = StringUtils.getNotNullString(dict.getAttributeColor());
                        value = dict.getAttributeValue();
                        valid = dict.getValidFlag().intValue();
                        orderId = dict.getOrderId().intValue() + "";
                    }
            %>
            <tr>
                <td class="text-center"><input class="form-control" type="text" name="attributeName<%=i%>" value="<%=name%>"/></td>
                <td class="text-center"><input class="form-control" type="text" class="inputColor" name="attributeColor<%=i%>" value="<%=color%>"/></td>
                <td class="text-center"><input class="form-control" type="text" name="attributeValue<%=i%>" value="<%=value%>"/></td>
                <td class="text-center"><input class="form-control" name="validFlag<%=i%>" type="checkbox" value="1" <%
                    if (valid == 1) {
                        out.println("checked");
                    }
                %>/></td>
                <td class="text-center"><input class="form-control" type="text" name="orderId<%=i%>" value="<%=orderId%>" size="6"/></td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <div class="footer">
            <button class="btn btn-primary" type="submit">保 存</button>
            <button class="btn btn-white" type="button" onclick="history.back();">返 回</button>
        </div>
    </form>
</div>
<script type="application/javascript">
    $(function () {
        $(".inputColor").blur(function () {
            var itemValue = $(this).val();
            if (itemValue == null || itemValue == "") {
                $(this).parent().parent().css("background", "none");
            } else {
                $(this).parent().parent().css("background", itemValue);
            }
        }).each(function () {
            var itemValue = $(this).val();
            $(this).parent().parent().css("background", itemValue);
        });
    });
</script>
</body>
</html>
