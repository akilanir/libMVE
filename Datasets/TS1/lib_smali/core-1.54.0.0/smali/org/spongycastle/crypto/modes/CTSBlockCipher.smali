.class public Lorg/spongycastle/crypto/modes/CTSBlockCipher;
.super Lorg/spongycastle/crypto/BufferedBlockCipher;
.source "CTSBlockCipher.java"


# instance fields
.field private blockSize:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>()V

    .line 26
    instance-of v0, p1, Lorg/spongycastle/crypto/StreamBlockCipher;

    if-eqz v0, :cond_f

    .line 28
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CTSBlockCipher can only accept ECB, or CBC ciphers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_f
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 33
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->blockSize:I

    .line 35
    iget v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->blockSize:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .line 37
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 14
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
    const/4 v10, 0x0

    .line 193
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    add-int/2addr v7, p2

    array-length v8, p1

    if-le v7, v8, :cond_f

    .line 195
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "output buffer to small in doFinal"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 198
    :cond_f
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v1

    .line 199
    .local v1, "blockSize":I
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    sub-int v5, v7, v1

    .line 200
    .local v5, "len":I
    new-array v0, v1, [B

    .line 202
    .local v0, "block":[B
    iget-boolean v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->forEncryption:Z

    if-eqz v7, :cond_86

    .line 204
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-ge v7, v1, :cond_2b

    .line 206
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "need at least one block of input for CTS"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 209
    :cond_2b
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 211
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-le v7, v1, :cond_82

    .line 213
    iget v3, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .local v3, "i":I
    :goto_38
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    array-length v7, v7

    if-eq v3, v7, :cond_48

    .line 215
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    sub-int v8, v3, v1

    aget-byte v8, v0, v8

    aput-byte v8, v7, v3

    .line 213
    add-int/lit8 v3, v3, 0x1

    goto :goto_38

    .line 218
    :cond_48
    move v3, v1

    :goto_49
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-eq v3, v7, :cond_5c

    .line 220
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    aget-byte v8, v7, v3

    sub-int v9, v3, v1

    aget-byte v9, v0, v9

    xor-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v7, v3

    .line 218
    add-int/lit8 v3, v3, 0x1

    goto :goto_49

    .line 223
    :cond_5c
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    instance-of v7, v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    if-eqz v7, :cond_7a

    .line 225
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    check-cast v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    .line 227
    .local v2, "c":Lorg/spongycastle/crypto/BlockCipher;
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v2, v7, v1, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 234
    .end local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    :goto_6f
    add-int v7, p2, v1

    invoke-static {v0, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    .end local v3    # "i":I
    :goto_74
    iget v6, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .line 283
    .local v6, "offset":I
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->reset()V

    .line 285
    return v6

    .line 231
    .end local v6    # "offset":I
    .restart local v3    # "i":I
    :cond_7a
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v1, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    goto :goto_6f

    .line 238
    .end local v3    # "i":I
    :cond_82
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_74

    .line 243
    :cond_86
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-ge v7, v1, :cond_92

    .line 245
    new-instance v7, Lorg/spongycastle/crypto/DataLengthException;

    const-string v8, "need at least one block of input for CTS"

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 248
    :cond_92
    new-array v4, v1, [B

    .line 250
    .local v4, "lastBlock":[B
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-le v7, v1, :cond_d9

    .line 252
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    instance-of v7, v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    if-eqz v7, :cond_c1

    .line 254
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    check-cast v7, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    .line 256
    .restart local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v2, v7, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 263
    .end local v2    # "c":Lorg/spongycastle/crypto/BlockCipher;
    :goto_ab
    move v3, v1

    .restart local v3    # "i":I
    :goto_ac
    iget v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    if-eq v3, v7, :cond_c9

    .line 265
    sub-int v7, v3, v1

    sub-int v8, v3, v1

    aget-byte v8, v0, v8

    iget-object v9, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    aget-byte v9, v9, v3

    xor-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    .line 263
    add-int/lit8 v3, v3, 0x1

    goto :goto_ac

    .line 260
    .end local v3    # "i":I
    :cond_c1
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    goto :goto_ab

    .line 268
    .restart local v3    # "i":I
    :cond_c9
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-static {v7, v1, v0, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v7, v0, v10, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 271
    add-int v7, p2, v1

    invoke-static {v4, v10, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_74

    .line 275
    .end local v3    # "i":I
    :cond_d9
    iget-object v7, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v7, v8, v10, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 277
    invoke-static {v0, v10, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_74
.end method

.method public getOutputSize(I)I
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 72
    iget v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    add-int/2addr v0, p1

    return v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 5
    .param p1, "len"    # I

    .prologue
    .line 50
    iget v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    add-int v1, p1, v2

    .line 51
    .local v1, "total":I
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .line 53
    .local v0, "leftOver":I
    if-nez v0, :cond_11

    .line 55
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    array-length v2, v2

    sub-int v2, v1, v2

    .line 58
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

    .line 91
    const/4 v0, 0x0

    .line 93
    .local v0, "resultLen":I
    iget v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_20

    .line 95
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v1, v2, v5, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v0

    .line 96
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->blockSize:I

    iget-object v3, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->blockSize:I

    invoke-static {v1, v2, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    iget v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->blockSize:I

    iput v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .line 101
    :cond_20
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    aput-byte p1, v1, v2

    .line 103
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

    .line 126
    if-gez p3, :cond_b

    .line 128
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Can\'t have a negative input length!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 131
    :cond_b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->getBlockSize()I

    move-result v0

    .line 132
    .local v0, "blockSize":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->getUpdateOutputSize(I)I

    move-result v2

    .line 134
    .local v2, "length":I
    if-lez v2, :cond_22

    .line 136
    add-int v4, p5, v2

    array-length v5, p4

    if-le v4, v5, :cond_22

    .line 138
    new-instance v4, Lorg/spongycastle/crypto/DataLengthException;

    const-string v5, "output buffer too short"

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 142
    :cond_22
    const/4 v3, 0x0

    .line 143
    .local v3, "resultLen":I
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    array-length v4, v4

    iget v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    sub-int v1, v4, v5

    .line 145
    .local v1, "gapLen":I
    if-le p3, v1, :cond_65

    .line 147
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-interface {v4, v5, v7, p4, p5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 150
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-static {v4, v0, v5, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    iput v0, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .line 154
    sub-int/2addr p3, v1

    .line 155
    add-int/2addr p2, v1

    .line 157
    :goto_47
    if-le p3, v0, :cond_65

    .line 159
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    add-int v6, p5, v3

    invoke-interface {v4, v5, v7, p4, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 161
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    invoke-static {v4, v0, v5, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 163
    sub-int/2addr p3, v0

    .line 164
    add-int/2addr p2, v0

    goto :goto_47

    .line 168
    :cond_65
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    iget v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    add-int/2addr v4, p3

    iput v4, p0, Lorg/spongycastle/crypto/modes/CTSBlockCipher;->bufOff:I

    .line 172
    return v3
.end method
