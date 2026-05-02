.class public Lorg/apache/commons/compress/utils/ArchiveUtils;
.super Ljava/lang/Object;
.source "ArchiveUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static isArrayZero([BI)Z
    .registers 4
    .param p0, "a"    # [B
    .param p1, "size"    # I

    .prologue
    .line 247
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_c

    .line 248
    aget-byte v1, p0, v0

    if-eqz v1, :cond_9

    .line 249
    const/4 v1, 0x0

    .line 252
    :goto_8
    return v1

    .line 247
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 252
    :cond_c
    const/4 v1, 0x1

    goto :goto_8
.end method

.method public static isEqual([BII[BII)Z
    .registers 13
    .param p0, "buffer1"    # [B
    .param p1, "offset1"    # I
    .param p2, "length1"    # I
    .param p3, "buffer2"    # [B
    .param p4, "offset2"    # I
    .param p5, "length2"    # I

    .prologue
    .line 194
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isEqual([BII[BIIZ)Z

    move-result v0

    return v0
.end method

.method public static isEqual([BII[BIIZ)Z
    .registers 13
    .param p0, "buffer1"    # [B
    .param p1, "offset1"    # I
    .param p2, "length1"    # I
    .param p3, "buffer2"    # [B
    .param p4, "offset2"    # I
    .param p5, "length2"    # I
    .param p6, "ignoreTrailingNulls"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 152
    if-ge p2, p5, :cond_13

    move v1, p2

    .line 153
    .local v1, "minLen":I
    :goto_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    if-ge v0, v1, :cond_18

    .line 154
    add-int v4, p1, v0

    aget-byte v4, p0, v4

    add-int v5, p4, v0

    aget-byte v5, p3, v5

    if-eq v4, v5, :cond_15

    .line 177
    :cond_12
    :goto_12
    return v2

    .end local v0    # "i":I
    .end local v1    # "minLen":I
    :cond_13
    move v1, p5

    .line 152
    goto :goto_5

    .line 153
    .restart local v0    # "i":I
    .restart local v1    # "minLen":I
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 158
    :cond_18
    if-ne p2, p5, :cond_1c

    move v2, v3

    .line 159
    goto :goto_12

    .line 161
    :cond_1c
    if-eqz p6, :cond_12

    .line 162
    if-le p2, p5, :cond_2c

    .line 163
    move v0, p5

    :goto_21
    if-ge v0, p2, :cond_38

    .line 164
    add-int v4, p1, v0

    aget-byte v4, p0, v4

    if-nez v4, :cond_12

    .line 163
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 169
    :cond_2c
    move v0, p2

    :goto_2d
    if-ge v0, p5, :cond_38

    .line 170
    add-int v4, p4, v0

    aget-byte v4, p3, v4

    if-nez v4, :cond_12

    .line 169
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    :cond_38
    move v2, v3

    .line 175
    goto :goto_12
.end method

.method public static isEqual([B[B)Z
    .registers 9
    .param p0, "buffer1"    # [B
    .param p1, "buffer2"    # [B

    .prologue
    const/4 v1, 0x0

    .line 205
    array-length v2, p0

    array-length v5, p1

    move-object v0, p0

    move-object v3, p1

    move v4, v1

    move v6, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isEqual([BII[BIIZ)Z

    move-result v0

    return v0
.end method

.method public static isEqual([B[BZ)Z
    .registers 10
    .param p0, "buffer1"    # [B
    .param p1, "buffer2"    # [B
    .param p2, "ignoreTrailingNulls"    # Z

    .prologue
    const/4 v1, 0x0

    .line 217
    array-length v2, p0

    array-length v5, p1

    move-object v0, p0

    move-object v3, p1

    move v4, v1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isEqual([BII[BIIZ)Z

    move-result v0

    return v0
.end method

.method public static isEqualWithNull([BII[BII)Z
    .registers 13
    .param p0, "buffer1"    # [B
    .param p1, "offset1"    # I
    .param p2, "length1"    # I
    .param p3, "buffer2"    # [B
    .param p4, "offset2"    # I
    .param p5, "length2"    # I

    .prologue
    .line 234
    const/4 v6, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isEqual([BII[BIIZ)Z

    move-result v0

    return v0
.end method

.method public static matchAsciiBuffer(Ljava/lang/String;[B)Z
    .registers 4
    .param p0, "expected"    # Ljava/lang/String;
    .param p1, "buffer"    # [B

    .prologue
    .line 88
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v0

    return v0
.end method

.method public static matchAsciiBuffer(Ljava/lang/String;[BII)Z
    .registers 12
    .param p0, "expected"    # Ljava/lang/String;
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 73
    :try_start_1
    const-string v2, "US-ASCII"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_6} :catch_11

    move-result-object v0

    .line 77
    .local v0, "buffer1":[B
    array-length v2, v0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isEqual([BII[BIIZ)Z

    move-result v1

    return v1

    .line 74
    .end local v0    # "buffer1":[B
    :catch_11
    move-exception v7

    .line 75
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static toAsciiBytes(Ljava/lang/String;)[B
    .registers 3
    .param p0, "inputString"    # Ljava/lang/String;

    .prologue
    .line 100
    :try_start_0
    const-string v1, "US-ASCII"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 101
    :catch_7
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static toAsciiString([B)Ljava/lang/String;
    .registers 4
    .param p0, "inputBytes"    # [B

    .prologue
    .line 114
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "US-ASCII"

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_8

    return-object v1

    .line 115
    :catch_8
    move-exception v0

    .line 116
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static toAsciiString([BII)Ljava/lang/String;
    .registers 6
    .param p0, "inputBytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 130
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "US-ASCII"

    invoke-direct {v1, p0, p1, p2, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_8

    return-object v1

    .line 131
    :catch_8
    move-exception v0

    .line 132
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static toString(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Ljava/lang/String;
    .registers 7
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/16 v5, 0x20

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2a

    const/16 v3, 0x64

    :goto_f
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    invoke-interface {p0}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getSize()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "size":Ljava/lang/String;
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_1e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-le v0, v3, :cond_2d

    .line 53
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    add-int/lit8 v0, v0, -0x1

    goto :goto_1e

    .line 48
    .end local v0    # "i":I
    .end local v2    # "size":Ljava/lang/String;
    :cond_2a
    const/16 v3, 0x2d

    goto :goto_f

    .line 55
    .restart local v0    # "i":I
    .restart local v2    # "size":Ljava/lang/String;
    :cond_2d
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
