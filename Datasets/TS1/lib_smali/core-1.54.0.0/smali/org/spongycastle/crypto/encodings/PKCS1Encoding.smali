.class public Lorg/spongycastle/crypto/encodings/PKCS1Encoding;
.super Ljava/lang/Object;
.source "PKCS1Encoding.java"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricBlockCipher;


# static fields
.field private static final HEADER_LENGTH:I = 0xa

.field public static final NOT_STRICT_LENGTH_ENABLED_PROPERTY:Ljava/lang/String; = "org.spongycastle.pkcs1.not_strict"

.field public static final STRICT_LENGTH_ENABLED_PROPERTY:Ljava/lang/String; = "org.spongycastle.pkcs1.strict"


# instance fields
.field private engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private fallback:[B

.field private forEncryption:Z

.field private forPrivateKey:Z

.field private pLen:I

.field private random:Ljava/security/SecureRandom;

.field private useStrictLength:Z


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V
    .registers 3
    .param p1, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    .line 52
    iput-object p1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 53
    invoke-direct {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrict()Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrictLength:Z

    .line 54
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;I)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .param p2, "pLen"    # I

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    .line 66
    iput-object p1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 67
    invoke-direct {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrict()Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrictLength:Z

    .line 68
    iput p2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    .line 69
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;[B)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .param p2, "fallback"    # [B

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    .line 84
    iput-object p1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 85
    invoke-direct {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrict()Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrictLength:Z

    .line 86
    iput-object p2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    .line 87
    array-length v0, p2

    iput v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    .line 88
    return-void
.end method

.method private static checkPkcs1Encoding([BI)I
    .registers 8
    .param p0, "encoded"    # [B
    .param p1, "pLen"    # I

    .prologue
    .line 254
    const/4 v0, 0x0

    .line 258
    .local v0, "correct":I
    const/4 v4, 0x0

    aget-byte v4, p0, v4

    xor-int/lit8 v4, v4, 0x2

    or-int/2addr v0, v4

    .line 263
    array-length v4, p0

    add-int/lit8 v5, p1, 0x1

    sub-int v2, v4, v5

    .line 268
    .local v2, "plen":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_d
    if-ge v1, v2, :cond_22

    .line 269
    aget-byte v3, p0, v1

    .line 270
    .local v3, "tmp":I
    shr-int/lit8 v4, v3, 0x1

    or-int/2addr v3, v4

    .line 271
    shr-int/lit8 v4, v3, 0x2

    or-int/2addr v3, v4

    .line 272
    shr-int/lit8 v4, v3, 0x4

    or-int/2addr v3, v4

    .line 273
    and-int/lit8 v4, v3, 0x1

    add-int/lit8 v4, v4, -0x1

    or-int/2addr v0, v4

    .line 268
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 279
    .end local v3    # "tmp":I
    :cond_22
    array-length v4, p0

    add-int/lit8 v5, p1, 0x1

    sub-int/2addr v4, v5

    aget-byte v4, p0, v4

    or-int/2addr v0, v4

    .line 284
    shr-int/lit8 v4, v0, 0x1

    or-int/2addr v0, v4

    .line 285
    shr-int/lit8 v4, v0, 0x2

    or-int/2addr v0, v4

    .line 286
    shr-int/lit8 v4, v0, 0x4

    or-int/2addr v0, v4

    .line 287
    and-int/lit8 v4, v0, 0x1

    add-int/lit8 v4, v4, -0x1

    xor-int/lit8 v4, v4, -0x1

    return v4
.end method

.method private decodeBlock([BII)[B
    .registers 14
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 373
    iget v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    if-eq v5, v7, :cond_c

    .line 375
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->decodeBlockOrRandom([BII)[B

    move-result-object v2

    .line 437
    :goto_b
    return-object v2

    .line 378
    :cond_c
    iget-object v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v5, p1, p2, p3}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v0

    .line 380
    .local v0, "block":[B
    array-length v5, v0

    invoke-virtual {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->getOutputBlockSize()I

    move-result v6

    if-ge v5, v6, :cond_21

    .line 382
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "block truncated"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 385
    :cond_21
    aget-byte v4, v0, v8

    .line 387
    .local v4, "type":B
    iget-boolean v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forPrivateKey:Z

    if-eqz v5, :cond_32

    .line 389
    const/4 v5, 0x2

    if-eq v4, v5, :cond_3c

    .line 391
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "unknown block type"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 396
    :cond_32
    if-eq v4, v9, :cond_3c

    .line 398
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "unknown block type"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 402
    :cond_3c
    iget-boolean v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrictLength:Z

    if-eqz v5, :cond_51

    array-length v5, v0

    iget-object v6, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v6}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getOutputBlockSize()I

    move-result v6

    if-eq v5, v6, :cond_51

    .line 404
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "block incorrect size"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 412
    :cond_51
    const/4 v3, 0x1

    .local v3, "start":I
    :goto_52
    array-length v5, v0

    if-eq v3, v5, :cond_59

    .line 414
    aget-byte v1, v0, v3

    .line 416
    .local v1, "pad":B
    if-nez v1, :cond_6a

    .line 426
    .end local v1    # "pad":B
    :cond_59
    add-int/lit8 v3, v3, 0x1

    .line 428
    array-length v5, v0

    if-gt v3, v5, :cond_62

    const/16 v5, 0xa

    if-ge v3, v5, :cond_79

    .line 430
    :cond_62
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "no data in block"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 420
    .restart local v1    # "pad":B
    :cond_6a
    if-ne v4, v9, :cond_76

    if-eq v1, v7, :cond_76

    .line 422
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "block padding incorrect"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 412
    :cond_76
    add-int/lit8 v3, v3, 0x1

    goto :goto_52

    .line 433
    .end local v1    # "pad":B
    :cond_79
    array-length v5, v0

    sub-int/2addr v5, v3

    new-array v2, v5, [B

    .line 435
    .local v2, "result":[B
    array-length v5, v2

    invoke-static {v0, v3, v2, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_b
.end method

.method private decodeBlockOrRandom([BII)[B
    .registers 11
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 305
    iget-boolean v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forPrivateKey:Z

    if-nez v5, :cond_c

    .line 307
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "sorry, this method is only for decryption, not for signing"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 310
    :cond_c
    iget-object v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v5, p1, p2, p3}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v0

    .line 311
    .local v0, "block":[B
    const/4 v3, 0x0

    .line 312
    .local v3, "random":[B
    iget-object v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    if-nez v5, :cond_2f

    .line 314
    iget v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    new-array v3, v5, [B

    .line 315
    iget-object v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->random:Ljava/security/SecureRandom;

    invoke-virtual {v5, v3}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 328
    :goto_20
    array-length v5, v0

    invoke-virtual {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->getOutputBlockSize()I

    move-result v6

    if-ge v5, v6, :cond_32

    .line 330
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "block truncated"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 319
    :cond_2f
    iget-object v3, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->fallback:[B

    goto :goto_20

    .line 337
    :cond_32
    iget-boolean v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->useStrictLength:Z

    if-eqz v5, :cond_47

    array-length v5, v0

    iget-object v6, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v6}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getOutputBlockSize()I

    move-result v6

    if-eq v5, v6, :cond_47

    .line 339
    new-instance v5, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v6, "block incorrect size"

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 345
    :cond_47
    iget v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    invoke-static {v0, v5}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->checkPkcs1Encoding([BI)I

    move-result v1

    .line 351
    .local v1, "correct":I
    iget v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    new-array v4, v5, [B

    .line 352
    .local v4, "result":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_52
    iget v5, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    if-ge v2, v5, :cond_6a

    .line 354
    array-length v5, v0

    iget v6, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->pLen:I

    sub-int/2addr v5, v6

    add-int/2addr v5, v2

    aget-byte v5, v0, v5

    xor-int/lit8 v6, v1, -0x1

    and-int/2addr v5, v6

    aget-byte v6, v3, v2

    and-int/2addr v6, v1

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v4, v2

    .line 352
    add-int/lit8 v2, v2, 0x1

    goto :goto_52

    .line 357
    :cond_6a
    return-object v4
.end method

.method private encodeBlock([BII)[B
    .registers 9
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 204
    invoke-virtual {p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->getInputBlockSize()I

    move-result v2

    if-le p3, v2, :cond_f

    .line 206
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "input data too large"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 209
    :cond_f
    iget-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getInputBlockSize()I

    move-result v2

    new-array v0, v2, [B

    .line 211
    .local v0, "block":[B
    iget-boolean v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forPrivateKey:Z

    if-eqz v2, :cond_2b

    .line 213
    const/4 v2, 0x1

    aput-byte v2, v0, v4

    .line 215
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1f
    array-length v2, v0

    sub-int/2addr v2, p3

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_4b

    .line 217
    const/4 v2, -0x1

    aput-byte v2, v0, v1

    .line 215
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 222
    .end local v1    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->random:Ljava/security/SecureRandom;

    invoke-virtual {v2, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 224
    const/4 v2, 0x2

    aput-byte v2, v0, v4

    .line 230
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_34
    array-length v2, v0

    sub-int/2addr v2, p3

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_4b

    .line 232
    :goto_3a
    aget-byte v2, v0, v1

    if-nez v2, :cond_48

    .line 234
    iget-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->random:Ljava/security/SecureRandom;

    invoke-virtual {v2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_3a

    .line 230
    :cond_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 239
    :cond_4b
    array-length v2, v0

    sub-int/2addr v2, p3

    add-int/lit8 v2, v2, -0x1

    aput-byte v4, v0, v2

    .line 240
    array-length v2, v0

    sub-int/2addr v2, p3

    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    iget-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    array-length v3, v0

    invoke-interface {v2, v0, v4, v3}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v2

    return-object v2
.end method

.method private useStrict()Z
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 98
    new-instance v4, Lorg/spongycastle/crypto/encodings/PKCS1Encoding$1;

    invoke-direct {v4, p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding$1;-><init>(Lorg/spongycastle/crypto/encodings/PKCS1Encoding;)V

    invoke-static {v4}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    .local v1, "strict":Ljava/lang/String;
    new-instance v4, Lorg/spongycastle/crypto/encodings/PKCS1Encoding$2;

    invoke-direct {v4, p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding$2;-><init>(Lorg/spongycastle/crypto/encodings/PKCS1Encoding;)V

    invoke-static {v4}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 113
    .local v0, "notStrict":Ljava/lang/String;
    if-eqz v0, :cond_25

    .line 115
    const-string v4, "true"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_23

    .line 118
    :goto_22
    return v2

    :cond_23
    move v2, v3

    .line 115
    goto :goto_22

    .line 118
    :cond_25
    if-eqz v1, :cond_2f

    const-string v4, "true"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    :cond_2f
    move v3, v2

    :cond_30
    move v2, v3

    goto :goto_22
.end method


# virtual methods
.method public getInputBlockSize()I
    .registers 3

    .prologue
    .line 156
    iget-object v1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getInputBlockSize()I

    move-result v0

    .line 158
    .local v0, "baseBlockSize":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forEncryption:Z

    if-eqz v1, :cond_c

    .line 160
    add-int/lit8 v0, v0, -0xa

    .line 164
    .end local v0    # "baseBlockSize":I
    :cond_c
    return v0
.end method

.method public getOutputBlockSize()I
    .registers 3

    .prologue
    .line 170
    iget-object v1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getOutputBlockSize()I

    move-result v0

    .line 172
    .local v0, "baseBlockSize":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forEncryption:Z

    if-eqz v1, :cond_b

    .line 178
    .end local v0    # "baseBlockSize":I
    :goto_a
    return v0

    .restart local v0    # "baseBlockSize":I
    :cond_b
    add-int/lit8 v0, v0, -0xa

    goto :goto_a
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    return-object v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "forEncryption"    # Z
    .param p2, "param"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 132
    instance-of v2, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    if-eqz v2, :cond_21

    move-object v1, p2

    .line 134
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 136
    .local v1, "rParam":Lorg/spongycastle/crypto/params/ParametersWithRandom;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->random:Ljava/security/SecureRandom;

    .line 137
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 148
    .end local v1    # "rParam":Lorg/spongycastle/crypto/params/ParametersWithRandom;
    .local v0, "kParam":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :cond_13
    :goto_13
    iget-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    invoke-interface {v2, p1, p2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 150
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    move-result v2

    iput-boolean v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forPrivateKey:Z

    .line 151
    iput-boolean p1, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forEncryption:Z

    .line 152
    return-void

    .end local v0    # "kParam":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :cond_21
    move-object v0, p2

    .line 141
    check-cast v0, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 142
    .restart local v0    # "kParam":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    move-result v2

    if-nez v2, :cond_13

    if-eqz p1, :cond_13

    .line 144
    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->random:Ljava/security/SecureRandom;

    goto :goto_13
.end method

.method public processBlock([BII)[B
    .registers 5
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 188
    iget-boolean v0, p0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->forEncryption:Z

    if-eqz v0, :cond_9

    .line 190
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->encodeBlock([BII)[B

    move-result-object v0

    .line 194
    :goto_8
    return-object v0

    :cond_9
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->decodeBlock([BII)[B

    move-result-object v0

    goto :goto_8
.end method
