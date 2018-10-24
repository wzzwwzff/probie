<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>非宅数据查看</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>非宅数据查看</h5>
</div>
    <div class="content">
        <fieldset>
            <legend>一、房屋所在分指信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">分指</td>
                    <td class="fieldValue"><tags:dataDict dataDict="分指" value="${nonFamily.bdCode}"/></td>
                    <td class="fieldName">组别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="组别" value="${nonFamily.groupCode}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、房屋基本信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">档案编号</td>
                    <td class="fieldValue">${nonFamily.familyCode}</td>
                    <td class="fieldName">单位联系人</td>
                    <td class="fieldValue">${nonFamily.unitMan}</td>
                </tr>
                <tr>
                    <td class="fieldName">办公电话</td>
                    <td class="fieldValue">${nonFamily.bgTel}</td>
                    <td class="fieldName">移动电话</td>
                    <td class="fieldValue">${nonFamily.ydTel}</td>
                </tr>
                <tr>
                    <td class="fieldName">所属部门</td>
                    <td class="fieldValue">${nonFamily.unit}</td>
                    <td class="fieldName">联系人职务</td>
                    <td class="fieldValue">${nonFamily.telPersonDuty}</td>
                </tr>
                <tr>
                    <td class="fieldName">单位电子邮箱</td>
                    <td class="fieldValue">${nonFamily.unitMail}</td>
                    <td class="fieldName">房屋地址门牌	</td>
                    <td class="fieldValue">${nonFamily.address}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产权单位名称（全称）</td>
                    <td class="fieldValue">${nonFamily.unitName}</td>
                    <td class="fieldName">房屋产权单位办公地址门牌</td>
                    <td class="fieldValue">${nonFamily.unitAddress}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋日常管理单位</td>
                    <td class="fieldValue">${nonFamily.dailyUnit}</td>
                    <td class="fieldName">有无专业管理单位</td>
                    <td class="fieldValue"><tags:dataDict dataDict="有无" value="${nonFamily.dailyStatus}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">现状	</td>
                    <td class="fieldValue"><tags:dataDict dataDict="现状" value="${nonFamily.status}"/></td>
                    <td class="fieldName">房屋实际使用单位</td>
                    <td class="fieldValue">${nonFamily.sjUseUnit}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产权单位性质</td>
                    <td class="fieldValue"><tags:dataDict dataDict="产权单位性质" value="${nonFamily.unitStatus}"/></td>
                    <td class="fieldName">房屋产权单位隶属关系</td>
                    <td class="fieldValue"><tags:dataDict dataDict="产权单位隶属关系" value="${nonFamily.underRelation}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">房屋权属证书号</td>
                    <td class="fieldValue">${nonFamily.underCode}</td>
                    <td class="fieldName">土地使用证号</td>
                    <td class="fieldValue">${nonFamily.landUseCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋用途	</td>
                    <td class="fieldValue"><tags:dataDict dataDict="非宅房屋用途" value="${nonFamily.houseUse}"/></td>
                    <td class="fieldName">房屋总建筑面积（M²）</td>
                    <td class="fieldValue">${nonFamily.houseTotalArea}</td>
                </tr>
                <tr>
                    <td class="fieldName">占地总面积（M²）</td>
                    <td class="fieldValue">${nonFamily.zdTotalArea}</td>
                    <td class="fieldName">平房建筑面积（M²）</td>
                    <td class="fieldValue">${nonFamily.pfArea}</td>
                </tr>
                <tr>
                    <td class="fieldName">临时房屋面积（M²）</td>
                    <td class="fieldValue">${nonFamily.lsArea}</td>
                    <td class="fieldName">无证房屋建筑面积（M²）</td>
                    <td class="fieldValue">${nonFamily.wzArea}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋是否用于经营</td>
                    <td class="fieldValue"><tags:dataDict dataDict="是否" value="${nonFamily.bussType}"/></td>
                    <td class="fieldName">营业状态</td>
                    <td class="fieldValue"><tags:dataDict dataDict="是否" value="${nonFamily.bussStatus}"/></td>
                </tr>
                <tr>
                <td class="fieldName">房屋有无转租</td>
                <td class="fieldValue"><tags:dataDict dataDict="有无" value="${nonFamily.houseFlag}"/></td>
                <td class="fieldName">有无转租协议</td>
                <td class="fieldValue"><tags:dataDict dataDict="有无" value="${nonFamily.xyFlag}"/></td>
            </tr>
             <tr>
                <td class="fieldName">经营范围（业务）</td>
                <td class="fieldValue">${nonFamily.bussRange}</td>
                <td class="fieldName">营业执照号</td>
                <td class="fieldValue">${nonFamily.bussCode}</td>
            </tr>
            <tr>
                <td class="fieldName">注册登记类型</td>
                <td class="fieldValue"><tags:dataDict dataDict="注册登记类型" value="${nonFamily.djType}"/></td>
                <td class="fieldName">产权单位法定代表人（单位负责人）</td>
                <td class="fieldValue">${nonFamily.unitPerson}</td>
            </tr> <tr>
                <td class="fieldName">产权单位行业类别</td>
                <td class="fieldValue"><tags:dataDict dataDict="产权单位行业类别" value="${nonFamily.unitType}"/></td>
                <td class="fieldName">产权单位是否有上级法人单位</td>
                <td class="fieldValue"><tags:dataDict dataDict="是否" value="${nonFamily.unitOnStatus}"/></td>
            </tr>
            <tr>
                <td class="fieldName">经营间数</td>
                <td class="fieldValue">${nonFamily.jyNum}</td>
                <td class="fieldName">居住间数</td>
                <td class="fieldValue">${nonFamily.jzNum}</td>
            </tr>
                <tr>
                    <td class="fieldName">仓储间数</td>
                    <td class="fieldValue">${nonFamily.ccNum}</td>
                    <td class="fieldName">其他间数</td>
                    <td class="fieldValue">${nonFamily.otherNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">间数合计</td>
                    <td class="fieldValue">${nonFamily.totalNum}</td>
                    <td class="fieldName">预估建筑面积（M²）</td>
                    <td class="fieldValue">${nonFamily.ygBuildArea}</td>
                </tr>
                <tr>
                    <td class="fieldName">未登记房屋备注</td>
                    <td class="fieldValue" colspan="3">${nonFamily.wejMemo}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>三、其他信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName" style="width: 15%;">备注</td>
                    <td class="fieldValue" style="width: 85%;">${nonFamily.memo}</td>
                </tr>
            </table>
        </fieldset>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</body>
</html>
