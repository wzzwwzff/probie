$(function () {
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'months',
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    setTimeout(function () {
        $('#message').slideUp();
    }, 2000);
});


function sortList(orderField, orderType) {
    $('#search').append('<input type="hidden" name="_orderField" value="' + orderField + '" />');
    $('#search').append('<input type="hidden" name="_orderType" value="' + orderType + '" />');
    $("#search").submit();
}

function deleteData(id) {
    if (confirm("确认删除吗？")) {
        $.get("delete?id=" + id, function (result) {

            if (result.success == 'true') {
                window.location.reload();
            } else {
                alert(result.message);
            }
        });
    }
}

function deleteRow(url) {
    if (confirm("确认删除吗？")) {
        $.get(url, function (result) {
            if (result.success == 'true') {
                window.location.reload();
            } else {
                alert(result.message);
            }
        });
    }
}