<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Resource.aspx.cs" Inherits="Admin_Resource" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Resource</title>
    <script src="/Admin/js/jquery-1.9.1.min.js"></script>
    <script src="/Admin/js/bootstrap.min.js"></script>
    <link href="/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/Admin/js/Resource.js"></script>
</head>
<body>
    <%
        var db = new ResEntities();
        var Items = db.Resource.ToList();
        var cls = "btn-default";
    %>
    <div class="container">
        <div id="functionList" class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-9 col-md-9">
            <h2>Resource</h2>            
            <table class="table table-hover table-muti-sel">
                <tr>
                    <th><input type="checkbox" name="chkAllOp" /></th>
                    <th>ResourceId</th>
                    <th>ResourceTitle</th>
                    <th>Description</th>
                    <th class="hidden">ResourceSubGroupId</th>
                    <th>ResourceSubGroup</th>
                    <th>TotalClick</th>
                    <th>Source</th>
                    <th>&nbsp;</th>
                </tr>
                <% foreach (var item in Items){%>
                    <tr>
                        <td><input type="checkbox" name="chkSel" /></td>
                        <td><%=item.ResourceId %></td>
                        <td><%=item.ResourceTitle%></td>
                        <td><%=item.Description%></td>
                        <td class="hidden"><%=item.ResourceSubGroupId%></td>
                        <td><%=item.ResourceSubGroup.ResourceSubGroupName%></td>
                        <td><%=item.TotalClick%></td>
                        <td><div class="btn-group"><% foreach (var source in item.ResourceLink)
                              { %><span class="hidden"><%=source.SourceId%></span>
                            <% if (source.Link == null || source.Link.Trim() == string.Empty) cls = "btn-default"; else cls = "btn-success";%>
                            <a name="showEditSourceDialog" href="#" class="btn <%=cls%>"><%=source.Source.SourceName%></a>
                            <%} %></div>
                        </td>
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
