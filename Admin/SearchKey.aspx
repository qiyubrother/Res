<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchKey.aspx.cs" Inherits="Admin_SearchKey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Search Key</title>
    <script src="/Admin/js/jquery-1.9.1.min.js"></script>
    <script src="/Admin/js/bootstrap.min.js"></script>
    <link href="/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/Admin/js/SearchKey.js"></script>
</head>
<body>
    <%
        var db = new ResEntities();
        var Items = db.SearchKey.ToList();
    %>
    <div class="container">
        <div id="functionList" class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-9 col-md-9">
            <h2>Search Key</h2>            
            <table class="table table-hover table-muti-sel">
                <tr>
                    <th><input type="checkbox" name="chkAllOp" /></th>
                    <th>SearchKeyId</th>
                    <th>SearchKeyText</th>
                    <th>&nbsp;</th>
                </tr>
                <% foreach (var item in Items){%>
                    <tr>
                        <td><input type="checkbox" name="chkSel" /></td>
                        <td><%=item.SearchKeyId %></td>
                        <td><%=item.SearchKeyText%></td>
                        <td><a class="btn btn-primary" href="#" name="showEditDialog">Edit</a></td>
                    </tr>
                <%} %>
            </table>
            <div class="commandPanel">
                <a class="btn btn-primary" href="#" id="showNewDialog">New Item</a>
                <a class="btn btn-warning" href="#" id="deleteSel">Delete</a>
            </div>
        </div>
        <div id="dialogContainer"></div>
    </div>
</body>
</html>
