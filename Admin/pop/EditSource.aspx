<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditSource.aspx.cs" Inherits="Admin_pop_EditSource" %>

    <%
        var db = new ResEntities();
        var item = db.Source.AsEnumerable().FirstOrDefault(g => g.SourceId == Request["id"].ToString());
        if (item != null)
        {
            SourceId.Value = item.SourceId;
            SourceName.Value = item.SourceName;
            Pos.Value = item.Pos.ToString();
            IsPrimary.Value = item.IsPrimary;
            IsDefault.Value = item.IsDefault;
            Status.Value = item.Status;
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
                            <label>SourceId</label>
                            <input class="form-control" name="SourceId" id="SourceId" placeholder="" disabled runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>Pos</label>
                            <input class="form-control" name="Pos" id="Pos" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>SourceName</label>
                            <input class="form-control" name="SourceName" id="SourceName" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>IsPrimary</label>
                            <input class="form-control" name="IsPrimary" id="IsPrimary" placeholder="" runat="server" />
                            <span class="help-block">1:Primary, 0:Not primary.</span>
                        </div>
                        <div class="form-group">
                            <label>IsDefault</label>
                            <input class="form-control" name="IsDefault" id="IsDefault" placeholder="" runat="server" />
                            <span class="help-block">1:Default, 0:Not Default.</span>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <input class="form-control" name="Status" id="Status" placeholder="" runat="server" />
                            <span class="help-block">1:Active, 0:Disable.</span>
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
            $("#popDialogContainer").empty().load("/Admin/pop/PopResourceSubGroup.aspx?_" + Math.random(), function () {
                $("#popResourceSubGroupModal").modal({
                    backdrop: true,
                    keyboard: true
                });
            });
        });
    })
</script>
