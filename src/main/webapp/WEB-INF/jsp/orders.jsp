<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.orders.js" defer></script>
<script src="https://js.pusher.com/7.0/pusher.min.js"></script>
<script>
    var pusher = new Pusher('6d6694b0ce7831c82174', {
        cluster: 'eu'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('refreshTable', function (data) {
        ctx.updateTable();
    });
</script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <h3 class="text-center">Užsakymų administravimas</h3>
    <%--https://getbootstrap.com/docs/4.0/components/card/--%>
    <br/>
    <div>
        <div class="refresh"><p id="readyUsers"></p></div>
        <div class="refresh">
            <button class="fas fa-sync-alt refreshBtn" onclick="getReadyUsers()"></button>
        </div>
    </div>
    <button class="btn btn-primary" onclick="add()">
        <span class="fa fa-plus"></span>
        NAUJAS
    </button>
    <button class="btn btn-primary" onclick="activeOrders()">
        <span class="fas fa-truck-pickup"></span>
        AKTYVUS UŽSAKYMAI
    </button>
    <button class="btn btn-primary" onclick="users()">
        <span class="fas fa-users"></span>
        KOMANDA
    </button>
    <div class="dtable-container">
        <div class="table-responsive">
            <table class="table cards table-striped" id="datatable">
                <thead>
                <tr>
                    <th class="text-center">Redaguoti</th>
                    <th class="text-center">Pašalinti</th>
                    <th class="text-center"><span class="fas fa-map-marked-alt">Maršrutas</span></th>
                    <th class="text-center"><span class="fas fa-euro-sign">Kaina</span></th>
                    <th class="text-center"><span class="fas fa-road">Atstumas</span></th>
                    <th class="text-center"><span class="fas fa-phone-square-alt">Tel. numeris</span></th>
                    <th class="text-center"><span class="fas fa-clock">Sudarytas</span></th>
                    <th class="text-center"><span class="fas fa-info">Info</span></th>
                    <th class="text-center"><span class="fas fa-signal">Statusas</span></th>
                    <th class="text-center"><span class="fas fa-signal">Vairuotojas</span></th>
                    <th class="text-center"><span class="fas fa-signal">Užsakymas baigtas</span></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle"></h4>
                <button type="button" class="close" data-dismiss="modal" onclick="closeNoty()">&times;</button>
            </div>
            <div class="modal-body">
                <form id="detailsForm">
                    <input type="hidden" id="id" name="id">

                    <div class="form-group">
                        <label for="pointA" class="col-form-label">Maršrutas</label>
                        <input type="url" class="form-control" id="pointA" name="pointA"
                               placeholder="Kauno g. 7, Vilnius">
                    </div>

                    <div class="form-group">
                        <label for="price" class="col-form-label">Kaina</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="100">
                    </div>

                    <div class="form-group">
                        <label for="distance" class="col-form-label">Atstumas</label>
                        <input type="number" class="form-control" id="distance" name="distance" placeholder="15">
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber" class="col-form-label">Tel. numeris</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
                               placeholder="37052078114">
                    </div>

                    <div class="form-group">
                        <label for="comment" class="col-form-label">Info</label>
                        <input type="text" class="form-control" id="comment" name="comment"
                               placeholder="Išmuštas ratas...">
                    </div>

                    <div class="form-group">
                        <label for="status" class="col-form-label">Statusas</label>
                        <input type="text" class="form-control" id="status" name="status"
                               placeholder="ACTIVE">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">
                    <span class="fa fa-close"></span>
                    Uždaryti
                </button>
                <button type="button" class="btn btn-primary" onclick="save()">
                    <span class="fa fa-check"></span>
                    Pridėti
                </button>
            </div>
        </div>
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
                    Uždaryti
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>