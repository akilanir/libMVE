.class public final Lorg/apache/http/util/ByteArrayBuffer;
.super Ljava/lang/Object;
.source "ByteArrayBuffer.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3c7eae24203b8ca4L


# instance fields
.field private buffer:[B

.field private len:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "capacity"    # I

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    if-gez p1, :cond_d

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer capacity may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_d
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    .line 59
    return-void
.end method

.method private expand(I)V
    .registers 6
    .param p1, "newlen"    # I

    .prologue
    const/4 v3, 0x0

    .line 62
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [B

    .line 63
    .local v0, "newbuffer":[B
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    iput-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    .line 65
    return-void
.end method


# virtual methods
.method public append(I)V
    .registers 6
    .param p1, "b"    # I

    .prologue
    .line 105
    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    add-int/lit8 v0, v1, 0x1

    .line 106
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_c

    .line 107
    invoke-direct {p0, v0}, Lorg/apache/http/util/ByteArrayBuffer;->expand(I)V

    .line 109
    :cond_c
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 110
    iput v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    .line 111
    return-void
.end method

.method public append(Lorg/apache/http/util/CharArrayBuffer;II)V
    .registers 5
    .param p1, "b"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 165
    if-nez p1, :cond_3

    .line 169
    :goto_2
    return-void

    .line 168
    :cond_3
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/http/util/ByteArrayBuffer;->append([CII)V

    goto :goto_2
.end method

.method public append([BII)V
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 80
    if-nez p1, :cond_3

    .line 96
    :cond_2
    :goto_2
    return-void

    .line 83
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

    .line 85
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

    .line 87
    :cond_41
    if-eqz p3, :cond_2

    .line 90
    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    add-int v0, v1, p3

    .line 91
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_4f

    .line 92
    invoke-direct {p0, v0}, Lorg/apache/http/util/ByteArrayBuffer;->expand(I)V

    .line 94
    :cond_4f
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    iput v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    goto :goto_2
.end method

.method public append([CII)V
    .registers 11
    .param p1, "b"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 128
    if-nez p1, :cond_3

    .line 147
    :cond_2
    :goto_2
    return-void

    .line 131
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

    .line 133
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

    .line 135
    :cond_41
    if-eqz p3, :cond_2

    .line 138
    iget v3, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    .line 139
    .local v3, "oldlen":I
    add-int v2, v3, p3

    .line 140
    .local v2, "newlen":I
    iget-object v4, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v4, v4

    if-le v2, v4, :cond_4f

    .line 141
    invoke-direct {p0, v2}, Lorg/apache/http/util/ByteArrayBuffer;->expand(I)V

    .line 143
    :cond_4f
    move v0, p2

    .local v0, "i1":I
    move v1, v3

    .local v1, "i2":I
    :goto_51
    if-ge v1, v2, :cond_5f

    .line 144
    iget-object v4, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    aget-char v5, p1, v0

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 143
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 146
    :cond_5f
    iput v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    goto :goto_2
.end method

.method public buffer()[B
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    return-object v0
.end method

.method public byteAt(I)I
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 175
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    .line 176
    return-void
.end method

.method public ensureCapacity(I)V
    .registers 5
    .param p1, "required"    # I

    .prologue
    .line 236
    if-gtz p1, :cond_3

    .line 243
    :cond_2
    :goto_2
    return-void

    .line 239
    :cond_3
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    sub-int v0, v1, v2

    .line 240
    .local v0, "available":I
    if-le p1, v0, :cond_2

    .line 241
    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1}, Lorg/apache/http/util/ByteArrayBuffer;->expand(I)V

    goto :goto_2
.end method

.method public indexOf(B)I
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 345
    const/4 v0, 0x0

    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/util/ByteArrayBuffer;->indexOf(BII)I

    move-result v0

    return v0
.end method

.method public indexOf(BII)I
    .registers 7
    .param p1, "b"    # B
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 315
    if-gez p2, :cond_4

    .line 316
    const/4 p2, 0x0

    .line 318
    :cond_4
    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    if-le p3, v2, :cond_a

    .line 319
    iget p3, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    .line 321
    :cond_a
    if-le p2, p3, :cond_e

    move v0, v1

    .line 329
    :cond_d
    :goto_d
    return v0

    .line 324
    :cond_e
    move v0, p2

    .local v0, "i":I
    :goto_f
    if-ge v0, p3, :cond_1a

    .line 325
    iget-object v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    aget-byte v2, v2, v0

    if-eq v2, p1, :cond_d

    .line 324
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_1a
    move v0, v1

    .line 329
    goto :goto_d
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 278
    iget v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

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
    .line 288
    iget v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

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
    .line 222
    iget v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    return v0
.end method

.method public setLength(I)V
    .registers 5
    .param p1, "len"    # I

    .prologue
    .line 265
    if-ltz p1, :cond_7

    iget-object v0, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v0, v0

    if-le p1, v0, :cond_2d

    .line 266
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

    iget-object v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    :cond_2d
    iput p1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    .line 269
    return-void
.end method

.method public toByteArray()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 184
    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    new-array v0, v1, [B

    .line 185
    .local v0, "b":[B
    iget v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    if-lez v1, :cond_10

    .line 186
    iget-object v1, p0, Lorg/apache/http/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/http/util/ByteArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    :cond_10
    return-object v0
.end method
