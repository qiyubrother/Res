<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewSource.aspx.cs" Inherits="Admin_pop_NewSource" %>
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
                            <label>SourceId</label>
                            <input class="form-control" name="SourceId" id="SourceId" placeholder="" />
                        </div>
                        <div class="form-group">
                            <label>Pos</label>
                            <input class="form-control" name="Pos" id="Pos" placeholder="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>SourceName</label>
                            <input class="form-control" name="SourceName" id="SourceName" placeholder="" />
                        </div>
                        <div class="form-group">
                            <label>IsPrimary</label>
                            <input class="form-control" name="IsPrimary" id="IsPrimary" value="0" placeholder="" runat="server" />
                            <span class="help-block">1:Primary, 0:Not primary.</span>
                        </div>
                        <div class="form-group">
                            <label>IsDefault</label>
                            <input class="form-control" name="IsDefault" id="IsDefault" placeholder="" runat="server" />
                            <span class="help-block">1:Default, 0:Not Default.</span>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <input class="form-control" name="Status" id="Status" value="1" placeholder="" runat="server" />
                            <span class="help-block">1:Active, 0:Disable.</span>
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