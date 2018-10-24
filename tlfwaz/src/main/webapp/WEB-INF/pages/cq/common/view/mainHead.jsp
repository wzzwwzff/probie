<%@page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .stepInfo {
        position: relative;
        background: #f2f2f2;
        margin: 20px auto 0 auto;
        width: 500px;
    }

    .stepInfo li {
        float: left;
        margin-left: -280px;
        width: 900px;
        height: 0.15em;
        background: #bbb;
        margin-top: 1em;
        list-style-type: none
    }

    .stepIco {
        border-radius: 2em;
        padding: 0.03em;
        background: #bbb;
        text-align: center;
        line-height: 1.5em;
        color: #fff;
        position: absolute;
        width: 3.6em;
        height: 3.6em;
    }

    .stepIco1 {
        top: -0.7em;
        left: -50%;
    }

    .stepIco2 {
        top: -0.7em;
        left: 10%;
    }

    .stepIco3 {
        top: -0.7em;
        left: 70%;
    }

    .stepIco4 {
        top: -0.7em;
        left: 130%;
    }

    .stepIco5 {
        top: -0.7em;
        left: 80%;
    }
    .stepIco6 {
        top: -0.7em;
        left: 115%;
    }
    .stepIco7 {
        top: -0.7em;
        left: 100%;
    }
    .stepIco8 {
        top: -0.7em;
        left: 125%;
    }

    .stepText {
        color: black;
        margin-top: 1.2em;
        width: 6em;
        text-align: center;
        margin-left: -1em;
        font-size: 15px;
    }

    .num {
        margin-top: 0.6em;
        font-size: 20px;
    }

    .liCls {
        width: 200px;
        text-align: center;
    }
</style>
<div class="stepInfo">
    <ul>
        <li></li>
    </ul>
    <div class="stepIco stepIco1" id="rh" <c:if test="${not empty family.name}"> style="background-color: #1d7ece;" </c:if>>
        <div class="num">1</div>
        <div class="stepText" id="rhText">基础信息</div>
    </div>
    <div class="stepIco stepIco2" id="chooseHouse" <c:if test="${family.xfStatus eq 2}"> style="background-color: #1d7ece;" </c:if>>
        <div class="num">2</div>
        <div class="stepText" id="checkText" >选房</div>
    </div>
    <div class="stepIco stepIco3" id="sign" <c:if test="${family.signStatus eq 2}"> style="background-color: #1d7ece;" </c:if>>
        <div class="num">3</div>
        <div class="stepText" id="checkText" >签约</div>
    </div>
    <div class="stepIco stepIco4" id="finance" <c:if test="${family.jsStatus eq 2}"> style="background-color: #1d7ece;"</c:if>>
        <div class="num">4</div>
        <div class="stepText" id="yfText" >财务</div>
    </div>
</div>