.class public Lcom/drew/metadata/exif/ExifTiffHandler;
.super Lcom/drew/metadata/tiff/DirectoryTiffHandler;
.source "ExifTiffHandler.java"


# instance fields
.field private final _storeThumbnailBytes:Z


# direct methods
.method public constructor <init>(Lcom/drew/metadata/Metadata;ZLcom/drew/metadata/Directory;)V
    .registers 5
    .param p1, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "storeThumbnailBytes"    # Z
    .param p3, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 53
    const-class v0, Lcom/drew/metadata/exif/ExifIFD0Directory;

    invoke-direct {p0, p1, v0}, Lcom/drew/metadata/tiff/DirectoryTiffHandler;-><init>(Lcom/drew/metadata/Metadata;Ljava/lang/Class;)V

    .line 54
    iput-boolean p2, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_storeThumbnailBytes:Z

    .line 56
    if-eqz p3, :cond_e

    .line 57
    iget-object v0, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, p3}, Lcom/drew/metadata/Directory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 58
    :cond_e
    return-void
.end method

.method private static processKodakMakernote(Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;ILcom/drew/lang/RandomAccessReader;)V
    .registers 8
    .param p0, "directory"    # Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "tagValueOffset"    # I
    .param p2, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 371
    add-int/lit8 v0, p1, 0x8

    .line 373
    .local v0, "dataOffset":I
    const/4 v2, 0x0

    const/16 v3, 0x8

    :try_start_5
    invoke-virtual {p2, v0, v3}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setString(ILjava/lang/String;)V

    .line 374
    const/16 v2, 0x9

    add-int/lit8 v3, v0, 0x9

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 375
    const/16 v2, 0xa

    add-int/lit8 v3, v0, 0xa

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 376
    const/16 v2, 0xc

    add-int/lit8 v3, v0, 0xc

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 377
    const/16 v2, 0xe

    add-int/lit8 v3, v0, 0xe

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 378
    const/16 v2, 0x10

    add-int/lit8 v3, v0, 0x10

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 379
    const/16 v2, 0x12

    add-int/lit8 v3, v0, 0x12

    const/4 v4, 0x2

    invoke-virtual {p2, v3, v4}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setByteArray(I[B)V

    .line 380
    const/16 v2, 0x14

    add-int/lit8 v3, v0, 0x14

    const/4 v4, 0x4

    invoke-virtual {p2, v3, v4}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setByteArray(I[B)V

    .line 381
    const/16 v2, 0x18

    add-int/lit8 v3, v0, 0x18

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 382
    const/16 v2, 0x1b

    add-int/lit8 v3, v0, 0x1b

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 383
    const/16 v2, 0x1c

    add-int/lit8 v3, v0, 0x1c

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 384
    const/16 v2, 0x1d

    add-int/lit8 v3, v0, 0x1d

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 385
    const/16 v2, 0x1e

    add-int/lit8 v3, v0, 0x1e

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 386
    const/16 v2, 0x20

    add-int/lit8 v3, v0, 0x20

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v3

    invoke-virtual {p0, v2, v3, v4}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setLong(IJ)V

    .line 387
    const/16 v2, 0x24

    add-int/lit8 v3, v0, 0x24

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getInt16(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 388
    const/16 v2, 0x38

    add-int/lit8 v3, v0, 0x38

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 389
    const/16 v2, 0x40

    add-int/lit8 v3, v0, 0x40

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 390
    const/16 v2, 0x5c

    add-int/lit8 v3, v0, 0x5c

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 391
    const/16 v2, 0x5d

    add-int/lit8 v3, v0, 0x5d

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 392
    const/16 v2, 0x5e

    add-int/lit8 v3, v0, 0x5e

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 393
    const/16 v2, 0x60

    add-int/lit8 v3, v0, 0x60

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 394
    const/16 v2, 0x62

    add-int/lit8 v3, v0, 0x62

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 395
    const/16 v2, 0x64

    add-int/lit8 v3, v0, 0x64

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 396
    const/16 v2, 0x66

    add-int/lit8 v3, v0, 0x66

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 397
    const/16 v2, 0x68

    add-int/lit8 v3, v0, 0x68

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V

    .line 398
    const/16 v2, 0x6b

    add-int/lit8 v3, v0, 0x6b

    invoke-virtual {p2, v3}, Lcom/drew/lang/RandomAccessReader;->getInt8(I)B

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->setInt(II)V
    :try_end_121
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_121} :catch_122

    .line 402
    :goto_121
    return-void

    .line 399
    :catch_122
    move-exception v1

    .line 400
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error processing Kodak makernote data: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->addError(Ljava/lang/String;)V

    goto :goto_121
.end method

.method private processMakernote(ILjava/util/Set;ILcom/drew/lang/RandomAccessReader;)Z
    .registers 26
    .param p1, "makernoteOffset"    # I
    .param p2    # Ljava/util/Set;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "tiffHeaderOffset"    # I
    .param p4, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;I",
            "Lcom/drew/lang/RandomAccessReader;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    .local p2, "processedIfdOffsets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/drew/metadata/exif/ExifTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    move-object/from16 v19, v0

    const-class v20, Lcom/drew/metadata/exif/ExifIFD0Directory;

    invoke-virtual/range {v19 .. v20}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v17

    .line 199
    .local v17, "ifd0Directory":Lcom/drew/metadata/Directory;
    if-nez v17, :cond_11

    .line 200
    const/16 v19, 0x0

    .line 365
    :goto_10
    return v19

    .line 202
    :cond_11
    const/16 v19, 0x10f

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 204
    .local v6, "cameraMake":Ljava/lang/String;
    const/16 v19, 0x2

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v16

    .line 205
    .local v16, "firstTwoChars":Ljava/lang/String;
    const/16 v19, 0x3

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v14

    .line 206
    .local v14, "firstThreeChars":Ljava/lang/String;
    const/16 v19, 0x4

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v10

    .line 207
    .local v10, "firstFourChars":Ljava/lang/String;
    const/16 v19, 0x5

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v9

    .line 208
    .local v9, "firstFiveChars":Ljava/lang/String;
    const/16 v19, 0x6

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v12

    .line 209
    .local v12, "firstSixChars":Ljava/lang/String;
    const/16 v19, 0x7

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v11

    .line 210
    .local v11, "firstSevenChars":Ljava/lang/String;
    const/16 v19, 0x8

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v8

    .line 211
    .local v8, "firstEightChars":Ljava/lang/String;
    const/16 v19, 0xa

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v13

    .line 212
    .local v13, "firstTenChars":Ljava/lang/String;
    const/16 v19, 0xc

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v15

    .line 214
    .local v15, "firstTwelveChars":Ljava/lang/String;
    invoke-virtual/range {p4 .. p4}, Lcom/drew/lang/RandomAccessReader;->isMotorolaByteOrder()Z

    move-result v5

    .line 216
    .local v5, "byteOrderBefore":Z
    const-string v19, "OLYMP\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_a9

    const-string v19, "EPSON"

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_a9

    const-string v19, "AGFA"

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_ca

    .line 219
    :cond_a9
    const-class v19, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 220
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    .line 364
    :cond_c1
    :goto_c1
    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 365
    const/16 v19, 0x1

    goto/16 :goto_10

    .line 221
    :cond_ca
    const-string v19, "OLYMPUS\u0000II"

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_ed

    .line 225
    const-class v19, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 226
    add-int/lit8 v19, p1, 0xc

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto :goto_c1

    .line 227
    :cond_ed
    if-eqz v6, :cond_112

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "MINOLTA"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_112

    .line 230
    const-class v19, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 231
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, p1

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto :goto_c1

    .line 232
    :cond_112
    if-eqz v6, :cond_194

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "NIKON"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_194

    .line 233
    const-string v19, "Nikon"

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_17c

    .line 242
    add-int/lit8 v19, p1, 0x6

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v19

    packed-switch v19, :pswitch_data_480

    .line 252
    const-string v19, "Unsupported Nikon makernote data ignored."

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    goto/16 :goto_c1

    .line 244
    :pswitch_146
    const-class v19, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 245
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 248
    :pswitch_160
    const-class v19, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 249
    add-int/lit8 v19, p1, 0x12

    add-int/lit8 v20, p1, 0xa

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, v20

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 257
    :cond_17c
    const-class v19, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 258
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, p1

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 260
    :cond_194
    const-string v19, "SONY CAM"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_1a8

    const-string v19, "SONY DSC"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1c2

    .line 261
    :cond_1a8
    const-class v19, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 262
    add-int/lit8 v19, p1, 0xc

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 263
    :cond_1c2
    const-string v19, "SEMC MS\u0000\u0000\u0000\u0000\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1ef

    .line 265
    const/16 v19, 0x1

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 267
    const-class v19, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 268
    add-int/lit8 v19, p1, 0x14

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 269
    :cond_1ef
    const-string v19, "SIGMA\u0000\u0000\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_203

    const-string v19, "FOVEON\u0000\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_21d

    .line 270
    :cond_203
    const-class v19, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 271
    add-int/lit8 v19, p1, 0xa

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 272
    :cond_21d
    const-string v19, "KDK"

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_24f

    .line 273
    const-string v19, "KDK INFO"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 274
    new-instance v7, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;

    invoke-direct {v7}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;-><init>()V

    .line 275
    .local v7, "directory":Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/drew/metadata/exif/ExifTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 276
    move/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v7, v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->processKodakMakernote(Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;ILcom/drew/lang/RandomAccessReader;)V

    goto/16 :goto_c1

    .line 277
    .end local v7    # "directory":Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;
    :cond_24f
    const-string v19, "Canon"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_271

    .line 278
    const-class v19, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 279
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, p1

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 280
    :cond_271
    if-eqz v6, :cond_2bb

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "CASIO"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2bb

    .line 281
    const-string v19, "QVC\u0000\u0000\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_2a3

    .line 282
    const-class v19, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 283
    add-int/lit8 v19, p1, 0x6

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 285
    :cond_2a3
    const-class v19, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 286
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, p1

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 288
    :cond_2bb
    const-string v19, "FUJIFILM"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_2cf

    const-string v19, "Fujifilm"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2fc

    .line 290
    :cond_2cf
    const/16 v19, 0x0

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 294
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v19

    add-int v18, p1, v19

    .line 295
    .local v18, "ifdStart":I
    const-class v19, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 296
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v18

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 297
    .end local v18    # "ifdStart":I
    :cond_2fc
    const-string v19, "KYOCERA"

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_320

    .line 299
    const-class v19, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 300
    add-int/lit8 v19, p1, 0x16

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 301
    :cond_320
    const-string v19, "LEICA"

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_37f

    .line 302
    const/16 v19, 0x0

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 303
    const-string v19, "Leica Camera AG"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_357

    .line 304
    const-class v19, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 305
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 306
    :cond_357
    const-string v19, "LEICA"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_37b

    .line 308
    const-class v19, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 309
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 311
    :cond_37b
    const/16 v19, 0x0

    goto/16 :goto_10

    .line 313
    :cond_37f
    const-string v19, "Panasonic\u0000\u0000\u0000"

    const/16 v20, 0xc

    move-object/from16 v0, p4

    move/from16 v1, p1

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(II)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3ad

    .line 317
    const-class v19, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 318
    add-int/lit8 v19, p1, 0xc

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 319
    :cond_3ad
    const-string v19, "AOC\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3d1

    .line 325
    const-class v19, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 326
    add-int/lit8 v19, p1, 0x6

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 327
    :cond_3d1
    if-eqz v6, :cond_403

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "PENTAX"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_3eb

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "ASAHI"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_403

    .line 334
    :cond_3eb
    const-class v19, Lcom/drew/metadata/exif/makernotes/PentaxMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 335
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, p1

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 341
    :cond_403
    const-string v19, "SANYO\u0000\u0001\u0000"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_427

    .line 342
    const-class v19, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 343
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 344
    :cond_427
    if-eqz v6, :cond_47c

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "ricoh"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_47c

    .line 345
    const-string v19, "Rv"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_44b

    const-string v19, "Rev"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_44f

    .line 351
    :cond_44b
    const/16 v19, 0x0

    goto/16 :goto_10

    .line 352
    :cond_44f
    const-string v19, "Ricoh"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_c1

    .line 354
    const/16 v19, 0x1

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 355
    const-class v19, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 356
    add-int/lit8 v19, p1, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move/from16 v3, v19

    move/from16 v4, p1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    goto/16 :goto_c1

    .line 361
    :cond_47c
    const/16 v19, 0x0

    goto/16 :goto_10

    .line 242
    :pswitch_data_480
    .packed-switch 0x1
        :pswitch_146
        :pswitch_160
    .end packed-switch
.end method


# virtual methods
.method public completed(Lcom/drew/lang/RandomAccessReader;I)V
    .registers 10
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tiffHeaderOffset"    # I

    .prologue
    .line 173
    iget-boolean v5, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_storeThumbnailBytes:Z

    if-eqz v5, :cond_38

    .line 175
    iget-object v5, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    const-class v6, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    invoke-virtual {v5, v6}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v4

    check-cast v4, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    .line 176
    .local v4, "thumbnailDirectory":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    if-eqz v4, :cond_38

    const/16 v5, 0x103

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->containsTag(I)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 177
    const/16 v5, 0x201

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 178
    .local v2, "offset":Ljava/lang/Integer;
    const/16 v5, 0x202

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 179
    .local v1, "length":Ljava/lang/Integer;
    if-eqz v2, :cond_38

    if-eqz v1, :cond_38

    .line 181
    :try_start_28
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, p2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v3

    .line 182
    .local v3, "thumbnailData":[B
    invoke-virtual {v4, v3}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->setThumbnailData([B)V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_38} :catch_39

    .line 189
    .end local v1    # "length":Ljava/lang/Integer;
    .end local v2    # "offset":Ljava/lang/Integer;
    .end local v3    # "thumbnailData":[B
    .end local v4    # "thumbnailDirectory":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    :cond_38
    :goto_38
    return-void

    .line 183
    .restart local v1    # "length":Ljava/lang/Integer;
    .restart local v2    # "offset":Ljava/lang/Integer;
    .restart local v4    # "thumbnailDirectory":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    :catch_39
    move-exception v0

    .line 184
    .local v0, "ex":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid thumbnail data specification: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->addError(Ljava/lang/String;)V

    goto :goto_38
.end method

.method public customProcessTag(ILjava/util/Set;ILcom/drew/lang/RandomAccessReader;II)Z
    .registers 15
    .param p1, "tagOffset"    # I
    .param p2    # Ljava/util/Set;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "tiffHeaderOffset"    # I
    .param p4, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p5, "tagId"    # I
    .param p6, "byteCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;I",
            "Lcom/drew/lang/RandomAccessReader;",
            "II)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "processedIfdOffsets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v7, 0x1

    const/4 v0, 0x0

    .line 147
    const v1, 0x927c

    if-ne p5, v1, :cond_12

    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    if-eqz v1, :cond_12

    .line 148
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/drew/metadata/exif/ExifTiffHandler;->processMakernote(ILjava/util/Set;ILcom/drew/lang/RandomAccessReader;)Z

    move-result v0

    .line 168
    :cond_11
    :goto_11
    return v0

    .line 152
    :cond_12
    const v1, 0x83bb

    if-ne p5, v1, :cond_3e

    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifIFD0Directory;

    if-eqz v1, :cond_3e

    .line 154
    invoke-virtual {p4, p1}, Lcom/drew/lang/RandomAccessReader;->getInt8(I)B

    move-result v1

    const/16 v2, 0x1c

    if-ne v1, v2, :cond_11

    .line 155
    invoke-virtual {p4, p1, p6}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v6

    .line 156
    .local v6, "iptcBytes":[B
    new-instance v0, Lcom/drew/metadata/iptc/IptcReader;

    invoke-direct {v0}, Lcom/drew/metadata/iptc/IptcReader;-><init>()V

    new-instance v1, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v1, v6}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    iget-object v2, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    array-length v3, v6

    int-to-long v3, v3

    iget-object v5, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual/range {v0 .. v5}, Lcom/drew/metadata/iptc/IptcReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;JLcom/drew/metadata/Directory;)V

    move v0, v7

    .line 157
    goto :goto_11

    .line 163
    .end local v6    # "iptcBytes":[B
    :cond_3e
    const/16 v1, 0x2bc

    if-ne p5, v1, :cond_11

    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifIFD0Directory;

    if-eqz v1, :cond_11

    .line 164
    new-instance v0, Lcom/drew/metadata/xmp/XmpReader;

    invoke-direct {v0}, Lcom/drew/metadata/xmp/XmpReader;-><init>()V

    invoke-virtual {p4, p1, p6}, Lcom/drew/lang/RandomAccessReader;->getNullTerminatedString(II)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_metadata:Lcom/drew/metadata/Metadata;

    iget-object v3, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0, v1, v2, v3}, Lcom/drew/metadata/xmp/XmpReader;->extract(Ljava/lang/String;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    move v0, v7

    .line 165
    goto :goto_11
.end method

.method public hasFollowerIfd()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 116
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifIFD0Directory;

    if-eqz v1, :cond_d

    .line 117
    const-class v1, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 127
    :cond_c
    :goto_c
    return v0

    .line 122
    :cond_d
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    if-nez v1, :cond_c

    .line 127
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public setTiffMarker(I)V
    .registers 9
    .param p1, "marker"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/tiff/TiffProcessingException;
        }
    .end annotation

    .prologue
    .line 62
    const/16 v3, 0x2a

    .line 63
    .local v3, "standardTiffMarker":I
    const/16 v0, 0x4f52

    .line 64
    .local v0, "olympusRawTiffMarker":I
    const/16 v1, 0x5352

    .line 65
    .local v1, "olympusRawTiffMarker2":I
    const/16 v2, 0x55

    .line 67
    .local v2, "panasonicRawTiffMarker":I
    const/16 v4, 0x2a

    if-eq p1, v4, :cond_35

    const/16 v4, 0x4f52

    if-eq p1, v4, :cond_35

    const/16 v4, 0x5352

    if-eq p1, v4, :cond_35

    const/16 v4, 0x55

    if-eq p1, v4, :cond_35

    .line 68
    new-instance v4, Lcom/drew/imaging/tiff/TiffProcessingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected TIFF marker: 0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/drew/imaging/tiff/TiffProcessingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 70
    :cond_35
    return-void
.end method

.method public tryCustomProcessFormat(IIJ)Ljava/lang/Long;
    .registers 7
    .param p1, "tagId"    # I
    .param p2, "formatCode"    # I
    .param p3, "componentCount"    # J
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 133
    const/16 v0, 0xd

    if-ne p2, v0, :cond_c

    .line 134
    const-wide/16 v0, 0x4

    mul-long/2addr v0, p3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 136
    :goto_b
    return-object v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public tryEnterSubIfd(I)Z
    .registers 4
    .param p1, "tagId"    # I

    .prologue
    const/4 v0, 0x1

    .line 74
    const/16 v1, 0x14a

    if-ne p1, v1, :cond_b

    .line 75
    const-class v1, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    .line 110
    :goto_a
    return v0

    .line 79
    :cond_b
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifIFD0Directory;

    if-eqz v1, :cond_27

    .line 80
    const v1, 0x8769

    if-ne p1, v1, :cond_1c

    .line 81
    const-class v1, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    goto :goto_a

    .line 85
    :cond_1c
    const v1, 0x8825

    if-ne p1, v1, :cond_27

    .line 86
    const-class v1, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    goto :goto_a

    .line 91
    :cond_27
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    if-eqz v1, :cond_38

    .line 92
    const v1, 0xa005

    if-ne p1, v1, :cond_38

    .line 93
    const-class v1, Lcom/drew/metadata/exif/ExifInteropDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    goto :goto_a

    .line 98
    :cond_38
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifTiffHandler;->_currentDirectory:Lcom/drew/metadata/Directory;

    instance-of v1, v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    if-eqz v1, :cond_52

    .line 99
    const/16 v1, 0x2010

    if-ne p1, v1, :cond_48

    .line 100
    const-class v1, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    goto :goto_a

    .line 104
    :cond_48
    const/16 v1, 0x2020

    if-ne p1, v1, :cond_52

    .line 105
    const-class v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/ExifTiffHandler;->pushDirectory(Ljava/lang/Class;)V

    goto :goto_a

    .line 110
    :cond_52
    const/4 v0, 0x0

    goto :goto_a
.end method
