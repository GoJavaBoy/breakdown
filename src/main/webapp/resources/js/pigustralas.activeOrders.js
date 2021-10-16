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
        'dom':
            "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'<'float-md-right ml-2'B>f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
        "columns": [
            {
                "render": renderAcceptBtn,
                "defaultContent": "",
                "orderable": false
            },
            {
                "data": "pointA",
                "render": function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<a class="fas fa-map-marker-alt" href="' + data + '"/>';
                    }

                    return data;
                }
            },
            {
                "data": "price",
                "render": function(data, type, row, meta){
                    if(type === 'display'){
                        data = "€" + data;
                    }

                    return data;
                }
            },
            {
                "data": "distance",
                "render": function(data, type, row, meta){
                    if(type === 'display'){
                        data = data + "km";
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
                "data": "status"
            },
            {
                "render": renderComment,
                "defaultContent": "",
                "orderable": false
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
            location.replace(window.location.origin + "/myorder");
        });
    }
}

function myOrder(){
    location.replace(window.location.origin + "/myorder");
}

function sendTelegramAlert(){
    $.ajax({
        url: "https://api.telegram.org/bot2077348239:AAFTcszT7oJZ8PKUqg_nt-zBlxY33mgbPeo/sendMessage?chat_id=@new_order_oms&text=NEW ORDER IN THE SYSTEM",
        type: "GET"
    }).done(function () {
    });
}
