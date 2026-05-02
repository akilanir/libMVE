.class public Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;
.super Ljava/io/FilterOutputStream;
.source "QuotedPrintableOutputStream.java"


# static fields
.field private static final CR:B = 0xdt

.field private static final DEFAULT_BUFFER_SIZE:I = 0xc00

.field private static final DOT:B = 0x2et

.field private static final EQ:B = 0x3dt

.field private static final HEX_DIGITS:[B

.field private static final LF:B = 0xat

.field private static final QUOTED_PRINTABLE_LAST_PLAIN:B = 0x7et

.field private static final QUOTED_PRINTABLE_MAX_LINE_LENGTH:I = 0x4c

.field private static final QUOTED_PRINTABLE_OCTETS_PER_ESCAPE:I = 0x3

.field private static final SP:B = 0x20t

.field private static final TB:B = 0x9t


# instance fields
.field private final binary:Z

.field private closed:Z

.field private nextSoftBreak:I

.field private final outBuffer:[B

.field private outputIndex:I

.field private pendingCR:Z

.field private pendingSpace:Z

.field private pendingTab:Z

.field private singleByte:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->HEX_DIGITS:[B

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
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
    .end array-data
.end method

.method public constructor <init>(ILjava/io/OutputStream;Z)V
    .registers 6
    .param p1, "bufsize"    # I
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "binary"    # Z

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 59
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->closed:Z

    .line 61
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->singleByte:[B

    .line 65
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    .line 66
    iput-boolean p3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->binary:Z

    .line 67
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingSpace:Z

    .line 68
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingTab:Z

    .line 69
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingCR:Z

    .line 70
    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    .line 71
    const/16 v0, 0x4d

    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "binary"    # Z

    .prologue
    .line 75
    const/16 v0, 0xc00

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;-><init>(ILjava/io/OutputStream;Z)V

    .line 76
    return-void
.end method

.method private clearPending()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 101
    iput-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingSpace:Z

    .line 102
    iput-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingTab:Z

    .line 103
    iput-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingCR:Z

    .line 104
    return-void
.end method

.method private completeEncoding()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->writePending()V

    .line 86
    invoke-virtual {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->flushOutput()V

    .line 87
    return-void
.end method

.method private encode(B)V
    .registers 6
    .param p1, "next"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x9

    const/16 v2, 0x20

    const/4 v1, 0x1

    .line 107
    const/16 v0, 0xa

    if-ne p1, v0, :cond_35

    .line 108
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->binary:Z

    if-eqz v0, :cond_14

    .line 109
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->writePending()V

    .line 110
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    .line 157
    :goto_13
    return-void

    .line 112
    :cond_14
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingCR:Z

    if-eqz v0, :cond_2e

    .line 115
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingSpace:Z

    if-eqz v0, :cond_26

    .line 116
    invoke-direct {p0, v2}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    .line 120
    :cond_1f
    :goto_1f
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->lineBreak()V

    .line 121
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->clearPending()V

    goto :goto_13

    .line 117
    :cond_26
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingTab:Z

    if-eqz v0, :cond_1f

    .line 118
    invoke-direct {p0, v3}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_1f

    .line 123
    :cond_2e
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->writePending()V

    .line 124
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->plain(B)V

    goto :goto_13

    .line 127
    :cond_35
    const/16 v0, 0xd

    if-ne p1, v0, :cond_44

    .line 128
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->binary:Z

    if-eqz v0, :cond_41

    .line 129
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 131
    :cond_41
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingCR:Z

    goto :goto_13

    .line 134
    :cond_44
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->writePending()V

    .line 135
    if-ne p1, v2, :cond_54

    .line 136
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->binary:Z

    if-eqz v0, :cond_51

    .line 137
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 139
    :cond_51
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingSpace:Z

    goto :goto_13

    .line 141
    :cond_54
    if-ne p1, v3, :cond_61

    .line 142
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->binary:Z

    if-eqz v0, :cond_5e

    .line 143
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 145
    :cond_5e
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingTab:Z

    goto :goto_13

    .line 147
    :cond_61
    if-ge p1, v2, :cond_67

    .line 148
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 149
    :cond_67
    const/16 v0, 0x7e

    if-le p1, v0, :cond_6f

    .line 150
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 151
    :cond_6f
    const/16 v0, 0x3d

    if-eq p1, v0, :cond_77

    const/16 v0, 0x2e

    if-ne p1, v0, :cond_7b

    .line 152
    :cond_77
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->escape(B)V

    goto :goto_13

    .line 154
    :cond_7b
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->plain(B)V

    goto :goto_13
.end method

.method private encodeChunk([BII)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    move v0, p2

    .local v0, "inputIndex":I
    :goto_1
    add-int v1, p3, p2

    if-ge v0, v1, :cond_d

    .line 80
    aget-byte v1, p1, v0

    invoke-direct {p0, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->encode(B)V

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 82
    :cond_d
    return-void
.end method

.method private escape(B)V
    .registers 5
    .param p1, "next"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    const/4 v2, 0x3

    if-gt v1, v2, :cond_c

    .line 168
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->softBreak()V

    .line 171
    :cond_c
    and-int/lit16 v0, p1, 0xff

    .line 173
    .local v0, "nextUnsigned":I
    const/16 v1, 0x3d

    invoke-direct {p0, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 174
    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    .line 175
    sget-object v1, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->HEX_DIGITS:[B

    shr-int/lit8 v2, v0, 0x4

    aget-byte v1, v1, v2

    invoke-direct {p0, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 176
    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    .line 177
    sget-object v1, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->HEX_DIGITS:[B

    rem-int/lit8 v2, v0, 0x10

    aget-byte v1, v1, v2

    invoke-direct {p0, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 178
    return-void
.end method

.method private lineBreak()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 194
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 195
    const/16 v0, 0x4c

    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    .line 196
    return-void
.end method

.method private plain(B)V
    .registers 4
    .param p1, "next"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    iget v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->nextSoftBreak:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_c

    .line 161
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->softBreak()V

    .line 163
    :cond_c
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 164
    return-void
.end method

.method private softBreak()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    const/16 v0, 0x3d

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write(B)V

    .line 189
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->lineBreak()V

    .line 190
    return-void
.end method

.method private write(B)V
    .registers 5
    .param p1, "next"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    iget v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    aput-byte p1, v0, v1

    .line 182
    iget v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    array-length v1, v1

    if-lt v0, v1, :cond_14

    .line 183
    invoke-virtual {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->flushOutput()V

    .line 185
    :cond_14
    return-void
.end method

.method private writePending()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingSpace:Z

    if-eqz v0, :cond_d

    .line 91
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->plain(B)V

    .line 97
    :cond_9
    :goto_9
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->clearPending()V

    .line 98
    return-void

    .line 92
    :cond_d
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingTab:Z

    if-eqz v0, :cond_17

    .line 93
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->plain(B)V

    goto :goto_9

    .line 94
    :cond_17
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->pendingCR:Z

    if-eqz v0, :cond_9

    .line 95
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->plain(B)V

    goto :goto_9
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 209
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->closed:Z

    if-eqz v0, :cond_6

    .line 218
    :goto_5
    return-void

    .line 213
    :cond_6
    :try_start_6
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->completeEncoding()V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_c

    .line 216
    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->closed:Z

    goto :goto_5

    :catchall_c
    move-exception v0

    iput-boolean v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->closed:Z

    throw v0
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    invoke-virtual {p0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->flushOutput()V

    .line 223
    return-void
.end method

.method flushOutput()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 199
    iget v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 200
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 204
    :goto_11
    iput v3, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outputIndex:I

    .line 205
    return-void

    .line 202
    :cond_14
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->outBuffer:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    goto :goto_11
.end method

.method public write(I)V
    .registers 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 227
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->singleByte:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 228
    iget-object v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->singleByte:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->write([BII)V

    .line 229
    return-void
.end method

.method public write([BII)V
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
    .line 233
    iget-boolean v0, p0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 234
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has been closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_c
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->encodeChunk([BII)V

    .line 237
    return-void
.end method
