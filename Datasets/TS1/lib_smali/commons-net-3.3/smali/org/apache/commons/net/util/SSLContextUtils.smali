.class public Lorg/apache/commons/net/util/SSLContextUtils;
.super Ljava/lang/Object;
.source "SSLContextUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static createSSLContext(Ljava/lang/String;Ljavax/net/ssl/KeyManager;Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLContext;
    .registers 7
    .param p0, "protocol"    # Ljava/lang/String;
    .param p1, "keyManager"    # Ljavax/net/ssl/KeyManager;
    .param p2, "trustManager"    # Ljavax/net/ssl/TrustManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    if-nez p1, :cond_d

    move-object v1, v0

    :goto_6
    if-nez p2, :cond_12

    :goto_8
    invoke-static {p0, v1, v0}, Lorg/apache/commons/net/util/SSLContextUtils;->createSSLContext(Ljava/lang/String;[Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    return-object v0

    :cond_d
    new-array v1, v3, [Ljavax/net/ssl/KeyManager;

    aput-object p1, v1, v2

    goto :goto_6

    :cond_12
    new-array v0, v3, [Ljavax/net/ssl/TrustManager;

    aput-object p2, v0, v2

    goto :goto_8
.end method

.method public static createSSLContext(Ljava/lang/String;[Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLContext;
    .registers 7
    .param p0, "protocol"    # Ljava/lang/String;
    .param p1, "keyManagers"    # [Ljavax/net/ssl/KeyManager;
    .param p2, "trustManagers"    # [Ljavax/net/ssl/TrustManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    invoke-static {p0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 64
    .local v0, "ctx":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    invoke-virtual {v0, p1, p2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_8} :catch_9

    .line 70
    return-object v0

    .line 65
    .end local v0    # "ctx":Ljavax/net/ssl/SSLContext;
    :catch_9
    move-exception v1

    .line 66
    .local v1, "e":Ljava/security/GeneralSecurityException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Could not initialize SSL context"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 67
    .local v2, "ioe":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 68
    throw v2
.end method
