<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditResourceSubGroup.aspx.cs" Inherits="Admin_pop_EditResourceSubGroup" %>

    <%
        var db = new ResEntities();
        var item = db.ResourceSubGroup.AsEnumerable().FirstOrDefault(g => g.ResourceSubGroupId == Request["id"].ToString());
        if (item != null)
        {
            ResourceGroupId.Value = item.ResourceGroupId;
            ResourceGroupName.Value = item.ResourceGroup.ResourceGroupName;
            ResourceSubGroupId.Value = item.ResourceSubGroupId;
            ResourceSubGroupName.Value = item.ResourceSubGroupName;
        }
    %>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Edit Item
                </h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <div class="form-group">
                            <label>ResourceSubGroupId</label>
                            <input class="form-control" name="ResourceSubGroupId" id="ResourceSubGroupId" placeholder="" runat="server" disabled />
                        </div>
                        <div class="form-group" style="display:none">
                            <label>ResourceGroupId</label>
                            <input class="form-control" name="ResourceGroupId" id="ResourceGroupId" placeholder="" disabled runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>ResourceGroupName</label>
                            <input type="button" class="form-control" name="ResourceGroupName" id="ResourceGroupName" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>ResourceSubGroup</label>
                            <input class="form-control" name="ResourceSubGroupName" id="ResourceSubGroupName" placeholder="" runat="server" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="editClose">Close</button>
                <button type="button" class="btn btn-primary" id="editSave">Save</button>
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
