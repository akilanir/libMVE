.class public Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;
.super Ljava/lang/Object;
.source "DefaultRedirectStrategy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/RedirectStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;

.field public static final REDIRECT_LOCATIONS:Ljava/lang/String; = "http.protocol.redirect-locations"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final REDIRECT_METHODS:[Ljava/lang/String;


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 83
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;

    .line 88
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "GET"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "HEAD"

    aput-object v2, v0, v1

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 95
    return-void
.end method


# virtual methods
.method protected createLocationURI(Ljava/lang/String;)Ljava/net/URI;
    .registers 9
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 186
    :try_start_0
    new-instance v0, Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v4

    invoke-direct {v0, v4}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 187
    .local v0, "b":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "host":Ljava/lang/String;
    if-eqz v2, :cond_1d

    .line 189
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 191
    :cond_1d
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "path":Ljava/lang/String;
    invoke-static {v3}, Lcz/msebera/android/httpclient/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 193
    const-string v4, "/"

    invoke-virtual {v0, v4}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 195
    :cond_2c
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->build()Ljava/net/URI;
    :try_end_2f
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_2f} :catch_31

    move-result-object v4

    return-object v4

    .line 196
    .end local v0    # "b":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    .end local v2    # "host":Ljava/lang/String;
    .end local v3    # "path":Ljava/lang/String;
    :catch_31
    move-exception v1

    .line 197
    .local v1, "ex":Ljava/net/URISyntaxException;
    new-instance v4, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid redirect URI: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getLocationURI(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/URI;
    .registers 18
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 124
    const-string v11, "HTTP request"

    invoke-static {p1, v11}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    const-string v11, "HTTP response"

    move-object/from16 v0, p2

    invoke-static {v0, v11}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    const-string v11, "HTTP context"

    move-object/from16 v0, p3

    invoke-static {v0, v11}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 128
    invoke-static/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v2

    .line 131
    .local v2, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    const-string v11, "location"

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v6

    .line 132
    .local v6, "locationHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v6, :cond_44

    .line 134
    new-instance v11, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received redirect response "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 135
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " but no location header"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 138
    :cond_44
    invoke-interface {v6}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 139
    .local v5, "location":Ljava/lang/String;
    iget-object v11, p0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v11}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v11

    if-eqz v11, :cond_6e

    .line 140
    iget-object v11, p0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Redirect requested to location \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 143
    :cond_6e
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v3

    .line 145
    .local v3, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    invoke-virtual {p0, v5}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->createLocationURI(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v10

    .line 150
    .local v10, "uri":Ljava/net/URI;
    :try_start_76
    invoke-virtual {v10}, Ljava/net/URI;->isAbsolute()Z

    move-result v11

    if-nez v11, :cond_cb

    .line 151
    invoke-virtual {v3}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->isRelativeRedirectsAllowed()Z

    move-result v11

    if-nez v11, :cond_ac

    .line 152
    new-instance v11, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Relative redirect location \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\' not allowed"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_a1
    .catch Ljava/net/URISyntaxException; {:try_start_76 .. :try_end_a1} :catch_a1

    .line 162
    :catch_a1
    move-exception v4

    .line 163
    .local v4, "ex":Ljava/net/URISyntaxException;
    new-instance v11, Lcz/msebera/android/httpclient/ProtocolException;

    invoke-virtual {v4}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12, v4}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 156
    .end local v4    # "ex":Ljava/net/URISyntaxException;
    :cond_ac
    :try_start_ac
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v9

    .line 157
    .local v9, "target":Lcz/msebera/android/httpclient/HttpHost;
    const-string v11, "Target host"

    invoke-static {v9, v11}, Lcz/msebera/android/httpclient/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    new-instance v8, Ljava/net/URI;

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v11

    invoke-interface {v11}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 159
    .local v8, "requestURI":Ljava/net/URI;
    const/4 v11, 0x0

    invoke-static {v8, v9, v11}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    .line 160
    .local v1, "absoluteRequestURI":Ljava/net/URI;
    invoke-static {v1, v10}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    :try_end_ca
    .catch Ljava/net/URISyntaxException; {:try_start_ac .. :try_end_ca} :catch_a1

    move-result-object v10

    .line 166
    .end local v1    # "absoluteRequestURI":Ljava/net/URI;
    .end local v8    # "requestURI":Ljava/net/URI;
    .end local v9    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_cb
    const-string v11, "http.protocol.redirect-locations"

    invoke-virtual {v2, v11}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcz/msebera/android/httpclient/impl/client/RedirectLocations;

    .line 168
    .local v7, "redirectLocations":Lcz/msebera/android/httpclient/impl/client/RedirectLocations;
    if-nez v7, :cond_e1

    .line 169
    new-instance v7, Lcz/msebera/android/httpclient/impl/client/RedirectLocations;

    .end local v7    # "redirectLocations":Lcz/msebera/android/httpclient/impl/client/RedirectLocations;
    invoke-direct {v7}, Lcz/msebera/android/httpclient/impl/client/RedirectLocations;-><init>()V

    .line 170
    .restart local v7    # "redirectLocations":Lcz/msebera/android/httpclient/impl/client/RedirectLocations;
    const-string v11, "http.protocol.redirect-locations"

    move-object/from16 v0, p3

    invoke-interface {v0, v11, v7}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 172
    :cond_e1
    invoke-virtual {v3}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->isCircularRedirectsAllowed()Z

    move-result v11

    if-nez v11, :cond_10c

    .line 173
    invoke-virtual {v7, v10}, Lcz/msebera/android/httpclient/impl/client/RedirectLocations;->contains(Ljava/net/URI;)Z

    move-result v11

    if-eqz v11, :cond_10c

    .line 174
    new-instance v11, Lcz/msebera/android/httpclient/client/CircularRedirectException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Circular redirect to \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcz/msebera/android/httpclient/client/CircularRedirectException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 177
    :cond_10c
    invoke-virtual {v7, v10}, Lcz/msebera/android/httpclient/impl/client/RedirectLocations;->add(Ljava/net/URI;)V

    .line 178
    return-object v10
.end method

.method public getRedirect(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .registers 8
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->getLocationURI(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/URI;

    move-result-object v2

    .line 218
    .local v2, "uri":Ljava/net/URI;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "method":Ljava/lang/String;
    const-string v3, "HEAD"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 220
    new-instance v3, Lcz/msebera/android/httpclient/client/methods/HttpHead;

    invoke-direct {v3, v2}, Lcz/msebera/android/httpclient/client/methods/HttpHead;-><init>(Ljava/net/URI;)V

    .line 228
    :goto_19
    return-object v3

    .line 221
    :cond_1a
    const-string v3, "GET"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 222
    new-instance v3, Lcz/msebera/android/httpclient/client/methods/HttpGet;

    invoke-direct {v3, v2}, Lcz/msebera/android/httpclient/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    goto :goto_19

    .line 224
    :cond_28
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v1

    .line 225
    .local v1, "status":I
    const/16 v3, 0x133

    if-ne v1, v3, :cond_41

    .line 226
    invoke-static {p1}, Lcz/msebera/android/httpclient/client/methods/RequestBuilder;->copy(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/methods/RequestBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcz/msebera/android/httpclient/client/methods/RequestBuilder;->setUri(Ljava/net/URI;)Lcz/msebera/android/httpclient/client/methods/RequestBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/client/methods/RequestBuilder;->build()Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    move-result-object v3

    goto :goto_19

    .line 228
    :cond_41
    new-instance v3, Lcz/msebera/android/httpclient/client/methods/HttpGet;

    invoke-direct {v3, v2}, Lcz/msebera/android/httpclient/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    goto :goto_19
.end method

.method protected isRedirectable(Ljava/lang/String;)Z
    .registers 8
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 205
    sget-object v3, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_5
    if-ge v2, v4, :cond_10

    aget-object v0, v3, v2

    .line 206
    .local v0, "m":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 207
    const/4 v1, 0x1

    .line 210
    .end local v0    # "m":Ljava/lang/String;
    :cond_10
    return v1

    .line 205
    .restart local v0    # "m":Ljava/lang/String;
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public isRedirected(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 10
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 101
    const-string v5, "HTTP request"

    invoke-static {p1, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    const-string v5, "HTTP response"

    invoke-static {p2, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    .line 105
    .local v2, "statusCode":I
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "method":Ljava/lang/String;
    const-string v5, "location"

    invoke-interface {p2, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 107
    .local v0, "locationHeader":Lcz/msebera/android/httpclient/Header;
    packed-switch v2, :pswitch_data_36

    :pswitch_25
    move v3, v4

    .line 116
    :cond_26
    :goto_26
    :pswitch_26
    return v3

    .line 109
    :pswitch_27
    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->isRedirectable(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    if-nez v0, :cond_26

    :cond_2f
    move v3, v4

    goto :goto_26

    .line 112
    :pswitch_31
    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->isRedirectable(Ljava/lang/String;)Z

    move-result v3

    goto :goto_26

    .line 107
    :pswitch_data_36
    .packed-switch 0x12d
        :pswitch_31
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_31
    .end packed-switch
.end method
