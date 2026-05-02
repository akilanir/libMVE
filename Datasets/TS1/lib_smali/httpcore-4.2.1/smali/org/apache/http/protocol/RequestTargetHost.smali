.class public Lorg/apache/http/protocol/RequestTargetHost;
.super Ljava/lang/Object;
.source "RequestTargetHost.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 11
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    if-nez p1, :cond_a

    .line 60
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "HTTP request may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 62
    :cond_a
    if-nez p2, :cond_14

    .line 63
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "HTTP context may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 66
    :cond_14
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v5

    .line 67
    .local v5, "ver":Lorg/apache/http/ProtocolVersion;
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "method":Ljava/lang/String;
    const-string v6, "CONNECT"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_35

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v5, v6}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v6

    if-eqz v6, :cond_35

    .line 97
    :cond_34
    :goto_34
    return-void

    .line 72
    :cond_35
    const-string v6, "Host"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_34

    .line 73
    const-string v6, "http.target_host"

    invoke-interface {p2, v6}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/HttpHost;

    .line 75
    .local v4, "targethost":Lorg/apache/http/HttpHost;
    if-nez v4, :cond_7d

    .line 76
    const-string v6, "http.connection"

    invoke-interface {p2, v6}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpConnection;

    .line 78
    .local v1, "conn":Lorg/apache/http/HttpConnection;
    instance-of v6, v1, Lorg/apache/http/HttpInetConnection;

    if-eqz v6, :cond_6b

    move-object v6, v1

    .line 81
    check-cast v6, Lorg/apache/http/HttpInetConnection;

    invoke-interface {v6}, Lorg/apache/http/HttpInetConnection;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 82
    .local v0, "address":Ljava/net/InetAddress;
    check-cast v1, Lorg/apache/http/HttpInetConnection;

    .end local v1    # "conn":Lorg/apache/http/HttpConnection;
    invoke-interface {v1}, Lorg/apache/http/HttpInetConnection;->getRemotePort()I

    move-result v3

    .line 83
    .local v3, "port":I
    if-eqz v0, :cond_6b

    .line 84
    new-instance v4, Lorg/apache/http/HttpHost;

    .end local v4    # "targethost":Lorg/apache/http/HttpHost;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .line 87
    .end local v0    # "address":Ljava/net/InetAddress;
    .end local v3    # "port":I
    .restart local v4    # "targethost":Lorg/apache/http/HttpHost;
    :cond_6b
    if-nez v4, :cond_7d

    .line 88
    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v5, v6}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v6

    if-nez v6, :cond_34

    .line 91
    new-instance v6, Lorg/apache/http/ProtocolException;

    const-string v7, "Target host missing"

    invoke-direct {v6, v7}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 95
    :cond_7d
    const-string v6, "Host"

    invoke-virtual {v4}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v6, v7}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_34
.end method
