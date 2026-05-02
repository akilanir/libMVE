.class public Ljavassist/bytecode/ByteArray;
.super Ljava/lang/Object;
.source "ByteArray.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static copy32bit([BI[BI)V
    .registers 6
    .param p0, "src"    # [B
    .param p1, "isrc"    # I
    .param p2, "dest"    # [B
    .param p3, "idest"    # I

    .prologue
    .line 72
    aget-byte v0, p0, p1

    aput-byte v0, p2, p3

    .line 73
    add-int/lit8 v0, p3, 0x1

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    aput-byte v1, p2, v0

    .line 74
    add-int/lit8 v0, p3, 0x2

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    aput-byte v1, p2, v0

    .line 75
    add-int/lit8 v0, p3, 0x3

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    aput-byte v1, p2, v0

    .line 76
    return-void
.end method

.method public static read32bit([BI)I
    .registers 4
    .param p0, "code"    # [B
    .param p1, "index"    # I

    .prologue
    .line 49
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static readS16bit([BI)I
    .registers 4
    .param p0, "code"    # [B
    .param p1, "index"    # I

    .prologue
    .line 34
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static readU16bit([BI)I
    .registers 4
    .param p0, "code"    # [B
    .param p1, "index"    # I

    .prologue
    .line 27
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static write16bit(I[BI)V
    .registers 5
    .param p0, "value"    # I
    .param p1, "code"    # [B
    .param p2, "index"    # I

    .prologue
    .line 41
    ushr-int/lit8 v0, p0, 0x8

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 42
    add-int/lit8 v0, p2, 0x1

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 43
    return-void
.end method

.method public static write32bit(I[BI)V
    .registers 5
    .param p0, "value"    # I
    .param p1, "code"    # [B
    .param p2, "index"    # I

    .prologue
    .line 57
    ushr-int/lit8 v0, p0, 0x18

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 58
    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 59
    add-int/lit8 v0, p2, 0x2

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 60
    add-int/lit8 v0, p2, 0x3

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 61
    return-void
.end method
