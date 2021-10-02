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
    <h3 class="text-center">Mano užsakymas</h3>
    <%--https://getbootstrap.com/docs/4.0/components/card/--%>
    <br/>
    <div class="dtable-container">
        <div class="table-responsive">
            <table id="activeordertable" class="table table-striped table-dark">
                <thead>
                <tr>
                    <th class="text-center"><span class="fas fa-plane-departure"></span></th>
                    <th class="text-center"><span class="fas fa-plane-arrival"></span></th>
                    <th class="text-center"><span class="fas fa-road"></span></th>
                    <th class="text-center"><span class="fas fa-phone-alt"></span></th>
                    <th class="text-center"><span class="fas fa-clock"></span></th>
                    <th class="text-center"><span class="fas fa-signal"></span></th>
                    <th class="text-center"><span class="fas fa-info"></span></th>
                    <th class="text-center"><span class="fas fa-euro-sign"></span></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <button class="btn btn-primary" onclick="completeOrder()">
        <span class="fa fa-money"></span>
        ĮVYKDYTAS
    </button>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>