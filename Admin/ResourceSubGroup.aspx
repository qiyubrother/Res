<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResourceSubGroup.aspx.cs" Inherits="Admin_ResourceSubGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Resource Sub Group</title>
    <script src="/Admin/js/jquery-1.9.1.min.js"></script>
    <script src="/Admin/js/bootstrap.min.js"></script>
    <link href="/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/Admin/js/ResourceSubGroup.js"></script>
</head>
<body>
    <%
        var db = new ResEntities();
        var Items = db.ResourceSubGroup.ToList();
    %>
    <div class="container">
        <div id="functionList" class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-9 col-md-9">
            <h2>Resource Sub Group</h2>            
            <table class="table table-hover table-muti-sel">
                <tr>
                    <th><input type="checkbox" name="chkAllOp" /></th>
                    <th>SubGroupId</th>
                    <th>GroupId</th>
                    <th>GroupName</th>
                    <th>SubGroupName</th>
                    <th>&nbsp;</th>
                </tr>
                <% foreach (var item in Items){%>
                    <tr>
                        <td><input type="checkbox" name="chkSel" /></td>
                        <td><%=item.ResourceSubGroupId %></td>
                        <td><%=item.ResourceGroupId %></td>
                        <td><%=item.ResourceGroup.ResourceGroupName %></td>
                        <td><%=item.ResourceSubGroupName%></td>
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
