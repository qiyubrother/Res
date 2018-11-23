<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditResourceLink.aspx.cs" Inherits="Admin_pop_EditResourceLink" %>
    <%
        var db = new ResEntities();
        var item = db.ResourceLink.AsEnumerable().FirstOrDefault(g => g.ResourceId == Request["id"].ToString() && g.SourceId == Request["sourceId"].ToString());
        if (item != null)
        {
            ResourceId.Value = item.ResourceId;
            SourceId.Value = item.SourceId;
            SourceName.Value = item.Source.SourceName;
            ResourceLink.Value = item.Link;
            ResourceCode.Value = item.ResourceCode;
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
                        <div class="form-group hidden">
                            <label>SourceId</label>
                            <input class="form-control" name="SourceId" id="SourceId" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>SourceName</label>
                            <input class="form-control" name="SourceName" id="SourceName" placeholder="" disabled runat="server" />
                        </div>
                        <div class="form-group">
                            <label>ResourceLink</label>
                            <input class="form-control" name="ResourceLink" id="ResourceLink" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>ResourceCode</label>
                            <input class="form-control" name="ResourceCode" id="ResourceCode" placeholder="" runat="server" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="editLinkClose">Close</button>
                <button type="button" class="btn btn-primary" id="editLinkSave">Save</button>
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
    })
</script>