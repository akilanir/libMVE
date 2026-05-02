.class public Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;
.super Lorg/spongycastle/crypto/BufferedBlockCipher;
.source "NISTCTSBlockCipher.java"


# static fields
.field public static final CS1:I = 0x1

.field public static final CS2:I = 0x2

.field public static final CS3:I = 0x3


# instance fields
.field private final blockSize:I

.field private final type:I


# direct methods
.method public constructor <init>(ILorg/spongycastle/crypto/BlockCipher;)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>()V

    .line 42
    iput p1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    .line 43
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-direct {v0, p2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 45
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->blockSize:I

    .line 47
    iget v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->blockSize:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    .line 49
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 15
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x0

    .line 205
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    add-int/2addr v7, p2

    array-length v8, p1

    if-le v7, v8, :cond_11

    .line 207
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "output buffer to small in doFinal"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 210
    :cond_11
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v1

    .line 211
    .local v1, "blockSize":I
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    sub-int v5, v7, v1

    .line 212
    .local v5, "len":I
    new-array v0, v1, [B

    .line 214
    .local v0, "block":[B
    iget-boolean v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->forEncryption:Z

    if-eqz v7, :cond_94

    .line 216
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    if-ge v7, v1, :cond_2d

    .line 218
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "need at least one block of input for NISTCTS"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 221
    :cond_2d
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    if-le v7, v1, :cond_89

    .line 223
    new-array v4, v1, [B

    .line 225
    .local v4, "lastBlock":[B
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    if-eq v7, v9, :cond_3b

    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    if-ne v7, v11, :cond_69

    .line 227
    :cond_3b
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 229
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v7, v1, v4, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v4, v10, v4, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 233
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    if-ne v7, v9, :cond_60

    if-ne v5, v1, :cond_60

    .line 235
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 237
    add-int v7, p2, v1

    invoke-static {v4, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 331
    .end local v4    # "lastBlock":[B
    :goto_5a
    iget v6, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    .line 333
    .local v6, "offset":I
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->reset()V

    .line 335
    return v6

    .line 241
    .end local v6    # "offset":I
    .restart local v4    # "lastBlock":[B
    :cond_60
    invoke-static {v4, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 243
    add-int v7, p2, v1

    invoke-static {v0, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_5a

    .line 248
    :cond_69
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v7, v10, v0, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 249
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v0, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 250
    invoke-static {v0, v10, p1, p2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    sub-int/2addr v8, v5

    invoke-static {v7, v8, v4, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 253
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v4, v10, v4, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 254
    add-int v7, p2, v5

    invoke-static {v4, v10, p1, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_5a

    .line 259
    .end local v4    # "lastBlock":[B
    :cond_89
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 261
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_5a

    .line 266
    :cond_94
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    if-ge v7, v1, :cond_a0

    .line 268
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "need at least one block of input for CTS"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 271
    :cond_a0
    new-array v4, v1, [B

    .line 273
    .restart local v4    # "lastBlock":[B
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    if-le v7, v1, :cond_134

    .line 275
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    if-eq v7, v11, :cond_b7

    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->type:I

    if-ne v7, v9, :cond_f9

    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    array-length v7, v7

    iget v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    sub-int/2addr v7, v8

    rem-int/2addr v7, v1

    if-eqz v7, :cond_f9

    .line 277
    :cond_b7
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    instance-of v7, v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    if-eqz v7, :cond_e0

    .line 279
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    check-cast v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    .line 281
    .local v2, "c":Lorg/spongycastle/crypto/BlockCipher;
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v2, v7, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 288
    .end local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    :goto_ca
    move v3, v1

    .local v3, "i":I
    :goto_cb
    iget v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    if-eq v3, v7, :cond_e8

    .line 290
    sub-int v7, v3, v1

    sub-int v8, v3, v1

    aget-byte v8, v0, v8

    iget-object v9, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    aget-byte v9, v9, v3

    xor-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    .line 288
    add-int/lit8 v3, v3, 0x1

    goto :goto_cb

    .line 285
    .end local v3    # "i":I
    :cond_e0
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    goto :goto_ca

    .line 293
    .restart local v3    # "i":I
    :cond_e8
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v7, v1, v0, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 295
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v0, v10, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 296
    add-int v7, p2, v1

    invoke-static {v4, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_5a

    .line 300
    .end local v3    # "i":I
    :cond_f9
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    check-cast v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    .line 302
    .restart local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    sub-int/2addr v8, v1

    invoke-interface {v2, v7, v8, v4, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 304
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v7, v10, v0, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 306
    if-eq v5, v1, :cond_115

    .line 308
    sub-int v7, v1, v5

    invoke-static {v4, v5, v0, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 311
    :cond_115
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v0, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 313
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 315
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_11e
    if-eq v3, v5, :cond_12d

    .line 317
    aget-byte v7, v4, v3

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    aget-byte v8, v8, v3

    xor-int/2addr v7, v8

    int-to-byte v7, v7

    aput-byte v7, v4, v3

    .line 315
    add-int/lit8 v3, v3, 0x1

    goto :goto_11e

    .line 320
    :cond_12d
    add-int v7, p2, v1

    invoke-static {v4, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_5a

    .line 325
    .end local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    .end local v3    # "i":I
    :cond_134
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 327
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_5a
.end method

.method public getOutputSize(I)I
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 84
    iget v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    add-int/2addr v0, p1

    return v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 5
    .param p1, "len"    # I

    .prologue
    .line 62
    iget v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    add-int v1, p1, v2

    .line 63
    .local v1, "total":I
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .line 65
    .local v0, "leftOver":I
    if-nez v0, :cond_11

    .line 67
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    array-length v2, v2

    sub-int v2, v1, v2

    .line 70
    :goto_10
    return v2

    :cond_11
    sub-int v2, v1, v0

    goto :goto_10
.end method

.method public processByte(B[BI)I
    .registers 10
    .param p1, "in"    # B
    .param p2, "out"    # [B
    .param p3, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 103
    const/4 v0, 0x0

    .line 105
    .local v0, "resultLen":I
    iget v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_20

    .line 107
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v1, v2, v5, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v0

    .line 108
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->blockSize:I

    iget-object v3, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->blockSize:I

    invoke-static {v1, v2, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    iget v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->blockSize:I

    iput v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    .line 113
    :cond_20
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    aput-byte p1, v1, v2

    .line 115
    return v0
.end method

.method public processBytes([BII[BI)I
    .registers 14
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 138
    if-gez p3, :cond_b

    .line 140
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Can\'t have a negative input length!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 143
    :cond_b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->getBlockSize()I

    move-result v0

    .line 144
    .local v0, "blockSize":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->getUpdateOutputSize(I)I

    move-result v2

    .line 146
    .local v2, "length":I
    if-lez v2, :cond_22

    .line 148
    add-int v4, p5, v2

    array-length v5, p4

    if-le v4, v5, :cond_22

    .line 150
    new-instance v4, Lorg/spongycastle/crypto/DataLengthException;

    const-string v5, "output buffer too short"

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 154
    :cond_22
    const/4 v3, 0x0

    .line 155
    .local v3, "resultLen":I
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    array-length v4, v4

    iget v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    sub-int v1, v4, v5

    .line 157
    .local v1, "gapLen":I
    if-le p3, v1, :cond_65

    .line 159
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-interface {v4, v5, v7, p4, p5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 162
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v4, v0, v5, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    iput v0, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    .line 166
    sub-int/2addr p3, v1

    .line 167
    add-int/2addr p2, v1

    .line 169
    :goto_47
    if-le p3, v0, :cond_65

    .line 171
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 172
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    add-int v6, p5, v3

    invoke-interface {v4, v5, v7, p4, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 173
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    invoke-static {v4, v0, v5, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    sub-int/2addr p3, v0

    .line 176
    add-int/2addr p2, v0

    goto :goto_47

    .line 180
    :cond_65
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 182
    iget v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    add-int/2addr v4, p3

    iput v4, p0, Lorg/spongycastle/crypto/modes/NISTCTSBlockCipher;->bufOff:I

    .line 184
    return v3
.end method
