<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.myOrder.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <div class="container">
        <h3 class="text-center">Mano užsakymas</h3>
        <%--https://getbootstrap.com/docs/4.0/components/card/--%>
        <br/>
        <table id="activeordertable" class="table table-striped table-dark">
            <thead>
            <tr>
                <th scope="col">Išvykimas</th>
                <th scope="col">Atvykimas</th>
                <th scope="col">Kaina</th>
                <th scope="col">Numeris</th>
                <th scope="col">Įdėtas</th>
                <th scope="col">Statusas</th>
                <th scope="col">Info</th>
                <th scope="col">Atstumas</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <button class="btn btn-primary" onclick="completeOrder()">
            <span class="fa fa-money"></span>
            ĮVYKDYTAS
        </button>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>