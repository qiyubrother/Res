<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopResourceGroup.aspx.cs" Inherits="Admin_pop_PopResourceGroup" %>

<!-- 模态框（Modal） -->
<div class="modal fade" id="popResourceGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel-3">
                    Select Group
                </h4>
            </div>
            <div class="modal-body">
                <div class="list-group">
                    <%  var db = new ResEntities();
                        var Items = db.ResourceGroup.ToList();
                        foreach (var item in Items)
                        {
                    %><span style="display:none"><%=item.ResourceGroupId %></span>
                    <a href="#" name="resourceGroupName" class="list-group-item"><%=item.ResourceGroupName %></a>
                    <%  } %>
                </div>
            </div>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="visibility:hidden" id="popClose">Close</button>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        $("a[name='resourceGroupName']").click(function () {
            //$("#selGroupId").val($(this).prev().html());
            //$("#selGroupName").val($(this).html());
            $("#popResourceGroupModal").modal("hide");
            $("#ResourceGroupId").val($(this).prev().html());
            $("#ResourceGroupName").val($(this).html());
        });
    })
</script>