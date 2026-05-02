.class public Lorg/apache/commons/io/output/ByteArrayOutputStream;
.super Ljava/io/OutputStream;
.source "ByteArrayOutputStream.java"


# static fields
.field private static final EMPTY_BYTE_ARRAY:[B


# instance fields
.field private buffers:Ljava/util/List;

.field private count:I

.field private currentBuffer:[B

.field private currentBufferIndex:I

.field private filledBufferSum:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    const/16 v0, 0x400

    invoke-direct {p0, v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>(I)V

    .line 72
    return-void
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "size"    # I

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    .line 82
    if-gez p1, :cond_25

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Negative initial size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_25
    invoke-direct {p0, p1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 87
    return-void
.end method

.method private getBuffer(I)[B
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method private needNewBuffer(I)V
    .registers 5
    .param p1, "newcount"    # I

    .prologue
    .line 107
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_23

    .line 109
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v2, v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 111
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 112
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    invoke-direct {p0, v1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->getBuffer(I)[B

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    .line 130
    :goto_22
    return-void

    .line 116
    :cond_23
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    if-nez v1, :cond_3d

    .line 117
    move v0, p1

    .line 118
    .local v0, "newBufferSize":I
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 126
    :goto_2b
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 127
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    .line 128
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 120
    .end local v0    # "newBufferSize":I
    :cond_3d
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    iget v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v2, p1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 123
    .restart local v0    # "newBufferSize":I
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    iget-object v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v2, v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    goto :goto_2b
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
    .line 192
    return-void
.end method

.method public declared-synchronized reset()V
    .registers 2

    .prologue
    .line 198
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 199
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    .line 200
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    .line 201
    iget v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBufferIndex:I

    invoke-direct {p0, v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->getBuffer(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B
    :try_end_12
    .catchall {:try_start_2 .. :try_end_12} :catchall_14

    .line 202
    monitor-exit p0

    return-void

    .line 198
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .registers 2

    .prologue
    .line 179
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
    .line 233
    monitor-enter p0

    :try_start_1
    iget v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 234
    .local v5, "remaining":I
    if-nez v5, :cond_9

    .line 235
    sget-object v3, Lorg/apache/commons/io/output/ByteArrayOutputStream;->EMPTY_BYTE_ARRAY:[B
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_29

    .line 249
    :cond_7
    monitor-exit p0

    return-object v3

    .line 237
    :cond_9
    :try_start_9
    new-array v3, v5, [B

    .line 238
    .local v3, "newbuf":[B
    const/4 v4, 0x0

    .line 239
    .local v4, "pos":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    iget-object v6, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_7

    .line 240
    invoke-direct {p0, v2}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->getBuffer(I)[B

    move-result-object v0

    .line 241
    .local v0, "buf":[B
    array-length v6, v0

    invoke-static {v6, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 242
    .local v1, "c":I
    const/4 v6, 0x0

    invoke-static {v0, v6, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_29

    .line 243
    add-int/2addr v4, v1

    .line 244
    sub-int/2addr v5, v1

    .line 245
    if-eqz v5, :cond_7

    .line 239
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 233
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    .end local v2    # "i":I
    .end local v3    # "newbuf":[B
    .end local v4    # "pos":I
    .end local v5    # "remaining":I
    :catchall_29
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 258
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
    .line 271
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized write(I)V
    .registers 5
    .param p1, "b"    # I

    .prologue
    .line 166
    monitor-enter p0

    :try_start_1
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    iget v2, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v0, v1, v2

    .line 167
    .local v0, "inBufferPos":I
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v1, v1

    if-ne v0, v1, :cond_14

    .line 168
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 169
    const/4 v0, 0x0

    .line 171
    :cond_14
    iget-object v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    int-to-byte v2, p1

    aput-byte v2, v1, v0

    .line 172
    iget v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 173
    monitor-exit p0

    return-void

    .line 166
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
    .line 136
    if-ltz p2, :cond_10

    array-length v4, p1

    if-gt p2, v4, :cond_10

    if-ltz p3, :cond_10

    add-int v4, p2, p3

    array-length v5, p1

    if-gt v4, v5, :cond_10

    add-int v4, p2, p3

    if-gez v4, :cond_16

    .line 141
    :cond_10
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v4

    .line 142
    :cond_16
    if-nez p3, :cond_19

    .line 160
    :goto_18
    return-void

    .line 145
    :cond_19
    monitor-enter p0

    .line 146
    :try_start_1a
    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    add-int v1, v4, p3

    .line 147
    .local v1, "newcount":I
    move v3, p3

    .line 148
    .local v3, "remaining":I
    iget v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    iget v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->filledBufferSum:I

    sub-int v0, v4, v5

    .line 149
    .local v0, "inBufferPos":I
    :cond_25
    :goto_25
    if-lez v3, :cond_3f

    .line 150
    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    array-length v4, v4

    sub-int/2addr v4, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 151
    .local v2, "part":I
    add-int v4, p2, p3

    sub-int/2addr v4, v3

    iget-object v5, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->currentBuffer:[B

    invoke-static {p1, v4, v5, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    sub-int/2addr v3, v2

    .line 153
    if-lez v3, :cond_25

    .line 154
    invoke-direct {p0, v1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->needNewBuffer(I)V

    .line 155
    const/4 v0, 0x0

    goto :goto_25

    .line 158
    .end local v2    # "part":I
    :cond_3f
    iput v1, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 159
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
    .line 213
    monitor-enter p0

    :try_start_1
    iget v3, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->count:I

    .line 214
    .local v3, "remaining":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    iget-object v4, p0, Lorg/apache/commons/io/output/ByteArrayOutputStream;->buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1c

    .line 215
    invoke-direct {p0, v2}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->getBuffer(I)[B

    move-result-object v0

    .line 216
    .local v0, "buf":[B
    array-length v4, v0

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 217
    .local v1, "c":I
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_21

    .line 218
    sub-int/2addr v3, v1

    .line 219
    if-nez v3, :cond_1e

    .line 223
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    :cond_1c
    monitor-exit p0

    return-void

    .line 214
    .restart local v0    # "buf":[B
    .restart local v1    # "c":I
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 213
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    .end local v2    # "i":I
    .end local v3    # "remaining":I
    :catchall_21
    move-exception v4

    monitor-exit p0

    throw v4
.end method
