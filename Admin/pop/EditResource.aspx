<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditResource.aspx.cs" Inherits="Admin_pop_EditResource" %>
    <%
        var db = new ResEntities();
        var item = db.Resource.AsEnumerable().FirstOrDefault(g => g.ResourceId == Request["id"].ToString());
        if (item != null)
        {
            ResourceId.Value = item.ResourceId;
            ResourceTitle.Value = item.ResourceTitle;
            Description.Value = item.Description;
            ResourceSubGroupId.Value = item.ResourceSubGroupId;
            ResourceSubGroupName.Value = item.ResourceSubGroup.ResourceSubGroupName;

            var sourceIds = new StringBuilder();
            var sources = new StringBuilder();
            foreach(var source in item.ResourceLink)
            {
                sourceIds.Append(source.Source.SourceId + ",");
                sources.Append(source.Source.SourceName + ",");
            }
            if (sourceIds.Length > 1) sourceIds.Length--;
            if (sources.Length > 1) sources.Length--;
            SourceId.Value = sourceIds.ToString();
            SourceName.Value = sources.ToString();
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
                            <label>ResourceId</label>
                            <input class="form-control" name="ResourceId" id="ResourceId" placeholder="" disabled runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>ResourceTitle</label>
                            <input class="form-control" name="ResourceTitle" id="ResourceTitle" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input class="form-control" name="Description" id="Description" placeholder="" runat="server" />
                        </div>
                        <div class="form-group hidden">
                            <label>ResourceSubGroupId</label>
                            <input class="form-control" name="ResourceSubGroupId" id="ResourceSubGroupId" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>ResourceSubGroup</label>
                            <input type="button" class="form-control" name="ResourceSubGroupName" id="ResourceSubGroupName" runat="server" />
                        </div>
                        <div class="form-group hidden">
                            <label>ResourceSourceId</label>
                            <input type="button" class="form-control" name="SourceId" id="SourceId" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>ResourceSource</label>
                            <input type="button" class="form-control" name="SourceName" id="SourceName" runat="server" />
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
        $("#ResourceSubGroupName").click(function () {
            $("#popDialogContainer").empty().load("/Admin/pop/PopResourceSubGroup.aspx?_" + Math.random(), function () {
                $("#popResourceSubGroupModal").modal({
                    backdrop: true,
                    keyboard: true
                });
            });
        });
        $("#SourceName").click(function () {
            $("#popDialogContainer").empty().load("/Admin/pop/PopSource.aspx?_" + Math.random(), function () {
                $("#popSourceModal").modal({
                    backdrop: true,
                    keyboard: true
                });
            });
        });
    })
</script>