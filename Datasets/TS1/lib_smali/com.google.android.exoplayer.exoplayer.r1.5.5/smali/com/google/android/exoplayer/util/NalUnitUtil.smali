.class public final Lcom/google/android/exoplayer/util/NalUnitUtil;
.super Ljava/lang/Object;
.source "NalUnitUtil.java"


# static fields
.field public static final ASPECT_RATIO_IDC_VALUES:[F

.field public static final EXTENDED_SAR:I = 0xff

.field public static final NAL_START_CODE:[B

.field private static scratchEscapePositions:[I

.field private static final scratchEscapePositionsLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_20

    sput-object v0, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    .line 31
    const/16 v0, 0x11

    new-array v0, v0, [F

    fill-array-data v0, :array_26

    sput-object v0, Lcom/google/android/exoplayer/util/NalUnitUtil;->ASPECT_RATIO_IDC_VALUES:[F

    .line 51
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositionsLock:Ljava/lang/Object;

    .line 57
    const/16 v0, 0xa

    new-array v0, v0, [I

    sput-object v0, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    return-void

    .line 26
    nop

    :array_20
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 31
    :array_26
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f8ba2e9
        0x3f68ba2f
        0x3fba2e8c
        0x3f9b26ca
        0x400ba2e9
        0x3fe8ba2f
        0x403a2e8c
        0x401b26ca
        0x3fd1745d
        0x3fae8ba3
        0x3ff83e10
        0x3fcede62
        0x3faaaaab
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    return-void
.end method

.method public static clearPrefixFlags([Z)V
    .registers 3
    .param p0, "prefixFlags"    # [Z

    .prologue
    const/4 v1, 0x0

    .line 225
    aput-boolean v1, p0, v1

    .line 226
    const/4 v0, 0x1

    aput-boolean v1, p0, v0

    .line 227
    const/4 v0, 0x2

    aput-boolean v1, p0, v0

    .line 228
    return-void
.end method

.method public static findNalUnit([BII[Z)I
    .registers 11
    .param p0, "data"    # [B
    .param p1, "startOffset"    # I
    .param p2, "endOffset"    # I
    .param p3, "prefixFlags"    # [Z

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 163
    sub-int v1, p2, p1

    .line 165
    .local v1, "length":I
    if-ltz v1, :cond_e

    move v3, v4

    :goto_8
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 166
    if-nez v1, :cond_10

    .line 216
    .end local p2    # "endOffset":I
    :cond_d
    :goto_d
    return p2

    .restart local p2    # "endOffset":I
    :cond_e
    move v3, v5

    .line 165
    goto :goto_8

    .line 170
    :cond_10
    if-eqz p3, :cond_42

    .line 171
    aget-boolean v3, p3, v5

    if-eqz v3, :cond_1c

    .line 172
    invoke-static {p3}, Lcom/google/android/exoplayer/util/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 173
    add-int/lit8 p2, p1, -0x3

    goto :goto_d

    .line 174
    :cond_1c
    if-le v1, v4, :cond_2c

    aget-boolean v3, p3, v4

    if-eqz v3, :cond_2c

    aget-byte v3, p0, p1

    if-ne v3, v4, :cond_2c

    .line 175
    invoke-static {p3}, Lcom/google/android/exoplayer/util/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 176
    add-int/lit8 p2, p1, -0x2

    goto :goto_d

    .line 177
    :cond_2c
    if-le v1, v6, :cond_42

    aget-boolean v3, p3, v6

    if-eqz v3, :cond_42

    aget-byte v3, p0, p1

    if-nez v3, :cond_42

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_42

    .line 179
    invoke-static {p3}, Lcom/google/android/exoplayer/util/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 180
    add-int/lit8 p2, p1, -0x1

    goto :goto_d

    .line 184
    :cond_42
    add-int/lit8 v2, p2, -0x1

    .line 187
    .local v2, "limit":I
    add-int/lit8 v0, p1, 0x2

    .local v0, "i":I
    :goto_46
    if-ge v0, v2, :cond_6c

    .line 188
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xfe

    if-eqz v3, :cond_51

    .line 187
    :goto_4e
    add-int/lit8 v0, v0, 0x3

    goto :goto_46

    .line 191
    :cond_51
    add-int/lit8 v3, v0, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_69

    add-int/lit8 v3, v0, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_69

    aget-byte v3, p0, v0

    if-ne v3, v4, :cond_69

    .line 192
    if-eqz p3, :cond_66

    .line 193
    invoke-static {p3}, Lcom/google/android/exoplayer/util/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 195
    :cond_66
    add-int/lit8 p2, v0, -0x2

    goto :goto_d

    .line 199
    :cond_69
    add-int/lit8 v0, v0, -0x2

    goto :goto_4e

    .line 203
    :cond_6c
    if-eqz p3, :cond_d

    .line 205
    if-le v1, v6, :cond_a2

    add-int/lit8 v3, p2, -0x3

    aget-byte v3, p0, v3

    if-nez v3, :cond_a0

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_a0

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_a0

    move v3, v4

    :goto_83
    aput-boolean v3, p3, v5

    .line 210
    if-le v1, v4, :cond_c8

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_c6

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_c6

    move v3, v4

    :goto_94
    aput-boolean v3, p3, v4

    .line 213
    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_d6

    :goto_9c
    aput-boolean v4, p3, v6

    goto/16 :goto_d

    :cond_a0
    move v3, v5

    .line 205
    goto :goto_83

    :cond_a2
    if-ne v1, v6, :cond_b8

    aget-boolean v3, p3, v6

    if-eqz v3, :cond_b6

    add-int/lit8 v3, p2, -0x2

    aget-byte v3, p0, v3

    if-nez v3, :cond_b6

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_b6

    move v3, v4

    goto :goto_83

    :cond_b6
    move v3, v5

    goto :goto_83

    :cond_b8
    aget-boolean v3, p3, v4

    if-eqz v3, :cond_c4

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_c4

    move v3, v4

    goto :goto_83

    :cond_c4
    move v3, v5

    goto :goto_83

    :cond_c6
    move v3, v5

    .line 210
    goto :goto_94

    :cond_c8
    aget-boolean v3, p3, v6

    if-eqz v3, :cond_d4

    add-int/lit8 v3, p2, -0x1

    aget-byte v3, p0, v3

    if-nez v3, :cond_d4

    move v3, v4

    goto :goto_94

    :cond_d4
    move v3, v5

    goto :goto_94

    :cond_d6
    move v4, v5

    .line 213
    goto :goto_9c
.end method

.method private static findNextUnescapeIndex([BII)I
    .registers 6
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "limit"    # I

    .prologue
    .line 231
    move v0, p1

    .local v0, "i":I
    :goto_1
    add-int/lit8 v1, p2, -0x2

    if-ge v0, v1, :cond_1a

    .line 232
    aget-byte v1, p0, v0

    if-nez v1, :cond_17

    add-int/lit8 v1, v0, 0x1

    aget-byte v1, p0, v1

    if-nez v1, :cond_17

    add-int/lit8 v1, v0, 0x2

    aget-byte v1, p0, v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_17

    .line 236
    .end local v0    # "i":I
    :goto_16
    return v0

    .line 231
    .restart local v0    # "i":I
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1a
    move v0, p2

    .line 236
    goto :goto_16
.end method

.method public static getH265NalUnitType([BI)I
    .registers 3
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 137
    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    and-int/lit8 v0, v0, 0x7e

    shr-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static getNalUnitType([BI)I
    .registers 3
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 125
    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method public static parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B
    .registers 4
    .param p0, "atom"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v0

    .line 111
    .local v0, "length":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v1

    .line 112
    .local v1, "offset":I
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 113
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v2, v1, v0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->buildNalUnit([BII)[B

    move-result-object v2

    return-object v2
.end method

.method public static unescapeStream([BI)I
    .registers 16
    .param p0, "data"    # [B
    .param p1, "limit"    # I

    .prologue
    .line 71
    sget-object v12, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositionsLock:Ljava/lang/Object;

    monitor-enter v12

    .line 72
    const/4 v4, 0x0

    .line 73
    .local v4, "position":I
    const/4 v6, 0x0

    .local v6, "scratchEscapeCount":I
    move v7, v6

    .line 74
    .end local v6    # "scratchEscapeCount":I
    .local v7, "scratchEscapeCount":I
    :cond_6
    :goto_6
    if-ge v4, p1, :cond_2a

    .line 75
    :try_start_8
    invoke-static {p0, v4, p1}, Lcom/google/android/exoplayer/util/NalUnitUtil;->findNextUnescapeIndex([BII)I

    move-result v4

    .line 76
    if-ge v4, p1, :cond_6

    .line 77
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    array-length v11, v11

    if-gt v11, v7, :cond_20

    .line 79
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    sget-object v13, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    array-length v13, v13

    mul-int/lit8 v13, v13, 0x2

    invoke-static {v11, v13}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v11

    sput-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    .line 82
    :cond_20
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_52

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "scratchEscapeCount":I
    .restart local v6    # "scratchEscapeCount":I
    :try_start_24
    aput v4, v11, v7
    :try_end_26
    .catchall {:try_start_24 .. :try_end_26} :catchall_56

    .line 83
    add-int/lit8 v4, v4, 0x3

    move v7, v6

    .end local v6    # "scratchEscapeCount":I
    .restart local v7    # "scratchEscapeCount":I
    goto :goto_6

    .line 87
    :cond_2a
    sub-int v8, p1, v7

    .line 88
    .local v8, "unescapedLength":I
    const/4 v1, 0x0

    .line 89
    .local v1, "escapedPosition":I
    const/4 v9, 0x0

    .line 90
    .local v9, "unescapedPosition":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2f
    if-ge v2, v7, :cond_4b

    .line 91
    :try_start_31
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->scratchEscapePositions:[I

    aget v3, v11, v2

    .line 92
    .local v3, "nextEscapePosition":I
    sub-int v0, v3, v1

    .line 93
    .local v0, "copyLength":I
    invoke-static {p0, v1, p0, v9, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    add-int/2addr v9, v0

    .line 95
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "unescapedPosition":I
    .local v10, "unescapedPosition":I
    const/4 v11, 0x0

    aput-byte v11, p0, v9

    .line 96
    add-int/lit8 v9, v10, 0x1

    .end local v10    # "unescapedPosition":I
    .restart local v9    # "unescapedPosition":I
    const/4 v11, 0x0

    aput-byte v11, p0, v10

    .line 97
    add-int/lit8 v11, v0, 0x3

    add-int/2addr v1, v11

    .line 90
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 100
    .end local v0    # "copyLength":I
    .end local v3    # "nextEscapePosition":I
    :cond_4b
    sub-int v5, v8, v9

    .line 101
    .local v5, "remainingLength":I
    invoke-static {p0, v1, p0, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 102
    monitor-exit v12
    :try_end_51
    .catchall {:try_start_31 .. :try_end_51} :catchall_52

    return v8

    .line 103
    .end local v1    # "escapedPosition":I
    .end local v2    # "i":I
    .end local v5    # "remainingLength":I
    .end local v8    # "unescapedLength":I
    .end local v9    # "unescapedPosition":I
    :catchall_52
    move-exception v11

    move v6, v7

    .end local v7    # "scratchEscapeCount":I
    .restart local v6    # "scratchEscapeCount":I
    :goto_54
    :try_start_54
    monitor-exit v12
    :try_end_55
    .catchall {:try_start_54 .. :try_end_55} :catchall_56

    throw v11

    :catchall_56
    move-exception v11

    goto :goto_54
.end method
