.class public Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;
.super Lorg/spongycastle/crypto/CipherKeyGenerator;
.source "Poly1305KeyGenerator.java"


# static fields
.field private static final R_MASK_HIGH_4:B = 0xft

.field private static final R_MASK_LOW_2:B = -0x4t


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/spongycastle/crypto/CipherKeyGenerator;-><init>()V

    return-void
.end method

.method public static checkKey([B)V
    .registers 5
    .param p0, "key"    # [B

    .prologue
    const/4 v3, -0x4

    const/16 v2, 0xf

    .line 94
    array-length v0, p0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_10

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Poly1305 key must be 256 bits."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_10
    const/16 v0, 0x13

    aget-byte v0, p0, v0

    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 100
    const/16 v0, 0x17

    aget-byte v0, p0, v0

    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 101
    const/16 v0, 0x1b

    aget-byte v0, p0, v0

    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 102
    const/16 v0, 0x1f

    aget-byte v0, p0, v0

    invoke-static {v0, v2}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 104
    const/16 v0, 0x14

    aget-byte v0, p0, v0

    invoke-static {v0, v3}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 105
    const/16 v0, 0x18

    aget-byte v0, p0, v0

    invoke-static {v0, v3}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 106
    const/16 v0, 0x1c

    aget-byte v0, p0, v0

    invoke-static {v0, v3}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 107
    return-void
.end method

.method private static checkMask(BB)V
    .registers 4
    .param p0, "b"    # B
    .param p1, "mask"    # B

    .prologue
    .line 111
    xor-int/lit8 v0, p1, -0x1

    and-int/2addr v0, p0

    if-eqz v0, :cond_d

    .line 113
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid format for r portion of Poly1305 key."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_d
    return-void
.end method

.method public static clamp([B)V
    .registers 3
    .param p0, "key"    # [B

    .prologue
    .line 63
    array-length v0, p0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_d

    .line 65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Poly1305 key must be 256 bits."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_d
    const/16 v0, 0x13

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, 0xf

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 72
    const/16 v0, 0x17

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, 0xf

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 73
    const/16 v0, 0x1b

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, 0xf

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 74
    const/16 v0, 0x1f

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, 0xf

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 79
    const/16 v0, 0x14

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, -0x4

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 80
    const/16 v0, 0x18

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, -0x4

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 81
    const/16 v0, 0x1c

    aget-byte v1, p0, v0

    and-int/lit8 v1, v1, -0x4

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 82
    return-void
.end method


# virtual methods
.method public generateKey()[B
    .registers 2

    .prologue
    .line 42
    invoke-super {p0}, Lorg/spongycastle/crypto/CipherKeyGenerator;->generateKey()[B

    move-result-object v0

    .line 43
    .local v0, "key":[B
    invoke-static {v0}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->clamp([B)V

    .line 44
    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .registers 5
    .param p1, "param"    # Lorg/spongycastle/crypto/KeyGenerationParameters;

    .prologue
    .line 32
    new-instance v0, Lorg/spongycastle/crypto/KeyGenerationParameters;

    invoke-virtual {p1}, Lorg/spongycastle/crypto/KeyGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    move-result-object v1

    const/16 v2, 0x100

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    invoke-super {p0, v0}, Lorg/spongycastle/crypto/CipherKeyGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 33
    return-void
.end method
