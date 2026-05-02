.class public Lkorex/mail/util/SharedFileInputStream;
.super Ljava/io/BufferedInputStream;
.source "SharedFileInputStream.java"

# interfaces
.implements Lkorex/mail/internet/SharedInputStream;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/util/SharedFileInputStream$SharedFile;
    }
.end annotation


# static fields
.field private static defaultBufferSize:I


# instance fields
.field protected bufpos:J

.field protected bufsize:I

.field protected datalen:J

.field protected in:Ljava/io/RandomAccessFile;

.field private master:Z

.field private sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

.field protected start:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    const/16 v0, 0x800

    sput v0, Lkorex/mail/util/SharedFileInputStream;->defaultBufferSize:I

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    sget v0, Lkorex/mail/util/SharedFileInputStream;->defaultBufferSize:I

    invoke-direct {p0, p1, v0}, Lkorex/mail/util/SharedFileInputStream;-><init>(Ljava/io/File;I)V

    .line 172
    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 94
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkorex/mail/util/SharedFileInputStream;->master:Z

    .line 196
    if-gtz p2, :cond_15

    .line 197
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer size <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_15
    new-instance v0, Lkorex/mail/util/SharedFileInputStream$SharedFile;

    invoke-direct {v0, p1}, Lkorex/mail/util/SharedFileInputStream$SharedFile;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0, p2}, Lkorex/mail/util/SharedFileInputStream;->init(Lkorex/mail/util/SharedFileInputStream$SharedFile;I)V

    .line 199
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    sget v0, Lkorex/mail/util/SharedFileInputStream;->defaultBufferSize:I

    invoke-direct {p0, p1, v0}, Lkorex/mail/util/SharedFileInputStream;-><init>(Ljava/lang/String;I)V

    .line 183
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 94
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkorex/mail/util/SharedFileInputStream;->master:Z

    .line 212
    if-gtz p2, :cond_15

    .line 213
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer size <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_15
    new-instance v0, Lkorex/mail/util/SharedFileInputStream$SharedFile;

    invoke-direct {v0, p1}, Lkorex/mail/util/SharedFileInputStream$SharedFile;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lkorex/mail/util/SharedFileInputStream;->init(Lkorex/mail/util/SharedFileInputStream$SharedFile;I)V

    .line 215
    return-void
.end method

.method private constructor <init>(Lkorex/mail/util/SharedFileInputStream$SharedFile;JJI)V
    .registers 9
    .param p1, "sf"    # Lkorex/mail/util/SharedFileInputStream$SharedFile;
    .param p2, "start"    # J
    .param p4, "len"    # J
    .param p6, "bufsize"    # I

    .prologue
    .line 231
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 94
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lkorex/mail/util/SharedFileInputStream;->master:Z

    .line 232
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkorex/mail/util/SharedFileInputStream;->master:Z

    .line 233
    iput-object p1, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    .line 234
    invoke-virtual {p1}, Lkorex/mail/util/SharedFileInputStream$SharedFile;->open()Ljava/io/RandomAccessFile;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    .line 235
    iput-wide p2, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    .line 236
    iput-wide p2, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    .line 237
    iput-wide p4, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    .line 238
    iput p6, p0, Lkorex/mail/util/SharedFileInputStream;->bufsize:I

    .line 239
    new-array v0, p6, [B

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    .line 240
    return-void
.end method

.method private ensureOpen()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_c

    .line 160
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_c
    return-void
.end method

.method private fill()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 250
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    if-gez v5, :cond_59

    .line 251
    iput v9, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    .line 252
    iget-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v7, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    iput-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    .line 272
    :cond_f
    :goto_f
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iput v5, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    .line 274
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    array-length v5, v5

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int v0, v5, v6

    .line 275
    .local v0, "len":I
    iget-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget-wide v7, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    sub-long/2addr v5, v7

    iget v7, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    int-to-long v7, v0

    add-long/2addr v5, v7

    iget-wide v7, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    cmp-long v5, v5, v7

    if-lez v5, :cond_38

    .line 276
    iget-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    iget-wide v7, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget-wide v9, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    sub-long/2addr v7, v9

    iget v9, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    int-to-long v9, v9

    add-long/2addr v7, v9

    sub-long/2addr v5, v7

    long-to-int v0, v5

    .line 277
    :cond_38
    iget-object v6, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    monitor-enter v6

    .line 278
    :try_start_3b
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    iget-wide v7, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v9, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    int-to-long v9, v9

    add-long/2addr v7, v9

    invoke-virtual {v5, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 279
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    iget-object v7, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    iget v8, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    invoke-virtual {v5, v7, v8, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v1

    .line 280
    .local v1, "n":I
    if-lez v1, :cond_57

    .line 281
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    add-int/2addr v5, v1

    iput v5, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    .line 282
    :cond_57
    monitor-exit v6
    :try_end_58
    .catchall {:try_start_3b .. :try_end_58} :catchall_ad

    .line 283
    return-void

    .line 253
    .end local v0    # "len":I
    .end local v1    # "n":I
    :cond_59
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iget-object v6, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    array-length v6, v6

    if-lt v5, v6, :cond_f

    .line 254
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    if-lez v5, :cond_80

    .line 255
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    sub-int v4, v5, v6

    .line 256
    .local v4, "sz":I
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    iget-object v7, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    invoke-static {v5, v6, v7, v9, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 257
    iput v4, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    .line 258
    iget-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v7, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    iput-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    .line 259
    iput v9, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    goto :goto_f

    .line 260
    .end local v4    # "sz":I
    :cond_80
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    array-length v5, v5

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->marklimit:I

    if-lt v5, v6, :cond_96

    .line 261
    const/4 v5, -0x1

    iput v5, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    .line 262
    iput v9, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    .line 263
    iget-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v7, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    iput-wide v5, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    goto/16 :goto_f

    .line 265
    :cond_96
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    mul-int/lit8 v3, v5, 0x2

    .line 266
    .local v3, "nsz":I
    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->marklimit:I

    if-le v3, v5, :cond_a0

    .line 267
    iget v3, p0, Lkorex/mail/util/SharedFileInputStream;->marklimit:I

    .line 268
    :cond_a0
    new-array v2, v3, [B

    .line 269
    .local v2, "nbuf":[B
    iget-object v5, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    invoke-static {v5, v9, v2, v9, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    iput-object v2, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    goto/16 :goto_f

    .line 282
    .end local v2    # "nbuf":[B
    .end local v3    # "nsz":I
    .restart local v0    # "len":I
    :catchall_ad
    move-exception v5

    :try_start_ae
    monitor-exit v6
    :try_end_af
    .catchall {:try_start_ae .. :try_end_af} :catchall_ad

    throw v5
.end method

.method private in_available()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    iget-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    iget-wide v2, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    add-long/2addr v0, v2

    iget-wide v2, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v4, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    sub-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method private init(Lkorex/mail/util/SharedFileInputStream$SharedFile;I)V
    .registers 5
    .param p1, "sf"    # Lkorex/mail/util/SharedFileInputStream$SharedFile;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iput-object p1, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    .line 219
    invoke-virtual {p1}, Lkorex/mail/util/SharedFileInputStream$SharedFile;->open()Ljava/io/RandomAccessFile;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    .line 220
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    .line 221
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    .line 222
    iput p2, p0, Lkorex/mail/util/SharedFileInputStream;->bufsize:I

    .line 223
    new-array v0, p2, [B

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    .line 224
    return-void
.end method

.method private read1([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    iget v2, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    iget v3, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int v0, v2, v3

    .line 309
    .local v0, "avail":I
    if-gtz v0, :cond_15

    .line 320
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->fill()V

    .line 321
    iget v2, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    iget v3, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int v0, v2, v3

    .line 322
    if-gtz v0, :cond_15

    const/4 v1, -0x1

    .line 327
    :goto_14
    return v1

    .line 324
    :cond_15
    if-ge v0, p3, :cond_25

    move v1, v0

    .line 325
    .local v1, "cnt":I
    :goto_18
    iget-object v2, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    iget v3, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    iget v2, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    add-int/2addr v2, v1

    iput v2, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    goto :goto_14

    .end local v1    # "cnt":I
    :cond_25
    move v1, p3

    .line 324
    goto :goto_18
.end method


# virtual methods
.method public declared-synchronized available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 408
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->ensureOpen()V

    .line 409
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    iget v1, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int/2addr v0, v1

    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->in_available()I
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_10

    move-result v1

    add-int/2addr v0, v1

    monitor-exit p0

    return v0

    .line 408
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 473
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_6

    .line 485
    :goto_5
    return-void

    .line 476
    :cond_6
    :try_start_6
    iget-boolean v0, p0, Lkorex/mail/util/SharedFileInputStream;->master:Z

    if-eqz v0, :cond_16

    .line 477
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    invoke-virtual {v0}, Lkorex/mail/util/SharedFileInputStream$SharedFile;->forceClose()V
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_1c

    .line 481
    :goto_f
    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    .line 482
    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    .line 483
    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    goto :goto_5

    .line 479
    :cond_16
    :try_start_16
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    invoke-virtual {v0}, Lkorex/mail/util/SharedFileInputStream$SharedFile;->close()V
    :try_end_1b
    .catchall {:try_start_16 .. :try_end_1b} :catchall_1c

    goto :goto_f

    .line 481
    :catchall_1c
    move-exception v0

    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    .line 482
    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    .line 483
    iput-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    throw v0
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 545
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 546
    invoke-virtual {p0}, Lkorex/mail/util/SharedFileInputStream;->close()V

    .line 547
    return-void
.end method

.method public getPosition()J
    .registers 5

    .prologue
    .line 495
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_c

    .line 496
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 497
    :cond_c
    iget-wide v0, p0, Lkorex/mail/util/SharedFileInputStream;->bufpos:J

    iget v2, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-wide v2, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public declared-synchronized mark(I)V
    .registers 3
    .param p1, "readlimit"    # I

    .prologue
    .line 426
    monitor-enter p0

    :try_start_1
    iput p1, p0, Lkorex/mail/util/SharedFileInputStream;->marklimit:I

    .line 427
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iput v0, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 428
    monitor-exit p0

    return-void

    .line 426
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 463
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized newStream(JJ)Ljava/io/InputStream;
    .registers 12
    .param p1, "start"    # J
    .param p3, "end"    # J

    .prologue
    .line 513
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->in:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_10

    .line 514
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 513
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 515
    :cond_10
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1e

    .line 516
    :try_start_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "start < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 517
    :cond_1e
    const-wide/16 v0, -0x1

    cmp-long v0, p3, v0

    if-nez v0, :cond_26

    .line 518
    iget-wide p3, p0, Lkorex/mail/util/SharedFileInputStream;->datalen:J

    .line 519
    :cond_26
    new-instance v0, Lkorex/mail/util/SharedFileInputStream;

    iget-object v1, p0, Lkorex/mail/util/SharedFileInputStream;->sf:Lkorex/mail/util/SharedFileInputStream$SharedFile;

    iget-wide v2, p0, Lkorex/mail/util/SharedFileInputStream;->start:J

    long-to-int v4, p1

    int-to-long v4, v4

    add-long/2addr v2, v4

    sub-long v4, p3, p1

    long-to-int v4, v4

    int-to-long v4, v4

    iget v6, p0, Lkorex/mail/util/SharedFileInputStream;->bufsize:I

    invoke-direct/range {v0 .. v6}, Lkorex/mail/util/SharedFileInputStream;-><init>(Lkorex/mail/util/SharedFileInputStream$SharedFile;JJI)V
    :try_end_38
    .catchall {:try_start_16 .. :try_end_38} :catchall_d

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 294
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->ensureOpen()V

    .line 295
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iget v1, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    if-lt v0, v1, :cond_16

    .line 296
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->fill()V

    .line 297
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    iget v1, p0, Lkorex/mail/util/SharedFileInputStream;->count:I
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_23

    if-lt v0, v1, :cond_16

    .line 298
    const/4 v0, -0x1

    .line 300
    :goto_14
    monitor-exit p0

    return v0

    :cond_16
    :try_start_16
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream;->buf:[B

    iget v1, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    aget-byte v0, v0, v1
    :try_end_20
    .catchall {:try_start_16 .. :try_end_20} :catchall_23

    and-int/lit16 v0, v0, 0xff

    goto :goto_14

    .line 294
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([BII)I
    .registers 9
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->ensureOpen()V

    .line 349
    or-int v2, p2, p3

    add-int v3, p2, p3

    or-int/2addr v2, v3

    array-length v3, p1

    add-int v4, p2, p3

    sub-int/2addr v3, v4

    or-int/2addr v2, v3

    if-gez v2, :cond_19

    .line 350
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_16

    .line 348
    :catchall_16
    move-exception v2

    monitor-exit p0

    throw v2

    .line 351
    :cond_19
    if-nez p3, :cond_1e

    .line 352
    const/4 v0, 0x0

    .line 362
    :cond_1c
    monitor-exit p0

    return v0

    .line 355
    :cond_1e
    :try_start_1e
    invoke-direct {p0, p1, p2, p3}, Lkorex/mail/util/SharedFileInputStream;->read1([BII)I

    move-result v0

    .line 356
    .local v0, "n":I
    if-lez v0, :cond_1c

    .line 357
    :goto_24
    if-ge v0, p3, :cond_1c

    .line 358
    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-direct {p0, p1, v2, v3}, Lkorex/mail/util/SharedFileInputStream;->read1([BII)I
    :try_end_2d
    .catchall {:try_start_1e .. :try_end_2d} :catchall_16

    move-result v1

    .line 359
    .local v1, "n1":I
    if-lez v1, :cond_1c

    .line 360
    add-int/2addr v0, v1

    .line 361
    goto :goto_24
.end method

.method public declared-synchronized reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 445
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->ensureOpen()V

    .line 446
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    if-gez v0, :cond_13

    .line 447
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Resetting to invalid mark"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_10

    .line 445
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0

    .line 448
    :cond_13
    :try_start_13
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream;->markpos:I

    iput v0, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_10

    .line 449
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized skip(J)J
    .registers 9
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 374
    monitor-enter p0

    :try_start_3
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->ensureOpen()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_30

    .line 375
    cmp-long v4, p1, v2

    if-gtz v4, :cond_c

    .line 396
    :cond_a
    :goto_a
    monitor-exit p0

    return-wide v2

    .line 378
    :cond_c
    :try_start_c
    iget v4, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int/2addr v4, v5

    int-to-long v0, v4

    .line 380
    .local v0, "avail":J
    cmp-long v4, v0, v2

    if-gtz v4, :cond_23

    .line 388
    invoke-direct {p0}, Lkorex/mail/util/SharedFileInputStream;->fill()V

    .line 389
    iget v4, p0, Lkorex/mail/util/SharedFileInputStream;->count:I

    iget v5, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    sub-int/2addr v4, v5

    int-to-long v0, v4

    .line 390
    cmp-long v4, v0, v2

    if-lez v4, :cond_a

    .line 394
    :cond_23
    cmp-long v4, v0, p1

    if-gez v4, :cond_33

    move-wide v2, v0

    .line 395
    .local v2, "skipped":J
    :goto_28
    iget v4, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I

    int-to-long v4, v4

    add-long/2addr v4, v2

    long-to-int v4, v4

    iput v4, p0, Lkorex/mail/util/SharedFileInputStream;->pos:I
    :try_end_2f
    .catchall {:try_start_c .. :try_end_2f} :catchall_30

    goto :goto_a

    .line 374
    .end local v0    # "avail":J
    .end local v2    # "skipped":J
    :catchall_30
    move-exception v4

    monitor-exit p0

    throw v4

    .restart local v0    # "avail":J
    :cond_33
    move-wide v2, p1

    .line 394
    goto :goto_28
.end method
