.class public Lokhttp3/OkHttpClient;
.super Ljava/lang/Object;
.source "OkHttpClient.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lokhttp3/Call$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/OkHttpClient$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_CONNECTION_SPECS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_PROTOCOLS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final authenticator:Lokhttp3/Authenticator;

.field final cache:Lokhttp3/Cache;

.field final certificatePinner:Lokhttp3/CertificatePinner;

.field final connectTimeout:I

.field final connectionPool:Lokhttp3/ConnectionPool;

.field final connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field final cookieJar:Lokhttp3/CookieJar;

.field final dispatcher:Lokhttp3/Dispatcher;

.field final dns:Lokhttp3/Dns;

.field final followRedirects:Z

.field final followSslRedirects:Z

.field final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field final internalCache:Lokhttp3/internal/InternalCache;

.field final networkInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field final protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field final proxy:Ljava/net/Proxy;

.field final proxyAuthenticator:Lokhttp3/Authenticator;

.field final proxySelector:Ljava/net/ProxySelector;

.field final readTimeout:I

.field final retryOnConnectionFailure:Z

.field final socketFactory:Ljavax/net/SocketFactory;

.field final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field final trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

.field final writeTimeout:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 61
    new-array v0, v5, [Lokhttp3/Protocol;

    sget-object v1, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    aput-object v1, v0, v2

    sget-object v1, Lokhttp3/Protocol;->SPDY_3:Lokhttp3/Protocol;

    aput-object v1, v0, v3

    sget-object v1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    aput-object v1, v0, v4

    invoke-static {v0}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lokhttp3/OkHttpClient;->DEFAULT_PROTOCOLS:Ljava/util/List;

    .line 64
    new-array v0, v5, [Lokhttp3/ConnectionSpec;

    sget-object v1, Lokhttp3/ConnectionSpec;->MODERN_TLS:Lokhttp3/ConnectionSpec;

    aput-object v1, v0, v2

    sget-object v1, Lokhttp3/ConnectionSpec;->COMPATIBLE_TLS:Lokhttp3/ConnectionSpec;

    aput-object v1, v0, v3

    sget-object v1, Lokhttp3/ConnectionSpec;->CLEARTEXT:Lokhttp3/ConnectionSpec;

    aput-object v1, v0, v4

    invoke-static {v0}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lokhttp3/OkHttpClient;->DEFAULT_CONNECTION_SPECS:Ljava/util/List;

    .line 68
    new-instance v0, Lokhttp3/OkHttpClient$1;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$1;-><init>()V

    sput-object v0, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 122
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 151
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    invoke-direct {p0, v0}, Lokhttp3/OkHttpClient;-><init>(Lokhttp3/OkHttpClient$Builder;)V

    .line 152
    return-void
.end method

.method private constructor <init>(Lokhttp3/OkHttpClient$Builder;)V
    .registers 10
    .param p1, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->dispatcher:Lokhttp3/Dispatcher;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->dispatcher:Lokhttp3/Dispatcher;

    .line 156
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    .line 157
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->protocols:Ljava/util/List;

    .line 158
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    .line 159
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    invoke-static {v5}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    .line 160
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    invoke-static {v5}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    .line 161
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    .line 162
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->cookieJar:Lokhttp3/CookieJar;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->cookieJar:Lokhttp3/CookieJar;

    .line 163
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->cache:Lokhttp3/Cache;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->cache:Lokhttp3/Cache;

    .line 164
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->internalCache:Lokhttp3/internal/InternalCache;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->internalCache:Lokhttp3/internal/InternalCache;

    .line 165
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    .line 167
    const/4 v1, 0x0

    .line 168
    .local v1, "isTLS":Z
    iget-object v5, p0, Lokhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_56

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokhttp3/ConnectionSpec;

    .line 169
    .local v2, "spec":Lokhttp3/ConnectionSpec;
    if-nez v1, :cond_52

    invoke-virtual {v2}, Lokhttp3/ConnectionSpec;->isTls()Z

    move-result v6

    if-eqz v6, :cond_54

    :cond_52
    const/4 v1, 0x1

    .line 170
    :goto_53
    goto :goto_3e

    .line 169
    :cond_54
    const/4 v1, 0x0

    goto :goto_53

    .line 172
    .end local v2    # "spec":Lokhttp3/ConnectionSpec;
    :cond_56
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v5, :cond_5c

    if-nez v1, :cond_a1

    .line 173
    :cond_5c
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 183
    :goto_60
    iget-object v5, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v5, :cond_104

    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    if-nez v5, :cond_104

    .line 184
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v5

    iget-object v6, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v5, v6}, Lokhttp3/internal/Platform;->trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object v4

    .line 185
    .local v4, "trustManager":Ljavax/net/ssl/X509TrustManager;
    if-nez v4, :cond_bb

    .line 186
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to extract the trust manager on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", sslSocketFactory is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 187
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 176
    .end local v4    # "trustManager":Ljavax/net/ssl/X509TrustManager;
    :cond_a1
    :try_start_a1
    const-string v5, "TLS"

    invoke-static {v5}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    .line 177
    .local v3, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v5, v6, v7}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 178
    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_b3
    .catch Ljava/security/GeneralSecurityException; {:try_start_a1 .. :try_end_b3} :catch_b4

    goto :goto_60

    .line 179
    .end local v3    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_b4
    move-exception v0

    .line 180
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 189
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .restart local v4    # "trustManager":Ljavax/net/ssl/X509TrustManager;
    :cond_bb
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v5

    invoke-virtual {v5, v4}, Lokhttp3/internal/Platform;->trustRootIndex(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/TrustRootIndex;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/OkHttpClient;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 190
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->certificatePinner:Lokhttp3/CertificatePinner;

    invoke-virtual {v5}, Lokhttp3/CertificatePinner;->newBuilder()Lokhttp3/CertificatePinner$Builder;

    move-result-object v5

    iget-object v6, p0, Lokhttp3/OkHttpClient;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 191
    invoke-virtual {v5, v6}, Lokhttp3/CertificatePinner$Builder;->trustRootIndex(Lokhttp3/internal/tls/TrustRootIndex;)Lokhttp3/CertificatePinner$Builder;

    move-result-object v5

    .line 192
    invoke-virtual {v5}, Lokhttp3/CertificatePinner$Builder;->build()Lokhttp3/CertificatePinner;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/OkHttpClient;->certificatePinner:Lokhttp3/CertificatePinner;

    .line 197
    .end local v4    # "trustManager":Ljavax/net/ssl/X509TrustManager;
    :goto_d7
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 198
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lokhttp3/Authenticator;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->proxyAuthenticator:Lokhttp3/Authenticator;

    .line 199
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->authenticator:Lokhttp3/Authenticator;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->authenticator:Lokhttp3/Authenticator;

    .line 200
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->connectionPool:Lokhttp3/ConnectionPool;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->connectionPool:Lokhttp3/ConnectionPool;

    .line 201
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->dns:Lokhttp3/Dns;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->dns:Lokhttp3/Dns;

    .line 202
    iget-boolean v5, p1, Lokhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    iput-boolean v5, p0, Lokhttp3/OkHttpClient;->followSslRedirects:Z

    .line 203
    iget-boolean v5, p1, Lokhttp3/OkHttpClient$Builder;->followRedirects:Z

    iput-boolean v5, p0, Lokhttp3/OkHttpClient;->followRedirects:Z

    .line 204
    iget-boolean v5, p1, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    iput-boolean v5, p0, Lokhttp3/OkHttpClient;->retryOnConnectionFailure:Z

    .line 205
    iget v5, p1, Lokhttp3/OkHttpClient$Builder;->connectTimeout:I

    iput v5, p0, Lokhttp3/OkHttpClient;->connectTimeout:I

    .line 206
    iget v5, p1, Lokhttp3/OkHttpClient$Builder;->readTimeout:I

    iput v5, p0, Lokhttp3/OkHttpClient;->readTimeout:I

    .line 207
    iget v5, p1, Lokhttp3/OkHttpClient$Builder;->writeTimeout:I

    iput v5, p0, Lokhttp3/OkHttpClient;->writeTimeout:I

    .line 208
    return-void

    .line 194
    :cond_104
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 195
    iget-object v5, p1, Lokhttp3/OkHttpClient$Builder;->certificatePinner:Lokhttp3/CertificatePinner;

    iput-object v5, p0, Lokhttp3/OkHttpClient;->certificatePinner:Lokhttp3/CertificatePinner;

    goto :goto_d7
.end method

.method synthetic constructor <init>(Lokhttp3/OkHttpClient$Builder;Lokhttp3/OkHttpClient$1;)V
    .registers 3
    .param p1, "x0"    # Lokhttp3/OkHttpClient$Builder;
    .param p2, "x1"    # Lokhttp3/OkHttpClient$1;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lokhttp3/OkHttpClient;-><init>(Lokhttp3/OkHttpClient$Builder;)V

    return-void
.end method

.method static synthetic access$000()Ljava/util/List;
    .registers 1

    .prologue
    .line 60
    sget-object v0, Lokhttp3/OkHttpClient;->DEFAULT_PROTOCOLS:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/List;
    .registers 1

    .prologue
    .line 60
    sget-object v0, Lokhttp3/OkHttpClient;->DEFAULT_CONNECTION_SPECS:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public authenticator()Lokhttp3/Authenticator;
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Lokhttp3/OkHttpClient;->authenticator:Lokhttp3/Authenticator;

    return-object v0
.end method

.method public cache()Lokhttp3/Cache;
    .registers 2

    .prologue
    .line 238
    iget-object v0, p0, Lokhttp3/OkHttpClient;->cache:Lokhttp3/Cache;

    return-object v0
.end method

.method public certificatePinner()Lokhttp3/CertificatePinner;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lokhttp3/OkHttpClient;->certificatePinner:Lokhttp3/CertificatePinner;

    return-object v0
.end method

.method public connectTimeoutMillis()I
    .registers 2

    .prologue
    .line 212
    iget v0, p0, Lokhttp3/OkHttpClient;->connectTimeout:I

    return v0
.end method

.method public connectionPool()Lokhttp3/ConnectionPool;
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lokhttp3/OkHttpClient;->connectionPool:Lokhttp3/ConnectionPool;

    return-object v0
.end method

.method public connectionSpecs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lokhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lokhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    return-object v0
.end method

.method public cookieJar()Lokhttp3/CookieJar;
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lokhttp3/OkHttpClient;->cookieJar:Lokhttp3/CookieJar;

    return-object v0
.end method

.method public dispatcher()Lokhttp3/Dispatcher;
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lokhttp3/OkHttpClient;->dispatcher:Lokhttp3/Dispatcher;

    return-object v0
.end method

.method public dns()Lokhttp3/Dns;
    .registers 2

    .prologue
    .line 246
    iget-object v0, p0, Lokhttp3/OkHttpClient;->dns:Lokhttp3/Dns;

    return-object v0
.end method

.method public followRedirects()Z
    .registers 2

    .prologue
    .line 282
    iget-boolean v0, p0, Lokhttp3/OkHttpClient;->followRedirects:Z

    return v0
.end method

.method public followSslRedirects()Z
    .registers 2

    .prologue
    .line 278
    iget-boolean v0, p0, Lokhttp3/OkHttpClient;->followSslRedirects:Z

    return v0
.end method

.method public hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lokhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public interceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 307
    iget-object v0, p0, Lokhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method internalCache()Lokhttp3/internal/InternalCache;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lokhttp3/OkHttpClient;->cache:Lokhttp3/Cache;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lokhttp3/OkHttpClient;->cache:Lokhttp3/Cache;

    iget-object v0, v0, Lokhttp3/Cache;->internalCache:Lokhttp3/internal/InternalCache;

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lokhttp3/OkHttpClient;->internalCache:Lokhttp3/internal/InternalCache;

    goto :goto_8
.end method

.method public networkInterceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 316
    iget-object v0, p0, Lokhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    return-object v0
.end method

.method public newBuilder()Lokhttp3/OkHttpClient$Builder;
    .registers 2

    .prologue
    .line 327
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0, p0}, Lokhttp3/OkHttpClient$Builder;-><init>(Lokhttp3/OkHttpClient;)V

    return-object v0
.end method

.method public newCall(Lokhttp3/Request;)Lokhttp3/Call;
    .registers 3
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    .line 323
    new-instance v0, Lokhttp3/RealCall;

    invoke-direct {v0, p0, p1}, Lokhttp3/RealCall;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;)V

    return-object v0
.end method

.method public protocols()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .prologue
    .line 294
    iget-object v0, p0, Lokhttp3/OkHttpClient;->protocols:Ljava/util/List;

    return-object v0
.end method

.method public proxy()Ljava/net/Proxy;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Lokhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public proxyAuthenticator()Lokhttp3/Authenticator;
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Lokhttp3/OkHttpClient;->proxyAuthenticator:Lokhttp3/Authenticator;

    return-object v0
.end method

.method public proxySelector()Ljava/net/ProxySelector;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lokhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public readTimeoutMillis()I
    .registers 2

    .prologue
    .line 217
    iget v0, p0, Lokhttp3/OkHttpClient;->readTimeout:I

    return v0
.end method

.method public retryOnConnectionFailure()Z
    .registers 2

    .prologue
    .line 286
    iget-boolean v0, p0, Lokhttp3/OkHttpClient;->retryOnConnectionFailure:Z

    return v0
.end method

.method public socketFactory()Ljavax/net/SocketFactory;
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lokhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .prologue
    .line 254
    iget-object v0, p0, Lokhttp3/OkHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public writeTimeoutMillis()I
    .registers 2

    .prologue
    .line 222
    iget v0, p0, Lokhttp3/OkHttpClient;->writeTimeout:I

    return v0
.end method
