<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewResourceSubGroup.aspx.cs" Inherits="Admin_pop_NewResourceSubGroup" %>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    New Item
                </h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <div class="form-group">
                            <label>ResourceSubGroupId</label>
                            <input class="form-control" name="ResourceSubGroupId" id="ResourceSubGroupId" placeholder="" />
                        </div>
                        <div class="form-group" style="display:none">
                            <label>ResourceGroupId</label>
                            <input class="form-control" name="ResourceGroupId" id="ResourceGroupId" placeholder="" />
                        </div>
                        <div class="form-group">
                            <label>ResourceGroup</label>
                            <input type="button" class="form-control" name="ResourceGroupName" id="ResourceGroupName" />
                        </div>
                        <div class="form-group">
                            <label>ResourceSubGroupName</label>
                            <input class="form-control" name="ResourceSubGroupName" id="ResourceSubGroupName" placeholder="" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="newClose">Close</button>
                <button type="button" class="btn btn-primary" id="newSave">Save</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id="popDialogContainer"></div>
<script>
    $(function () {
        // 弹出对话框
        $("#ResourceGroupName").click(function () {
            $("#popDialogContainer").empty().load("/Admin/pop/PopResourceGroup.aspx?_" + Math.random(), function () {
                $("#popResourceGroupModal").modal({
                    backdrop: true,
                    keyboard: true
                });
            });
        });
    })
</script>
