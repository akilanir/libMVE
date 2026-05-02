.class public Lorg/apache/http/protocol/ResponseConnControl;
.super Ljava/lang/Object;
.source "ResponseConnControl.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    if-nez p1, :cond_a

    .line 61
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "HTTP response may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 63
    :cond_a
    if-nez p2, :cond_14

    .line 64
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "HTTP context may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 67
    :cond_14
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    .line 68
    .local v4, "status":I
    const/16 v6, 0x190

    if-eq v4, v6, :cond_38

    const/16 v6, 0x198

    if-eq v4, v6, :cond_38

    const/16 v6, 0x19b

    if-eq v4, v6, :cond_38

    const/16 v6, 0x19d

    if-eq v4, v6, :cond_38

    const/16 v6, 0x19e

    if-eq v4, v6, :cond_38

    const/16 v6, 0x1f7

    if-eq v4, v6, :cond_38

    const/16 v6, 0x1f5

    if-ne v4, v6, :cond_40

    .line 75
    :cond_38
    const-string v6, "Connection"

    const-string v7, "Close"

    invoke-interface {p1, v6, v7}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    :cond_3f
    :goto_3f
    return-void

    .line 78
    :cond_40
    const-string v6, "Connection"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 79
    .local v1, "explicit":Lorg/apache/http/Header;
    if-eqz v1, :cond_54

    const-string v6, "Close"

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3f

    .line 85
    :cond_54
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 86
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_82

    .line 87
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v5

    .line 88
    .local v5, "ver":Lorg/apache/http/ProtocolVersion;
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-gez v6, :cond_82

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v6

    if-eqz v6, :cond_7a

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v5, v6}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v6

    if-eqz v6, :cond_82

    .line 90
    :cond_7a
    const-string v6, "Connection"

    const-string v7, "Close"

    invoke-interface {p1, v6, v7}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3f

    .line 95
    .end local v5    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_82
    const-string v6, "http.request"

    invoke-interface {p2, v6}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/HttpRequest;

    .line 97
    .local v3, "request":Lorg/apache/http/HttpRequest;
    if-eqz v3, :cond_3f

    .line 98
    const-string v6, "Connection"

    invoke-interface {v3, v6}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 99
    .local v2, "header":Lorg/apache/http/Header;
    if-eqz v2, :cond_9e

    .line 100
    const-string v6, "Connection"

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v6, v7}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3f

    .line 101
    :cond_9e
    invoke-interface {v3}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v6

    sget-object v7, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v6, v7}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v6

    if-eqz v6, :cond_3f

    .line 102
    const-string v6, "Connection"

    const-string v7, "Close"

    invoke-interface {p1, v6, v7}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3f
.end method
