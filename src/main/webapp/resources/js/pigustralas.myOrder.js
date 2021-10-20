let orderId;

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
    success: function(data){
        orderId = data.id;
        delete data.active;
        var html = '';
        var result = Object.values(data);
        for(var i = 1; i < result.length; i++){
            html += '<td>' + result[i] + '</td>';
        }
        $('#activeordertable tr').first().after(html);
    }
});

function completeOrder() {
    if (confirm("Confirm")) {
        $.ajax({
            type: "POST",
            url: "profile/orders/" + "complete/" + orderId,
        }).done(function () {
            successNoty("ORDER COMPLETED");
            location.replace(window.location.origin + "/activeorders");
        });
    }
}