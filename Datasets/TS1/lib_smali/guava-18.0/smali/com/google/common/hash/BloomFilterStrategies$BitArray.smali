.class final Lcom/google/common/hash/BloomFilterStrategies$BitArray;
.super Ljava/lang/Object;
.source "BloomFilterStrategies.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/BloomFilterStrategies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BitArray"
.end annotation


# instance fields
.field bitCount:J

.field final data:[J


# direct methods
.method constructor <init>(J)V
    .registers 6
    .param p1, "bits"    # J

    .prologue
    .line 145
    const-wide/16 v0, 0x40

    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {p1, p2, v0, v1, v2}, Lcom/google/common/math/LongMath;->divide(JJLjava/math/RoundingMode;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->checkedCast(J)I

    move-result v0

    new-array v0, v0, [J

    invoke-direct {p0, v0}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;-><init>([J)V

    .line 146
    return-void
.end method

.method constructor <init>([J)V
    .registers 11
    .param p1, "data"    # [J

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    array-length v7, p1

    if-lez v7, :cond_20

    const/4 v7, 0x1

    :goto_7
    const-string v8, "data length is zero!"

    invoke-static {v7, v8}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 151
    iput-object p1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    .line 152
    const-wide/16 v1, 0x0

    .line 153
    .local v1, "bitCount":J
    move-object v0, p1

    .local v0, "arr$":[J
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_13
    if-ge v3, v4, :cond_22

    aget-wide v5, v0, v3

    .line 154
    .local v5, "value":J
    invoke-static {v5, v6}, Ljava/lang/Long;->bitCount(J)I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v1, v7

    .line 153
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 150
    .end local v0    # "arr$":[J
    .end local v1    # "bitCount":J
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "value":J
    :cond_20
    const/4 v7, 0x0

    goto :goto_7

    .line 156
    .restart local v0    # "arr$":[J
    .restart local v1    # "bitCount":J
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    :cond_22
    iput-wide v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    .line 157
    return-void
.end method


# virtual methods
.method bitCount()J
    .registers 3

    .prologue
    .line 180
    iget-wide v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    return-wide v0
.end method

.method bitSize()J
    .registers 5

    .prologue
    .line 175
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v0, v0

    int-to-long v0, v0

    const-wide/16 v2, 0x40

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method copy()Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    .registers 3

    .prologue
    .line 184
    new-instance v1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    invoke-virtual {v0}, [J->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    invoke-direct {v1, v0}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;-><init>([J)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 199
    instance-of v1, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 200
    check-cast v0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    .line 201
    .local v0, "bitArray":Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    iget-object v2, v0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v1

    .line 203
    .end local v0    # "bitArray":Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method get(J)Z
    .registers 8
    .param p1, "index"    # J

    .prologue
    .line 170
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    const/4 v1, 0x6

    ushr-long v1, p1, v1

    long-to-int v1, v1

    aget-wide v0, v0, v1

    const-wide/16 v2, 0x1

    long-to-int v4, p1

    shl-long/2addr v2, v4

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([J)I

    move-result v0

    return v0
.end method

.method putAll(Lcom/google/common/hash/BloomFilterStrategies$BitArray;)V
    .registers 9
    .param p1, "array"    # Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 189
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v1, v1

    iget-object v4, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v4, v4

    if-ne v1, v4, :cond_4b

    move v1, v2

    :goto_b
    const-string v4, "BitArrays must be of equal length (%s != %s)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget-object v3, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 191
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    .line 192
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2a
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v1, v1

    if-ge v0, v1, :cond_4d

    .line 193
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v2, v1, v0

    iget-object v4, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v4, v4, v0

    or-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 194
    iget-wide v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    iget-object v3, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v3, v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->bitCount(J)I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    .line 192
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .end local v0    # "i":I
    :cond_4b
    move v1, v3

    .line 189
    goto :goto_b

    .line 196
    .restart local v0    # "i":I
    :cond_4d
    return-void
.end method

.method set(J)Z
    .registers 11
    .param p1, "index"    # J

    .prologue
    const-wide/16 v6, 0x1

    .line 161
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->get(J)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 162
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    const/4 v1, 0x6

    ushr-long v1, p1, v1

    long-to-int v1, v1

    aget-wide v2, v0, v1

    long-to-int v4, p1

    shl-long v4, v6, v4

    or-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 163
    iget-wide v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:J

    .line 164
    const/4 v0, 0x1

    .line 166
    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method
