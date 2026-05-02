.class public Lorg/spongycastle/crypto/digests/SHAKEDigest;
.super Lorg/spongycastle/crypto/digests/KeccakDigest;
.source "SHAKEDigest.java"

# interfaces
.implements Lorg/spongycastle/crypto/Xof;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    const/16 v0, 0x80

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;-><init>(I)V

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "bitLength"    # I

    .prologue
    .line 34
    invoke-static {p1}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->checkBitLength(I)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(I)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SHAKEDigest;)V
    .registers 2
    .param p1, "source"    # Lorg/spongycastle/crypto/digests/SHAKEDigest;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(Lorg/spongycastle/crypto/digests/KeccakDigest;)V

    .line 39
    return-void
.end method

.method private static checkBitLength(I)I
    .registers 4
    .param p0, "bitLength"    # I

    .prologue
    .line 17
    sparse-switch p0, :sswitch_data_24

    .line 23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\'bitLength\' "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported for SHAKE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :sswitch_22
    return p0

    .line 17
    nop

    :sswitch_data_24
    .sparse-switch
        0x80 -> :sswitch_22
        0x100 -> :sswitch_22
    .end sparse-switch
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 4
    .param p1, "out"    # [B
    .param p2, "outOff"    # I

    .prologue
    .line 48
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->getDigestSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->doFinal([BII)I

    move-result v0

    return v0
.end method

.method protected doFinal([BIBI)I
    .registers 11
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "partialByte"    # B
    .param p4, "partialBits"    # I

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->getDigestSize()I

    move-result v3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->doFinal([BIIBI)I

    move-result v0

    return v0
.end method

.method public doFinal([BII)I
    .registers 8
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "outLen"    # I

    .prologue
    const/4 v3, 0x0

    .line 53
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/16 v1, 0xf

    aput-byte v1, v0, v3

    const-wide/16 v1, 0x4

    invoke-virtual {p0, v0, v3, v1, v2}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->absorb([BIJ)V

    .line 55
    int-to-long v0, p3

    const-wide/16 v2, 0x8

    mul-long/2addr v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->squeeze([BIJ)V

    .line 57
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->reset()V

    .line 59
    return p3
.end method

.method protected doFinal([BIIBI)I
    .registers 14
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "outLen"    # I
    .param p4, "partialByte"    # B
    .param p5, "partialBits"    # I

    .prologue
    const-wide/16 v6, 0x8

    const/4 v5, 0x0

    .line 75
    if-ltz p5, :cond_8

    const/4 v2, 0x7

    if-le p5, v2, :cond_10

    .line 77
    :cond_8
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'partialBits\' must be in the range [0,7]"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_10
    const/4 v2, 0x1

    shl-int/2addr v2, p5

    add-int/lit8 v2, v2, -0x1

    and-int/2addr v2, p4

    const/16 v3, 0xf

    shl-int/2addr v3, p5

    or-int v1, v2, v3

    .line 81
    .local v1, "finalInput":I
    add-int/lit8 v0, p5, 0x4

    .line 83
    .local v0, "finalBits":I
    const/16 v2, 0x8

    if-lt v0, v2, :cond_2e

    .line 85
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHAKEDigest;->oneByte:[B

    int-to-byte v3, v1

    aput-byte v3, v2, v5

    .line 86
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHAKEDigest;->oneByte:[B

    invoke-virtual {p0, v2, v5, v6, v7}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->absorb([BIJ)V

    .line 87
    add-int/lit8 v0, v0, -0x8

    .line 88
    ushr-int/lit8 v1, v1, 0x8

    .line 91
    :cond_2e
    if-lez v0, :cond_3b

    .line 93
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHAKEDigest;->oneByte:[B

    int-to-byte v3, v1

    aput-byte v3, v2, v5

    .line 94
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHAKEDigest;->oneByte:[B

    int-to-long v3, v0

    invoke-virtual {p0, v2, v5, v3, v4}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->absorb([BIJ)V

    .line 97
    :cond_3b
    int-to-long v2, p3

    mul-long/2addr v2, v6

    invoke-virtual {p0, p1, p2, v2, v3}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->squeeze([BIJ)V

    .line 99
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->reset()V

    .line 101
    return p3
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SHAKE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/crypto/digests/SHAKEDigest;->fixedOutputLength:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
