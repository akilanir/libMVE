.class public Lorg/spongycastle/crypto/io/CipherInputStream;
.super Ljava/io/FilterInputStream;
.source "CipherInputStream.java"


# static fields
.field private static final INPUT_BUF_SIZE:I = 0x800


# instance fields
.field private aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

.field private buf:[B

.field private bufOff:I

.field private bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

.field private finalized:Z

.field private inBuf:[B

.field private markBuf:[B

.field private markBufOff:I

.field private markPosition:J

.field private maxBuf:I

.field private skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

.field private streamCipher:Lorg/spongycastle/crypto/StreamCipher;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/BufferedBlockCipher;)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/BufferedBlockCipher;

    .prologue
    .line 53
    const/16 v0, 0x800

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/io/CipherInputStream;-><init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/BufferedBlockCipher;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/BufferedBlockCipher;I)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/BufferedBlockCipher;
    .param p3, "bufSize"    # I

    .prologue
    .line 85
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 87
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 88
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    .line 89
    instance-of v0, p2, Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v0, :cond_12

    check-cast p2, Lorg/spongycastle/crypto/SkippingCipher;

    .end local p2    # "cipher":Lorg/spongycastle/crypto/BufferedBlockCipher;
    :goto_f
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    .line 90
    return-void

    .line 89
    .restart local p2    # "cipher":Lorg/spongycastle/crypto/BufferedBlockCipher;
    :cond_12
    const/4 p2, 0x0

    goto :goto_f
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/StreamCipher;)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/StreamCipher;

    .prologue
    .line 63
    const/16 v0, 0x800

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/io/CipherInputStream;-><init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/StreamCipher;I)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/StreamCipher;I)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/StreamCipher;
    .param p3, "bufSize"    # I

    .prologue
    .line 100
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 102
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->streamCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 103
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    .line 104
    instance-of v0, p2, Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v0, :cond_12

    check-cast p2, Lorg/spongycastle/crypto/SkippingCipher;

    .end local p2    # "cipher":Lorg/spongycastle/crypto/StreamCipher;
    :goto_f
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    .line 105
    return-void

    .line 104
    .restart local p2    # "cipher":Lorg/spongycastle/crypto/StreamCipher;
    :cond_12
    const/4 p2, 0x0

    goto :goto_f
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .prologue
    .line 73
    const/16 v0, 0x800

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/io/CipherInputStream;-><init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/modes/AEADBlockCipher;I)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/modes/AEADBlockCipher;I)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    .param p3, "bufSize"    # I

    .prologue
    .line 115
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 117
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 118
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    .line 119
    instance-of v0, p2, Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v0, :cond_12

    check-cast p2, Lorg/spongycastle/crypto/SkippingCipher;

    .end local p2    # "cipher":Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    :goto_f
    iput-object p2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    .line 120
    return-void

    .line 119
    .restart local p2    # "cipher":Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    :cond_12
    const/4 p2, 0x0

    goto :goto_f
.end method

.method private ensureCapacity(IZ)V
    .registers 5
    .param p1, "updateSize"    # I
    .param p2, "finalOutput"    # Z

    .prologue
    .line 342
    move v0, p1

    .line 343
    .local v0, "bufLen":I
    if-eqz p2, :cond_26

    .line 345
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-eqz v1, :cond_1b

    .line 347
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v1, p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v0

    .line 366
    :cond_d
    :goto_d
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    if-eqz v1, :cond_16

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    array-length v1, v1

    if-ge v1, v0, :cond_1a

    .line 368
    :cond_16
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    .line 370
    :cond_1a
    return-void

    .line 349
    :cond_1b
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    if-eqz v1, :cond_d

    .line 351
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v1, p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getOutputSize(I)I

    move-result v0

    goto :goto_d

    .line 356
    :cond_26
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-eqz v1, :cond_31

    .line 358
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v1, p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUpdateOutputSize(I)I

    move-result v0

    goto :goto_d

    .line 360
    :cond_31
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    if-eqz v1, :cond_d

    .line 362
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v1, p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUpdateOutputSize(I)I

    move-result v0

    goto :goto_d
.end method

.method private finaliseCipher()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->finalized:Z

    .line 184
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/spongycastle/crypto/io/CipherInputStream;->ensureCapacity(IZ)V

    .line 185
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-eqz v1, :cond_18

    .line 187
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->doFinal([BI)I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    .line 206
    :goto_17
    return-void

    .line 189
    :cond_18
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    if-eqz v1, :cond_31

    .line 191
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->doFinal([BI)I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I
    :try_end_27
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_1 .. :try_end_27} :catch_28
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_27} :catch_35

    goto :goto_17

    .line 198
    :catch_28
    move-exception v0

    .line 200
    .local v0, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v1, Lorg/spongycastle/crypto/io/InvalidCipherTextIOException;

    const-string v2, "Error finalising cipher"

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/crypto/io/InvalidCipherTextIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 195
    .end local v0    # "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    :cond_31
    const/4 v1, 0x0

    :try_start_32
    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I
    :try_end_34
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_32 .. :try_end_34} :catch_28
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_34} :catch_35

    goto :goto_17

    .line 202
    :catch_35
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error finalising cipher "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private nextChunk()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/4 v1, 0x0

    .line 131
    iget-boolean v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->finalized:Z

    if-eqz v0, :cond_8

    move v0, v7

    .line 175
    :goto_7
    return v0

    .line 136
    :cond_8
    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    .line 137
    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    .line 140
    :goto_c
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    if-nez v0, :cond_67

    .line 142
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 143
    .local v3, "read":I
    if-ne v3, v7, :cond_26

    .line 145
    invoke-direct {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->finaliseCipher()V

    .line 146
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    if-nez v0, :cond_23

    move v0, v7

    .line 148
    goto :goto_7

    .line 150
    :cond_23
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    goto :goto_7

    .line 155
    :cond_26
    const/4 v0, 0x0

    :try_start_27
    invoke-direct {p0, v3, v0}, Lorg/spongycastle/crypto/io/CipherInputStream;->ensureCapacity(IZ)V

    .line 156
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-eqz v0, :cond_46

    .line 158
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufferedBlockCipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    const/4 v2, 0x0

    iget-object v4, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_3c} :catch_3d

    goto :goto_c

    .line 170
    :catch_3d
    move-exception v6

    .line 172
    .local v6, "e":Ljava/lang/Exception;
    new-instance v0, Lorg/spongycastle/crypto/io/CipherIOException;

    const-string v1, "Error processing stream "

    invoke-direct {v0, v1, v6}, Lorg/spongycastle/crypto/io/CipherIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 160
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_46
    :try_start_46
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    if-eqz v0, :cond_59

    .line 162
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->aeadBlockCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    const/4 v2, 0x0

    iget-object v4, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processBytes([BII[BI)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    goto :goto_c

    .line 166
    :cond_59
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->streamCipher:Lorg/spongycastle/crypto/StreamCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    const/4 v2, 0x0

    iget-object v4, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 167
    iput v3, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_66} :catch_3d

    goto :goto_c

    .line 175
    .end local v3    # "read":I
    :cond_67
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    goto :goto_7
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    iget v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 384
    :try_start_2
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_34

    .line 388
    iget-boolean v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->finalized:Z

    if-nez v0, :cond_e

    .line 392
    invoke-direct {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->finaliseCipher()V

    .line 395
    :cond_e
    iput v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    iput v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    .line 396
    iput v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBufOff:I

    .line 397
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markPosition:J

    .line 398
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    if-eqz v0, :cond_23

    .line 400
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    invoke-static {v0, v2}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 401
    iput-object v3, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    .line 403
    :cond_23
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    if-eqz v0, :cond_2e

    .line 405
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    invoke-static {v0, v2}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 406
    iput-object v3, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    .line 408
    :cond_2e
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->inBuf:[B

    invoke-static {v0, v2}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 409
    return-void

    .line 388
    :catchall_34
    move-exception v0

    iget-boolean v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->finalized:Z

    if-nez v1, :cond_3c

    .line 392
    invoke-direct {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->finaliseCipher()V

    :cond_3c
    throw v0
.end method

.method public mark(I)V
    .registers 6
    .param p1, "readlimit"    # I

    .prologue
    const/4 v3, 0x0

    .line 421
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 422
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v0, :cond_12

    .line 424
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/SkippingCipher;->getPosition()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markPosition:J

    .line 427
    :cond_12
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    if-eqz v0, :cond_27

    .line 429
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    array-length v0, v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    .line 430
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    iget-object v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 433
    :cond_27
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    iput v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBufOff:I

    .line 434
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 469
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v0, :cond_b

    .line 471
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    .line 474
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 221
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    iget v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    if-lt v0, v1, :cond_e

    .line 223
    invoke-direct {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->nextChunk()I

    move-result v0

    if-gez v0, :cond_e

    .line 225
    const/4 v0, -0x1

    .line 229
    :goto_d
    return v0

    :cond_e
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_d
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/spongycastle/crypto/io/CipherInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    iget v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    iget v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    if-lt v1, v2, :cond_e

    .line 275
    invoke-direct {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->nextChunk()I

    move-result v1

    if-gez v1, :cond_e

    .line 277
    const/4 v0, -0x1

    .line 284
    :goto_d
    return v0

    .line 281
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->available()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 282
    .local v0, "toSupply":I
    iget-object v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    iget v2, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 283
    iget v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    goto :goto_d
.end method

.method public reset()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 444
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    if-nez v0, :cond_c

    .line 446
    new-instance v0, Ljava/io/IOException;

    const-string v1, "cipher must implement SkippingCipher to be used with reset()"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 449
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 451
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    iget-wide v1, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markPosition:J

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/crypto/SkippingCipher;->seekTo(J)J

    .line 453
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    if-eqz v0, :cond_20

    .line 455
    iget-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBuf:[B

    iput-object v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->buf:[B

    .line 458
    :cond_20
    iget v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->markBufOff:I

    iput v0, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    .line 459
    return-void
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    .line 291
    cmp-long v7, p1, v5

    if-gtz v7, :cond_8

    move-wide p1, v5

    .line 324
    .end local p1    # "n":J
    :goto_7
    return-wide p1

    .line 296
    .restart local p1    # "n":J
    :cond_8
    iget-object v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    if-eqz v5, :cond_57

    .line 298
    invoke-virtual {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->available()I

    move-result v0

    .line 299
    .local v0, "avail":I
    int-to-long v5, v0

    cmp-long v5, p1, v5

    if-gtz v5, :cond_1d

    .line 301
    iget v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    int-to-long v5, v5

    add-long/2addr v5, p1

    long-to-int v5, v5

    iput v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    goto :goto_7

    .line 306
    :cond_1d
    iget v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->maxBuf:I

    iput v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    .line 308
    iget-object v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->in:Ljava/io/InputStream;

    int-to-long v6, v0

    sub-long v6, p1, v6

    invoke-virtual {v5, v6, v7}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v3

    .line 310
    .local v3, "skip":J
    iget-object v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->skippingCipher:Lorg/spongycastle/crypto/SkippingCipher;

    invoke-interface {v5, v3, v4}, Lorg/spongycastle/crypto/SkippingCipher;->skip(J)J

    move-result-wide v1

    .line 312
    .local v1, "cSkip":J
    cmp-long v5, v3, v1

    if-eqz v5, :cond_53

    .line 314
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to skip cipher "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 317
    :cond_53
    int-to-long v5, v0

    add-long p1, v3, v5

    goto :goto_7

    .line 321
    .end local v0    # "avail":I
    .end local v1    # "cSkip":J
    .end local v3    # "skip":J
    :cond_57
    invoke-virtual {p0}, Lorg/spongycastle/crypto/io/CipherInputStream;->available()I

    move-result v5

    int-to-long v5, v5

    invoke-static {p1, p2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v3, v5

    .line 322
    .local v3, "skip":I
    iget v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    add-int/2addr v5, v3

    iput v5, p0, Lorg/spongycastle/crypto/io/CipherInputStream;->bufOff:I

    .line 324
    int-to-long p1, v3

    goto :goto_7
.end method
