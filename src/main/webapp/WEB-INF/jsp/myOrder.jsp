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
        <h3 class="text-center">TITLE</h3>
        <%--https://getbootstrap.com/docs/4.0/components/card/--%>
        <br/>
        <table id="activeordertable" class="table table-striped table-dark">
            <thead>
            <tr>
                <th scope="col">pointA</th>
                <th scope="col">pointB</th>
                <th scope="col">price</th>
                <th scope="col">phoneNumber</th>
                <th scope="col">registered</th>
                <th scope="col">status</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <button class="btn btn-primary" onclick="completeOrder()">
            <span class="fa fa-money"></span>
            COMPLETE
        </button>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>