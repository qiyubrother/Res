<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Source.aspx.cs" Inherits="Admin_Source" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Search Key</title>
    <script src="/Admin/js/jquery-1.9.1.min.js"></script>
    <script src="/Admin/js/bootstrap.min.js"></script>
    <link href="/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/Admin/js/Source.js"></script>
</head>
<body>
    <%
        var db = new ResEntities();
        var Items = db.Source.ToList();
    %>
    <div class="container">
        <div id="functionList" class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-9 col-md-9">
            <h2>Source</h2>            
            <table class="table table-hover table-muti-sel">
                <tr>
                    <th><input type="checkbox" name="chkAllOp" /></th>
                    <th>SourceId</th>
                    <th>Pos</th>
                    <th>SourceName</th>
                    <th>IsPrimary</th>
                    <th>IsDefault</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                </tr>
                <% foreach (var item in Items){%>
                    <tr>
                        <td><input type="checkbox" name="chkSel" /></td>
                        <td><%=item.SourceId %></td>
                        <td><%=item.Pos%></td>
                        <td><%=item.SourceName%></td>
                        <td><%=item.IsPrimary%></td>
                        <td><%=item.IsDefault%></td>
                        <td><%=item.Status%></td>
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
