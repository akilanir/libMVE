.class public Linfo/guardianproject/netcipher/client/MyDefaultClientConnectionOperator;
.super Lch/boye/httpclientandroidlib/impl/conn/DefaultClientConnectionOperator;
.source "MyDefaultClientConnectionOperator.java"


# direct methods
.method public constructor <init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V
    .registers 2
    .param p1, "schemes"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lch/boye/httpclientandroidlib/impl/conn/DefaultClientConnectionOperator;-><init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    .line 25
    return-void
.end method


# virtual methods
.method public openConnection(Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;Lch/boye/httpclientandroidlib/HttpHost;Ljava/net/InetAddress;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V
    .registers 16
    .param p1, "conn"    # Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;
    .param p2, "target"    # Lch/boye/httpclientandroidlib/HttpHost;
    .param p3, "local"    # Ljava/net/InetAddress;
    .param p4, "context"    # Lch/boye/httpclientandroidlib/protocol/HttpContext;
    .param p5, "params"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    if-nez p1, :cond_a

    .line 32
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Connection must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 34
    :cond_a
    if-nez p2, :cond_14

    .line 35
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Target host must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 39
    :cond_14
    if-nez p5, :cond_1e

    .line 40
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Parameters must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 42
    :cond_1e
    invoke-interface {p1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 43
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Connection must not be open."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 46
    :cond_2c
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/MyDefaultClientConnectionOperator;->schemeRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-virtual {p2}, Lch/boye/httpclientandroidlib/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    move-result-object v9

    .line 47
    .local v9, "schm":Lch/boye/httpclientandroidlib/conn/scheme/Scheme;
    invoke-virtual {v9}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;->getSocketFactory()Lch/boye/httpclientandroidlib/conn/scheme/SocketFactory;

    move-result-object v0

    .line 49
    .local v0, "sf":Lch/boye/httpclientandroidlib/conn/scheme/SocketFactory;
    invoke-interface {v0}, Lch/boye/httpclientandroidlib/conn/scheme/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v1

    .line 50
    .local v1, "sock":Ljava/net/Socket;
    invoke-interface {p1, v1, p2}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lch/boye/httpclientandroidlib/HttpHost;)V

    .line 53
    :try_start_41
    invoke-virtual {p2}, Lch/boye/httpclientandroidlib/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lch/boye/httpclientandroidlib/HttpHost;->getPort()I

    move-result v3

    invoke-virtual {v9, v3}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;->resolvePort(I)I

    move-result v3

    const/4 v5, 0x0

    move-object v4, p3

    move-object v6, p5

    invoke-interface/range {v0 .. v6}, Lch/boye/httpclientandroidlib/conn/scheme/SocketFactory;->connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILch/boye/httpclientandroidlib/params/HttpParams;)Ljava/net/Socket;

    move-result-object v7

    .line 57
    .local v7, "connsock":Ljava/net/Socket;
    if-eq v1, v7, :cond_5a

    .line 58
    move-object v1, v7

    .line 59
    invoke-interface {p1, v1, p2}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lch/boye/httpclientandroidlib/HttpHost;)V
    :try_end_5a
    .catch Ljava/net/ConnectException; {:try_start_41 .. :try_end_5a} :catch_65

    .line 64
    :cond_5a
    invoke-virtual {p0, v1, p4, p5}, Linfo/guardianproject/netcipher/client/MyDefaultClientConnectionOperator;->prepareSocket(Ljava/net/Socket;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V

    .line 65
    invoke-interface {v0, v1}, Lch/boye/httpclientandroidlib/conn/scheme/SocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v2

    invoke-interface {p1, v2, p5}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->openCompleted(ZLch/boye/httpclientandroidlib/params/HttpParams;)V

    .line 66
    return-void

    .line 61
    .end local v7    # "connsock":Ljava/net/Socket;
    :catch_65
    move-exception v8

    .line 62
    .local v8, "ex":Ljava/net/ConnectException;
    new-instance v2, Lch/boye/httpclientandroidlib/conn/HttpHostConnectException;

    invoke-direct {v2, p2, v8}, Lch/boye/httpclientandroidlib/conn/HttpHostConnectException;-><init>(Lch/boye/httpclientandroidlib/HttpHost;Ljava/net/ConnectException;)V

    throw v2
.end method
