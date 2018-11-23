<%@ WebHandler Language="C#" Class="ActionResourceGroup" %>
using System;
using System.Linq;
using System.Web;
using System.Web.SessionState;
public class ActionResourceGroup : IHttpHandler, IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var action = context.Request["action"].ToString().ToLower();
        switch(action)
        {
            case "create":
                {
                    try
                    {
                        var ResourceGroupId = context.Request["ResourceGroupId"].ToString();
                        var ResourceGroup = context.Request["ResourceGroup"].ToString();
                        var db = new ResEntities();
                        var entity = new ResourceGroup();
                        entity.ResourceGroupId = ResourceGroupId;
                        entity.ResourceGroupName = ResourceGroup;
                        db.ResourceGroup.Add(entity);
                        db.SaveChanges();
                        context.Response.Write("{\"status\":\"OK\"}");
                    }
                    catch (Exception e)
                    {
                        context.Response.Write("{\"status\":\"Error\"}");
                    }
                    return;
                }
            case "update":
                {
                    try
                    {
                        var ResourceGroupId = context.Request["ResourceGroupId"].ToString();
                        var ResourceGroup = context.Request["ResourceGroup"].ToString();
                        var db = new ResEntities();
                        var entity = db.ResourceGroup.AsEnumerable().FirstOrDefault(g=>g.ResourceGroupId == ResourceGroupId);
                        if (entity != null)
                        {
                            entity.ResourceGroupName = ResourceGroup;
                            db.SaveChanges();
                            context.Response.Write("{\"status\":\"OK\"}");
                            return;
                        }
                        context.Response.Write("{\"status\":\"Error\"}");
                    }
                    catch (Exception e)
                    {
                        context.Response.Write("{\"status\":\"Error\"}");
                    }
                    return;
                }
            case "delete":
                {
                    try
                    {
                        var ResourceGroupIds = context.Request["ResourceGroupId"].ToString().Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var db = new ResEntities();
                        foreach(var ResourceGroupId in ResourceGroupIds)
                        {
                            var entity = db.ResourceGroup.AsEnumerable().FirstOrDefault(g=>g.ResourceGroupId == ResourceGroupId);
                            if (entity != null)
                            {
                                db.ResourceGroup.Remove(entity);
                            }
                        }
                        db.SaveChanges();
                        context.Response.Write("{\"status\":\"OK\"}");
                        return;
                    }
                    catch (Exception e)
                    {
                        context.Response.Write("{\"status\":\"Error\"}");
                    }
                    return;
                }
            default:
                break;
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}