<%@ WebHandler Language="C#" Class="ActionResource" %>
using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;
using System.Collections.Generic;
public class ActionResource : IHttpHandler, IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var action = context.Request["action"].ToString().ToLower();
        switch(action)
        {
            case "create":
                {
                    try
                    {
                        var ResourceId = context.Request["ResourceId"].ToString();
                        var ResourceTitle = context.Request["ResourceTitle"].ToString();
                        var Description = context.Request["Description"].ToString();
                        var ResourceSubGroupId = context.Request["ResourceSubGroupId"].ToString();
                        var SourceIds = context.Request["SourceId"].ToString().Split(new [] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var lstSourceIds = new List<string>(SourceIds);
                        var db = new ResEntities();
                        var entity = new Resource();
                        entity.ResourceId = ResourceId;
                        entity.ResourceTitle = ResourceTitle;
                        entity.Description = Description;
                        entity.ResourceSubGroupId = ResourceSubGroupId;
                        db.Resource.Add(entity);
                        foreach(var sourceId in lstSourceIds)
                        {
                            var source = new ResourceLink();
                            source.ResourceId = ResourceId;
                            source.SourceId = sourceId;
                            db.ResourceLink.Add(source);
                        }
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
                        var ResourceId = context.Request["ResourceId"].ToString();
                        var ResourceTitle = context.Request["ResourceTitle"].ToString();
                        var Description = context.Request["Description"].ToString();
                        var ResourceSubGroupId = context.Request["ResourceSubGroupId"].ToString();
                        var SourceIds = context.Request["SourceId"].ToString().Split(new [] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var lstSourceIds = new List<string>(SourceIds);
                        var db = new ResEntities();
                        var entity = db.Resource.AsEnumerable().FirstOrDefault(g=>g.ResourceId.ToString() == ResourceId);
                        if (entity != null)
                        {
                            entity.ResourceTitle = ResourceTitle;
                            entity.Description = Description;
                            entity.ResourceSubGroupId = ResourceSubGroupId;
                            foreach (var item in entity.ResourceLink.Where(r => r.ResourceId == ResourceId).ToList())
                            {
                                if (lstSourceIds.Contains(item.SourceId))
                                {
                                    lstSourceIds.Remove(item.SourceId);
                                }
                                else
                                {
                                    entity.ResourceLink.Remove(item);
                                }
                            }
                            foreach (var sourceId in lstSourceIds)
                            {
                                var link = new ResourceLink();
                                link.ResourceId = ResourceId;
                                link.SourceId = sourceId;
                                db.ResourceLink.Add(link);
                            }
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
            case "updatelink":
                {
                    try
                    {
                        var ResourceId = context.Request["ResourceId"].ToString();
                        var SourceId = context.Request["SourceId"].ToString();
                        var ResourceLink = context.Request["ResourceLink"].ToString();
                        var ResourceCode = context.Request["ResourceCode"].ToString();
                        var db = new ResEntities();
                        var entity = db.ResourceLink.AsEnumerable().FirstOrDefault(g=>g.ResourceId.ToString() == ResourceId && g.SourceId == SourceId);
                        if (entity != null)
                        {
                            entity.Link = ResourceLink;
                            entity.ResourceCode = ResourceCode;
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
                        var ResourceIds = context.Request["ResourceId"].ToString().Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var db = new ResEntities();
                        foreach(var ResourceId in ResourceIds)
                        {
                            var entity = db.Resource.AsEnumerable().FirstOrDefault(g=>g.ResourceId == ResourceId);
                            if (entity != null)
                            {
                                entity.ResourceClick.Clear();
                                entity.ResourceLink.Clear();
                                db.Resource.Remove(entity);
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