<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron py-0">
    <div class="container loginContainer">
        <c:if test="${param.error}">
            <div class="error">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
        </c:if>
        <c:if test="${not empty param.message}">
            <div class="message">Param message</div>
        </c:if>
        <sec:authorize access="isAnonymous()">
            <div class="pt-2">
                <button type="submit" class="btn btn-lg btn-primary mt-2" onclick="login('user@yandex.ru', 'password')">
                    Login as: User
                </button>
                <button type="submit" class="btn btn-lg btn-primary mt-2" onclick="login('admin@gmail.com', 'admin')">
                    Login as: Admin
                </button>
            </div>
        </sec:authorize>
        <div class="lead py-4"><strong>Order management system for Lithuanian recovery service.
            HOW TO USE THIS SERVICE?
            It's simple as my life. There two types of accounts: admins(call center staff) and simple users(tow truck drivers).

            Managers - receiving calls from consumers,
            collecting info about incident then create and place order in the system by filling form,
            for "Direction" field you should use Google My Maps service.
            For new order, press "ALL ORDERS" -> "NEW" (If you on "ACTIVE ORDERS" tab).
            Drivers will see order immediately after creation. Also managers can edit/delete current orders,
            also managers can see number of ready drivers(who available for new orders),
            you can refresh this and get actual info.

            Drivers - they can see only "Active orders". For order collection driver should press "plus" button,
            after collection driver have access only for current order and also he can see consumer phone number.
            On the top panel drivers have status button - "Ready" or "Not Ready",
            if driver busy he should change status for "Not Ready", this is simple indicator for managers.
        </strong><br>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
<script type="text/javascript">
    <c:if test="${not empty param.username}">
    setCredentials("${param.username}", "");
    </c:if>

    function login(username, password) {
        setCredentials(username, password);
        $("#login_form").submit();
    }

    function setCredentials(username, password) {
        $('input[name="username"]').val(username);
        $('input[name="password"]').val(password);
    }
</script>
</body>
</html>