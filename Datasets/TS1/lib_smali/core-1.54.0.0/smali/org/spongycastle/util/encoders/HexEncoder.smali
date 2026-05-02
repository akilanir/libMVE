.class public Lorg/spongycastle/util/encoders/HexEncoder;
.super Ljava/lang/Object;
.source "HexEncoder.java"

# interfaces
.implements Lorg/spongycastle/util/encoders/Encoder;


# instance fields
.field protected final decodingTable:[B

.field protected final encodingTable:[B


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_16

    iput-object v0, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    .line 21
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 45
    invoke-virtual {p0}, Lorg/spongycastle/util/encoders/HexEncoder;->initialiseDecodingTable()V

    .line 46
    return-void

    .line 12
    :array_16
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

.method private static ignore(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 74
    const/16 v0, 0xa

    if-eq p0, v0, :cond_10

    const/16 v0, 0xd

    if-eq p0, v0, :cond_10

    const/16 v0, 0x9

    if-eq p0, v0, :cond_10

    const/16 v0, 0x20

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method


# virtual methods
.method public decode(Ljava/lang/String;Ljava/io/OutputStream;)I
    .registers 11
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    const/4 v5, 0x0

    .line 149
    .local v5, "length":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 151
    .local v2, "end":I
    :goto_5
    if-lez v2, :cond_13

    .line 153
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-nez v6, :cond_27

    .line 161
    :cond_13
    const/4 v3, 0x0

    .line 162
    .local v3, "i":I
    :goto_14
    if-ge v3, v2, :cond_64

    move v4, v3

    .line 164
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_17
    if-ge v4, v2, :cond_2a

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 166
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_17

    .line 158
    .end local v4    # "i":I
    :cond_27
    add-int/lit8 v2, v2, -0x1

    goto :goto_5

    .line 169
    .restart local v4    # "i":I
    :cond_2a
    iget-object v6, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget-byte v0, v6, v7

    .local v0, "b1":B
    move v4, v3

    .line 171
    .end local v3    # "i":I
    .restart local v4    # "i":I
    :goto_35
    if-ge v4, v2, :cond_45

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-eqz v6, :cond_45

    .line 173
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_35

    .line 176
    :cond_45
    iget-object v6, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget-byte v1, v6, v7

    .line 178
    .local v1, "b2":B
    or-int v6, v0, v1

    if-gez v6, :cond_5b

    .line 180
    new-instance v6, Ljava/io/IOException;

    const-string v7, "invalid characters encountered in Hex string"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 183
    :cond_5b
    shl-int/lit8 v6, v0, 0x4

    or-int/2addr v6, v1

    invoke-virtual {p2, v6}, Ljava/io/OutputStream;->write(I)V

    .line 185
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 188
    .end local v0    # "b1":B
    .end local v1    # "b2":B
    :cond_64
    return v5
.end method

.method public decode([BIILjava/io/OutputStream;)I
    .registers 13
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "length"    # I
    .param p4, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    const/4 v5, 0x0

    .line 93
    .local v5, "outLen":I
    add-int v2, p2, p3

    .line 95
    .local v2, "end":I
    :goto_3
    if-le v2, p2, :cond_10

    .line 97
    add-int/lit8 v6, v2, -0x1

    aget-byte v6, p1, v6

    int-to-char v6, v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-nez v6, :cond_23

    .line 105
    :cond_10
    move v3, p2

    .line 106
    .local v3, "i":I
    :goto_11
    if-ge v3, v2, :cond_5b

    move v4, v3

    .line 108
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_14
    if-ge v4, v2, :cond_26

    aget-byte v6, p1, v4

    int-to-char v6, v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 110
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_14

    .line 102
    .end local v4    # "i":I
    :cond_23
    add-int/lit8 v2, v2, -0x1

    goto :goto_3

    .line 113
    .restart local v4    # "i":I
    :cond_26
    iget-object v6, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    aget-byte v7, p1, v4

    aget-byte v0, v6, v7

    .local v0, "b1":B
    move v4, v3

    .line 115
    .end local v3    # "i":I
    .restart local v4    # "i":I
    :goto_2f
    if-ge v4, v2, :cond_3e

    aget-byte v6, p1, v4

    int-to-char v6, v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 117
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_2f

    .line 120
    :cond_3e
    iget-object v6, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    aget-byte v7, p1, v4

    aget-byte v1, v6, v7

    .line 122
    .local v1, "b2":B
    or-int v6, v0, v1

    if-gez v6, :cond_52

    .line 124
    new-instance v6, Ljava/io/IOException;

    const-string v7, "invalid characters encountered in Hex data"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 127
    :cond_52
    shl-int/lit8 v6, v0, 0x4

    or-int/2addr v6, v1

    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 129
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    .line 132
    .end local v0    # "b1":B
    .end local v1    # "b2":B
    :cond_5b
    return v5
.end method

.method public encode([BIILjava/io/OutputStream;)I
    .registers 9
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "length"    # I
    .param p4, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    move v0, p2

    .local v0, "i":I
    :goto_1
    add-int v2, p2, p3

    if-ge v0, v2, :cond_1e

    .line 62
    aget-byte v2, p1, v0

    and-int/lit16 v1, v2, 0xff

    .line 64
    .local v1, "v":I
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    ushr-int/lit8 v3, v1, 0x4

    aget-byte v2, v2, v3

    invoke-virtual {p4, v2}, Ljava/io/OutputStream;->write(I)V

    .line 65
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    and-int/lit8 v3, v1, 0xf

    aget-byte v2, v2, v3

    invoke-virtual {p4, v2}, Ljava/io/OutputStream;->write(I)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 68
    .end local v1    # "v":I
    :cond_1e
    mul-int/lit8 v2, p3, 0x2

    return v2
.end method

.method protected initialiseDecodingTable()V
    .registers 6

    .prologue
    .line 25
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_e

    .line 27
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/4 v2, -0x1

    aput-byte v2, v1, v0

    .line 25
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 30
    :cond_e
    const/4 v0, 0x0

    :goto_f
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 32
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    aget-byte v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 30
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 35
    :cond_20
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x41

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x61

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 36
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x42

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x62

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 37
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x43

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x63

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 38
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x44

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x64

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 39
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x45

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x65

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 40
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v2, 0x46

    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    const/16 v4, 0x66

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 41
    return-void
.end method
