.class public Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;
.super Ljava/lang/Object;
.source "DefaultRoutePlanner.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/conn/SchemePortResolver;)V
    .registers 2
    .param p1, "schemePortResolver"    # Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    if-eqz p1, :cond_8

    .end local p1    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :goto_5
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .line 61
    return-void

    .line 59
    .restart local p1    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :cond_8
    sget-object p1, Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;

    goto :goto_5
.end method


# virtual methods
.method protected determineProxy(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpHost;
    .registers 5
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public determineRoute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .registers 14
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v7, "Request"

    invoke-static {p2, v7}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    if-nez p1, :cond_f

    .line 69
    new-instance v7, Lcz/msebera/android/httpclient/ProtocolException;

    const-string v8, "Target host is not specified"

    invoke-direct {v7, v8}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 71
    :cond_f
    invoke-static {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 72
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v1

    .line 73
    .local v1, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 74
    .local v3, "local":Ljava/net/InetAddress;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getProxy()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v4

    .line 75
    .local v4, "proxy":Lcz/msebera/android/httpclient/HttpHost;
    if-nez v4, :cond_25

    .line 76
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;->determineProxy(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v4

    .line 80
    :cond_25
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v7

    if-gtz v7, :cond_5b

    .line 82
    :try_start_2b
    new-instance v6, Lcz/msebera/android/httpclient/HttpHost;

    .line 83
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .line 84
    invoke-interface {v8, p1}, Lcz/msebera/android/httpclient/conn/SchemePortResolver;->resolve(Lcz/msebera/android/httpclient/HttpHost;)I

    move-result v8

    .line 85
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v7, v8, v9}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_3e
    .catch Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException; {:try_start_2b .. :try_end_3e} :catch_50

    .line 92
    .local v6, "target":Lcz/msebera/android/httpclient/HttpHost;
    :goto_3e
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "https"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    .line 93
    .local v5, "secure":Z
    if-nez v4, :cond_5d

    .line 94
    new-instance v7, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    invoke-direct {v7, v6, v3, v5}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;-><init>(Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetAddress;Z)V

    .line 96
    :goto_4f
    return-object v7

    .line 86
    .end local v5    # "secure":Z
    .end local v6    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :catch_50
    move-exception v2

    .line 87
    .local v2, "ex":Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;
    new-instance v7, Lcz/msebera/android/httpclient/HttpException;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcz/msebera/android/httpclient/HttpException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 90
    .end local v2    # "ex":Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;
    :cond_5b
    move-object v6, p1

    .restart local v6    # "target":Lcz/msebera/android/httpclient/HttpHost;
    goto :goto_3e

    .line 96
    .restart local v5    # "secure":Z
    :cond_5d
    new-instance v7, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    invoke-direct {v7, v6, v3, v4, v5}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;-><init>(Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetAddress;Lcz/msebera/android/httpclient/HttpHost;Z)V

    goto :goto_4f
.end method
