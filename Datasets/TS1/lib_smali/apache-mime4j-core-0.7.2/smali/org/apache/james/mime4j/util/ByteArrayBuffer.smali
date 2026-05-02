.class public final Lorg/apache/james/mime4j/util/ByteArrayBuffer;
.super Ljava/lang/Object;
.source "ByteArrayBuffer.java"

# interfaces
.implements Lorg/apache/james/mime4j/util/ByteSequence;


# instance fields
.field private buffer:[B

.field private len:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "capacity"    # I

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-gez p1, :cond_d

    .line 34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer capacity may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_d
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    .line 37
    return-void
.end method

.method public constructor <init>([BIZ)V
    .registers 6
    .param p1, "bytes"    # [B
    .param p2, "len"    # I
    .param p3, "dontCopy"    # Z

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-nez p1, :cond_c

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 46
    :cond_c
    if-ltz p2, :cond_11

    array-length v0, p1

    if-le p2, v0, :cond_17

    .line 47
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 49
    :cond_17
    if-eqz p3, :cond_1e

    .line 50
    iput-object p1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    .line 56
    :goto_1b
    iput p2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    .line 57
    return-void

    .line 52
    :cond_1e
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    .line 53
    iget-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    invoke-static {p1, v1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1b
.end method

.method public constructor <init>([BZ)V
    .registers 4
    .param p1, "bytes"    # [B
    .param p2, "dontCopy"    # Z

    .prologue
    .line 40
    array-length v0, p1

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>([BIZ)V

    .line 41
    return-void
.end method

.method private expand(I)V
    .registers 6
    .param p1, "newlen"    # I

    .prologue
    const/4 v3, 0x0

    .line 60
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [B

    .line 61
    .local v0, "newbuffer":[B
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    iput-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    .line 63
    return-void
.end method


# virtual methods
.method public append(I)V
    .registers 6
    .param p1, "b"    # I

    .prologue
    .line 85
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    add-int/lit8 v0, v1, 0x1

    .line 86
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_c

    .line 87
    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->expand(I)V

    .line 89
    :cond_c
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 90
    iput v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    .line 91
    return-void
.end method

.method public append([BII)V
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 66
    if-nez p1, :cond_3

    .line 82
    :cond_2
    :goto_2
    return-void

    .line 69
    :cond_3
    if-ltz p2, :cond_13

    array-length v1, p1

    if-gt p2, v1, :cond_13

    if-ltz p3, :cond_13

    add-int v1, p2, p3

    if-ltz v1, :cond_13

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_19

    .line 71
    :cond_13
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 73
    :cond_19
    if-eqz p3, :cond_2

    .line 76
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    add-int v0, v1, p3

    .line 77
    .local v0, "newlen":I
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_27

    .line 78
    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->expand(I)V

    .line 80
    :cond_27
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    iput v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    goto :goto_2
.end method

.method public buffer()[B
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    return-object v0
.end method

.method public byteAt(I)B
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 106
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    if-lt p1, v0, :cond_c

    .line 107
    :cond_6
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 109
    :cond_c
    iget-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 94
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    .line 95
    return-void
.end method

.method public indexOf(B)I
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 125
    const/4 v0, 0x0

    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->indexOf(BII)I

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

    .line 129
    if-gez p2, :cond_4

    .line 130
    const/4 p2, 0x0

    .line 132
    :cond_4
    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    if-le p3, v2, :cond_a

    .line 133
    iget p3, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    .line 135
    :cond_a
    if-le p2, p3, :cond_e

    move v0, v1

    .line 143
    :cond_d
    :goto_d
    return v0

    .line 138
    :cond_e
    move v0, p2

    .local v0, "i":I
    :goto_f
    if-ge v0, p3, :cond_1a

    .line 139
    iget-object v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    aget-byte v2, v2, v0

    if-eq v2, p1, :cond_d

    .line 138
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_1a
    move v0, v1

    .line 143
    goto :goto_d
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 169
    iget v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

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
    .line 173
    iget v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

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
    .line 117
    iget v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    return v0
.end method

.method public remove(II)V
    .registers 7
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 154
    if-ltz p1, :cond_12

    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    if-gt p1, v1, :cond_12

    if-ltz p2, :cond_12

    add-int v1, p1, p2

    if-ltz v1, :cond_12

    add-int v1, p1, p2

    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    if-le v1, v2, :cond_18

    .line 156
    :cond_12
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 158
    :cond_18
    if-nez p2, :cond_1b

    .line 166
    :goto_1a
    return-void

    .line 161
    :cond_1b
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    sub-int/2addr v1, p1

    sub-int v0, v1, p2

    .line 162
    .local v0, "remaining":I
    if-lez v0, :cond_2b

    .line 163
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    add-int v2, p1, p2

    iget-object v3, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    invoke-static {v1, v2, v3, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    :cond_2b
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    sub-int/2addr v1, p2

    iput v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    goto :goto_1a
.end method

.method public setLength(I)V
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 147
    if-ltz p1, :cond_7

    iget-object v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    array-length v0, v0

    if-le p1, v0, :cond_d

    .line 148
    :cond_7
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 150
    :cond_d
    iput p1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    .line 151
    return-void
.end method

.method public toByteArray()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 98
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    new-array v0, v1, [B

    .line 99
    .local v0, "b":[B
    iget v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    if-lez v1, :cond_10

    .line 100
    iget-object v1, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->len:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 102
    :cond_10
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 178
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method
