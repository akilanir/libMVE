.class public Lorg/spongycastle/crypto/BufferedBlockCipher;
.super Ljava/lang/Object;
.source "BufferedBlockCipher.java"


# instance fields
.field protected buf:[B

.field protected bufOff:I

.field protected cipher:Lorg/spongycastle/crypto/BlockCipher;

.field protected forEncryption:Z

.field protected partialBlockOkay:Z

.field protected pgpCFB:Z


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 7
    .param p1, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 40
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    .line 41
    iput v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 46
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "name":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v0, v2, 0x1

    .line 49
    .local v0, "idx":I
    if-lez v0, :cond_35

    const-string v2, "PGP"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_35

    move v2, v3

    :goto_28
    iput-boolean v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->pgpCFB:Z

    .line 51
    iget-boolean v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->pgpCFB:Z

    if-nez v2, :cond_32

    instance-of v2, p1, Lorg/spongycastle/crypto/StreamCipher;

    if-eqz v2, :cond_37

    .line 53
    :cond_32
    iput-boolean v3, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->partialBlockOkay:Z

    .line 59
    :goto_34
    return-void

    :cond_35
    move v2, v4

    .line 49
    goto :goto_28

    .line 57
    :cond_37
    if-lez v0, :cond_44

    const-string v2, "OpenPGP"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_44

    :goto_41
    iput-boolean v3, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->partialBlockOkay:Z

    goto :goto_34

    :cond_44
    move v3, v4

    goto :goto_41
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
    .line 271
    const/4 v0, 0x0

    .line 273
    .local v0, "resultLen":I
    :try_start_1
    iget v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    add-int/2addr v1, p2

    array-length v2, p1

    if-le v1, v2, :cond_14

    .line 275
    new-instance v1, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v2, "output buffer too short for doFinal()"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 295
    :catchall_f
    move-exception v1

    invoke-virtual {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->reset()V

    throw v1

    .line 278
    :cond_14
    :try_start_14
    iget v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    if-eqz v1, :cond_3a

    .line 280
    iget-boolean v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->partialBlockOkay:Z

    if-nez v1, :cond_24

    .line 282
    new-instance v1, Lorg/spongycastle/crypto/DataLengthException;

    const-string v2, "data not block size aligned"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 285
    :cond_24
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 286
    iget v0, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 287
    const/4 v1, 0x0

    iput v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 288
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    const/4 v2, 0x0

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_3a
    .catchall {:try_start_14 .. :try_end_3a} :catchall_f

    .line 295
    :cond_3a
    invoke-virtual {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->reset()V

    return v0
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    return v0
.end method

.method public getOutputSize(I)I
    .registers 3
    .param p1, "length"    # I

    .prologue
    .line 147
    iget v0, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    add-int/2addr v0, p1

    return v0
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    return-object v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 6
    .param p1, "len"    # I

    .prologue
    .line 113
    iget v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    add-int v1, p1, v2

    .line 116
    .local v1, "total":I
    iget-boolean v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->pgpCFB:Z

    if-eqz v2, :cond_24

    .line 118
    iget-boolean v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->forEncryption:Z

    if-eqz v2, :cond_1e

    .line 120
    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v2, v1, v2

    iget-object v3, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    sub-int v0, v2, v3

    .line 132
    .local v0, "leftOver":I
    :goto_1b
    sub-int v2, v1, v0

    return v2

    .line 124
    .end local v0    # "leftOver":I
    :cond_1e
    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .restart local v0    # "leftOver":I
    goto :goto_1b

    .line 129
    .end local v0    # "leftOver":I
    :cond_24
    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v2, v2

    rem-int v0, v1, v2

    .restart local v0    # "leftOver":I
    goto :goto_1b
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 4
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 85
    iput-boolean p1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->forEncryption:Z

    .line 87
    invoke-virtual {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->reset()V

    .line 89
    iget-object v0, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 90
    return-void
.end method

.method public processByte(B[BI)I
    .registers 9
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
    const/4 v4, 0x0

    .line 166
    const/4 v0, 0x0

    .line 168
    .local v0, "resultLen":I
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    aput-byte p1, v1, v2

    .line 170
    iget v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_1d

    .line 172
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    invoke-interface {v1, v2, v4, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v0

    .line 173
    iput v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 176
    :cond_1d
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

    .line 199
    if-gez p3, :cond_b

    .line 201
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Can\'t have a negative input length!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 204
    :cond_b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v0

    .line 205
    .local v0, "blockSize":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUpdateOutputSize(I)I

    move-result v2

    .line 207
    .local v2, "length":I
    if-lez v2, :cond_22

    .line 209
    add-int v4, p5, v2

    array-length v5, p4

    if-le v4, v5, :cond_22

    .line 211
    new-instance v4, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v5, "output buffer too short"

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 215
    :cond_22
    const/4 v3, 0x0

    .line 216
    .local v3, "resultLen":I
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v4, v4

    iget v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    sub-int v1, v4, v5

    .line 218
    .local v1, "gapLen":I
    if-le p3, v1, :cond_51

    .line 220
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    invoke-interface {v4, v5, v7, p4, p5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 224
    iput v7, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 225
    sub-int/2addr p3, v1

    .line 226
    add-int/2addr p2, v1

    .line 228
    :goto_40
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v4, v4

    if-le p3, v4, :cond_51

    .line 230
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    add-int v5, p5, v3

    invoke-interface {v4, p1, p2, p4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 232
    sub-int/2addr p3, v0

    .line 233
    add-int/2addr p2, v0

    goto :goto_40

    .line 237
    :cond_51
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    iget v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    invoke-static {p1, p2, v4, v5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    iget v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    add-int/2addr v4, p3

    iput v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 241
    iget v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    iget-object v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v5, v5

    if-ne v4, v5, :cond_71

    .line 243
    iget-object v4, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    add-int v6, p5, v3

    invoke-interface {v4, v5, v7, p4, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    move-result v4

    add-int/2addr v3, v4

    .line 244
    iput v7, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 247
    :cond_71
    return v3
.end method

.method public reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 308
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_e

    .line 310
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->buf:[B

    aput-byte v2, v1, v0

    .line 308
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 313
    :cond_e
    iput v2, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->bufOff:I

    .line 318
    iget-object v1, p0, Lorg/spongycastle/crypto/BufferedBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 319
    return-void
.end method
