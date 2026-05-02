.class public final Lcom/squareup/okhttp/ConnectionSpec;
.super Ljava/lang/Object;
.source "ConnectionSpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/ConnectionSpec$Builder;
    }
.end annotation


# static fields
.field private static final APPROVED_CIPHER_SUITES:[Lcom/squareup/okhttp/CipherSuite;

.field public static final CLEARTEXT:Lcom/squareup/okhttp/ConnectionSpec;

.field public static final COMPATIBLE_TLS:Lcom/squareup/okhttp/ConnectionSpec;

.field public static final MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;


# instance fields
.field private final cipherSuites:[Ljava/lang/String;

.field private final supportsTlsExtensions:Z

.field private final tls:Z

.field private final tlsVersions:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 43
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/squareup/okhttp/CipherSuite;

    sget-object v1, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v1, v0, v6

    const/4 v1, 0x4

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_3DES_EDE_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v0, v1

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->APPROVED_CIPHER_SUITES:[Lcom/squareup/okhttp/CipherSuite;

    .line 64
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v0, v3}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Z)V

    sget-object v1, Lcom/squareup/okhttp/ConnectionSpec;->APPROVED_CIPHER_SUITES:[Lcom/squareup/okhttp/CipherSuite;

    .line 65
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites([Lcom/squareup/okhttp/CipherSuite;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    new-array v1, v6, [Lcom/squareup/okhttp/TlsVersion;

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_2:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v4

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_1:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v3

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_0:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v5

    .line 66
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Lcom/squareup/okhttp/TlsVersion;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 67
    invoke-virtual {v0, v3}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions(Z)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    .line 71
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    sget-object v1, Lcom/squareup/okhttp/ConnectionSpec;->MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Lcom/squareup/okhttp/ConnectionSpec;)V

    new-array v1, v3, [Lcom/squareup/okhttp/TlsVersion;

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_0:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v4

    .line 72
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Lcom/squareup/okhttp/TlsVersion;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 73
    invoke-virtual {v0, v3}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions(Z)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->COMPATIBLE_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    .line 77
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v0, v4}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Z)V

    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->CLEARTEXT:Lcom/squareup/okhttp/ConnectionSpec;

    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$000(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    .line 86
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$100(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 87
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$200(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    .line 88
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions:Z
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$300(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    .line 89
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;Lcom/squareup/okhttp/ConnectionSpec$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/ConnectionSpec$1;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionSpec;-><init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;)V

    return-void
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/ConnectionSpec;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    return v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/squareup/okhttp/ConnectionSpec;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    return v0
.end method

.method private static nonEmptyIntersection([Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 7
    .param p0, "a"    # [Ljava/lang/String;
    .param p1, "b"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 198
    if-eqz p0, :cond_b

    if-eqz p1, :cond_b

    array-length v2, p0

    if-eqz v2, :cond_b

    array-length v2, p1

    if-nez v2, :cond_c

    .line 206
    :cond_b
    :goto_b
    return v1

    .line 201
    :cond_c
    array-length v3, p0

    move v2, v1

    :goto_e
    if-ge v2, v3, :cond_b

    aget-object v0, p0, v2

    .line 202
    .local v0, "toFind":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/squareup/okhttp/internal/Util;->contains([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 203
    const/4 v1, 0x1

    goto :goto_b

    .line 201
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_e
.end method

.method private supportedSpec(Ljavax/net/ssl/SSLSocket;Z)Lcom/squareup/okhttp/ConnectionSpec;
    .registers 8
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "isFallback"    # Z

    .prologue
    .line 144
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-eqz v2, :cond_4c

    const-class v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 145
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/squareup/okhttp/internal/Util;->intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    move-object v0, v2

    .line 147
    .local v0, "cipherSuitesIntersection":[Ljava/lang/String;
    :goto_13
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    if-eqz v2, :cond_51

    const-class v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    .line 148
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/squareup/okhttp/internal/Util;->intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    move-object v1, v2

    .line 153
    .local v1, "tlsVersionsIntersection":[Ljava/lang/String;
    :goto_26
    if-eqz p2, :cond_3a

    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v2

    const-string v3, "TLS_FALLBACK_SCSV"

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->contains([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 154
    const-string v2, "TLS_FALLBACK_SCSV"

    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/Util;->concat([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 157
    :cond_3a
    new-instance v2, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v2, p0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Lcom/squareup/okhttp/ConnectionSpec;)V

    .line 158
    invoke-virtual {v2, v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v2

    .line 159
    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v2

    .line 160
    invoke-virtual {v2}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v2

    return-object v2

    .line 146
    .end local v0    # "cipherSuitesIntersection":[Ljava/lang/String;
    .end local v1    # "tlsVersionsIntersection":[Ljava/lang/String;
    :cond_4c
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    goto :goto_13

    .line 149
    .restart local v0    # "cipherSuitesIntersection":[Ljava/lang/String;
    :cond_51
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v1

    goto :goto_26
.end method


# virtual methods
.method apply(Ljavax/net/ssl/SSLSocket;Z)V
    .registers 5
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "isFallback"    # Z

    .prologue
    .line 129
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/ConnectionSpec;->supportedSpec(Ljavax/net/ssl/SSLSocket;Z)Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    .line 131
    .local v0, "specToApply":Lcom/squareup/okhttp/ConnectionSpec;
    iget-object v1, v0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    if-eqz v1, :cond_d

    .line 132
    iget-object v1, v0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 134
    :cond_d
    iget-object v1, v0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-eqz v1, :cond_16

    .line 135
    iget-object v1, v0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 137
    :cond_16
    return-void
.end method

.method public cipherSuites()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/CipherSuite;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-nez v2, :cond_6

    const/4 v2, 0x0

    .line 106
    :goto_5
    return-object v2

    .line 102
    :cond_6
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    array-length v2, v2

    new-array v1, v2, [Lcom/squareup/okhttp/CipherSuite;

    .line 103
    .local v1, "result":[Lcom/squareup/okhttp/CipherSuite;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1e

    .line 104
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/squareup/okhttp/CipherSuite;->forJavaName(Ljava/lang/String;)Lcom/squareup/okhttp/CipherSuite;

    move-result-object v2

    aput-object v2, v1, v0

    .line 103
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 106
    :cond_1e
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_5
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 210
    instance-of v3, p1, Lcom/squareup/okhttp/ConnectionSpec;

    if-nez v3, :cond_7

    .line 222
    :cond_6
    :goto_6
    return v1

    .line 211
    :cond_7
    if-ne p1, p0, :cond_b

    move v1, v2

    goto :goto_6

    :cond_b
    move-object v0, p1

    .line 213
    check-cast v0, Lcom/squareup/okhttp/ConnectionSpec;

    .line 214
    .local v0, "that":Lcom/squareup/okhttp/ConnectionSpec;
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    iget-boolean v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-ne v3, v4, :cond_6

    .line 216
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-eqz v3, :cond_32

    .line 217
    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    iget-object v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 218
    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    iget-object v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 219
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    iget-boolean v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    if-ne v3, v4, :cond_6

    :cond_32
    move v1, v2

    .line 222
    goto :goto_6
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 226
    const/16 v0, 0x11

    .line 227
    .local v0, "result":I
    iget-boolean v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-eqz v1, :cond_21

    .line 228
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 229
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int v0, v1, v2

    .line 230
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    if-eqz v1, :cond_22

    const/4 v1, 0x0

    :goto_1f
    add-int v0, v2, v1

    .line 232
    :cond_21
    return v0

    .line 230
    :cond_22
    const/4 v1, 0x1

    goto :goto_1f
.end method

.method public isCompatible(Ljavax/net/ssl/SSLSocket;)Z
    .registers 5
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v0, 0x0

    .line 175
    iget-boolean v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-nez v1, :cond_6

    .line 189
    :cond_5
    :goto_5
    return v0

    .line 179
    :cond_6
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    .line 180
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/squareup/okhttp/ConnectionSpec;->nonEmptyIntersection([Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 184
    :cond_16
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-eqz v1, :cond_26

    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 185
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/squareup/okhttp/ConnectionSpec;->nonEmptyIntersection([Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 189
    :cond_26
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public isTls()Z
    .registers 2

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    return v0
.end method

.method public supportsTlsExtensions()Z
    .registers 2

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    return v0
.end method

.method public tlsVersions()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/TlsVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    if-nez v2, :cond_6

    const/4 v2, 0x0

    .line 120
    :goto_5
    return-object v2

    .line 116
    :cond_6
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    array-length v2, v2

    new-array v1, v2, [Lcom/squareup/okhttp/TlsVersion;

    .line 117
    .local v1, "result":[Lcom/squareup/okhttp/TlsVersion;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1e

    .line 118
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/squareup/okhttp/TlsVersion;->forJavaName(Ljava/lang/String;)Lcom/squareup/okhttp/TlsVersion;

    move-result-object v2

    aput-object v2, v1, v0

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 120
    :cond_1e
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 236
    iget-boolean v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-nez v2, :cond_7

    .line 237
    const-string v2, "ConnectionSpec()"

    .line 242
    :goto_6
    return-object v2

    .line 240
    :cond_7
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-eqz v2, :cond_4f

    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "cipherSuitesString":Ljava/lang/String;
    :goto_13
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    if-eqz v2, :cond_52

    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "tlsVersionsString":Ljava/lang/String;
    :goto_1f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ConnectionSpec(cipherSuites="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", tlsVersions="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", supportsTlsExtensions="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    .line 240
    .end local v0    # "cipherSuitesString":Ljava/lang/String;
    .end local v1    # "tlsVersionsString":Ljava/lang/String;
    :cond_4f
    const-string v0, "[all enabled]"

    goto :goto_13

    .line 241
    .restart local v0    # "cipherSuitesString":Ljava/lang/String;
    :cond_52
    const-string v1, "[all enabled]"

    goto :goto_1f
.end method
