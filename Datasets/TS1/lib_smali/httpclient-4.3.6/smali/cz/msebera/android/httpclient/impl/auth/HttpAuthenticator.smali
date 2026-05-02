.class public Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;
.super Ljava/lang/Object;
.source "HttpAuthenticator.java"


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;-><init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;)V
    .registers 3
    .param p1, "log"    # Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    if-eqz p1, :cond_8

    .end local p1    # "log":Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;
    :goto_5
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 64
    return-void

    .line 63
    .restart local p1    # "log":Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;
    :cond_8
    new-instance p1, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .end local p1    # "log":Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p1, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    goto :goto_5
.end method

.method private doAuth(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;
    .registers 6
    .param p1, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p2, "creds"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p3, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p4, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 238
    instance-of v0, p1, Lcz/msebera/android/httpclient/auth/ContextAwareAuthScheme;

    if-eqz v0, :cond_b

    .line 239
    check-cast p1, Lcz/msebera/android/httpclient/auth/ContextAwareAuthScheme;

    .end local p1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    invoke-interface {p1, p2, p3, p4}, Lcz/msebera/android/httpclient/auth/ContextAwareAuthScheme;->authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 241
    :goto_a
    return-object v0

    .restart local p1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    :cond_b
    invoke-interface {p1, p2, p3}, Lcz/msebera/android/httpclient/auth/AuthScheme;->authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    goto :goto_a
.end method

.method private ensureAuthScheme(Lcz/msebera/android/httpclient/auth/AuthScheme;)V
    .registers 3
    .param p1, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;

    .prologue
    .line 229
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 230
    return-void
.end method


# virtual methods
.method public generateAuthResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 13
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "authState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v2

    .line 179
    .local v2, "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/auth/AuthState;->getCredentials()Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v3

    .line 180
    .local v3, "creds":Lcz/msebera/android/httpclient/auth/Credentials;
    sget-object v6, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator$1;->$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState:[I

    invoke-virtual {p2}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_d4

    .line 216
    :cond_17
    :goto_17
    :pswitch_17
    if-eqz v2, :cond_20

    .line 218
    :try_start_19
    invoke-direct {p0, v2, v3, p1, p3}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->doAuth(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    .line 219
    .local v5, "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Lcz/msebera/android/httpclient/Header;)V
    :try_end_20
    .catch Lcz/msebera/android/httpclient/auth/AuthenticationException; {:try_start_19 .. :try_end_20} :catch_a9

    .line 226
    .end local v5    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_20
    :goto_20
    :pswitch_20
    return-void

    .line 184
    :pswitch_21
    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->ensureAuthScheme(Lcz/msebera/android/httpclient/auth/AuthScheme;)V

    .line 185
    invoke-interface {v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isConnectionBased()Z

    move-result v6

    if-eqz v6, :cond_17

    goto :goto_20

    .line 190
    :pswitch_2b
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthOptions()Ljava/util/Queue;

    move-result-object v1

    .line 191
    .local v1, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    if-eqz v1, :cond_a4

    .line 192
    :cond_31
    :goto_31
    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_20

    .line 193
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/auth/AuthOption;

    .line 194
    .local v0, "authOption":Lcz/msebera/android/httpclient/auth/AuthOption;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/auth/AuthOption;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v2

    .line 195
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/auth/AuthOption;->getCredentials()Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v3

    .line 196
    invoke-virtual {p2, v2, v3}, Lcz/msebera/android/httpclient/auth/AuthState;->update(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;)V

    .line 197
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_72

    .line 198
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Generating response to an authentication challenge using "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 199
    invoke-interface {v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " scheme"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 198
    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 202
    :cond_72
    :try_start_72
    invoke-direct {p0, v2, v3, p1, p3}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->doAuth(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    .line 203
    .restart local v5    # "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Lcz/msebera/android/httpclient/Header;)V
    :try_end_79
    .catch Lcz/msebera/android/httpclient/auth/AuthenticationException; {:try_start_72 .. :try_end_79} :catch_7a

    goto :goto_20

    .line 205
    .end local v5    # "header":Lcz/msebera/android/httpclient/Header;
    :catch_7a
    move-exception v4

    .line 206
    .local v4, "ex":Lcz/msebera/android/httpclient/auth/AuthenticationException;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_31

    .line 207
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " authentication error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V

    goto :goto_31

    .line 213
    .end local v0    # "authOption":Lcz/msebera/android/httpclient/auth/AuthOption;
    .end local v4    # "ex":Lcz/msebera/android/httpclient/auth/AuthenticationException;
    :cond_a4
    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->ensureAuthScheme(Lcz/msebera/android/httpclient/auth/AuthScheme;)V

    goto/16 :goto_17

    .line 220
    .end local v1    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    :catch_a9
    move-exception v4

    .line 221
    .restart local v4    # "ex":Lcz/msebera/android/httpclient/auth/AuthenticationException;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isErrorEnabled()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 222
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " authentication error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->error(Ljava/lang/Object;)V

    goto/16 :goto_20

    .line 180
    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_17
        :pswitch_21
        :pswitch_20
    .end packed-switch
.end method

.method public handleAuthChallenge(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 15
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "authStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p4, "authState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p5, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 106
    :try_start_0
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 107
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " requested authentication"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 109
    :cond_24
    invoke-interface {p3, p1, p2, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->getChallenges(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Map;

    move-result-object v3

    .line 110
    .local v3, "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_37

    .line 111
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Response contains no authentication challenges"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 112
    const/4 v6, 0x0

    .line 170
    .end local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    :goto_36
    return v6

    .line 115
    .restart local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    :cond_37
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v1

    .line 116
    .local v1, "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    sget-object v6, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator$1;->$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState:[I

    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_116

    .line 154
    :cond_4a
    :goto_4a
    invoke-interface {p3, v3, p1, p2, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->select(Ljava/util/Map;Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Queue;

    move-result-object v0

    .line 155
    .local v0, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    if-eqz v0, :cond_112

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_112

    .line 156
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_76

    .line 157
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Selected authentication options: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 159
    :cond_76
    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->CHALLENGED:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 160
    invoke-virtual {p4, v0}, Lcz/msebera/android/httpclient/auth/AuthState;->update(Ljava/util/Queue;)V

    .line 161
    const/4 v6, 0x1

    goto :goto_36

    .line 118
    .end local v0    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    :pswitch_80
    const/4 v6, 0x0

    goto :goto_36

    .line 120
    :pswitch_82
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V
    :try_end_85
    .catch Lcz/msebera/android/httpclient/auth/MalformedChallengeException; {:try_start_0 .. :try_end_85} :catch_86

    goto :goto_4a

    .line 165
    .end local v1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    .end local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    :catch_86
    move-exception v4

    .line 166
    .local v4, "ex":Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_ab

    .line 167
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Malformed challenge: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V

    .line 169
    :cond_ab
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V

    .line 170
    const/4 v6, 0x0

    goto :goto_36

    .line 124
    .end local v4    # "ex":Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
    .restart local v1    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    .restart local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    :pswitch_b0
    if-nez v1, :cond_c8

    .line 125
    :try_start_b2
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Auth scheme is null"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 126
    const/4 v6, 0x0

    invoke-interface {p3, p1, v6, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->authFailed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 127
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V

    .line 128
    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->FAILURE:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 129
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 132
    :cond_c8
    :pswitch_c8
    if-eqz v1, :cond_4a

    .line 133
    invoke-interface {v1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v5

    .line 134
    .local v5, "id":Ljava/lang/String;
    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/Header;

    .line 135
    .local v2, "challenge":Lcz/msebera/android/httpclient/Header;
    if-eqz v2, :cond_10d

    .line 136
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Authorization challenge processed"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 137
    invoke-interface {v1, v2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->processChallenge(Lcz/msebera/android/httpclient/Header;)V

    .line 138
    invoke-interface {v1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isComplete()Z

    move-result v6

    if-eqz v6, :cond_105

    .line 139
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Authentication failed"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 140
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v6

    invoke-interface {p3, p1, v6, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->authFailed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 141
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V

    .line 142
    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->FAILURE:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 143
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 145
    :cond_105
    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->HANDSHAKE:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 146
    const/4 v6, 0x1

    goto/16 :goto_36

    .line 149
    :cond_10d
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V
    :try_end_110
    .catch Lcz/msebera/android/httpclient/auth/MalformedChallengeException; {:try_start_b2 .. :try_end_110} :catch_86

    goto/16 :goto_4a

    .line 163
    .end local v2    # "challenge":Lcz/msebera/android/httpclient/Header;
    .end local v5    # "id":Ljava/lang/String;
    .restart local v0    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    :cond_112
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 116
    nop

    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_b0
        :pswitch_b0
        :pswitch_82
        :pswitch_80
        :pswitch_c8
    .end packed-switch
.end method

.method public isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 8
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "authStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p4, "authState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p5, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 76
    invoke-interface {p3, p1, p2, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 77
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Authentication required"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v0

    sget-object v1, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->SUCCESS:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    if-ne v0, v1, :cond_1c

    .line 79
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v0

    invoke-interface {p3, p1, v0, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->authFailed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 81
    :cond_1c
    const/4 v0, 0x1

    .line 95
    :goto_1d
    return v0

    .line 83
    :cond_1e
    sget-object v0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator$1;->$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState:[I

    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v1

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_48

    .line 93
    sget-object v0, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->UNCHALLENGED:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v0}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 95
    :goto_32
    :pswitch_32
    const/4 v0, 0x0

    goto :goto_1d

    .line 86
    :pswitch_34
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Authentication succeeded"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 87
    sget-object v0, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->SUCCESS:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    invoke-virtual {p4, v0}, Lcz/msebera/android/httpclient/auth/AuthState;->setState(Lcz/msebera/android/httpclient/auth/AuthProtocolState;)V

    .line 88
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v0

    invoke-interface {p3, p1, v0, p5}, Lcz/msebera/android/httpclient/client/AuthenticationStrategy;->authSucceeded(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    goto :goto_32

    .line 83
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_34
        :pswitch_34
        :pswitch_32
    .end packed-switch
.end method
