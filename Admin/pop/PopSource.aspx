<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopSource.aspx.cs" Inherits="Admin_pop_PopSource" %>

<!-- 模态框（Modal） -->
<div class="modal fade" id="popSourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-2" aria-hidden="true">
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
                        var Items = db.Source.ToList();
                        foreach (var item in Items)
                        {
                    %><span class="hidden"><%=item.SourceId %></span>
                    <a href="#" name="sourceName" class="list-group-item"><%=item.SourceName %></a>
                    <%  } %>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="popClose">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="popSave">Select</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        $("a[name='sourceName']").click(function () {
            $(this).addClass("active");

        });
        $("#popSave").click(function () {
            var sourceList = "";
            var sourceIdList = "";
            $("a.active[name='sourceName']").each(function (index, element) {
                sourceList += $(element).html() + ",";
                sourceIdList += $(element).prev().html() + ",";
            });
            if (sourceIdList.length > 1) sourceIdList = sourceIdList.substring(0, sourceIdList.length - 1);
            if (sourceList.length > 1) sourceList = sourceList.substring(0, sourceList.length - 1);
            $("#popSourceModal").modal("hide");
            $("#SourceId").val(sourceIdList);
            $("#SourceName").val(sourceList);
            //alert(sourceIdList);
            //alert(sourceList);
        });
    })
</script>