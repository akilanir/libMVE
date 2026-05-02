.class public Linfo/guardianproject/netcipher/client/StrongHttpsClient;
.super Lch/boye/httpclientandroidlib/impl/client/DefaultHttpClient;
.source "StrongHttpsClient.java"


# static fields
.field private static final TRUSTSTORE_PASSWORD:Ljava/lang/String; = "changeit"

.field private static final TRUSTSTORE_TYPE:Ljava/lang/String; = "BKS"

.field public static final TYPE_HTTP:Ljava/lang/String; = "http"

.field public static final TYPE_SOCKS:Ljava/lang/String; = "socks"


# instance fields
.field final context:Landroid/content/Context;

.field private mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

.field private proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

.field private proxyType:Ljava/lang/String;

.field private sFactory:Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0}, Lch/boye/httpclientandroidlib/impl/client/DefaultHttpClient;-><init>()V

    .line 39
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->context:Landroid/content/Context;

    .line 41
    new-instance v3, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;-><init>()V

    iput-object v3, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .line 42
    iget-object v3, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    new-instance v4, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    const-string v5, "http"

    const/16 v6, 0x50

    invoke-static {}, Lch/boye/httpclientandroidlib/conn/scheme/PlainSocketFactory;->getSocketFactory()Lch/boye/httpclientandroidlib/conn/scheme/PlainSocketFactory;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;-><init>(Ljava/lang/String;ILch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;)V

    invoke-virtual {v3, v4}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->register(Lch/boye/httpclientandroidlib/conn/scheme/Scheme;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    .line 47
    :try_start_1e
    invoke-direct {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->loadKeyStore()Ljava/security/KeyStore;

    move-result-object v1

    .line 48
    .local v1, "keyStore":Ljava/security/KeyStore;
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v2

    .line 49
    .local v2, "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    invoke-virtual {v2, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 50
    new-instance v3, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    invoke-virtual {v2}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v4

    const-string v5, "changeit"

    invoke-direct {v3, p1, v4, v1, v5}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;-><init>(Landroid/content/Context;[Ljavax/net/ssl/TrustManager;Ljava/security/KeyStore;Ljava/lang/String;)V

    iput-object v3, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->sFactory:Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    .line 51
    iget-object v3, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    new-instance v4, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    const-string v5, "https"

    const/16 v6, 0x1bb

    iget-object v7, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->sFactory:Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    invoke-direct {v4, v5, v6, v7}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;-><init>(Ljava/lang/String;ILch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;)V

    invoke-virtual {v3, v4}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->register(Lch/boye/httpclientandroidlib/conn/scheme/Scheme;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_4a} :catch_4b

    .line 55
    return-void

    .line 52
    .end local v1    # "keyStore":Ljava/security/KeyStore;
    .end local v2    # "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    :catch_4b
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/security/KeyStore;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "keystore"    # Ljava/security/KeyStore;

    .prologue
    .line 68
    invoke-direct {p0}, Lch/boye/httpclientandroidlib/impl/client/DefaultHttpClient;-><init>()V

    .line 69
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->context:Landroid/content/Context;

    .line 71
    new-instance v2, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-direct {v2}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;-><init>()V

    iput-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .line 72
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    new-instance v3, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    const-string v4, "http"

    const/16 v5, 0x50

    invoke-static {}, Lch/boye/httpclientandroidlib/conn/scheme/PlainSocketFactory;->getSocketFactory()Lch/boye/httpclientandroidlib/conn/scheme/PlainSocketFactory;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;-><init>(Ljava/lang/String;ILch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;)V

    invoke-virtual {v2, v3}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->register(Lch/boye/httpclientandroidlib/conn/scheme/Scheme;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    .line 76
    :try_start_1e
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v1

    .line 77
    .local v1, "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    new-instance v2, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v3

    const-string v4, "changeit"

    invoke-direct {v2, p1, v3, p2, v4}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;-><init>(Landroid/content/Context;[Ljavax/net/ssl/TrustManager;Ljava/security/KeyStore;Ljava/lang/String;)V

    iput-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->sFactory:Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    .line 78
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    new-instance v3, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    const-string v4, "https"

    const/16 v5, 0x1bb

    iget-object v6, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->sFactory:Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;

    invoke-direct {v3, v4, v5, v6}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;-><init>(Ljava/lang/String;ILch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;)V

    invoke-virtual {v2, v3}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->register(Lch/boye/httpclientandroidlib/conn/scheme/Scheme;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_43} :catch_44

    .line 82
    return-void

    .line 79
    .end local v1    # "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    :catch_44
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method static synthetic access$000(Linfo/guardianproject/netcipher/client/StrongHttpsClient;)Lch/boye/httpclientandroidlib/HttpHost;
    .registers 2
    .param p0, "x0"    # Linfo/guardianproject/netcipher/client/StrongHttpsClient;

    .prologue
    .line 26
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    return-object v0
.end method

.method private loadKeyStore()Ljava/security/KeyStore;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    const-string v2, "BKS"

    invoke-static {v2}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    .line 62
    .local v1, "trustStore":Ljava/security/KeyStore;
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Linfo/guardianproject/onionkit/R$raw;->debiancacerts:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 63
    .local v0, "in":Ljava/io/InputStream;
    const-string v2, "changeit"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 65
    return-object v1
.end method


# virtual methods
.method protected bridge synthetic createClientConnectionManager()Lch/boye/httpclientandroidlib/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 26
    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->createClientConnectionManager()Lch/boye/httpclientandroidlib/impl/conn/tsccm/ThreadSafeClientConnManager;

    move-result-object v0

    return-object v0
.end method

.method protected createClientConnectionManager()Lch/boye/httpclientandroidlib/impl/conn/tsccm/ThreadSafeClientConnManager;
    .registers 4

    .prologue
    .line 87
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    if-nez v0, :cond_1b

    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyType:Ljava/lang/String;

    if-nez v0, :cond_1b

    .line 89
    const-string v0, "StrongHTTPS"

    const-string v1, "not proxying"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    new-instance v0, Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;

    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-direct {v0, v1, v2}, Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;-><init>(Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    .line 115
    :goto_1a
    return-object v0

    .line 94
    :cond_1b
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    if-eqz v0, :cond_4f

    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyType:Ljava/lang/String;

    const-string v1, "socks"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 96
    const-string v0, "StrongHTTPS"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "proxying using: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    new-instance v0, Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;

    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-direct {v0, p0, v1, v2}, Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;-><init>(Linfo/guardianproject/netcipher/client/StrongHttpsClient;Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    goto :goto_1a

    .line 113
    :cond_4f
    const-string v0, "StrongHTTPS"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "proxying with: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    new-instance v0, Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;

    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->mRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-direct {v0, v1, v2}, Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;-><init>(Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    goto :goto_1a
.end method

.method public disableProxy()V
    .registers 3

    .prologue
    .line 145
    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v0

    const-string v1, "http.route.default-proxy"

    invoke-interface {v0, v1}, Lch/boye/httpclientandroidlib/params/HttpParams;->removeParameter(Ljava/lang/String;)Z

    .line 146
    const/4 v0, 0x0

    iput-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    .line 147
    return-void
.end method

.method public useProxy(ZLjava/lang/String;Ljava/lang/String;I)V
    .registers 8
    .param p1, "enableTor"    # Z
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    .line 121
    if-eqz p1, :cond_27

    .line 123
    iput-object p2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyType:Ljava/lang/String;

    .line 125
    const-string v0, "socks"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 127
    new-instance v0, Lch/boye/httpclientandroidlib/HttpHost;

    invoke-direct {v0, p3, p4}, Lch/boye/httpclientandroidlib/HttpHost;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    .line 141
    :goto_13
    return-void

    .line 131
    :cond_14
    new-instance v0, Lch/boye/httpclientandroidlib/HttpHost;

    invoke-direct {v0, p3, p4, p2}, Lch/boye/httpclientandroidlib/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    iput-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    .line 132
    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v0

    const-string v1, "http.route.default-proxy"

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    invoke-interface {v0, v1, v2}, Lch/boye/httpclientandroidlib/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lch/boye/httpclientandroidlib/params/HttpParams;

    goto :goto_13

    .line 137
    :cond_27
    invoke-virtual {p0}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->getParams()Lch/boye/httpclientandroidlib/params/HttpParams;

    move-result-object v0

    const-string v1, "http.route.default-proxy"

    invoke-interface {v0, v1}, Lch/boye/httpclientandroidlib/params/HttpParams;->removeParameter(Ljava/lang/String;)Z

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;

    goto :goto_13
.end method
