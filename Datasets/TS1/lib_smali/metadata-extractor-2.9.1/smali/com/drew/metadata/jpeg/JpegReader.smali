.class public Lcom/drew/metadata/jpeg/JpegReader;
.super Ljava/lang/Object;
.source "JpegReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract([BLcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 16
    .param p1, "segmentBytes"    # [B
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
    .param p3, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;

    .prologue
    .line 74
    new-instance v3, Lcom/drew/metadata/jpeg/JpegDirectory;

    invoke-direct {v3}, Lcom/drew/metadata/jpeg/JpegDirectory;-><init>()V

    .line 75
    .local v3, "directory":Lcom/drew/metadata/jpeg/JpegDirectory;
    invoke-virtual {p2, v3}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 78
    const/4 v9, -0x3

    iget-byte v10, p3, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    sget-object v11, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    iget-byte v11, v11, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    sub-int/2addr v10, v11

    invoke-virtual {v3, v9, v10}, Lcom/drew/metadata/jpeg/JpegDirectory;->setInt(II)V

    .line 80
    new-instance v7, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v7, p1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 83
    .local v7, "reader":Lcom/drew/lang/SequentialReader;
    const/4 v9, 0x0

    :try_start_19
    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v10

    invoke-virtual {v3, v9, v10}, Lcom/drew/metadata/jpeg/JpegDirectory;->setInt(II)V

    .line 84
    const/4 v9, 0x1

    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v10

    invoke-virtual {v3, v9, v10}, Lcom/drew/metadata/jpeg/JpegDirectory;->setInt(II)V

    .line 85
    const/4 v9, 0x3

    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v10

    invoke-virtual {v3, v9, v10}, Lcom/drew/metadata/jpeg/JpegDirectory;->setInt(II)V

    .line 86
    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v1

    .line 87
    .local v1, "componentCount":S
    const/4 v9, 0x5

    invoke-virtual {v3, v9, v1}, Lcom/drew/metadata/jpeg/JpegDirectory;->setInt(II)V

    .line 93
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_39
    if-ge v5, v1, :cond_5c

    .line 94
    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v2

    .line 95
    .local v2, "componentId":I
    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v8

    .line 96
    .local v8, "samplingFactorByte":I
    invoke-virtual {v7}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v6

    .line 97
    .local v6, "quantizationTableNumber":I
    new-instance v0, Lcom/drew/metadata/jpeg/JpegComponent;

    invoke-direct {v0, v2, v8, v6}, Lcom/drew/metadata/jpeg/JpegComponent;-><init>(III)V

    .line 98
    .local v0, "component":Lcom/drew/metadata/jpeg/JpegComponent;
    add-int/lit8 v9, v5, 0x6

    invoke-virtual {v3, v9, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->setObject(ILjava/lang/Object;)V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_51} :catch_54

    .line 93
    add-int/lit8 v5, v5, 0x1

    goto :goto_39

    .line 100
    .end local v0    # "component":Lcom/drew/metadata/jpeg/JpegComponent;
    .end local v1    # "componentCount":S
    .end local v2    # "componentId":I
    .end local v5    # "i":I
    .end local v6    # "quantizationTableNumber":I
    .end local v8    # "samplingFactorByte":I
    :catch_54
    move-exception v4

    .line 101
    .local v4, "ex":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Lcom/drew/metadata/jpeg/JpegDirectory;->addError(Ljava/lang/String;)V

    .line 103
    .end local v4    # "ex":Ljava/io/IOException;
    :cond_5c
    return-void
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

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
    .line 45
    const/16 v0, 0xe

    new-array v0, v0, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    const/4 v1, 0x0

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF3:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF5:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF6:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF7:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF8:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF9:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF10:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF11:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF13:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF14:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF15:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 7
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<[B>;",
            "Lcom/drew/metadata/Metadata;",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 68
    .local v1, "segmentBytes":[B
    invoke-virtual {p0, v1, p2, p3}, Lcom/drew/metadata/jpeg/JpegReader;->extract([BLcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V

    goto :goto_4

    .line 70
    .end local v1    # "segmentBytes":[B
    :cond_14
    return-void
.end method
