﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditResourceGroup.aspx.cs" Inherits="Admin_pop_EditResourceGroup" %>
    <%
        var db = new ResEntities();
        var group = db.ResourceGroup.AsEnumerable().FirstOrDefault(g => g.ResourceGroupId == Request["id"].ToString());
        if (group != null)
        {
            ResourceGroupId.Value = group.ResourceGroupId;
            ResourceGroup.Value = group.ResourceGroupName;
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
                            <label>ResourceGroupId</label>
                            <input class="form-control" name="ResourceGroupId" id="ResourceGroupId" placeholder="" disabled runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>ResourceGroup</label>
                            <input class="form-control" name="ResourceGroup" id="ResourceGroup" placeholder="" runat="server" />
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