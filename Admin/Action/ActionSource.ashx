<%@ WebHandler Language="C#" Class="ActionSource" %>

using System;
using System.Web;
using System.Linq;
using System.Web.SessionState;

public class ActionSource : IHttpHandler, IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var action = context.Request["action"].ToString().ToLower();
        switch(action)
        {
            case "create":
                {
                    try
                    {
                        var SourceId = context.Request["SourceId"].ToString();
                        var SourceName = context.Request["SourceName"].ToString();
                        var Pos = context.Request["Pos"].ToString();
                        var IsPrimary = context.Request["IsPrimary"].ToString();
                        var IsDefault = context.Request["IsDefault"].ToString();
                        var Status = context.Request["Status"].ToString();
                        var db = new ResEntities();
                        var entity = new Source();
                        entity.SourceId = SourceId;
                        entity.SourceName = SourceName;
                        entity.Pos = Convert.ToInt32(Pos);
                        entity.IsPrimary = IsPrimary;
                        entity.IsDefault = IsDefault;
                        entity.Status = Status;
                        db.Source.Add(entity);
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
                        var SourceId = context.Request["SourceId"].ToString();
                        var SourceName = context.Request["SourceName"].ToString();
                        var Pos = context.Request["Pos"].ToString();
                        var IsPrimary = context.Request["IsPrimary"].ToString();
                        var IsDefault = context.Request["IsDefault"].ToString();
                        var Status = context.Request["Status"].ToString();
                        var db = new ResEntities();
                        var entity = db.Source.AsEnumerable().FirstOrDefault(g=>g.SourceId.ToString() == SourceId);
                        if (entity != null)
                        {
                            entity.SourceName = SourceName;
                            entity.Pos = Convert.ToInt32(Pos);
                            entity.IsPrimary = IsPrimary;
                            entity.IsDefault = IsDefault;
                            entity.Status = Status;
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
                        var SourceIds = context.Request["SourceId"].ToString().Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var db = new ResEntities();
                        foreach(var SourceId in SourceIds)
                        {
                            var entity = db.Source.AsEnumerable().FirstOrDefault(g=>g.SourceId.ToString() == SourceId);
                            if (entity != null)
                            {
                                db.Source.Remove(entity);
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