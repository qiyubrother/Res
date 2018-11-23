<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopResourceSubGroup.aspx.cs" Inherits="Admin_pop_PopResourceSubGroup" %>
<!-- 模态框（Modal） -->
<div class="modal fade" id="popResourceSubGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-2" aria-hidden="true">
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
                    <div class="panel-group" role="tablist" aria-multiselectable="true">
                    <%  var db = new ResEntities();
                        var Items = db.ResourceGroup.ToList();
                        foreach (var item in Items)
                        {
                    %>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse">
                              <%=item.ResourceGroupName %>
                            </a>
                          </h4>
                        </div>
                        <div class="panel-collapse collapse in" role="tabpanel" >
                          <div class="panel-body">
                              <%foreach (var subItem in item.ResourceSubGroup)
                                  { %>
                              <span class="hidden"><%=subItem.ResourceSubGroupId %></span>
                              <a href="#" class="btn btn-default" name="$subGroupName$"><%=subItem.ResourceSubGroupName %></a>
                              <%} %>
                          </div>
                        </div>
                      </div>
                    <%} %>
                    </div>
            </div>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="visibility:hidden" id="popClose">Close</button>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        $("a[name='$subGroupName$']").click(function () {
            //alert($(this).prev().html());
            //alert($(this).html());
            $("#popResourceSubGroupModal").modal("hide");
            $("#ResourceSubGroupId").val($(this).prev().html());
            $("#ResourceSubGroupName").val($(this).html());
        });
    })
</script>
