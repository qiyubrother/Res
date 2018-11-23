<%@ WebHandler Language="C#" Class="ActionSearchKey" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;

public class ActionSearchKey : IHttpHandler, IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var action = context.Request["action"].ToString().ToLower();
        switch(action)
        {
            case "create":
                {
                    try
                    {
                        var SearchKeyId = context.Request["SearchKeyId"].ToString();
                        var SearchKeyText = context.Request["SearchKeyText"].ToString();
                        var db = new ResEntities();
                        var entity = new SearchKey();
                        entity.SearchKeyId = Convert.ToInt32(SearchKeyId);
                        entity.SearchKeyText = SearchKeyText;
                        db.SearchKey.Add(entity);
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
                        var SearchKeyId = context.Request["SearchKeyId"].ToString();
                        var SearchKeyText = context.Request["SearchKeyText"].ToString();
                        var db = new ResEntities();
                        var entity = db.SearchKey.AsEnumerable().FirstOrDefault(g=>g.SearchKeyId.ToString() == SearchKeyId);
                        if (entity != null)
                        {
                            entity.SearchKeyText = SearchKeyText;
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
                        var SearchKeyIds = context.Request["SearchKeyId"].ToString().Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        var db = new ResEntities();
                        foreach(var SearchKeyId in SearchKeyIds)
                        {
                            var entity = db.SearchKey.AsEnumerable().FirstOrDefault(g=>g.SearchKeyId.ToString() == SearchKeyId);
                            if (entity != null)
                            {
                                db.SearchKey.Remove(entity);
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