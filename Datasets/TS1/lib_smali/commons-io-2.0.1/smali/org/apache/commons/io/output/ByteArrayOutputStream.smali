.class public Lorg/apache/commons/io/output/ByteArrayOutputStream;
.super Ljava/io/OutputStream;
.source "ByteArrayOutputStream.java"


# static fields
.field private static final EMPTY_BYTE_ARRAY:[B


# instance fields
.field private final buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field private count:I

.field private currentBuffer:[B

.field private currentBufferIndex:I

.field private filledBufferSum:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 77
    const/16 v0, 0x400

    invoke-direct {p0, v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>(I)V

    .line 78
    return-void
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "size"    # I

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    .line 88
    if-gez p1, :cond_25

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative initial size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_25
    monitor-enter p0

    .line 93
    :try_start_26
    invoke-direct {p0, p1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 94
    monitor-exit p0

    .line 95
    return-void

    .line 94
    :catchall_2b
    move-exception v0

    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_26 .. :try_end_2d} :catchall_2b

    throw v0
.end method

.method private needNewBuffer(I)V
    .registers 5
    .param p1, "newcount"    # I

    .prologue
    .line 104
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_27

    .line 106
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v2, v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 108
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 109
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    iget v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    iput-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    .line 127
    :goto_26
    return-void

    .line 113
    :cond_27
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    if-nez v1, :cond_41

    .line 114
    move v0, p1

    .line 115
    .local v0, "newBufferSize":I
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 123
    :goto_2f
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 124
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    .line 125
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 117
    .end local v0    # "newBufferSize":I
    :cond_41
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    iget v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v2, p1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 120
    .restart local v0    # "newBufferSize":I
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v2, v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    goto :goto_2f
.end method

.method private toBufferedInputStream()Ljava/io/InputStream;
    .registers 8

    .prologue
    .line 296
    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 297
    .local v4, "remaining":I
    if-nez v4, :cond_a

    .line 298
    new-instance v5, Lorg/apache/commons/io/input/ClosedInputStream;

    invoke-direct {v5}, Lorg/apache/commons/io/input/ClosedInputStream;-><init>()V

    .line 309
    :goto_9
    return-object v5

    .line 300
    :cond_a
    new-instance v3, Ljava/util/ArrayList;

    iget-object v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 301
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/io/ByteArrayInputStream;>;"
    iget-object v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_38

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 302
    .local v0, "buf":[B
    array-length v5, v0

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 303
    .local v1, "c":I
    new-instance v5, Ljava/io/ByteArrayInputStream;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v6, v1}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    sub-int/2addr v4, v1

    .line 305
    if-nez v4, :cond_1b

    .line 309
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    :cond_38
    new-instance v5, Ljava/io/SequenceInputStream;

    invoke-static {v3}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/SequenceInputStream;-><init>(Ljava/util/Enumeration;)V

    goto :goto_9
.end method

.method public static toBufferedInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    .line 281
    .local v0, "output":Lorg/apache/commons/io/output/ByteArrayOutputStream;
    invoke-virtual {v0, p0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->write(Ljava/io/InputStream;)I

    .line 282
    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toBufferedInputStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    return-void
.end method

.method public declared-synchronized reset()V
    .registers 3

    .prologue
    .line 231
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 232
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 233
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 234
    iget-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_18

    .line 235
    monitor-exit p0

    return-void

    .line 231
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .registers 2

    .prologue
    .line 211
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toByteArray()[B
    .registers 8

    .prologue
    .line 320
    monitor-enter p0

    :try_start_1
    iget v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 321
    .local v5, "remaining":I
    if-nez v5, :cond_9

    .line 322
    sget-object v3, Lorg/apache/commons/io/output/ByteArrayOutputStream;->EMPTY_BYTE_ARRAY:[B
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_2c

    .line 335
    :cond_7
    :goto_7
    monitor-exit p0

    return-object v3

    .line 324
    :cond_9
    :try_start_9
    new-array v3, v5, [B

    .line 325
    .local v3, "newbuf":[B
    const/4 v4, 0x0

    .line 326
    .local v4, "pos":I
    iget-object v6, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 327
    .local v0, "buf":[B
    array-length v6, v0

    invoke-static {v6, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 328
    .local v1, "c":I
    const/4 v6, 0x0

    invoke-static {v0, v6, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_27
    .catchall {:try_start_9 .. :try_end_27} :catchall_2c

    .line 329
    add-int/2addr v4, v1

    .line 330
    sub-int/2addr v5, v1

    .line 331
    if-nez v5, :cond_12

    goto :goto_7

    .line 320
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "newbuf":[B
    .end local v4    # "pos":I
    .end local v5    # "remaining":I
    :catchall_2c
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 345
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "enc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 358
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized write(Ljava/io/InputStream;)I
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    monitor-enter p0

    const/4 v2, 0x0

    .line 191
    .local v2, "readCount":I
    :try_start_2
    iget v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v0, v3, v4

    .line 192
    .local v0, "inBufferPos":I
    iget-object v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v4, v4

    sub-int/2addr v4, v0

    invoke-virtual {p1, v3, v0, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 193
    .local v1, "n":I
    :goto_12
    const/4 v3, -0x1

    if-eq v1, v3, :cond_33

    .line 194
    add-int/2addr v2, v1

    .line 195
    add-int/2addr v0, v1

    .line 196
    iget v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int/2addr v3, v1

    iput v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 197
    iget-object v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v3, v3

    if-ne v0, v3, :cond_28

    .line 198
    iget-object v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v3, v3

    invoke-direct {p0, v3}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 199
    const/4 v0, 0x0

    .line 201
    :cond_28
    iget-object v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v4, v4

    sub-int/2addr v4, v0

    invoke-virtual {p1, v3, v0, v4}, Ljava/io/InputStream;->read([BII)I
    :try_end_31
    .catchall {:try_start_2 .. :try_end_31} :catchall_35

    move-result v1

    goto :goto_12

    .line 203
    :cond_33
    monitor-exit p0

    return v2

    .line 190
    .end local v0    # "inBufferPos":I
    .end local v1    # "n":I
    :catchall_35
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized write(I)V
    .registers 5
    .param p1, "b"    # I

    .prologue
    .line 169
    monitor-enter p0

    :try_start_1
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    iget v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v0, v1, v2

    .line 170
    .local v0, "inBufferPos":I
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v1, v1

    if-ne v0, v1, :cond_14

    .line 171
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 172
    const/4 v0, 0x0

    .line 174
    :cond_14
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    int-to-byte v2, p1

    aput-byte v2, v1, v0

    .line 175
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 176
    monitor-exit p0

    return-void

    .line 169
    .end local v0    # "inBufferPos":I
    :catchall_21
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public write([BII)V
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 137
    if-ltz p2, :cond_10

    array-length v4, p1

    if-gt p2, v4, :cond_10

    if-ltz p3, :cond_10

    add-int v4, p2, p3

    array-length v5, p1

    if-gt v4, v5, :cond_10

    add-int v4, p2, p3

    if-gez v4, :cond_16

    .line 142
    :cond_10
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v4

    .line 143
    :cond_16
    if-nez p3, :cond_19

    .line 161
    :goto_18
    return-void

    .line 146
    :cond_19
    monitor-enter p0

    .line 147
    :try_start_1a
    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int v1, v4, p3

    .line 148
    .local v1, "newcount":I
    move v3, p3

    .line 149
    .local v3, "remaining":I
    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    iget v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v0, v4, v5

    .line 150
    .local v0, "inBufferPos":I
    :cond_25
    :goto_25
    if-lez v3, :cond_3f

    .line 151
    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v4, v4

    sub-int/2addr v4, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 152
    .local v2, "part":I
    add-int v4, p2, p3

    sub-int/2addr v4, v3

    iget-object v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    invoke-static {p1, v4, v5, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    sub-int/2addr v3, v2

    .line 154
    if-lez v3, :cond_25

    .line 155
    invoke-direct {p0, v1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 156
    const/4 v0, 0x0

    goto :goto_25

    .line 159
    .end local v2    # "part":I
    :cond_3f
    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 160
    monitor-exit p0

    goto :goto_18

    .end local v0    # "inBufferPos":I
    .end local v1    # "newcount":I
    .end local v3    # "remaining":I
    :catchall_43
    move-exception v4

    monitor-exit p0
    :try_end_45
    .catchall {:try_start_1a .. :try_end_45} :catchall_43

    throw v4
.end method

.method public declared-synchronized writeTo(Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    monitor-enter p0

    :try_start_1
    iget v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 247
    .local v3, "remaining":I
    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 248
    .local v0, "buf":[B
    array-length v4, v0

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 249
    .local v1, "c":I
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_23

    .line 250
    sub-int/2addr v3, v1

    .line 251
    if-nez v3, :cond_9

    .line 255
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    :cond_21
    monitor-exit p0

    return-void

    .line 246
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "remaining":I
    :catchall_23
    move-exception v4

    monitor-exit p0

    throw v4
.end method
