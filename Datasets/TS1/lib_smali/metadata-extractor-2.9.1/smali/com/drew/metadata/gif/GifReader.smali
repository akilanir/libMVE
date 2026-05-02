.class public Lcom/drew/metadata/gif/GifReader;
.super Ljava/lang/Object;
.source "GifReader.java"


# static fields
.field private static final GIF_87A_VERSION_IDENTIFIER:Ljava/lang/String; = "87a"

.field private static final GIF_89A_VERSION_IDENTIFIER:Ljava/lang/String; = "89a"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    .registers 19
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 39
    new-instance v4, Lcom/drew/metadata/gif/GifHeaderDirectory;

    invoke-direct {v4}, Lcom/drew/metadata/gif/GifHeaderDirectory;-><init>()V

    .line 40
    .local v4, "directory":Lcom/drew/metadata/gif/GifHeaderDirectory;
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 59
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/drew/lang/SequentialReader;->setMotorolaByteOrder(Z)V

    .line 62
    const/4 v12, 0x3

    :try_start_11
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/drew/lang/SequentialReader;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 64
    .local v10, "signature":Ljava/lang/String;
    const-string v12, "GIF"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_25

    .line 66
    const-string v12, "Invalid GIF file signature"

    invoke-virtual {v4, v12}, Lcom/drew/metadata/gif/GifHeaderDirectory;->addError(Ljava/lang/String;)V

    .line 109
    .end local v10    # "signature":Ljava/lang/String;
    :cond_24
    :goto_24
    return-void

    .line 70
    .restart local v10    # "signature":Ljava/lang/String;
    :cond_25
    const/4 v12, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/drew/lang/SequentialReader;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 72
    .local v11, "version":Ljava/lang/String;
    const-string v12, "87a"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_49

    const-string v12, "89a"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_49

    .line 73
    const-string v12, "Unexpected GIF version"

    invoke-virtual {v4, v12}, Lcom/drew/metadata/gif/GifHeaderDirectory;->addError(Ljava/lang/String;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_41} :catch_42

    goto :goto_24

    .line 106
    .end local v10    # "signature":Ljava/lang/String;
    .end local v11    # "version":Ljava/lang/String;
    :catch_42
    move-exception v5

    .line 107
    .local v5, "e":Ljava/io/IOException;
    const-string v12, "Unable to read BMP header"

    invoke-virtual {v4, v12}, Lcom/drew/metadata/gif/GifHeaderDirectory;->addError(Ljava/lang/String;)V

    goto :goto_24

    .line 77
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v10    # "signature":Ljava/lang/String;
    .restart local v11    # "version":Ljava/lang/String;
    :cond_49
    const/4 v12, 0x1

    :try_start_4a
    invoke-virtual {v4, v12, v11}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setString(ILjava/lang/String;)V

    .line 78
    const/4 v12, 0x2

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v13

    invoke-virtual {v4, v12, v13}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setInt(II)V

    .line 79
    const/4 v12, 0x3

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v13

    invoke-virtual {v4, v12, v13}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setInt(II)V

    .line 81
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v6

    .line 84
    .local v6, "flags":S
    const/4 v12, 0x1

    and-int/lit8 v13, v6, 0x7

    add-int/lit8 v13, v13, 0x1

    shl-int v3, v12, v13

    .line 85
    .local v3, "colorTableSize":I
    const/4 v12, 0x4

    invoke-virtual {v4, v12, v3}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setInt(II)V

    .line 87
    const-string v12, "89a"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7d

    .line 88
    and-int/lit8 v12, v6, 0x8

    if-eqz v12, :cond_ae

    const/4 v8, 0x1

    .line 89
    .local v8, "isColorTableSorted":Z
    :goto_79
    const/4 v12, 0x5

    invoke-virtual {v4, v12, v8}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setBoolean(IZ)V

    .line 92
    .end local v8    # "isColorTableSorted":Z
    :cond_7d
    and-int/lit8 v12, v6, 0x70

    shr-int/lit8 v12, v12, 0x4

    add-int/lit8 v2, v12, 0x1

    .line 93
    .local v2, "bitsPerPixel":I
    const/4 v12, 0x6

    invoke-virtual {v4, v12, v2}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setInt(II)V

    .line 95
    and-int/lit8 v12, v6, 0xf

    if-eqz v12, :cond_b0

    const/4 v7, 0x1

    .line 96
    .local v7, "hasGlobalColorTable":Z
    :goto_8c
    const/4 v12, 0x7

    invoke-virtual {v4, v12, v7}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setBoolean(IZ)V

    .line 98
    const/16 v12, 0x8

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v13

    invoke-virtual {v4, v12, v13}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setInt(II)V

    .line 100
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v1

    .line 101
    .local v1, "aspectRatioByte":I
    if-eqz v1, :cond_24

    .line 102
    int-to-double v12, v1

    const-wide/high16 v14, 0x402e000000000000L    # 15.0

    add-double/2addr v12, v14

    const-wide/high16 v14, 0x4050000000000000L    # 64.0

    div-double/2addr v12, v14

    double-to-float v9, v12

    .line 103
    .local v9, "pixelAspectRatio":F
    const/16 v12, 0x9

    invoke-virtual {v4, v12, v9}, Lcom/drew/metadata/gif/GifHeaderDirectory;->setFloat(IF)V
    :try_end_ac
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_ac} :catch_42

    goto/16 :goto_24

    .line 88
    .end local v1    # "aspectRatioByte":I
    .end local v2    # "bitsPerPixel":I
    .end local v7    # "hasGlobalColorTable":Z
    .end local v9    # "pixelAspectRatio":F
    :cond_ae
    const/4 v8, 0x0

    goto :goto_79

    .line 95
    .restart local v2    # "bitsPerPixel":I
    :cond_b0
    const/4 v7, 0x0

    goto :goto_8c
.end method
