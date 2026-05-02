.class final enum Lcom/google/common/hash/BloomFilterStrategies$1;
.super Lcom/google/common/hash/BloomFilterStrategies;
.source "BloomFilterStrategies.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/BloomFilterStrategies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/hash/BloomFilterStrategies;-><init>(Ljava/lang/String;ILcom/google/common/hash/BloomFilterStrategies$1;)V

    return-void
.end method


# virtual methods
.method public mightContain(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$BitArray;)Z
    .registers 15
    .param p3, "numHashFunctions"    # I
    .param p4, "bits"    # Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel",
            "<-TT;>;I",
            "Lcom/google/common/hash/BloomFilterStrategies$BitArray;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "object":Ljava/lang/Object;, "TT;"
    .local p2, "funnel":Lcom/google/common/hash/Funnel;, "Lcom/google/common/hash/Funnel<-TT;>;"
    invoke-virtual {p4}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitSize()J

    move-result-wide v0

    .line 67
    .local v0, "bitSize":J
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_128()Lcom/google/common/hash/HashFunction;

    move-result-object v8

    invoke-interface {v8, p1, p2}, Lcom/google/common/hash/HashFunction;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/common/hash/HashCode;->asLong()J

    move-result-wide v5

    .line 68
    .local v5, "hash64":J
    long-to-int v3, v5

    .line 69
    .local v3, "hash1":I
    const/16 v8, 0x20

    ushr-long v8, v5, v8

    long-to-int v4, v8

    .line 71
    .local v4, "hash2":I
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_17
    if-gt v7, p3, :cond_2e

    .line 72
    mul-int v8, v7, v4

    add-int v2, v3, v8

    .line 74
    .local v2, "combinedHash":I
    if-gez v2, :cond_21

    .line 75
    xor-int/lit8 v2, v2, -0x1

    .line 77
    :cond_21
    int-to-long v8, v2

    rem-long/2addr v8, v0

    invoke-virtual {p4, v8, v9}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->get(J)Z

    move-result v8

    if-nez v8, :cond_2b

    .line 78
    const/4 v8, 0x0

    .line 81
    .end local v2    # "combinedHash":I
    :goto_2a
    return v8

    .line 71
    .restart local v2    # "combinedHash":I
    :cond_2b
    add-int/lit8 v7, v7, 0x1

    goto :goto_17

    .line 81
    .end local v2    # "combinedHash":I
    :cond_2e
    const/4 v8, 0x1

    goto :goto_2a
.end method

.method public put(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$BitArray;)Z
    .registers 16
    .param p3, "numHashFunctions"    # I
    .param p4, "bits"    # Lcom/google/common/hash/BloomFilterStrategies$BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel",
            "<-TT;>;I",
            "Lcom/google/common/hash/BloomFilterStrategies$BitArray;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "object":Ljava/lang/Object;, "TT;"
    .local p2, "funnel":Lcom/google/common/hash/Funnel;, "Lcom/google/common/hash/Funnel<-TT;>;"
    invoke-virtual {p4}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitSize()J

    move-result-wide v0

    .line 48
    .local v0, "bitSize":J
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_128()Lcom/google/common/hash/HashFunction;

    move-result-object v9

    invoke-interface {v9, p1, p2}, Lcom/google/common/hash/HashFunction;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/common/hash/HashCode;->asLong()J

    move-result-wide v6

    .line 49
    .local v6, "hash64":J
    long-to-int v4, v6

    .line 50
    .local v4, "hash1":I
    const/16 v9, 0x20

    ushr-long v9, v6, v9

    long-to-int v5, v9

    .line 52
    .local v5, "hash2":I
    const/4 v2, 0x0

    .line 53
    .local v2, "bitsChanged":Z
    const/4 v8, 0x1

    .local v8, "i":I
    :goto_18
    if-gt v8, p3, :cond_2c

    .line 54
    mul-int v9, v8, v5

    add-int v3, v4, v9

    .line 56
    .local v3, "combinedHash":I
    if-gez v3, :cond_22

    .line 57
    xor-int/lit8 v3, v3, -0x1

    .line 59
    :cond_22
    int-to-long v9, v3

    rem-long/2addr v9, v0

    invoke-virtual {p4, v9, v10}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->set(J)Z

    move-result v9

    or-int/2addr v2, v9

    .line 53
    add-int/lit8 v8, v8, 0x1

    goto :goto_18

    .line 61
    .end local v3    # "combinedHash":I
    :cond_2c
    return v2
.end method
