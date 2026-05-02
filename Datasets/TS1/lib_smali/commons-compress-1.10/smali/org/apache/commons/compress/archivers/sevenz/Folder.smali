.class Lorg/apache/commons/compress/archivers/sevenz/Folder;
.super Ljava/lang/Object;
.source "Folder.java"


# instance fields
.field bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

.field coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

.field crc:J

.field hasCrc:Z

.field numUnpackSubStreams:I

.field packedStreams:[J

.field totalInputStreams:J

.field totalOutputStreams:J

.field unpackSizes:[J


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method findBindPairForInStream(I)I
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 66
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 67
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    aget-object v1, v1, v0

    iget-wide v1, v1, Lorg/apache/commons/compress/archivers/sevenz/BindPair;->inIndex:J

    int-to-long v3, p1

    cmp-long v1, v1, v3

    if-nez v1, :cond_12

    .line 71
    .end local v0    # "i":I
    :goto_11
    return v0

    .line 66
    .restart local v0    # "i":I
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 71
    :cond_15
    const/4 v0, -0x1

    goto :goto_11
.end method

.method findBindPairForOutStream(I)I
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 75
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 76
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    aget-object v1, v1, v0

    iget-wide v1, v1, Lorg/apache/commons/compress/archivers/sevenz/BindPair;->outIndex:J

    int-to-long v3, p1

    cmp-long v1, v1, v3

    if-nez v1, :cond_12

    .line 80
    .end local v0    # "i":I
    :goto_11
    return v0

    .line 75
    .restart local v0    # "i":I
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 80
    :cond_15
    const/4 v0, -0x1

    goto :goto_11
.end method

.method getOrderedCoders()Ljava/lang/Iterable;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/compress/archivers/sevenz/Coder;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 55
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .local v1, "l":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/sevenz/Coder;>;"
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->packedStreams:[J

    const/4 v5, 0x0

    aget-wide v4, v4, v5

    long-to-int v0, v4

    .line 57
    .local v0, "current":I
    :goto_c
    if-eq v0, v3, :cond_25

    .line 58
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    aget-object v4, v4, v0

    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 59
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->findBindPairForOutStream(I)I

    move-result v2

    .line 60
    .local v2, "pair":I
    if-eq v2, v3, :cond_23

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    aget-object v4, v4, v2

    iget-wide v4, v4, Lorg/apache/commons/compress/archivers/sevenz/BindPair;->inIndex:J

    long-to-int v0, v4

    .line 61
    :goto_22
    goto :goto_c

    :cond_23
    move v0, v3

    .line 60
    goto :goto_22

    .line 62
    .end local v2    # "pair":I
    :cond_25
    return-object v1
.end method

.method getUnpackSize()J
    .registers 6

    .prologue
    const-wide/16 v1, 0x0

    .line 84
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    cmp-long v3, v3, v1

    if-nez v3, :cond_9

    .line 92
    :cond_8
    :goto_8
    return-wide v1

    .line 87
    :cond_9
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    long-to-int v3, v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_e
    if-ltz v0, :cond_8

    .line 88
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->findBindPairForOutStream(I)I

    move-result v3

    if-gez v3, :cond_1b

    .line 89
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->unpackSizes:[J

    aget-wide v1, v1, v0

    goto :goto_8

    .line 87
    :cond_1b
    add-int/lit8 v0, v0, -0x1

    goto :goto_e
.end method

.method getUnpackSizeForCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)J
    .registers 5
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .prologue
    .line 96
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    if-eqz v1, :cond_18

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    .line 98
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_15

    .line 99
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->unpackSizes:[J

    aget-wide v1, v1, v0

    .line 103
    .end local v0    # "i":I
    :goto_14
    return-wide v1

    .line 97
    .restart local v0    # "i":I
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 103
    .end local v0    # "i":I
    :cond_18
    const-wide/16 v1, 0x0

    goto :goto_14
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Folder with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " coders, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalInputStreams:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " input streams, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " output streams, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bind pairs, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->packedStreams:[J

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " packed streams, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->unpackSizes:[J

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " unpack sizes, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    if-eqz v0, :cond_8b

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "with CRC "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->crc:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_70
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " unpack streams"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_8b
    const-string v0, "without CRC"

    goto :goto_70
.end method
