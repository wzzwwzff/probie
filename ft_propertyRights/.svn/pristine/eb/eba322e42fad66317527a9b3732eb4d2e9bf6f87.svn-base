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

    if ($(".data_table_height_auto") != undefined) {
        resizeLayout_table();
        $(window).resize(function () {
            resizeLayout_table();
        })
    }
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
        $.get(url,{_time: new Date().getTime()},function (result) {
            if (result.success == 'true') {
                window.location.reload();
            } else {
                alert(result.message);
            }
        });
    }
}

$(function () {
    $(".validateForm").validate();
})

function resizeLayout_table() {
    var height_subtract = 0;
    $(".resizeLayout").each(function () {
        height_subtract += regexMatch($(this).outerHeight(true));
    });
    var hei = $(document.body).height() - height_subtract - 10;
    $(".data_table_height_auto").css("height", hei);
}

function regexMatch(number) {
    var reg = /^[-\+]?\d+(\.\d+)?$/;
    number = !reg.test(number) ? 0 : number;
    return number;
}