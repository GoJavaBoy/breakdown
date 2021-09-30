<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.activeOrders.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <div class="container">
        <h3 class="text-center">Aktyvus užsakymai </h3>
        <%--https://getbootstrap.com/docs/4.0/components/card/--%>
        <br/>
        <button class="btn btn-primary" onclick="myOrder()">
            <span class="fa fa-user-circle-o"></span>
            MANO UŽSAKYMAS
        </button>
        <table class="table table-striped" id="datatable">
            <thead>
            <tr>
                <th>Išvykimas</th>
                <th>Atvykimas</th>
                <th>Kaina</th>
                <th>Atstumas</th>
                <th>Numeris</th>
                <th>Įdėtas</th>
                <th>Statusas</th>
                <th>Info</th>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>