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
.field public static final CLEARTEXT:Lcom/squareup/okhttp/ConnectionSpec;

.field public static final COMPATIBLE_TLS:Lcom/squareup/okhttp/ConnectionSpec;

.field public static final MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;


# instance fields
.field private final cipherSuites:[Ljava/lang/String;

.field final supportsTlsExtensions:Z

.field final tls:Z

.field private final tlsVersions:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 32
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v0, v4}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Z)V

    const/16 v1, 0xe

    new-array v1, v1, [Lcom/squareup/okhttp/CipherSuite;

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v1, v5

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v1, v4

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v1, v6

    sget-object v2, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v2, v1, v7

    const/4 v2, 0x4

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/4 v2, 0x6

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/4 v2, 0x7

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0x8

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_DSS_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0x9

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_DHE_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0xa

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_128_GCM_SHA256:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0xb

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_128_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0xc

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_AES_256_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    const/16 v2, 0xd

    sget-object v3, Lcom/squareup/okhttp/CipherSuite;->TLS_RSA_WITH_3DES_EDE_CBC_SHA:Lcom/squareup/okhttp/CipherSuite;

    aput-object v3, v1, v2

    .line 33
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites([Lcom/squareup/okhttp/CipherSuite;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    new-array v1, v7, [Lcom/squareup/okhttp/TlsVersion;

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_2:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v5

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_1:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v4

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_0:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v6

    .line 56
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Lcom/squareup/okhttp/TlsVersion;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 57
    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions(Z)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    .line 61
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    sget-object v1, Lcom/squareup/okhttp/ConnectionSpec;->MODERN_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Lcom/squareup/okhttp/ConnectionSpec;)V

    new-array v1, v4, [Lcom/squareup/okhttp/TlsVersion;

    sget-object v2, Lcom/squareup/okhttp/TlsVersion;->TLS_1_0:Lcom/squareup/okhttp/TlsVersion;

    aput-object v2, v1, v5

    .line 62
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Lcom/squareup/okhttp/TlsVersion;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 63
    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions(Z)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->COMPATIBLE_TLS:Lcom/squareup/okhttp/ConnectionSpec;

    .line 67
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v0, v5}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Z)V

    invoke-virtual {v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/ConnectionSpec;->CLEARTEXT:Lcom/squareup/okhttp/ConnectionSpec;

    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$000(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    .line 84
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$100(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 85
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$200(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    .line 86
    # getter for: Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions:Z
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->access$300(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    .line 87
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;Lcom/squareup/okhttp/ConnectionSpec$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/ConnectionSpec$1;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionSpec;-><init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;)V

    return-void
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    return-object v0
.end method

.method private supportedSpec(Ljavax/net/ssl/SSLSocket;)Lcom/squareup/okhttp/ConnectionSpec;
    .registers 8
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "cipherSuitesToEnable":[Ljava/lang/String;
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-eqz v4, :cond_13

    .line 164
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "cipherSuitesToSelectFrom":[Ljava/lang/String;
    const-class v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 166
    invoke-static {v4, v5, v1}, Lcom/squareup/okhttp/internal/Util;->intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cipherSuitesToEnable":[Ljava/lang/String;
    check-cast v0, [Ljava/lang/String;

    .line 169
    .end local v1    # "cipherSuitesToSelectFrom":[Ljava/lang/String;
    .restart local v0    # "cipherSuitesToEnable":[Ljava/lang/String;
    :cond_13
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v2

    .line 170
    .local v2, "protocolsToSelectFrom":[Ljava/lang/String;
    const-class v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-static {v4, v5, v2}, Lcom/squareup/okhttp/internal/Util;->intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 171
    .local v3, "tlsVersionsToEnable":[Ljava/lang/String;
    new-instance v4, Lcom/squareup/okhttp/ConnectionSpec$Builder;

    invoke-direct {v4, p0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Lcom/squareup/okhttp/ConnectionSpec;)V

    .line 172
    invoke-virtual {v4, v0}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v4

    .line 173
    invoke-virtual {v4, v3}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v4

    .line 174
    invoke-virtual {v4}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->build()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method apply(Ljavax/net/ssl/SSLSocket;Lcom/squareup/okhttp/Route;)V
    .registers 13
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "route"    # Lcom/squareup/okhttp/Route;

    .prologue
    const/4 v9, 0x0

    .line 122
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionSpec;->supportedSpec(Ljavax/net/ssl/SSLSocket;)Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v6

    .line 124
    .local v6, "specToApply":Lcom/squareup/okhttp/ConnectionSpec;
    iget-object v7, v6, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 126
    iget-object v0, v6, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    .line 127
    .local v0, "cipherSuitesToEnable":[Ljava/lang/String;
    iget-boolean v7, p2, Lcom/squareup/okhttp/Route;->shouldSendTlsFallbackIndicator:Z

    if-eqz v7, :cond_36

    .line 130
    const-string v1, "TLS_FALLBACK_SCSV"

    .line 132
    .local v1, "fallbackScsv":Ljava/lang/String;
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const-string v8, "TLS_FALLBACK_SCSV"

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    .line 134
    .local v5, "socketSupportsFallbackScsv":Z
    if-eqz v5, :cond_36

    .line 136
    if-eqz v0, :cond_4f

    move-object v3, v0

    .line 139
    .local v3, "oldEnabledCipherSuites":[Ljava/lang/String;
    :goto_25
    array-length v7, v3

    add-int/lit8 v7, v7, 0x1

    new-array v2, v7, [Ljava/lang/String;

    .line 140
    .local v2, "newEnabledCipherSuites":[Ljava/lang/String;
    array-length v7, v3

    invoke-static {v3, v9, v2, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    const-string v8, "TLS_FALLBACK_SCSV"

    aput-object v8, v2, v7

    .line 143
    move-object v0, v2

    .line 147
    .end local v1    # "fallbackScsv":Ljava/lang/String;
    .end local v2    # "newEnabledCipherSuites":[Ljava/lang/String;
    .end local v3    # "oldEnabledCipherSuites":[Ljava/lang/String;
    .end local v5    # "socketSupportsFallbackScsv":Z
    :cond_36
    if-eqz v0, :cond_3b

    .line 148
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 151
    :cond_3b
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    .line 152
    .local v4, "platform":Lcom/squareup/okhttp/internal/Platform;
    iget-boolean v7, v6, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    if-eqz v7, :cond_4e

    .line 153
    iget-object v7, p2, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v7, v7, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    iget-object v8, p2, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v8, v8, Lcom/squareup/okhttp/Address;->protocols:Ljava/util/List;

    invoke-virtual {v4, p1, v7, v8}, Lcom/squareup/okhttp/internal/Platform;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    .line 155
    :cond_4e
    return-void

    .line 138
    .end local v4    # "platform":Lcom/squareup/okhttp/internal/Platform;
    .restart local v1    # "fallbackScsv":Ljava/lang/String;
    .restart local v5    # "socketSupportsFallbackScsv":Z
    :cond_4f
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v3

    goto :goto_25
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
    .line 98
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    if-nez v2, :cond_6

    .line 99
    const/4 v2, 0x0

    .line 105
    :goto_5
    return-object v2

    .line 101
    :cond_6
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    array-length v2, v2

    new-array v1, v2, [Lcom/squareup/okhttp/CipherSuite;

    .line 102
    .local v1, "result":[Lcom/squareup/okhttp/CipherSuite;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1e

    .line 103
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/squareup/okhttp/CipherSuite;->forJavaName(Ljava/lang/String;)Lcom/squareup/okhttp/CipherSuite;

    move-result-object v2

    aput-object v2, v1, v0

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 105
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

    .line 178
    instance-of v3, p1, Lcom/squareup/okhttp/ConnectionSpec;

    if-nez v3, :cond_7

    .line 190
    :cond_6
    :goto_6
    return v1

    .line 179
    :cond_7
    if-ne p1, p0, :cond_b

    move v1, v2

    goto :goto_6

    :cond_b
    move-object v0, p1

    .line 181
    check-cast v0, Lcom/squareup/okhttp/ConnectionSpec;

    .line 182
    .local v0, "that":Lcom/squareup/okhttp/ConnectionSpec;
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    iget-boolean v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-ne v3, v4, :cond_6

    .line 184
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-eqz v3, :cond_32

    .line 185
    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    iget-object v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 186
    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    iget-object v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 187
    iget-boolean v3, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    iget-boolean v4, v0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    if-ne v3, v4, :cond_6

    :cond_32
    move v1, v2

    .line 190
    goto :goto_6
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 194
    const/16 v0, 0x11

    .line 195
    .local v0, "result":I
    iget-boolean v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-eqz v1, :cond_21

    .line 196
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 197
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int v0, v1, v2

    .line 198
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v1, p0, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    if-eqz v1, :cond_22

    const/4 v1, 0x0

    :goto_1f
    add-int v0, v2, v1

    .line 200
    :cond_21
    return v0

    .line 198
    :cond_22
    const/4 v1, 0x1

    goto :goto_1f
.end method

.method public isTls()Z
    .registers 2

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    return v0
.end method

.method public supportsTlsExtensions()Z
    .registers 2

    .prologue
    .line 117
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
    .line 109
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    array-length v2, v2

    new-array v1, v2, [Lcom/squareup/okhttp/TlsVersion;

    .line 110
    .local v1, "result":[Lcom/squareup/okhttp/TlsVersion;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 111
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/squareup/okhttp/TlsVersion;->forJavaName(Ljava/lang/String;)Lcom/squareup/okhttp/TlsVersion;

    move-result-object v2

    aput-object v2, v1, v0

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 113
    :cond_18
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 204
    iget-boolean v2, p0, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    if-eqz v2, :cond_45

    .line 205
    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites()Ljava/util/List;

    move-result-object v0

    .line 206
    .local v0, "cipherSuites":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/CipherSuite;>;"
    if-nez v0, :cond_40

    const-string v1, "[use default]"

    .line 207
    .local v1, "cipherSuitesString":Ljava/lang/String;
    :goto_c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ConnectionSpec(cipherSuites="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", tlsVersions="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 208
    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

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

    .line 212
    .end local v0    # "cipherSuites":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/CipherSuite;>;"
    .end local v1    # "cipherSuitesString":Ljava/lang/String;
    :goto_3f
    return-object v2

    .line 206
    .restart local v0    # "cipherSuites":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/CipherSuite;>;"
    :cond_40
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 212
    .end local v0    # "cipherSuites":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/CipherSuite;>;"
    :cond_45
    const-string v2, "ConnectionSpec()"

    goto :goto_3f
.end method
