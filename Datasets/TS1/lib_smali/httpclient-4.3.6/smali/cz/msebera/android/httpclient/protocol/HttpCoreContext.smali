.class public Lcz/msebera/android/httpclient/protocol/HttpCoreContext;
.super Ljava/lang/Object;
.source "HttpCoreContext.java"

# interfaces
.implements Lcz/msebera/android/httpclient/protocol/HttpContext;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final HTTP_CONNECTION:Ljava/lang/String; = "http.connection"

.field public static final HTTP_REQUEST:Ljava/lang/String; = "http.request"

.field public static final HTTP_REQ_SENT:Ljava/lang/String; = "http.request_sent"

.field public static final HTTP_RESPONSE:Ljava/lang/String; = "http.response"

.field public static final HTTP_TARGET_HOST:Ljava/lang/String; = "http.target_host"


# instance fields
.field private final context:Lcz/msebera/android/httpclient/protocol/HttpContext;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->context:Lcz/msebera/android/httpclient/protocol/HttpContext;

    .line 100
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 2
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->context:Lcz/msebera/android/httpclient/protocol/HttpContext;

    .line 95
    return-void
.end method

.method public static adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/protocol/HttpCoreContext;
    .registers 2
    .param p0, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 82
    const-string v0, "HTTP context"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    instance-of v0, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;

    if-eqz v0, :cond_c

    .line 84
    check-cast p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;

    .line 86
    .end local p0    # "context":Lcz/msebera/android/httpclient/protocol/HttpContext;
    :goto_b
    return-object p0

    .restart local p0    # "context":Lcz/msebera/android/httpclient/protocol/HttpContext;
    :cond_c
    new-instance v0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;

    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;-><init>(Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    move-object p0, v0

    goto :goto_b
.end method

.method public static create()Lcz/msebera/android/httpclient/protocol/HttpCoreContext;
    .registers 2

    .prologue
    .line 78
    new-instance v0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;

    new-instance v1, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;-><init>(Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    return-object v0
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 103
    iget-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->context:Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "attribname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 115
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v1, "Attribute class"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 117
    .local v0, "obj":Ljava/lang/Object;
    if-nez v0, :cond_d

    .line 118
    const/4 v1, 0x0

    .line 120
    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {p2, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c
.end method

.method public getConnection()Lcz/msebera/android/httpclient/HttpConnection;
    .registers 3

    .prologue
    .line 128
    const-string v0, "http.connection"

    const-class v1, Lcz/msebera/android/httpclient/HttpConnection;

    invoke-virtual {p0, v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpConnection;

    return-object v0
.end method

.method public getConnection(Ljava/lang/Class;)Lcz/msebera/android/httpclient/HttpConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcz/msebera/android/httpclient/HttpConnection;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v0, "http.connection"

    invoke-virtual {p0, v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpConnection;

    return-object v0
.end method

.method public getRequest()Lcz/msebera/android/httpclient/HttpRequest;
    .registers 3

    .prologue
    .line 132
    const-string v0, "http.request"

    const-class v1, Lcz/msebera/android/httpclient/HttpRequest;

    invoke-virtual {p0, v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpRequest;

    return-object v0
.end method

.method public getResponse()Lcz/msebera/android/httpclient/HttpResponse;
    .registers 3

    .prologue
    .line 141
    const-string v0, "http.response"

    const-class v1, Lcz/msebera/android/httpclient/HttpResponse;

    invoke-virtual {p0, v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpResponse;

    return-object v0
.end method

.method public getTargetHost()Lcz/msebera/android/httpclient/HttpHost;
    .registers 3

    .prologue
    .line 149
    const-string v0, "http.target_host"

    const-class v1, Lcz/msebera/android/httpclient/HttpHost;

    invoke-virtual {p0, v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpHost;

    return-object v0
.end method

.method public isRequestSent()Z
    .registers 4

    .prologue
    .line 136
    const-string v1, "http.request_sent"

    const-class v2, Ljava/lang/Boolean;

    invoke-virtual {p0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 137
    .local v0, "b":Ljava/lang/Boolean;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 111
    iget-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->context:Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 107
    iget-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->context:Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 108
    return-void
.end method

.method public setTargetHost(Lcz/msebera/android/httpclient/HttpHost;)V
    .registers 3
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;

    .prologue
    .line 145
    const-string v0, "http.target_host"

    invoke-virtual {p0, v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpCoreContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 146
    return-void
.end method
