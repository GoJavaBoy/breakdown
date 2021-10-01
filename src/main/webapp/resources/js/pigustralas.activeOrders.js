const orderAjaxUrl = "profile/orders/";

// https://stackoverflow.com/a/5064235/548473
const ctx = {
    ajaxUrl: orderAjaxUrl,
    updateTable: function () {
        $.get(orderAjaxUrl, updateTableByData);
    }
};

// http://api.jquery.com/jQuery.ajax/#using-converters
$.ajaxSetup({
    converters: {
        "text json": function (stringData) {
            var json = JSON.parse(stringData);
            if (typeof json === 'object') {
                $(json).each(function () {
                    if (this.hasOwnProperty('registered')) {
                        this.registered = this.registered.substr(0, 19).replace('T', ' ');
                    }
                });
            }
            return json;
        }
    }
});

$(function () {
    makeEditable({
        "columns": [
            {
                "render": renderAcceptBtn,
                "defaultContent": "",
                "orderable": false
            },
            {
                "data": "pointA"
            },
            {
                "data": "pointB"
            },
            {
                "data": "price"
            },
            {
                "data": "distance"
            },
            {
                "data": "phoneNumber",
            },
            {
                "data": "registered",
                "render": function (date, type, row) {
                    if (type === "display") {
                        return date.substring(0, 19);
                    }
                    return date;
                }
            },
            {
                "data": "status"
            },
            {
                "data": "comment"
            }
        ],
        "order": [
            [
                0,
                "desc"
            ]
        ]
    });
});

function renderAcceptBtn(data, type, row) {
    if (type === "display") {
        return "<a onclick='acceptOrder(" + row.id + ");'><span class='fas fa-plus-circle'></span></a>";
    }
}

function acceptOrder(id) {
    if (confirm("Patvirtinkite")) {
        $.ajax({
            url: ctx.ajaxUrl + "accept/" + id,
            type: "POST"
        }).done(function () {
            ctx.updateTable();
            successNoty("ORDER ACCEPTED");
            location.replace("http://localhost:8080/myorder");
        });
    }
}

function myOrder(){
    location.replace(window.location.origin + "/myorder");
}

function allOrders(){
    location.replace(window.location.origin + "/orders");
}