.class public final Lcom/fasterxml/jackson/core/io/UTF8Writer;
.super Ljava/io/Writer;
.source "UTF8Writer.java"


# static fields
.field static final SURR1_FIRST:I = 0xd800

.field static final SURR1_LAST:I = 0xdbff

.field static final SURR2_FIRST:I = 0xdc00

.field static final SURR2_LAST:I = 0xdfff


# instance fields
.field private final _context:Lcom/fasterxml/jackson/core/io/IOContext;

.field private _out:Ljava/io/OutputStream;

.field private _outBuffer:[B

.field private final _outBufferEnd:I

.field private _outPtr:I

.field private _surrogate:I


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;Ljava/io/OutputStream;)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 27
    iput v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 31
    iput-object p1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    .line 32
    iput-object p2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    .line 34
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocWriteEncodingBuffer()[B

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    .line 39
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    array-length v0, v0

    add-int/lit8 v0, v0, -0x4

    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBufferEnd:I

    .line 40
    iput v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 41
    return-void
.end method

.method protected static illegalSurrogate(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    new-instance v0, Ljava/io/IOException;

    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogateDesc(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static illegalSurrogateDesc(I)Ljava/lang/String;
    .registers 3

    .prologue
    .line 375
    const v0, 0x10ffff

    if-le p0, v0, :cond_23

    .line 376
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal character point (0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") to output; max is 0x10FFFF as per RFC 4627"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 385
    :goto_22
    return-object v0

    .line 378
    :cond_23
    const v0, 0xd800

    if-lt p0, v0, :cond_69

    .line 379
    const v0, 0xdbff

    if-gt p0, v0, :cond_4b

    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unmatched first part of surrogate pair (0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_22

    .line 382
    :cond_4b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unmatched second part of surrogate pair (0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_22

    .line 385
    :cond_69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal character point (0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") to output"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_22
.end method


# virtual methods
.method public append(C)Ljava/io/Writer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(I)V

    .line 48
    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->append(C)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 55
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    if-eqz v0, :cond_30

    .line 56
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    if-lez v0, :cond_15

    .line 57
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 58
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 60
    :cond_15
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    .line 61
    iput-object v4, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    .line 63
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    .line 64
    if-eqz v1, :cond_24

    .line 65
    iput-object v4, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    .line 66
    iget-object v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseWriteEncodingBuffer([B)V

    .line 69
    :cond_24
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 74
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 75
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 76
    if-lez v0, :cond_30

    .line 77
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 80
    :cond_30
    return-void
.end method

.method protected convertSurrogate(I)I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v3, 0xdc00

    .line 359
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 360
    const/4 v1, 0x0

    iput v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 363
    if-lt p1, v3, :cond_f

    const v1, 0xdfff

    if-le p1, v1, :cond_40

    .line 364
    :cond_f
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Broken surrogate pair: first char 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", second 0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; illegal combination"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 366
    :cond_40
    const/high16 v1, 0x10000

    const v2, 0xd800

    sub-int/2addr v0, v2

    shl-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v1

    sub-int v1, p1, v3

    add-int/2addr v0, v1

    return v0
.end method

.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 86
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    if-eqz v0, :cond_19

    .line 87
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    if-lez v0, :cond_14

    .line 88
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 89
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 91
    :cond_14
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 93
    :cond_19
    return-void
.end method

.method public write(I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 203
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    if-lez v0, :cond_2a

    .line 204
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->convertSurrogate(I)I

    move-result p1

    .line 216
    :cond_9
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBufferEnd:I

    if-lt v0, v1, :cond_1a

    .line 217
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 218
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 221
    :cond_1a
    const/16 v0, 0x80

    if-ge p1, v0, :cond_3f

    .line 222
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 243
    :goto_29
    return-void

    .line 206
    :cond_2a
    const v0, 0xd800

    if-lt p1, v0, :cond_9

    const v0, 0xdfff

    if-gt p1, v0, :cond_9

    .line 208
    const v0, 0xdbff

    if-le p1, v0, :cond_3c

    .line 209
    invoke-static {p1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 212
    :cond_3c
    iput p1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    goto :goto_29

    .line 224
    :cond_3f
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 225
    const/16 v1, 0x800

    if-ge p1, v1, :cond_5e

    .line 226
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v2, v0, 0x1

    shr-int/lit8 v3, p1, 0x6

    or-int/lit16 v3, v3, 0xc0

    int-to-byte v3, v3

    aput-byte v3, v1, v0

    .line 227
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v0, v2, 0x1

    and-int/lit8 v3, p1, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 241
    :goto_5b
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    goto :goto_29

    .line 228
    :cond_5e
    const v1, 0xffff

    if-gt p1, v1, :cond_87

    .line 229
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v2, v0, 0x1

    shr-int/lit8 v3, p1, 0xc

    or-int/lit16 v3, v3, 0xe0

    int-to-byte v3, v3

    aput-byte v3, v1, v0

    .line 230
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v1, v2, 0x1

    shr-int/lit8 v3, p1, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 231
    iget-object v2, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v0, v1, 0x1

    and-int/lit8 v3, p1, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    goto :goto_5b

    .line 233
    :cond_87
    const v1, 0x10ffff

    if-le p1, v1, :cond_8f

    .line 234
    invoke-static {p1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 236
    :cond_8f
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v2, v0, 0x1

    shr-int/lit8 v3, p1, 0x12

    or-int/lit16 v3, v3, 0xf0

    int-to-byte v3, v3

    aput-byte v3, v1, v0

    .line 237
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v1, v2, 0x1

    shr-int/lit8 v3, p1, 0xc

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 238
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v2, v1, 0x1

    shr-int/lit8 v3, p1, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 239
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    add-int/lit8 v0, v2, 0x1

    and-int/lit8 v3, p1, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    goto :goto_5b
.end method

.method public write(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(Ljava/lang/String;II)V

    .line 249
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x80

    const/4 v1, 0x0

    .line 254
    const/4 v0, 0x2

    if-ge p3, v0, :cond_11

    .line 255
    const/4 v0, 0x1

    if-ne p3, v0, :cond_10

    .line 256
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(I)V

    .line 345
    :cond_10
    :goto_10
    return-void

    .line 262
    :cond_11
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    if-lez v0, :cond_25

    .line 263
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 264
    add-int/lit8 p3, p3, -0x1

    .line 265
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->convertSurrogate(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(I)V

    move p2, v0

    .line 269
    :cond_25
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 270
    iget-object v5, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    .line 271
    iget v6, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBufferEnd:I

    .line 274
    add-int v7, p3, p2

    move v2, p2

    .line 277
    :goto_2e
    if-ge v2, v7, :cond_b6

    .line 281
    if-lt v0, v6, :cond_38

    .line 282
    iget-object v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    invoke-virtual {v3, v5, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    move v0, v1

    .line 286
    :cond_38
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 288
    if-ge v2, v9, :cond_fc

    .line 289
    add-int/lit8 v4, v0, 0x1

    int-to-byte v2, v2

    aput-byte v2, v5, v0

    .line 291
    sub-int v2, v7, v3

    .line 292
    sub-int v0, v6, v4

    .line 294
    if-le v2, v0, :cond_f9

    .line 297
    :goto_4b
    add-int v8, v0, v3

    move v2, v4

    move v0, v3

    .line 300
    :goto_4f
    if-lt v0, v8, :cond_55

    move v10, v2

    move v2, v0

    move v0, v10

    .line 301
    goto :goto_2e

    .line 303
    :cond_55
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 304
    if-lt v0, v9, :cond_78

    move v10, v0

    move v0, v2

    move v2, v3

    move v3, v10

    .line 312
    :goto_61
    const/16 v4, 0x800

    if-ge v3, v4, :cond_80

    .line 313
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v3, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 314
    add-int/lit8 v0, v4, 0x1

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v5, v4

    goto :goto_2e

    .line 307
    :cond_78
    add-int/lit8 v4, v2, 0x1

    int-to-byte v0, v0

    aput-byte v0, v5, v2

    move v2, v4

    move v0, v3

    goto :goto_4f

    .line 317
    :cond_80
    const v4, 0xd800

    if-lt v3, v4, :cond_8a

    const v4, 0xdfff

    if-le v3, v4, :cond_a8

    .line 318
    :cond_8a
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v3, 0xc

    or-int/lit16 v8, v8, 0xe0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 319
    add-int/lit8 v8, v4, 0x1

    shr-int/lit8 v0, v3, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    aput-byte v0, v5, v4

    .line 320
    add-int/lit8 v0, v8, 0x1

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v5, v8

    goto :goto_2e

    .line 324
    :cond_a8
    const v4, 0xdbff

    if-le v3, v4, :cond_b2

    .line 325
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 326
    invoke-static {v3}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 328
    :cond_b2
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 330
    if-lt v2, v7, :cond_ba

    .line 344
    :cond_b6
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    goto/16 :goto_10

    .line 333
    :cond_ba
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->convertSurrogate(I)I

    move-result v2

    .line 334
    const v4, 0x10ffff

    if-le v2, v4, :cond_ce

    .line 335
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 336
    invoke-static {v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 338
    :cond_ce
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v2, 0x12

    or-int/lit16 v8, v8, 0xf0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 339
    add-int/lit8 v0, v4, 0x1

    shr-int/lit8 v8, v2, 0xc

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v5, v4

    .line 340
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v2, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 341
    add-int/lit8 v0, v4, 0x1

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v5, v4

    move v2, v3

    goto/16 :goto_2e

    :cond_f9
    move v0, v2

    goto/16 :goto_4b

    :cond_fc
    move v10, v2

    move v2, v3

    move v3, v10

    goto/16 :goto_61
.end method

.method public write([C)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write([CII)V

    .line 100
    return-void
.end method

.method public write([CII)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x80

    const/4 v1, 0x0

    .line 106
    const/4 v0, 0x2

    if-ge p3, v0, :cond_f

    .line 107
    const/4 v0, 0x1

    if-ne p3, v0, :cond_e

    .line 108
    aget-char v0, p1, p2

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(I)V

    .line 197
    :cond_e
    :goto_e
    return-void

    .line 114
    :cond_f
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    if-lez v0, :cond_21

    .line 115
    add-int/lit8 v0, p2, 0x1

    aget-char v2, p1, p2

    .line 116
    add-int/lit8 p3, p3, -0x1

    .line 117
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->convertSurrogate(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->write(I)V

    move p2, v0

    .line 121
    :cond_21
    iget v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 122
    iget-object v5, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBuffer:[B

    .line 123
    iget v6, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outBufferEnd:I

    .line 126
    add-int v7, p3, p2

    move v2, p2

    .line 129
    :goto_2a
    if-ge v2, v7, :cond_ae

    .line 133
    if-lt v0, v6, :cond_34

    .line 134
    iget-object v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_out:Ljava/io/OutputStream;

    invoke-virtual {v3, v5, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    move v0, v1

    .line 138
    :cond_34
    add-int/lit8 v3, v2, 0x1

    aget-char v2, p1, v2

    .line 140
    if-ge v2, v9, :cond_f2

    .line 141
    add-int/lit8 v4, v0, 0x1

    int-to-byte v2, v2

    aput-byte v2, v5, v0

    .line 143
    sub-int v2, v7, v3

    .line 144
    sub-int v0, v6, v4

    .line 146
    if-le v2, v0, :cond_ef

    .line 149
    :goto_45
    add-int v8, v0, v3

    move v2, v4

    move v0, v3

    .line 152
    :goto_49
    if-lt v0, v8, :cond_4f

    move v10, v2

    move v2, v0

    move v0, v10

    .line 153
    goto :goto_2a

    .line 155
    :cond_4f
    add-int/lit8 v3, v0, 0x1

    aget-char v0, p1, v0

    .line 156
    if-lt v0, v9, :cond_70

    move v10, v0

    move v0, v2

    move v2, v3

    move v3, v10

    .line 164
    :goto_59
    const/16 v4, 0x800

    if-ge v3, v4, :cond_78

    .line 165
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v3, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 166
    add-int/lit8 v0, v4, 0x1

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v5, v4

    goto :goto_2a

    .line 159
    :cond_70
    add-int/lit8 v4, v2, 0x1

    int-to-byte v0, v0

    aput-byte v0, v5, v2

    move v2, v4

    move v0, v3

    goto :goto_49

    .line 169
    :cond_78
    const v4, 0xd800

    if-lt v3, v4, :cond_82

    const v4, 0xdfff

    if-le v3, v4, :cond_a0

    .line 170
    :cond_82
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v3, 0xc

    or-int/lit16 v8, v8, 0xe0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 171
    add-int/lit8 v8, v4, 0x1

    shr-int/lit8 v0, v3, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    aput-byte v0, v5, v4

    .line 172
    add-int/lit8 v0, v8, 0x1

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v5, v8

    goto :goto_2a

    .line 176
    :cond_a0
    const v4, 0xdbff

    if-le v3, v4, :cond_aa

    .line 177
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 178
    invoke-static {v3}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 180
    :cond_aa
    iput v3, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_surrogate:I

    .line 182
    if-lt v2, v7, :cond_b2

    .line 196
    :cond_ae
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    goto/16 :goto_e

    .line 185
    :cond_b2
    add-int/lit8 v3, v2, 0x1

    aget-char v2, p1, v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->convertSurrogate(I)I

    move-result v2

    .line 186
    const v4, 0x10ffff

    if-le v2, v4, :cond_c4

    .line 187
    iput v0, p0, Lcom/fasterxml/jackson/core/io/UTF8Writer;->_outPtr:I

    .line 188
    invoke-static {v2}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogate(I)V

    .line 190
    :cond_c4
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v2, 0x12

    or-int/lit16 v8, v8, 0xf0

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 191
    add-int/lit8 v0, v4, 0x1

    shr-int/lit8 v8, v2, 0xc

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v5, v4

    .line 192
    add-int/lit8 v4, v0, 0x1

    shr-int/lit8 v8, v2, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    .line 193
    add-int/lit8 v0, v4, 0x1

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v5, v4

    move v2, v3

    goto/16 :goto_2a

    :cond_ef
    move v0, v2

    goto/16 :goto_45

    :cond_f2
    move v10, v2

    move v2, v3

    move v3, v10

    goto/16 :goto_59
.end method
