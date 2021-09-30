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
                "data": "pointA"
            },
            {
                "data": "pointB"
            },
            {
                "data": "price"
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
                "render": renderAcceptBtn,
                "defaultContent": "",
                "orderable": false
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
        return "<a onclick='acceptOrder(" + row.id + ");'><span class='fa fa-check'></span></a>";
    }
}

function acceptOrder(id) {
    if (confirm("Confirm")) {
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