<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteComfirm.aspx.cs" Inherits="Admin_pop_DeleteComfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Delete Alert
                </h4>
            </div>
            <div class="modal-body" style="background-color:lightgoldenrodyellow">
				<span class="h3">Are you sure you want to </span><span class="h3 btn-danger" >delete</span><span class="h3"> it? </span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="delCancel">Cancel</button>
                <button type="button" class="btn btn-danger" id="delYes">  Yes  </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
