.class public Lorg/spongycastle/crypto/signers/ISO9796d2Signer;
.super Ljava/lang/Object;
.source "ISO9796d2Signer.java"

# interfaces
.implements Lorg/spongycastle/crypto/SignerWithRecovery;


# static fields
.field public static final TRAILER_IMPLICIT:I = 0xbc

.field public static final TRAILER_RIPEMD128:I = 0x32cc

.field public static final TRAILER_RIPEMD160:I = 0x31cc

.field public static final TRAILER_SHA1:I = 0x33cc

.field public static final TRAILER_SHA256:I = 0x34cc

.field public static final TRAILER_SHA384:I = 0x36cc

.field public static final TRAILER_SHA512:I = 0x35cc

.field public static final TRAILER_WHIRLPOOL:I = 0x37cc


# instance fields
.field private block:[B

.field private cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private digest:Lorg/spongycastle/crypto/Digest;

.field private fullMessage:Z

.field private keyBits:I

.field private mBuf:[B

.field private messageLength:I

.field private preBlock:[B

.field private preSig:[B

.field private recoveredMessage:[B

.field private trailer:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .param p2, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Z)V

    .line 94
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Z)V
    .registers 8
    .param p1, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .param p2, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p3, "implicit"    # Z

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 62
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    .line 64
    if-eqz p3, :cond_e

    .line 66
    const/16 v1, 0xbc

    iput v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    .line 81
    :goto_d
    return-void

    .line 70
    :cond_e
    invoke-static {p2}, Lorg/spongycastle/crypto/signers/ISOTrailers;->getTrailer(Lorg/spongycastle/crypto/Digest;)Ljava/lang/Integer;

    move-result-object v0

    .line 72
    .local v0, "trailerObj":Ljava/lang/Integer;
    if-eqz v0, :cond_1b

    .line 74
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    goto :goto_d

    .line 78
    :cond_1b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no valid trailer for digest: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private clearBlock([B)V
    .registers 4
    .param p1, "block"    # [B

    .prologue
    .line 169
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-eq v0, v1, :cond_a

    .line 171
    const/4 v1, 0x0

    aput-byte v1, p1, v0

    .line 169
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 173
    :cond_a
    return-void
.end method

.method private isSameAs([B[B)Z
    .registers 7
    .param p1, "a"    # [B
    .param p2, "b"    # [B

    .prologue
    .line 127
    const/4 v1, 0x1

    .line 129
    .local v1, "isOkay":Z
    iget v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    iget-object v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    array-length v3, v3

    if-le v2, v3, :cond_1f

    .line 131
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    array-length v2, v2

    array-length v3, p2

    if-le v2, v3, :cond_f

    .line 133
    const/4 v1, 0x0

    .line 136
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    array-length v2, v2

    if-eq v0, v2, :cond_33

    .line 138
    aget-byte v2, p1, v0

    aget-byte v3, p2, v0

    if-eq v2, v3, :cond_1c

    .line 140
    const/4 v1, 0x0

    .line 136
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 146
    .end local v0    # "i":I
    :cond_1f
    iget v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    array-length v3, p2

    if-eq v2, v3, :cond_25

    .line 148
    const/4 v1, 0x0

    .line 151
    :cond_25
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_26
    array-length v2, p2

    if-eq v0, v2, :cond_33

    .line 153
    aget-byte v2, p1, v0

    aget-byte v3, p2, v0

    if-eq v2, v3, :cond_30

    .line 155
    const/4 v1, 0x0

    .line 151
    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 160
    :cond_33
    return v1
.end method

.method private returnFalse([B)Z
    .registers 3
    .param p1, "block"    # [B

    .prologue
    .line 587
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 588
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 590
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public generateSignature()[B
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 334
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v8}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    .line 336
    .local v2, "digSize":I
    const/4 v6, 0x0

    .line 337
    .local v6, "t":I
    const/4 v1, 0x0

    .line 339
    .local v1, "delta":I
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    const/16 v10, 0xbc

    if-ne v8, v10, :cond_5f

    .line 341
    const/16 v6, 0x8

    .line 342
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v8, v8

    sub-int/2addr v8, v2

    add-int/lit8 v1, v8, -0x1

    .line 343
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    invoke-interface {v8, v10, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 344
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v10, v10

    add-int/lit8 v10, v10, -0x1

    const/16 v11, -0x44

    aput-byte v11, v8, v10

    .line 355
    :goto_29
    const/4 v3, 0x0

    .line 356
    .local v3, "header":B
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    add-int/2addr v8, v2

    mul-int/lit8 v8, v8, 0x8

    add-int/2addr v8, v6

    add-int/lit8 v8, v8, 0x4

    iget v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->keyBits:I

    sub-int v7, v8, v10

    .line 358
    .local v7, "x":I
    if-lez v7, :cond_89

    .line 360
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    add-int/lit8 v10, v7, 0x7

    div-int/lit8 v10, v10, 0x8

    sub-int v5, v8, v10

    .line 361
    .local v5, "mR":I
    const/16 v3, 0x60

    .line 363
    sub-int/2addr v1, v5

    .line 365
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    invoke-static {v8, v9, v10, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 367
    new-array v8, v5, [B

    iput-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 379
    .end local v5    # "mR":I
    :goto_4e
    add-int/lit8 v8, v1, -0x1

    if-lez v8, :cond_de

    .line 381
    add-int/lit8 v4, v1, -0x1

    .local v4, "i":I
    :goto_54
    if-eqz v4, :cond_9e

    .line 383
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    const/16 v10, -0x45

    aput-byte v10, v8, v4

    .line 381
    add-int/lit8 v4, v4, -0x1

    goto :goto_54

    .line 348
    .end local v3    # "header":B
    .end local v4    # "i":I
    .end local v7    # "x":I
    :cond_5f
    const/16 v6, 0x10

    .line 349
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v8, v8

    sub-int/2addr v8, v2

    add-int/lit8 v1, v8, -0x2

    .line 350
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    invoke-interface {v8, v10, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 351
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v10, v10

    add-int/lit8 v10, v10, -0x2

    iget v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    ushr-int/lit8 v11, v11, 0x8

    int-to-byte v11, v11

    aput-byte v11, v8, v10

    .line 352
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v10, v10

    add-int/lit8 v10, v10, -0x1

    iget v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    int-to-byte v11, v11

    aput-byte v11, v8, v10

    goto :goto_29

    .line 371
    .restart local v3    # "header":B
    .restart local v7    # "x":I
    :cond_89
    const/16 v3, 0x40

    .line 372
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    sub-int/2addr v1, v8

    .line 374
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    iget v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    invoke-static {v8, v9, v10, v1, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 376
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    new-array v8, v8, [B

    iput-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    goto :goto_4e

    .line 385
    .restart local v4    # "i":I
    :cond_9e
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    add-int/lit8 v10, v1, -0x1

    aget-byte v11, v8, v10

    xor-int/lit8 v11, v11, 0x1

    int-to-byte v11, v11

    aput-byte v11, v8, v10

    .line 386
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    const/16 v10, 0xb

    aput-byte v10, v8, v9

    .line 387
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    aget-byte v10, v8, v9

    or-int/2addr v10, v3

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 395
    .end local v4    # "i":I
    :goto_b7
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    iget-object v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v11, v11

    invoke-interface {v8, v10, v9, v11}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v0

    .line 397
    .local v0, "b":[B
    and-int/lit8 v8, v3, 0x20

    if-nez v8, :cond_ed

    const/4 v8, 0x1

    :goto_c7
    iput-boolean v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 398
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    iget-object v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v11, v11

    invoke-static {v8, v9, v10, v9, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 400
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 401
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    invoke-direct {p0, v8}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 403
    return-object v0

    .line 391
    .end local v0    # "b":[B
    :cond_de
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    const/16 v10, 0xa

    aput-byte v10, v8, v9

    .line 392
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    aget-byte v10, v8, v9

    or-int/2addr v10, v3

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    goto :goto_b7

    .restart local v0    # "b":[B
    :cond_ed
    move v8, v9

    .line 397
    goto :goto_c7
.end method

.method public getRecoveredMessage()[B
    .registers 2

    .prologue
    .line 613
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    return-object v0
.end method

.method public hasFullMessage()Z
    .registers 2

    .prologue
    .line 601
    iget-boolean v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    return v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "forSigning"    # Z
    .param p2, "param"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 100
    move-object v0, p2

    check-cast v0, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 102
    .local v0, "kParam":Lorg/spongycastle/crypto/params/RSAKeyParameters;
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v1, p1, v0}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 104
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->keyBits:I

    .line 106
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->keyBits:I

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    .line 108
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->trailer:I

    const/16 v2, 0xbc

    if-ne v1, v2, :cond_36

    .line 110
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v1, v1

    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x2

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    .line 117
    :goto_32
    invoke-virtual {p0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->reset()V

    .line 118
    return-void

    .line 114
    :cond_36
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->block:[B

    array-length v1, v1

    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x3

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    goto :goto_32
.end method

.method public reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 307
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 308
    iput v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    .line 309
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 311
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    if-eqz v0, :cond_17

    .line 313
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 316
    :cond_17
    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 317
    iput-boolean v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 319
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    if-eqz v0, :cond_28

    .line 321
    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    .line 322
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preBlock:[B

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 323
    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preBlock:[B

    .line 325
    :cond_28
    return-void
.end method

.method public update(B)V
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 273
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 275
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_12

    .line 277
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    aput-byte p1, v0, v1

    .line 280
    :cond_12
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    .line 281
    return-void
.end method

.method public update([BII)V
    .registers 6
    .param p1, "in"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 291
    :goto_0
    if-lez p3, :cond_13

    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_13

    .line 293
    aget-byte v0, p1, p2

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->update(B)V

    .line 294
    add-int/lit8 p2, p2, 0x1

    .line 295
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    .line 298
    :cond_13
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 299
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    .line 300
    return-void
.end method

.method public updateWithRecoveredMessage([B)V
    .registers 12
    .param p1, "signature"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 178
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    array-length v7, p1

    invoke-interface {v6, p1, v9, v7}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v0

    .line 180
    .local v0, "block":[B
    aget-byte v6, v0, v9

    and-int/lit16 v6, v6, 0xc0

    xor-int/lit8 v6, v6, 0x40

    if-eqz v6, :cond_18

    .line 182
    new-instance v6, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v7, "malformed signature"

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 185
    :cond_18
    array-length v6, v0

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, v0, v6

    and-int/lit8 v6, v6, 0xf

    xor-int/lit8 v6, v6, 0xc

    if-eqz v6, :cond_2b

    .line 187
    new-instance v6, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v7, "malformed signature"

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 190
    :cond_2b
    const/4 v1, 0x0

    .line 192
    .local v1, "delta":I
    array-length v6, v0

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, v0, v6

    and-int/lit16 v6, v6, 0xff

    xor-int/lit16 v6, v6, 0xbc

    if-nez v6, :cond_5d

    .line 194
    const/4 v1, 0x1

    .line 219
    :goto_38
    const/4 v2, 0x0

    .line 221
    .local v2, "mStart":I
    const/4 v2, 0x0

    :goto_3a
    array-length v6, v0

    if-eq v2, v6, :cond_45

    .line 223
    aget-byte v6, v0, v2

    and-int/lit8 v6, v6, 0xf

    xor-int/lit8 v6, v6, 0xa

    if-nez v6, :cond_a0

    .line 229
    :cond_45
    add-int/lit8 v2, v2, 0x1

    .line 231
    array-length v6, v0

    sub-int/2addr v6, v1

    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v7}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v7

    sub-int v3, v6, v7

    .line 236
    .local v3, "off":I
    sub-int v6, v3, v2

    if-gtz v6, :cond_a3

    .line 238
    new-instance v6, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v7, "malformed block"

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 198
    .end local v2    # "mStart":I
    .end local v3    # "off":I
    :cond_5d
    array-length v6, v0

    add-int/lit8 v6, v6, -0x2

    aget-byte v6, v0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    array-length v7, v0

    add-int/lit8 v7, v7, -0x1

    aget-byte v7, v0, v7

    and-int/lit16 v7, v7, 0xff

    or-int v4, v6, v7

    .line 199
    .local v4, "sigTrail":I
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-static {v6}, Lorg/spongycastle/crypto/signers/ISOTrailers;->getTrailer(Lorg/spongycastle/crypto/Digest;)Ljava/lang/Integer;

    move-result-object v5

    .line 201
    .local v5, "trailerObj":Ljava/lang/Integer;
    if-eqz v5, :cond_96

    .line 203
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eq v4, v6, :cond_9e

    .line 205
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "signer initialised with wrong digest for trailer "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 210
    :cond_96
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "unrecognised hash in signature"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 213
    :cond_9e
    const/4 v1, 0x2

    goto :goto_38

    .line 221
    .end local v4    # "sigTrail":I
    .end local v5    # "trailerObj":Ljava/lang/Integer;
    .restart local v2    # "mStart":I
    :cond_a0
    add-int/lit8 v2, v2, 0x1

    goto :goto_3a

    .line 244
    .restart local v3    # "off":I
    :cond_a3
    aget-byte v6, v0, v9

    and-int/lit8 v6, v6, 0x20

    if-nez v6, :cond_d8

    .line 246
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 248
    sub-int v6, v3, v2

    new-array v6, v6, [B

    iput-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 249
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v7, v7

    invoke-static {v0, v2, v6, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 259
    :goto_ba
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    .line 260
    iput-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preBlock:[B

    .line 262
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v8, v8

    invoke-interface {v6, v7, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 263
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v6, v6

    iput v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    .line 264
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v8, v8

    invoke-static {v6, v9, v7, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    return-void

    .line 253
    :cond_d8
    iput-boolean v9, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 255
    sub-int v6, v3, v2

    new-array v6, v6, [B

    iput-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 256
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v7, v7

    invoke-static {v0, v2, v6, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_ba
.end method

.method public verifySignature([B)Z
    .registers 15
    .param p1, "signature"    # [B

    .prologue
    .line 413
    const/4 v0, 0x0

    .line 415
    .local v0, "block":[B
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    if-nez v10, :cond_1e

    .line 419
    :try_start_5
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_c} :catch_1b

    move-result-object v0

    .line 439
    :goto_d
    const/4 v10, 0x0

    aget-byte v10, v0, v10

    and-int/lit16 v10, v10, 0xc0

    xor-int/lit8 v10, v10, 0x40

    if-eqz v10, :cond_37

    .line 441
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    .line 582
    :goto_1a
    return v10

    .line 421
    :catch_1b
    move-exception v2

    .line 423
    .local v2, "e":Ljava/lang/Exception;
    const/4 v10, 0x0

    goto :goto_1a

    .line 428
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1e
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    invoke-static {v10, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v10

    if-nez v10, :cond_2e

    .line 430
    new-instance v10, Ljava/lang/IllegalStateException;

    const-string v11, "updateWithRecoveredMessage called on different signature"

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 433
    :cond_2e
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preBlock:[B

    .line 435
    const/4 v10, 0x0

    iput-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preSig:[B

    .line 436
    const/4 v10, 0x0

    iput-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->preBlock:[B

    goto :goto_d

    .line 444
    :cond_37
    array-length v10, v0

    add-int/lit8 v10, v10, -0x1

    aget-byte v10, v0, v10

    and-int/lit8 v10, v10, 0xf

    xor-int/lit8 v10, v10, 0xc

    if-eqz v10, :cond_47

    .line 446
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto :goto_1a

    .line 449
    :cond_47
    const/4 v1, 0x0

    .line 451
    .local v1, "delta":I
    array-length v10, v0

    add-int/lit8 v10, v10, -0x1

    aget-byte v10, v0, v10

    and-int/lit16 v10, v10, 0xff

    xor-int/lit16 v10, v10, 0xbc

    if-nez v10, :cond_79

    .line 453
    const/4 v1, 0x1

    .line 478
    :goto_54
    const/4 v6, 0x0

    .line 480
    .local v6, "mStart":I
    const/4 v6, 0x0

    :goto_56
    array-length v10, v0

    if-eq v6, v10, :cond_61

    .line 482
    aget-byte v10, v0, v6

    and-int/lit8 v10, v10, 0xf

    xor-int/lit8 v10, v10, 0xa

    if-nez v10, :cond_bc

    .line 488
    :cond_61
    add-int/lit8 v6, v6, 0x1

    .line 493
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v10}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v10

    new-array v3, v10, [B

    .line 495
    .local v3, "hash":[B
    array-length v10, v0

    sub-int/2addr v10, v1

    array-length v11, v3

    sub-int v7, v10, v11

    .line 500
    .local v7, "off":I
    sub-int v10, v7, v6

    if-gtz v10, :cond_bf

    .line 502
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto :goto_1a

    .line 457
    .end local v3    # "hash":[B
    .end local v6    # "mStart":I
    .end local v7    # "off":I
    :cond_79
    array-length v10, v0

    add-int/lit8 v10, v10, -0x2

    aget-byte v10, v0, v10

    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v10, v10, 0x8

    array-length v11, v0

    add-int/lit8 v11, v11, -0x1

    aget-byte v11, v0, v11

    and-int/lit16 v11, v11, 0xff

    or-int v8, v10, v11

    .line 458
    .local v8, "sigTrail":I
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-static {v10}, Lorg/spongycastle/crypto/signers/ISOTrailers;->getTrailer(Lorg/spongycastle/crypto/Digest;)Ljava/lang/Integer;

    move-result-object v9

    .line 460
    .local v9, "trailerObj":Ljava/lang/Integer;
    if-eqz v9, :cond_b2

    .line 462
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-eq v8, v10, :cond_ba

    .line 464
    new-instance v10, Ljava/lang/IllegalStateException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "signer initialised with wrong digest for trailer "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 469
    :cond_b2
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "unrecognised hash in signature"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 472
    :cond_ba
    const/4 v1, 0x2

    goto :goto_54

    .line 480
    .end local v8    # "sigTrail":I
    .end local v9    # "trailerObj":Ljava/lang/Integer;
    .restart local v6    # "mStart":I
    :cond_bc
    add-int/lit8 v6, v6, 0x1

    goto :goto_56

    .line 508
    .restart local v3    # "hash":[B
    .restart local v7    # "off":I
    :cond_bf
    const/4 v10, 0x0

    aget-byte v10, v0, v10

    and-int/lit8 v10, v10, 0x20

    if-nez v10, :cond_12b

    .line 510
    const/4 v10, 0x1

    iput-boolean v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 513
    iget v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    sub-int v11, v7, v6

    if-le v10, v11, :cond_d5

    .line 515
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto/16 :goto_1a

    .line 518
    :cond_d5
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v10}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 519
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    sub-int v11, v7, v6

    invoke-interface {v10, v0, v6, v11}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 520
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    const/4 v11, 0x0

    invoke-interface {v10, v3, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 522
    const/4 v5, 0x1

    .line 524
    .local v5, "isOkay":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_e9
    array-length v10, v3

    if-eq v4, v10, :cond_100

    .line 526
    add-int v10, v7, v4

    aget-byte v11, v0, v10

    aget-byte v12, v3, v4

    xor-int/2addr v11, v12

    int-to-byte v11, v11

    aput-byte v11, v0, v10

    .line 527
    add-int v10, v7, v4

    aget-byte v10, v0, v10

    if-eqz v10, :cond_fd

    .line 529
    const/4 v5, 0x0

    .line 524
    :cond_fd
    add-int/lit8 v4, v4, 0x1

    goto :goto_e9

    .line 533
    :cond_100
    if-nez v5, :cond_108

    .line 535
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto/16 :goto_1a

    .line 538
    :cond_108
    sub-int v10, v7, v6

    new-array v10, v10, [B

    iput-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 539
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v12, v12

    invoke-static {v0, v6, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 571
    :goto_117
    iget v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->messageLength:I

    if-eqz v10, :cond_165

    .line 573
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    iget-object v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    invoke-direct {p0, v10, v11}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->isSameAs([B[B)Z

    move-result v10

    if-nez v10, :cond_165

    .line 575
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto/16 :goto_1a

    .line 543
    .end local v4    # "i":I
    .end local v5    # "isOkay":Z
    :cond_12b
    const/4 v10, 0x0

    iput-boolean v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->fullMessage:Z

    .line 545
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->digest:Lorg/spongycastle/crypto/Digest;

    const/4 v11, 0x0

    invoke-interface {v10, v3, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 547
    const/4 v5, 0x1

    .line 549
    .restart local v5    # "isOkay":Z
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_136
    array-length v10, v3

    if-eq v4, v10, :cond_14d

    .line 551
    add-int v10, v7, v4

    aget-byte v11, v0, v10

    aget-byte v12, v3, v4

    xor-int/2addr v11, v12

    int-to-byte v11, v11

    aput-byte v11, v0, v10

    .line 552
    add-int v10, v7, v4

    aget-byte v10, v0, v10

    if-eqz v10, :cond_14a

    .line 554
    const/4 v5, 0x0

    .line 549
    :cond_14a
    add-int/lit8 v4, v4, 0x1

    goto :goto_136

    .line 558
    :cond_14d
    if-nez v5, :cond_155

    .line 560
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->returnFalse([B)Z

    move-result v10

    goto/16 :goto_1a

    .line 563
    :cond_155
    sub-int v10, v7, v6

    new-array v10, v10, [B

    iput-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    .line 564
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->recoveredMessage:[B

    array-length v12, v12

    invoke-static {v0, v6, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_117

    .line 579
    :cond_165
    iget-object v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->mBuf:[B

    invoke-direct {p0, v10}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 580
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2Signer;->clearBlock([B)V

    .line 582
    const/4 v10, 0x1

    goto/16 :goto_1a
.end method
