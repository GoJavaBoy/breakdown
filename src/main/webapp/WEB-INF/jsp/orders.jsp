<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/pigustralas.common.js" defer></script>
<script type="text/javascript" src="resources/js/pigustralas.orders.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <div class="container">
        <h3 class="text-center">TITLE</h3>
        <%--https://getbootstrap.com/docs/4.0/components/card/--%>
        <br/>
        <button class="btn btn-primary" onclick="add()">
            <span class="fa fa-plus"></span>
            Add
        </button>
        <table class="table table-striped" id="datatable">
            <thead>
            <tr>
                <th>Point A</th>
                <th>Point B</th>
                <th>Price</th>
                <th>Phone number</th>
                <th>Registered</th>
                <th>Active</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
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
                        <label for="pointA" class="col-form-label">point A</label>
                        <input type="text" class="form-control" id="pointA" name="pointA"
                               placeholder="pointA">
                    </div>

                    <div class="form-group">
                        <label for="pointB" class="col-form-label">point B</label>
                        <input type="text" class="form-control" id="pointB" name="pointB"
                               placeholder="pointB">
                    </div>

                    <div class="form-group">
                        <label for="price" class="col-form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="100">
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber" class="col-form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
                               placeholder="phoneNumber">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">
                    <span class="fa fa-close"></span>
                    Cancel
                </button>
                <button type="button" class="btn btn-primary" onclick="save()">
                    <span class="fa fa-check"></span>
                    Save
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>