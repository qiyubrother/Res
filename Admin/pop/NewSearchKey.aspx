<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewSearchKey.aspx.cs" Inherits="Admin_pop_NewSearchKey" %>
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
                            <label>SearchKeyId</label>
                            <input class="form-control" name="SearchKeyId" id="SearchKeyId" placeholder="" />
                        </div>
                        <div class="form-group">
                            <label>SearchKeyText</label>
                            <input class="form-control" name="SearchKeyText" id="SearchKeyText" placeholder="" />
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
