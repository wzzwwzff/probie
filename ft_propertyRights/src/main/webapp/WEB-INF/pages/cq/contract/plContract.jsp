
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同信息批量导入</title>
    <%@ include file="/static/common/common.jsp"%>
</head>
<body>
<div id="title" style="font-size: 20px;">合同信息批量导入</div>

<form id="form" action="plContractSave" method="post" enctype="multipart/form-data">
    <input type="hidden" name="familyType" value="${familyType}"/>
    <table align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>&nbsp;</td>
            <td><div align="left" style="font-size:14pt;font-family:宋体; line-height:30px; color:#000000;">1、数据导入格式要求：<br />
                &nbsp;&nbsp;&nbsp;a.Excel文件，分为14列。<br />
                &nbsp;&nbsp;&nbsp;b.请设置所有单元格格式为文本格式（数字作为文本处理）。<br />
                &nbsp;&nbsp;&nbsp;c.Excel表第一行为标题。<br/>
                &nbsp;&nbsp;&nbsp;d.请核实申请编号正确性。<br/>
                &nbsp;&nbsp;&nbsp;e.数据导入格式<a href="/static/合同信息模板.xls">Excel模板下载</a>。</div></td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td height="50" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td height="50" colspan="3">
                <span style="font-size:14pt;font-family:宋体; line-height:30px; color:#000000;">请选择数据文件：
                    <input name="file" id="excel" type="file" value="" />
                </span>
            </td>
        </tr>
        <tr>
            <td height="50" colspan="3">
    <span style="font-size:14pt;font-family:宋体; line-height:30px;">
    <input name="sumbit" id="sumbit" type="button" value="合同信息导入" onclick="tosumbit();"/>
    </span>
                <span id="info" style="display:none; color: red;">正在处理，请等待...</span>
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    function tosumbit(){
        var e=$("#excel").val();
        if(e==""){
            art.dialog.alert("请导入数据！");
        }else{
            var info = document.getElementById("info");
            info.style.display="";
            $("#form").submit();
        }
    }
</script>
</html>

