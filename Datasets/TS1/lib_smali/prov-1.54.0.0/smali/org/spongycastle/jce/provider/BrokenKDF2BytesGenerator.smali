.class public Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;
.super Ljava/lang/Object;
.source "BrokenKDF2BytesGenerator.java"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationFunction;


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private iv:[B

.field private shared:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .registers 2
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 38
    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .registers 14
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 75
    array-length v5, p1

    sub-int/2addr v5, p3

    if-ge v5, p2, :cond_d

    .line 77
    new-instance v5, Lorg/spongycastle/crypto/DataLengthException;

    const-string v6, "output buffer too small"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 80
    :cond_d
    mul-int/lit8 v5, p3, 0x8

    int-to-long v3, v5

    .line 88
    .local v3, "oBits":J
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    int-to-long v5, v5

    const-wide/16 v7, 0x1d

    mul-long/2addr v5, v7

    cmp-long v5, v3, v5

    if-lez v5, :cond_27

    .line 90
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Output length to large"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 93
    :cond_27
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v5

    int-to-long v5, v5

    div-long v5, v3, v5

    long-to-int v0, v5

    .line 95
    .local v0, "cThreshold":I
    const/4 v2, 0x0

    .line 97
    .local v2, "dig":[B
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v5

    new-array v2, v5, [B

    .line 99
    const/4 v1, 0x1

    .local v1, "counter":I
    :goto_3b
    if-gt v1, v0, :cond_90

    .line 101
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->shared:[B

    iget-object v7, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->shared:[B

    array-length v7, v7

    invoke-interface {v5, v6, v9, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 103
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    and-int/lit16 v6, v1, 0xff

    int-to-byte v6, v6

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 104
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    shr-int/lit8 v6, v1, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 105
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    shr-int/lit8 v6, v1, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 106
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    shr-int/lit8 v6, v1, 0x18

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 108
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->iv:[B

    iget-object v7, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->iv:[B

    array-length v7, v7

    invoke-interface {v5, v6, v9, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 110
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5, v2, v9}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 112
    sub-int v5, p3, p2

    array-length v6, v2

    if-le v5, v6, :cond_8a

    .line 114
    array-length v5, v2

    invoke-static {v2, v9, p1, p2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    array-length v5, v2

    add-int/2addr p2, v5

    .line 99
    :goto_87
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 119
    :cond_8a
    sub-int v5, p3, p2

    invoke-static {v2, v9, p1, p2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_87

    .line 123
    :cond_90
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 125
    return p3
.end method

.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .registers 5
    .param p1, "param"    # Lorg/spongycastle/crypto/DerivationParameters;

    .prologue
    .line 43
    instance-of v1, p1, Lorg/spongycastle/crypto/params/KDFParameters;

    if-nez v1, :cond_c

    .line 45
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "KDF parameters required for KDF2Generator"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_c
    move-object v0, p1

    .line 48
    check-cast v0, Lorg/spongycastle/crypto/params/KDFParameters;

    .line 50
    .local v0, "p":Lorg/spongycastle/crypto/params/KDFParameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KDFParameters;->getSharedSecret()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->shared:[B

    .line 51
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KDFParameters;->getIV()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenKDF2BytesGenerator;->iv:[B

    .line 52
    return-void
.end method
