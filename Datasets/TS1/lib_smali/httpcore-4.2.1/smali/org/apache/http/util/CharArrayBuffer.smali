.class public final Lorg/apache/http/util/CharArrayBuffer;
.super Ljava/lang/Object;
.source "CharArrayBuffer.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x562aa19b667920bfL


# instance fields
.field private buffer:[C

.field private len:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "capacity"    # I

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    if-gez p1, :cond_d

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer capacity may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_d
    new-array v0, p1, [C

    iput-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    .line 60
    return-void
.end method

.method private expand(I)V
    .registers 6
    .param p1, "newlen"    # I

    .prologue
    const/4 v3, 0x0

    .line 63
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [C

    .line 64
    .local v0, "newbuffer":[C
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    iput-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    .line 66
    return-void
.end method


# virtual methods
.method public append(C)V
    .registers 5
    .param p1, "ch"    # C

    .prologue
    .line 159
    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    add-int/lit8 v0, v1, 0x1

    .line 160
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-le v0, v1, :cond_c

    .line 161
    invoke-direct {p0, v0}, Lorg/apache/http/util/CharArrayBuffer;->expand(I)V

    .line 163
    :cond_c
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    aput-char p1, v1, v2

    .line 164
    iput v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 165
    return-void
.end method

.method public append(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 232
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 233
    return-void
.end method

.method public append(Ljava/lang/String;)V
    .registers 7
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 106
    if-nez p1, :cond_4

    .line 107
    const-string p1, "null"

    .line 109
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 110
    .local v1, "strlen":I
    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    add-int v0, v2, v1

    .line 111
    .local v0, "newlen":I
    iget-object v2, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v2, v2

    if-le v0, v2, :cond_14

    .line 112
    invoke-direct {p0, v0}, Lorg/apache/http/util/CharArrayBuffer;->expand(I)V

    .line 114
    :cond_14
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    iget v4, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-virtual {p1, v2, v1, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 115
    iput v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 116
    return-void
.end method

.method public append(Lorg/apache/http/util/ByteArrayBuffer;II)V
    .registers 5
    .param p1, "b"    # Lorg/apache/http/util/ByteArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 218
    if-nez p1, :cond_3

    .line 222
    :goto_2
    return-void

    .line 221
    :cond_3
    invoke-virtual {p1}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/http/util/CharArrayBuffer;->append([BII)V

    goto :goto_2
.end method

.method public append(Lorg/apache/http/util/CharArrayBuffer;)V
    .registers 5
    .param p1, "b"    # Lorg/apache/http/util/CharArrayBuffer;

    .prologue
    .line 146
    if-nez p1, :cond_3

    .line 150
    :goto_2
    return-void

    .line 149
    :cond_3
    iget-object v0, p1, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    const/4 v1, 0x0

    iget v2, p1, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append([CII)V

    goto :goto_2
.end method

.method public append(Lorg/apache/http/util/CharArrayBuffer;II)V
    .registers 5
    .param p1, "b"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 132
    if-nez p1, :cond_3

    .line 136
    :goto_2
    return-void

    .line 135
    :cond_3
    iget-object v0, p1, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/http/util/CharArrayBuffer;->append([CII)V

    goto :goto_2
.end method

.method public append([BII)V
    .registers 11
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 182
    if-nez p1, :cond_3

    .line 201
    :cond_2
    :goto_2
    return-void

    .line 185
    :cond_3
    if-ltz p2, :cond_13

    array-length v4, p1

    if-gt p2, v4, :cond_13

    if-ltz p3, :cond_13

    add-int v4, p2, p3

    if-ltz v4, :cond_13

    add-int v4, p2, p3

    array-length v5, p1

    if-le v4, v5, :cond_41

    .line 187
    :cond_13
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "off: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " len: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " b.length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 189
    :cond_41
    if-eqz p3, :cond_2

    .line 192
    iget v3, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 193
    .local v3, "oldlen":I
    add-int v2, v3, p3

    .line 194
    .local v2, "newlen":I
    iget-object v4, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v4, v4

    if-le v2, v4, :cond_4f

    .line 195
    invoke-direct {p0, v2}, Lorg/apache/http/util/CharArrayBuffer;->expand(I)V

    .line 197
    :cond_4f
    move v0, p2

    .local v0, "i1":I
    move v1, v3

    .local v1, "i2":I
    :goto_51
    if-ge v1, v2, :cond_61

    .line 198
    iget-object v4, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    aget-byte v5, p1, v0

    and-int/lit16 v5, v5, 0xff

    int-to-char v5, v5

    aput-char v5, v4, v1

    .line 197
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 200
    :cond_61
    iput v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    goto :goto_2
.end method

.method public append([CII)V
    .registers 8
    .param p1, "b"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 81
    if-nez p1, :cond_3

    .line 97
    :cond_2
    :goto_2
    return-void

    .line 84
    :cond_3
    if-ltz p2, :cond_13

    array-length v1, p1

    if-gt p2, v1, :cond_13

    if-ltz p3, :cond_13

    add-int v1, p2, p3

    if-ltz v1, :cond_13

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_41

    .line 86
    :cond_13
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "off: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " len: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " b.length: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_41
    if-eqz p3, :cond_2

    .line 91
    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    add-int v0, v1, p3

    .line 92
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-le v0, v1, :cond_4f

    .line 93
    invoke-direct {p0, v0}, Lorg/apache/http/util/CharArrayBuffer;->expand(I)V

    .line 95
    :cond_4f
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    iput v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    goto :goto_2
.end method

.method public buffer()[C
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    return-object v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 266
    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    aget-char v0, v0, p1

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 239
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 240
    return-void
.end method

.method public ensureCapacity(I)V
    .registers 5
    .param p1, "required"    # I

    .prologue
    .line 307
    if-gtz p1, :cond_3

    .line 314
    :cond_2
    :goto_2
    return-void

    .line 310
    :cond_3
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    sub-int v0, v1, v2

    .line 311
    .local v0, "available":I
    if-le p1, v0, :cond_2

    .line 312
    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1}, Lorg/apache/http/util/CharArrayBuffer;->expand(I)V

    goto :goto_2
.end method

.method public indexOf(I)I
    .registers 4
    .param p1, "ch"    # I

    .prologue
    .line 403
    const/4 v0, 0x0

    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/util/CharArrayBuffer;->indexOf(III)I

    move-result v0

    return v0
.end method

.method public indexOf(III)I
    .registers 7
    .param p1, "ch"    # I
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 375
    if-gez p2, :cond_4

    .line 376
    const/4 p2, 0x0

    .line 378
    :cond_4
    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    if-le p3, v2, :cond_a

    .line 379
    iget p3, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 381
    :cond_a
    if-le p2, p3, :cond_e

    move v0, v1

    .line 389
    :cond_d
    :goto_d
    return v0

    .line 384
    :cond_e
    move v0, p2

    .local v0, "i":I
    :goto_f
    if-ge v0, p3, :cond_1a

    .line 385
    iget-object v2, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    aget-char v2, v2, v0

    if-eq v2, p1, :cond_d

    .line 384
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_1a
    move v0, v1

    .line 389
    goto :goto_d
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 340
    iget v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isFull()Z
    .registers 3

    .prologue
    .line 350
    iget v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public length()I
    .registers 2

    .prologue
    .line 295
    iget v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    return v0
.end method

.method public setLength(I)V
    .registers 5
    .param p1, "len"    # I

    .prologue
    .line 327
    if-ltz p1, :cond_7

    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    if-le p1, v0, :cond_2d

    .line 328
    :cond_7
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "len: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < 0 or > buffer len: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_2d
    iput p1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    .line 331
    return-void
.end method

.method public substring(II)Ljava/lang/String;
    .registers 6
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 421
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public substringTrimmed(II)Ljava/lang/String;
    .registers 6
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 441
    if-gez p1, :cond_1b

    .line 442
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative beginIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 444
    :cond_1b
    iget v0, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    if-le p2, v0, :cond_44

    .line 445
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 447
    :cond_44
    if-le p1, p2, :cond_69

    .line 448
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "beginIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > endIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :cond_69
    :goto_69
    if-ge p1, p2, :cond_78

    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    aget-char v0, v0, p1

    invoke-static {v0}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 451
    add-int/lit8 p1, p1, 0x1

    goto :goto_69

    .line 453
    :cond_78
    :goto_78
    if-le p2, p1, :cond_89

    iget-object v0, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    add-int/lit8 v1, p2, -0x1

    aget-char v0, v0, v1

    invoke-static {v0}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_89

    .line 454
    add-int/lit8 p2, p2, -0x1

    goto :goto_78

    .line 456
    :cond_89
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toCharArray()[C
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 248
    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    new-array v0, v1, [C

    .line 249
    .local v0, "b":[C
    iget v1, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    if-lez v1, :cond_10

    .line 250
    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    :cond_10
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 461
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/util/CharArrayBuffer;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/http/util/CharArrayBuffer;->len:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
