let form;
const applicationServerPublicKey = 'BExOtl9jKBabPankjYFEdiTgLEug8HcaD36vaVIh3A_C-3X86ob1qLK71uZEktIi39dmhaxC49Sf94nLIY3-Zac';

function makeEditable(datatableOpts) {
    ctx.datatableApi = $("#datatable").DataTable(
        // https://api.jquery.com/jquery.extend/#jQuery-extend-deep-target-object1-objectN
        $.extend(true, datatableOpts,
            {
                "ajax": {
                    "url": ctx.ajaxUrl,
                    "dataSrc": ""
                },
                "paging": false,
                "info": true
            }
        ));

    form = $('#detailsForm');
    $(document).ajaxError(function (event, jqXHR, options, jsExc) {
        failNoty(jqXHR);
    });

    // solve problem with cache in IE: https://stackoverflow.com/a/4303862/548473
    $.ajaxSetup({cache: false});

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}

function add() {
    $("#modalTitle").html("MODAL TITLE");
    form.find(":input").val("");
    $("#editRow").modal();
}

function updateRow(id) {
    form.find(":input").val("");
    $("#modalTitle").html("Edit title");
    $.get(ctx.ajaxUrl + id, function (data) {
        $.each(data, function (key, value) {
            form.find("input[name='" + key + "']").val(value);
        });
        $('#editRow').modal();
    });
}

function deleteRow(id) {
    if (confirm("Patvirtinkite")) {
        $.ajax({
            url: ctx.ajaxUrl + id,
            type: "DELETE"
        }).done(function () {
            ctx.updateTable();
            successNoty("common.deleted");
        });
    }
}

function updateTableByData(data) {
    ctx.datatableApi.clear().rows.add(data).draw();
}

function save() {
    $.ajax({
        type: "POST",
        url: ctx.ajaxUrl,
        data: form.serialize()
    }).done(function () {
        $("#editRow").modal("hide");
        ctx.updateTable();
        successNoty("common.saved");
    });
}

let failedNote;

function closeNoty() {
    if (failedNote) {
        failedNote.close();
        failedNote = undefined;
    }
}

function successNoty(key) {
    closeNoty();
    new Noty({
        text: "<span class='fa fa-lg fa-check'></span> &nbsp;" + "URA",
        type: 'success',
        layout: "bottomRight",
        timeout: 1000
    }).show();
}

function failNoty(jqXHR) {
    closeNoty();
    var errorInfo = jqXHR.responseJSON;
    failedNote = new Noty({
        text: "<span class='fa fa-lg fa-exclamation-circle'></span> &nbsp;",
        type: "error",
        layout: "bottomRight"
    });
    failedNote.show();
}

function renderEditBtn(data, type, row) {
    if (type === "display") {
        return "<a onclick='updateRow(" + row.id + ");'><span class='fas fa-pencil-alt'></span></a>";
    }
}

function renderDeleteBtn(data, type, row) {
    if (type === "display") {
        return "<a onclick='deleteRow(" + row.id + ");'><span class='fa fa-remove'></span></a>";
    }
}

function allOrders(){
    location.replace(window.location.origin + "/orders");
}

function users(){
    location.replace(window.location.origin + "/users");
}

$(document).ready(async function() {
    Notification.requestPermission().then(function (permission) {
        console.log(permission);
    });
notifyMe()
})

function notifyMe() {
    if (!window.Notification) {
        console.log('Browser does not support notifications.');
    } else {
        // check if permission is already granted
        if (Notification.permission === 'granted') {
            // show notification here
            var notify = new Notification('Hi there!', {
                body: 'How are you doing?',
            });
        } else {
            // request permission from user
            Notification.requestPermission().then(function (p) {
                if (p === 'granted') {
                    // show notification here
                    var notify = new Notification('Hi there!', {
                        body: 'How are you doing?',
                    });
                } else {
                    console.log('User blocked notifications.');
                }
            }).catch(function (err) {
                console.error(err);
            });
        }
    }
}





