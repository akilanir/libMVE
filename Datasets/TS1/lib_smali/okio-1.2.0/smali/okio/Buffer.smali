.class public final Lokio/Buffer;
.super Ljava/lang/Object;
.source "Buffer.java"

# interfaces
.implements Lokio/BufferedSource;
.implements Lokio/BufferedSink;
.implements Ljava/lang/Cloneable;


# instance fields
.field head:Lokio/Segment;

.field size:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    return-void
.end method

.method private readFrom(Ljava/io/InputStream;JZ)V
    .registers 12
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteCount"    # J
    .param p4, "forever"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    if-nez p1, :cond_17

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "in == null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 248
    .local v0, "bytesRead":I
    .local v1, "maxToCopy":I
    .local v2, "tail":Lokio/Segment;
    :cond_a
    iget v3, v2, Lokio/Segment;->limit:I

    add-int/2addr v3, v0

    iput v3, v2, Lokio/Segment;->limit:I

    .line 249
    iget-wide v3, p0, Lokio/Buffer;->size:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 250
    int-to-long v3, v0

    sub-long/2addr p2, v3

    .line 240
    .end local v0    # "bytesRead":I
    .end local v1    # "maxToCopy":I
    .end local v2    # "tail":Lokio/Segment;
    :cond_17
    const-wide/16 v3, 0x0

    cmp-long v3, p2, v3

    if-gtz v3, :cond_1f

    if-eqz p4, :cond_3b

    .line 241
    :cond_1f
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v2

    .line 242
    .restart local v2    # "tail":Lokio/Segment;
    iget v3, v2, Lokio/Segment;->limit:I

    rsub-int v3, v3, 0x800

    int-to-long v3, v3

    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v1, v3

    .line 243
    .restart local v1    # "maxToCopy":I
    iget-object v3, v2, Lokio/Segment;->data:[B

    iget v4, v2, Lokio/Segment;->limit:I

    invoke-virtual {p1, v3, v4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 244
    .restart local v0    # "bytesRead":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_a

    .line 245
    if-eqz p4, :cond_3c

    .line 252
    .end local v0    # "bytesRead":I
    .end local v1    # "maxToCopy":I
    .end local v2    # "tail":Lokio/Segment;
    :cond_3b
    return-void

    .line 246
    .restart local v0    # "bytesRead":I
    .restart local v1    # "maxToCopy":I
    .restart local v2    # "tail":Lokio/Segment;
    :cond_3c
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3
.end method


# virtual methods
.method public buffer()Lokio/Buffer;
    .registers 1

    .prologue
    .line 60
    return-object p0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 573
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->skip(J)V
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_6

    .line 577
    return-void

    .line 574
    :catch_6
    move-exception v0

    .line 575
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lokio/Buffer;
    .registers 7

    .prologue
    .line 1050
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 1051
    .local v0, "result":Lokio/Buffer;
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_e

    .line 1058
    :cond_d
    return-object v0

    .line 1053
    :cond_e
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v2, Lokio/Segment;->data:[B

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v4, v4, Lokio/Segment;->limit:I

    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v5, v5, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 1054
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_26
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_d

    .line 1055
    iget-object v2, v1, Lokio/Segment;->data:[B

    iget v3, v1, Lokio/Segment;->pos:I

    iget v4, v1, Lokio/Segment;->limit:I

    iget v5, v1, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 1054
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_26
.end method

.method public close()V
    .registers 1

    .prologue
    .line 962
    return-void
.end method

.method public completeSegmentByteCount()J
    .registers 7

    .prologue
    const-wide/16 v3, 0x0

    .line 260
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 261
    .local v0, "result":J
    cmp-long v5, v0, v3

    if-nez v5, :cond_9

    .line 269
    :goto_8
    return-wide v3

    .line 264
    :cond_9
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 265
    .local v2, "tail":Lokio/Segment;
    iget v3, v2, Lokio/Segment;->limit:I

    const/16 v4, 0x800

    if-ge v3, v4, :cond_1a

    .line 266
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v0, v3

    :cond_1a
    move-wide v3, v0

    .line 269
    goto :goto_8
.end method

.method public copyTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .registers 8
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lokio/Buffer;->size:J

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;
    .registers 15
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_a
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 141
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-nez v0, :cond_18

    .line 158
    :cond_17
    return-object p0

    .line 144
    :cond_18
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 145
    .local v7, "s":Lokio/Segment;
    :goto_1a
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_2e

    .line 146
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr p2, v0

    .line 145
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1a

    .line 150
    :cond_2e
    :goto_2e
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_17

    .line 151
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p2

    long-to-int v6, v0

    .line 152
    .local v6, "pos":I
    iget v0, v7, Lokio/Segment;->limit:I

    sub-int/2addr v0, v6

    int-to-long v0, v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v8, v0

    .line 153
    .local v8, "toCopy":I
    iget-object v0, v7, Lokio/Segment;->data:[B

    invoke-virtual {p1, v0, v6, v8}, Ljava/io/OutputStream;->write([BII)V

    .line 154
    int-to-long v0, v8

    sub-long/2addr p4, v0

    .line 155
    const-wide/16 p2, 0x0

    .line 150
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_2e
.end method

.method public copyTo(Lokio/Buffer;JJ)Lokio/Buffer;
    .registers 21
    .param p1, "out"    # Lokio/Buffer;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J

    .prologue
    .line 163
    if-nez p1, :cond_a

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "out == null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 164
    :cond_a
    iget-wide v2, p0, Lokio/Buffer;->size:J

    move-wide/from16 v4, p2

    move-wide/from16 v6, p4

    invoke-static/range {v2 .. v7}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 165
    const-wide/16 v2, 0x0

    cmp-long v2, p4, v2

    if-nez v2, :cond_1a

    .line 193
    :cond_19
    return-object p0

    .line 167
    :cond_1a
    iget-object v8, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 168
    .local v8, "source":Lokio/Segment;
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v11

    .line 169
    .local v11, "target":Lokio/Segment;
    move-object/from16 v0, p1

    iget-wide v2, v0, Lokio/Buffer;->size:J

    add-long v2, v2, p4

    move-object/from16 v0, p1

    iput-wide v2, v0, Lokio/Buffer;->size:J

    .line 171
    :goto_2d
    const-wide/16 v2, 0x0

    cmp-long v2, p4, v2

    if-lez v2, :cond_19

    .line 173
    :goto_33
    iget v2, v8, Lokio/Segment;->limit:I

    iget v3, v8, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    cmp-long v2, p2, v2

    if-ltz v2, :cond_48

    .line 174
    iget v2, v8, Lokio/Segment;->limit:I

    iget v3, v8, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    sub-long p2, p2, v2

    .line 175
    iget-object v8, v8, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_33

    .line 179
    :cond_48
    iget v2, v11, Lokio/Segment;->limit:I

    const/16 v3, 0x800

    if-ne v2, v3, :cond_58

    .line 180
    sget-object v2, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v2}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v2

    invoke-virtual {v11, v2}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v11

    .line 184
    :cond_58
    iget v2, v8, Lokio/Segment;->limit:I

    int-to-long v2, v2

    iget v4, v8, Lokio/Segment;->pos:I

    int-to-long v4, v4

    add-long v4, v4, p2

    sub-long/2addr v2, v4

    move-wide/from16 v0, p4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    .line 185
    .local v9, "sourceReadable":J
    iget v2, v11, Lokio/Segment;->limit:I

    rsub-int v2, v2, 0x800

    int-to-long v12, v2

    .line 186
    .local v12, "targetWritable":J
    invoke-static {v9, v10, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v14, v2

    .line 187
    .local v14, "toCopy":I
    iget-object v2, v8, Lokio/Segment;->data:[B

    iget v3, v8, Lokio/Segment;->pos:I

    move-wide/from16 v0, p2

    long-to-int v4, v0

    add-int/2addr v3, v4

    iget-object v4, v11, Lokio/Segment;->data:[B

    iget v5, v11, Lokio/Segment;->limit:I

    invoke-static {v2, v3, v4, v5, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    int-to-long v2, v14

    add-long p2, p2, v2

    .line 189
    iget v2, v11, Lokio/Segment;->limit:I

    add-int/2addr v2, v14

    iput v2, v11, Lokio/Segment;->limit:I

    .line 190
    int-to-long v2, v14

    sub-long p4, p4, v2

    .line 191
    goto :goto_2d
.end method

.method public emit()Lokio/BufferedSink;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    return-object p0
.end method

.method public emitCompleteSegments()Lokio/Buffer;
    .registers 1

    .prologue
    .line 86
    return-object p0
.end method

.method public bridge synthetic emitCompleteSegments()Lokio/BufferedSink;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Lokio/Buffer;->emitCompleteSegments()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 20
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 980
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_8

    const/4 v14, 0x1

    .line 1009
    :goto_7
    return v14

    .line 981
    :cond_8
    move-object/from16 v0, p1

    instance-of v14, v0, Lokio/Buffer;

    if-nez v14, :cond_10

    const/4 v14, 0x0

    goto :goto_7

    :cond_10
    move-object/from16 v13, p1

    .line 982
    check-cast v13, Lokio/Buffer;

    .line 983
    .local v13, "that":Lokio/Buffer;
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    iget-wide v0, v13, Lokio/Buffer;->size:J

    move-wide/from16 v16, v0

    cmp-long v14, v14, v16

    if-eqz v14, :cond_22

    const/4 v14, 0x0

    goto :goto_7

    .line 984
    :cond_22
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-nez v14, :cond_2e

    const/4 v14, 0x1

    goto :goto_7

    .line 986
    :cond_2e
    move-object/from16 v0, p0

    iget-object v11, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 987
    .local v11, "sa":Lokio/Segment;
    iget-object v12, v13, Lokio/Buffer;->head:Lokio/Segment;

    .line 988
    .local v12, "sb":Lokio/Segment;
    iget v7, v11, Lokio/Segment;->pos:I

    .line 989
    .local v7, "posA":I
    iget v9, v12, Lokio/Segment;->pos:I

    .line 991
    .local v9, "posB":I
    const-wide/16 v5, 0x0

    .local v5, "pos":J
    :goto_3a
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    cmp-long v14, v5, v14

    if-gez v14, :cond_7c

    .line 992
    iget v14, v11, Lokio/Segment;->limit:I

    sub-int/2addr v14, v7

    iget v15, v12, Lokio/Segment;->limit:I

    sub-int/2addr v15, v9

    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v14

    int-to-long v2, v14

    .line 994
    .local v2, "count":J
    const/4 v4, 0x0

    .local v4, "i":I
    move v10, v9

    .end local v9    # "posB":I
    .local v10, "posB":I
    move v8, v7

    .end local v7    # "posA":I
    .local v8, "posA":I
    :goto_50
    int-to-long v14, v4

    cmp-long v14, v14, v2

    if-gez v14, :cond_6a

    .line 995
    iget-object v14, v11, Lokio/Segment;->data:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "posA":I
    .restart local v7    # "posA":I
    aget-byte v14, v14, v8

    iget-object v15, v12, Lokio/Segment;->data:[B

    add-int/lit8 v9, v10, 0x1

    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    aget-byte v15, v15, v10

    if-eq v14, v15, :cond_65

    const/4 v14, 0x0

    goto :goto_7

    .line 994
    :cond_65
    add-int/lit8 v4, v4, 0x1

    move v10, v9

    .end local v9    # "posB":I
    .restart local v10    # "posB":I
    move v8, v7

    .end local v7    # "posA":I
    .restart local v8    # "posA":I
    goto :goto_50

    .line 998
    :cond_6a
    iget v14, v11, Lokio/Segment;->limit:I

    if-ne v8, v14, :cond_80

    .line 999
    iget-object v11, v11, Lokio/Segment;->next:Lokio/Segment;

    .line 1000
    iget v7, v11, Lokio/Segment;->pos:I

    .line 1003
    .end local v8    # "posA":I
    .restart local v7    # "posA":I
    :goto_72
    iget v14, v12, Lokio/Segment;->limit:I

    if-ne v10, v14, :cond_7e

    .line 1004
    iget-object v12, v12, Lokio/Segment;->next:Lokio/Segment;

    .line 1005
    iget v9, v12, Lokio/Segment;->pos:I

    .line 991
    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    :goto_7a
    add-long/2addr v5, v2

    goto :goto_3a

    .line 1009
    .end local v2    # "count":J
    .end local v4    # "i":I
    :cond_7c
    const/4 v14, 0x1

    goto :goto_7

    .end local v9    # "posB":I
    .restart local v2    # "count":J
    .restart local v4    # "i":I
    .restart local v10    # "posB":I
    :cond_7e
    move v9, v10

    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    goto :goto_7a

    .end local v7    # "posA":I
    .end local v9    # "posB":I
    .restart local v8    # "posA":I
    .restart local v10    # "posB":I
    :cond_80
    move v7, v8

    .end local v8    # "posA":I
    .restart local v7    # "posA":I
    goto :goto_72
.end method

.method public exhausted()Z
    .registers 5

    .prologue
    .line 94
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public flush()V
    .registers 1

    .prologue
    .line 959
    return-void
.end method

.method public getByte(J)B
    .registers 11
    .param p1, "pos"    # J

    .prologue
    .line 295
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 296
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 297
    .local v6, "s":Lokio/Segment;
    :goto_a
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int v7, v0, v1

    .line 298
    .local v7, "segmentByteCount":I
    int-to-long v0, v7

    cmp-long v0, p1, v0

    if-gez v0, :cond_1e

    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    long-to-int v2, p1

    add-int/2addr v1, v2

    aget-byte v0, v0, v1

    return v0

    .line 299
    :cond_1e
    int-to-long v0, v7

    sub-long/2addr p1, v0

    .line 296
    iget-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_a
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 1013
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1014
    .local v3, "s":Lokio/Segment;
    if-nez v3, :cond_6

    const/4 v2, 0x0

    .line 1022
    :goto_5
    return v2

    .line 1015
    :cond_6
    const/4 v2, 0x1

    .line 1017
    .local v2, "result":I
    :cond_7
    iget v1, v3, Lokio/Segment;->pos:I

    .local v1, "pos":I
    iget v0, v3, Lokio/Segment;->limit:I

    .local v0, "limit":I
    :goto_b
    if-ge v1, v0, :cond_18

    .line 1018
    mul-int/lit8 v4, v2, 0x1f

    iget-object v5, v3, Lokio/Segment;->data:[B

    aget-byte v5, v5, v1

    add-int v2, v4, v5

    .line 1017
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1020
    :cond_18
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    .line 1021
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v3, v4, :cond_7

    goto :goto_5
.end method

.method public indexOf(B)J
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 897
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(BJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(BJ)J
    .registers 17
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J

    .prologue
    .line 905
    const-wide/16 v9, 0x0

    cmp-long v9, p2, v9

    if-gez v9, :cond_e

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "fromIndex < 0"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 907
    :cond_e
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 908
    .local v7, "s":Lokio/Segment;
    if-nez v7, :cond_15

    const-wide/16 v9, -0x1

    .line 924
    :goto_14
    return-wide v9

    .line 909
    :cond_15
    const-wide/16 v3, 0x0

    .line 911
    .local v3, "offset":J
    :cond_17
    iget v9, v7, Lokio/Segment;->limit:I

    iget v10, v7, Lokio/Segment;->pos:I

    sub-int v8, v9, v10

    .line 912
    .local v8, "segmentByteCount":I
    int-to-long v9, v8

    cmp-long v9, p2, v9

    if-ltz v9, :cond_2f

    .line 913
    int-to-long v9, v8

    sub-long/2addr p2, v9

    .line 921
    :goto_24
    int-to-long v9, v8

    add-long/2addr v3, v9

    .line 922
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    .line 923
    iget-object v9, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v7, v9, :cond_17

    .line 924
    const-wide/16 v9, -0x1

    goto :goto_14

    .line 915
    :cond_2f
    iget-object v0, v7, Lokio/Segment;->data:[B

    .line 916
    .local v0, "data":[B
    iget v9, v7, Lokio/Segment;->pos:I

    int-to-long v9, v9

    add-long v5, v9, p2

    .local v5, "pos":J
    iget v9, v7, Lokio/Segment;->limit:I

    int-to-long v1, v9

    .local v1, "limit":J
    :goto_39
    cmp-long v9, v5, v1

    if-gez v9, :cond_4d

    .line 917
    long-to-int v9, v5

    aget-byte v9, v0, v9

    if-ne v9, p1, :cond_49

    add-long v9, v3, v5

    iget v11, v7, Lokio/Segment;->pos:I

    int-to-long v11, v11

    sub-long/2addr v9, v11

    goto :goto_14

    .line 916
    :cond_49
    const-wide/16 v9, 0x1

    add-long/2addr v5, v9

    goto :goto_39

    .line 919
    :cond_4d
    const-wide/16 p2, 0x0

    goto :goto_24
.end method

.method public indexOfElement(Lokio/ByteString;)J
    .registers 4
    .param p1, "targetBytes"    # Lokio/ByteString;

    .prologue
    .line 928
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOfElement(Lokio/ByteString;J)J
    .registers 25
    .param p1, "targetBytes"    # Lokio/ByteString;
    .param p2, "fromIndex"    # J

    .prologue
    .line 932
    const-wide/16 v17, 0x0

    cmp-long v17, p2, v17

    if-gez v17, :cond_e

    new-instance v17, Ljava/lang/IllegalArgumentException;

    const-string v18, "fromIndex < 0"

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 934
    :cond_e
    move-object/from16 v0, p0

    iget-object v13, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 935
    .local v13, "s":Lokio/Segment;
    if-nez v13, :cond_17

    const-wide/16 v17, -0x1

    .line 955
    :goto_16
    return-wide v17

    .line 936
    :cond_17
    const-wide/16 v9, 0x0

    .line 937
    .local v9, "offset":J
    move-object/from16 v0, p1

    iget-object v0, v0, Lokio/ByteString;->data:[B

    move-object/from16 v16, v0

    .line 939
    .local v16, "toFind":[B
    :cond_1f
    iget v0, v13, Lokio/Segment;->limit:I

    move/from16 v17, v0

    iget v0, v13, Lokio/Segment;->pos:I

    move/from16 v18, v0

    sub-int v14, v17, v18

    .line 940
    .local v14, "segmentByteCount":I
    int-to-long v0, v14

    move-wide/from16 v17, v0

    cmp-long v17, p2, v17

    if-ltz v17, :cond_49

    .line 941
    int-to-long v0, v14

    move-wide/from16 v17, v0

    sub-long p2, p2, v17

    .line 952
    :goto_35
    int-to-long v0, v14

    move-wide/from16 v17, v0

    add-long v9, v9, v17

    .line 953
    iget-object v13, v13, Lokio/Segment;->next:Lokio/Segment;

    .line 954
    move-object/from16 v0, p0

    iget-object v0, v0, Lokio/Buffer;->head:Lokio/Segment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    if-ne v13, v0, :cond_1f

    .line 955
    const-wide/16 v17, -0x1

    goto :goto_16

    .line 943
    :cond_49
    iget-object v4, v13, Lokio/Segment;->data:[B

    .line 944
    .local v4, "data":[B
    iget v0, v13, Lokio/Segment;->pos:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    add-long v11, v17, p2

    .local v11, "pos":J
    iget v0, v13, Lokio/Segment;->limit:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v7, v0

    .local v7, "limit":J
    :goto_5d
    cmp-long v17, v11, v7

    if-gez v17, :cond_86

    .line 945
    long-to-int v0, v11

    move/from16 v17, v0

    aget-byte v3, v4, v17

    .line 946
    .local v3, "b":B
    move-object/from16 v2, v16

    .local v2, "arr$":[B
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_6a
    if-ge v5, v6, :cond_81

    aget-byte v15, v2, v5

    .line 947
    .local v15, "targetByte":B
    if-ne v3, v15, :cond_7e

    add-long v17, v9, v11

    iget v0, v13, Lokio/Segment;->pos:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    sub-long v17, v17, v19

    goto :goto_16

    .line 946
    :cond_7e
    add-int/lit8 v5, v5, 0x1

    goto :goto_6a

    .line 944
    .end local v15    # "targetByte":B
    :cond_81
    const-wide/16 v17, 0x1

    add-long v11, v11, v17

    goto :goto_5d

    .line 950
    .end local v2    # "arr$":[B
    .end local v3    # "b":B
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_86
    const-wide/16 p2, 0x0

    goto :goto_35
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 106
    new-instance v0, Lokio/Buffer$2;

    invoke-direct {v0, p0}, Lokio/Buffer$2;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 64
    new-instance v0, Lokio/Buffer$1;

    invoke-direct {v0, p0}, Lokio/Buffer$1;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public read([B)I
    .registers 4
    .param p1, "sink"    # [B

    .prologue
    .line 536
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 12
    .param p1, "sink"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .prologue
    .line 549
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 551
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 552
    .local v6, "s":Lokio/Segment;
    if-nez v6, :cond_d

    const/4 v7, -0x1

    .line 564
    :cond_c
    :goto_c
    return v7

    .line 553
    :cond_d
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 554
    .local v7, "toCopy":I
    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    invoke-static {v0, v1, p1, p2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 556
    iget v0, v6, Lokio/Segment;->pos:I

    add-int/2addr v0, v7

    iput v0, v6, Lokio/Segment;->pos:I

    .line 557
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, v7

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 559
    iget v0, v6, Lokio/Segment;->pos:I

    iget v1, v6, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_c

    .line 560
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 561
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_c
.end method

.method public read(Lokio/Buffer;J)J
    .registers 8
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 888
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sink == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 889
    :cond_c
    cmp-long v0, p2, v2

    if-gez v0, :cond_29

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 890
    :cond_29
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_32

    const-wide/16 v0, -0x1

    .line 893
    :goto_31
    return-wide v0

    .line 891
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, p2, v0

    if-lez v0, :cond_3a

    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 892
    :cond_3a
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    move-wide v0, p2

    .line 893
    goto :goto_31
.end method

.method public readAll(Lokio/Sink;)J
    .registers 6
    .param p1, "sink"    # Lokio/Sink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 427
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 428
    .local v0, "byteCount":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_b

    .line 429
    invoke-interface {p1, p0, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 431
    :cond_b
    return-wide v0
.end method

.method public readByte()B
    .registers 11

    .prologue
    .line 273
    iget-wide v6, p0, Lokio/Buffer;->size:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_10

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "size == 0"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 275
    :cond_10
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 276
    .local v5, "segment":Lokio/Segment;
    iget v3, v5, Lokio/Segment;->pos:I

    .line 277
    .local v3, "pos":I
    iget v2, v5, Lokio/Segment;->limit:I

    .line 279
    .local v2, "limit":I
    iget-object v1, v5, Lokio/Segment;->data:[B

    .line 280
    .local v1, "data":[B
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v0, v1, v3

    .line 281
    .local v0, "b":B
    iget-wide v6, p0, Lokio/Buffer;->size:J

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 283
    if-ne v4, v2, :cond_31

    .line 284
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 285
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 290
    :goto_30
    return v0

    .line 287
    :cond_31
    iput v4, v5, Lokio/Segment;->pos:I

    goto :goto_30
.end method

.method public readByteArray()[B
    .registers 4

    .prologue
    .line 518
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->readByteArray(J)[B
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 519
    :catch_7
    move-exception v0

    .line 520
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readByteArray(J)[B
    .registers 10
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 525
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 526
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_28

    .line 527
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :cond_28
    long-to-int v0, p1

    new-array v6, v0, [B

    .line 531
    .local v6, "result":[B
    invoke-virtual {p0, v6}, Lokio/Buffer;->readFully([B)V

    .line 532
    return-object v6
.end method

.method public readByteString()Lokio/ByteString;
    .registers 3

    .prologue
    .line 411
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0}, Lokio/Buffer;->readByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readByteString(J)Lokio/ByteString;
    .registers 5
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 415
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readFrom(Ljava/io/InputStream;)Lokio/Buffer;
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    const-wide v0, 0x7fffffffffffffffL

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    .line 228
    return-object p0
.end method

.method public readFrom(Ljava/io/InputStream;J)Lokio/Buffer;
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gez v0, :cond_1f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 234
    :cond_1f
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    .line 235
    return-object p0
.end method

.method public readFully(Lokio/Buffer;J)V
    .registers 6
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 419
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p2

    if-gez v0, :cond_11

    .line 420
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p1, p0, v0, v1}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 421
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 423
    :cond_11
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 424
    return-void
.end method

.method public readFully([B)V
    .registers 5
    .param p1, "sink"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 540
    const/4 v0, 0x0

    .line 541
    .local v0, "offset":I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_15

    .line 542
    array-length v2, p1

    sub-int/2addr v2, v0

    invoke-virtual {p0, p1, v0, v2}, Lokio/Buffer;->read([BII)I

    move-result v1

    .line 543
    .local v1, "read":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_13

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 544
    :cond_13
    add-int/2addr v0, v1

    .line 545
    goto :goto_1

    .line 546
    .end local v1    # "read":I
    :cond_15
    return-void
.end method

.method public readInt()I
    .registers 11

    .prologue
    const-wide/16 v8, 0x4

    .line 333
    iget-wide v6, p0, Lokio/Buffer;->size:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_23

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "size < 4: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 335
    :cond_23
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 336
    .local v5, "segment":Lokio/Segment;
    iget v3, v5, Lokio/Segment;->pos:I

    .line 337
    .local v3, "pos":I
    iget v2, v5, Lokio/Segment;->limit:I

    .line 340
    .local v2, "limit":I
    sub-int v6, v2, v3

    const/4 v7, 0x4

    if-ge v6, v7, :cond_51

    .line 341
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x18

    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    or-int v1, v6, v7

    .line 361
    :goto_50
    return v1

    .line 347
    :cond_51
    iget-object v0, v5, Lokio/Segment;->data:[B

    .line 348
    .local v0, "data":[B
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v6, v0, v3

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x18

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v7, v0, v4

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v7, v0, v4

    and-int/lit16 v7, v7, 0xff

    or-int v1, v6, v7

    .line 352
    .local v1, "i":I
    iget-wide v6, p0, Lokio/Buffer;->size:J

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 354
    if-ne v3, v2, :cond_88

    .line 355
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 356
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_50

    .line 358
    :cond_88
    iput v3, v5, Lokio/Segment;->pos:I

    goto :goto_50
.end method

.method public readIntLe()I
    .registers 2

    .prologue
    .line 403
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    return v0
.end method

.method public readLong()J
    .registers 14

    .prologue
    .line 365
    iget-wide v7, p0, Lokio/Buffer;->size:J

    const-wide/16 v9, 0x8

    cmp-long v7, v7, v9

    if-gez v7, :cond_23

    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "size < 8: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v9, p0, Lokio/Buffer;->size:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 367
    :cond_23
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 368
    .local v4, "segment":Lokio/Segment;
    iget v2, v4, Lokio/Segment;->pos:I

    .line 369
    .local v2, "pos":I
    iget v1, v4, Lokio/Segment;->limit:I

    .line 372
    .local v1, "limit":I
    sub-int v7, v1, v2

    const/16 v8, 0x8

    if-ge v7, v8, :cond_4b

    .line 373
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v7

    int-to-long v7, v7

    const-wide v9, 0xffffffffL

    and-long/2addr v7, v9

    const/16 v9, 0x20

    shl-long/2addr v7, v9

    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v9

    int-to-long v9, v9

    const-wide v11, 0xffffffffL

    and-long/2addr v9, v11

    or-long v5, v7, v9

    .line 395
    :goto_4a
    return-wide v5

    .line 377
    :cond_4b
    iget-object v0, v4, Lokio/Segment;->data:[B

    .line 378
    .local v0, "data":[B
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .local v3, "pos":I
    aget-byte v7, v0, v2

    int-to-long v7, v7

    const-wide/16 v9, 0xff

    and-long/2addr v7, v9

    const/16 v9, 0x38

    shl-long/2addr v7, v9

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v9, v0, v3

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x30

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v9, v0, v2

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x28

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v9, v0, v3

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x20

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v9, v0, v2

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x18

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v9, v0, v3

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x10

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v9, v0, v2

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v11, 0x8

    shl-long/2addr v9, v11

    or-long/2addr v7, v9

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v9, v0, v3

    int-to-long v9, v9

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    or-long v5, v7, v9

    .line 386
    .local v5, "v":J
    iget-wide v7, p0, Lokio/Buffer;->size:J

    const-wide/16 v9, 0x8

    sub-long/2addr v7, v9

    iput-wide v7, p0, Lokio/Buffer;->size:J

    .line 388
    if-ne v2, v1, :cond_bf

    .line 389
    invoke-virtual {v4}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v7

    iput-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 390
    sget-object v7, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v7, v4}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_4a

    .line 392
    :cond_bf
    iput v2, v4, Lokio/Segment;->pos:I

    goto :goto_4a
.end method

.method public readLongLe()J
    .registers 3

    .prologue
    .line 407
    invoke-virtual {p0}, Lokio/Buffer;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Lokio/Util;->reverseBytesLong(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .registers 11

    .prologue
    const-wide/16 v8, 0x2

    .line 304
    iget-wide v6, p0, Lokio/Buffer;->size:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_23

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "size < 2: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 306
    :cond_23
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 307
    .local v5, "segment":Lokio/Segment;
    iget v2, v5, Lokio/Segment;->pos:I

    .line 308
    .local v2, "pos":I
    iget v1, v5, Lokio/Segment;->limit:I

    .line 311
    .local v1, "limit":I
    sub-int v6, v1, v2

    const/4 v7, 0x2

    if-ge v6, v7, :cond_40

    .line 312
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    or-int v4, v6, v7

    .line 314
    .local v4, "s":I
    int-to-short v6, v4

    .line 329
    :goto_3f
    return v6

    .line 317
    .end local v4    # "s":I
    :cond_40
    iget-object v0, v5, Lokio/Segment;->data:[B

    .line 318
    .local v0, "data":[B
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .local v3, "pos":I
    aget-byte v6, v0, v2

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    or-int v4, v6, v7

    .line 320
    .restart local v4    # "s":I
    iget-wide v6, p0, Lokio/Buffer;->size:J

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 322
    if-ne v2, v1, :cond_66

    .line 323
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 324
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 329
    :goto_64
    int-to-short v6, v4

    goto :goto_3f

    .line 326
    :cond_66
    iput v2, v5, Lokio/Segment;->pos:I

    goto :goto_64
.end method

.method public readShortLe()S
    .registers 2

    .prologue
    .line 399
    invoke-virtual {p0}, Lokio/Buffer;->readShort()S

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    return v0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 12
    .param p1, "byteCount"    # J
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 455
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 456
    if-nez p3, :cond_12

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 457
    :cond_12
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_32

    .line 458
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 460
    :cond_32
    cmp-long v0, p1, v2

    if-nez v0, :cond_39

    const-string v6, ""

    .line 477
    :cond_38
    :goto_38
    return-object v6

    .line 462
    :cond_39
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 463
    .local v7, "s":Lokio/Segment;
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    iget v2, v7, Lokio/Segment;->limit:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_50

    .line 465
    new-instance v6, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v0

    invoke-direct {v6, v0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_38

    .line 468
    :cond_50
    new-instance v6, Ljava/lang/String;

    iget-object v0, v7, Lokio/Segment;->data:[B

    iget v1, v7, Lokio/Segment;->pos:I

    long-to-int v2, p1

    invoke-direct {v6, v0, v1, v2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 469
    .local v6, "result":Ljava/lang/String;
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, v7, Lokio/Segment;->pos:I

    .line 470
    iget-wide v0, p0, Lokio/Buffer;->size:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 472
    iget v0, v7, Lokio/Segment;->pos:I

    iget v1, v7, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_38

    .line 473
    invoke-virtual {v7}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 474
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, v7}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_38
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 5
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 448
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2, p1}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 449
    :catch_7
    move-exception v0

    .line 450
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readUtf8()Ljava/lang/String;
    .registers 5

    .prologue
    .line 436
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    sget-object v3, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1, v2, v3}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 437
    :catch_9
    move-exception v0

    .line 438
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readUtf8(J)Ljava/lang/String;
    .registers 4
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 443
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8Line()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 481
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v0

    .line 483
    .local v0, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_1d

    .line 484
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1b

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v2

    .line 487
    :goto_1a
    return-object v2

    .line 484
    :cond_1b
    const/4 v2, 0x0

    goto :goto_1a

    .line 487
    :cond_1d
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v2

    goto :goto_1a
.end method

.method readUtf8Line(J)Ljava/lang/String;
    .registers 9
    .param p1, "newline"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x1

    .line 502
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_1f

    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1f

    .line 504
    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 505
    .local v0, "result":Ljava/lang/String;
    const-wide/16 v2, 0x2

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 512
    .end local v0    # "result":Ljava/lang/String;
    .local v1, "result":Ljava/lang/String;
    :goto_1e
    return-object v1

    .line 510
    .end local v1    # "result":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 511
    .restart local v0    # "result":Ljava/lang/String;
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 512
    .end local v0    # "result":Ljava/lang/String;
    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_1e
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 491
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v6

    .line 492
    .local v6, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v0, v6, v2

    if-nez v0, :cond_54

    .line 493
    new-instance v1, Lokio/Buffer;

    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    .line 494
    .local v1, "data":Lokio/Buffer;
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x20

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    .line 495
    new-instance v0, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\\n not found: size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " content="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 498
    .end local v1    # "data":Lokio/Buffer;
    :cond_54
    invoke-virtual {p0, v6, v7}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public request(J)Z
    .registers 5
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p1

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public require(J)V
    .registers 5
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 98
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_c

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 99
    :cond_c
    return-void
.end method

.method segmentSizes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 970
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v2, :cond_9

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 976
    :cond_8
    return-object v0

    .line 971
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 972
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->limit:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 973
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_22
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_8

    .line 974
    iget v2, v1, Lokio/Segment;->limit:I

    iget v3, v1, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 973
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_22
.end method

.method public size()J
    .registers 3

    .prologue
    .line 56
    iget-wide v0, p0, Lokio/Buffer;->size:J

    return-wide v0
.end method

.method public skip(J)V
    .registers 9
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 581
    :cond_0
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_46

    .line 582
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v2, :cond_10

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 584
    :cond_10
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->limit:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v1, v2

    .line 585
    .local v1, "toSkip":I
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 586
    int-to-long v2, v1

    sub-long/2addr p1, v2

    .line 587
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v2, Lokio/Segment;->pos:I

    add-int/2addr v3, v1

    iput v3, v2, Lokio/Segment;->pos:I

    .line 589
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_0

    .line 590
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 591
    .local v0, "toRecycle":Lokio/Segment;
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 592
    sget-object v2, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v2, v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 595
    .end local v0    # "toRecycle":Lokio/Segment;
    .end local v1    # "toSkip":I
    :cond_46
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 965
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 12

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1026
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_e

    .line 1027
    const-string v4, "Buffer[size=0]"

    .line 1041
    :goto_d
    return-object v4

    .line 1030
    :cond_e
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x10

    cmp-long v4, v4, v6

    if-gtz v4, :cond_35

    .line 1031
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v0

    .line 1032
    .local v0, "data":Lokio/ByteString;
    const-string v4, "Buffer[size=%s data=%s]"

    new-array v5, v10, [Ljava/lang/Object;

    iget-wide v6, p0, Lokio/Buffer;->size:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_d

    .line 1036
    .end local v0    # "data":Lokio/ByteString;
    :cond_35
    :try_start_35
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 1037
    .local v2, "md5":Ljava/security/MessageDigest;
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, v4, Lokio/Segment;->data:[B

    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v5, v5, Lokio/Segment;->pos:I

    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v6, v6, Lokio/Segment;->limit:I

    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v7, v7, Lokio/Segment;->pos:I

    sub-int/2addr v6, v7

    invoke-virtual {v2, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 1038
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v3, v4, Lokio/Segment;->next:Lokio/Segment;

    .local v3, "s":Lokio/Segment;
    :goto_53
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v3, v4, :cond_66

    .line 1039
    iget-object v4, v3, Lokio/Segment;->data:[B

    iget v5, v3, Lokio/Segment;->pos:I

    iget v6, v3, Lokio/Segment;->limit:I

    iget v7, v3, Lokio/Segment;->pos:I

    sub-int/2addr v6, v7

    invoke-virtual {v2, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 1038
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_53

    .line 1041
    :cond_66
    const-string v4, "Buffer[size=%s md5=%s]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v7, p0, Lokio/Buffer;->size:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    invoke-static {v7}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v7

    invoke-virtual {v7}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_86
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_35 .. :try_end_86} :catch_88

    move-result-object v4

    goto :goto_d

    .line 1043
    .end local v2    # "md5":Ljava/security/MessageDigest;
    .end local v3    # "s":Lokio/Segment;
    :catch_88
    move-exception v1

    .line 1044
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method

.method writableSegment(I)Lokio/Segment;
    .registers 5
    .param p1, "minimumCapacity"    # I

    .prologue
    const/16 v2, 0x800

    .line 783
    const/4 v1, 0x1

    if-lt p1, v1, :cond_7

    if-le p1, v2, :cond_d

    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 785
    :cond_d
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v1, :cond_24

    .line 786
    sget-object v1, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v1}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 787
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v0, v2, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v0, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 794
    :cond_23
    :goto_23
    return-object v0

    .line 790
    :cond_24
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 791
    .local v0, "tail":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->limit:I

    add-int/2addr v1, p1

    if-le v1, v2, :cond_23

    .line 792
    sget-object v1, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v1}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v0

    goto :goto_23
.end method

.method public write(Lokio/ByteString;)Lokio/Buffer;
    .registers 5
    .param p1, "byteString"    # Lokio/ByteString;

    .prologue
    .line 598
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byteString == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 599
    :cond_a
    iget-object v0, p1, Lokio/ByteString;->data:[B

    const/4 v1, 0x0

    iget-object v2, p1, Lokio/ByteString;->data:[B

    array-length v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write([B)Lokio/Buffer;
    .registers 4
    .param p1, "source"    # [B

    .prologue
    .line 679
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 680
    :cond_a
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write([BII)Lokio/Buffer;
    .registers 13
    .param p1, "source"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .prologue
    .line 684
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 685
    :cond_a
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 687
    add-int v6, p2, p3

    .line 688
    .local v6, "limit":I
    :goto_13
    if-ge p2, v6, :cond_32

    .line 689
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v7

    .line 691
    .local v7, "tail":Lokio/Segment;
    sub-int v0, v6, p2

    iget v1, v7, Lokio/Segment;->limit:I

    rsub-int v1, v1, 0x800

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 692
    .local v8, "toCopy":I
    iget-object v0, v7, Lokio/Segment;->data:[B

    iget v1, v7, Lokio/Segment;->limit:I

    invoke-static {p1, p2, v0, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 694
    add-int/2addr p2, v8

    .line 695
    iget v0, v7, Lokio/Segment;->limit:I

    add-int/2addr v0, v8

    iput v0, v7, Lokio/Segment;->limit:I

    goto :goto_13

    .line 698
    .end local v7    # "tail":Lokio/Segment;
    .end local v8    # "toCopy":I
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 699
    return-object p0
.end method

.method public bridge synthetic write(Lokio/ByteString;)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Source;J)Lokio/BufferedSink;
    .registers 6
    .param p1, "source"    # Lokio/Source;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 712
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_9

    .line 713
    invoke-interface {p1, p0, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 715
    :cond_9
    return-object p0
.end method

.method public bridge synthetic write([B)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic write([BII)Lokio/BufferedSink;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .registers 14
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 848
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 849
    :cond_c
    if-ne p1, p0, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == this"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 850
    :cond_16
    iget-wide v0, p1, Lokio/Buffer;->size:J

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 852
    :goto_1c
    cmp-long v0, p2, v2

    if-lez v0, :cond_8a

    .line 854
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_4e

    .line 855
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_78

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 856
    .local v9, "tail":Lokio/Segment;
    :goto_36
    if-eqz v9, :cond_45

    iget v0, v9, Lokio/Segment;->limit:I

    iget v1, v9, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v0, p2

    const-wide/16 v4, 0x800

    cmp-long v0, v0, v4

    if-lez v0, :cond_7a

    .line 859
    :cond_45
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lokio/Segment;->split(I)Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 870
    .end local v9    # "tail":Lokio/Segment;
    :cond_4e
    iget-object v8, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 871
    .local v8, "segmentToMove":Lokio/Segment;
    iget v0, v8, Lokio/Segment;->limit:I

    iget v1, v8, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v6, v0

    .line 872
    .local v6, "movedByteCount":J
    invoke-virtual {v8}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 873
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v0, :cond_8b

    .line 874
    iput-object v8, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 875
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v4, v1, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v4, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 881
    :goto_6c
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, v6

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 882
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 883
    sub-long/2addr p2, v6

    .line 884
    goto :goto_1c

    .line 855
    .end local v6    # "movedByteCount":J
    .end local v8    # "segmentToMove":Lokio/Segment;
    :cond_78
    const/4 v9, 0x0

    goto :goto_36

    .line 862
    .restart local v9    # "tail":Lokio/Segment;
    :cond_7a
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v9, v1}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 863
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, p2

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 864
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 885
    .end local v9    # "tail":Lokio/Segment;
    :cond_8a
    return-void

    .line 877
    .restart local v6    # "movedByteCount":J
    .restart local v8    # "segmentToMove":Lokio/Segment;
    :cond_8b
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 878
    .restart local v9    # "tail":Lokio/Segment;
    invoke-virtual {v9, v8}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v9

    .line 879
    invoke-virtual {v9}, Lokio/Segment;->compact()V

    goto :goto_6c
.end method

.method public writeAll(Lokio/Source;)J
    .registers 8
    .param p1, "source"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 703
    if-nez p1, :cond_a

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "source == null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 704
    :cond_a
    const-wide/16 v2, 0x0

    .line 705
    .local v2, "totalBytesRead":J
    :goto_c
    const-wide/16 v4, 0x800

    invoke-interface {p1, p0, v4, v5}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .local v0, "readCount":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_1a

    .line 706
    add-long/2addr v2, v0

    goto :goto_c

    .line 708
    :cond_1a
    return-wide v2
.end method

.method public writeByte(I)Lokio/Buffer;
    .registers 7
    .param p1, "b"    # I

    .prologue
    .line 719
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 720
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v2, v0, Lokio/Segment;->limit:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lokio/Segment;->limit:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 721
    iget-wide v1, p0, Lokio/Buffer;->size:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 722
    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeInt(I)Lokio/Buffer;
    .registers 10
    .param p1, "i"    # I

    .prologue
    .line 741
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 742
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 743
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 744
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 745
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    ushr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 746
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 747
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 748
    iput v1, v3, Lokio/Segment;->limit:I

    .line 749
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x4

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 750
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeIntLe(I)Lokio/Buffer;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 754
    invoke-static {p1}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeIntLe(I)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeIntLe(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeLong(J)Lokio/Buffer;
    .registers 12
    .param p1, "v"    # J

    .prologue
    const/16 v8, 0x8

    const-wide/16 v6, 0xff

    .line 758
    invoke-virtual {p0, v8}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 759
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 760
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 761
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    const/16 v4, 0x38

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 762
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x30

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 763
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    const/16 v4, 0x28

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 764
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x20

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 765
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    const/16 v4, 0x18

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 766
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x10

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 767
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    ushr-long v4, p1, v8

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 768
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-long v4, p1, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 769
    iput v1, v3, Lokio/Segment;->limit:I

    .line 770
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x8

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 771
    return-object p0
.end method

.method public bridge synthetic writeLong(J)Lokio/BufferedSink;
    .registers 4
    .param p1, "x0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeLongLe(J)Lokio/Buffer;
    .registers 5
    .param p1, "v"    # J

    .prologue
    .line 775
    invoke-static {p1, p2}, Lokio/Util;->reverseBytesLong(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeLongLe(J)Lokio/BufferedSink;
    .registers 4
    .param p1, "x0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLongLe(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeShort(I)Lokio/Buffer;
    .registers 10
    .param p1, "s"    # I

    .prologue
    .line 726
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 727
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 728
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 729
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 730
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 731
    iput v1, v3, Lokio/Segment;->limit:I

    .line 732
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 733
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeShortLe(I)Lokio/Buffer;
    .registers 3
    .param p1, "s"    # I

    .prologue
    .line 737
    int-to-short v0, p1

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeShortLe(I)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShortLe(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;
    .registers 6
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 671
    if-nez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "string == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 672
    :cond_a
    if-nez p2, :cond_14

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "charset == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 673
    :cond_14
    sget-object v1, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v1

    .line 675
    :goto_20
    return-object v1

    .line 674
    :cond_21
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 675
    .local v0, "data":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v1

    goto :goto_20
.end method

.method public bridge synthetic writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/BufferedSink;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;
    .registers 13
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 203
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 204
    :cond_c
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 206
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 207
    .local v6, "s":Lokio/Segment;
    :cond_14
    :goto_14
    cmp-long v0, p2, v2

    if-lez v0, :cond_4a

    .line 208
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v7, v0

    .line 209
    .local v7, "toCopy":I
    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    invoke-virtual {p1, v0, v1, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 211
    iget v0, v6, Lokio/Segment;->pos:I

    add-int/2addr v0, v7

    iput v0, v6, Lokio/Segment;->pos:I

    .line 212
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v4, v7

    sub-long/2addr v0, v4

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 213
    int-to-long v0, v7

    sub-long/2addr p2, v0

    .line 215
    iget v0, v6, Lokio/Segment;->pos:I

    iget v1, v6, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_14

    .line 216
    move-object v8, v6

    .line 217
    .local v8, "toRecycle":Lokio/Segment;
    invoke-virtual {v8}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 218
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, v8}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_14

    .line 222
    .end local v7    # "toCopy":I
    .end local v8    # "toRecycle":Lokio/Segment;
    :cond_4a
    return-object p0
.end method

.method public writeUtf8(Ljava/lang/String;)Lokio/Buffer;
    .registers 18
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 603
    if-nez p1, :cond_a

    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "string == null"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 606
    :cond_a
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v6

    .local v6, "length":I
    move v5, v4

    .end local v4    # "i":I
    .local v5, "i":I
    :goto_10
    if-ge v5, v6, :cond_10b

    .line 607
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 609
    .local v1, "c":I
    const/16 v12, 0x80

    if-ge v1, v12, :cond_64

    .line 610
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v11

    .line 611
    .local v11, "tail":Lokio/Segment;
    iget-object v3, v11, Lokio/Segment;->data:[B

    .line 612
    .local v3, "data":[B
    iget v12, v11, Lokio/Segment;->limit:I

    sub-int v10, v12, v5

    .line 613
    .local v10, "segmentOffset":I
    rsub-int v12, v10, 0x800

    invoke-static {v6, v12}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 616
    .local v8, "runLimit":I
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    add-int v12, v10, v5

    int-to-byte v13, v1

    aput-byte v13, v3, v12

    move v5, v4

    .line 620
    .end local v4    # "i":I
    .restart local v5    # "i":I
    :goto_37
    if-ge v5, v8, :cond_43

    .line 621
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 622
    const/16 v12, 0x80

    if-lt v1, v12, :cond_5b

    .line 626
    :cond_43
    add-int v12, v5, v10

    iget v13, v11, Lokio/Segment;->limit:I

    sub-int v9, v12, v13

    .line 627
    .local v9, "runSize":I
    iget v12, v11, Lokio/Segment;->limit:I

    add-int/2addr v12, v9

    iput v12, v11, Lokio/Segment;->limit:I

    .line 628
    move-object/from16 v0, p0

    iget-wide v12, v0, Lokio/Buffer;->size:J

    int-to-long v14, v9

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lokio/Buffer;->size:J

    move v4, v5

    .end local v3    # "data":[B
    .end local v5    # "i":I
    .end local v8    # "runLimit":I
    .end local v9    # "runSize":I
    .end local v10    # "segmentOffset":I
    .end local v11    # "tail":Lokio/Segment;
    .restart local v4    # "i":I
    :goto_59
    move v5, v4

    .line 665
    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_10

    .line 623
    .restart local v3    # "data":[B
    .restart local v8    # "runLimit":I
    .restart local v10    # "segmentOffset":I
    .restart local v11    # "tail":Lokio/Segment;
    :cond_5b
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    add-int v12, v10, v5

    int-to-byte v13, v1

    aput-byte v13, v3, v12

    move v5, v4

    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_37

    .line 630
    .end local v3    # "data":[B
    .end local v8    # "runLimit":I
    .end local v10    # "segmentOffset":I
    .end local v11    # "tail":Lokio/Segment;
    :cond_64
    const/16 v12, 0x800

    if-ge v1, v12, :cond_7d

    .line 632
    shr-int/lit8 v12, v1, 0x6

    or-int/lit16 v12, v12, 0xc0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 633
    and-int/lit8 v12, v1, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 634
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto :goto_59

    .line 636
    .end local v4    # "i":I
    .restart local v5    # "i":I
    :cond_7d
    const v12, 0xd800

    if-lt v1, v12, :cond_87

    const v12, 0xdfff

    if-le v1, v12, :cond_a7

    .line 638
    :cond_87
    shr-int/lit8 v12, v1, 0xc

    or-int/lit16 v12, v12, 0xe0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 639
    shr-int/lit8 v12, v1, 0x6

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 640
    and-int/lit8 v12, v1, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 641
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto :goto_59

    .line 646
    .end local v4    # "i":I
    .restart local v5    # "i":I
    :cond_a7
    add-int/lit8 v12, v5, 0x1

    if-ge v12, v6, :cond_ce

    add-int/lit8 v12, v5, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 647
    .local v7, "low":I
    :goto_b3
    const v12, 0xdbff

    if-gt v1, v12, :cond_c2

    const v12, 0xdc00

    if-lt v7, v12, :cond_c2

    const v12, 0xdfff

    if-le v7, v12, :cond_d0

    .line 648
    :cond_c2
    const/16 v12, 0x3f

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 649
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    move v5, v4

    .line 650
    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_10

    .line 646
    .end local v7    # "low":I
    :cond_ce
    const/4 v7, 0x0

    goto :goto_b3

    .line 656
    .restart local v7    # "low":I
    :cond_d0
    const/high16 v12, 0x10000

    const v13, -0xd801

    and-int/2addr v13, v1

    shl-int/lit8 v13, v13, 0xa

    const v14, -0xdc01

    and-int/2addr v14, v7

    or-int/2addr v13, v14

    add-int v2, v12, v13

    .line 659
    .local v2, "codePoint":I
    shr-int/lit8 v12, v2, 0x12

    or-int/lit16 v12, v12, 0xf0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 660
    shr-int/lit8 v12, v2, 0xc

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 661
    shr-int/lit8 v12, v2, 0x6

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 662
    and-int/lit8 v12, v2, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 663
    add-int/lit8 v4, v5, 0x2

    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto/16 :goto_59

    .line 667
    .end local v1    # "c":I
    .end local v2    # "codePoint":I
    .end local v4    # "i":I
    .end local v7    # "low":I
    .restart local v5    # "i":I
    :cond_10b
    return-object p0
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method
