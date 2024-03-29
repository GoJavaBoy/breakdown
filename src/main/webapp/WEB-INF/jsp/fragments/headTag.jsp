<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>OMS by PIGUSTRALAS.LT</title>
    <base href="${pageContext.request.contextPath}/"/>

    <link rel="stylesheet" href="resources/css/style.css?v=2">
    <link rel="stylesheet" href="resources/css/responsive.css?v=1">
    <link rel="stylesheet" href="webjars/bootstrap/4.6.0-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/noty/3.1.4/demo/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="webjars/font-awesome/5.15.2/css/all.css">
    <link rel="stylesheet" href="webjars/datatables/1.10.24/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="webjars/noty/3.1.4/lib/noty.css"/>
    <link rel="stylesheet" href="webjars/datetimepicker/2.5.20-1/jquery.datetimepicker.css">
    <link rel="shortcut icon" href="resources/images/icon-meal.png">

    <%--http://stackoverflow.com/a/24070373/548473--%>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.6.0-1/js/bootstrap.min.js" defer></script>
    <script src="webjars/datatables/1.10.24/js/jquery.dataTables.min.js" defer></script>
    <script src="webjars/noty/3.1.4/lib/noty.min.js" defer></script>
    <script src="webjars/datatables/1.10.24/js/dataTables.bootstrap4.min.js" defer></script>
    <script src="webjars/datetimepicker/2.5.20-1/build/jquery.datetimepicker.full.min.js" defer></script>

    <!-- PushAlert -->
    <script type="text/javascript">
        (function(d, t) {
            var g = d.createElement(t),
                s = d.getElementsByTagName(t)[0];
            g.src = "https://cdn.pushalert.co/integrate_0a33959aed6ea763edac19ed02276d7a.js";
            s.parentNode.insertBefore(g, s);
        }(document, "script"));
    </script>
    <!-- End PushAlert -->
    <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
</head>