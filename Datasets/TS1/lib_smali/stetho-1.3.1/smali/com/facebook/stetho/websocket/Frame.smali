.class Lcom/facebook/stetho/websocket/Frame;
.super Ljava/lang/Object;
.source "Frame.java"


# static fields
.field public static final OPCODE_BINARY_FRAME:B = 0x2t

.field public static final OPCODE_CONNECTION_CLOSE:B = 0x8t

.field public static final OPCODE_CONNECTION_PING:B = 0x9t

.field public static final OPCODE_CONNECTION_PONG:B = 0xat

.field public static final OPCODE_TEXT_FRAME:B = 0x1t


# instance fields
.field public fin:Z

.field public hasMask:Z

.field public maskingKey:[B

.field public opcode:B

.field public payloadData:[B

.field public payloadLen:J

.field public rsv1:Z

.field public rsv2:Z

.field public rsv3:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private decodeFirstByte(B)V
    .registers 5
    .param p1, "b"    # B

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 64
    and-int/lit16 v0, p1, 0x80

    if-eqz v0, :cond_23

    move v0, v1

    :goto_7
    iput-boolean v0, p0, Lcom/facebook/stetho/websocket/Frame;->fin:Z

    .line 65
    and-int/lit8 v0, p1, 0x40

    if-eqz v0, :cond_25

    move v0, v1

    :goto_e
    iput-boolean v0, p0, Lcom/facebook/stetho/websocket/Frame;->rsv1:Z

    .line 66
    and-int/lit8 v0, p1, 0x20

    if-eqz v0, :cond_27

    move v0, v1

    :goto_15
    iput-boolean v0, p0, Lcom/facebook/stetho/websocket/Frame;->rsv2:Z

    .line 67
    and-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_29

    :goto_1b
    iput-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->rsv3:Z

    .line 68
    and-int/lit8 v0, p1, 0xf

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/facebook/stetho/websocket/Frame;->opcode:B

    .line 69
    return-void

    :cond_23
    move v0, v2

    .line 64
    goto :goto_7

    :cond_25
    move v0, v2

    .line 65
    goto :goto_e

    :cond_27
    move v0, v2

    .line 66
    goto :goto_15

    :cond_29
    move v1, v2

    .line 67
    goto :goto_1b
.end method

.method private decodeLength(BLjava/io/InputStream;)J
    .registers 9
    .param p1, "firstLenByte"    # B
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    .line 90
    const/16 v3, 0x7d

    if-gt p1, v3, :cond_8

    .line 91
    int-to-long v1, p1

    .line 100
    :cond_7
    :goto_7
    return-wide v1

    .line 92
    :cond_8
    const/16 v3, 0x7e

    if-ne p1, v3, :cond_1d

    .line 93
    invoke-static {p2}, Lcom/facebook/stetho/websocket/Frame;->readByteOrThrow(Ljava/io/InputStream;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    invoke-static {p2}, Lcom/facebook/stetho/websocket/Frame;->readByteOrThrow(Ljava/io/InputStream;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    int-to-long v1, v3

    goto :goto_7

    .line 94
    :cond_1d
    const/16 v3, 0x7f

    if-ne p1, v3, :cond_32

    .line 95
    const-wide/16 v1, 0x0

    .line 96
    .local v1, "len":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_24
    if-ge v0, v5, :cond_7

    .line 97
    invoke-static {p2}, Lcom/facebook/stetho/websocket/Frame;->readByteOrThrow(Ljava/io/InputStream;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    or-long/2addr v1, v3

    .line 98
    shl-long/2addr v1, v5

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    .line 102
    .end local v0    # "i":I
    .end local v1    # "len":J
    :cond_32
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected length byte: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static decodeMaskingKey(Ljava/io/InputStream;)[B
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 132
    .local v0, "key":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {p0, v0, v1, v2}, Lcom/facebook/stetho/websocket/Frame;->readBytesOrThrow(Ljava/io/InputStream;[BII)V

    .line 133
    return-object v0
.end method

.method private encodeFirstByte()B
    .registers 3

    .prologue
    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "b":B
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->fin:Z

    if-eqz v1, :cond_8

    .line 74
    const/16 v1, 0x80

    int-to-byte v0, v1

    .line 76
    :cond_8
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->rsv1:Z

    if-eqz v1, :cond_f

    .line 77
    or-int/lit8 v1, v0, 0x40

    int-to-byte v0, v1

    .line 79
    :cond_f
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->rsv2:Z

    if-eqz v1, :cond_16

    .line 80
    or-int/lit8 v1, v0, 0x20

    int-to-byte v0, v1

    .line 82
    :cond_16
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->rsv3:Z

    if-eqz v1, :cond_1d

    .line 83
    or-int/lit8 v1, v0, 0x10

    int-to-byte v0, v1

    .line 85
    :cond_1d
    iget-byte v1, p0, Lcom/facebook/stetho/websocket/Frame;->opcode:B

    and-int/lit8 v1, v1, 0xf

    or-int/2addr v1, v0

    int-to-byte v0, v1

    .line 86
    return v0
.end method

.method private static encodeLength(J)[B
    .registers 10
    .param p0, "len"    # J

    .prologue
    const/4 v7, 0x2

    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    const-wide/16 v4, 0xff

    .line 107
    const-wide/16 v0, 0x7d

    cmp-long v0, p0, v0

    if-gtz v0, :cond_14

    .line 108
    new-array v0, v3, [B

    long-to-int v1, p0

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 116
    :goto_13
    return-object v0

    .line 109
    :cond_14
    const-wide/32 v0, 0xffff

    cmp-long v0, p0, v0

    if-gtz v0, :cond_30

    .line 110
    const/4 v0, 0x3

    new-array v0, v0, [B

    const/16 v1, 0x7e

    aput-byte v1, v0, v2

    shr-long v1, p0, v6

    and-long/2addr v1, v4

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    and-long v1, p0, v4

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    goto :goto_13

    .line 116
    :cond_30
    const/16 v0, 0x9

    new-array v0, v0, [B

    const/16 v1, 0x7f

    aput-byte v1, v0, v2

    const/16 v1, 0x38

    shr-long v1, p0, v1

    and-long/2addr v1, v4

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    const/16 v1, 0x30

    shr-long v1, p0, v1

    and-long/2addr v1, v4

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    const/4 v1, 0x3

    const/16 v2, 0x28

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x20

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x18

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x10

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    shr-long v2, p0, v6

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    and-long v1, p0, v4

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    goto :goto_13
.end method

.method private static readByteOrThrow(Ljava/io/InputStream;)B
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 150
    .local v0, "b":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_d

    .line 151
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 153
    :cond_d
    int-to-byte v1, v0

    return v1
.end method

.method private static readBytesOrThrow(Ljava/io/InputStream;[BII)V
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    :goto_0
    if-lez p3, :cond_12

    .line 139
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 140
    .local v0, "n":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_f

    .line 141
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 143
    :cond_f
    sub-int/2addr p3, v0

    .line 144
    add-int/2addr p2, v0

    .line 145
    goto :goto_0

    .line 146
    .end local v0    # "n":I
    :cond_12
    return-void
.end method


# virtual methods
.method public readFrom(Ljava/io/BufferedInputStream;)V
    .registers 8
    .param p1, "input"    # Ljava/io/BufferedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 39
    invoke-static {p1}, Lcom/facebook/stetho/websocket/Frame;->readByteOrThrow(Ljava/io/InputStream;)B

    move-result v1

    invoke-direct {p0, v1}, Lcom/facebook/stetho/websocket/Frame;->decodeFirstByte(B)V

    .line 40
    invoke-static {p1}, Lcom/facebook/stetho/websocket/Frame;->readByteOrThrow(Ljava/io/InputStream;)B

    move-result v0

    .line 41
    .local v0, "maskAndFirstLengthBits":B
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_40

    const/4 v1, 0x1

    :goto_11
    iput-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->hasMask:Z

    .line 42
    and-int/lit16 v1, v0, -0x81

    int-to-byte v1, v1

    invoke-direct {p0, v1, p1}, Lcom/facebook/stetho/websocket/Frame;->decodeLength(BLjava/io/InputStream;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    .line 43
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->hasMask:Z

    if-eqz v1, :cond_42

    invoke-static {p1}, Lcom/facebook/stetho/websocket/Frame;->decodeMaskingKey(Ljava/io/InputStream;)[B

    move-result-object v1

    :goto_24
    iput-object v1, p0, Lcom/facebook/stetho/websocket/Frame;->maskingKey:[B

    .line 44
    iget-wide v3, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    long-to-int v1, v3

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/facebook/stetho/websocket/Frame;->payloadData:[B

    .line 45
    iget-object v1, p0, Lcom/facebook/stetho/websocket/Frame;->payloadData:[B

    iget-wide v3, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    long-to-int v3, v3

    invoke-static {p1, v1, v2, v3}, Lcom/facebook/stetho/websocket/Frame;->readBytesOrThrow(Ljava/io/InputStream;[BII)V

    .line 46
    iget-object v1, p0, Lcom/facebook/stetho/websocket/Frame;->maskingKey:[B

    iget-object v3, p0, Lcom/facebook/stetho/websocket/Frame;->payloadData:[B

    iget-wide v4, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    long-to-int v4, v4

    invoke-static {v1, v3, v2, v4}, Lcom/facebook/stetho/websocket/MaskingHelper;->unmask([B[BII)V

    .line 47
    return-void

    :cond_40
    move v1, v2

    .line 41
    goto :goto_11

    .line 43
    :cond_42
    const/4 v1, 0x0

    goto :goto_24
.end method

.method public writeTo(Ljava/io/BufferedOutputStream;)V
    .registers 7
    .param p1, "output"    # Ljava/io/BufferedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 50
    invoke-direct {p0}, Lcom/facebook/stetho/websocket/Frame;->encodeFirstByte()B

    move-result v1

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write(I)V

    .line 51
    iget-wide v1, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    invoke-static {v1, v2}, Lcom/facebook/stetho/websocket/Frame;->encodeLength(J)[B

    move-result-object v0

    .line 52
    .local v0, "lengthAndMaskBit":[B
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->hasMask:Z

    if-eqz v1, :cond_19

    .line 53
    aget-byte v1, v0, v4

    or-int/lit16 v1, v1, 0x80

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 55
    :cond_19
    array-length v1, v0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 57
    iget-boolean v1, p0, Lcom/facebook/stetho/websocket/Frame;->hasMask:Z

    if-eqz v1, :cond_29

    .line 58
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "Writing masked data not implemented"

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_29
    iget-object v1, p0, Lcom/facebook/stetho/websocket/Frame;->payloadData:[B

    iget-wide v2, p0, Lcom/facebook/stetho/websocket/Frame;->payloadLen:J

    long-to-int v2, v2

    invoke-virtual {p1, v1, v4, v2}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 61
    return-void
.end method
