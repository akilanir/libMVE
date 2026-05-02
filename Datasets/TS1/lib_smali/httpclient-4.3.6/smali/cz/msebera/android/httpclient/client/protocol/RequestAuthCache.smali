.class public Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;
.super Ljava/lang/Object;
.source "RequestAuthCache.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpRequestInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 64
    return-void
.end method

.method private doPreemptiveAuth(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/client/CredentialsProvider;)V
    .registers 11
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p3, "authState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p4, "credsProvider"    # Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .prologue
    .line 127
    invoke-interface {p2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "schemeName":Ljava/lang/String;
    iget-object v3, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 129
    iget-object v3, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Re-using cached \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' auth scheme for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 132
    :cond_2e
    new-instance v0, Lcz/msebera/android/httpclient/auth/AuthScope;

    sget-object v3, Lcz/msebera/android/httpclient/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    invoke-direct {v0, p1, v3, v2}, Lcz/msebera/android/httpclient/auth/AuthScope;-><init>(Lcz/msebera/android/httpclient/HttpHost;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .local v0, "authScope":Lcz/msebera/android/httpclient/auth/AuthScope;
    invoke-interface {p4, v0}, Lcz/msebera/android/httpclient/client/CredentialsProvider;->getCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;)Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v1

    .line 135
    .local v1, "creds":Lcz/msebera/android/httpclient/auth/Credentials;
    if-eqz v1, :cond_56

    .line 136
    const-string v3, "BASIC"

    invoke-interface {p2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_50

    .line 137
    sget-object v3, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->CHALLENGED:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p3, v3}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 141
    :goto_4c
    invoke-virtual {p3, p2, v1}, Lcz/msebera/android/httpclient/auth/AuthState;->update(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;)V

    .line 145
    :goto_4f
    return-void

    .line 139
    :cond_50
    sget-object v3, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->SUCCESS:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p3, v3}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    goto :goto_4c

    .line 143
    :cond_56
    iget-object v3, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v4, "No credentials for preemptive authentication"

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_4f
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 16
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    const-string v10, "HTTP request"

    invoke-static {p1, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v10, "HTTP context"

    invoke-static {p2, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    invoke-static {p2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v2

    .line 73
    .local v2, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getAuthCache()Lcz/msebera/android/httpclient/client/AuthCache;

    move-result-object v0

    .line 74
    .local v0, "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    if-nez v0, :cond_1c

    .line 75
    iget-object v10, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v11, "Auth cache not set in the context"

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 120
    :cond_1b
    :goto_1b
    return-void

    .line 79
    :cond_1c
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-result-object v3

    .line 80
    .local v3, "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    if-nez v3, :cond_2a

    .line 81
    iget-object v10, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v11, "Credentials provider not set in the context"

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 85
    :cond_2a
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getHttpRoute()Lcz/msebera/android/httpclient/conn/routing/RouteInfo;

    move-result-object v6

    .line 86
    .local v6, "route":Lcz/msebera/android/httpclient/conn/routing/RouteInfo;
    if-nez v6, :cond_38

    .line 87
    iget-object v10, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v11, "Route info not set in the context"

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 91
    :cond_38
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v7

    .line 92
    .local v7, "target":Lcz/msebera/android/httpclient/HttpHost;
    if-nez v7, :cond_46

    .line 93
    iget-object v10, p0, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v11, "Target host not set in the context"

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 97
    :cond_46
    invoke-virtual {v7}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v10

    if-gez v10, :cond_62

    .line 98
    new-instance v8, Lcz/msebera/android/httpclient/HttpHost;

    .line 99
    invoke-virtual {v7}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v10

    .line 100
    invoke-interface {v6}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v11

    invoke-virtual {v11}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v11

    .line 101
    invoke-virtual {v7}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v10, v11, v12}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v7    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .local v8, "target":Lcz/msebera/android/httpclient/HttpHost;
    move-object v7, v8

    .line 104
    .end local v8    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v7    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_62
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v9

    .line 105
    .local v9, "targetState":Lcz/msebera/android/httpclient/auth/AuthState;
    if-eqz v9, :cond_79

    invoke-virtual {v9}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v10

    sget-object v11, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->UNCHALLENGED:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    if-ne v10, v11, :cond_79

    .line 106
    invoke-interface {v0, v7}, Lcz/msebera/android/httpclient/client/AuthCache;->get(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v1

    .line 107
    .local v1, "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    if-eqz v1, :cond_79

    .line 108
    invoke-direct {p0, v7, v1, v9, v3}, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->doPreemptiveAuth(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/client/CredentialsProvider;)V

    .line 112
    .end local v1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    :cond_79
    invoke-interface {v6}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v4

    .line 113
    .local v4, "proxy":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getProxyAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v5

    .line 114
    .local v5, "proxyState":Lcz/msebera/android/httpclient/auth/AuthState;
    if-eqz v4, :cond_1b

    if-eqz v5, :cond_1b

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v10

    sget-object v11, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->UNCHALLENGED:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    if-ne v10, v11, :cond_1b

    .line 115
    invoke-interface {v0, v4}, Lcz/msebera/android/httpclient/client/AuthCache;->get(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v1

    .line 116
    .restart local v1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    if-eqz v1, :cond_1b

    .line 117
    invoke-direct {p0, v4, v1, v5, v3}, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;->doPreemptiveAuth(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/client/CredentialsProvider;)V

    goto :goto_1b
.end method
