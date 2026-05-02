.class public Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;
.super Ljava/io/InputStream;
.source "QuotedPrintableInputStream.java"


# static fields
.field private static final CR:B = 0xdt

.field private static final DEFAULT_BUFFER_SIZE:I = 0x800

.field private static final EQ:B = 0x3dt

.field private static final LF:B = 0xat


# instance fields
.field private final blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

.field private closed:Z

.field private final decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

.field private final encoded:[B

.field private final in:Ljava/io/InputStream;

.field private limit:I

.field private final monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

.field private pos:I

.field private final singleByte:[B


# direct methods
.method protected constructor <init>(ILjava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V
    .registers 7
    .param p1, "bufsize"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    const/16 v2, 0x200

    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 38
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->singleByte:[B

    .line 45
    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    .line 46
    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    .line 58
    iput-object p2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->in:Ljava/io/InputStream;

    .line 59
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    .line 60
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 61
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 62
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->closed:Z

    .line 63
    iput-object p3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .line 64
    return-void
.end method

.method protected constructor <init>(ILjava/io/InputStream;Z)V
    .registers 5
    .param p1, "bufsize"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "strict"    # Z

    .prologue
    .line 67
    if-eqz p3, :cond_8

    sget-object v0, Lorg/apache/james/mime4j/codec/DecodeMonitor;->STRICT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    :goto_4
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(ILjava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .line 68
    return-void

    .line 67
    :cond_8
    sget-object v0, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    goto :goto_4
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    .line 53
    const/16 v0, 0x800

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(ILjava/io/InputStream;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "strict"    # Z

    .prologue
    .line 71
    const/16 v0, 0x800

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;-><init>(ILjava/io/InputStream;Z)V

    .line 72
    return-void
.end method

.method private convert(I)I
    .registers 3
    .param p1, "c"    # I

    .prologue
    .line 274
    const/16 v0, 0x30

    if-lt p1, v0, :cond_b

    const/16 v0, 0x39

    if-gt p1, v0, :cond_b

    .line 275
    add-int/lit8 v0, p1, -0x30

    .line 281
    :goto_a
    return v0

    .line 276
    :cond_b
    const/16 v0, 0x41

    if-lt p1, v0, :cond_18

    const/16 v0, 0x46

    if-gt p1, v0, :cond_18

    .line 277
    add-int/lit8 v0, p1, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 278
    :cond_18
    const/16 v0, 0x61

    if-lt p1, v0, :cond_25

    const/16 v0, 0x66

    if-gt p1, v0, :cond_25

    .line 279
    add-int/lit8 v0, p1, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 281
    :cond_25
    const/4 v0, -0x1

    goto :goto_a
.end method

.method private fillBuffer()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 91
    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    iget v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    if-ge v2, v3, :cond_39

    .line 92
    iget-object v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    iget v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    iget-object v4, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    iget v5, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    iget v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    sub-int/2addr v5, v6

    invoke-static {v2, v3, v4, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    iget v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    sub-int/2addr v2, v3

    iput v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    .line 94
    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    .line 100
    :goto_1e
    iget-object v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    sub-int v1, v2, v3

    .line 101
    .local v1, "capacity":I
    if-lez v1, :cond_38

    .line 102
    iget-object v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    iget v4, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    invoke-virtual {v2, v3, v4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 103
    .local v0, "bytesRead":I
    if-lez v0, :cond_38

    .line 104
    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    .line 108
    .end local v0    # "bytesRead":I
    :cond_38
    return v0

    .line 96
    .end local v1    # "capacity":I
    :cond_39
    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    .line 97
    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    goto :goto_1e
.end method

.method private getnext()I
    .registers 4

    .prologue
    .line 113
    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    if-ge v1, v2, :cond_15

    .line 114
    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    aget-byte v0, v1, v2

    .line 115
    .local v0, "b":B
    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    .line 116
    and-int/lit16 v1, v0, 0xff

    .line 118
    .end local v0    # "b":B
    :goto_14
    return v1

    :cond_15
    const/4 v1, -0x1

    goto :goto_14
.end method

.method private peek(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 123
    iget v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    add-int/2addr v0, p1

    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    if-ge v0, v1, :cond_11

    .line 124
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    add-int/2addr v1, p1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 126
    :goto_10
    return v0

    :cond_11
    const/4 v0, -0x1

    goto :goto_10
.end method

.method private read0([BII)I
    .registers 28
    .param p1, "buffer"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    const/16 v19, 0x0

    .line 160
    .local v19, "eof":Z
    move/from16 v20, p2

    .line 161
    .local v20, "from":I
    add-int v6, p2, p3

    .line 162
    .local v6, "to":I
    move/from16 v5, p2

    .line 165
    .local v5, "index":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v2

    if-lez v2, :cond_3c

    .line 166
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v2

    sub-int v4, v6, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 167
    .local v18, "chunk":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-static {v2, v4, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    const/4 v4, 0x0

    move/from16 v0, v18

    invoke-virtual {v2, v4, v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->remove(II)V

    .line 169
    add-int v5, v5, v18

    .line 172
    .end local v18    # "chunk":I
    :cond_3c
    :goto_3c
    if-ge v5, v6, :cond_26a

    .line 174
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    sub-int/2addr v2, v4

    const/4 v4, 0x3

    if-ge v2, v4, :cond_55

    .line 175
    invoke-direct/range {p0 .. p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->fillBuffer()I

    move-result v17

    .line 176
    .local v17, "bytesRead":I
    const/4 v2, -0x1

    move/from16 v0, v17

    if-ne v0, v2, :cond_68

    const/16 v19, 0x1

    .line 180
    .end local v17    # "bytesRead":I
    :cond_55
    :goto_55
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    sub-int/2addr v2, v4

    if-nez v2, :cond_6e

    if-eqz v19, :cond_6e

    .line 181
    move/from16 v0, v20

    if-ne v5, v0, :cond_6b

    const/4 v2, -0x1

    .line 265
    :goto_67
    return v2

    .line 176
    .restart local v17    # "bytesRead":I
    :cond_68
    const/16 v19, 0x0

    goto :goto_55

    .line 181
    .end local v17    # "bytesRead":I
    :cond_6b
    sub-int v2, v5, v20

    goto :goto_67

    .line 184
    :cond_6e
    const/16 v21, 0x0

    .line 185
    .local v21, "lastWasCR":Z
    :cond_70
    :goto_70
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    if-ge v2, v4, :cond_3c

    if-ge v5, v6, :cond_3c

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->encoded:[B

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    add-int/lit8 v7, v4, 0x1

    move-object/from16 v0, p0

    iput v7, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    aget-byte v2, v2, v4

    and-int/lit16 v13, v2, 0xff

    .line 188
    .local v13, "b":I
    if-eqz v21, :cond_bc

    const/16 v2, 0xa

    if-eq v13, v2, :cond_bc

    .line 189
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v4, "Found CR without LF"

    const-string v7, "Leaving it as is"

    invoke-virtual {v2, v4, v7}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_aa

    .line 190
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Found CR without LF"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 191
    :cond_aa
    const/16 v3, 0xd

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 197
    :cond_b5
    const/16 v2, 0xd

    if-ne v13, v2, :cond_d8

    .line 198
    const/16 v21, 0x1

    .line 199
    goto :goto_70

    .line 192
    :cond_bc
    if-nez v21, :cond_b5

    const/16 v2, 0xa

    if-ne v13, v2, :cond_b5

    .line 193
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v4, "Found LF without CR"

    const-string v7, "Translating to CRLF"

    invoke-virtual {v2, v4, v7}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b5

    .line 194
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Found LF without CR"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 201
    :cond_d8
    const/16 v21, 0x0

    .line 204
    const/16 v2, 0xa

    if-ne v13, v2, :cond_12b

    .line 206
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v2

    if-nez v2, :cond_107

    .line 207
    const/16 v3, 0xd

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 208
    const/16 v3, 0xa

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 216
    :cond_fe
    :goto_fe
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->clear()V

    goto/16 :goto_70

    .line 210
    :cond_107
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v2

    const/16 v4, 0x3d

    if-eq v2, v4, :cond_fe

    .line 212
    const/16 v3, 0xd

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 213
    const/16 v3, 0xa

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    goto :goto_fe

    .line 217
    :cond_12b
    const/16 v2, 0x3d

    if-ne v13, v2, :cond_24c

    .line 218
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->limit:I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    sub-int/2addr v2, v4

    const/4 v4, 0x2

    if-ge v2, v4, :cond_149

    if-nez v19, :cond_149

    .line 220
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    add-int/lit8 v2, v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->pos:I

    goto/16 :goto_3c

    .line 225
    :cond_149
    invoke-direct/range {p0 .. p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->getnext()I

    move-result v3

    .line 226
    .local v3, "b2":I
    const/16 v2, 0x3d

    if-ne v3, v2, :cond_1b4

    .line 227
    const/4 v7, 0x1

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 229
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->peek(I)I

    move-result v15

    .line 230
    .local v15, "bb1":I
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->peek(I)I

    move-result v16

    .line 231
    .local v16, "bb2":I
    const/16 v2, 0xa

    if-eq v15, v2, :cond_176

    const/16 v2, 0xd

    if-ne v15, v2, :cond_1a7

    const/16 v2, 0xa

    move/from16 v0, v16

    if-ne v0, v2, :cond_1a7

    .line 232
    :cond_176
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v4, "Unexpected ==EOL encountered"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "== 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v4, v7}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    .line 233
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2, v3}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    goto/16 :goto_70

    .line 235
    :cond_1a7
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v4, "Unexpected == encountered"

    const-string v7, "=="

    invoke-virtual {v2, v4, v7}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_70

    .line 237
    .end local v15    # "bb1":I
    .end local v16    # "bb2":I
    :cond_1b4
    int-to-char v2, v3

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_1db

    .line 239
    const/4 v8, -0x1

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p1

    move v10, v5

    move v11, v6

    invoke-direct/range {v7 .. v12}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 240
    const/16 v2, 0xa

    if-eq v3, v2, :cond_70

    .line 241
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2, v13}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    .line 242
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2, v3}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    goto/16 :goto_70

    .line 245
    :cond_1db
    invoke-direct/range {p0 .. p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->getnext()I

    move-result v14

    .line 246
    .local v14, "b3":I
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->convert(I)I

    move-result v23

    .line 247
    .local v23, "upper":I
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->convert(I)I

    move-result v22

    .line 248
    .local v22, "lower":I
    if-ltz v23, :cond_1ef

    if-gez v22, :cond_23b

    .line 249
    :cond_1ef
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v4, "Malformed encoded value encountered"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "leaving ="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    int-to-char v8, v3

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    int-to-char v8, v14

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " as is"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v4, v7}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    .line 251
    const/16 v8, 0x3d

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p1

    move v10, v5

    move v11, v6

    invoke-direct/range {v7 .. v12}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 252
    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    .line 253
    const/4 v12, 0x0

    move-object/from16 v7, p0

    move v8, v14

    move-object/from16 v9, p1

    move v10, v5

    move v11, v6

    invoke-direct/range {v7 .. v12}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    goto/16 :goto_70

    .line 255
    :cond_23b
    shl-int/lit8 v2, v23, 0x4

    or-int v8, v2, v22

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p1

    move v10, v5

    move v11, v6

    invoke-direct/range {v7 .. v12}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    goto/16 :goto_70

    .line 258
    .end local v3    # "b2":I
    .end local v14    # "b3":I
    .end local v22    # "lower":I
    .end local v23    # "upper":I
    :cond_24c
    invoke-static {v13}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v2

    if-eqz v2, :cond_25b

    .line 259
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v2, v13}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    goto/16 :goto_70

    .line 261
    :cond_25b
    and-int/lit16 v8, v13, 0xff

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p1

    move v10, v5

    move v11, v6

    invoke-direct/range {v7 .. v12}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->transfer(I[BIIZ)I

    move-result v5

    goto/16 :goto_70

    .line 265
    .end local v13    # "b":I
    .end local v21    # "lastWasCR":Z
    :cond_26a
    sub-int v2, v6, v20

    goto/16 :goto_67
.end method

.method private transfer(I[BIIZ)I
    .registers 15
    .param p1, "b"    # I
    .param p2, "buffer"    # [B
    .param p3, "from"    # I
    .param p4, "to"    # I
    .param p5, "keepblanks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    move v2, p3

    .line 133
    .local v2, "index":I
    if-eqz p5, :cond_48

    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    if-lez v6, :cond_48

    .line 134
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    sub-int v7, p4, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 135
    .local v0, "chunk":I
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, p2, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    add-int/2addr v2, v0

    .line 137
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    sub-int v4, v6, v0

    .line 138
    .local v4, "remaining":I
    if-lez v4, :cond_37

    .line 139
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    iget-object v7, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v7

    invoke-virtual {v6, v7, v0, v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    .line 141
    :cond_37
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->clear()V

    move v3, v2

    .line 148
    .end local v0    # "chunk":I
    .end local v2    # "index":I
    .end local v4    # "remaining":I
    .local v3, "index":I
    :goto_3d
    const/4 v6, -0x1

    if-eq p1, v6, :cond_a2

    .line 149
    if-ge v3, p4, :cond_9d

    .line 150
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    int-to-byte v6, p1

    aput-byte v6, p2, v3

    .line 155
    :goto_47
    return v2

    .line 142
    :cond_48
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    if-lez v6, :cond_a4

    if-nez p5, :cond_a4

    .line 143
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    mul-int/lit8 v6, v6, 0x3

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 144
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_60
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    if-ge v1, v6, :cond_87

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->blanks:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v7, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->byteAt(I)B

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 145
    :cond_87
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    const-string v7, "ignored blanks"

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a4

    .line 146
    new-instance v6, Ljava/io/IOException;

    const-string v7, "ignored blanks"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 152
    .end local v1    # "i":I
    .end local v2    # "index":I
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    .restart local v3    # "index":I
    :cond_9d
    iget-object v6, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->decodedBuf:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v6, p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    :cond_a2
    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    goto :goto_47

    :cond_a4
    move v3, v2

    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_3d
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->closed:Z

    .line 87
    return-void
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v1, -0x1

    .line 287
    iget-boolean v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->closed:Z

    if-eqz v2, :cond_f

    .line 288
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has been closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 291
    :cond_f
    iget-object v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->singleByte:[B

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->read([BII)I

    move-result v0

    .line 292
    .local v0, "bytes":I
    if-ne v0, v1, :cond_18

    .line 296
    :goto_17
    return v1

    .line 295
    :cond_18
    if-ne v0, v4, :cond_f

    .line 296
    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->singleByte:[B

    aget-byte v1, v1, v3

    and-int/lit16 v1, v1, 0xff

    goto :goto_17
.end method

.method public read([BII)I
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 304
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has been closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_c
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/james/mime4j/codec/QuotedPrintableInputStream;->read0([BII)I

    move-result v0

    return v0
.end method
