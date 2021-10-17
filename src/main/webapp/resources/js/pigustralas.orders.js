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
                    if (this.hasOwnProperty('completedDate')) {
                        this.completedDate = this.completedDate.substr(0, 19).replace('T', ' ');
                    }
                });
            }
            return json;
        }
    }
});

$(function () {
    makeEditable({
        'dom':
            "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'<'float-md-right ml-2'B>f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
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
                "data": "pointA",
                "render": function (data, type, row, meta) {
                    if (type === 'display') {
                        data = '<a class="fas fa-map-marker-alt" href="' + data + '"/>';
                    }

                    return data;
                }
            },
            {
                "data": "price",
                "render": function (data, type, row, meta) {
                    if (type === 'display') {
                        data = "€" + data;
                    }

                    return data;
                }
            },
            {
                "data": "distance",
                "render": function (data, type, row, meta) {
                    if (type === 'display') {
                        data = data + "km";
                    }

                    return data;
                }
            },
            {
                "data": "phoneNumber",
                "render": function (data, type, row, meta) {
                    if (type === 'display') {
                        data = '<a class="fas fa-phone-volume" href="tel:' + data + '"/>';
                    }

                    return data;
                }
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
                "render": renderComment,
                "defaultContent": "",
                "orderable": false
            },
            {
                "data": "status"
            },
            {
                "data": "completedBy",
                "defaultContent": ""
            },
            {
                "data": "completedDate",
                "defaultContent": "",
                "render": function (date, type, row) {
                    if (type === "display" && !(!date)) {
                        return date.substring(0, 19);
                    }
                    return date;
                }
            }
        ],
        'drawCallback': function (settings) {
            var api = this.api();
            var $table = $(api.table().node());
            // Create an array of labels containing all table headers
            var labels = [];
            $('thead th', $table).each(function () {
                labels.push($(this).text());
            });

            // Add data-label attribute to each cell
            $('tbody tr', $table).each(function () {
                $(this).find('td').each(function (column) {
                    $(this).attr('data-label', labels[column]);
                });
            });

            var max = 0;
            $('tbody tr', $table).each(function () {
                max = Math.max($(this).height(), max);
            }).height(max);

        },
        "order": [
            [
                0,
                "desc"
            ]
        ]
    });
    getReadyUsers();
});

function activeOrders() {
    location.replace(window.location.origin + "/activeorders");
}

function getReadyUsers(){
    $.ajax({
        url: "admin/users/readyUsers",
        type: "GET",
    }).done(function (data) {
        $("#readyUsers").text("Ready to drive: " + data)
    }).fail(function () {
    });
}