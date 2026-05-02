.class public Lcom/jcraft/jsch/Buffer;
.super Ljava/lang/Object;
.source "Buffer.java"


# instance fields
.field buffer:[B

.field index:I

.field s:I

.field final tmp:[B


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 47
    const/16 v0, 0x5000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    .line 38
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 39
    iput v1, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 40
    iput v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 41
    return-void
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "buffer"    # [B

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    .line 43
    iput-object p1, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 44
    iput v1, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 45
    iput v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 46
    return-void
.end method

.method static fromBytes([[B)Lcom/jcraft/jsch/Buffer;
    .registers 5
    .param p0, "args"    # [[B

    .prologue
    .line 254
    array-length v3, p0

    mul-int/lit8 v2, v3, 0x4

    .line 255
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v3, p0

    if-ge v1, v3, :cond_e

    .line 256
    aget-object v3, p0, v1

    array-length v3, v3

    add-int/2addr v2, v3

    .line 255
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 258
    :cond_e
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 259
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    const/4 v1, 0x0

    :goto_14
    array-length v3, p0

    if-ge v1, v3, :cond_1f

    .line 260
    aget-object v3, p0, v1

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 259
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 262
    :cond_1f
    return-object v0
.end method


# virtual methods
.method checkFreeSize(I)V
    .registers 8
    .param p1, "n"    # I

    .prologue
    const/4 v5, 0x0

    .line 216
    iget v3, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v3, p1

    add-int/lit8 v1, v3, 0x54

    .line 217
    .local v1, "size":I
    iget-object v3, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    if-ge v3, v1, :cond_1e

    .line 218
    iget-object v3, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    mul-int/lit8 v0, v3, 0x2

    .line 219
    .local v0, "i":I
    if-ge v0, v1, :cond_13

    move v0, v1

    .line 220
    :cond_13
    new-array v2, v0, [B

    .line 221
    .local v2, "tmp":[B
    iget-object v3, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v4, p0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    iput-object v2, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 224
    .end local v0    # "i":I
    .end local v2    # "tmp":[B
    :cond_1e
    return-void
.end method

.method public getByte()I
    .registers 4

    .prologue
    .line 142
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/Buffer;->s:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public getByte(I)I
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 152
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 153
    .local v0, "foo":I
    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 154
    return v0
.end method

.method public getByte([B)V
    .registers 4
    .param p1, "foo"    # [B

    .prologue
    .line 145
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 146
    return-void
.end method

.method getByte([BII)V
    .registers 6
    .param p1, "foo"    # [B
    .param p2, "start"    # I
    .param p3, "len"    # I

    .prologue
    .line 148
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 150
    return-void
.end method

.method getBytes(ILjava/lang/String;)[[B
    .registers 7
    .param p1, "n"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 227
    new-array v2, p1, [[B

    .line 228
    .local v2, "tmp":[[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p1, :cond_21

    .line 229
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 230
    .local v1, "j":I
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v3

    if-ge v3, v1, :cond_15

    .line 231
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v3, p2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 233
    :cond_15
    new-array v3, v1, [B

    aput-object v3, v2, v0

    .line 234
    aget-object v3, v2, v0

    invoke-virtual {p0, v3}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 228
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 236
    .end local v1    # "j":I
    :cond_21
    return-object v2
.end method

.method getCommand()B
    .registers 3

    .prologue
    .line 212
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x5

    aget-byte v0, v0, v1

    return v0
.end method

.method public getInt()I
    .registers 5

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getShort()I

    move-result v0

    .line 123
    .local v0, "foo":I
    shl-int/lit8 v1, v0, 0x10

    const/high16 v2, -0x10000

    and-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getShort()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    or-int v0, v1, v2

    .line 124
    return v0
.end method

.method public getLength()I
    .registers 3

    .prologue
    .line 108
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getLong()J
    .registers 9

    .prologue
    const-wide v6, 0xffffffffL

    .line 117
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    int-to-long v2, v2

    and-long v0, v2, v6

    .line 118
    .local v0, "foo":J
    const/16 v2, 0x20

    shl-long v2, v0, v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    or-long v0, v2, v4

    .line 119
    return-wide v0
.end method

.method public getMPInt()[B
    .registers 4

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 158
    .local v1, "i":I
    if-ltz v1, :cond_a

    const/16 v2, 0x2000

    if-le v1, v2, :cond_c

    .line 161
    :cond_a
    const/16 v1, 0x2000

    .line 163
    :cond_c
    new-array v0, v1, [B

    .line 164
    .local v0, "foo":[B
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 165
    return-object v0
.end method

.method public getMPIntBits()[B
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 168
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 169
    .local v1, "bits":I
    add-int/lit8 v4, v1, 0x7

    div-int/lit8 v2, v4, 0x8

    .line 170
    .local v2, "bytes":I
    new-array v3, v2, [B

    .line 171
    .local v3, "foo":[B
    invoke-virtual {p0, v3, v6, v2}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 172
    aget-byte v4, v3, v6

    and-int/lit16 v4, v4, 0x80

    if-eqz v4, :cond_21

    .line 173
    array-length v4, v3

    add-int/lit8 v4, v4, 0x1

    new-array v0, v4, [B

    .line 174
    .local v0, "bar":[B
    aput-byte v6, v0, v6

    .line 175
    const/4 v4, 0x1

    array-length v5, v3

    invoke-static {v3, v6, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    move-object v3, v0

    .line 178
    .end local v0    # "bar":[B
    :cond_21
    return-object v3
.end method

.method public getOffSet()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    return v0
.end method

.method getShort()I
    .registers 4

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v0

    .line 138
    .local v0, "foo":I
    shl-int/lit8 v1, v0, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v2

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 139
    return v0
.end method

.method public getString()[B
    .registers 4

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 182
    .local v1, "i":I
    if-ltz v1, :cond_a

    const/high16 v2, 0x40000

    if-le v1, v2, :cond_c

    .line 185
    :cond_a
    const/high16 v1, 0x40000

    .line 187
    :cond_c
    new-array v0, v1, [B

    .line 188
    .local v0, "foo":[B
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 189
    return-object v0
.end method

.method getString([I[I)[B
    .registers 6
    .param p1, "start"    # [I
    .param p2, "len"    # [I

    .prologue
    const/4 v2, 0x0

    .line 192
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    .line 193
    .local v0, "i":I
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Buffer;->getByte(I)I

    move-result v1

    aput v1, p1, v2

    .line 194
    aput v0, p2, v2

    .line 195
    iget-object v1, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    return-object v1
.end method

.method public getUInt()J
    .registers 12

    .prologue
    const-wide/32 v9, 0xff00

    const/16 v8, 0x8

    .line 127
    const-wide/16 v2, 0x0

    .line 128
    .local v2, "foo":J
    const-wide/16 v0, 0x0

    .line 129
    .local v0, "bar":J
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v4

    int-to-long v2, v4

    .line 130
    shl-long v4, v2, v8

    and-long/2addr v4, v9

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v6

    and-int/lit16 v6, v6, 0xff

    int-to-long v6, v6

    or-long v2, v4, v6

    .line 131
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v4

    int-to-long v0, v4

    .line 132
    shl-long v4, v0, v8

    and-long/2addr v4, v9

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v6

    and-int/lit16 v6, v6, 0xff

    int-to-long v6, v6

    or-long v0, v4, v6

    .line 133
    const/16 v4, 0x10

    shl-long v4, v2, v4

    const-wide/32 v6, -0x10000

    and-long/2addr v4, v6

    const-wide/32 v6, 0xffff

    and-long/2addr v6, v0

    or-long v2, v4, v6

    .line 134
    return-wide v2
.end method

.method public putByte(B)V
    .registers 5
    .param p1, "foo"    # B

    .prologue
    .line 49
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    aput-byte p1, v0, v1

    .line 50
    return-void
.end method

.method public putByte([B)V
    .registers 4
    .param p1, "foo"    # [B

    .prologue
    .line 52
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([BII)V

    .line 53
    return-void
.end method

.method public putByte([BII)V
    .registers 6
    .param p1, "foo"    # [B
    .param p2, "begin"    # I
    .param p3, "length"    # I

    .prologue
    .line 55
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 57
    return-void
.end method

.method public putInt(I)V
    .registers 7
    .param p1, "val"    # I

    .prologue
    const/4 v4, 0x0

    .line 66
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/4 v1, 0x1

    ushr-int/lit8 v2, p1, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 68
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/4 v1, 0x2

    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 69
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/4 v1, 0x3

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 70
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    const/4 v3, 0x4

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 72
    return-void
.end method

.method public putLong(J)V
    .registers 11
    .param p1, "val"    # J

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 74
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x38

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 75
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x30

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 76
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x28

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    .line 77
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x20

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    .line 78
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-static {v0, v3, v1, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x18

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 80
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x10

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 81
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    const/16 v1, 0x8

    ushr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    .line 82
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    long-to-int v1, p1

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    .line 83
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->tmp:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, 0x4

    invoke-static {v0, v3, v1, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 85
    return-void
.end method

.method public putMPInt([B)V
    .registers 5
    .param p1, "foo"    # [B

    .prologue
    const/4 v2, 0x0

    .line 96
    array-length v0, p1

    .line 97
    .local v0, "i":I
    aget-byte v1, p1, v2

    and-int/lit16 v1, v1, 0x80

    if-eqz v1, :cond_14

    .line 98
    add-int/lit8 v0, v0, 0x1

    .line 99
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 100
    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 105
    :goto_10
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 106
    return-void

    .line 103
    :cond_14
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    goto :goto_10
.end method

.method putPad(I)V
    .registers 5
    .param p1, "n"    # I

    .prologue
    .line 90
    :goto_0
    if-lez p1, :cond_10

    .line 91
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    const/4 v2, 0x0

    aput-byte v2, v0, v1

    .line 92
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 94
    :cond_10
    return-void
.end method

.method public putString([B)V
    .registers 4
    .param p1, "foo"    # [B

    .prologue
    .line 59
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/Buffer;->putString([BII)V

    .line 60
    return-void
.end method

.method public putString([BII)V
    .registers 4
    .param p1, "foo"    # [B
    .param p2, "begin"    # I
    .param p3, "length"    # I

    .prologue
    .line 62
    invoke-virtual {p0, p3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 63
    invoke-virtual {p0, p1, p2, p3}, Lcom/jcraft/jsch/Buffer;->putByte([BII)V

    .line 64
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 198
    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 199
    iput v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 200
    return-void
.end method

.method rewind()V
    .registers 2

    .prologue
    .line 208
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 209
    return-void
.end method

.method public setOffSet(I)V
    .registers 2
    .param p1, "s"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    .line 115
    return-void
.end method

.method public shift()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 202
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->s:I

    if-nez v0, :cond_6

    .line 206
    :goto_5
    return-void

    .line 203
    :cond_6
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    iget-object v2, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v3, p0, Lcom/jcraft/jsch/Buffer;->index:I

    iget v4, p0, Lcom/jcraft/jsch/Buffer;->s:I

    sub-int/2addr v3, v4

    invoke-static {v0, v1, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    iget v1, p0, Lcom/jcraft/jsch/Buffer;->s:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 205
    iput v5, p0, Lcom/jcraft/jsch/Buffer;->s:I

    goto :goto_5
.end method

.method skip(I)V
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 87
    iget v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 88
    return-void
.end method
