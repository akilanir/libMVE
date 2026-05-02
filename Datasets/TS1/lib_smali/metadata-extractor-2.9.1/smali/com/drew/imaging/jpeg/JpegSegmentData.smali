.class public Lcom/drew/imaging/jpeg/JpegSegmentData;
.super Ljava/lang/Object;
.source "JpegSegmentData.java"


# instance fields
.field private final _segmentDataMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Byte;",
            "Ljava/util/List",
            "<[B>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    return-void
.end method

.method private getOrCreateSegmentList(B)Ljava/util/List;
    .registers 5
    .param p1, "segmentType"    # B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 170
    iget-object v1, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 171
    iget-object v1, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 176
    .local v0, "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_18
    return-object v0

    .line 173
    .end local v0    # "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 174
    .restart local v0    # "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v1, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18
.end method

.method private getSegmentList(B)Ljava/util/List;
    .registers 4
    .param p1, "segmentType"    # B
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 163
    iget-object v0, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public addSegment(B[B)V
    .registers 4
    .param p1, "segmentType"    # B
    .param p2, "segmentBytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getOrCreateSegmentList(B)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    return-void
.end method

.method public containsSegment(B)Z
    .registers 4
    .param p1, "segmentType"    # B

    .prologue
    .line 268
    iget-object v0, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsSegment(Lcom/drew/imaging/jpeg/JpegSegmentType;)Z
    .registers 3
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 257
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0}, Lcom/drew/imaging/jpeg/JpegSegmentData;->containsSegment(B)Z

    move-result v0

    return v0
.end method

.method public getSegment(B)[B
    .registers 3
    .param p1, "segmentType"    # B
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegment(BI)[B

    move-result-object v0

    return-object v0
.end method

.method public getSegment(BI)[B
    .registers 5
    .param p1, "segmentType"    # B
    .param p2, "occurrence"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegmentList(B)Ljava/util/List;

    move-result-object v0

    .line 130
    .local v0, "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-eqz v0, :cond_13

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, p2, :cond_13

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getSegment(Lcom/drew/imaging/jpeg/JpegSegmentType;)[B
    .registers 4
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 100
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegment(BI)[B

    move-result-object v0

    return-object v0
.end method

.method public getSegment(Lcom/drew/imaging/jpeg/JpegSegmentType;I)[B
    .registers 4
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "occurrence"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 114
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0, p2}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegment(BI)[B

    move-result-object v0

    return-object v0
.end method

.method public getSegmentCount(B)I
    .registers 4
    .param p1, "segmentType"    # B

    .prologue
    .line 198
    invoke-direct {p0, p1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegmentList(B)Ljava/util/List;

    move-result-object v0

    .line 199
    .local v0, "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return v1

    :cond_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_7
.end method

.method public getSegmentCount(Lcom/drew/imaging/jpeg/JpegSegmentType;)I
    .registers 3
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 187
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegmentCount(B)I

    move-result v0

    return v0
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 67
    .local v3, "segmentTypes":Ljava/util/Set;, "Ljava/util/Set<Lcom/drew/imaging/jpeg/JpegSegmentType;>;"
    iget-object v4, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Byte;

    .line 69
    .local v2, "segmentTypeByte":Ljava/lang/Byte;
    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v4

    invoke-static {v4}, Lcom/drew/imaging/jpeg/JpegSegmentType;->fromByte(B)Lcom/drew/imaging/jpeg/JpegSegmentType;

    move-result-object v1

    .line 70
    .local v1, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    if-nez v1, :cond_46

    .line 71
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Should not have a segmentTypeByte that is not in the enum: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 73
    :cond_46
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 76
    .end local v1    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    .end local v2    # "segmentTypeByte":Ljava/lang/Byte;
    :cond_4a
    return-object v3
.end method

.method public getSegments(B)Ljava/lang/Iterable;
    .registers 3
    .param p1, "segmentType"    # B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)",
            "Ljava/lang/Iterable",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 156
    invoke-direct {p0, p1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegmentList(B)Ljava/util/List;

    move-result-object v0

    .line 157
    .local v0, "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_b
    return-object v0
.end method

.method public getSegments(Lcom/drew/imaging/jpeg/JpegSegmentType;)Ljava/lang/Iterable;
    .registers 3
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ")",
            "Ljava/lang/Iterable",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 144
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegments(B)Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public removeSegment(B)V
    .registers 4
    .param p1, "segmentType"    # B

    .prologue
    .line 246
    iget-object v0, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    return-void
.end method

.method public removeSegment(Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 3
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 236
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0}, Lcom/drew/imaging/jpeg/JpegSegmentData;->removeSegment(B)V

    .line 237
    return-void
.end method

.method public removeSegmentOccurrence(BI)V
    .registers 6
    .param p1, "segmentType"    # B
    .param p2, "occurrence"    # I

    .prologue
    .line 225
    iget-object v1, p0, Lcom/drew/imaging/jpeg/JpegSegmentData;->_segmentDataMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 226
    .local v0, "segmentList":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {v0, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 227
    return-void
.end method

.method public removeSegmentOccurrence(Lcom/drew/imaging/jpeg/JpegSegmentType;I)V
    .registers 4
    .param p1, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "occurrence"    # I

    .prologue
    .line 212
    iget-byte v0, p1, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    invoke-virtual {p0, v0, p2}, Lcom/drew/imaging/jpeg/JpegSegmentData;->removeSegmentOccurrence(BI)V

    .line 213
    return-void
.end method
