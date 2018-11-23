<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewResourceGroup.aspx.cs" Inherits="Admin_pop_NewResourceGroup" %>

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
                            <label>ResourceGroupId</label>
                            <input class="form-control" name="ResourceGroupId" id="ResourceGroupId" placeholder="" />
                        </div>
                        <div class="form-group">
                            <label>ResourceGroup</label>
                            <input class="form-control" name="ResourceGroup" id="ResourceGroup" placeholder="" />
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

