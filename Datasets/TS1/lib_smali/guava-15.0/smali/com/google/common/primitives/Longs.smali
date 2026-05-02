.class public final Lcom/google/common/primitives/Longs;
.super Ljava/lang/Object;
.source "Longs.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/primitives/Longs$LongArrayAsList;,
        Lcom/google/common/primitives/Longs$LexicographicalComparator;
    }
.end annotation


# static fields
.field public static final BYTES:I = 0x8

.field public static final MAX_POWER_OF_TWO:J = 0x4000000000000000L


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([JJII)I
    .registers 6
    .param p0, "x0"    # [J
    .param p1, "x1"    # J
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 48
    invoke-static {p0, p1, p2, p3, p4}, Lcom/google/common/primitives/Longs;->indexOf([JJII)I

    move-result v0

    return v0
.end method

.method static synthetic access$100([JJII)I
    .registers 6
    .param p0, "x0"    # [J
    .param p1, "x1"    # J
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 48
    invoke-static {p0, p1, p2, p3, p4}, Lcom/google/common/primitives/Longs;->lastIndexOf([JJII)I

    move-result v0

    return v0
.end method

.method public static varargs asList([J)Ljava/util/List;
    .registers 2
    .param p0, "backingArray"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([J)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 502
    array-length v0, p0

    if-nez v0, :cond_8

    .line 503
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 505
    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Lcom/google/common/primitives/Longs$LongArrayAsList;

    invoke-direct {v0, p0}, Lcom/google/common/primitives/Longs$LongArrayAsList;-><init>([J)V

    goto :goto_7
.end method

.method public static compare(JJ)I
    .registers 5
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    .line 90
    cmp-long v0, p0, p2

    if-gez v0, :cond_6

    const/4 v0, -0x1

    :goto_5
    return v0

    :cond_6
    cmp-long v0, p0, p2

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_5

    :cond_c
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static varargs concat([[J)[J
    .registers 10
    .param p0, "arrays"    # [[J

    .prologue
    .line 237
    const/4 v4, 0x0

    .line 238
    .local v4, "length":I
    move-object v0, p0

    .local v0, "arr$":[[J
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_4
    if-ge v2, v3, :cond_d

    aget-object v1, v0, v2

    .line 239
    .local v1, "array":[J
    array-length v7, v1

    add-int/2addr v4, v7

    .line 238
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 241
    .end local v1    # "array":[J
    :cond_d
    new-array v6, v4, [J

    .line 242
    .local v6, "result":[J
    const/4 v5, 0x0

    .line 243
    .local v5, "pos":I
    move-object v0, p0

    array-length v3, v0

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v3, :cond_21

    aget-object v1, v0, v2

    .line 244
    .restart local v1    # "array":[J
    const/4 v7, 0x0

    array-length v8, v1

    invoke-static {v1, v7, v6, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    array-length v7, v1

    add-int/2addr v5, v7

    .line 243
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 247
    .end local v1    # "array":[J
    :cond_21
    return-object v6
.end method

.method public static contains([JJ)Z
    .registers 9
    .param p0, "array"    # [J
    .param p1, "target"    # J

    .prologue
    .line 103
    move-object v0, p0

    .local v0, "arr$":[J
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_10

    aget-wide v3, v0, v1

    .line 104
    .local v3, "value":J
    cmp-long v5, v3, p1

    if-nez v5, :cond_d

    .line 105
    const/4 v5, 0x1

    .line 108
    .end local v3    # "value":J
    :goto_c
    return v5

    .line 103
    .restart local v3    # "value":J
    :cond_d
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 108
    .end local v3    # "value":J
    :cond_10
    const/4 v5, 0x0

    goto :goto_c
.end method

.method private static copyOf([JI)[J
    .registers 5
    .param p0, "original"    # [J
    .param p1, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 392
    new-array v0, p1, [J

    .line 393
    .local v0, "copy":[J
    array-length v1, p0

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 394
    return-object v0
.end method

.method public static ensureCapacity([JII)[J
    .registers 9
    .param p0, "array"    # [J
    .param p1, "minLength"    # I
    .param p2, "padding"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 383
    if-ltz p1, :cond_2c

    move v0, v1

    :goto_5
    const-string v3, "Invalid minLength: %s"

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 384
    if-ltz p2, :cond_2e

    move v0, v1

    :goto_15
    const-string v3, "Invalid padding: %s"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 385
    array-length v0, p0

    if-ge v0, p1, :cond_2b

    add-int v0, p1, p2

    invoke-static {p0, v0}, Lcom/google/common/primitives/Longs;->copyOf([JI)[J

    move-result-object p0

    .end local p0    # "array":[J
    :cond_2b
    return-object p0

    .restart local p0    # "array":[J
    :cond_2c
    move v0, v2

    .line 383
    goto :goto_5

    :cond_2e
    move v0, v2

    .line 384
    goto :goto_15
.end method

.method public static fromByteArray([B)J
    .registers 9
    .param p0, "bytes"    # [B

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 286
    array-length v0, p0

    if-lt v0, v7, :cond_37

    move v0, v1

    :goto_9
    const-string v3, "array too small: %s < %s"

    new-array v4, v6, [Ljava/lang/Object;

    array-length v5, p0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 288
    aget-byte v0, p0, v2

    aget-byte v1, p0, v1

    aget-byte v2, p0, v6

    const/4 v3, 0x3

    aget-byte v3, p0, v3

    const/4 v4, 0x4

    aget-byte v4, p0, v4

    const/4 v5, 0x5

    aget-byte v5, p0, v5

    const/4 v6, 0x6

    aget-byte v6, p0, v6

    const/4 v7, 0x7

    aget-byte v7, p0, v7

    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->fromBytes(BBBBBBBB)J

    move-result-wide v0

    return-wide v0

    :cond_37
    move v0, v2

    .line 286
    goto :goto_9
.end method

.method public static fromBytes(BBBBBBBB)J
    .registers 15
    .param p0, "b1"    # B
    .param p1, "b2"    # B
    .param p2, "b3"    # B
    .param p3, "b4"    # B
    .param p4, "b5"    # B
    .param p5, "b6"    # B
    .param p6, "b7"    # B
    .param p7, "b8"    # B

    .prologue
    const-wide/16 v5, 0xff

    .line 301
    int-to-long v0, p0

    and-long/2addr v0, v5

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    int-to-long v2, p1

    and-long/2addr v2, v5

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p2

    and-long/2addr v2, v5

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p3

    and-long/2addr v2, v5

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p4

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p5

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p6

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p7

    and-long/2addr v2, v5

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static hashCode(J)I
    .registers 4
    .param p0, "value"    # J

    .prologue
    .line 77
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    xor-long/2addr v0, p0

    long-to-int v0, v0

    return v0
.end method

.method public static indexOf([JJ)I
    .registers 5
    .param p0, "array"    # [J
    .param p1, "target"    # J

    .prologue
    .line 121
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/google/common/primitives/Longs;->indexOf([JJII)I

    move-result v0

    return v0
.end method

.method private static indexOf([JJII)I
    .registers 8
    .param p0, "array"    # [J
    .param p1, "target"    # J
    .param p3, "start"    # I
    .param p4, "end"    # I

    .prologue
    .line 127
    move v0, p3

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_d

    .line 128
    aget-wide v1, p0, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_a

    .line 132
    .end local v0    # "i":I
    :goto_9
    return v0

    .line 127
    .restart local v0    # "i":I
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 132
    :cond_d
    const/4 v0, -0x1

    goto :goto_9
.end method

.method public static indexOf([J[J)I
    .registers 8
    .param p0, "array"    # [J
    .param p1, "target"    # [J

    .prologue
    .line 147
    const-string v2, "array"

    invoke-static {p0, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const-string v2, "target"

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    array-length v2, p1

    if-nez v2, :cond_f

    .line 150
    const/4 v0, 0x0

    .line 162
    :cond_e
    :goto_e
    return v0

    .line 154
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, p0

    array-length v3, p1

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    if-ge v0, v2, :cond_2b

    .line 155
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_18
    array-length v2, p1

    if-ge v1, v2, :cond_e

    .line 156
    add-int v2, v0, v1

    aget-wide v2, p0, v2

    aget-wide v4, p1, v1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_28

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 155
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 162
    .end local v1    # "j":I
    :cond_2b
    const/4 v0, -0x1

    goto :goto_e
.end method

.method public static varargs join(Ljava/lang/String;[J)Ljava/lang/String;
    .registers 7
    .param p0, "separator"    # Ljava/lang/String;
    .param p1, "array"    # [J

    .prologue
    .line 407
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    array-length v2, p1

    if-nez v2, :cond_9

    .line 409
    const-string v2, ""

    .line 418
    :goto_8
    return-object v2

    .line 413
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v2, p1

    mul-int/lit8 v2, v2, 0xa

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 414
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    aget-wide v2, p1, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 415
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_18
    array-length v2, p1

    if-ge v1, v2, :cond_27

    .line 416
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-wide v3, p1, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 415
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 418
    :cond_27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8
.end method

.method public static lastIndexOf([JJ)I
    .registers 5
    .param p0, "array"    # [J
    .param p1, "target"    # J

    .prologue
    .line 175
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/google/common/primitives/Longs;->lastIndexOf([JJII)I

    move-result v0

    return v0
.end method

.method private static lastIndexOf([JJII)I
    .registers 8
    .param p0, "array"    # [J
    .param p1, "target"    # J
    .param p3, "start"    # I
    .param p4, "end"    # I

    .prologue
    .line 181
    add-int/lit8 v0, p4, -0x1

    .local v0, "i":I
    :goto_2
    if-lt v0, p3, :cond_e

    .line 182
    aget-wide v1, p0, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_b

    .line 186
    .end local v0    # "i":I
    :goto_a
    return v0

    .line 181
    .restart local v0    # "i":I
    :cond_b
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 186
    :cond_e
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public static lexicographicalComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<[J>;"
        }
    .end annotation

    .prologue
    .line 438
    sget-object v0, Lcom/google/common/primitives/Longs$LexicographicalComparator;->INSTANCE:Lcom/google/common/primitives/Longs$LexicographicalComparator;

    return-object v0
.end method

.method public static varargs max([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    const/4 v4, 0x0

    .line 217
    array-length v3, p0

    if-lez v3, :cond_19

    const/4 v3, 0x1

    :goto_5
    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 218
    aget-wide v1, p0, v4

    .line 219
    .local v1, "max":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_b
    array-length v3, p0

    if-ge v0, v3, :cond_1b

    .line 220
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-lez v3, :cond_16

    .line 221
    aget-wide v1, p0, v0

    .line 219
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .end local v0    # "i":I
    .end local v1    # "max":J
    :cond_19
    move v3, v4

    .line 217
    goto :goto_5

    .line 224
    .restart local v0    # "i":I
    .restart local v1    # "max":J
    :cond_1b
    return-wide v1
.end method

.method public static varargs min([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    const/4 v4, 0x0

    .line 198
    array-length v3, p0

    if-lez v3, :cond_19

    const/4 v3, 0x1

    :goto_5
    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 199
    aget-wide v1, p0, v4

    .line 200
    .local v1, "min":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_b
    array-length v3, p0

    if-ge v0, v3, :cond_1b

    .line 201
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-gez v3, :cond_16

    .line 202
    aget-wide v1, p0, v0

    .line 200
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .end local v0    # "i":I
    .end local v1    # "min":J
    :cond_19
    move v3, v4

    .line 198
    goto :goto_5

    .line 205
    .restart local v0    # "i":I
    .restart local v1    # "min":J
    :cond_1b
    return-wide v1
.end method

.method public static toArray(Ljava/util/Collection;)[J
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Number;",
            ">;)[J"
        }
    .end annotation

    .prologue
    .line 473
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Number;>;"
    instance-of v4, p0, Lcom/google/common/primitives/Longs$LongArrayAsList;

    if-eqz v4, :cond_b

    .line 474
    check-cast p0, Lcom/google/common/primitives/Longs$LongArrayAsList;

    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Number;>;"
    invoke-virtual {p0}, Lcom/google/common/primitives/Longs$LongArrayAsList;->toLongArray()[J

    move-result-object v0

    .line 484
    .local v0, "array":[J
    .local v1, "boxedArray":[Ljava/lang/Object;
    .local v2, "i":I
    .local v3, "len":I
    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Number;>;"
    :cond_a
    return-object v0

    .line 477
    .end local v0    # "array":[J
    .end local v1    # "boxedArray":[Ljava/lang/Object;
    .end local v2    # "i":I
    .end local v3    # "len":I
    :cond_b
    invoke-interface {p0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 478
    .restart local v1    # "boxedArray":[Ljava/lang/Object;
    array-length v3, v1

    .line 479
    .restart local v3    # "len":I
    new-array v0, v3, [J

    .line 480
    .restart local v0    # "array":[J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_13
    if-ge v2, v3, :cond_a

    .line 482
    aget-object v4, v1, v2

    invoke-static {v4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    aput-wide v4, v0, v2

    .line 480
    add-int/lit8 v2, v2, 0x1

    goto :goto_13
.end method

.method public static toByteArray(J)[B
    .registers 7
    .param p0, "value"    # J

    .prologue
    const/16 v4, 0x8

    .line 264
    new-array v1, v4, [B

    .line 265
    .local v1, "result":[B
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_5
    if-ltz v0, :cond_12

    .line 266
    const-wide/16 v2, 0xff

    and-long/2addr v2, p0

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 267
    shr-long/2addr p0, v4

    .line 265
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 269
    :cond_12
    return-object v1
.end method

.method public static tryParse(Ljava/lang/String;)Ljava/lang/Long;
    .registers 14
    .param p0, "string"    # Ljava/lang/String;
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .prologue
    const-wide/high16 v11, -0x8000000000000000L

    const/16 v10, 0x9

    const/4 v3, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 331
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_15

    move-object v6, v8

    .line 361
    :goto_14
    return-object v6

    .line 334
    :cond_15
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v9, 0x2d

    if-ne v6, v9, :cond_28

    move v5, v3

    .line 335
    .local v5, "negative":Z
    :goto_1e
    if-eqz v5, :cond_2a

    .line 336
    .local v3, "index":I
    :goto_20
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v3, v6, :cond_2c

    move-object v6, v8

    .line 337
    goto :goto_14

    .end local v3    # "index":I
    .end local v5    # "negative":Z
    :cond_28
    move v5, v7

    .line 334
    goto :goto_1e

    .restart local v5    # "negative":Z
    :cond_2a
    move v3, v7

    .line 335
    goto :goto_20

    .line 339
    .restart local v3    # "index":I
    :cond_2c
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .local v4, "index":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int/lit8 v2, v6, -0x30

    .line 340
    .local v2, "digit":I
    if-ltz v2, :cond_38

    if-le v2, v10, :cond_3a

    :cond_38
    move-object v6, v8

    .line 341
    goto :goto_14

    .line 343
    :cond_3a
    neg-int v6, v2

    int-to-long v0, v6

    .local v0, "accum":J
    move v3, v4

    .line 344
    .end local v4    # "index":I
    .restart local v3    # "index":I
    :goto_3d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_69

    .line 345
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .restart local v4    # "index":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int/lit8 v2, v6, -0x30

    .line 346
    if-ltz v2, :cond_58

    if-gt v2, v10, :cond_58

    const-wide v6, -0xcccccccccccccccL

    cmp-long v6, v0, v6

    if-gez v6, :cond_5a

    :cond_58
    move-object v6, v8

    .line 347
    goto :goto_14

    .line 349
    :cond_5a
    const-wide/16 v6, 0xa

    mul-long/2addr v0, v6

    .line 350
    int-to-long v6, v2

    add-long/2addr v6, v11

    cmp-long v6, v0, v6

    if-gez v6, :cond_65

    move-object v6, v8

    .line 351
    goto :goto_14

    .line 353
    :cond_65
    int-to-long v6, v2

    sub-long/2addr v0, v6

    move v3, v4

    .end local v4    # "index":I
    .restart local v3    # "index":I
    goto :goto_3d

    .line 356
    :cond_69
    if-eqz v5, :cond_70

    .line 357
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    goto :goto_14

    .line 358
    :cond_70
    cmp-long v6, v0, v11

    if-nez v6, :cond_76

    move-object v6, v8

    .line 359
    goto :goto_14

    .line 361
    :cond_76
    neg-long v6, v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    goto :goto_14
.end method
