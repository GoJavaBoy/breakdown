<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron py-0">
    <div class="container">
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
        <div class="lead py-4"><strong>Sveiki atvykę į užsakymų paskirstymo sistemą!</strong><br>
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