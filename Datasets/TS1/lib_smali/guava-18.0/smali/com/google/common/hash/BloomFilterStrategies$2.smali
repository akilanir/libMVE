.class final enum Lcom/google/common/hash/BloomFilterStrategies$2;
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
    .line 90
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/hash/BloomFilterStrategies;-><init>(Ljava/lang/String;ILcom/google/common/hash/BloomFilterStrategies$1;)V

    return-void
.end method

.method private lowerEight([B)J
    .registers 10
    .param p1, "bytes"    # [B

    .prologue
    .line 129
    const/4 v0, 0x7

    aget-byte v0, p1, v0

    const/4 v1, 0x6

    aget-byte v1, p1, v1

    const/4 v2, 0x5

    aget-byte v2, p1, v2

    const/4 v3, 0x4

    aget-byte v3, p1, v3

    const/4 v4, 0x3

    aget-byte v4, p1, v4

    const/4 v5, 0x2

    aget-byte v5, p1, v5

    const/4 v6, 0x1

    aget-byte v6, p1, v6

    const/4 v7, 0x0

    aget-byte v7, p1, v7

    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->fromBytes(BBBBBBBB)J

    move-result-wide v0

    return-wide v0
.end method

.method private upperEight([B)J
    .registers 10
    .param p1, "bytes"    # [B

    .prologue
    .line 134
    const/16 v0, 0xf

    aget-byte v0, p1, v0

    const/16 v1, 0xe

    aget-byte v1, p1, v1

    const/16 v2, 0xd

    aget-byte v2, p1, v2

    const/16 v3, 0xc

    aget-byte v3, p1, v3

    const/16 v4, 0xb

    aget-byte v4, p1, v4

    const/16 v5, 0xa

    aget-byte v5, p1, v5

    const/16 v6, 0x9

    aget-byte v6, p1, v6

    const/16 v7, 0x8

    aget-byte v7, p1, v7

    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->fromBytes(BBBBBBBB)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public mightContain(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$BitArray;)Z
    .registers 18
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
    .line 112
    .local p1, "object":Ljava/lang/Object;, "TT;"
    .local p2, "funnel":Lcom/google/common/hash/Funnel;, "Lcom/google/common/hash/Funnel<-TT;>;"
    invoke-virtual/range {p4 .. p4}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitSize()J

    move-result-wide v1

    .line 113
    .local v1, "bitSize":J
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_128()Lcom/google/common/hash/HashFunction;

    move-result-object v11

    invoke-interface {v11, p1, p2}, Lcom/google/common/hash/HashFunction;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/common/hash/HashCode;->getBytesInternal()[B

    move-result-object v3

    .line 114
    .local v3, "bytes":[B
    invoke-direct {p0, v3}, Lcom/google/common/hash/BloomFilterStrategies$2;->lowerEight([B)J

    move-result-wide v6

    .line 115
    .local v6, "hash1":J
    invoke-direct {p0, v3}, Lcom/google/common/hash/BloomFilterStrategies$2;->upperEight([B)J

    move-result-wide v8

    .line 117
    .local v8, "hash2":J
    move-wide v4, v6

    .line 118
    .local v4, "combinedHash":J
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1a
    move/from16 v0, p3

    if-ge v10, v0, :cond_33

    .line 120
    const-wide v11, 0x7fffffffffffffffL

    and-long/2addr v11, v4

    rem-long/2addr v11, v1

    move-object/from16 v0, p4

    invoke-virtual {v0, v11, v12}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->get(J)Z

    move-result v11

    if-nez v11, :cond_2f

    .line 121
    const/4 v11, 0x0

    .line 125
    :goto_2e
    return v11

    .line 123
    :cond_2f
    add-long/2addr v4, v8

    .line 118
    add-int/lit8 v10, v10, 0x1

    goto :goto_1a

    .line 125
    :cond_33
    const/4 v11, 0x1

    goto :goto_2e
.end method

.method public put(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$BitArray;)Z
    .registers 19
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
    .line 94
    .local p1, "object":Ljava/lang/Object;, "TT;"
    .local p2, "funnel":Lcom/google/common/hash/Funnel;, "Lcom/google/common/hash/Funnel<-TT;>;"
    invoke-virtual/range {p4 .. p4}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->bitSize()J

    move-result-wide v1

    .line 95
    .local v1, "bitSize":J
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_128()Lcom/google/common/hash/HashFunction;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-interface {v12, p1, v0}, Lcom/google/common/hash/HashFunction;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/common/hash/HashCode;->getBytesInternal()[B

    move-result-object v4

    .line 96
    .local v4, "bytes":[B
    invoke-direct {p0, v4}, Lcom/google/common/hash/BloomFilterStrategies$2;->lowerEight([B)J

    move-result-wide v7

    .line 97
    .local v7, "hash1":J
    invoke-direct {p0, v4}, Lcom/google/common/hash/BloomFilterStrategies$2;->upperEight([B)J

    move-result-wide v9

    .line 99
    .local v9, "hash2":J
    const/4 v3, 0x0

    .line 100
    .local v3, "bitsChanged":Z
    move-wide v5, v7

    .line 101
    .local v5, "combinedHash":J
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1d
    move/from16 v0, p3

    if-ge v11, v0, :cond_33

    .line 103
    const-wide v12, 0x7fffffffffffffffL

    and-long/2addr v12, v5

    rem-long/2addr v12, v1

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v13}, Lcom/google/common/hash/BloomFilterStrategies$BitArray;->set(J)Z

    move-result v12

    or-int/2addr v3, v12

    .line 104
    add-long/2addr v5, v9

    .line 101
    add-int/lit8 v11, v11, 0x1

    goto :goto_1d

    .line 106
    :cond_33
    return v3
.end method
