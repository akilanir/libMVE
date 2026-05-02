.class final Ljavassist/bytecode/ByteStream;
.super Ljava/io/OutputStream;
.source "ByteStream.java"


# instance fields
.field private buf:[B

.field private count:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Ljavassist/bytecode/ByteStream;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 29
    new-array v0, p1, [B

    iput-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 31
    return-void
.end method

.method private writeUTF2(Ljava/lang/String;II)V
    .registers 15
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "sLen"    # I
    .param p3, "offset"    # I

    .prologue
    const/16 v10, 0x7ff

    const/16 v9, 0x7f

    .line 120
    move v6, p2

    .line 121
    .local v6, "size":I
    move v2, p3

    .local v2, "i":I
    :goto_6
    if-ge v2, p2, :cond_1a

    .line 122
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 123
    .local v1, "c":I
    if-le v1, v10, :cond_13

    .line 124
    add-int/lit8 v6, v6, 0x2

    .line 121
    :cond_10
    :goto_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 125
    :cond_13
    if-eqz v1, :cond_17

    if-le v1, v9, :cond_10

    .line 126
    :cond_17
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    .line 129
    .end local v1    # "c":I
    :cond_1a
    const v7, 0xffff

    if-le v6, v7, :cond_42

    .line 130
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "encoded string too long: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " bytes"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 133
    :cond_42
    add-int/lit8 v7, v6, 0x2

    invoke-virtual {p0, v7}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 134
    iget v4, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 135
    .local v4, "pos":I
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    .line 136
    .local v0, "buffer":[B
    ushr-int/lit8 v7, v6, 0x8

    int-to-byte v7, v7

    aput-byte v7, v0, v4

    .line 137
    add-int/lit8 v7, v4, 0x1

    int-to-byte v8, v6

    aput-byte v8, v0, v7

    .line 138
    add-int/lit8 v7, p3, 0x2

    add-int/2addr v4, v7

    .line 139
    move v3, p3

    .local v3, "j":I
    move v5, v4

    .end local v4    # "pos":I
    .local v5, "pos":I
    :goto_5a
    if-ge v3, p2, :cond_a5

    .line 140
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 141
    .restart local v1    # "c":I
    const/4 v7, 0x1

    if-gt v7, v1, :cond_6e

    if-gt v1, v9, :cond_6e

    .line 142
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    int-to-byte v7, v1

    aput-byte v7, v0, v5

    .line 139
    :goto_6a
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    goto :goto_5a

    .line 143
    :cond_6e
    if-le v1, v10, :cond_90

    .line 144
    shr-int/lit8 v7, v1, 0xc

    and-int/lit8 v7, v7, 0xf

    or-int/lit16 v7, v7, 0xe0

    int-to-byte v7, v7

    aput-byte v7, v0, v5

    .line 145
    add-int/lit8 v7, v5, 0x1

    shr-int/lit8 v8, v1, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v0, v7

    .line 146
    add-int/lit8 v7, v5, 0x2

    and-int/lit8 v8, v1, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v0, v7

    .line 147
    add-int/lit8 v4, v5, 0x3

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_6a

    .line 150
    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    :cond_90
    shr-int/lit8 v7, v1, 0x6

    and-int/lit8 v7, v7, 0x1f

    or-int/lit16 v7, v7, 0xc0

    int-to-byte v7, v7

    aput-byte v7, v0, v5

    .line 151
    add-int/lit8 v7, v5, 0x1

    and-int/lit8 v8, v1, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v0, v7

    .line 152
    add-int/lit8 v4, v5, 0x2

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_6a

    .line 156
    .end local v1    # "c":I
    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    :cond_a5
    iput v5, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 157
    return-void
.end method


# virtual methods
.method public enlarge(I)V
    .registers 8
    .param p1, "delta"    # I

    .prologue
    const/4 v5, 0x0

    .line 186
    iget v3, p0, Ljavassist/bytecode/ByteStream;->count:I

    add-int v1, v3, p1

    .line 187
    .local v1, "newCount":I
    iget-object v3, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    array-length v3, v3

    if-le v1, v3, :cond_1c

    .line 188
    iget-object v3, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    array-length v3, v3

    shl-int/lit8 v2, v3, 0x1

    .line 189
    .local v2, "newLen":I
    if-le v2, v1, :cond_1d

    .end local v2    # "newLen":I
    :goto_11
    new-array v0, v2, [B

    .line 190
    .local v0, "newBuf":[B
    iget-object v3, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    iget v4, p0, Ljavassist/bytecode/ByteStream;->count:I

    invoke-static {v3, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 191
    iput-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    .line 193
    .end local v0    # "newBuf":[B
    :cond_1c
    return-void

    .restart local v2    # "newLen":I
    :cond_1d
    move v2, v1

    .line 189
    goto :goto_11
.end method

.method public getPos()I
    .registers 2

    .prologue
    .line 33
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 34
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    return v0
.end method

.method public toByteArray()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 176
    iget v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    new-array v0, v1, [B

    .line 177
    .local v0, "buf2":[B
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    iget v2, p0, Ljavassist/bytecode/ByteStream;->count:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    return-object v0
.end method

.method public write(I)V
    .registers 5
    .param p1, "b"    # I

    .prologue
    .line 52
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 53
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 54
    .local v0, "oldCount":I
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    int-to-byte v2, p1

    aput-byte v2, v1, v0

    .line 55
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 56
    return-void
.end method

.method public write(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "value"    # I

    .prologue
    .line 160
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 161
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 42
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Ljavassist/bytecode/ByteStream;->write([BII)V

    .line 43
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 46
    invoke-virtual {p0, p3}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 47
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    iget v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    add-int/2addr v0, p3

    iput v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 49
    return-void
.end method

.method public writeBlank(I)V
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 38
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    add-int/2addr v0, p1

    iput v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 39
    return-void
.end method

.method public writeDouble(D)V
    .registers 5
    .param p1, "v"    # D

    .prologue
    .line 95
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/ByteStream;->writeLong(J)V

    .line 96
    return-void
.end method

.method public writeFloat(F)V
    .registers 3
    .param p1, "v"    # F

    .prologue
    .line 91
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 92
    return-void
.end method

.method public writeInt(I)V
    .registers 6
    .param p1, "i"    # I

    .prologue
    .line 67
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 68
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 69
    .local v0, "oldCount":I
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    ushr-int/lit8 v2, p1, 0x18

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 70
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x1

    ushr-int/lit8 v3, p1, 0x10

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 71
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x2

    ushr-int/lit8 v3, p1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 72
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x3

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 73
    add-int/lit8 v1, v0, 0x4

    iput v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 74
    return-void
.end method

.method public writeInt(II)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "value"    # I

    .prologue
    .line 169
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    ushr-int/lit8 v1, p2, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, p1

    .line 170
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 171
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 172
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v1, p1, 0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 173
    return-void
.end method

.method public writeLong(J)V
    .registers 9
    .param p1, "i"    # J

    .prologue
    const/16 v5, 0x8

    .line 77
    invoke-virtual {p0, v5}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 78
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 79
    .local v0, "oldCount":I
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    const/16 v2, 0x38

    ushr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 80
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x30

    ushr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 81
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x2

    const/16 v3, 0x28

    ushr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 82
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x3

    const/16 v3, 0x20

    ushr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 83
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x4

    const/16 v3, 0x18

    ushr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 84
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x5

    const/16 v3, 0x10

    ushr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 85
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x6

    ushr-long v3, p1, v5

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 86
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x7

    long-to-int v3, p1

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 87
    add-int/lit8 v1, v0, 0x8

    iput v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 88
    return-void
.end method

.method public writeShort(I)V
    .registers 6
    .param p1, "s"    # I

    .prologue
    .line 59
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 60
    iget v0, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 61
    .local v0, "oldCount":I
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 62
    iget-object v1, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v2, v0, 0x1

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 63
    add-int/lit8 v1, v0, 0x2

    iput v1, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 64
    return-void
.end method

.method public writeShort(II)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "value"    # I

    .prologue
    .line 164
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    ushr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, p1

    .line 165
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    add-int/lit8 v1, p1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 166
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    const/4 v1, 0x0

    iget v2, p0, Ljavassist/bytecode/ByteStream;->count:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 183
    return-void
.end method

.method public writeUTF(Ljava/lang/String;)V
    .registers 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 100
    .local v5, "sLen":I
    iget v3, p0, Ljavassist/bytecode/ByteStream;->count:I

    .line 101
    .local v3, "pos":I
    add-int/lit8 v6, v5, 0x2

    invoke-virtual {p0, v6}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 103
    iget-object v0, p0, Ljavassist/bytecode/ByteStream;->buf:[B

    .line 104
    .local v0, "buffer":[B
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    ushr-int/lit8 v6, v5, 0x8

    int-to-byte v6, v6

    aput-byte v6, v0, v3

    .line 105
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    int-to-byte v6, v5

    aput-byte v6, v0, v4

    .line 106
    const/4 v2, 0x0

    .local v2, "i":I
    move v4, v3

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    :goto_1b
    if-ge v2, v5, :cond_35

    .line 107
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 108
    .local v1, "c":C
    const/4 v6, 0x1

    if-gt v6, v1, :cond_31

    const/16 v6, 0x7f

    if-gt v1, v6, :cond_31

    .line 109
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    int-to-byte v6, v1

    aput-byte v6, v0, v4

    .line 106
    add-int/lit8 v2, v2, 0x1

    move v4, v3

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_1b

    .line 111
    :cond_31
    invoke-direct {p0, p1, v5, v2}, Ljavassist/bytecode/ByteStream;->writeUTF2(Ljava/lang/String;II)V

    .line 117
    .end local v1    # "c":C
    :goto_34
    return-void

    .line 116
    :cond_35
    iput v4, p0, Ljavassist/bytecode/ByteStream;->count:I

    goto :goto_34
.end method
