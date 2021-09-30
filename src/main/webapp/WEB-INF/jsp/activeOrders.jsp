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
        <h3 class="text-center">TITLE</h3>
        <%--https://getbootstrap.com/docs/4.0/components/card/--%>
        <br/>
        <table class="table table-striped" id="datatable">
            <thead>
            <tr>
                <th>Point A</th>
                <th>Point B</th>
                <th>Price</th>
                <th>Phone number</th>
                <th>Registered</th>
                <th>Status</th>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>