.class public Lch/qos/logback/core/encoder/ByteArrayUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hexStringToByteArray(Ljava/lang/String;)[B
    .registers 5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    const/4 v0, 0x0

    :goto_9
    array-length v2, v1

    if-ge v0, v2, :cond_22

    mul-int/lit8 v2, v0, 0x2

    add-int/lit8 v3, v2, 0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_22
    return-object v1
.end method

.method static readInt([BI)I
    .registers 6

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    const/4 v2, 0x4

    if-ge v0, v2, :cond_15

    mul-int/lit8 v2, v0, 0x8

    rsub-int/lit8 v2, v2, 0x18

    add-int v3, p1, v0

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int v2, v3, v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_15
    return v1
.end method

.method public static toHexString([B)Ljava/lang/String;
    .registers 7

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    array-length v2, p0

    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_23

    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1d

    const/16 v4, 0x30

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_1d
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_23
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static writeInt(Ljava/io/ByteArrayOutputStream;I)V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_11

    mul-int/lit8 v1, v0, 0x8

    rsub-int/lit8 v1, v1, 0x18

    ushr-int v1, p1, v1

    int-to-byte v1, v1

    invoke-virtual {p0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_11
    return-void
.end method

.method static writeInt([BII)V
    .registers 6

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_12

    mul-int/lit8 v1, v0, 0x8

    rsub-int/lit8 v1, v1, 0x18

    add-int v2, p1, v0

    ushr-int v1, p2, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_12
    return-void
.end method
