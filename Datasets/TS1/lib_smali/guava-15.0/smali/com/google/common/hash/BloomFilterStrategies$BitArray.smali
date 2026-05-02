.class Lcom/google/common/hash/BloomFilterStrategies$BitArray;
.super Ljava/lang/Object;
.source "BloomFilterStrategies.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/BloomFilterStrategies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BitArray"
.end annotation


# instance fields
.field bitCount:I

.field final data:[J


# direct methods
.method constructor <init>(J)V
    .registers 6
    .param p1, "bits"    # J

    .prologue
    .line 83
    const-wide/16 v0, 0x40

    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {p1, p2, v0, v1, v2}, Lcom/google/common/math/LongMath;->divide(JJLjava/math/RoundingMode;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->checkedCast(J)I

    move-result v0

    new-array v0, v0, [J

    invoke-direct {p0, v0}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;-><init>([J)V

    .line 84
    return-void
.end method

.method constructor <init>([J)V
    .registers 10
    .param p1, "data"    # [J

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    array-length v6, p1

    if-lez v6, :cond_1e

    const/4 v6, 0x1

    :goto_7
    const-string v7, "data length is zero!"

    invoke-static {v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 89
    iput-object p1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, "bitCount":I
    move-object v0, p1

    .local v0, "arr$":[J
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_12
    if-ge v2, v3, :cond_20

    aget-wide v4, v0, v2

    .line 92
    .local v4, "value":J
    invoke-static {v4, v5}, Ljava/lang/Long;->bitCount(J)I

    move-result v6

    add-int/2addr v1, v6

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 88
    .end local v0    # "arr$":[J
    .end local v1    # "bitCount":I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "value":J
    :cond_1e
    const/4 v6, 0x0

    goto :goto_7

    .line 94
    .restart local v0    # "arr$":[J
    .restart local v1    # "bitCount":I
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    :cond_20
    iput v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    .line 95
    return-void
.end method


# virtual methods
.method bitCount()I
    .registers 2

    .prologue
    .line 118
    iget v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    return v0
.end method

.method bitSize()I
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x40

    return v0
.end method

.method copy()Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    .registers 3

    .prologue
    .line 122
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
    .line 137
    instance-of v1, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 138
    check-cast v0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;

    .line 139
    .local v0, "bitArray":Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    iget-object v2, v0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v1

    .line 141
    .end local v0    # "bitArray":Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method get(I)Z
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    shr-int/lit8 v1, p1, 0x6

    aget-wide v0, v0, v1

    const-wide/16 v2, 0x1

    shl-long/2addr v2, p1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 145
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

    .line 127
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v1, v1

    iget-object v4, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v4, v4

    if-ne v1, v4, :cond_48

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

    iget-object v6, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 129
    iput v3, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_28
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    array-length v1, v1

    if-ge v0, v1, :cond_4a

    .line 131
    iget-object v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v2, v1, v0

    iget-object v4, p1, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v4, v4, v0

    or-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 132
    iget v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    iget-object v2, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    aget-wide v2, v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->bitCount(J)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    .line 130
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    .end local v0    # "i":I
    :cond_48
    move v1, v3

    .line 127
    goto :goto_b

    .line 134
    .restart local v0    # "i":I
    :cond_4a
    return-void
.end method

.method set(I)Z
    .registers 8
    .param p1, "index"    # I

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->get(I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 100
    iget-object v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->data:[J

    shr-int/lit8 v1, p1, 0x6

    aget-wide v2, v0, v1

    const-wide/16 v4, 0x1

    shl-long/2addr v4, p1

    or-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 101
    iget v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitCount:I

    .line 102
    const/4 v0, 0x1

    .line 104
    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method
