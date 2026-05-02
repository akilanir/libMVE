.class public final Lorg/acra/util/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/util/HttpRequest$1;,
        Lorg/acra/util/HttpRequest$SocketTimeOutRetryHandler;
    }
.end annotation


# instance fields
.field private connectionTimeOut:I

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private login:Ljava/lang/String;

.field private maxNrRetries:I

.field private password:Ljava/lang/String;

.field private socketTimeOut:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/16 v0, 0xbb8

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput v0, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 93
    iput v0, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 94
    const/4 v0, 0x3

    iput v0, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    return-void
.end method

.method private getCredentials()Lorg/apache/http/auth/UsernamePasswordCredentials;
    .registers 4

    .prologue
    .line 228
    iget-object v0, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    if-eqz v0, :cond_12

    .line 229
    :cond_8
    new-instance v0, Lorg/apache/http/auth/UsernamePasswordCredentials;

    iget-object v1, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    iget-object v2, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    :goto_11
    return-object v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private getHttpClient()Lorg/apache/http/client/HttpClient;
    .registers 11

    .prologue
    const/16 v9, 0x1bb

    .line 200
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 201
    .local v2, "httpParams":Lorg/apache/http/params/HttpParams;
    const-string v5, "http.protocol.cookie-policy"

    const-string v6, "rfc2109"

    invoke-interface {v2, v5, v6}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 202
    iget v5, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 203
    iget v5, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 204
    const/16 v5, 0x2000

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 206
    new-instance v3, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 207
    .local v3, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v5, Lorg/apache/http/conn/scheme/Scheme;

    const-string v6, "http"

    new-instance v7, Lorg/apache/http/conn/scheme/PlainSocketFactory;

    invoke-direct {v7}, Lorg/apache/http/conn/scheme/PlainSocketFactory;-><init>()V

    const/16 v8, 0x50

    invoke-direct {v5, v6, v7, v8}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 208
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lorg/acra/ACRAConfiguration;->disableSSLCertValidation()Z

    move-result v5

    if-eqz v5, :cond_62

    .line 209
    new-instance v5, Lorg/apache/http/conn/scheme/Scheme;

    const-string v6, "https"

    new-instance v7, Lorg/acra/util/FakeSocketFactory;

    invoke-direct {v7}, Lorg/acra/util/FakeSocketFactory;-><init>()V

    invoke-direct {v5, v6, v7, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 214
    :goto_4c
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v2, v3}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 215
    .local v0, "clientConnectionManager":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v0, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 217
    .local v1, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v4, Lorg/acra/util/HttpRequest$SocketTimeOutRetryHandler;

    iget v5, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    const/4 v6, 0x0

    invoke-direct {v4, v2, v5, v6}, Lorg/acra/util/HttpRequest$SocketTimeOutRetryHandler;-><init>(Lorg/apache/http/params/HttpParams;ILorg/acra/util/HttpRequest$1;)V

    .line 218
    .local v4, "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    invoke-virtual {v1, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->setHttpRequestRetryHandler(Lorg/apache/http/client/HttpRequestRetryHandler;)V

    .line 220
    return-object v1

    .line 211
    .end local v0    # "clientConnectionManager":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v1    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v4    # "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    :cond_62
    new-instance v5, Lorg/apache/http/conn/scheme/Scheme;

    const-string v6, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v7

    invoke-direct {v5, v6, v7, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto :goto_4c
.end method

.method private getHttpRequest(Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    .registers 13
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "method"    # Lorg/acra/sender/HttpSender$Method;
    .param p3, "content"    # Ljava/lang/String;
    .param p4, "type"    # Lorg/acra/sender/HttpSender$Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 239
    sget-object v5, Lorg/acra/util/HttpRequest$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    invoke-virtual {p2}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_94

    .line 247
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown method: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 241
    :pswitch_28
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 250
    .local v3, "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    :goto_31
    invoke-direct {p0}, Lorg/acra/util/HttpRequest;->getCredentials()Lorg/apache/http/auth/UsernamePasswordCredentials;

    move-result-object v0

    .line 251
    .local v0, "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    if-eqz v0, :cond_41

    .line 252
    const-string v5, "UTF-8"

    const/4 v6, 0x0

    invoke-static {v0, v5, v6}, Lorg/apache/http/impl/auth/BasicScheme;->authenticate(Lorg/apache/http/auth/Credentials;Ljava/lang/String;Z)Lorg/apache/http/Header;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->addHeader(Lorg/apache/http/Header;)V

    .line 254
    :cond_41
    const-string v5, "User-Agent"

    const-string v6, "Android"

    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    const-string v5, "Accept"

    const-string v6, "text/html,application/xml,application/json,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"

    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    const-string v5, "Content-Type"

    invoke-virtual {p4}, Lorg/acra/sender/HttpSender$Type;->getContentType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    if-eqz v5, :cond_88

    .line 261
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 262
    .local v2, "headerIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_66
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_88

    .line 263
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 264
    .local v1, "header":Ljava/lang/String;
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 265
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {v3, v1, v4}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_66

    .line 244
    .end local v0    # "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    .end local v1    # "header":Ljava/lang/String;
    .end local v2    # "headerIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v3    # "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    .end local v4    # "value":Ljava/lang/String;
    :pswitch_7e
    new-instance v3, Lorg/apache/http/client/methods/HttpPut;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 245
    .restart local v3    # "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    goto :goto_31

    .line 269
    .restart local v0    # "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    :cond_88
    new-instance v5, Lorg/apache/http/entity/StringEntity;

    const-string v6, "UTF-8"

    invoke-direct {v5, p3, v6}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 271
    return-object v3

    .line 239
    nop

    :pswitch_data_94
    .packed-switch 0x1
        :pswitch_28
        :pswitch_7e
    .end packed-switch
.end method

.method public static getParamsAsFormString(Ljava/util/Map;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 285
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<**>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .local v0, "dataBfr":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 287
    .local v2, "key":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_22

    .line 288
    const/16 v5, 0x26

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 290
    :cond_22
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 291
    .local v3, "preliminaryValue":Ljava/lang/Object;
    if-nez v3, :cond_4a

    const-string v4, ""

    .line 292
    .local v4, "value":Ljava/lang/Object;
    :goto_2a
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    const/16 v5, 0x3d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 294
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d

    .end local v4    # "value":Ljava/lang/Object;
    :cond_4a
    move-object v4, v3

    .line 291
    goto :goto_2a

    .line 297
    .end local v2    # "key":Ljava/lang/Object;
    .end local v3    # "preliminaryValue":Ljava/lang/Object;
    :cond_4c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public send(Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    .registers 14
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "method"    # Lorg/acra/sender/HttpSender$Method;
    .param p3, "content"    # Ljava/lang/String;
    .param p4, "type"    # Lorg/acra/sender/HttpSender$Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-direct {p0}, Lorg/acra/util/HttpRequest;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v0

    .line 142
    .local v0, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/acra/util/HttpRequest;->getHttpRequest(Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;

    move-result-object v1

    .line 144
    .local v1, "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Sending request to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/4 v2, 0x0

    .line 152
    .local v2, "response":Lorg/apache/http/HttpResponse;
    :try_start_23
    new-instance v5, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v5}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-interface {v0, v1, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 153
    if-eqz v2, :cond_8b

    .line 154
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    .line 155
    .local v4, "statusLine":Lorg/apache/http/StatusLine;
    if-eqz v4, :cond_84

    .line 156
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 158
    .local v3, "statusCode":Ljava/lang/String;
    const-string v5, "409"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_84

    const-string v5, "403"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_84

    const-string v5, "4"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_60

    const-string v5, "5"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_84

    .line 173
    :cond_60
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Host returned error code "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_79
    .catchall {:try_start_23 .. :try_end_79} :catchall_79

    .line 190
    .end local v3    # "statusCode":Ljava/lang/String;
    .end local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :catchall_79
    move-exception v5

    if-eqz v2, :cond_83

    .line 191
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V

    :cond_83
    throw v5

    .line 180
    .restart local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_84
    :try_start_84
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    :try_end_8b
    .catchall {:try_start_84 .. :try_end_8b} :catchall_79

    .line 190
    .end local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_8b
    if-eqz v2, :cond_94

    .line 191
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 194
    :cond_94
    return-void
.end method

.method public setConnectionTimeOut(I)V
    .registers 2
    .param p1, "connectionTimeOut"    # I

    .prologue
    .line 106
    iput p1, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 107
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    .line 115
    return-void
.end method

.method public setLogin(Ljava/lang/String;)V
    .registers 2
    .param p1, "login"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public setMaxNrRetries(I)V
    .registers 2
    .param p1, "maxNrRetries"    # I

    .prologue
    .line 126
    iput p1, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    .line 127
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setSocketTimeOut(I)V
    .registers 2
    .param p1, "socketTimeOut"    # I

    .prologue
    .line 110
    iput p1, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 111
    return-void
.end method
