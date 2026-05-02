.class public Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;
.super Ljava/lang/Object;
.source "RequestClientConnControl.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpRequestInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final PROXY_CONN_DIRECTIVE:Ljava/lang/String; = "Proxy-Connection"


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 59
    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 8
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    const-string v3, "HTTP request"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "method":Ljava/lang/String;
    const-string v3, "CONNECT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 67
    const-string v3, "Proxy-Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lcz/msebera/android/httpclient/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_1c
    :goto_1c
    return-void

    .line 71
    :cond_1d
    invoke-static {p2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 74
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getHttpRoute()Lcz/msebera/android/httpclient/conn/routing/RouteInfo;

    move-result-object v2

    .line 75
    .local v2, "route":Lcz/msebera/android/httpclient/conn/routing/RouteInfo;
    if-nez v2, :cond_2f

    .line 76
    iget-object v3, p0, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v4, "Connection route not set in the context"

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1c

    .line 80
    :cond_2f
    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_3c

    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 81
    :cond_3c
    const-string v3, "Connection"

    invoke-interface {p1, v3}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 82
    const-string v3, "Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :cond_4b
    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1c

    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 86
    const-string v3, "Proxy-Connection"

    invoke-interface {p1, v3}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1c

    .line 87
    const-string v3, "Proxy-Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method
