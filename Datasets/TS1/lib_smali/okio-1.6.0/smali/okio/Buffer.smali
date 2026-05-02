.class public final Lokio/Buffer;
.super Ljava/lang/Object;
.source "Buffer.java"

# interfaces
.implements Lokio/BufferedSource;
.implements Lokio/BufferedSink;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final DIGITS:[B

.field static final REPLACEMENT_CHARACTER:I = 0xfffd


# instance fields
.field head:Lokio/Segment;

.field size:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lokio/Buffer;->DIGITS:[B

    return-void

    :array_a
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
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
    .line 64
    return-object p0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 762
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->skip(J)V
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_6

    .line 766
    return-void

    .line 763
    :catch_6
    move-exception v0

    .line 764
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
    .line 1410
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 1411
    .local v0, "result":Lokio/Buffer;
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_e

    .line 1419
    :goto_d
    return-object v0

    .line 1413
    :cond_e
    new-instance v2, Lokio/Segment;

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    invoke-direct {v2, v3}, Lokio/Segment;-><init>(Lokio/Segment;)V

    iput-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1414
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, v0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v4, v3, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v4, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 1415
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_25
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_38

    .line 1416
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    new-instance v3, Lokio/Segment;

    invoke-direct {v3, v1}, Lokio/Segment;-><init>(Lokio/Segment;)V

    invoke-virtual {v2, v3}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 1415
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_25

    .line 1418
    :cond_38
    iget-wide v2, p0, Lokio/Buffer;->size:J

    iput-wide v2, v0, Lokio/Buffer;->size:J

    goto :goto_d
.end method

.method public close()V
    .registers 1

    .prologue
    .line 1322
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

    if-ge v3, v4, :cond_1e

    iget-boolean v3, v2, Lokio/Segment;->owner:Z

    if-eqz v3, :cond_1e

    .line 266
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v0, v3

    :cond_1e
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
    .line 135
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
    .line 143
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_a
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 145
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-nez v0, :cond_18

    .line 162
    :cond_17
    return-object p0

    .line 148
    :cond_18
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 149
    .local v7, "s":Lokio/Segment;
    :goto_1a
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_2e

    .line 150
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr p2, v0

    .line 149
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1a

    .line 154
    :cond_2e
    :goto_2e
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_17

    .line 155
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p2

    long-to-int v6, v0

    .line 156
    .local v6, "pos":I
    iget v0, v7, Lokio/Segment;->limit:I

    sub-int/2addr v0, v6

    int-to-long v0, v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v8, v0

    .line 157
    .local v8, "toCopy":I
    iget-object v0, v7, Lokio/Segment;->data:[B

    invoke-virtual {p1, v0, v6, v8}, Ljava/io/OutputStream;->write([BII)V

    .line 158
    int-to-long v0, v8

    sub-long/2addr p4, v0

    .line 159
    const-wide/16 p2, 0x0

    .line 154
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_2e
.end method

.method public copyTo(Lokio/Buffer;JJ)Lokio/Buffer;
    .registers 16
    .param p1, "out"    # Lokio/Buffer;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J

    .prologue
    const-wide/16 v8, 0x0

    .line 167
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_c
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 169
    cmp-long v0, p4, v8

    if-nez v0, :cond_18

    .line 193
    :cond_17
    return-object p0

    .line 171
    :cond_18
    iget-wide v0, p1, Lokio/Buffer;->size:J

    add-long/2addr v0, p4

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 174
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 175
    .local v7, "s":Lokio/Segment;
    :goto_1f
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_33

    .line 176
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr p2, v0

    .line 175
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1f

    .line 180
    :cond_33
    :goto_33
    cmp-long v0, p4, v8

    if-lez v0, :cond_17

    .line 181
    new-instance v6, Lokio/Segment;

    invoke-direct {v6, v7}, Lokio/Segment;-><init>(Lokio/Segment;)V

    .line 182
    .local v6, "copy":Lokio/Segment;
    iget v0, v6, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p2

    long-to-int v0, v0

    iput v0, v6, Lokio/Segment;->pos:I

    .line 183
    iget v0, v6, Lokio/Segment;->pos:I

    long-to-int v1, p4

    add-int/2addr v0, v1

    iget v1, v6, Lokio/Segment;->limit:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, v6, Lokio/Segment;->limit:I

    .line 184
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v0, :cond_65

    .line 185
    iput-object v6, v6, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    iput-object v6, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 189
    :goto_59
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr p4, v0

    .line 190
    const-wide/16 p2, 0x0

    .line 180
    iget-object v7, v7, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_33

    .line 187
    :cond_65
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    invoke-virtual {v0, v6}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    goto :goto_59
.end method

.method public emit()Lokio/BufferedSink;
    .registers 1

    .prologue
    .line 94
    return-object p0
.end method

.method public emitCompleteSegments()Lokio/Buffer;
    .registers 1

    .prologue
    .line 90
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
    .line 1340
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_8

    const/4 v14, 0x1

    .line 1369
    :goto_7
    return v14

    .line 1341
    :cond_8
    move-object/from16 v0, p1

    instance-of v14, v0, Lokio/Buffer;

    if-nez v14, :cond_10

    const/4 v14, 0x0

    goto :goto_7

    :cond_10
    move-object/from16 v13, p1

    .line 1342
    check-cast v13, Lokio/Buffer;

    .line 1343
    .local v13, "that":Lokio/Buffer;
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    iget-wide v0, v13, Lokio/Buffer;->size:J

    move-wide/from16 v16, v0

    cmp-long v14, v14, v16

    if-eqz v14, :cond_22

    const/4 v14, 0x0

    goto :goto_7

    .line 1344
    :cond_22
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-nez v14, :cond_2e

    const/4 v14, 0x1

    goto :goto_7

    .line 1346
    :cond_2e
    move-object/from16 v0, p0

    iget-object v11, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1347
    .local v11, "sa":Lokio/Segment;
    iget-object v12, v13, Lokio/Buffer;->head:Lokio/Segment;

    .line 1348
    .local v12, "sb":Lokio/Segment;
    iget v7, v11, Lokio/Segment;->pos:I

    .line 1349
    .local v7, "posA":I
    iget v9, v12, Lokio/Segment;->pos:I

    .line 1351
    .local v9, "posB":I
    const-wide/16 v5, 0x0

    .local v5, "pos":J
    :goto_3a
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    cmp-long v14, v5, v14

    if-gez v14, :cond_7c

    .line 1352
    iget v14, v11, Lokio/Segment;->limit:I

    sub-int/2addr v14, v7

    iget v15, v12, Lokio/Segment;->limit:I

    sub-int/2addr v15, v9

    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v14

    int-to-long v2, v14

    .line 1354
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

    .line 1355
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

    .line 1354
    :cond_65
    add-int/lit8 v4, v4, 0x1

    move v10, v9

    .end local v9    # "posB":I
    .restart local v10    # "posB":I
    move v8, v7

    .end local v7    # "posA":I
    .restart local v8    # "posA":I
    goto :goto_50

    .line 1358
    :cond_6a
    iget v14, v11, Lokio/Segment;->limit:I

    if-ne v8, v14, :cond_80

    .line 1359
    iget-object v11, v11, Lokio/Segment;->next:Lokio/Segment;

    .line 1360
    iget v7, v11, Lokio/Segment;->pos:I

    .line 1363
    .end local v8    # "posA":I
    .restart local v7    # "posA":I
    :goto_72
    iget v14, v12, Lokio/Segment;->limit:I

    if-ne v10, v14, :cond_7e

    .line 1364
    iget-object v12, v12, Lokio/Segment;->next:Lokio/Segment;

    .line 1365
    iget v9, v12, Lokio/Segment;->pos:I

    .line 1351
    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    :goto_7a
    add-long/2addr v5, v2

    goto :goto_3a

    .line 1369
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
    .line 98
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
    .line 1319
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
    .line 1373
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1374
    .local v3, "s":Lokio/Segment;
    if-nez v3, :cond_6

    const/4 v2, 0x0

    .line 1382
    :goto_5
    return v2

    .line 1375
    :cond_6
    const/4 v2, 0x1

    .line 1377
    .local v2, "result":I
    :cond_7
    iget v1, v3, Lokio/Segment;->pos:I

    .local v1, "pos":I
    iget v0, v3, Lokio/Segment;->limit:I

    .local v0, "limit":I
    :goto_b
    if-ge v1, v0, :cond_18

    .line 1378
    mul-int/lit8 v4, v2, 0x1f

    iget-object v5, v3, Lokio/Segment;->data:[B

    aget-byte v5, v5, v1

    add-int v2, v4, v5

    .line 1377
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1380
    :cond_18
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    .line 1381
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v3, v4, :cond_7

    goto :goto_5
.end method

.method public indexOf(B)J
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 1226
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(BJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(BJ)J
    .registers 15
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J

    .prologue
    const-wide/16 v7, -0x1

    .line 1234
    const-wide/16 v9, 0x0

    cmp-long v9, p2, v9

    if-gez v9, :cond_10

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "fromIndex < 0"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1236
    :cond_10
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1237
    .local v5, "s":Lokio/Segment;
    if-nez v5, :cond_15

    .line 1253
    :goto_14
    return-wide v7

    .line 1238
    :cond_15
    const-wide/16 v2, 0x0

    .line 1240
    .local v2, "offset":J
    :cond_17
    iget v9, v5, Lokio/Segment;->limit:I

    iget v10, v5, Lokio/Segment;->pos:I

    sub-int v6, v9, v10

    .line 1241
    .local v6, "segmentByteCount":I
    int-to-long v9, v6

    cmp-long v9, p2, v9

    if-ltz v9, :cond_2d

    .line 1242
    int-to-long v9, v6

    sub-long/2addr p2, v9

    .line 1250
    :goto_24
    int-to-long v9, v6

    add-long/2addr v2, v9

    .line 1251
    iget-object v5, v5, Lokio/Segment;->next:Lokio/Segment;

    .line 1252
    iget-object v9, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v5, v9, :cond_17

    goto :goto_14

    .line 1244
    :cond_2d
    iget-object v0, v5, Lokio/Segment;->data:[B

    .line 1245
    .local v0, "data":[B
    iget v9, v5, Lokio/Segment;->pos:I

    int-to-long v9, v9

    add-long/2addr v9, p2

    long-to-int v4, v9

    .local v4, "pos":I
    iget v1, v5, Lokio/Segment;->limit:I

    .local v1, "limit":I
    :goto_36
    if-ge v4, v1, :cond_46

    .line 1246
    aget-byte v9, v0, v4

    if-ne v9, p1, :cond_43

    int-to-long v7, v4

    add-long/2addr v7, v2

    iget v9, v5, Lokio/Segment;->pos:I

    int-to-long v9, v9

    sub-long/2addr v7, v9

    goto :goto_14

    .line 1245
    :cond_43
    add-int/lit8 v4, v4, 0x1

    goto :goto_36

    .line 1248
    :cond_46
    const-wide/16 p2, 0x0

    goto :goto_24
.end method

.method public indexOf(Lokio/ByteString;)J
    .registers 4
    .param p1, "bytes"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1257
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(Lokio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(Lokio/ByteString;J)J
    .registers 8
    .param p1, "bytes"    # Lokio/ByteString;
    .param p2, "fromIndex"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v0, -0x1

    .line 1261
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v2

    if-nez v2, :cond_13

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bytes is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1270
    :cond_10
    const-wide/16 v2, 0x1

    add-long/2addr p2, v2

    .line 1263
    :cond_13
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lokio/ByteString;->getByte(I)B

    move-result v2

    invoke-virtual {p0, v2, p2, p3}, Lokio/Buffer;->indexOf(BJ)J

    move-result-wide p2

    .line 1264
    cmp-long v2, p2, v0

    if-nez v2, :cond_22

    move-wide p2, v0

    .line 1268
    .end local p2    # "fromIndex":J
    :goto_21
    return-wide p2

    .line 1267
    .restart local p2    # "fromIndex":J
    :cond_22
    invoke-virtual {p0, p2, p3, p1}, Lokio/Buffer;->rangeEquals(JLokio/ByteString;)Z

    move-result v2

    if-eqz v2, :cond_10

    goto :goto_21
.end method

.method public indexOfElement(Lokio/ByteString;)J
    .registers 4
    .param p1, "targetBytes"    # Lokio/ByteString;

    .prologue
    .line 1275
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOfElement(Lokio/ByteString;J)J
    .registers 21
    .param p1, "targetBytes"    # Lokio/ByteString;
    .param p2, "fromIndex"    # J

    .prologue
    .line 1279
    const-wide/16 v13, 0x0

    cmp-long v13, p2, v13

    if-gez v13, :cond_e

    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "fromIndex < 0"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 1281
    :cond_e
    move-object/from16 v0, p0

    iget-object v9, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1282
    .local v9, "s":Lokio/Segment;
    if-nez v9, :cond_17

    const-wide/16 v13, -0x1

    .line 1302
    :goto_16
    return-wide v13

    .line 1283
    :cond_17
    const-wide/16 v5, 0x0

    .line 1284
    .local v5, "offset":J
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->toByteArray()[B

    move-result-object v12

    .line 1286
    .local v12, "toFind":[B
    :cond_1d
    iget v13, v9, Lokio/Segment;->limit:I

    iget v14, v9, Lokio/Segment;->pos:I

    sub-int v10, v13, v14

    .line 1287
    .local v10, "segmentByteCount":I
    int-to-long v13, v10

    cmp-long v13, p2, v13

    if-ltz v13, :cond_38

    .line 1288
    int-to-long v13, v10

    sub-long p2, p2, v13

    .line 1299
    :goto_2b
    int-to-long v13, v10

    add-long/2addr v5, v13

    .line 1300
    iget-object v9, v9, Lokio/Segment;->next:Lokio/Segment;

    .line 1301
    move-object/from16 v0, p0

    iget-object v13, v0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v9, v13, :cond_1d

    .line 1302
    const-wide/16 v13, -0x1

    goto :goto_16

    .line 1290
    :cond_38
    iget-object v2, v9, Lokio/Segment;->data:[B

    .line 1291
    .local v2, "data":[B
    iget v13, v9, Lokio/Segment;->pos:I

    int-to-long v13, v13

    add-long v7, v13, p2

    .local v7, "pos":J
    iget v13, v9, Lokio/Segment;->limit:I

    int-to-long v3, v13

    .local v3, "limit":J
    :goto_42
    cmp-long v13, v7, v3

    if-gez v13, :cond_5f

    .line 1292
    long-to-int v13, v7

    aget-byte v1, v2, v13

    .line 1293
    .local v1, "b":B
    array-length v14, v12

    const/4 v13, 0x0

    :goto_4b
    if-ge v13, v14, :cond_5b

    aget-byte v11, v12, v13

    .line 1294
    .local v11, "targetByte":B
    if-ne v1, v11, :cond_58

    add-long v13, v5, v7

    iget v15, v9, Lokio/Segment;->pos:I

    int-to-long v15, v15

    sub-long/2addr v13, v15

    goto :goto_16

    .line 1293
    :cond_58
    add-int/lit8 v13, v13, 0x1

    goto :goto_4b

    .line 1291
    .end local v11    # "targetByte":B
    :cond_5b
    const-wide/16 v13, 0x1

    add-long/2addr v7, v13

    goto :goto_42

    .line 1297
    .end local v1    # "b":B
    :cond_5f
    const-wide/16 p2, 0x0

    goto :goto_2b
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 110
    new-instance v0, Lokio/Buffer$2;

    invoke-direct {v0, p0}, Lokio/Buffer$2;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 68
    new-instance v0, Lokio/Buffer$1;

    invoke-direct {v0, p0}, Lokio/Buffer$1;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method rangeEquals(JLokio/ByteString;)Z
    .registers 11
    .param p1, "offset"    # J
    .param p3, "bytes"    # Lokio/ByteString;

    .prologue
    const/4 v2, 0x0

    .line 1306
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v0

    .line 1307
    .local v0, "byteCount":I
    iget-wide v3, p0, Lokio/Buffer;->size:J

    sub-long/2addr v3, p1

    int-to-long v5, v0

    cmp-long v3, v3, v5

    if-gez v3, :cond_e

    .line 1315
    :cond_d
    :goto_d
    return v2

    .line 1310
    :cond_e
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v0, :cond_20

    .line 1311
    int-to-long v3, v1

    add-long/2addr v3, p1

    invoke-virtual {p0, v3, v4}, Lokio/Buffer;->getByte(J)B

    move-result v3

    invoke-virtual {p3, v1}, Lokio/ByteString;->getByte(I)B

    move-result v4

    if-ne v3, v4, :cond_d

    .line 1310
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 1315
    :cond_20
    const/4 v2, 0x1

    goto :goto_d
.end method

.method public read([B)I
    .registers 4
    .param p1, "sink"    # [B

    .prologue
    .line 725
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
    .line 738
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 740
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 741
    .local v6, "s":Lokio/Segment;
    if-nez v6, :cond_d

    const/4 v7, -0x1

    .line 753
    :cond_c
    :goto_c
    return v7

    .line 742
    :cond_d
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 743
    .local v7, "toCopy":I
    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    invoke-static {v0, v1, p1, p2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 745
    iget v0, v6, Lokio/Segment;->pos:I

    add-int/2addr v0, v7

    iput v0, v6, Lokio/Segment;->pos:I

    .line 746
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, v7

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 748
    iget v0, v6, Lokio/Segment;->pos:I

    iget v1, v6, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_c

    .line 749
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 750
    invoke-static {v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_c
.end method

.method public read(Lokio/Buffer;J)J
    .registers 8
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 1217
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sink == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1218
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

    .line 1219
    :cond_29
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_32

    const-wide/16 v0, -0x1

    .line 1222
    :goto_31
    return-wide v0

    .line 1220
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, p2, v0

    if-lez v0, :cond_3a

    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 1221
    :cond_3a
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    move-wide v0, p2

    .line 1222
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
    .line 541
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 542
    .local v0, "byteCount":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_b

    .line 543
    invoke-interface {p1, p0, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 545
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
    if-ne v4, v2, :cond_2f

    .line 284
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 285
    invoke-static {v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 290
    :goto_2e
    return v0

    .line 287
    :cond_2f
    iput v4, v5, Lokio/Segment;->pos:I

    goto :goto_2e
.end method

.method public readByteArray()[B
    .registers 4

    .prologue
    .line 707
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->readByteArray(J)[B
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 708
    :catch_7
    move-exception v0

    .line 709
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
    .line 714
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 715
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_28

    .line 716
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

    .line 719
    :cond_28
    long-to-int v0, p1

    new-array v6, v0, [B

    .line 720
    .local v6, "result":[B
    invoke-virtual {p0, v6}, Lokio/Buffer;->readFully([B)V

    .line 721
    return-object v6
.end method

.method public readByteString()Lokio/ByteString;
    .registers 3

    .prologue
    .line 525
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
    .line 529
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readDecimalLong()J
    .registers 24

    .prologue
    .line 411
    move-object/from16 v0, p0

    iget-wide v0, v0, Lokio/Buffer;->size:J

    move-wide/from16 v19, v0

    const-wide/16 v21, 0x0

    cmp-long v19, v19, v21

    if-nez v19, :cond_14

    new-instance v19, Ljava/lang/IllegalStateException;

    const-string v20, "size == 0"

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 414
    :cond_14
    const-wide/16 v17, 0x0

    .line 415
    .local v17, "value":J
    const/4 v15, 0x0

    .line 416
    .local v15, "seen":I
    const/4 v9, 0x0

    .line 417
    .local v9, "negative":Z
    const/4 v7, 0x0

    .line 419
    .local v7, "done":Z
    const-wide v12, -0xcccccccccccccccL

    .line 420
    .local v12, "overflowZone":J
    const-wide/16 v10, -0x7

    .line 423
    .local v10, "overflowDigit":J
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lokio/Buffer;->head:Lokio/Segment;

    move-object/from16 v16, v0

    .line 425
    .local v16, "segment":Lokio/Segment;
    move-object/from16 v0, v16

    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 426
    .local v5, "data":[B
    move-object/from16 v0, v16

    iget v14, v0, Lokio/Segment;->pos:I

    .line 427
    .local v14, "pos":I
    move-object/from16 v0, v16

    iget v8, v0, Lokio/Segment;->limit:I

    .line 429
    .local v8, "limit":I
    :goto_32
    if-ge v14, v8, :cond_c4

    .line 430
    aget-byte v3, v5, v14

    .line 431
    .local v3, "b":B
    const/16 v19, 0x30

    move/from16 v0, v19

    if-lt v3, v0, :cond_96

    const/16 v19, 0x39

    move/from16 v0, v19

    if-gt v3, v0, :cond_96

    .line 432
    rsub-int/lit8 v6, v3, 0x30

    .line 435
    .local v6, "digit":I
    cmp-long v19, v17, v12

    if-ltz v19, :cond_53

    cmp-long v19, v17, v12

    if-nez v19, :cond_88

    int-to-long v0, v6

    move-wide/from16 v19, v0

    cmp-long v19, v19, v10

    if-gez v19, :cond_88

    .line 436
    :cond_53
    new-instance v19, Lokio/Buffer;

    invoke-direct/range {v19 .. v19}, Lokio/Buffer;-><init>()V

    move-object/from16 v0, v19

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v4

    .line 437
    .local v4, "buffer":Lokio/Buffer;
    if-nez v9, :cond_6b

    invoke-virtual {v4}, Lokio/Buffer;->readByte()B

    .line 438
    :cond_6b
    new-instance v19, Ljava/lang/NumberFormatException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Number too large: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v4}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 440
    .end local v4    # "buffer":Lokio/Buffer;
    :cond_88
    const-wide/16 v19, 0xa

    mul-long v17, v17, v19

    .line 441
    int-to-long v0, v6

    move-wide/from16 v19, v0

    add-long v17, v17, v19

    .line 429
    .end local v6    # "digit":I
    :goto_91
    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v15, v15, 0x1

    goto :goto_32

    .line 442
    :cond_96
    const/16 v19, 0x2d

    move/from16 v0, v19

    if-ne v3, v0, :cond_a4

    if-nez v15, :cond_a4

    .line 443
    const/4 v9, 0x1

    .line 444
    const-wide/16 v19, 0x1

    sub-long v10, v10, v19

    goto :goto_91

    .line 446
    :cond_a4
    if-nez v15, :cond_c3

    .line 447
    new-instance v19, Ljava/lang/NumberFormatException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Expected leading [0-9] or \'-\' character but was 0x"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 448
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 451
    :cond_c3
    const/4 v7, 0x1

    .line 456
    .end local v3    # "b":B
    :cond_c4
    if-ne v14, v8, :cond_f1

    .line 457
    invoke-virtual/range {v16 .. v16}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lokio/Buffer;->head:Lokio/Segment;

    .line 458
    invoke-static/range {v16 .. v16}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 462
    :goto_d3
    if-nez v7, :cond_dd

    move-object/from16 v0, p0

    iget-object v0, v0, Lokio/Buffer;->head:Lokio/Segment;

    move-object/from16 v19, v0

    if-nez v19, :cond_20

    .line 464
    :cond_dd
    move-object/from16 v0, p0

    iget-wide v0, v0, Lokio/Buffer;->size:J

    move-wide/from16 v19, v0

    int-to-long v0, v15

    move-wide/from16 v21, v0

    sub-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, p0

    iput-wide v0, v2, Lokio/Buffer;->size:J

    .line 465
    if-eqz v9, :cond_f6

    .end local v17    # "value":J
    :goto_f0
    return-wide v17

    .line 460
    .restart local v17    # "value":J
    :cond_f1
    move-object/from16 v0, v16

    iput v14, v0, Lokio/Segment;->pos:I

    goto :goto_d3

    .line 465
    :cond_f6
    move-wide/from16 v0, v17

    neg-long v0, v0

    move-wide/from16 v17, v0

    goto :goto_f0
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
    .line 533
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p2

    if-gez v0, :cond_11

    .line 534
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p1, p0, v0, v1}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 535
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 537
    :cond_11
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 538
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
    .line 729
    const/4 v0, 0x0

    .line 730
    .local v0, "offset":I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_15

    .line 731
    array-length v2, p1

    sub-int/2addr v2, v0

    invoke-virtual {p0, p1, v0, v2}, Lokio/Buffer;->read([BII)I

    move-result v1

    .line 732
    .local v1, "read":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_13

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 733
    :cond_13
    add-int/2addr v0, v1

    .line 734
    goto :goto_1

    .line 735
    .end local v1    # "read":I
    :cond_15
    return-void
.end method

.method public readHexadecimalUnsignedLong()J
    .registers 16

    .prologue
    const-wide/16 v13, 0x0

    .line 469
    iget-wide v11, p0, Lokio/Buffer;->size:J

    cmp-long v11, v11, v13

    if-nez v11, :cond_10

    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "size == 0"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 471
    :cond_10
    const-wide/16 v9, 0x0

    .line 472
    .local v9, "value":J
    const/4 v7, 0x0

    .line 473
    .local v7, "seen":I
    const/4 v4, 0x0

    .line 476
    .local v4, "done":Z
    :cond_14
    iget-object v8, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 478
    .local v8, "segment":Lokio/Segment;
    iget-object v2, v8, Lokio/Segment;->data:[B

    .line 479
    .local v2, "data":[B
    iget v6, v8, Lokio/Segment;->pos:I

    .line 480
    .local v6, "pos":I
    iget v5, v8, Lokio/Segment;->limit:I

    .line 482
    .local v5, "limit":I
    :goto_1c
    if-ge v6, v5, :cond_95

    .line 485
    aget-byte v0, v2, v6

    .line 486
    .local v0, "b":B
    const/16 v11, 0x30

    if-lt v0, v11, :cond_5b

    const/16 v11, 0x39

    if-gt v0, v11, :cond_5b

    .line 487
    add-int/lit8 v3, v0, -0x30

    .line 503
    .local v3, "digit":I
    :goto_2a
    const-wide/high16 v11, -0x1000000000000000L    # -3.105036184601418E231

    and-long/2addr v11, v9

    cmp-long v11, v11, v13

    if-eqz v11, :cond_ad

    .line 504
    new-instance v11, Lokio/Buffer;

    invoke-direct {v11}, Lokio/Buffer;-><init>()V

    invoke-virtual {v11, v9, v10}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    move-result-object v11

    invoke-virtual {v11, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v1

    .line 505
    .local v1, "buffer":Lokio/Buffer;
    new-instance v11, Ljava/lang/NumberFormatException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Number too large: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 488
    .end local v1    # "buffer":Lokio/Buffer;
    .end local v3    # "digit":I
    :cond_5b
    const/16 v11, 0x61

    if-lt v0, v11, :cond_68

    const/16 v11, 0x66

    if-gt v0, v11, :cond_68

    .line 489
    add-int/lit8 v11, v0, -0x61

    add-int/lit8 v3, v11, 0xa

    .restart local v3    # "digit":I
    goto :goto_2a

    .line 490
    .end local v3    # "digit":I
    :cond_68
    const/16 v11, 0x41

    if-lt v0, v11, :cond_75

    const/16 v11, 0x46

    if-gt v0, v11, :cond_75

    .line 491
    add-int/lit8 v11, v0, -0x41

    add-int/lit8 v3, v11, 0xa

    .restart local v3    # "digit":I
    goto :goto_2a

    .line 493
    .end local v3    # "digit":I
    :cond_75
    if-nez v7, :cond_94

    .line 494
    new-instance v11, Ljava/lang/NumberFormatException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 495
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 498
    :cond_94
    const/4 v4, 0x1

    .line 512
    .end local v0    # "b":B
    :cond_95
    if-ne v6, v5, :cond_b7

    .line 513
    invoke-virtual {v8}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v11

    iput-object v11, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 514
    invoke-static {v8}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 518
    :goto_a0
    if-nez v4, :cond_a6

    iget-object v11, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v11, :cond_14

    .line 520
    :cond_a6
    iget-wide v11, p0, Lokio/Buffer;->size:J

    int-to-long v13, v7

    sub-long/2addr v11, v13

    iput-wide v11, p0, Lokio/Buffer;->size:J

    .line 521
    return-wide v9

    .line 508
    .restart local v0    # "b":B
    .restart local v3    # "digit":I
    :cond_ad
    const/4 v11, 0x4

    shl-long/2addr v9, v11

    .line 509
    int-to-long v11, v3

    or-long/2addr v9, v11

    .line 482
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1c

    .line 516
    .end local v0    # "b":B
    .end local v3    # "digit":I
    :cond_b7
    iput v6, v8, Lokio/Segment;->pos:I

    goto :goto_a0
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

    .line 342
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    .line 343
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    .line 344
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
    if-ne v3, v2, :cond_86

    .line 355
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 356
    invoke-static {v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_50

    .line 358
    :cond_86
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

    .line 374
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
    if-ne v2, v1, :cond_bd

    .line 389
    invoke-virtual {v4}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v7

    iput-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 390
    invoke-static {v4}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_4a

    .line 392
    :cond_bd
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

    .line 313
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
    if-ne v2, v1, :cond_64

    .line 323
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 324
    invoke-static {v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 329
    :goto_62
    int-to-short v6, v4

    goto :goto_3f

    .line 326
    :cond_64
    iput v2, v5, Lokio/Segment;->pos:I

    goto :goto_62
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

    .line 569
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 570
    if-nez p3, :cond_12

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 571
    :cond_12
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_32

    .line 572
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

    .line 574
    :cond_32
    cmp-long v0, p1, v2

    if-nez v0, :cond_39

    const-string v6, ""

    .line 591
    :cond_38
    :goto_38
    return-object v6

    .line 576
    :cond_39
    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 577
    .local v7, "s":Lokio/Segment;
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    iget v2, v7, Lokio/Segment;->limit:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_50

    .line 579
    new-instance v6, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v0

    invoke-direct {v6, v0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_38

    .line 582
    :cond_50
    new-instance v6, Ljava/lang/String;

    iget-object v0, v7, Lokio/Segment;->data:[B

    iget v1, v7, Lokio/Segment;->pos:I

    long-to-int v2, p1

    invoke-direct {v6, v0, v1, v2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 583
    .local v6, "result":Ljava/lang/String;
    iget v0, v7, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, v7, Lokio/Segment;->pos:I

    .line 584
    iget-wide v0, p0, Lokio/Buffer;->size:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 586
    iget v0, v7, Lokio/Segment;->pos:I

    iget v1, v7, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_38

    .line 587
    invoke-virtual {v7}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 588
    invoke-static {v7}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_38
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 5
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 562
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v1, v2, p1}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 563
    :catch_7
    move-exception v0

    .line 564
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readUtf8()Ljava/lang/String;
    .registers 5

    .prologue
    .line 550
    :try_start_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    sget-object v3, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1, v2, v3}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 551
    :catch_9
    move-exception v0

    .line 552
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
    .line 557
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8CodePoint()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    const v6, 0xfffd

    .line 631
    iget-wide v7, p0, Lokio/Buffer;->size:J

    cmp-long v7, v7, v9

    if-nez v7, :cond_11

    new-instance v6, Ljava/io/EOFException;

    invoke-direct {v6}, Ljava/io/EOFException;-><init>()V

    throw v6

    .line 633
    :cond_11
    invoke-virtual {p0, v9, v10}, Lokio/Buffer;->getByte(J)B

    move-result v1

    .line 638
    .local v1, "b0":B
    and-int/lit16 v7, v1, 0x80

    if-nez v7, :cond_5d

    .line 640
    and-int/lit8 v3, v1, 0x7f

    .line 641
    .local v3, "codePoint":I
    const/4 v2, 0x1

    .line 642
    .local v2, "byteCount":I
    const/4 v5, 0x0

    .line 668
    .local v5, "min":I
    :goto_1d
    iget-wide v7, p0, Lokio/Buffer;->size:J

    int-to-long v9, v2

    cmp-long v7, v7, v9

    if-gez v7, :cond_88

    .line 669
    new-instance v6, Ljava/io/EOFException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "size < "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " (to read code point prefixed 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 670
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 644
    .end local v2    # "byteCount":I
    .end local v3    # "codePoint":I
    .end local v5    # "min":I
    :cond_5d
    and-int/lit16 v7, v1, 0xe0

    const/16 v8, 0xc0

    if-ne v7, v8, :cond_69

    .line 646
    and-int/lit8 v3, v1, 0x1f

    .line 647
    .restart local v3    # "codePoint":I
    const/4 v2, 0x2

    .line 648
    .restart local v2    # "byteCount":I
    const/16 v5, 0x80

    .restart local v5    # "min":I
    goto :goto_1d

    .line 650
    .end local v2    # "byteCount":I
    .end local v3    # "codePoint":I
    .end local v5    # "min":I
    :cond_69
    and-int/lit16 v7, v1, 0xf0

    const/16 v8, 0xe0

    if-ne v7, v8, :cond_75

    .line 652
    and-int/lit8 v3, v1, 0xf

    .line 653
    .restart local v3    # "codePoint":I
    const/4 v2, 0x3

    .line 654
    .restart local v2    # "byteCount":I
    const/16 v5, 0x800

    .restart local v5    # "min":I
    goto :goto_1d

    .line 656
    .end local v2    # "byteCount":I
    .end local v3    # "codePoint":I
    .end local v5    # "min":I
    :cond_75
    and-int/lit16 v7, v1, 0xf8

    const/16 v8, 0xf0

    if-ne v7, v8, :cond_81

    .line 658
    and-int/lit8 v3, v1, 0x7

    .line 659
    .restart local v3    # "codePoint":I
    const/4 v2, 0x4

    .line 660
    .restart local v2    # "byteCount":I
    const/high16 v5, 0x10000

    .restart local v5    # "min":I
    goto :goto_1d

    .line 664
    .end local v2    # "byteCount":I
    .end local v3    # "codePoint":I
    .end local v5    # "min":I
    :cond_81
    const-wide/16 v7, 0x1

    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->skip(J)V

    move v3, v6

    .line 702
    :cond_87
    :goto_87
    return v3

    .line 676
    .restart local v2    # "byteCount":I
    .restart local v3    # "codePoint":I
    .restart local v5    # "min":I
    :cond_88
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_89
    if-ge v4, v2, :cond_a4

    .line 677
    int-to-long v7, v4

    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->getByte(J)B

    move-result v0

    .line 678
    .local v0, "b":B
    and-int/lit16 v7, v0, 0xc0

    const/16 v8, 0x80

    if-ne v7, v8, :cond_9e

    .line 680
    shl-int/lit8 v3, v3, 0x6

    .line 681
    and-int/lit8 v7, v0, 0x3f

    or-int/2addr v3, v7

    .line 676
    add-int/lit8 v4, v4, 0x1

    goto :goto_89

    .line 683
    :cond_9e
    int-to-long v7, v4

    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->skip(J)V

    move v3, v6

    .line 684
    goto :goto_87

    .line 688
    .end local v0    # "b":B
    :cond_a4
    int-to-long v7, v2

    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->skip(J)V

    .line 690
    const v7, 0x10ffff

    if-le v3, v7, :cond_af

    move v3, v6

    .line 691
    goto :goto_87

    .line 694
    :cond_af
    const v7, 0xd800

    if-lt v3, v7, :cond_bb

    const v7, 0xdfff

    if-gt v3, v7, :cond_bb

    move v3, v6

    .line 695
    goto :goto_87

    .line 698
    :cond_bb
    if-ge v3, v5, :cond_87

    move v3, v6

    .line 699
    goto :goto_87
.end method

.method public readUtf8Line()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 595
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v0

    .line 597
    .local v0, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_1d

    .line 598
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1b

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v2

    .line 601
    :goto_1a
    return-object v2

    .line 598
    :cond_1b
    const/4 v2, 0x0

    goto :goto_1a

    .line 601
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

    .line 616
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_1f

    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1f

    .line 618
    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 619
    .local v0, "result":Ljava/lang/String;
    const-wide/16 v2, 0x2

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 626
    .end local v0    # "result":Ljava/lang/String;
    .local v1, "result":Ljava/lang/String;
    :goto_1e
    return-object v1

    .line 624
    .end local v1    # "result":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 625
    .restart local v0    # "result":Ljava/lang/String;
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 626
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
    .line 605
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v6

    .line 606
    .local v6, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v0, v6, v2

    if-nez v0, :cond_54

    .line 607
    new-instance v1, Lokio/Buffer;

    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    .line 608
    .local v1, "data":Lokio/Buffer;
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x20

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    .line 609
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

    .line 610
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

    .line 612
    .end local v1    # "data":Lokio/Buffer;
    :cond_54
    invoke-virtual {p0, v6, v7}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public request(J)Z
    .registers 5
    .param p1, "byteCount"    # J

    .prologue
    .line 106
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
    .line 102
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_c

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 103
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
    .line 1330
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v2, :cond_9

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 1336
    :cond_8
    return-object v0

    .line 1331
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1332
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->limit:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1333
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_22
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_8

    .line 1334
    iget v2, v1, Lokio/Segment;->limit:I

    iget v3, v1, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1333
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_22
.end method

.method public size()J
    .registers 3

    .prologue
    .line 60
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
    .line 770
    :cond_0
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_44

    .line 771
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v2, :cond_10

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 773
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

    .line 774
    .local v1, "toSkip":I
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 775
    int-to-long v2, v1

    sub-long/2addr p1, v2

    .line 776
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v2, Lokio/Segment;->pos:I

    add-int/2addr v3, v1

    iput v3, v2, Lokio/Segment;->pos:I

    .line 778
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_0

    .line 779
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 780
    .local v0, "toRecycle":Lokio/Segment;
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 781
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 784
    .end local v0    # "toRecycle":Lokio/Segment;
    .end local v1    # "toSkip":I
    :cond_44
    return-void
.end method

.method public snapshot()Lokio/ByteString;
    .registers 5

    .prologue
    .line 1424
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_24

    .line 1425
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1427
    :cond_24
    iget-wide v0, p0, Lokio/Buffer;->size:J

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->snapshot(I)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public snapshot(I)Lokio/ByteString;
    .registers 3
    .param p1, "byteCount"    # I

    .prologue
    .line 1434
    if-nez p1, :cond_5

    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 1435
    :goto_4
    return-object v0

    :cond_5
    new-instance v0, Lokio/SegmentedByteString;

    invoke-direct {v0, p0, p1}, Lokio/SegmentedByteString;-><init>(Lokio/Buffer;I)V

    goto :goto_4
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 1325
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 12

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1386
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_e

    .line 1387
    const-string v4, "Buffer[size=0]"

    .line 1401
    :goto_d
    return-object v4

    .line 1390
    :cond_e
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x10

    cmp-long v4, v4, v6

    if-gtz v4, :cond_35

    .line 1391
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v0

    .line 1392
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

    .line 1396
    .end local v0    # "data":Lokio/ByteString;
    :cond_35
    :try_start_35
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 1397
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

    .line 1398
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v3, v4, Lokio/Segment;->next:Lokio/Segment;

    .local v3, "s":Lokio/Segment;
    :goto_53
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v3, v4, :cond_66

    .line 1399
    iget-object v4, v3, Lokio/Segment;->data:[B

    iget v5, v3, Lokio/Segment;->pos:I

    iget v6, v3, Lokio/Segment;->limit:I

    iget v7, v3, Lokio/Segment;->pos:I

    sub-int/2addr v6, v7

    invoke-virtual {v2, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 1398
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_53

    .line 1401
    :cond_66
    const-string v4, "Buffer[size=%s md5=%s]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v7, p0, Lokio/Buffer;->size:J

    .line 1402
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

    .line 1401
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_86
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_35 .. :try_end_86} :catch_88

    move-result-object v4

    goto :goto_d

    .line 1403
    .end local v2    # "md5":Ljava/security/MessageDigest;
    .end local v3    # "s":Lokio/Segment;
    :catch_88
    move-exception v1

    .line 1404
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

    .line 1111
    const/4 v1, 0x1

    if-lt p1, v1, :cond_7

    if-le p1, v2, :cond_d

    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 1113
    :cond_d
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v1, :cond_22

    .line 1114
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1115
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v0, v2, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v0, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 1122
    :cond_21
    :goto_21
    return-object v0

    .line 1118
    :cond_22
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 1119
    .local v0, "tail":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->limit:I

    add-int/2addr v1, p1

    if-gt v1, v2, :cond_2f

    iget-boolean v1, v0, Lokio/Segment;->owner:Z

    if-nez v1, :cond_21

    .line 1120
    :cond_2f
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v0

    goto :goto_21
.end method

.method public write(Lokio/ByteString;)Lokio/Buffer;
    .registers 4
    .param p1, "byteString"    # Lokio/ByteString;

    .prologue
    .line 787
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byteString == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 788
    :cond_a
    invoke-virtual {p1, p0}, Lokio/ByteString;->write(Lokio/Buffer;)V

    .line 789
    return-object p0
.end method

.method public write([B)Lokio/Buffer;
    .registers 4
    .param p1, "source"    # [B

    .prologue
    .line 930
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 931
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
    .line 935
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 936
    :cond_a
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 938
    add-int v6, p2, p3

    .line 939
    .local v6, "limit":I
    :goto_13
    if-ge p2, v6, :cond_32

    .line 940
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v7

    .line 942
    .local v7, "tail":Lokio/Segment;
    sub-int v0, v6, p2

    iget v1, v7, Lokio/Segment;->limit:I

    rsub-int v1, v1, 0x800

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 943
    .local v8, "toCopy":I
    iget-object v0, v7, Lokio/Segment;->data:[B

    iget v1, v7, Lokio/Segment;->limit:I

    invoke-static {p1, p2, v0, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 945
    add-int/2addr p2, v8

    .line 946
    iget v0, v7, Lokio/Segment;->limit:I

    add-int/2addr v0, v8

    iput v0, v7, Lokio/Segment;->limit:I

    goto :goto_13

    .line 949
    .end local v7    # "tail":Lokio/Segment;
    .end local v8    # "toCopy":I
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 950
    return-object p0
.end method

.method public bridge synthetic write(Lokio/ByteString;)Lokio/BufferedSink;
    .registers 3
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
    .registers 8
    .param p1, "source"    # Lokio/Source;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 963
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-lez v2, :cond_18

    .line 964
    invoke-interface {p1, p0, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 965
    .local v0, "read":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_16

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 966
    :cond_16
    sub-long/2addr p2, v0

    .line 967
    goto :goto_0

    .line 968
    .end local v0    # "read":J
    :cond_18
    return-object p0
.end method

.method public bridge synthetic write([B)Lokio/BufferedSink;
    .registers 3
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

    .line 1176
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1177
    :cond_c
    if-ne p1, p0, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == this"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1178
    :cond_16
    iget-wide v0, p1, Lokio/Buffer;->size:J

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 1180
    :goto_1c
    cmp-long v0, p2, v2

    if-lez v0, :cond_5f

    .line 1182
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_6e

    .line 1183
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_60

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 1184
    .local v9, "tail":Lokio/Segment;
    :goto_36
    if-eqz v9, :cond_65

    iget-boolean v0, v9, Lokio/Segment;->owner:Z

    if-eqz v0, :cond_65

    iget v0, v9, Lokio/Segment;->limit:I

    int-to-long v0, v0

    add-long v4, p2, v0

    iget-boolean v0, v9, Lokio/Segment;->shared:Z

    if-eqz v0, :cond_62

    const/4 v0, 0x0

    :goto_46
    int-to-long v0, v0

    sub-long v0, v4, v0

    const-wide/16 v4, 0x800

    cmp-long v0, v0, v4

    if-gtz v0, :cond_65

    .line 1187
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v9, v1}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 1188
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, p2

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 1189
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 1214
    .end local v9    # "tail":Lokio/Segment;
    :cond_5f
    return-void

    .line 1183
    :cond_60
    const/4 v9, 0x0

    goto :goto_36

    .line 1184
    .restart local v9    # "tail":Lokio/Segment;
    :cond_62
    iget v0, v9, Lokio/Segment;->pos:I

    goto :goto_46

    .line 1194
    :cond_65
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lokio/Segment;->split(I)Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1199
    .end local v9    # "tail":Lokio/Segment;
    :cond_6e
    iget-object v8, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1200
    .local v8, "segmentToMove":Lokio/Segment;
    iget v0, v8, Lokio/Segment;->limit:I

    iget v1, v8, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v6, v0

    .line 1201
    .local v6, "movedByteCount":J
    invoke-virtual {v8}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1202
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v0, :cond_98

    .line 1203
    iput-object v8, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1204
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v4, v1, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v4, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 1210
    :goto_8c
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, v6

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 1211
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 1212
    sub-long/2addr p2, v6

    .line 1213
    goto :goto_1c

    .line 1206
    :cond_98
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 1207
    .restart local v9    # "tail":Lokio/Segment;
    invoke-virtual {v9, v8}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v9

    .line 1208
    invoke-virtual {v9}, Lokio/Segment;->compact()V

    goto :goto_8c
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
    .line 954
    if-nez p1, :cond_a

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "source == null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 955
    :cond_a
    const-wide/16 v2, 0x0

    .line 956
    .local v2, "totalBytesRead":J
    :goto_c
    const-wide/16 v4, 0x800

    invoke-interface {p1, p0, v4, v5}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .local v0, "readCount":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_1a

    .line 957
    add-long/2addr v2, v0

    goto :goto_c

    .line 959
    :cond_1a
    return-wide v2
.end method

.method public writeByte(I)Lokio/Buffer;
    .registers 7
    .param p1, "b"    # I

    .prologue
    .line 972
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 973
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v2, v0, Lokio/Segment;->limit:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lokio/Segment;->limit:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 974
    iget-wide v1, p0, Lokio/Buffer;->size:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 975
    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lokio/BufferedSink;
    .registers 3
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

.method public writeDecimalLong(J)Lokio/Buffer;
    .registers 15
    .param p1, "v"    # J

    .prologue
    const-wide/16 v10, 0xa

    const-wide/16 v8, 0x0

    .line 1032
    cmp-long v6, p1, v8

    if-nez v6, :cond_f

    .line 1034
    const/16 v6, 0x30

    invoke-virtual {p0, v6}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object p0

    .line 1084
    .end local p0    # "this":Lokio/Buffer;
    :goto_e
    return-object p0

    .line 1037
    .restart local p0    # "this":Lokio/Buffer;
    :cond_f
    const/4 v2, 0x0

    .line 1038
    .local v2, "negative":Z
    cmp-long v6, p1, v8

    if-gez v6, :cond_21

    .line 1039
    neg-long p1, p1

    .line 1040
    cmp-long v6, p1, v8

    if-gez v6, :cond_20

    .line 1041
    const-string v6, "-9223372036854775808"

    invoke-virtual {p0, v6}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object p0

    goto :goto_e

    .line 1043
    :cond_20
    const/4 v2, 0x1

    .line 1047
    :cond_21
    const-wide/32 v6, 0x5f5e100

    cmp-long v6, p1, v6

    if-gez v6, :cond_82

    const-wide/16 v6, 0x2710

    cmp-long v6, p1, v6

    if-gez v6, :cond_64

    const-wide/16 v6, 0x64

    cmp-long v6, p1, v6

    if-gez v6, :cond_5a

    cmp-long v6, p1, v10

    if-gez v6, :cond_58

    const/4 v5, 0x1

    .line 1066
    .local v5, "width":I
    :goto_39
    if-eqz v2, :cond_3d

    .line 1067
    add-int/lit8 v5, v5, 0x1

    .line 1070
    :cond_3d
    invoke-virtual {p0, v5}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v4

    .line 1071
    .local v4, "tail":Lokio/Segment;
    iget-object v0, v4, Lokio/Segment;->data:[B

    .line 1072
    .local v0, "data":[B
    iget v6, v4, Lokio/Segment;->limit:I

    add-int v3, v6, v5

    .line 1073
    .local v3, "pos":I
    :goto_47
    cmp-long v6, p1, v8

    if-eqz v6, :cond_102

    .line 1074
    rem-long v6, p1, v10

    long-to-int v1, v6

    .line 1075
    .local v1, "digit":I
    add-int/lit8 v3, v3, -0x1

    sget-object v6, Lokio/Buffer;->DIGITS:[B

    aget-byte v6, v6, v1

    aput-byte v6, v0, v3

    .line 1076
    div-long/2addr p1, v10

    .line 1077
    goto :goto_47

    .line 1047
    .end local v0    # "data":[B
    .end local v1    # "digit":I
    .end local v3    # "pos":I
    .end local v4    # "tail":Lokio/Segment;
    .end local v5    # "width":I
    :cond_58
    const/4 v5, 0x2

    goto :goto_39

    :cond_5a
    const-wide/16 v6, 0x3e8

    cmp-long v6, p1, v6

    if-gez v6, :cond_62

    const/4 v5, 0x3

    goto :goto_39

    :cond_62
    const/4 v5, 0x4

    goto :goto_39

    :cond_64
    const-wide/32 v6, 0xf4240

    cmp-long v6, p1, v6

    if-gez v6, :cond_76

    const-wide/32 v6, 0x186a0

    cmp-long v6, p1, v6

    if-gez v6, :cond_74

    const/4 v5, 0x5

    goto :goto_39

    :cond_74
    const/4 v5, 0x6

    goto :goto_39

    :cond_76
    const-wide/32 v6, 0x989680

    cmp-long v6, p1, v6

    if-gez v6, :cond_7f

    const/4 v5, 0x7

    goto :goto_39

    :cond_7f
    const/16 v5, 0x8

    goto :goto_39

    :cond_82
    const-wide v6, 0xe8d4a51000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_b0

    const-wide v6, 0x2540be400L

    cmp-long v6, p1, v6

    if-gez v6, :cond_a1

    const-wide/32 v6, 0x3b9aca00

    cmp-long v6, p1, v6

    if-gez v6, :cond_9e

    const/16 v5, 0x9

    goto :goto_39

    :cond_9e
    const/16 v5, 0xa

    goto :goto_39

    :cond_a1
    const-wide v6, 0x174876e800L

    cmp-long v6, p1, v6

    if-gez v6, :cond_ad

    const/16 v5, 0xb

    goto :goto_39

    :cond_ad
    const/16 v5, 0xc

    goto :goto_39

    :cond_b0
    const-wide v6, 0x38d7ea4c68000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_d7

    const-wide v6, 0x9184e72a000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_c6

    const/16 v5, 0xd

    goto/16 :goto_39

    :cond_c6
    const-wide v6, 0x5af3107a4000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_d3

    const/16 v5, 0xe

    goto/16 :goto_39

    :cond_d3
    const/16 v5, 0xf

    goto/16 :goto_39

    :cond_d7
    const-wide v6, 0x16345785d8a0000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_f1

    const-wide v6, 0x2386f26fc10000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_ed

    const/16 v5, 0x10

    goto/16 :goto_39

    :cond_ed
    const/16 v5, 0x11

    goto/16 :goto_39

    :cond_f1
    const-wide v6, 0xde0b6b3a7640000L

    cmp-long v6, p1, v6

    if-gez v6, :cond_fe

    const/16 v5, 0x12

    goto/16 :goto_39

    :cond_fe
    const/16 v5, 0x13

    goto/16 :goto_39

    .line 1078
    .restart local v0    # "data":[B
    .restart local v3    # "pos":I
    .restart local v4    # "tail":Lokio/Segment;
    .restart local v5    # "width":I
    :cond_102
    if-eqz v2, :cond_10a

    .line 1079
    add-int/lit8 v3, v3, -0x1

    const/16 v6, 0x2d

    aput-byte v6, v0, v3

    .line 1082
    :cond_10a
    iget v6, v4, Lokio/Segment;->limit:I

    add-int/2addr v6, v5

    iput v6, v4, Lokio/Segment;->limit:I

    .line 1083
    iget-wide v6, p0, Lokio/Buffer;->size:J

    int-to-long v8, v5

    add-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    goto/16 :goto_e
.end method

.method public bridge synthetic writeDecimalLong(J)Lokio/BufferedSink;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeHexadecimalUnsignedLong(J)Lokio/Buffer;
    .registers 12
    .param p1, "v"    # J

    .prologue
    .line 1088
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-nez v5, :cond_d

    .line 1090
    const/16 v5, 0x30

    invoke-virtual {p0, v5}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object p0

    .line 1103
    .end local p0    # "this":Lokio/Buffer;
    :goto_c
    return-object p0

    .line 1093
    .restart local p0    # "this":Lokio/Buffer;
    :cond_d
    invoke-static {p1, p2}, Ljava/lang/Long;->highestOneBit(J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v5

    div-int/lit8 v5, v5, 0x4

    add-int/lit8 v4, v5, 0x1

    .line 1095
    .local v4, "width":I
    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 1096
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 1097
    .local v0, "data":[B
    iget v5, v3, Lokio/Segment;->limit:I

    add-int/2addr v5, v4

    add-int/lit8 v1, v5, -0x1

    .local v1, "pos":I
    iget v2, v3, Lokio/Segment;->limit:I

    .local v2, "start":I
    :goto_26
    if-lt v1, v2, :cond_37

    .line 1098
    sget-object v5, Lokio/Buffer;->DIGITS:[B

    const-wide/16 v6, 0xf

    and-long/2addr v6, p1

    long-to-int v6, v6

    aget-byte v5, v5, v6

    aput-byte v5, v0, v1

    .line 1099
    const/4 v5, 0x4

    ushr-long/2addr p1, v5

    .line 1097
    add-int/lit8 v1, v1, -0x1

    goto :goto_26

    .line 1101
    :cond_37
    iget v5, v3, Lokio/Segment;->limit:I

    add-int/2addr v5, v4

    iput v5, v3, Lokio/Segment;->limit:I

    .line 1102
    iget-wide v5, p0, Lokio/Buffer;->size:J

    int-to-long v7, v4

    add-long/2addr v5, v7

    iput-wide v5, p0, Lokio/Buffer;->size:J

    goto :goto_c
.end method

.method public bridge synthetic writeHexadecimalUnsignedLong(J)Lokio/BufferedSink;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeInt(I)Lokio/Buffer;
    .registers 10
    .param p1, "i"    # I

    .prologue
    .line 994
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 995
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 996
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 997
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 998
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    ushr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 999
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 1000
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 1001
    iput v1, v3, Lokio/Segment;->limit:I

    .line 1002
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x4

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 1003
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/BufferedSink;
    .registers 3
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
    .line 1007
    invoke-static {p1}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeIntLe(I)Lokio/BufferedSink;
    .registers 3
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

    .line 1011
    invoke-virtual {p0, v8}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 1012
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 1013
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 1014
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

    .line 1015
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x30

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 1016
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    const/16 v4, 0x28

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 1017
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x20

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 1018
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    const/16 v4, 0x18

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 1019
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    const/16 v4, 0x10

    ushr-long v4, p1, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 1020
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    ushr-long v4, p1, v8

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 1021
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-long v4, p1, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 1022
    iput v1, v3, Lokio/Segment;->limit:I

    .line 1023
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x8

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 1024
    return-object p0
.end method

.method public bridge synthetic writeLong(J)Lokio/BufferedSink;
    .registers 4
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
    .line 1028
    invoke-static {p1, p2}, Lokio/Util;->reverseBytesLong(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeLongLe(J)Lokio/BufferedSink;
    .registers 4
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
    .line 979
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 980
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 981
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 982
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 983
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 984
    iput v1, v3, Lokio/Segment;->limit:I

    .line 985
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 986
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/BufferedSink;
    .registers 3
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
    .line 990
    int-to-short v0, p1

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeShortLe(I)Lokio/BufferedSink;
    .registers 3
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

.method public writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;
    .registers 9
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 914
    if-nez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "string == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 915
    :cond_a
    if-gez p2, :cond_25

    new-instance v1, Ljava/lang/IllegalAccessError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "beginIndex < 0: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 916
    :cond_25
    if-ge p3, p2, :cond_4a

    .line 917
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "endIndex < beginIndex: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " < "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 919
    :cond_4a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le p3, v1, :cond_77

    .line 920
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "endIndex > string.length: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 921
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 923
    :cond_77
    if-nez p4, :cond_81

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "charset == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 924
    :cond_81
    sget-object v1, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p4, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8e

    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v1

    .line 926
    :goto_8d
    return-object v1

    .line 925
    :cond_8e
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 926
    .local v0, "data":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v1

    goto :goto_8d
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;
    .registers 5
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 909
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/BufferedSink;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3, p4}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/BufferedSink;
    .registers 4
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

    if-lez v0, :cond_48

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
    invoke-static {v8}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_14

    .line 222
    .end local v7    # "toCopy":I
    .end local v8    # "toRecycle":Lokio/Segment;
    :cond_48
    return-object p0
.end method

.method public writeUtf8(Ljava/lang/String;)Lokio/Buffer;
    .registers 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 793
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeUtf8(Ljava/lang/String;II)Lokio/Buffer;
    .registers 20
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    .line 797
    if-nez p1, :cond_a

    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "string == null"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 798
    :cond_a
    if-gez p2, :cond_27

    new-instance v12, Ljava/lang/IllegalAccessError;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "beginIndex < 0: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v12

    .line 799
    :cond_27
    move/from16 v0, p3

    move/from16 v1, p2

    if-ge v0, v1, :cond_54

    .line 800
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "endIndex < beginIndex: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " < "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 802
    :cond_54
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v12

    move/from16 v0, p3

    if-le v0, v12, :cond_85

    .line 803
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "endIndex > string.length: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " > "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 804
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 808
    :cond_85
    move/from16 v5, p2

    .local v5, "i":I
    move v6, v5

    .end local v5    # "i":I
    .local v6, "i":I
    :goto_88
    move/from16 v0, p3

    if-ge v6, v0, :cond_189

    .line 809
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 811
    .local v2, "c":I
    const/16 v12, 0x80

    if-ge v2, v12, :cond_e0

    .line 812
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v11

    .line 813
    .local v11, "tail":Lokio/Segment;
    iget-object v4, v11, Lokio/Segment;->data:[B

    .line 814
    .local v4, "data":[B
    iget v12, v11, Lokio/Segment;->limit:I

    sub-int v10, v12, v6

    .line 815
    .local v10, "segmentOffset":I
    rsub-int v12, v10, 0x800

    move/from16 v0, p3

    invoke-static {v0, v12}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 818
    .local v8, "runLimit":I
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    add-int v12, v10, v6

    int-to-byte v13, v2

    aput-byte v13, v4, v12

    move v6, v5

    .line 822
    .end local v5    # "i":I
    .restart local v6    # "i":I
    :goto_b3
    if-ge v6, v8, :cond_bf

    .line 823
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 824
    const/16 v12, 0x80

    if-lt v2, v12, :cond_d7

    .line 828
    :cond_bf
    add-int v12, v6, v10

    iget v13, v11, Lokio/Segment;->limit:I

    sub-int v9, v12, v13

    .line 829
    .local v9, "runSize":I
    iget v12, v11, Lokio/Segment;->limit:I

    add-int/2addr v12, v9

    iput v12, v11, Lokio/Segment;->limit:I

    .line 830
    move-object/from16 v0, p0

    iget-wide v12, v0, Lokio/Buffer;->size:J

    int-to-long v14, v9

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lokio/Buffer;->size:J

    move v5, v6

    .end local v4    # "data":[B
    .end local v6    # "i":I
    .end local v8    # "runLimit":I
    .end local v9    # "runSize":I
    .end local v10    # "segmentOffset":I
    .end local v11    # "tail":Lokio/Segment;
    .restart local v5    # "i":I
    :goto_d5
    move v6, v5

    .line 867
    .end local v5    # "i":I
    .restart local v6    # "i":I
    goto :goto_88

    .line 825
    .restart local v4    # "data":[B
    .restart local v8    # "runLimit":I
    .restart local v10    # "segmentOffset":I
    .restart local v11    # "tail":Lokio/Segment;
    :cond_d7
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    add-int v12, v10, v6

    int-to-byte v13, v2

    aput-byte v13, v4, v12

    move v6, v5

    .end local v5    # "i":I
    .restart local v6    # "i":I
    goto :goto_b3

    .line 832
    .end local v4    # "data":[B
    .end local v8    # "runLimit":I
    .end local v10    # "segmentOffset":I
    .end local v11    # "tail":Lokio/Segment;
    :cond_e0
    const/16 v12, 0x800

    if-ge v2, v12, :cond_f9

    .line 834
    shr-int/lit8 v12, v2, 0x6

    or-int/lit16 v12, v12, 0xc0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 835
    and-int/lit8 v12, v2, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 836
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_d5

    .line 838
    .end local v5    # "i":I
    .restart local v6    # "i":I
    :cond_f9
    const v12, 0xd800

    if-lt v2, v12, :cond_103

    const v12, 0xdfff

    if-le v2, v12, :cond_123

    .line 840
    :cond_103
    shr-int/lit8 v12, v2, 0xc

    or-int/lit16 v12, v12, 0xe0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 841
    shr-int/lit8 v12, v2, 0x6

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 842
    and-int/lit8 v12, v2, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 843
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_d5

    .line 848
    .end local v5    # "i":I
    .restart local v6    # "i":I
    :cond_123
    add-int/lit8 v12, v6, 0x1

    move/from16 v0, p3

    if-ge v12, v0, :cond_14c

    add-int/lit8 v12, v6, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 849
    .local v7, "low":I
    :goto_131
    const v12, 0xdbff

    if-gt v2, v12, :cond_140

    const v12, 0xdc00

    if-lt v7, v12, :cond_140

    const v12, 0xdfff

    if-le v7, v12, :cond_14e

    .line 850
    :cond_140
    const/16 v12, 0x3f

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 851
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    move v6, v5

    .line 852
    .end local v5    # "i":I
    .restart local v6    # "i":I
    goto/16 :goto_88

    .line 848
    .end local v7    # "low":I
    :cond_14c
    const/4 v7, 0x0

    goto :goto_131

    .line 858
    .restart local v7    # "low":I
    :cond_14e
    const/high16 v12, 0x10000

    const v13, -0xd801

    and-int/2addr v13, v2

    shl-int/lit8 v13, v13, 0xa

    const v14, -0xdc01

    and-int/2addr v14, v7

    or-int/2addr v13, v14

    add-int v3, v12, v13

    .line 861
    .local v3, "codePoint":I
    shr-int/lit8 v12, v3, 0x12

    or-int/lit16 v12, v12, 0xf0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 862
    shr-int/lit8 v12, v3, 0xc

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 863
    shr-int/lit8 v12, v3, 0x6

    and-int/lit8 v12, v12, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 864
    and-int/lit8 v12, v3, 0x3f

    or-int/lit16 v12, v12, 0x80

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 865
    add-int/lit8 v5, v6, 0x2

    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_d5

    .line 869
    .end local v2    # "c":I
    .end local v3    # "codePoint":I
    .end local v5    # "i":I
    .end local v7    # "low":I
    .restart local v6    # "i":I
    :cond_189
    return-object p0
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;
    .registers 3
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

.method public bridge synthetic writeUtf8(Ljava/lang/String;II)Lokio/BufferedSink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeUtf8CodePoint(I)Lokio/Buffer;
    .registers 5
    .param p1, "codePoint"    # I

    .prologue
    .line 873
    const/16 v0, 0x80

    if-ge p1, v0, :cond_8

    .line 875
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 905
    :goto_7
    return-object p0

    .line 877
    :cond_8
    const/16 v0, 0x800

    if-ge p1, v0, :cond_1b

    .line 879
    shr-int/lit8 v0, p1, 0x6

    or-int/lit16 v0, v0, 0xc0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 880
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_7

    .line 882
    :cond_1b
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_5e

    .line 883
    const v0, 0xd800

    if-lt p1, v0, :cond_46

    const v0, 0xdfff

    if-gt p1, v0, :cond_46

    .line 884
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected code point: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 885
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 889
    :cond_46
    shr-int/lit8 v0, p1, 0xc

    or-int/lit16 v0, v0, 0xe0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 890
    shr-int/lit8 v0, p1, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 891
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_7

    .line 893
    :cond_5e
    const v0, 0x10ffff

    if-gt p1, v0, :cond_84

    .line 895
    shr-int/lit8 v0, p1, 0x12

    or-int/lit16 v0, v0, 0xf0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 896
    shr-int/lit8 v0, p1, 0xc

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 897
    shr-int/lit8 v0, p1, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 898
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_7

    .line 901
    :cond_84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected code point: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 902
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic writeUtf8CodePoint(I)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method
