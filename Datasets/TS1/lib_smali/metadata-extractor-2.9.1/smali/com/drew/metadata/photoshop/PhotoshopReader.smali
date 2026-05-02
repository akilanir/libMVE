.class public Lcom/drew/metadata/photoshop/PhotoshopReader;
.super Ljava/lang/Object;
.source "PhotoshopReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# static fields
.field private static final JPEG_SEGMENT_PREAMBLE:Ljava/lang/String; = "Photoshop 3.0"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;ILcom/drew/metadata/Metadata;)V
    .registers 19
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "length"    # I
    .param p3, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 75
    new-instance v6, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-direct {v6}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;-><init>()V

    .line 76
    .local v6, "directory":Lcom/drew/metadata/photoshop/PhotoshopDirectory;
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 88
    const/4 v10, 0x0

    .line 89
    .local v10, "pos":I
    :cond_b
    :goto_b
    move/from16 v0, p2

    if-ge v10, v0, :cond_3c

    .line 92
    const/4 v1, 0x4

    :try_start_10
    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 93
    .local v11, "signature":Ljava/lang/String;
    add-int/lit8 v10, v10, 0x4

    .line 96
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v13

    .line 97
    .local v13, "tagType":I
    add-int/lit8 v10, v10, 0x2

    .line 100
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v8

    .line 101
    .local v8, "descriptionLength":S
    add-int/lit8 v10, v10, 0x1

    .line 103
    if-ltz v8, :cond_2c

    add-int v1, v8, v10

    move/from16 v0, p2

    if-le v1, v0, :cond_3d

    .line 104
    :cond_2c
    new-instance v1, Lcom/drew/imaging/ImageProcessingException;

    const-string v2, "Invalid string length"

    invoke-direct {v1, v2}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_34} :catch_34

    .line 141
    .end local v8    # "descriptionLength":S
    .end local v11    # "signature":Ljava/lang/String;
    .end local v13    # "tagType":I
    :catch_34
    move-exception v9

    .line 142
    .local v9, "ex":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->addError(Ljava/lang/String;)V

    .line 146
    .end local v9    # "ex":Ljava/lang/Exception;
    :cond_3c
    return-void

    .line 106
    .restart local v8    # "descriptionLength":S
    .restart local v11    # "signature":Ljava/lang/String;
    .restart local v13    # "tagType":I
    :cond_3d
    int-to-long v1, v8

    :try_start_3e
    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 107
    add-int/2addr v10, v8

    .line 109
    rem-int/lit8 v1, v10, 0x2

    if-eqz v1, :cond_51

    .line 110
    const-wide/16 v1, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 111
    add-int/lit8 v10, v10, 0x1

    .line 115
    :cond_51
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v7

    .line 116
    .local v7, "byteCount":I
    add-int/lit8 v10, v10, 0x4

    .line 118
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v12

    .line 119
    .local v12, "tagBytes":[B
    add-int/2addr v10, v7

    .line 121
    rem-int/lit8 v1, v10, 0x2

    if-eqz v1, :cond_6b

    .line 122
    const-wide/16 v1, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 123
    add-int/lit8 v10, v10, 0x1

    .line 126
    :cond_6b
    const-string v1, "8BIM"

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 127
    const/16 v1, 0x404

    if-ne v13, v1, :cond_af

    .line 128
    new-instance v1, Lcom/drew/metadata/iptc/IptcReader;

    invoke-direct {v1}, Lcom/drew/metadata/iptc/IptcReader;-><init>()V

    new-instance v2, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v2, v12}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    array-length v3, v12

    int-to-long v4, v3

    move-object/from16 v3, p3

    invoke-virtual/range {v1 .. v6}, Lcom/drew/metadata/iptc/IptcReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;JLcom/drew/metadata/Directory;)V

    .line 138
    :goto_88
    const/16 v1, 0xfa0

    if-lt v13, v1, :cond_b

    const/16 v1, 0x1387

    if-gt v13, v1, :cond_b

    .line 139
    sget-object v1, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "Plug-in %d Data"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    add-int/lit16 v14, v13, -0xfa0

    add-int/lit8 v14, v14, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 129
    :cond_af
    const/16 v1, 0x40f

    if-ne v13, v1, :cond_c3

    .line 130
    new-instance v1, Lcom/drew/metadata/icc/IccReader;

    invoke-direct {v1}, Lcom/drew/metadata/icc/IccReader;-><init>()V

    new-instance v2, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v2, v12}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    move-object/from16 v0, p3

    invoke-virtual {v1, v2, v0, v6}, Lcom/drew/metadata/icc/IccReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    goto :goto_88

    .line 131
    :cond_c3
    const/16 v1, 0x422

    if-eq v13, v1, :cond_cb

    const/16 v1, 0x423

    if-ne v13, v1, :cond_dc

    .line 132
    :cond_cb
    new-instance v1, Lcom/drew/metadata/exif/ExifReader;

    invoke-direct {v1}, Lcom/drew/metadata/exif/ExifReader;-><init>()V

    new-instance v2, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v2, v12}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    const/4 v3, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v1, v2, v0, v3, v6}, Lcom/drew/metadata/exif/ExifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;ILcom/drew/metadata/Directory;)V

    goto :goto_88

    .line 133
    :cond_dc
    const/16 v1, 0x424

    if-ne v13, v1, :cond_eb

    .line 134
    new-instance v1, Lcom/drew/metadata/xmp/XmpReader;

    invoke-direct {v1}, Lcom/drew/metadata/xmp/XmpReader;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v1, v12, v0, v6}, Lcom/drew/metadata/xmp/XmpReader;->extract([BLcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    goto :goto_88

    .line 136
    :cond_eb
    invoke-virtual {v6, v13, v12}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->setByteArray(I[B)V
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_ee} :catch_34

    goto :goto_88
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 2
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
    .line 54
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPD:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 10
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
    .line 59
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    const-string v3, "Photoshop 3.0"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 61
    .local v1, "preambleLength":I
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 63
    .local v2, "segmentBytes":[B
    array-length v3, v2

    add-int/lit8 v4, v1, 0x1

    if-lt v3, v4, :cond_a

    const-string v3, "Photoshop 3.0"

    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 66
    new-instance v3, Lcom/drew/lang/SequentialByteArrayReader;

    add-int/lit8 v4, v1, 0x1

    invoke-direct {v3, v2, v4}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([BI)V

    array-length v4, v2

    sub-int/2addr v4, v1

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v3, v4, p2}, Lcom/drew/metadata/photoshop/PhotoshopReader;->extract(Lcom/drew/lang/SequentialReader;ILcom/drew/metadata/Metadata;)V

    goto :goto_a

    .line 71
    .end local v2    # "segmentBytes":[B
    :cond_38
    return-void
.end method
