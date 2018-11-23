<%@ WebHandler Language="C#" Class="ActionResourceSubGroup" %>

using System;
using System.Linq;
using System.Web;
using System.Web.SessionState;
public class ActionResourceSubGroup : IHttpHandler, IRequiresSessionState {

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
                        var ResourceSubGroupId = context.Request["ResourceSubGroupId"].ToString();
                        var ResourceSubGroupName = context.Request["ResourceSubGroupName"].ToString();
                        var db = new ResEntities();
                        var entity = new ResourceSubGroup();
                        entity.ResourceGroupId = ResourceGroupId;
                        entity.ResourceSubGroupId = ResourceSubGroupId;
                        entity.ResourceSubGroupName = ResourceSubGroupName;
                        db.ResourceSubGroup.Add(entity);
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
                        var ResourceSubGroupId = context.Request["ResourceSubGroupId"].ToString();
                        var ResourceSubGroupName = context.Request["ResourceSubGroupName"].ToString();
                        var db = new ResEntities();
                        var entity = db.ResourceSubGroup.AsEnumerable().FirstOrDefault(g=>g.ResourceSubGroupId == ResourceSubGroupId);
                        if (entity != null)
                        {
                            entity.ResourceGroupId = ResourceGroupId;
                            entity.ResourceSubGroupId = ResourceSubGroupId;
                            entity.ResourceSubGroupName = ResourceSubGroupName;
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
                        var ResourceSubGroupIds = context.Request["ResourceSubGroupId"].ToString().Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var db = new ResEntities();
                        foreach(var ResourceSubGroupId in ResourceSubGroupIds)
                        {
                            var entity = db.ResourceSubGroup.AsEnumerable().FirstOrDefault(g=>g.ResourceSubGroupId == ResourceSubGroupId);
                            if (entity != null)
                            {
                                db.ResourceSubGroup.Remove(entity);
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