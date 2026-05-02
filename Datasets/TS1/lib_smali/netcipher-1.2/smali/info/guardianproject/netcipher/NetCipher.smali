.class public Linfo/guardianproject/netcipher/NetCipher;
.super Ljava/lang/Object;
.source "NetCipher.java"


# static fields
.field public static final ORBOT_HTTP_PROXY:Ljava/net/Proxy;

.field private static proxy:Ljava/net/Proxy;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 28
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    const/16 v4, 0x1fb6

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    sput-object v0, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public static getCompatibleHttpURLConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    const/4 v0, 0x1

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getCompatibleHttpsURLConnection(Ljava/net/URL;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    const/4 v0, 0x1

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    .registers 2
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .registers 2
    .param p0, "urlString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Ljava/net/URI;)Ljava/net/HttpURLConnection;
    .registers 2
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    const/4 v0, 0x0

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;
    .registers 8
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "compatible"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    :try_start_0
    const-string v3, "TLSv1"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 252
    .local v1, "sslcontext":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v4, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_c} :catch_25
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_c} :catch_2c

    .line 258
    new-instance v2, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Z)V

    .line 260
    .local v2, "tlsOnly":Ljavax/net/ssl/SSLSocketFactory;
    invoke-static {v2}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 261
    sget-object v3, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    if-eqz v3, :cond_33

    .line 262
    sget-object v3, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    invoke-virtual {p0, v3}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 264
    :goto_24
    return-object v3

    .line 253
    .end local v1    # "sslcontext":Ljavax/net/ssl/SSLContext;
    .end local v2    # "tlsOnly":Ljavax/net/ssl/SSLSocketFactory;
    :catch_25
    move-exception v0

    .line 254
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 255
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2c
    move-exception v0

    .line 256
    .local v0, "e":Ljava/security/KeyManagementException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 264
    .end local v0    # "e":Ljava/security/KeyManagementException;
    .restart local v1    # "sslcontext":Ljavax/net/ssl/SSLContext;
    .restart local v2    # "tlsOnly":Ljavax/net/ssl/SSLSocketFactory;
    :cond_33
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    goto :goto_24
.end method

.method public static getHttpsURLConnection(Landroid/net/Uri;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 2
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/lang/String;)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpsURLConnection(Ljava/lang/String;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 3
    .param p0, "urlString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    const-string v0, "^[Hh][Tt][Tt][Pp]:"

    const-string v1, "https:"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-static {v0, v1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpsURLConnection(Ljava/net/URI;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 3
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 114
    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    .line 117
    :goto_15
    return-object v0

    :cond_16
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/lang/String;)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    goto :goto_15
.end method

.method public static getHttpsURLConnection(Ljava/net/URL;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;
    .registers 5
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "compatible"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p0, p1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 160
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_b

    .line 161
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    return-object v0

    .line 163
    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "not an HTTPS connection!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getProxy()Ljava/net/Proxy;
    .registers 1

    .prologue
    .line 65
    sget-object v0, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public static setProxy(Ljava/lang/String;I)V
    .registers 5
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I

    .prologue
    .line 41
    if-eqz p0, :cond_13

    if-lez p1, :cond_13

    .line 42
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, p0, p1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 43
    .local v0, "isa":Ljava/net/InetSocketAddress;
    new-instance v1, Ljava/net/Proxy;

    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-direct {v1, v2, v0}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    sput-object v1, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    .line 47
    .end local v0    # "isa":Ljava/net/InetSocketAddress;
    :goto_12
    return-void

    .line 45
    :cond_13
    const/4 v1, 0x0

    sput-object v1, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    goto :goto_12
.end method

.method public static setProxy(Ljava/net/Proxy;)V
    .registers 1
    .param p0, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 56
    sput-object p0, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    .line 57
    return-void
.end method

.method public static useTor()V
    .registers 1

    .prologue
    .line 73
    sget-object v0, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->setProxy(Ljava/net/Proxy;)V

    .line 74
    return-void
.end method
