.class public Lcom/drew/imaging/tiff/TiffReader;
.super Ljava/lang/Object;
.source "TiffReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculateTagOffset(II)I
    .registers 4
    .param p0, "ifdStartOffset"    # I
    .param p1, "entryNumber"    # I

    .prologue
    .line 386
    add-int/lit8 v0, p0, 0x2

    mul-int/lit8 v1, p1, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method public static processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V
    .registers 41
    .param p0, "handler"    # Lcom/drew/imaging/tiff/TiffHandler;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Set;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "ifdOffset"    # I
    .param p4, "tiffHeaderOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/drew/imaging/tiff/TiffHandler;",
            "Lcom/drew/lang/RandomAccessReader;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    .local p2, "processedIfdOffsets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/16 v30, 0x0

    .line 115
    .local v30, "resetByteOrder":Ljava/lang/Boolean;
    :try_start_2
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_15a

    move-result v5

    if-eqz v5, :cond_1d

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 252
    :cond_1c
    :goto_1c
    return-void

    .line 120
    :cond_1d
    :try_start_1d
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 122
    move/from16 v0, p3

    int-to-long v5, v0

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-gez v5, :cond_33

    if-gez p3, :cond_49

    .line 123
    :cond_33
    const-string v5, "Ignored IFD marked to start outside data segment"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V
    :try_end_3a
    .catchall {:try_start_1d .. :try_end_3a} :catchall_15a

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto :goto_1c

    .line 128
    :cond_49
    :try_start_49
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v21

    .line 134
    .local v21, "dirTagCount":I
    const/16 v5, 0xff

    move/from16 v0, v21

    if-le v0, v5, :cond_73

    move/from16 v0, v21

    and-int/lit16 v5, v0, 0xff

    if-nez v5, :cond_73

    .line 135
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->isMotorolaByteOrder()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v30

    .line 136
    shr-int/lit8 v21, v21, 0x8

    .line 137
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->isMotorolaByteOrder()Z

    move-result v5

    if-nez v5, :cond_9a

    const/4 v5, 0x1

    :goto_6e
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 140
    :cond_73
    mul-int/lit8 v5, v21, 0xc

    add-int/lit8 v5, v5, 0x2

    add-int/lit8 v20, v5, 0x4

    .line 141
    .local v20, "dirLength":I
    add-int v5, v20, p3

    int-to-long v5, v5

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_9c

    .line 142
    const-string v5, "Illegally sized IFD"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V
    :try_end_8b
    .catchall {:try_start_49 .. :try_end_8b} :catchall_15a

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto :goto_1c

    .line 137
    .end local v20    # "dirLength":I
    :cond_9a
    const/4 v5, 0x0

    goto :goto_6e

    .line 149
    .restart local v20    # "dirLength":I
    :cond_9c
    const/16 v25, 0x0

    .line 150
    .local v25, "invalidTiffFormatCodeCount":I
    const/16 v32, 0x0

    .local v32, "tagNumber":I
    :goto_a0
    move/from16 v0, v32

    move/from16 v1, v21

    if-ge v0, v1, :cond_1f8

    .line 151
    :try_start_a6
    move/from16 v0, p3

    move/from16 v1, v32

    invoke-static {v0, v1}, Lcom/drew/imaging/tiff/TiffReader;->calculateTagOffset(II)I

    move-result v33

    .line 154
    .local v33, "tagOffset":I
    move-object/from16 v0, p1

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v10

    .line 157
    .local v10, "tagId":I
    add-int/lit8 v5, v33, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v13

    .line 158
    .local v13, "formatCode":I
    invoke-static {v13}, Lcom/drew/imaging/tiff/TiffDataFormat;->fromTiffFormatCode(I)Lcom/drew/imaging/tiff/TiffDataFormat;

    move-result-object v23

    .line 161
    .local v23, "format":Lcom/drew/imaging/tiff/TiffDataFormat;
    add-int/lit8 v5, v33, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v18

    .line 164
    .local v18, "componentCount":J
    if-nez v23, :cond_137

    .line 165
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-interface {v0, v10, v13, v1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->tryCustomProcessFormat(IIJ)Ljava/lang/Long;

    move-result-object v17

    .line 166
    .local v17, "byteCountOverride":Ljava/lang/Long;
    if-nez v17, :cond_110

    .line 169
    const-string v5, "Invalid TIFF tag format code %d for tag 0x%04X"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V

    .line 171
    add-int/lit8 v25, v25, 0x1

    const/4 v5, 0x5

    move/from16 v0, v25

    if-le v0, v5, :cond_133

    .line 172
    const-string v5, "Stopping processing as too many errors seen in TIFF IFD"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V
    :try_end_100
    .catchall {:try_start_a6 .. :try_end_100} :catchall_15a

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto/16 :goto_1c

    .line 177
    :cond_110
    :try_start_110
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Long;->longValue()J

    move-result-wide v15

    .line 183
    .end local v17    # "byteCountOverride":Ljava/lang/Long;
    .local v15, "byteCount":J
    :goto_114
    const-wide/16 v5, 0x4

    cmp-long v5, v15, v5

    if-lez v5, :cond_16a

    .line 185
    add-int/lit8 v5, v33, 0x8

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v28

    .line 186
    .local v28, "offsetVal":J
    add-long v5, v28, v15

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_13f

    .line 188
    const-string v5, "Illegal TIFF tag pointer offset"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V

    .line 150
    .end local v15    # "byteCount":J
    .end local v28    # "offsetVal":J
    :cond_133
    :goto_133
    add-int/lit8 v32, v32, 0x1

    goto/16 :goto_a0

    .line 179
    :cond_137
    invoke-virtual/range {v23 .. v23}, Lcom/drew/imaging/tiff/TiffDataFormat;->getComponentSizeBytes()I

    move-result v5

    int-to-long v5, v5

    mul-long v15, v18, v5

    .restart local v15    # "byteCount":J
    goto :goto_114

    .line 191
    .restart local v28    # "offsetVal":J
    :cond_13f
    move/from16 v0, p4

    int-to-long v5, v0

    add-long v34, v5, v28

    .line 197
    .end local v28    # "offsetVal":J
    .local v34, "tagValueOffset":J
    :goto_144
    const-wide/16 v5, 0x0

    cmp-long v5, v34, v5

    if-ltz v5, :cond_152

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v5

    cmp-long v5, v34, v5

    if-lez v5, :cond_170

    .line 198
    :cond_152
    const-string v5, "Illegal TIFF tag pointer offset"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V
    :try_end_159
    .catchall {:try_start_110 .. :try_end_159} :catchall_15a

    goto :goto_133

    .line 248
    .end local v10    # "tagId":I
    .end local v13    # "formatCode":I
    .end local v15    # "byteCount":J
    .end local v18    # "componentCount":J
    .end local v20    # "dirLength":I
    .end local v21    # "dirTagCount":I
    .end local v23    # "format":Lcom/drew/imaging/tiff/TiffDataFormat;
    .end local v25    # "invalidTiffFormatCodeCount":I
    .end local v32    # "tagNumber":I
    .end local v33    # "tagOffset":I
    .end local v34    # "tagValueOffset":J
    :catchall_15a
    move-exception v5

    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_169

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    :cond_169
    throw v5

    .line 194
    .restart local v10    # "tagId":I
    .restart local v13    # "formatCode":I
    .restart local v15    # "byteCount":J
    .restart local v18    # "componentCount":J
    .restart local v20    # "dirLength":I
    .restart local v21    # "dirTagCount":I
    .restart local v23    # "format":Lcom/drew/imaging/tiff/TiffDataFormat;
    .restart local v25    # "invalidTiffFormatCodeCount":I
    .restart local v32    # "tagNumber":I
    .restart local v33    # "tagOffset":I
    :cond_16a
    add-int/lit8 v5, v33, 0x8

    int-to-long v0, v5

    move-wide/from16 v34, v0

    .restart local v34    # "tagValueOffset":J
    goto :goto_144

    .line 204
    :cond_170
    const-wide/16 v5, 0x0

    cmp-long v5, v15, v5

    if-ltz v5, :cond_180

    add-long v5, v34, v15

    :try_start_178
    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_19a

    .line 205
    :cond_180
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Illegal number of bytes for TIFF tag data: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide v0, v15

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V

    goto :goto_133

    .line 210
    :cond_19a
    const/16 v26, 0x0

    .line 211
    .local v26, "isIfdPointer":Z
    const-wide/16 v5, 0x4

    mul-long v5, v5, v18

    cmp-long v5, v15, v5

    if-nez v5, :cond_1d5

    .line 212
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_1a6
    move/from16 v0, v24

    int-to-long v5, v0

    cmp-long v5, v5, v18

    if-gez v5, :cond_1d5

    .line 213
    move-object/from16 v0, p0

    invoke-interface {v0, v10}, Lcom/drew/imaging/tiff/TiffHandler;->tryEnterSubIfd(I)Z

    move-result v5

    if-eqz v5, :cond_1d2

    .line 214
    const/16 v26, 0x1

    .line 215
    mul-int/lit8 v5, v24, 0x4

    int-to-long v5, v5

    add-long v5, v5, v34

    long-to-int v5, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v5

    add-int v31, p4, v5

    .line 216
    .local v31, "subDirOffset":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, v31

    move/from16 v4, p4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    .line 212
    .end local v31    # "subDirOffset":I
    :cond_1d2
    add-int/lit8 v24, v24, 0x1

    goto :goto_1a6

    .line 222
    .end local v24    # "i":I
    :cond_1d5
    if-nez v26, :cond_133

    move-wide/from16 v0, v34

    long-to-int v6, v0

    long-to-int v11, v15

    move-object/from16 v5, p0

    move-object/from16 v7, p2

    move/from16 v8, p4

    move-object/from16 v9, p1

    invoke-interface/range {v5 .. v11}, Lcom/drew/imaging/tiff/TiffHandler;->customProcessTag(ILjava/util/Set;ILcom/drew/lang/RandomAccessReader;II)Z

    move-result v5

    if-nez v5, :cond_133

    .line 224
    move-wide/from16 v0, v34

    long-to-int v11, v0

    move-wide/from16 v0, v18

    long-to-int v12, v0

    move-object/from16 v9, p0

    move-object/from16 v14, p1

    invoke-static/range {v9 .. v14}, Lcom/drew/imaging/tiff/TiffReader;->processTag(Lcom/drew/imaging/tiff/TiffHandler;IIIILcom/drew/lang/RandomAccessReader;)V

    goto/16 :goto_133

    .line 229
    .end local v10    # "tagId":I
    .end local v13    # "formatCode":I
    .end local v15    # "byteCount":J
    .end local v18    # "componentCount":J
    .end local v23    # "format":Lcom/drew/imaging/tiff/TiffDataFormat;
    .end local v26    # "isIfdPointer":Z
    .end local v33    # "tagOffset":I
    .end local v34    # "tagValueOffset":J
    :cond_1f8
    move/from16 v0, p3

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/drew/imaging/tiff/TiffReader;->calculateTagOffset(II)I

    move-result v22

    .line 230
    .local v22, "finalTagOffset":I
    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v27

    .line 231
    .local v27, "nextIfdOffset":I
    if-eqz v27, :cond_250

    .line 232
    add-int v27, v27, p4

    .line 233
    move/from16 v0, v27

    int-to-long v5, v0

    invoke-virtual/range {p1 .. p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J
    :try_end_212
    .catchall {:try_start_178 .. :try_end_212} :catchall_15a

    move-result-wide v7

    cmp-long v5, v5, v7

    if-ltz v5, :cond_227

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto/16 :goto_1c

    .line 237
    :cond_227
    move/from16 v0, v27

    move/from16 v1, p3

    if-ge v0, v1, :cond_23d

    .line 248
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto/16 :goto_1c

    .line 243
    :cond_23d
    :try_start_23d
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->hasFollowerIfd()Z

    move-result v5

    if-eqz v5, :cond_250

    .line 244
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, v27

    move/from16 v4, p4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V
    :try_end_250
    .catchall {:try_start_23d .. :try_end_250} :catchall_15a

    .line 248
    :cond_250
    invoke-interface/range {p0 .. p0}, Lcom/drew/imaging/tiff/TiffHandler;->endingIFD()V

    .line 249
    if-eqz v30, :cond_1c

    .line 250
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto/16 :goto_1c
.end method

.method private static processTag(Lcom/drew/imaging/tiff/TiffHandler;IIIILcom/drew/lang/RandomAccessReader;)V
    .registers 13
    .param p0, "handler"    # Lcom/drew/imaging/tiff/TiffHandler;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "tagId"    # I
    .param p2, "tagValueOffset"    # I
    .param p3, "componentCount"    # I
    .param p4, "formatCode"    # I
    .param p5, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 261
    packed-switch p4, :pswitch_data_1ae

    .line 372
    const-string v2, "Invalid TIFF tag format code %d for tag 0x%04X"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Lcom/drew/imaging/tiff/TiffHandler;->error(Ljava/lang/String;)V

    .line 374
    :cond_1d
    :goto_1d
    return-void

    .line 264
    :pswitch_1e
    invoke-virtual {p5, p2, p3}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setByteArray(I[B)V

    goto :goto_1d

    .line 267
    :pswitch_26
    invoke-virtual {p5, p2, p3}, Lcom/drew/lang/RandomAccessReader;->getNullTerminatedString(II)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setString(ILjava/lang/String;)V

    goto :goto_1d

    .line 270
    :pswitch_2e
    if-ne p3, v6, :cond_45

    .line 271
    new-instance v2, Lcom/drew/lang/Rational;

    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v3

    int-to-long v3, v3

    add-int/lit8 v5, p2, 0x4

    invoke-virtual {p5, v5}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v5

    int-to-long v5, v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/drew/lang/Rational;-><init>(JJ)V

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setRational(ILcom/drew/lang/Rational;)V

    goto :goto_1d

    .line 272
    :cond_45
    if-le p3, v6, :cond_1d

    .line 273
    new-array v0, p3, [Lcom/drew/lang/Rational;

    .line 274
    .local v0, "array":[Lcom/drew/lang/Rational;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4a
    if-ge v1, p3, :cond_68

    .line 275
    new-instance v2, Lcom/drew/lang/Rational;

    mul-int/lit8 v3, v1, 0x8

    add-int/2addr v3, p2

    invoke-virtual {p5, v3}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v3

    int-to-long v3, v3

    add-int/lit8 v5, p2, 0x4

    mul-int/lit8 v6, v1, 0x8

    add-int/2addr v5, v6

    invoke-virtual {p5, v5}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v5

    int-to-long v5, v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/drew/lang/Rational;-><init>(JJ)V

    aput-object v2, v0, v1

    .line 274
    add-int/lit8 v1, v1, 0x1

    goto :goto_4a

    .line 276
    :cond_68
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setRationalArray(I[Lcom/drew/lang/Rational;)V

    goto :goto_1d

    .line 280
    .end local v0    # "array":[Lcom/drew/lang/Rational;
    .end local v1    # "i":I
    :pswitch_6c
    if-ne p3, v6, :cond_81

    .line 281
    new-instance v2, Lcom/drew/lang/Rational;

    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v3

    add-int/lit8 v5, p2, 0x4

    invoke-virtual {p5, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/drew/lang/Rational;-><init>(JJ)V

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setRational(ILcom/drew/lang/Rational;)V

    goto :goto_1d

    .line 282
    :cond_81
    if-le p3, v6, :cond_1d

    .line 283
    new-array v0, p3, [Lcom/drew/lang/Rational;

    .line 284
    .restart local v0    # "array":[Lcom/drew/lang/Rational;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_86
    if-ge v1, p3, :cond_a2

    .line 285
    new-instance v2, Lcom/drew/lang/Rational;

    mul-int/lit8 v3, v1, 0x8

    add-int/2addr v3, p2

    invoke-virtual {p5, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v3

    add-int/lit8 v5, p2, 0x4

    mul-int/lit8 v6, v1, 0x8

    add-int/2addr v5, v6

    invoke-virtual {p5, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/drew/lang/Rational;-><init>(JJ)V

    aput-object v2, v0, v1

    .line 284
    add-int/lit8 v1, v1, 0x1

    goto :goto_86

    .line 286
    :cond_a2
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setRationalArray(I[Lcom/drew/lang/Rational;)V

    goto/16 :goto_1d

    .line 290
    .end local v0    # "array":[Lcom/drew/lang/Rational;
    .end local v1    # "i":I
    :pswitch_a7
    if-ne p3, v6, :cond_b2

    .line 291
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getFloat32(I)F

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setFloat(IF)V

    goto/16 :goto_1d

    .line 293
    :cond_b2
    new-array v0, p3, [F

    .line 294
    .local v0, "array":[F
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_b5
    if-ge v1, p3, :cond_c3

    .line 295
    mul-int/lit8 v2, v1, 0x4

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getFloat32(I)F

    move-result v2

    aput v2, v0, v1

    .line 294
    add-int/lit8 v1, v1, 0x1

    goto :goto_b5

    .line 296
    :cond_c3
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setFloatArray(I[F)V

    goto/16 :goto_1d

    .line 300
    .end local v0    # "array":[F
    .end local v1    # "i":I
    :pswitch_c8
    if-ne p3, v6, :cond_d3

    .line 301
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getDouble64(I)D

    move-result-wide v2

    invoke-interface {p0, p1, v2, v3}, Lcom/drew/imaging/tiff/TiffHandler;->setDouble(ID)V

    goto/16 :goto_1d

    .line 303
    :cond_d3
    new-array v0, p3, [D

    .line 304
    .local v0, "array":[D
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_d6
    if-ge v1, p3, :cond_e4

    .line 305
    mul-int/lit8 v2, v1, 0x4

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getDouble64(I)D

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 304
    add-int/lit8 v1, v1, 0x1

    goto :goto_d6

    .line 306
    :cond_e4
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setDoubleArray(I[D)V

    goto/16 :goto_1d

    .line 310
    .end local v0    # "array":[D
    .end local v1    # "i":I
    :pswitch_e9
    if-ne p3, v6, :cond_f4

    .line 311
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getInt8(I)B

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setInt8s(IB)V

    goto/16 :goto_1d

    .line 313
    :cond_f4
    new-array v0, p3, [B

    .line 314
    .local v0, "array":[B
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_f7
    if-ge v1, p3, :cond_104

    .line 315
    add-int v2, p2, v1

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getInt8(I)B

    move-result v2

    aput-byte v2, v0, v1

    .line 314
    add-int/lit8 v1, v1, 0x1

    goto :goto_f7

    .line 316
    :cond_104
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt8sArray(I[B)V

    goto/16 :goto_1d

    .line 320
    .end local v0    # "array":[B
    .end local v1    # "i":I
    :pswitch_109
    if-ne p3, v6, :cond_114

    .line 321
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setInt8u(IS)V

    goto/16 :goto_1d

    .line 323
    :cond_114
    new-array v0, p3, [S

    .line 324
    .local v0, "array":[S
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_117
    if-ge v1, p3, :cond_124

    .line 325
    add-int v2, p2, v1

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v2

    aput-short v2, v0, v1

    .line 324
    add-int/lit8 v1, v1, 0x1

    goto :goto_117

    .line 326
    :cond_124
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt8uArray(I[S)V

    goto/16 :goto_1d

    .line 330
    .end local v0    # "array":[S
    .end local v1    # "i":I
    :pswitch_129
    if-ne p3, v6, :cond_134

    .line 331
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getInt16(I)S

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setInt16s(II)V

    goto/16 :goto_1d

    .line 333
    :cond_134
    new-array v0, p3, [S

    .line 334
    .restart local v0    # "array":[S
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_137
    if-ge v1, p3, :cond_145

    .line 335
    mul-int/lit8 v2, v1, 0x2

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getInt16(I)S

    move-result v2

    aput-short v2, v0, v1

    .line 334
    add-int/lit8 v1, v1, 0x1

    goto :goto_137

    .line 336
    :cond_145
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt16sArray(I[S)V

    goto/16 :goto_1d

    .line 340
    .end local v0    # "array":[S
    .end local v1    # "i":I
    :pswitch_14a
    if-ne p3, v6, :cond_155

    .line 341
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setInt16u(II)V

    goto/16 :goto_1d

    .line 343
    :cond_155
    new-array v0, p3, [I

    .line 344
    .local v0, "array":[I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_158
    if-ge v1, p3, :cond_166

    .line 345
    mul-int/lit8 v2, v1, 0x2

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    aput v2, v0, v1

    .line 344
    add-int/lit8 v1, v1, 0x1

    goto :goto_158

    .line 346
    :cond_166
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt16uArray(I[I)V

    goto/16 :goto_1d

    .line 351
    .end local v0    # "array":[I
    .end local v1    # "i":I
    :pswitch_16b
    if-ne p3, v6, :cond_176

    .line 352
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v2

    invoke-interface {p0, p1, v2}, Lcom/drew/imaging/tiff/TiffHandler;->setInt32s(II)V

    goto/16 :goto_1d

    .line 354
    :cond_176
    new-array v0, p3, [I

    .line 355
    .restart local v0    # "array":[I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_179
    if-ge v1, p3, :cond_187

    .line 356
    mul-int/lit8 v2, v1, 0x4

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v2

    aput v2, v0, v1

    .line 355
    add-int/lit8 v1, v1, 0x1

    goto :goto_179

    .line 357
    :cond_187
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt32sArray(I[I)V

    goto/16 :goto_1d

    .line 362
    .end local v0    # "array":[I
    .end local v1    # "i":I
    :pswitch_18c
    if-ne p3, v6, :cond_197

    .line 363
    invoke-virtual {p5, p2}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v2

    invoke-interface {p0, p1, v2, v3}, Lcom/drew/imaging/tiff/TiffHandler;->setInt32u(IJ)V

    goto/16 :goto_1d

    .line 365
    :cond_197
    new-array v0, p3, [J

    .line 366
    .local v0, "array":[J
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_19a
    if-ge v1, p3, :cond_1a8

    .line 367
    mul-int/lit8 v2, v1, 0x4

    add-int/2addr v2, p2

    invoke-virtual {p5, v2}, Lcom/drew/lang/RandomAccessReader;->getUInt32(I)J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 366
    add-int/lit8 v1, v1, 0x1

    goto :goto_19a

    .line 368
    :cond_1a8
    invoke-interface {p0, p1, v0}, Lcom/drew/imaging/tiff/TiffHandler;->setInt32uArray(I[J)V

    goto/16 :goto_1d

    .line 261
    nop

    :pswitch_data_1ae
    .packed-switch 0x1
        :pswitch_109
        :pswitch_26
        :pswitch_14a
        :pswitch_18c
        :pswitch_6c
        :pswitch_e9
        :pswitch_1e
        :pswitch_129
        :pswitch_16b
        :pswitch_2e
        :pswitch_a7
        :pswitch_c8
    .end packed-switch
.end method


# virtual methods
.method public processTiff(Lcom/drew/lang/RandomAccessReader;Lcom/drew/imaging/tiff/TiffHandler;I)V
    .registers 14
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "handler"    # Lcom/drew/imaging/tiff/TiffHandler;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "tiffHeaderOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/tiff/TiffProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p1, p3}, Lcom/drew/lang/RandomAccessReader;->getInt16(I)S

    move-result v0

    .line 55
    .local v0, "byteOrderIdentifier":S
    const/16 v4, 0x4d4d

    if-ne v0, v4, :cond_40

    .line 56
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 64
    :goto_c
    add-int/lit8 v4, p3, 0x2

    invoke-virtual {p1, v4}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    .line 65
    .local v3, "tiffMarker":I
    invoke-interface {p2, v3}, Lcom/drew/imaging/tiff/TiffHandler;->setTiffMarker(I)V

    .line 67
    add-int/lit8 v4, p3, 0x4

    invoke-virtual {p1, v4}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v4

    add-int v1, v4, p3

    .line 71
    .local v1, "firstIfdOffset":I
    int-to-long v4, v1

    invoke-virtual {p1}, Lcom/drew/lang/RandomAccessReader;->getLength()J

    move-result-wide v6

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_34

    .line 72
    const-string v4, "First IFD offset is beyond the end of the TIFF data segment -- trying default offset"

    invoke-interface {p2, v4}, Lcom/drew/imaging/tiff/TiffHandler;->warn(Ljava/lang/String;)V

    .line 74
    add-int/lit8 v4, p3, 0x2

    add-int/lit8 v4, v4, 0x2

    add-int/lit8 v1, v4, 0x4

    .line 77
    :cond_34
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 78
    .local v2, "processedIfdOffsets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-static {p2, p1, v2, v1, p3}, Lcom/drew/imaging/tiff/TiffReader;->processIfd(Lcom/drew/imaging/tiff/TiffHandler;Lcom/drew/lang/RandomAccessReader;Ljava/util/Set;II)V

    .line 80
    invoke-interface {p2, p1, p3}, Lcom/drew/imaging/tiff/TiffHandler;->completed(Lcom/drew/lang/RandomAccessReader;I)V

    .line 81
    return-void

    .line 57
    .end local v1    # "firstIfdOffset":I
    .end local v2    # "processedIfdOffsets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v3    # "tiffMarker":I
    :cond_40
    const/16 v4, 0x4949

    if-ne v0, v4, :cond_49

    .line 58
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    goto :goto_c

    .line 60
    :cond_49
    new-instance v4, Lcom/drew/imaging/tiff/TiffProcessingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unclear distinction between Motorola/Intel byte ordering: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/drew/imaging/tiff/TiffProcessingException;-><init>(Ljava/lang/String;)V

    throw v4
.end method
