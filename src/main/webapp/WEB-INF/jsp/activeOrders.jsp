<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.activeOrders.js" defer></script>
<script src="https://js.pusher.com/7.0/pusher.min.js"></script>
<script>
    var pusher = new Pusher('6d6694b0ce7831c82174', {
        cluster: 'eu'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('refreshTable', function (data) {
        ctx.updateTable();
       // alert("TABLE UPDATED!")
    });
</script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <h3 class="text-center">Active orders</h3>
    <%--https://getbootstrap.com/docs/4.0/components/card/--%>
    <br/>
    <button class="btn btn-primary" onclick="myOrder()">
        <span class="fas fa-user"></span>
        CURRENT ORDER
    </button>
    <sec:authorize access="hasRole('ADMIN')">
        <button class="btn btn-primary" onclick="allOrders()">
            <span class="fas fa-search-location"></span>
            ALL ORDERS
        </button>
        <button class="btn btn-primary" onclick="users()">
            <span class="fas fa-users"></span>
            USERS
        </button>
    </sec:authorize>
    <div class="dtable-container">
        <div class="table-responsive">
            <table class="table cards table-striped" id="datatable">
                <thead>
                <tr>
                    <th class="text-center">Collect</th>
                    <th class="text-center"><span class="fas fa-map-marked-alt">Route</span></th>
                    <th class="text-center"><span class="fas fa-euro-sign">Price</span></th>
                    <th class="text-center"><span class="fas fa-road">Distance</span></th>
                    <th class="text-center"><span class="fas fa-clock">Created</span></th>
                    <th class="text-center"><span class="fas fa-signal">Status</span></th>
                    <th class="text-center"><span class="fas fa-info">Info</span></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="editRow2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalTitle2"></h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="closeNoty()">&times;</button>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">
                        <span class="fa fa-close"></span>
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>