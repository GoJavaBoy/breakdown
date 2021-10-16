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

    <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <script>
        if (location.protocol !== 'https:') {
            location.replace(`https:${location.href.substring(location.protocol.length)}`);
        }
        window.OneSignal = window.OneSignal || [];
        OneSignal.push(function() {
            OneSignal.init({
                appId: "60eba43c-7282-426f-aa14-7161ce6369d9",
                safari_web_id: "web.onesignal.auto.48cecb45-b9e1-42c4-afaa-e45f7f034833",
                notifyButton: {
                    enable: true,
                },
                subdomainName: "asdqq",
            });
        });
    </script>
</head>