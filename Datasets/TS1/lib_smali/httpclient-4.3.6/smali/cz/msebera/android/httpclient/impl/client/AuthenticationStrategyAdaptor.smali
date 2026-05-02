.class Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;
.super Ljava/lang/Object;
.source "AuthenticationStrategyAdaptor.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/AuthenticationStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/client/AuthenticationHandler;)V
    .registers 4
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 69
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    .line 70
    return-void
.end method

.method private isCachable(Lcz/msebera/android/httpclient/auth/AuthScheme;)Z
    .registers 5
    .param p1, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;

    .prologue
    const/4 v1, 0x0

    .line 160
    if-eqz p1, :cond_9

    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-nez v2, :cond_a

    .line 165
    :cond_9
    :goto_9
    return v1

    .line 163
    :cond_a
    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "schemeName":Ljava/lang/String;
    const-string v2, "Basic"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1e

    const-string v2, "Digest"

    .line 165
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_1e
    const/4 v1, 0x1

    goto :goto_9
.end method


# virtual methods
.method public authFailed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 8
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 148
    const-string v1, "http.auth.auth-cache"

    invoke-interface {p3, v1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/client/AuthCache;

    .line 149
    .local v0, "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    if-nez v0, :cond_b

    .line 157
    :goto_a
    return-void

    .line 152
    :cond_b
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 153
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Removing from cache \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' auth scheme for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 156
    :cond_39
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/client/AuthCache;->remove(Lcz/msebera/android/httpclient/HttpHost;)V

    goto :goto_a
.end method

.method public authSucceeded(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 8
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 132
    const-string v1, "http.auth.auth-cache"

    invoke-interface {p3, v1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/client/AuthCache;

    .line 133
    .local v0, "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->isCachable(Lcz/msebera/android/httpclient/auth/AuthScheme;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 134
    if-nez v0, :cond_1a

    .line 135
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;

    .end local v0    # "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;-><init>()V

    .line 136
    .restart local v0    # "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    const-string v1, "http.auth.auth-cache"

    invoke-interface {p3, v1, v0}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    :cond_1a
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 139
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caching \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' auth scheme for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 142
    :cond_48
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/client/AuthCache;->put(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;)V

    .line 144
    :cond_4b
    return-void
.end method

.method public getChallenges(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Map;
    .registers 5
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            "Lcz/msebera/android/httpclient/protocol/HttpContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcz/msebera/android/httpclient/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    invoke-interface {v0, p2, p3}, Lcz/msebera/android/httpclient/client/AuthenticationHandler;->getChallenges(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    return-object v0
.end method

.method public isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 5
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 76
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    invoke-interface {v0, p2, p3}, Lcz/msebera/android/httpclient/client/AuthenticationHandler;->isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v0

    return v0
.end method

.method public select(Ljava/util/Map;Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Queue;
    .registers 19
    .param p2, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p3, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p4, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcz/msebera/android/httpclient/Header;",
            ">;",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            "Lcz/msebera/android/httpclient/protocol/HttpContext;",
            ")",
            "Ljava/util/Queue",
            "<",
            "Lcz/msebera/android/httpclient/auth/AuthOption;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    const-string v10, "Map of auth challenges"

    invoke-static {p1, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 92
    const-string v10, "Host"

    move-object/from16 v0, p2

    invoke-static {v0, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    const-string v10, "HTTP response"

    move-object/from16 v0, p3

    invoke-static {v0, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 94
    const-string v10, "HTTP context"

    move-object/from16 v0, p4

    invoke-static {v0, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 96
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    .line 97
    .local v9, "options":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    const-string v10, "http.auth.credentials-provider"

    move-object/from16 v0, p4

    invoke-interface {v0, v10}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .line 99
    .local v6, "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    if-nez v6, :cond_33

    .line 100
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v11, "Credentials provider not set in the context"

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 127
    :cond_32
    :goto_32
    return-object v9

    .line 106
    :cond_33
    :try_start_33
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->handler:Lcz/msebera/android/httpclient/client/AuthenticationHandler;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-interface {v10, p1, v0, v1}, Lcz/msebera/android/httpclient/client/AuthenticationHandler;->selectScheme(Ljava/util/Map;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/auth/AuthScheme;
    :try_end_3c
    .catch Lcz/msebera/android/httpclient/auth/AuthenticationException; {:try_start_33 .. :try_end_3c} :catch_74

    move-result-object v2

    .line 113
    .local v2, "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    .line 114
    .local v8, "id":Ljava/lang/String;
    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v8, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcz/msebera/android/httpclient/Header;

    .line 115
    .local v4, "challenge":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v2, v4}, Lcz/msebera/android/httpclient/auth/AuthScheme;->processChallenge(Lcz/msebera/android/httpclient/Header;)V

    .line 117
    new-instance v3, Lcz/msebera/android/httpclient/auth/AuthScope;

    .line 118
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v10

    .line 119
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v11

    .line 120
    invoke-interface {v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getRealm()Ljava/lang/String;

    move-result-object v12

    .line 121
    invoke-interface {v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v3, v10, v11, v12, v13}, Lcz/msebera/android/httpclient/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 123
    .local v3, "authScope":Lcz/msebera/android/httpclient/auth/AuthScope;
    invoke-interface {v6, v3}, Lcz/msebera/android/httpclient/client/CredentialsProvider;->getCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;)Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v5

    .line 124
    .local v5, "credentials":Lcz/msebera/android/httpclient/auth/Credentials;
    if-eqz v5, :cond_32

    .line 125
    new-instance v10, Lcz/msebera/android/httpclient/auth/AuthOption;

    invoke-direct {v10, v2, v5}, Lcz/msebera/android/httpclient/auth/AuthOption;-><init>(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;)V

    invoke-interface {v9, v10}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 107
    .end local v2    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    .end local v3    # "authScope":Lcz/msebera/android/httpclient/auth/AuthScope;
    .end local v4    # "challenge":Lcz/msebera/android/httpclient/Header;
    .end local v5    # "credentials":Lcz/msebera/android/httpclient/auth/Credentials;
    .end local v8    # "id":Ljava/lang/String;
    :catch_74
    move-exception v7

    .line 108
    .local v7, "ex":Lcz/msebera/android/httpclient/auth/AuthenticationException;
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v10}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v10

    if-eqz v10, :cond_32

    .line 109
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/auth/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_32
.end method
