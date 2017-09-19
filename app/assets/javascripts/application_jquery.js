/**
 * Created by zhuolunliu on 2017/7/13.
 */
function remove_fields(link, type) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".field").hide();
    Materialize.toast("<i class='material-icons left'>clear</i>Removed " + type + ' entry', 4000, 'rounded');
}

function add_fields(link, association, content, type) {
    var new_id = new Date().getTime();
    var regexp = new RegExp('new_' + association, 'g');
    $(link).closest(".row").before(content.replace(regexp, new_id));
    Materialize.toast("<i class='material-icons left'>add</i>Added " + type + ' entry', 4000, 'rounded');
}

function undo_remove_fields(link) {
    $(link).prev("input[type=hidden]").value = "false";
    $(link).closest(".field").show();
}