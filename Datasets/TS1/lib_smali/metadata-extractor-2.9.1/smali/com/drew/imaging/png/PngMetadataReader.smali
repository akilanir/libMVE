.class public Lcom/drew/imaging/png/PngMetadataReader;
.super Ljava/lang/Object;
.source "PngMetadataReader.java"


# static fields
.field private static _desiredChunkTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/drew/imaging/png/PngChunkType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 45
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 47
    .local v0, "desiredChunkTypes":Ljava/util/Set;, "Ljava/util/Set<Lcom/drew/imaging/png/PngChunkType;>;"
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->IHDR:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 48
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->PLTE:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 49
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->tRNS:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->cHRM:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->sRGB:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->gAMA:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->iCCP:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 54
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->bKGD:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 55
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->tEXt:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 57
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->tIME:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 58
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->pHYs:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 59
    sget-object v1, Lcom/drew/imaging/png/PngChunkType;->sBIT:Lcom/drew/imaging/png/PngChunkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 61
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    sput-object v1, Lcom/drew/imaging/png/PngMetadataReader;->_desiredChunkTypes:Ljava/util/Set;

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static processChunk(Lcom/drew/metadata/Metadata;Lcom/drew/imaging/png/PngChunk;)V
    .registers 40
    .param p0, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "chunk"    # Lcom/drew/imaging/png/PngChunk;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/png/PngProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual/range {p1 .. p1}, Lcom/drew/imaging/png/PngChunk;->getType()Lcom/drew/imaging/png/PngChunkType;

    move-result-object v6

    .line 99
    .local v6, "chunkType":Lcom/drew/imaging/png/PngChunkType;
    invoke-virtual/range {p1 .. p1}, Lcom/drew/imaging/png/PngChunk;->getBytes()[B

    move-result-object v3

    .line 101
    .local v3, "bytes":[B
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->IHDR:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_85

    .line 102
    new-instance v14, Lcom/drew/imaging/png/PngHeader;

    invoke-direct {v14, v3}, Lcom/drew/imaging/png/PngHeader;-><init>([B)V

    .line 103
    .local v14, "header":Lcom/drew/imaging/png/PngHeader;
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->IHDR:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 104
    .local v12, "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0x1

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getImageWidth()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 105
    const/16 v33, 0x2

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getImageHeight()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 106
    const/16 v33, 0x3

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getBitsPerSample()B

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 107
    const/16 v33, 0x4

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getColorType()Lcom/drew/imaging/png/PngColorType;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lcom/drew/imaging/png/PngColorType;->getNumericValue()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 108
    const/16 v33, 0x5

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getCompressionType()B

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 109
    const/16 v33, 0x6

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getFilterMethod()B

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 110
    const/16 v33, 0x7

    invoke-virtual {v14}, Lcom/drew/imaging/png/PngHeader;->getInterlaceMethod()B

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 111
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 245
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v14    # "header":Lcom/drew/imaging/png/PngHeader;
    :cond_84
    :goto_84
    return-void

    .line 112
    :cond_85
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->PLTE:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_ac

    .line 113
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->PLTE:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 114
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0x8

    array-length v0, v3

    move/from16 v34, v0

    div-int/lit8 v34, v34, 0x3

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 115
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto :goto_84

    .line 116
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    :cond_ac
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->tRNS:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_d0

    .line 117
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->tRNS:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 118
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0x9

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 119
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto :goto_84

    .line 120
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    :cond_d0
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->sRGB:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_f6

    .line 121
    const/16 v33, 0x0

    aget-byte v26, v3, v33

    .line 122
    .local v26, "srgbRenderingIntent":I
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->sRGB:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 123
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xa

    move/from16 v0, v33

    move/from16 v1, v26

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 124
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto :goto_84

    .line 125
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v26    # "srgbRenderingIntent":I
    :cond_f6
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->cHRM:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_179

    .line 126
    new-instance v5, Lcom/drew/imaging/png/PngChromaticities;

    invoke-direct {v5, v3}, Lcom/drew/imaging/png/PngChromaticities;-><init>([B)V

    .line 127
    .local v5, "chromaticities":Lcom/drew/imaging/png/PngChromaticities;
    new-instance v12, Lcom/drew/metadata/png/PngChromaticitiesDirectory;

    invoke-direct {v12}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;-><init>()V

    .line 128
    .local v12, "directory":Lcom/drew/metadata/png/PngChromaticitiesDirectory;
    const/16 v33, 0x1

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getWhitePointX()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 129
    const/16 v33, 0x2

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getWhitePointY()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 130
    const/16 v33, 0x3

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getRedX()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 131
    const/16 v33, 0x4

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getRedY()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 132
    const/16 v33, 0x5

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getGreenX()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 133
    const/16 v33, 0x6

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getGreenY()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 134
    const/16 v33, 0x7

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getBlueX()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 135
    const/16 v33, 0x8

    invoke-virtual {v5}, Lcom/drew/imaging/png/PngChromaticities;->getBlueY()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngChromaticitiesDirectory;->setInt(II)V

    .line 136
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 137
    .end local v5    # "chromaticities":Lcom/drew/imaging/png/PngChromaticities;
    .end local v12    # "directory":Lcom/drew/metadata/png/PngChromaticitiesDirectory;
    :cond_179
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->gAMA:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1b4

    .line 138
    invoke-static {v3}, Lcom/drew/lang/ByteConvert;->toInt32BigEndian([B)I

    move-result v13

    .line 139
    .local v13, "gammaInt":I
    new-instance v33, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v33

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    invoke-virtual/range {v33 .. v33}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    .line 140
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->gAMA:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 141
    .local v12, "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xb

    int-to-double v0, v13

    move-wide/from16 v34, v0

    const-wide v36, 0x40f86a0000000000L    # 100000.0

    div-double v34, v34, v36

    move/from16 v0, v33

    move-wide/from16 v1, v34

    invoke-virtual {v12, v0, v1, v2}, Lcom/drew/metadata/png/PngDirectory;->setDouble(ID)V

    .line 142
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 143
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v13    # "gammaInt":I
    :cond_1b4
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iCCP:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_231

    .line 144
    new-instance v24, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 145
    .local v24, "reader":Lcom/drew/lang/SequentialReader;
    const/16 v33, 0x4f

    move-object/from16 v0, v24

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v23

    .line 146
    .local v23, "profileName":Ljava/lang/String;
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iCCP:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 147
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xc

    move/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setString(ILjava/lang/String;)V

    .line 148
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v9

    .line 149
    .local v9, "compressionMethod":B
    if-nez v9, :cond_229

    .line 152
    array-length v0, v3

    move/from16 v33, v0

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v34

    sub-int v33, v33, v34

    add-int/lit8 v4, v33, -0x2

    .line 153
    .local v4, "bytesLeft":I
    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v7

    .line 154
    .local v7, "compressedProfile":[B
    new-instance v16, Ljava/util/zip/InflaterInputStream;

    new-instance v33, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, v33

    invoke-direct {v0, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 155
    .local v16, "inflateStream":Ljava/util/zip/InflaterInputStream;
    new-instance v33, Lcom/drew/metadata/icc/IccReader;

    invoke-direct/range {v33 .. v33}, Lcom/drew/metadata/icc/IccReader;-><init>()V

    new-instance v34, Lcom/drew/lang/RandomAccessStreamReader;

    move-object/from16 v0, v34

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/drew/lang/RandomAccessStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2, v12}, Lcom/drew/metadata/icc/IccReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    .line 156
    invoke-virtual/range {v16 .. v16}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 160
    .end local v4    # "bytesLeft":I
    .end local v7    # "compressedProfile":[B
    .end local v16    # "inflateStream":Ljava/util/zip/InflaterInputStream;
    :goto_222
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 158
    :cond_229
    const-string v33, "Invalid compression method value"

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Lcom/drew/metadata/png/PngDirectory;->addError(Ljava/lang/String;)V

    goto :goto_222

    .line 161
    .end local v9    # "compressionMethod":B
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v23    # "profileName":Ljava/lang/String;
    .end local v24    # "reader":Lcom/drew/lang/SequentialReader;
    :cond_231
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->bKGD:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_252

    .line 162
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->bKGD:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 163
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xf

    move/from16 v0, v33

    invoke-virtual {v12, v0, v3}, Lcom/drew/metadata/png/PngDirectory;->setByteArray(I[B)V

    .line 164
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 165
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    :cond_252
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->tEXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2ae

    .line 166
    new-instance v24, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 167
    .restart local v24    # "reader":Lcom/drew/lang/SequentialReader;
    const/16 v33, 0x4f

    move-object/from16 v0, v24

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v17

    .line 168
    .local v17, "keyword":Ljava/lang/String;
    array-length v0, v3

    move/from16 v33, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v34

    sub-int v33, v33, v34

    add-int/lit8 v4, v33, -0x1

    .line 169
    .restart local v4    # "bytesLeft":I
    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v31

    .line 170
    .local v31, "value":Ljava/lang/String;
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .local v28, "textPairs":Ljava/util/List;, "Ljava/util/List<Lcom/drew/lang/KeyValuePair;>;"
    new-instance v33, Lcom/drew/lang/KeyValuePair;

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lcom/drew/lang/KeyValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 173
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xd

    move/from16 v0, v33

    move-object/from16 v1, v28

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setObject(ILjava/lang/Object;)V

    .line 174
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 175
    .end local v4    # "bytesLeft":I
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v17    # "keyword":Ljava/lang/String;
    .end local v24    # "reader":Lcom/drew/lang/SequentialReader;
    .end local v28    # "textPairs":Ljava/util/List;, "Ljava/util/List<Lcom/drew/lang/KeyValuePair;>;"
    .end local v31    # "value":Ljava/lang/String;
    :cond_2ae
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_3aa

    .line 176
    new-instance v24, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 177
    .restart local v24    # "reader":Lcom/drew/lang/SequentialReader;
    const/16 v33, 0x4f

    move-object/from16 v0, v24

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v17

    .line 178
    .restart local v17    # "keyword":Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v8

    .line 179
    .local v8, "compressionFlag":B
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v9

    .line 180
    .restart local v9    # "compressionMethod":B
    array-length v0, v3

    move/from16 v33, v0

    move-object/from16 v0, v24

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v18

    .line 181
    .local v18, "languageTag":Ljava/lang/String;
    array-length v0, v3

    move/from16 v33, v0

    move-object/from16 v0, v24

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v29

    .line 182
    .local v29, "translatedKeyword":Ljava/lang/String;
    array-length v0, v3

    move/from16 v33, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v34

    sub-int v33, v33, v34

    add-int/lit8 v33, v33, -0x1

    add-int/lit8 v33, v33, -0x1

    add-int/lit8 v33, v33, -0x1

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v34

    sub-int v33, v33, v34

    add-int/lit8 v33, v33, -0x1

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v34

    sub-int v33, v33, v34

    add-int/lit8 v4, v33, -0x1

    .line 183
    .restart local v4    # "bytesLeft":I
    const/16 v27, 0x0

    .line 184
    .local v27, "text":Ljava/lang/String;
    if-nez v8, :cond_32e

    .line 185
    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/drew/lang/SequentialReader;->getNullTerminatedString(I)Ljava/lang/String;

    move-result-object v27

    .line 200
    :goto_310
    if-eqz v27, :cond_84

    .line 201
    const-string v33, "XML:com.adobe.xmp"

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_37a

    .line 203
    new-instance v33, Lcom/drew/metadata/xmp/XmpReader;

    invoke-direct/range {v33 .. v33}, Lcom/drew/metadata/xmp/XmpReader;-><init>()V

    move-object/from16 v0, v33

    move-object/from16 v1, v27

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lcom/drew/metadata/xmp/XmpReader;->extract(Ljava/lang/String;Lcom/drew/metadata/Metadata;)V

    goto/16 :goto_84

    .line 186
    :cond_32e
    const/16 v33, 0x1

    move/from16 v0, v33

    if-ne v8, v0, :cond_364

    .line 187
    if-nez v9, :cond_34e

    .line 188
    new-instance v33, Ljava/util/zip/InflaterInputStream;

    new-instance v34, Ljava/io/ByteArrayInputStream;

    array-length v0, v3

    move/from16 v35, v0

    sub-int v35, v35, v4

    move-object/from16 v0, v34

    move/from16 v1, v35

    invoke-direct {v0, v3, v1, v4}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct/range {v33 .. v34}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static/range {v33 .. v33}, Lcom/drew/lang/StringUtil;->fromStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v27

    goto :goto_310

    .line 190
    :cond_34e
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 191
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const-string v33, "Invalid compression method value"

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Lcom/drew/metadata/png/PngDirectory;->addError(Ljava/lang/String;)V

    .line 192
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto :goto_310

    .line 195
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    :cond_364
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 196
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const-string v33, "Invalid compression flag value"

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Lcom/drew/metadata/png/PngDirectory;->addError(Ljava/lang/String;)V

    .line 197
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto :goto_310

    .line 205
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    :cond_37a
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .restart local v28    # "textPairs":Ljava/util/List;, "Ljava/util/List<Lcom/drew/lang/KeyValuePair;>;"
    new-instance v33, Lcom/drew/lang/KeyValuePair;

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/drew/lang/KeyValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 208
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0xd

    move/from16 v0, v33

    move-object/from16 v1, v28

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setObject(ILjava/lang/Object;)V

    .line 209
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 212
    .end local v4    # "bytesLeft":I
    .end local v8    # "compressionFlag":B
    .end local v9    # "compressionMethod":B
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v17    # "keyword":Ljava/lang/String;
    .end local v18    # "languageTag":Ljava/lang/String;
    .end local v24    # "reader":Lcom/drew/lang/SequentialReader;
    .end local v27    # "text":Ljava/lang/String;
    .end local v28    # "textPairs":Ljava/util/List;, "Ljava/util/List<Lcom/drew/lang/KeyValuePair;>;"
    .end local v29    # "translatedKeyword":Ljava/lang/String;
    :cond_3aa
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->tIME:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_482

    .line 213
    new-instance v24, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 214
    .local v24, "reader":Lcom/drew/lang/SequentialByteArrayReader;
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt16()I

    move-result v32

    .line 215
    .local v32, "year":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt8()S

    move-result v20

    .line 216
    .local v20, "month":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt8()S

    move-result v11

    .line 217
    .local v11, "day":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt8()S

    move-result v15

    .line 218
    .local v15, "hour":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt8()S

    move-result v19

    .line 219
    .local v19, "minute":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getUInt8()S

    move-result v25

    .line 220
    .local v25, "second":I
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->tIME:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 221
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    add-int/lit8 v33, v20, -0x1

    move/from16 v0, v32

    move/from16 v1, v33

    invoke-static {v0, v1, v11}, Lcom/drew/lang/DateUtil;->isValidDate(III)Z

    move-result v33

    if-eqz v33, :cond_43e

    move/from16 v0, v19

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/drew/lang/DateUtil;->isValidTime(III)Z

    move-result v33

    if-eqz v33, :cond_43e

    .line 222
    const-string v33, "%04d:%02d:%02d %02d:%02d:%02d"

    const/16 v34, 0x6

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x4

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    invoke-static/range {v33 .. v34}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 223
    .local v10, "dateString":Ljava/lang/String;
    const/16 v33, 0xe

    move/from16 v0, v33

    invoke-virtual {v12, v0, v10}, Lcom/drew/metadata/png/PngDirectory;->setString(ILjava/lang/String;)V

    .line 229
    .end local v10    # "dateString":Ljava/lang/String;
    :goto_437
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 225
    :cond_43e
    const-string v33, "PNG tIME data describes an invalid date/time: year=%d month=%d day=%d hour=%d minute=%d second=%d"

    const/16 v34, 0x6

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x4

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    invoke-static/range {v33 .. v34}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Lcom/drew/metadata/png/PngDirectory;->addError(Ljava/lang/String;)V

    goto :goto_437

    .line 230
    .end local v11    # "day":I
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v15    # "hour":I
    .end local v19    # "minute":I
    .end local v20    # "month":I
    .end local v24    # "reader":Lcom/drew/lang/SequentialByteArrayReader;
    .end local v25    # "second":I
    .end local v32    # "year":I
    :cond_482
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->pHYs:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_4ca

    .line 231
    new-instance v24, Lcom/drew/lang/SequentialByteArrayReader;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 232
    .restart local v24    # "reader":Lcom/drew/lang/SequentialByteArrayReader;
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v21

    .line 233
    .local v21, "pixelsPerUnitX":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v22

    .line 234
    .local v22, "pixelsPerUnitY":I
    invoke-virtual/range {v24 .. v24}, Lcom/drew/lang/SequentialByteArrayReader;->getInt8()B

    move-result v30

    .line 235
    .local v30, "unitSpecifier":B
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->pHYs:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 236
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0x10

    move/from16 v0, v33

    move/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 237
    const/16 v33, 0x11

    move/from16 v0, v33

    move/from16 v1, v22

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 238
    const/16 v33, 0x12

    move/from16 v0, v33

    move/from16 v1, v30

    invoke-virtual {v12, v0, v1}, Lcom/drew/metadata/png/PngDirectory;->setInt(II)V

    .line 239
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84

    .line 240
    .end local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    .end local v21    # "pixelsPerUnitX":I
    .end local v22    # "pixelsPerUnitY":I
    .end local v24    # "reader":Lcom/drew/lang/SequentialByteArrayReader;
    .end local v30    # "unitSpecifier":B
    :cond_4ca
    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->sBIT:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-virtual {v6, v0}, Lcom/drew/imaging/png/PngChunkType;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_84

    .line 241
    new-instance v12, Lcom/drew/metadata/png/PngDirectory;

    sget-object v33, Lcom/drew/imaging/png/PngChunkType;->sBIT:Lcom/drew/imaging/png/PngChunkType;

    move-object/from16 v0, v33

    invoke-direct {v12, v0}, Lcom/drew/metadata/png/PngDirectory;-><init>(Lcom/drew/imaging/png/PngChunkType;)V

    .line 242
    .restart local v12    # "directory":Lcom/drew/metadata/png/PngDirectory;
    const/16 v33, 0x13

    move/from16 v0, v33

    invoke-virtual {v12, v0, v3}, Lcom/drew/metadata/png/PngDirectory;->setByteArray(I[B)V

    .line 243
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    goto/16 :goto_84
.end method

.method public static readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/png/PngProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 70
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_5
    invoke-static {v0}, Lcom/drew/imaging/png/PngMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_15

    move-result-object v1

    .line 72
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 74
    new-instance v2, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v2}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v2, p0, v1}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 75
    return-object v1

    .line 72
    .end local v1    # "metadata":Lcom/drew/metadata/Metadata;
    :catchall_15
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 9
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/png/PngProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v5, Lcom/drew/imaging/png/PngChunkReader;

    invoke-direct {v5}, Lcom/drew/imaging/png/PngChunkReader;-><init>()V

    new-instance v6, Lcom/drew/lang/StreamReader;

    invoke-direct {v6, p0}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    sget-object v7, Lcom/drew/imaging/png/PngMetadataReader;->_desiredChunkTypes:Ljava/util/Set;

    invoke-virtual {v5, v6, v7}, Lcom/drew/imaging/png/PngChunkReader;->extract(Lcom/drew/lang/SequentialReader;Ljava/util/Set;)Ljava/lang/Iterable;

    move-result-object v1

    .line 83
    .local v1, "chunks":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/drew/imaging/png/PngChunk;>;"
    new-instance v4, Lcom/drew/metadata/Metadata;

    invoke-direct {v4}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 85
    .local v4, "metadata":Lcom/drew/metadata/Metadata;
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/imaging/png/PngChunk;

    .line 87
    .local v0, "chunk":Lcom/drew/imaging/png/PngChunk;
    :try_start_25
    invoke-static {v4, v0}, Lcom/drew/imaging/png/PngMetadataReader;->processChunk(Lcom/drew/metadata/Metadata;Lcom/drew/imaging/png/PngChunk;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_29

    goto :goto_19

    .line 88
    :catch_29
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v5}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_19

    .line 93
    .end local v0    # "chunk":Lcom/drew/imaging/png/PngChunk;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_30
    return-object v4
.end method
