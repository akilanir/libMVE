.class public Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;
.super Lorg/spongycastle/crypto/BufferedBlockCipher;
.source "PaddedBufferedBlockCipher.java"


# instance fields
.field padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 3
    .param p1, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    .line 48
    new-instance v0, Lorg/spongycastle/crypto/paddings/PKCS7Padding;

    invoke-direct {v0}, Lorg/spongycastle/crypto/paddings/PKCS7Padding;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "padding"    # Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 34
    iput-object p2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    .line 36
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 38
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 9
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
    const/4 v5, 0x0

    .line 247
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    .line 248
    .local v0, "blockSize":I
    const/4 v1, 0x0

    .line 250
    .local v1, "resultLen":I
    iget-boolean v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->forEncryption:Z

    if-eqz v2, :cond_43

    .line 252
    iget v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    if-ne v2, v0, :cond_2b

    .line 254
    mul-int/lit8 v2, v0, 0x2

    add-int/2addr v2, p2

    array-length v3, p1

    if-le v2, v3, :cond_21

    .line 256
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    .line 258
    new-instance v2, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v3, "output buffer too short"

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 261
    :cond_21
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    invoke-interface {v2, v3, v5, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v1

    .line 262
    iput v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 265
    :cond_2b
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    iget v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    invoke-interface {v2, v3, v4}, Lorg/spongycastle/crypto/paddings/BlockCipherPadding;->addPadding([BI)I

    .line 267
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    add-int v4, p2, v1

    invoke-interface {v2, v3, v5, p1, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v2

    add-int/2addr v1, v2

    .line 269
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    .line 297
    :goto_42
    return v1

    .line 273
    :cond_43
    iget v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    if-ne v2, v0, :cond_66

    .line 275
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    invoke-interface {v2, v3, v5, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v1

    .line 276
    iput v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 287
    :try_start_53
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/paddings/BlockCipherPadding;->padCount([B)I

    move-result v2

    sub-int/2addr v1, v2

    .line 289
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    const/4 v3, 0x0

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_62
    .catchall {:try_start_53 .. :try_end_62} :catchall_71

    .line 293
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    goto :goto_42

    .line 280
    :cond_66
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    .line 282
    new-instance v2, Lorg/spongycastle/crypto/DataLengthException;

    const-string v3, "last block incomplete in decryption"

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 293
    :catchall_71
    move-exception v2

    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    throw v2
.end method

.method public getOutputSize(I)I
    .registers 6
    .param p1, "len"    # I

    .prologue
    .line 96
    iget v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    add-int v1, p1, v2

    .line 97
    .local v1, "total":I
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .line 99
    .local v0, "leftOver":I
    if-nez v0, :cond_14

    .line 101
    iget-boolean v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->forEncryption:Z

    if-eqz v2, :cond_13

    .line 103
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v2, v2

    add-int/2addr v1, v2

    .line 109
    .end local v1    # "total":I
    :cond_13
    :goto_13
    return v1

    .restart local v1    # "total":I
    :cond_14
    sub-int v2, v1, v0

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v3, v3

    add-int v1, v2, v3

    goto :goto_13
.end method

.method public getUpdateOutputSize(I)I
    .registers 6
    .param p1, "len"    # I

    .prologue
    .line 123
    iget v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    add-int v1, p1, v2

    .line 124
    .local v1, "total":I
    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .line 126
    .local v0, "leftOver":I
    if-nez v0, :cond_16

    .line 128
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v3, v3

    sub-int v3, v1, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 131
    :goto_15
    return v2

    :cond_16
    sub-int v2, v1, v0

    goto :goto_15
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 65
    iput-boolean p1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->forEncryption:Z

    .line 67
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->reset()V

    .line 69
    instance-of v1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    if-eqz v1, :cond_1f

    move-object v0, p2

    .line 71
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 73
    .local v0, "p":Lorg/spongycastle/crypto/params/ParametersWithRandom;
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/paddings/BlockCipherPadding;->init(Ljava/security/SecureRandom;)V

    .line 75
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 83
    .end local v0    # "p":Lorg/spongycastle/crypto/params/ParametersWithRandom;
    :goto_1e
    return-void

    .line 79
    :cond_1f
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/paddings/BlockCipherPadding;->init(Ljava/security/SecureRandom;)V

    .line 81
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v1, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_1e
.end method

.method public processByte(B[BI)I
    .registers 8
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
    const/4 v3, 0x0

    .line 150
    const/4 v0, 0x0

    .line 152
    .local v0, "resultLen":I
    iget v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_13

    .line 154
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    invoke-interface {v1, v2, v3, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v0

    .line 155
    iput v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 158
    :cond_13
    iget-object v1, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    aput-byte p1, v1, v2

    .line 160
    return v0
.end method

.method public processBytes([BII[BI)I
    .registers 13
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
    const/4 v6, 0x0

    .line 183
    if-gez p3, :cond_b

    .line 185
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Can\'t have a negative input length!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 188
    :cond_b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getBlockSize()I

    move-result v0

    .line 189
    .local v0, "blockSize":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getUpdateOutputSize(I)I

    move-result v2

    .line 191
    .local v2, "length":I
    if-lez v2, :cond_22

    .line 193
    add-int v4, p5, v2

    array-length v5, p4

    if-le v4, v5, :cond_22

    .line 195
    new-instance v4, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v5, "output buffer too short"

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 199
    :cond_22
    const/4 v3, 0x0

    .line 200
    .local v3, "resultLen":I
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v4, v4

    iget v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    sub-int v1, v4, v5

    .line 202
    .local v1, "gapLen":I
    if-le p3, v1, :cond_51

    .line 204
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    invoke-interface {v4, v5, v6, p4, p5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 208
    iput v6, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 209
    sub-int/2addr p3, v1

    .line 210
    add-int/2addr p2, v1

    .line 212
    :goto_40
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    array-length v4, v4

    if-le p3, v4, :cond_51

    .line 214
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    add-int v5, p5, v3

    invoke-interface {v4, p1, p2, p4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 216
    sub-int/2addr p3, v0

    .line 217
    add-int/2addr p2, v0

    goto :goto_40

    .line 221
    :cond_51
    iget-object v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 223
    iget v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    add-int/2addr v4, p3

    iput v4, p0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->bufOff:I

    .line 225
    return v3
.end method
