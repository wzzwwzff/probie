<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>非宅数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#form").validate({
                rules: {
                    familyCode:{
                        remote: "checkRepeat?nonFamilyId=${nonFamily.id}&_mydate=" + new Date().getTime()
                    }
                },
                messages: {
                    familyCode: {
                        remote: "家庭编号已存在"
                    }
                }
            });
        });
    </script>
</head>
<body>
<div class="title">
    <h5>非宅数据登记</h5>
</div>
    <form id="form" class="form-inline" method="post" action="save?<tags:searchParams/>">
        <input type="hidden" name="nonFamilyId" value="${nonFamily.id}"/>
        <div class="content">
            <fieldset>
                <legend>一、房屋所在分指信息</legend>
                <table class="table table-bordered">
                    <tr>
                        <td class="fieldName">分指</td>
                        <td class="fieldValue">
                            <tags:dataDictInput name="bdCode" dataDict="分指" value="${nonFamily.bdCode}" className="form-control required" firstValue="-请选择-"/><span class="require">*</span>
                        </td>
                        <td class="fieldName">组别</td>
                        <td class="fieldValue">
                            <tags:dataDictInput dataDict="组别" name="groupCode" value="${nonFamily.groupCode}" className="form-control required" firstValue="-请选择-"/><span class="require">*</span>
                        </td>
                    </tr>
                </table>
            </fieldset>
                <fieldset>
                    <legend>二、房屋基本信息</legend>
                    <table class="table table-bordered">
                    <tr>
                        <td class="fieldName">档案编号</td>
                        <td class="fieldValue">
                            <input type="text" name="familyCode" placeholder="必填项" class="form-control required" value="${nonFamily.familyCode}"/><span class="require">*</span>
                        </td>
                        <td class="fieldName">单位联系人</td>
                        <td class="fieldValue"><input type="text" class="form-control" name="unitMan" value="${nonFamily.unitMan}"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">办公电话</td>
                        <td class="fieldValue">
                            <input size="40" type="text" name="bgTel" class="form-control" value="${nonFamily.bgTel}"/>
                        </td>
                        <td class="fieldName">移动电话</td>
                        <td class="fieldValue"><input  type="text" class="form-control" name="ydTel" value="${nonFamily.ydTel}"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">所属部门</td>
                        <td class="fieldValue"><input  type="text" name="unit" class="form-control" value="${nonFamily.unit}"/></td>
                        <td class="fieldName">联系人职务</td>
                        <td class="fieldValue"><input type="text" name="telPersonDuty" class="form-control" value="${nonFamily.telPersonDuty}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">单位电子邮箱</td>
                        <td class="fieldValue"><input  type="text" name="unitMail" class="form-control" value="${nonFamily.unitMail}"/></td>
                        <td class="fieldName">房屋地址门牌	</td>
                        <td class="fieldValue"><input type="text" name="address" class="form-control" value="${nonFamily.address}"/>
                        </td>
                    </tr>
                        <tr>
                            <td class="fieldName">房屋产权单位名称（全称）</td>
                            <td class="fieldValue"><input  type="text" name="unitName" class="form-control" size="50" value="${nonFamily.unitName}"/></td>
                            <td class="fieldName">房屋产权单位办公地址门牌</td>
                            <td class="fieldValue"><input type="text" name="unitAddress" class="form-control" value="${nonFamily.unitAddress}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋日常管理单位</td>
                            <td class="fieldValue"><input  type="text" name="dailyUnit" class="form-control" size="50" value="${nonFamily.dailyUnit}"/></td>
                            <td class="fieldName">有无专业管理单位</td>
                            <td class="fieldValue">
                                <tags:dataDictRadio dataDict="有无" value="${nonFamily.dailyStatus}" name="dailyStatus" />
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">现状	</td>
                            <td class="fieldValue"><tags:dataDictInput dataDict="现状" value="${nonFamily.status}" name="status" className="form-control" firstValue="-请选择-"/></td>
                            <td class="fieldName">房屋实际使用单位</td>
                            <td class="fieldValue"><input type="text" name="sjUseUnit" class="form-control" size="50" value="${nonFamily.sjUseUnit}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋产权单位性质</td>
                            <td class="fieldValue"><tags:dataDictInput dataDict="产权单位性质" value="${nonFamily.unitStatus}" name="unitStatus" className="form-control" firstValue="-请选择-"/></td>
                            <td class="fieldName">房屋产权单位隶属关系</td>
                            <td class="fieldValue"><tags:dataDictInput dataDict="产权单位隶属关系" value="${nonFamily.underRelation}" name="underRelation" className="form-control" firstValue="-请选择-"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋权属证书号</td>
                            <td class="fieldValue"><input  type="text" name="underCode" class="form-control" value="${nonFamily.underCode}"/></td>
                            <td class="fieldName">土地使用证号</td>
                            <td class="fieldValue"><input type="text" name="landUseCode" class="form-control" value="${nonFamily.landUseCode}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋用途	</td>
                            <td class="fieldValue"><tags:dataDictInput dataDict="非宅房屋用途" value="${nonFamily.houseUse}" name="houseUse" className="form-control" firstValue="-请选择-"/></td>
                            <td class="fieldName">房屋总建筑面积（M²）</td>
                            <td class="fieldValue"><input type="text" name="houseTotalArea" class="form-control number" size="8" value="${nonFamily.houseTotalArea}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">占地总面积（M²）</td>
                            <td class="fieldValue"><input  type="text" name="zdTotalArea" class="form-control number" size="8" value="${nonFamily.zdTotalArea}"/></td>
                            <td class="fieldName">平房建筑面积（M²）</td>
                            <td class="fieldValue"><input type="text" name="pfArea" class="form-control number" size="8" value="${nonFamily.pfArea}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">临时房屋面积（M²）</td>
                            <td class="fieldValue"><input  type="text" name="lsArea" class="form-control number" size="8" value="${nonFamily.lsArea}"/></td>
                            <td class="fieldName">无证房屋建筑面积（M²）</td>
                            <td class="fieldValue"><input type="text" name="wzArea" class="form-control number" size="8" value="${nonFamily.wzArea}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋是否用于经营</td>
                            <td class="fieldValue"><tags:dataDictRadio dataDict="是否" value="${nonFamily.bussType}" name="bussType" /></td>
                            <td class="fieldName">营业状态</td>
                            <td class="fieldValue"><tags:dataDictRadio dataDict="是否" value="${nonFamily.bussStatus}" name="bussStatus" />
                            </td>
                        </tr> <tr>
                        <td class="fieldName">房屋有无转租</td>
                        <td class="fieldValue"><tags:dataDictRadio dataDict="有无" value="${nonFamily.houseFlag}" name="houseFlag" /></td>
                        <td class="fieldName">有无转租协议</td>
                        <td class="fieldValue"><tags:dataDictRadio dataDict="有无" value="${nonFamily.xyFlag}" name="xyFlag" />
                        </td>
                    </tr> <tr>
                        <td class="fieldName">经营范围（业务）</td>
                        <td class="fieldValue"><input  type="text" name="bussRange" class="form-control" value="${nonFamily.bussRange}"/></td>
                        <td class="fieldName">营业执照号</td>
                        <td class="fieldValue"><input type="text" name="bussCode" class="form-control" value="${nonFamily.bussCode}"/>
                        </td>
                    </tr> <tr>
                        <td class="fieldName">注册登记类型</td>
                        <td class="fieldValue"><tags:dataDictInput dataDict="注册登记类型" value="${nonFamily.djType}" name="djType" className="form-control" firstValue="-请选择-"/></td>
                        <td class="fieldName">产权单位法定代表人（单位负责人）</td>
                        <td class="fieldValue"><input type="text" name="unitPerson" class="form-control" value="${nonFamily.unitPerson}"/>
                        </td>
                    </tr> <tr>
                        <td class="fieldName">产权单位行业类别</td>
                        <td class="fieldValue"><tags:dataDictInput dataDict="产权单位行业类别" value="${nonFamily.unitType}" name="unitType" className="form-control" firstValue="-请选择-"/></td>
                        <td class="fieldName">产权单位是否有上级法人单位</td>
                        <td class="fieldValue"><tags:dataDictRadio dataDict="是否" value="${nonFamily.unitOnStatus}" name="unitOnStatus" />
                        </td>
                    </tr> <tr>
                        <td class="fieldName">经营间数</td>
                        <td class="fieldValue"><input  type="text" name="jyNum" class="form-control number" size="5" value="${nonFamily.jyNum}"/></td>
                        <td class="fieldName">居住间数</td>
                        <td class="fieldValue"><input type="text" name="jzNum" class="form-control number" size="5" value="${nonFamily.jzNum}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">仓储间数</td>
                        <td class="fieldValue"><input  type="text" name="ccNum" class="form-control number" size="5" value="${nonFamily.ccNum}"/></td>
                        <td class="fieldName">其他间数</td>
                        <td class="fieldValue"><input type="text" name="otherNum" class="form-control number" size="5" value="${nonFamily.otherNum}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">间数合计</td>
                        <td class="fieldValue"><input  type="text" name="totalNum" class="form-control number" value="${nonFamily.totalNum}"/></td>
                        <td class="fieldName">预估建筑面积（M²）</td>
                        <td class="fieldValue"><input type="text" name="ygBuildArea" class="form-control number" size="8" value="${nonFamily.ygBuildArea}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">未登记房屋备注</td>
                        <td class="fieldValue" colspan="3">
                            <textarea  type="text" name="wejMemo" class="form-control" cols="120" rows=6">${nonFamily.wejMemo}</textarea>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>三、其他信息</legend>
                <table class="table table-bordered">
                    <tr>
                        <td class="fieldName" style="width: 15%;">备注</td>
                        <td class="fieldValue" style="width: 85%;">
                            <textarea  type="text" name="memo" class="form-control" cols="120" rows=6">${nonFamily.memo}</textarea>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div><br/><br/><br/>
        <div class="footer resizeLayout">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
</body>
</html>
