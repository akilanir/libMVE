.class public Lcom/drew/metadata/webp/WebpRiffHandler;
.super Ljava/lang/Object;
.source "WebpRiffHandler.java"

# interfaces
.implements Lcom/drew/imaging/riff/RiffHandler;


# instance fields
.field private final _metadata:Lcom/drew/metadata/Metadata;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/drew/metadata/Metadata;)V
    .registers 2
    .param p1, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    .line 55
    return-void
.end method


# virtual methods
.method public processChunk(Ljava/lang/String;[B)V
    .registers 20
    .param p1, "fourCC"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "payload"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 76
    const-string v14, "EXIF"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_20

    .line 77
    new-instance v14, Lcom/drew/metadata/exif/ExifReader;

    invoke-direct {v14}, Lcom/drew/metadata/exif/ExifReader;-><init>()V

    new-instance v15, Lcom/drew/lang/ByteArrayReader;

    move-object/from16 v0, p2

    invoke-direct {v15, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    move-object/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/drew/metadata/exif/ExifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V

    .line 164
    :cond_1f
    :goto_1f
    return-void

    .line 78
    :cond_20
    const-string v14, "ICCP"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_40

    .line 79
    new-instance v14, Lcom/drew/metadata/icc/IccReader;

    invoke-direct {v14}, Lcom/drew/metadata/icc/IccReader;-><init>()V

    new-instance v15, Lcom/drew/lang/ByteArrayReader;

    move-object/from16 v0, p2

    invoke-direct {v15, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    move-object/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/drew/metadata/icc/IccReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V

    goto :goto_1f

    .line 80
    :cond_40
    const-string v14, "XMP "

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_59

    .line 81
    new-instance v14, Lcom/drew/metadata/xmp/XmpReader;

    invoke-direct {v14}, Lcom/drew/metadata/xmp/XmpReader;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0, v15}, Lcom/drew/metadata/xmp/XmpReader;->extract([BLcom/drew/metadata/Metadata;)V

    goto :goto_1f

    .line 82
    :cond_59
    const-string v14, "VP8X"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b3

    move-object/from16 v0, p2

    array-length v14, v0

    const/16 v15, 0xa

    if-ne v14, v15, :cond_b3

    .line 83
    new-instance v11, Lcom/drew/lang/ByteArrayReader;

    move-object/from16 v0, p2

    invoke-direct {v11, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 84
    .local v11, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 89
    const/4 v14, 0x1

    :try_start_76
    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getBit(I)Z

    move-result v10

    .line 92
    .local v10, "isAnimation":Z
    const/4 v14, 0x4

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getBit(I)Z

    move-result v7

    .line 96
    .local v7, "hasAlpha":Z
    const/4 v14, 0x4

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getInt24(I)I

    move-result v13

    .line 97
    .local v13, "widthMinusOne":I
    const/4 v14, 0x7

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getInt24(I)I

    move-result v9

    .line 99
    .local v9, "heightMinusOne":I
    new-instance v5, Lcom/drew/metadata/webp/WebpDirectory;

    invoke-direct {v5}, Lcom/drew/metadata/webp/WebpDirectory;-><init>()V

    .line 100
    .local v5, "directory":Lcom/drew/metadata/webp/WebpDirectory;
    const/4 v14, 0x2

    add-int/lit8 v15, v13, 0x1

    invoke-virtual {v5, v14, v15}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 101
    const/4 v14, 0x1

    add-int/lit8 v15, v9, 0x1

    invoke-virtual {v5, v14, v15}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 102
    const/4 v14, 0x3

    invoke-virtual {v5, v14, v7}, Lcom/drew/metadata/webp/WebpDirectory;->setBoolean(IZ)V

    .line 103
    const/4 v14, 0x4

    invoke-virtual {v5, v14, v10}, Lcom/drew/metadata/webp/WebpDirectory;->setBoolean(IZ)V

    .line 105
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    invoke-virtual {v14, v5}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_76 .. :try_end_a9} :catch_ab

    goto/16 :goto_1f

    .line 107
    .end local v5    # "directory":Lcom/drew/metadata/webp/WebpDirectory;
    .end local v7    # "hasAlpha":Z
    .end local v9    # "heightMinusOne":I
    .end local v10    # "isAnimation":Z
    .end local v13    # "widthMinusOne":I
    :catch_ab
    move-exception v6

    .line 108
    .local v6, "e":Ljava/io/IOException;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v6, v14}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto/16 :goto_1f

    .line 110
    .end local v6    # "e":Ljava/io/IOException;
    .end local v11    # "reader":Lcom/drew/lang/RandomAccessReader;
    :cond_b3
    const-string v14, "VP8L"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_120

    move-object/from16 v0, p2

    array-length v14, v0

    const/4 v15, 0x4

    if-le v14, v15, :cond_120

    .line 111
    new-instance v11, Lcom/drew/lang/ByteArrayReader;

    move-object/from16 v0, p2

    invoke-direct {v11, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 112
    .restart local v11    # "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 118
    const/4 v14, 0x0

    :try_start_cf
    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getInt8(I)B

    move-result v14

    const/16 v15, 0x2f

    if-ne v14, v15, :cond_1f

    .line 120
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v1

    .line 121
    .local v1, "b1":I
    const/4 v14, 0x2

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v2

    .line 122
    .local v2, "b2":I
    const/4 v14, 0x3

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    .line 123
    .local v3, "b3":I
    const/4 v14, 0x4

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v4

    .line 125
    .local v4, "b4":I
    and-int/lit8 v14, v2, 0x3f

    shl-int/lit8 v14, v14, 0x8

    or-int v13, v14, v1

    .line 127
    .restart local v13    # "widthMinusOne":I
    and-int/lit8 v14, v4, 0xf

    shl-int/lit8 v14, v14, 0xa

    shl-int/lit8 v15, v3, 0x2

    or-int/2addr v14, v15

    and-int/lit16 v15, v2, 0xc0

    shr-int/lit8 v15, v15, 0x6

    or-int v9, v14, v15

    .line 129
    .restart local v9    # "heightMinusOne":I
    new-instance v5, Lcom/drew/metadata/webp/WebpDirectory;

    invoke-direct {v5}, Lcom/drew/metadata/webp/WebpDirectory;-><init>()V

    .line 130
    .restart local v5    # "directory":Lcom/drew/metadata/webp/WebpDirectory;
    const/4 v14, 0x2

    add-int/lit8 v15, v13, 0x1

    invoke-virtual {v5, v14, v15}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 131
    const/4 v14, 0x1

    add-int/lit8 v15, v9, 0x1

    invoke-virtual {v5, v14, v15}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 133
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    invoke-virtual {v14, v5}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V
    :try_end_116
    .catch Ljava/io/IOException; {:try_start_cf .. :try_end_116} :catch_118

    goto/16 :goto_1f

    .line 135
    .end local v1    # "b1":I
    .end local v2    # "b2":I
    .end local v3    # "b3":I
    .end local v4    # "b4":I
    .end local v5    # "directory":Lcom/drew/metadata/webp/WebpDirectory;
    .end local v9    # "heightMinusOne":I
    .end local v13    # "widthMinusOne":I
    :catch_118
    move-exception v6

    .line 136
    .restart local v6    # "e":Ljava/io/IOException;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v6, v14}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto/16 :goto_1f

    .line 138
    .end local v6    # "e":Ljava/io/IOException;
    .end local v11    # "reader":Lcom/drew/lang/RandomAccessReader;
    :cond_120
    const-string v14, "VP8 "

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1f

    move-object/from16 v0, p2

    array-length v14, v0

    const/16 v15, 0x9

    if-le v14, v15, :cond_1f

    .line 139
    new-instance v11, Lcom/drew/lang/ByteArrayReader;

    move-object/from16 v0, p2

    invoke-direct {v11, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 140
    .restart local v11    # "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 147
    const/4 v14, 0x3

    :try_start_13d
    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v14

    const/16 v15, 0x9d

    if-ne v14, v15, :cond_1f

    const/4 v14, 0x4

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_1f

    const/4 v14, 0x5

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v14

    const/16 v15, 0x2a

    if-ne v14, v15, :cond_1f

    .line 151
    const/4 v14, 0x6

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v12

    .line 152
    .local v12, "width":I
    const/16 v14, 0x8

    invoke-virtual {v11, v14}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v8

    .line 154
    .local v8, "height":I
    new-instance v5, Lcom/drew/metadata/webp/WebpDirectory;

    invoke-direct {v5}, Lcom/drew/metadata/webp/WebpDirectory;-><init>()V

    .line 155
    .restart local v5    # "directory":Lcom/drew/metadata/webp/WebpDirectory;
    const/4 v14, 0x2

    invoke-virtual {v5, v14, v12}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 156
    const/4 v14, 0x1

    invoke-virtual {v5, v14, v8}, Lcom/drew/metadata/webp/WebpDirectory;->setInt(II)V

    .line 158
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/drew/metadata/webp/WebpRiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    invoke-virtual {v14, v5}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V
    :try_end_175
    .catch Ljava/io/IOException; {:try_start_13d .. :try_end_175} :catch_177

    goto/16 :goto_1f

    .line 160
    .end local v5    # "directory":Lcom/drew/metadata/webp/WebpDirectory;
    .end local v8    # "height":I
    .end local v12    # "width":I
    :catch_177
    move-exception v6

    .line 161
    .restart local v6    # "e":Ljava/io/IOException;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v6, v14}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto/16 :goto_1f
.end method

.method public shouldAcceptChunk(Ljava/lang/String;)Z
    .registers 3
    .param p1, "fourCC"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 64
    const-string v0, "VP8X"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "VP8L"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "VP8 "

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "EXIF"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "ICCP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "XMP "

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    :cond_30
    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method public shouldAcceptRiffIdentifier(Ljava/lang/String;)Z
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 59
    const-string v0, "WEBP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
