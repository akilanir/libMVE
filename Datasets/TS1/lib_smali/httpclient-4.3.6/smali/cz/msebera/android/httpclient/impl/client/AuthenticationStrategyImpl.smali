.class abstract Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;
.super Ljava/lang/Object;
.source "AuthenticationStrategyImpl.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/AuthenticationStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_SCHEME_PRIORITY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final challengeCode:I

.field private final headerName:Ljava/lang/String;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 70
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "negotiate"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Kerberos"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "NTLM"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Digest"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Basic"

    aput-object v2, v0, v1

    .line 71
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->DEFAULT_SCHEME_PRIORITY:Ljava/util/List;

    .line 70
    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "challengeCode"    # I
    .param p2, "headerName"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 82
    iput p1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->challengeCode:I

    .line 83
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->headerName:Ljava/lang/String;

    .line 84
    return-void
.end method


# virtual methods
.method public authFailed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 9
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 231
    const-string v2, "Host"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 232
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 234
    invoke-static {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v1

    .line 236
    .local v1, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getAuthCache()Lcz/msebera/android/httpclient/client/AuthCache;

    move-result-object v0

    .line 237
    .local v0, "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    if-eqz v0, :cond_37

    .line 238
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 239
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clearing cached auth scheme for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 241
    :cond_34
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/client/AuthCache;->remove(Lcz/msebera/android/httpclient/HttpHost;)V

    .line 243
    :cond_37
    return-void
.end method

.method public authSucceeded(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 9
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 200
    const-string v2, "Host"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 201
    const-string v2, "Auth scheme"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 202
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 204
    invoke-static {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v1

    .line 206
    .local v1, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->isCachable(Lcz/msebera/android/httpclient/auth/AuthScheme;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 207
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getAuthCache()Lcz/msebera/android/httpclient/client/AuthCache;

    move-result-object v0

    .line 208
    .local v0, "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    if-nez v0, :cond_27

    .line 209
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;

    .end local v0    # "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;-><init>()V

    .line 210
    .restart local v0    # "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    invoke-virtual {v1, v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAuthCache(Lcz/msebera/android/httpclient/client/AuthCache;)V

    .line 212
    :cond_27
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_55

    .line 213
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caching \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p2}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' auth scheme for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 216
    :cond_55
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/client/AuthCache;->put(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;)V

    .line 218
    .end local v0    # "authCache":Lcz/msebera/android/httpclient/client/AuthCache;
    :cond_58
    return-void
.end method

.method public getChallenges(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Map;
    .registers 15
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
    .line 99
    const-string v8, "HTTP response"

    invoke-static {p2, v8}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 100
    iget-object v8, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->headerName:Ljava/lang/String;

    invoke-interface {p2, v8}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v4

    .line 101
    .local v4, "headers":[Lcz/msebera/android/httpclient/Header;
    new-instance v5, Ljava/util/HashMap;

    array-length v8, v4

    invoke-direct {v5, v8}, Ljava/util/HashMap;-><init>(I)V

    .line 102
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    array-length v10, v4

    const/4 v8, 0x0

    move v9, v8

    :goto_14
    if-ge v9, v10, :cond_7f

    aget-object v3, v4, v9

    .line 105
    .local v3, "header":Lcz/msebera/android/httpclient/Header;
    instance-of v8, v3, Lcz/msebera/android/httpclient/FormattedHeader;

    if-eqz v8, :cond_3d

    move-object v8, v3

    .line 106
    check-cast v8, Lcz/msebera/android/httpclient/FormattedHeader;

    invoke-interface {v8}, Lcz/msebera/android/httpclient/FormattedHeader;->getBuffer()Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v1

    .local v1, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    move-object v8, v3

    .line 107
    check-cast v8, Lcz/msebera/android/httpclient/FormattedHeader;

    invoke-interface {v8}, Lcz/msebera/android/httpclient/FormattedHeader;->getValuePos()I

    move-result v6

    .line 117
    .local v6, "pos":I
    :goto_2a
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    if-ge v6, v8, :cond_59

    invoke-virtual {v1, v6}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    invoke-static {v8}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v8

    if-eqz v8, :cond_59

    .line 118
    add-int/lit8 v6, v6, 0x1

    goto :goto_2a

    .line 109
    .end local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v6    # "pos":I
    :cond_3d
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    .line 110
    .local v7, "s":Ljava/lang/String;
    if-nez v7, :cond_4b

    .line 111
    new-instance v8, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;

    const-string v9, "Header value is null"

    invoke-direct {v8, v9}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 113
    :cond_4b
    new-instance v1, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-direct {v1, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 114
    .restart local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v1, v7}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 115
    const/4 v6, 0x0

    .restart local v6    # "pos":I
    goto :goto_2a

    .line 120
    .end local v7    # "s":Ljava/lang/String;
    :cond_59
    move v0, v6

    .line 121
    .local v0, "beginIndex":I
    :goto_5a
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    if-ge v6, v8, :cond_6d

    invoke-virtual {v1, v6}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    invoke-static {v8}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v8

    if-nez v8, :cond_6d

    .line 122
    add-int/lit8 v6, v6, 0x1

    goto :goto_5a

    .line 124
    :cond_6d
    move v2, v6

    .line 125
    .local v2, "endIndex":I
    invoke-virtual {v1, v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 126
    .restart local v7    # "s":Ljava/lang/String;
    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_14

    .line 128
    .end local v0    # "beginIndex":I
    .end local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v2    # "endIndex":I
    .end local v3    # "header":Lcz/msebera/android/httpclient/Header;
    .end local v6    # "pos":I
    .end local v7    # "s":Ljava/lang/String;
    :cond_7f
    return-object v5
.end method

.method abstract getPreferredAuthSchemes(Lcz/msebera/android/httpclient/client/config/RequestConfig;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/client/config/RequestConfig;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 6
    .param p1, "authhost"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 90
    const-string v1, "HTTP response"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    .line 92
    .local v0, "status":I
    iget v1, p0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->challengeCode:I

    if-ne v0, v1, :cond_13

    const/4 v1, 0x1

    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method protected isCachable(Lcz/msebera/android/httpclient/auth/AuthScheme;)Z
    .registers 5
    .param p1, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;

    .prologue
    const/4 v1, 0x0

    .line 221
    if-eqz p1, :cond_9

    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-nez v2, :cond_a

    .line 226
    :cond_9
    :goto_9
    return v1

    .line 224
    :cond_a
    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 225
    .local v0, "schemeName":Ljava/lang/String;
    const-string v2, "Basic"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1e

    const-string v2, "Digest"

    .line 226
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_1e
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public select(Ljava/util/Map;Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/util/Queue;
    .registers 26
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
    .line 138
    .local p1, "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/Header;>;"
    const-string v16, "Map of auth challenges"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    const-string v16, "Host"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    const-string v16, "HTTP response"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const-string v16, "HTTP context"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 142
    invoke-static/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v9

    .line 144
    .local v9, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    .line 145
    .local v14, "options":Ljava/util/Queue;, "Ljava/util/Queue<Lcz/msebera/android/httpclient/auth/AuthOption;>;"
    invoke-virtual {v9}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getAuthSchemeRegistry()Lcz/msebera/android/httpclient/config/Lookup;

    move-result-object v15

    .line 146
    .local v15, "registry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;>;"
    if-nez v15, :cond_3f

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v16, v0

    const-string v17, "Auth scheme registry not set in the context"

    invoke-virtual/range {v16 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 195
    :cond_3e
    :goto_3e
    return-object v14

    .line 150
    :cond_3f
    invoke-virtual {v9}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-result-object v12

    .line 151
    .local v12, "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    if-nez v12, :cond_51

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v16, v0

    const-string v17, "Credentials provider not set in the context"

    invoke-virtual/range {v16 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_3e

    .line 155
    :cond_51
    invoke-virtual {v9}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v10

    .line 156
    .local v10, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->getPreferredAuthSchemes(Lcz/msebera/android/httpclient/client/config/RequestConfig;)Ljava/util/Collection;

    move-result-object v4

    .line 157
    .local v4, "authPrefs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-nez v4, :cond_5f

    .line 158
    sget-object v4, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->DEFAULT_SCHEME_PRIORITY:Ljava/util/List;

    .line 160
    :cond_5f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_89

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Authentication schemes in the order of preference: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 164
    :cond_89
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_8d
    :goto_8d
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3e

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 165
    .local v13, "id":Ljava/lang/String;
    sget-object v17, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcz/msebera/android/httpclient/Header;

    .line 166
    .local v8, "challenge":Lcz/msebera/android/httpclient/Header;
    if-eqz v8, :cond_120

    .line 167
    invoke-interface {v15, v13}, Lcz/msebera/android/httpclient/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;

    .line 168
    .local v6, "authSchemeProvider":Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;
    if-nez v6, :cond_e6

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v17

    if-eqz v17, :cond_8d

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Authentication scheme "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " not supported"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V

    goto :goto_8d

    .line 175
    :cond_e6
    move-object/from16 v0, p4

    invoke-interface {v6, v0}, Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;->create(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v5

    .line 176
    .local v5, "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    invoke-interface {v5, v8}, Lcz/msebera/android/httpclient/auth/AuthScheme;->processChallenge(Lcz/msebera/android/httpclient/Header;)V

    .line 178
    new-instance v7, Lcz/msebera/android/httpclient/auth/AuthScope;

    .line 179
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v17

    .line 180
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v18

    .line 181
    invoke-interface {v5}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getRealm()Ljava/lang/String;

    move-result-object v19

    .line 182
    invoke-interface {v5}, Lcz/msebera/android/httpclient/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-direct {v7, v0, v1, v2, v3}, Lcz/msebera/android/httpclient/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 184
    .local v7, "authScope":Lcz/msebera/android/httpclient/auth/AuthScope;
    invoke-interface {v12, v7}, Lcz/msebera/android/httpclient/client/CredentialsProvider;->getCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;)Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v11

    .line 185
    .local v11, "credentials":Lcz/msebera/android/httpclient/auth/Credentials;
    if-eqz v11, :cond_8d

    .line 186
    new-instance v17, Lcz/msebera/android/httpclient/auth/AuthOption;

    move-object/from16 v0, v17

    invoke-direct {v0, v5, v11}, Lcz/msebera/android/httpclient/auth/AuthOption;-><init>(Lcz/msebera/android/httpclient/auth/AuthScheme;Lcz/msebera/android/httpclient/auth/Credentials;)V

    move-object/from16 v0, v17

    invoke-interface {v14, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8d

    .line 189
    .end local v5    # "authScheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    .end local v6    # "authSchemeProvider":Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;
    .end local v7    # "authScope":Lcz/msebera/android/httpclient/auth/AuthScope;
    .end local v11    # "credentials":Lcz/msebera/android/httpclient/auth/Credentials;
    :cond_120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_8d

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyImpl;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Challenge for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " authentication scheme not available"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto/16 :goto_8d
.end method
