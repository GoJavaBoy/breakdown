let result;
let orderId;

const orderAjaxUrl = "profile/orders/";

// https://stackoverflow.com/a/5064235/548473
const ctx = {
    ajaxUrl: orderAjaxUrl
};

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

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$.ajax({
    type: "GET",
    url: "profile/orders/active",
    dataType: "json",
    cache: false,
    success: function (data) {
        orderId = data.id;
        delete data.active;
        result = Object.values(data);
        init()
    }
});


function init () {
    var t = $('#datatable').DataTable( {
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

        }
    } );
    t.row.add([
        '<a class="fas fa-map-marker-alt" href="' + result[1] + '"/>',
        "€" + result[2],
        result[7] + "km",
        '<a class="fas fa-phone-volume" href="tel:' + result[3] + '"/>',
        result[4],
        result[5],
        "<a onclick='showComment(" + orderId + ");'><span class='fas fa-comment-dots'></span></a>"
    ]).draw(false);
}

function completeOrder() {
    if (confirm("Confrim")) {
        $.ajax({
            type: "POST",
            url: "profile/orders/complete/" + orderId,
        }).done(function () {
            successNoty("ORDER COMPLETED");
            location.replace(window.location.origin + "/activeorders");
        });
    }
}
