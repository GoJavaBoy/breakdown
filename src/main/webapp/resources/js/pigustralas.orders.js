const orderAjaxUrl = "admin/orders/";

// https://stackoverflow.com/a/5064235/548473
const ctx = {
    ajaxUrl: orderAjaxUrl,
    updateTable: function () {
        $.ajax({
            type: "GET",
            url: orderAjaxUrl,
            data: $("#filter").serialize()
        }).done(updateTableByData);
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
                "render": renderEditBtn,
                "defaultContent": "",
                "orderable": false
            },
            {
                "render": renderDeleteBtn,
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
                "data": "distance"
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

function activeOrders(){
    location.replace("http://localhost:8080/activeorders");
}