<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.myOrderNEW.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <h3 class="text-center">Užsakymas</h3>
    <%--https://getbootstrap.com/docs/4.0/components/card/--%>
    <br/>
    <div class="dtable-container">
        <div class="table-responsive">
            <table class="table cards table-striped" id="datatable">
                <thead>
                <tr>
                    <th class="text-center"><span class="fas fa-map-marked-alt">Maršrutas</span></th>
                    <th class="text-center"><span class="fas fa-euro-sign">Kaina</span></th>
                    <th class="text-center"><span class="fas fa-road">Atstumas</span></th>
                    <th class="text-center"><span class="fas fa-phone-square-alt">Tel. numeris</span></th>
                    <th class="text-center"><span class="fas fa-clock">Sudarytas</span></th>
                    <th class="text-center"><span class="fas fa-signal">Statusas</span></th>
                    <th class="text-center"><span class="fas fa-info">Info</span></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <button class="btn btn-primary finishOrder" onclick="completeOrder()">
        <span class="fa fa-money"></span>
        ATLIKTA
    </button>
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
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>