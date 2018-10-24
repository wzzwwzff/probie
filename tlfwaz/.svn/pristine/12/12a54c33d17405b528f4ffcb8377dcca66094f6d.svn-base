<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<form class="form-inline" id="inputForm">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <div class="content">
        <fieldset>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">通讯地址：</td>
                    <td class="fieldValue"><input type="text" name="address" value="${family.address}" class="form-control"
                                                  style="width: 25em"/></td>
                    <td class="fieldName">联系电话：</td>
                    <td class="fieldValue" ><input type="text" name="phone" value="${family.phone}" class="form-control"
                                                   style="width: 25em"/></td>
                </tr>
                <tr>
                    <td class="fieldName">认购协议通讯地址：</td>
                    <td class="fieldValue"><input type="text" name="currentAddress" value="${not empty family.currentAddress?family.currentAddress:cAddress}" class="form-control"
                                                  style="width: 25em"/></td>
                    <td class="fieldName">补偿协议编号：</td>
                    <td class="fieldValue"><input type="text" name="agreementCode" value="${family.agreementCode}"
                                                  class="form-control" style="width: 25em"/></td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </div>
</form>

