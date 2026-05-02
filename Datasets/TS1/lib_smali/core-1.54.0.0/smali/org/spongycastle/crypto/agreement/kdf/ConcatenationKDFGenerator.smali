.class public Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;
.super Ljava/lang/Object;
.source "ConcatenationKDFGenerator.java"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationFunction;


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private hLen:I

.field private otherInfo:[B

.field private shared:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .registers 3
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 27
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    .line 28
    return-void
.end method

.method private ItoOSP(I[B)V
    .registers 5
    .param p1, "i"    # I
    .param p2, "sp"    # [B

    .prologue
    .line 61
    const/4 v0, 0x0

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 62
    const/4 v0, 0x1

    ushr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 63
    const/4 v0, 0x2

    ushr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 64
    const/4 v0, 0x3

    ushr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 65
    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .registers 13
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
    const/4 v8, 0x0

    .line 79
    array-length v5, p1

    sub-int/2addr v5, p3

    if-ge v5, p2, :cond_d

    .line 81
    new-instance v5, Lorg/spongycastle/crypto/DataLengthException;

    const-string v6, "output buffer too small"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 84
    :cond_d
    iget v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    new-array v3, v5, [B

    .line 85
    .local v3, "hashBuf":[B
    const/4 v5, 0x4

    new-array v0, v5, [B

    .line 86
    .local v0, "C":[B
    const/4 v1, 0x1

    .line 87
    .local v1, "counter":I
    const/4 v4, 0x0

    .line 89
    .local v4, "outputLen":I
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 91
    iget v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    if-le p3, v5, :cond_54

    .line 95
    :goto_1f
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->ItoOSP(I[B)V

    .line 97
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    array-length v6, v0

    invoke-interface {v5, v0, v8, v6}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 98
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    array-length v7, v7

    invoke-interface {v5, v6, v8, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 99
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    array-length v7, v7

    invoke-interface {v5, v6, v8, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 101
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5, v3, v8}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 103
    add-int v5, p2, v4

    iget v6, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    invoke-static {v3, v8, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    iget v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    add-int/2addr v4, v5

    .line 106
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "counter":I
    .local v2, "counter":I
    iget v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    div-int v5, p3, v5

    if-lt v1, v5, :cond_80

    move v1, v2

    .line 109
    .end local v2    # "counter":I
    .restart local v1    # "counter":I
    :cond_54
    if-ge v4, p3, :cond_7f

    .line 111
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->ItoOSP(I[B)V

    .line 113
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    array-length v6, v0

    invoke-interface {v5, v0, v8, v6}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 114
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    array-length v7, v7

    invoke-interface {v5, v6, v8, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 115
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v6, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    array-length v7, v7

    invoke-interface {v5, v6, v8, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 117
    iget-object v5, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v5, v3, v8}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 119
    add-int v5, p2, v4

    sub-int v6, p3, v4

    invoke-static {v3, v8, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 122
    :cond_7f
    return p3

    .end local v1    # "counter":I
    .restart local v2    # "counter":I
    :cond_80
    move v1, v2

    .end local v2    # "counter":I
    .restart local v1    # "counter":I
    goto :goto_1f
.end method

.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .registers 5
    .param p1, "param"    # Lorg/spongycastle/crypto/DerivationParameters;

    .prologue
    .line 33
    instance-of v1, p1, Lorg/spongycastle/crypto/params/KDFParameters;

    if-eqz v1, :cond_14

    move-object v0, p1

    .line 35
    check-cast v0, Lorg/spongycastle/crypto/params/KDFParameters;

    .line 37
    .local v0, "p":Lorg/spongycastle/crypto/params/KDFParameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KDFParameters;->getSharedSecret()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    .line 38
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KDFParameters;->getIV()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    .line 44
    return-void

    .line 42
    .end local v0    # "p":Lorg/spongycastle/crypto/params/KDFParameters;
    :cond_14
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "KDF parameters required for KDF2Generator"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
