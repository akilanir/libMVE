.class public final Lokhttp3/internal/tls/AndroidTrustRootIndex;
.super Ljava/lang/Object;
.source "AndroidTrustRootIndex.java"

# interfaces
.implements Lokhttp3/internal/tls/TrustRootIndex;


# instance fields
.field private final findByIssuerAndSignatureMethod:Ljava/lang/reflect/Method;

.field private final trustManager:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method public constructor <init>(Ljavax/net/ssl/X509TrustManager;Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "trustManager"    # Ljavax/net/ssl/X509TrustManager;
    .param p2, "findByIssuerAndSignatureMethod"    # Ljava/lang/reflect/Method;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p2, p0, Lokhttp3/internal/tls/AndroidTrustRootIndex;->findByIssuerAndSignatureMethod:Ljava/lang/reflect/Method;

    .line 36
    iput-object p1, p0, Lokhttp3/internal/tls/AndroidTrustRootIndex;->trustManager:Ljavax/net/ssl/X509TrustManager;

    .line 37
    return-void
.end method

.method public static get(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/TrustRootIndex;
    .registers 8
    .param p0, "trustManager"    # Ljavax/net/ssl/X509TrustManager;

    .prologue
    .line 55
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "findTrustAnchorByIssuerAndSignature"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/security/cert/X509Certificate;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 57
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 58
    new-instance v2, Lokhttp3/internal/tls/AndroidTrustRootIndex;

    invoke-direct {v2, p0, v1}, Lokhttp3/internal/tls/AndroidTrustRootIndex;-><init>(Ljavax/net/ssl/X509TrustManager;Ljava/lang/reflect/Method;)V
    :try_end_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_1b} :catch_1c

    .line 60
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_1b
    return-object v2

    .line 59
    :catch_1c
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v2, 0x0

    goto :goto_1b
.end method


# virtual methods
.method public findByIssuerAndSignature(Ljava/security/cert/X509Certificate;)Ljava/security/cert/X509Certificate;
    .registers 8
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 41
    :try_start_0
    iget-object v2, p0, Lokhttp3/internal/tls/AndroidTrustRootIndex;->findByIssuerAndSignatureMethod:Ljava/lang/reflect/Method;

    iget-object v3, p0, Lokhttp3/internal/tls/AndroidTrustRootIndex;->trustManager:Ljavax/net/ssl/X509TrustManager;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/TrustAnchor;

    .line 43
    .local v1, "trustAnchor":Ljava/security/cert/TrustAnchor;
    invoke-virtual {v1}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;
    :try_end_13
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_13} :catch_15
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_13} :catch_1c

    move-result-object v2

    .line 47
    .end local v1    # "trustAnchor":Ljava/security/cert/TrustAnchor;
    :goto_14
    return-object v2

    .line 44
    :catch_15
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 46
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1c
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const/4 v2, 0x0

    goto :goto_14
.end method
