.class public Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;
.super Ljava/lang/Object;
.source "ByteOrderMark.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final UTF_16BE:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

.field public static final UTF_16LE:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

.field public static final UTF_8:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final bytes:[I

.field private final charsetName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x2

    .line 36
    new-instance v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    const-string v1, "UTF-8"

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_2e

    invoke-direct {v0, v1, v2}, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;-><init>(Ljava/lang/String;[I)V

    sput-object v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->UTF_8:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    .line 38
    new-instance v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    const-string v1, "UTF-16BE"

    new-array v2, v3, [I

    fill-array-data v2, :array_38

    invoke-direct {v0, v1, v2}, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;-><init>(Ljava/lang/String;[I)V

    sput-object v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->UTF_16BE:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    .line 40
    new-instance v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    const-string v1, "UTF-16LE"

    new-array v2, v3, [I

    fill-array-data v2, :array_40

    invoke-direct {v0, v1, v2}, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;-><init>(Ljava/lang/String;[I)V

    sput-object v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->UTF_16LE:Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    return-void

    .line 36
    nop

    :array_2e
    .array-data 4
        0xef
        0xbb
        0xbf
    .end array-data

    .line 38
    :array_38
    .array-data 4
        0xfe
        0xff
    .end array-data

    .line 40
    :array_40
    .array-data 4
        0xff
        0xfe
    .end array-data
.end method

.method public varargs constructor <init>(Ljava/lang/String;[I)V
    .registers 6
    .param p1, "charsetName"    # Ljava/lang/String;
    .param p2, "bytes"    # [I

    .prologue
    const/4 v2, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_14

    .line 57
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No charsetName specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_14
    if-eqz p2, :cond_19

    array-length v0, p2

    if-nez v0, :cond_21

    .line 60
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No bytes specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_21
    iput-object p1, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->charsetName:Ljava/lang/String;

    .line 63
    array-length v0, p2

    new-array v0, v0, [I

    iput-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    .line 64
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v1, p2

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 117
    instance-of v3, p1, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    if-nez v3, :cond_6

    .line 129
    :cond_5
    :goto_5
    return v2

    :cond_6
    move-object v0, p1

    .line 120
    check-cast v0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;

    .line 121
    .local v0, "bom":Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;
    iget-object v3, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v3, v3

    invoke-virtual {v0}, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->length()I

    move-result v4

    if-ne v3, v4, :cond_5

    .line 124
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    iget-object v3, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v3, v3

    if-ge v1, v3, :cond_25

    .line 125
    iget-object v3, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    aget v3, v3, v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->get(I)I

    move-result v4

    if-ne v3, v4, :cond_5

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 129
    :cond_25
    const/4 v2, 0x1

    goto :goto_5
.end method

.method public get(I)I
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    aget v0, v0, p1

    return v0
.end method

.method public getBytes()[B
    .registers 4

    .prologue
    .line 101
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v2, v2

    new-array v0, v2, [B

    .line 102
    .local v0, "copy":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v2, v2

    if-ge v1, v2, :cond_15

    .line 103
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    aget v2, v2, v1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 105
    :cond_15
    return-object v0
.end method

.method public getCharsetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->charsetName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v2

    .line 141
    .local v2, "hashCode":I
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_c
    if-ge v3, v4, :cond_14

    aget v1, v0, v3

    .line 142
    .local v1, "b":I
    add-int/2addr v2, v1

    .line 141
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 144
    .end local v1    # "b":I
    :cond_14
    return v2
.end method

.method public length()I
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 157
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->charsetName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    array-length v2, v2

    if-ge v1, v2, :cond_45

    .line 160
    if-lez v1, :cond_2c

    .line 161
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :cond_2c
    const-string v2, "0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    iget-object v2, p0, Lnl/siegmann/epublib/util/commons/io/ByteOrderMark;->bytes:[I

    aget v2, v2, v1

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 166
    :cond_45
    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
