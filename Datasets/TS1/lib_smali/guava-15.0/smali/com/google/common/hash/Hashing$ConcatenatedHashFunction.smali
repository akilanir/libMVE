.class final Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;
.super Lcom/google/common/hash/AbstractCompositeHashFunction;
.source "Hashing.java"


# annotations
.annotation build Lcom/google/common/annotations/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/Hashing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatenatedHashFunction"
.end annotation


# instance fields
.field private final bits:I


# direct methods
.method varargs constructor <init>([Lcom/google/common/hash/HashFunction;)V
    .registers 8
    .param p1, "functions"    # [Lcom/google/common/hash/HashFunction;

    .prologue
    .line 391
    invoke-direct {p0, p1}, Lcom/google/common/hash/AbstractCompositeHashFunction;-><init>([Lcom/google/common/hash/HashFunction;)V

    .line 392
    const/4 v1, 0x0

    .line 393
    .local v1, "bitSum":I
    move-object v0, p1

    .local v0, "arr$":[Lcom/google/common/hash/HashFunction;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_7
    if-ge v3, v4, :cond_13

    aget-object v2, v0, v3

    .line 394
    .local v2, "function":Lcom/google/common/hash/HashFunction;
    invoke-interface {v2}, Lcom/google/common/hash/HashFunction;->bits()I

    move-result v5

    add-int/2addr v1, v5

    .line 393
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 396
    .end local v2    # "function":Lcom/google/common/hash/HashFunction;
    :cond_13
    iput v1, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    .line 397
    return-void
.end method


# virtual methods
.method public bits()I
    .registers 2

    .prologue
    .line 412
    iget v0, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 417
    instance-of v3, p1, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;

    if-eqz v3, :cond_16

    move-object v1, p1

    .line 418
    check-cast v1, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;

    .line 419
    .local v1, "other":Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;
    iget v3, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    iget v4, v1, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    if-ne v3, v4, :cond_16

    iget-object v3, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    array-length v3, v3

    iget-object v4, v1, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    array-length v4, v4

    if-eq v3, v4, :cond_17

    .line 429
    .end local v1    # "other":Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;
    :cond_16
    :goto_16
    return v2

    .line 422
    .restart local v1    # "other":Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;
    :cond_17
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    iget-object v3, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    array-length v3, v3

    if-ge v0, v3, :cond_2e

    .line 423
    iget-object v3, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    aget-object v3, v3, v0

    iget-object v4, v1, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 422
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 427
    :cond_2e
    const/4 v2, 0x1

    goto :goto_16
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 434
    iget v2, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    .line 435
    .local v2, "hash":I
    iget-object v0, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->functions:[Lcom/google/common/hash/HashFunction;

    .local v0, "arr$":[Lcom/google/common/hash/HashFunction;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_6
    if-ge v3, v4, :cond_12

    aget-object v1, v0, v3

    .line 436
    .local v1, "function":Lcom/google/common/hash/HashFunction;
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v5

    xor-int/2addr v2, v5

    .line 435
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 438
    .end local v1    # "function":Lcom/google/common/hash/HashFunction;
    :cond_12
    return v2
.end method

.method makeHash([Lcom/google/common/hash/Hasher;)Lcom/google/common/hash/HashCode;
    .registers 9
    .param p1, "hashers"    # [Lcom/google/common/hash/Hasher;

    .prologue
    .line 402
    iget v6, p0, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;->bits:I

    div-int/lit8 v6, v6, 0x8

    new-array v2, v6, [B

    .line 403
    .local v2, "bytes":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 404
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    move-object v0, p1

    .local v0, "arr$":[Lcom/google/common/hash/Hasher;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_d
    if-ge v4, v5, :cond_1f

    aget-object v3, v0, v4

    .line 405
    .local v3, "hasher":Lcom/google/common/hash/Hasher;
    invoke-interface {v3}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 404
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 407
    .end local v3    # "hasher":Lcom/google/common/hash/Hasher;
    :cond_1f
    invoke-static {v2}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    move-result-object v6

    return-object v6
.end method
