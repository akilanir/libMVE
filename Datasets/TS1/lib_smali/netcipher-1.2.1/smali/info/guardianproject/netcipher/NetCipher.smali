.class public Linfo/guardianproject/netcipher/NetCipher;
.super Ljava/lang/Object;
.source "NetCipher.java"


# static fields
.field public static final ORBOT_HTTP_PROXY:Ljava/net/Proxy;

.field private static final TAG:Ljava/lang/String; = "NetCipher"

.field private static proxy:Ljava/net/Proxy;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 31
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
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static clearProxy()V
    .registers 1

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->setProxy(Ljava/net/Proxy;)V

    .line 94
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
    .line 260
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
    .line 224
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
    .line 288
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
    .line 274
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
    .line 302
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
    .line 316
    const/4 v0, 0x0

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;
    .registers 10
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "compatible"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    sget-object v2, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    .line 125
    .local v2, "proxy":Ljava/net/Proxy;
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isOnionAddress(Ljava/net/URL;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 126
    sget-object v2, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    .line 129
    :cond_a
    if-eqz v2, :cond_32

    .line 130
    invoke-virtual {p0, v2}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 135
    .local v0, "connection":Ljava/net/HttpURLConnection;
    :goto_12
    instance-of v5, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v5, :cond_31

    .line 138
    :try_start_16
    const-string v5, "TLSv1"

    invoke-static {v5}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    .line 139
    .local v3, "sslcontext":Ljavax/net/ssl/SSLContext;
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v5, v6, v7}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_22
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_16 .. :try_end_22} :catch_39
    .catch Ljava/security/KeyManagementException; {:try_start_16 .. :try_end_22} :catch_40

    .line 145
    new-instance v4, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Z)V

    .local v4, "tlsOnly":Ljavax/net/ssl/SSLSocketFactory;
    move-object v5, v0

    .line 147
    check-cast v5, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v5, v4}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 149
    .end local v3    # "sslcontext":Ljavax/net/ssl/SSLContext;
    .end local v4    # "tlsOnly":Ljavax/net/ssl/SSLSocketFactory;
    :cond_31
    return-object v0

    .line 132
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_32
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    goto :goto_12

    .line 140
    :catch_39
    move-exception v1

    .line 141
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 142
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_40
    move-exception v1

    .line 143
    .local v1, "e":Ljava/security/KeyManagementException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v5
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
    .line 178
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/lang/String;)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static getHttpsURLConnection(Ljava/lang/String;)Ljavax/net/ssl/HttpsURLConnection;
    .registers 4
    .param p0, "urlString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    new-instance v0, Ljava/net/URL;

    const-string v1, "^[Hh][Tt][Tt][Pp]:"

    const-string v2, "https:"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 164
    .local v0, "url":Ljava/net/URL;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v1

    return-object v1
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
    .line 192
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 193
    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpsURLConnection(Ljava/net/URL;Z)Ljavax/net/ssl/HttpsURLConnection;

    move-result-object v0

    .line 196
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
    .line 210
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
    .line 241
    invoke-static {p0, p1}, Linfo/guardianproject/netcipher/NetCipher;->getHttpURLConnection(Ljava/net/URL;Z)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 242
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_b

    .line 243
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    return-object v0

    .line 245
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
    .line 84
    sget-object v0, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public static setProxy(Ljava/lang/String;I)V
    .registers 5
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I

    .prologue
    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_18

    if-lez p1, :cond_18

    .line 51
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, p0, p1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 52
    .local v0, "isa":Ljava/net/InetSocketAddress;
    new-instance v1, Ljava/net/Proxy;

    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-direct {v1, v2, v0}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    invoke-static {v1}, Linfo/guardianproject/netcipher/NetCipher;->setProxy(Ljava/net/Proxy;)V

    .line 56
    .end local v0    # "isa":Ljava/net/InetSocketAddress;
    :cond_17
    :goto_17
    return-void

    .line 53
    :cond_18
    sget-object v1, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    sget-object v2, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    if-eq v1, v2, :cond_17

    .line 54
    const/4 v1, 0x0

    invoke-static {v1}, Linfo/guardianproject/netcipher/NetCipher;->setProxy(Ljava/net/Proxy;)V

    goto :goto_17
.end method

.method public static setProxy(Ljava/net/Proxy;)V
    .registers 3
    .param p0, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 71
    if-eqz p0, :cond_10

    sget-object v0, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    sget-object v1, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    if-ne v0, v1, :cond_10

    .line 72
    const-string v0, "NetCipher"

    const-string v1, "useTor is enabled, ignoring new proxy settings!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :goto_f
    return-void

    .line 74
    :cond_10
    sput-object p0, Linfo/guardianproject/netcipher/NetCipher;->proxy:Ljava/net/Proxy;

    goto :goto_f
.end method

.method public static useTor()V
    .registers 1

    .prologue
    .line 108
    sget-object v0, Linfo/guardianproject/netcipher/NetCipher;->ORBOT_HTTP_PROXY:Ljava/net/Proxy;

    invoke-static {v0}, Linfo/guardianproject/netcipher/NetCipher;->setProxy(Ljava/net/Proxy;)V

    .line 109
    return-void
.end method
