$(function () {
    // 装置功能列表
    $("#functionList").load("/Admin/inc/FunctionList.html", function () {
        $("#funResourceSubGroup").addClass("active");
    });
    // 全选/取消全选
    $("input[type='checkbox'][name='chkAllOp']").click(function () {
        var val = $(this).is(":checked");
        $(".table-muti-sel tr td:nth-child(1)").each(function (index, value) {
            $(value).find("input[type='checkbox']").eq(0).prop("checked", val);
        });
    });
    // 单选
    $("input[type='checkbox'][name='chkSel']").click(function () {
        var val = $(this).is(":checked");
        if (!val) {
            $("input[type='checkbox'][name='chkAllOp']").removeAttr("checked");
        }
        else {
            var isAllChecked = true;
            $(".table-muti-sel tr td:nth-child(1)").each(function (key, value) {
                if (!$(this).find("input[type='checkbox']")[0].checked) {
                    isAllChecked = false;
                    //break;
                }
            });
            if (isAllChecked) {
                $("input[type='checkbox'][name='chkAllOp']").prop("checked", true);
            }

        }
    });
    // 删除
    $("#deleteSel").click(function () {
        $("#dialogContainer").empty().load("/Admin/pop/DeleteComfirm.aspx?_=" + Math.random(), function () {
            $("#myModal").modal({
                backdrop: true,
                keyboard: true
            });
        });
    });
    // 弹出新建对话框
    $("#showNewDialog").click(function () {
        $("#dialogContainer").empty().load("/Admin/pop/NewResourceSubGroup.aspx?_" + Math.random(), function () {
            $("#myModal").modal({
                backdrop: true,
                keyboard: true
            });
        });
    });
    // 弹出编辑对话框
    $("a[name='showEditDialog']").click(function () {
        // GET ID
        var id = $(this).parent().parent().find("td").eq(1).html();
        $("#dialogContainer").empty().load("/Admin/pop/EditResourceSubGroup.aspx?id=" + id + "&_" + Math.random(), function () {
            $("#myModal").modal({
                backdrop: true,
                keyboard: true
            });
        });
    });
    // 新建对话框 - 保存
    $("#dialogContainer").on("click", "#newSave", function () {
        var ResourceGroupId = $("#ResourceGroupId").val();
        var ResourceSubGroupId = $("#ResourceSubGroupId").val();
        var ResourceSubGroupName = $("#ResourceSubGroupName").val();
        $.ajax({
            type: "post",
            datatype: "json",
            url: "/Admin/Action/ActionResourceSubGroup.ashx?action=create"
            + encodeURI("&ResourceGroupId=" + ResourceGroupId + "&ResourceSubGroupId=" + ResourceSubGroupId + "&ResourceSubGroupName=" + ResourceSubGroupName),
            success: function (d) {
                var jsondata = JSON.parse(d);
                // 关闭对话框
                $("#newClose").click();
                // 刷新页面
                location.reload();
            },
            error: function (d) {
                alert(d.status);
            }
        })
    });
    // 编辑对话框 - 保存
    $("#dialogContainer").on("click", "#editSave", function () {
        var ResourceGroupId = $("#ResourceGroupId").val();
        var ResourceSubGroupId = $("#ResourceSubGroupId").val();
        var ResourceSubGroupName = $("#ResourceSubGroupName").val();

        $.ajax({
            type: "post",
            datatype: "json",
            url: "/Admin/Action/ActionResourceSubGroup.ashx?action=update"
            + encodeURI("&ResourceGroupId=" + ResourceGroupId + "&ResourceSubGroupId=" + ResourceSubGroupId + "&ResourceSubGroupName=" + ResourceSubGroupName),
            success: function (d) {
                var jsondata = JSON.parse(d);
                // 关闭对话框
                $("#editClose").click();
                // 提示
                //alert(jsondata.status);
                // 刷新页面
                location.reload();
            },
            error: function (d) {
                alert(d.status);
            }
        })
    });
    // 删除对话框 - Yes
    $("#dialogContainer").on("click", "#delYes", function () {
        var id;
        var ids = "";
        $(".table-muti-sel tr td:nth-child(1)").each(function (key, value) {
            if ($(this).find("input[type='checkbox']")[0].checked) {
                id = $(this).find("input[type='checkbox']").parent().next().html();
                ids = ids + id + ",";
            }
        });
        if (ids.length > 0 && ids[ids.length - 1] == ",") {
            ids = ids.substring(0, ids.length - 1);
        }
        $.ajax({
            type: "post",
            datatype: "json",
            url: "/Admin/Action/ActionResourceSubGroup.ashx?action=delete" + "&ResourceSubGroupId=" + ids,
            success: function (d) {
                var jsondata = JSON.parse(d);
                // 关闭对话框
                $("#editClose").click();
                // 提示
                location.reload();
            },
            error: function (d) {
                alert(d.status);
            }
        })
    });

})