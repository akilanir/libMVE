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

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput v0, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 100
    iput v0, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 101
    const/4 v0, 0x3

    iput v0, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    return-void
.end method

.method private getCredentials()Lorg/apache/http/auth/UsernamePasswordCredentials;
    .registers 4

    .prologue
    .line 250
    iget-object v0, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    if-eqz v0, :cond_12

    .line 251
    :cond_8
    new-instance v0, Lorg/apache/http/auth/UsernamePasswordCredentials;

    iget-object v1, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    iget-object v2, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    :goto_11
    return-object v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private getHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .registers 16
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v13, 0x1bb

    .line 206
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 207
    .local v4, "httpParams":Lorg/apache/http/params/HttpParams;
    const-string v9, "http.protocol.cookie-policy"

    const-string v10, "rfc2109"

    invoke-interface {v4, v9, v10}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 208
    iget v9, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    invoke-static {v4, v9}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 209
    iget v9, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    invoke-static {v4, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 210
    const/16 v9, 0x2000

    invoke-static {v4, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 212
    new-instance v5, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 213
    .local v5, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "http"

    new-instance v11, Lorg/apache/http/conn/scheme/PlainSocketFactory;

    invoke-direct {v11}, Lorg/apache/http/conn/scheme/PlainSocketFactory;-><init>()V

    const/16 v12, 0x50

    invoke-direct {v9, v10, v11, v12}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 214
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->disableSSLCertValidation()Z

    move-result v9

    if-eqz v9, :cond_62

    .line 215
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    new-instance v11, Lorg/acra/util/FakeSocketFactory;

    invoke-direct {v11}, Lorg/acra/util/FakeSocketFactory;-><init>()V

    invoke-direct {v9, v10, v11, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 236
    :goto_4c
    new-instance v0, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-direct {v0, v4, v5}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 237
    .local v0, "clientConnectionManager":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3, v0, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 239
    .local v3, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v6, Lorg/acra/util/HttpRequest$SocketTimeOutRetryHandler;

    iget v9, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    const/4 v10, 0x0

    invoke-direct {v6, v4, v9, v10}, Lorg/acra/util/HttpRequest$SocketTimeOutRetryHandler;-><init>(Lorg/apache/http/params/HttpParams;ILorg/acra/util/HttpRequest$1;)V

    .line 240
    .local v6, "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    invoke-virtual {v3, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->setHttpRequestRetryHandler(Lorg/apache/http/client/HttpRequestRetryHandler;)V

    .line 242
    return-object v3

    .line 216
    .end local v0    # "clientConnectionManager":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v3    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v6    # "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    :cond_62
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->keyStore()Ljava/security/KeyStore;

    move-result-object v9

    if-eqz v9, :cond_cb

    .line 218
    :try_start_6c
    new-instance v7, Lorg/apache/http/conn/ssl/SSLSocketFactory;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->keyStore()Ljava/security/KeyStore;

    move-result-object v9

    invoke-direct {v7, v9}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 219
    .local v7, "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v9, Lorg/apache/http/conn/ssl/SSLSocketFactory;->STRICT_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v7, v9}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 220
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    const/16 v11, 0x1bb

    invoke-direct {v9, v10, v7, v11}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;
    :try_end_8a
    .catch Ljava/security/KeyManagementException; {:try_start_6c .. :try_end_8a} :catch_8b
    .catch Ljava/security/UnrecoverableKeyException; {:try_start_6c .. :try_end_8a} :catch_9b
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6c .. :try_end_8a} :catch_ab
    .catch Ljava/security/KeyStoreException; {:try_start_6c .. :try_end_8a} :catch_bb

    goto :goto_4c

    .line 221
    .end local v7    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    :catch_8b
    move-exception v1

    .line 222
    .local v1, "e":Ljava/security/KeyManagementException;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v11

    invoke-direct {v9, v10, v11, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto :goto_4c

    .line 223
    .end local v1    # "e":Ljava/security/KeyManagementException;
    :catch_9b
    move-exception v1

    .line 224
    .local v1, "e":Ljava/security/UnrecoverableKeyException;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v11

    invoke-direct {v9, v10, v11, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto :goto_4c

    .line 225
    .end local v1    # "e":Ljava/security/UnrecoverableKeyException;
    :catch_ab
    move-exception v1

    .line 226
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v11

    invoke-direct {v9, v10, v11, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto :goto_4c

    .line 227
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_bb
    move-exception v1

    .line 228
    .local v1, "e":Ljava/security/KeyStoreException;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v11

    invoke-direct {v9, v10, v11, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto :goto_4c

    .line 231
    .end local v1    # "e":Ljava/security/KeyStoreException;
    :cond_cb
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->getHttpSocketFactoryFactory()Lorg/acra/util/HttpsSocketFactoryFactory;

    move-result-object v2

    .line 232
    .local v2, "factory":Lorg/acra/util/HttpsSocketFactoryFactory;
    invoke-interface {v2, p1}, Lorg/acra/util/HttpsSocketFactoryFactory;->create(Landroid/content/Context;)Lorg/apache/http/conn/scheme/SocketFactory;

    move-result-object v8

    .line 233
    .local v8, "socketFactory":Lorg/apache/http/conn/scheme/SocketFactory;
    new-instance v9, Lorg/apache/http/conn/scheme/Scheme;

    const-string v10, "https"

    invoke-direct {v9, v10, v8, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v5, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    goto/16 :goto_4c
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
    .line 261
    sget-object v5, Lorg/acra/util/HttpRequest$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    invoke-virtual {p2}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_94

    .line 269
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

    .line 263
    :pswitch_28
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 272
    .local v2, "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    :goto_31
    invoke-direct {p0}, Lorg/acra/util/HttpRequest;->getCredentials()Lorg/apache/http/auth/UsernamePasswordCredentials;

    move-result-object v0

    .line 273
    .local v0, "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    if-eqz v0, :cond_41

    .line 274
    const-string v5, "UTF-8"

    const/4 v6, 0x0

    invoke-static {v0, v5, v6}, Lorg/apache/http/impl/auth/BasicScheme;->authenticate(Lorg/apache/http/auth/Credentials;Ljava/lang/String;Z)Lorg/apache/http/Header;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->addHeader(Lorg/apache/http/Header;)V

    .line 276
    :cond_41
    const-string v5, "User-Agent"

    const-string v6, "Android"

    invoke-virtual {v2, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    const-string v5, "Accept"

    const-string v6, "text/html,application/xml,application/json,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"

    invoke-virtual {v2, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v5, "Content-Type"

    invoke-virtual {p4}, Lorg/acra/sender/HttpSender$Type;->getContentType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    if-eqz v5, :cond_88

    .line 283
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_66
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_88

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 284
    .local v1, "header":Ljava/lang/String;
    iget-object v5, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 285
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {v2, v1, v4}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_66

    .line 266
    .end local v0    # "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    .end local v1    # "header":Ljava/lang/String;
    .end local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "value":Ljava/lang/String;
    :pswitch_7e
    new-instance v2, Lorg/apache/http/client/methods/HttpPut;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 267
    .restart local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    goto :goto_31

    .line 289
    .restart local v0    # "creds":Lorg/apache/http/auth/UsernamePasswordCredentials;
    :cond_88
    new-instance v5, Lorg/apache/http/entity/StringEntity;

    const-string v6, "UTF-8"

    invoke-direct {v5, p3, v6}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 291
    return-object v2

    .line 261
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
    .line 305
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<**>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 306
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

    .line 307
    .local v2, "key":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_22

    .line 308
    const/16 v5, 0x26

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 310
    :cond_22
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 311
    .local v3, "preliminaryValue":Ljava/lang/Object;
    if-nez v3, :cond_4a

    const-string v4, ""

    .line 312
    .local v4, "value":Ljava/lang/Object;
    :goto_2a
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    const/16 v5, 0x3d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
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

    .line 311
    goto :goto_2a

    .line 317
    .end local v2    # "key":Ljava/lang/Object;
    .end local v3    # "preliminaryValue":Ljava/lang/Object;
    :cond_4c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public send(Landroid/content/Context;Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "url"    # Ljava/net/URL;
    .param p3, "method"    # Lorg/acra/sender/HttpSender$Method;
    .param p4, "content"    # Ljava/lang/String;
    .param p5, "type"    # Lorg/acra/sender/HttpSender$Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-direct {p0, p1}, Lorg/acra/util/HttpRequest;->getHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v0

    .line 148
    .local v0, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/acra/util/HttpRequest;->getHttpRequest(Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;

    move-result-object v1

    .line 150
    .local v1, "httpRequest":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Sending request to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v2, 0x0

    .line 158
    .local v2, "response":Lorg/apache/http/HttpResponse;
    :try_start_23
    new-instance v5, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v5}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-interface {v0, v1, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 159
    if-eqz v2, :cond_8b

    .line 160
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    .line 161
    .local v4, "statusLine":Lorg/apache/http/StatusLine;
    if-eqz v4, :cond_84

    .line 162
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 164
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

    .line 179
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

    .line 196
    .end local v3    # "statusCode":Ljava/lang/String;
    .end local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :catchall_79
    move-exception v5

    if-eqz v2, :cond_83

    .line 197
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V

    :cond_83
    throw v5

    .line 186
    .restart local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_84
    :try_start_84
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    :try_end_8b
    .catchall {:try_start_84 .. :try_end_8b} :catchall_79

    .line 196
    .end local v4    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_8b
    if-eqz v2, :cond_94

    .line 197
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 200
    :cond_94
    return-void
.end method

.method public setConnectionTimeOut(I)V
    .registers 2
    .param p1, "connectionTimeOut"    # I

    .prologue
    .line 113
    iput p1, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 114
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
    .line 121
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    .line 122
    return-void
.end method

.method public setLogin(Ljava/lang/String;)V
    .registers 2
    .param p1, "login"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setMaxNrRetries(I)V
    .registers 2
    .param p1, "maxNrRetries"    # I

    .prologue
    .line 133
    iput p1, p0, Lorg/acra/util/HttpRequest;->maxNrRetries:I

    .line 134
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    .line 110
    return-void
.end method

.method public setSocketTimeOut(I)V
    .registers 2
    .param p1, "socketTimeOut"    # I

    .prologue
    .line 117
    iput p1, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 118
    return-void
.end method
