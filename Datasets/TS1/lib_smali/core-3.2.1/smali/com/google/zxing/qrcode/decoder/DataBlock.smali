.class final Lcom/google/zxing/qrcode/decoder/DataBlock;
.super Ljava/lang/Object;
.source "DataBlock.java"


# instance fields
.field private final codewords:[B

.field private final numDataCodewords:I


# direct methods
.method private constructor <init>(I[B)V
    .registers 3
    .param p1, "numDataCodewords"    # I
    .param p2, "codewords"    # [B

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    .line 33
    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    .line 34
    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;
    .registers 28
    .param p0, "rawCodewords"    # [B
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    .prologue
    .line 51
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v21, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_15

    .line 52
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 57
    :cond_15
    invoke-virtual/range {p1 .. p2}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v4

    .line 60
    .local v4, "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    const/16 v20, 0x0

    .line 61
    .local v20, "totalBlocks":I
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v3

    .line 62
    .local v3, "ecBlockArray":[Lcom/google/zxing/qrcode/decoder/Version$ECB;
    array-length v0, v3

    move/from16 v22, v0

    const/16 v21, 0x0

    :goto_24
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_35

    aget-object v2, v3, v21

    .line 63
    .local v2, "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v23

    add-int v20, v20, v23

    .line 62
    add-int/lit8 v21, v21, 0x1

    goto :goto_24

    .line 67
    .end local v2    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    :cond_35
    move/from16 v0, v20

    new-array v0, v0, [Lcom/google/zxing/qrcode/decoder/DataBlock;

    move-object/from16 v17, v0

    .line 68
    .local v17, "result":[Lcom/google/zxing/qrcode/decoder/DataBlock;
    const/4 v13, 0x0

    .line 69
    .local v13, "numResultBlocks":I
    array-length v0, v3

    move/from16 v22, v0

    const/16 v21, 0x0

    :goto_41
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_74

    aget-object v2, v3, v21

    .line 70
    .restart local v2    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4a
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v23

    move/from16 v0, v23

    if-ge v5, v0, :cond_71

    .line 71
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v12

    .line 72
    .local v12, "numDataCodewords":I
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v23

    add-int v10, v23, v12

    .line 73
    .local v10, "numBlockCodewords":I
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "numResultBlocks":I
    .local v14, "numResultBlocks":I
    new-instance v23, Lcom/google/zxing/qrcode/decoder/DataBlock;

    new-array v0, v10, [B

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-direct {v0, v12, v1}, Lcom/google/zxing/qrcode/decoder/DataBlock;-><init>(I[B)V

    aput-object v23, v17, v13

    .line 70
    add-int/lit8 v5, v5, 0x1

    move v13, v14

    .end local v14    # "numResultBlocks":I
    .restart local v13    # "numResultBlocks":I
    goto :goto_4a

    .line 69
    .end local v10    # "numBlockCodewords":I
    .end local v12    # "numDataCodewords":I
    :cond_71
    add-int/lit8 v21, v21, 0x1

    goto :goto_41

    .line 79
    .end local v2    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    .end local v5    # "i":I
    :cond_74
    const/16 v21, 0x0

    aget-object v21, v17, v21

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v19, v0

    .line 80
    .local v19, "shorterBlocksTotalCodewords":I
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v21, v0

    add-int/lit8 v8, v21, -0x1

    .line 81
    .local v8, "longerBlocksStartAt":I
    :goto_8a
    if-ltz v8, :cond_9b

    .line 82
    aget-object v21, v17, v8

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v11, v0

    .line 83
    .local v11, "numCodewords":I
    move/from16 v0, v19

    if-ne v11, v0, :cond_c1

    .line 88
    .end local v11    # "numCodewords":I
    :cond_9b
    add-int/lit8 v8, v8, 0x1

    .line 90
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v21

    sub-int v18, v19, v21

    .line 93
    .local v18, "shorterBlocksNumDataCodewords":I
    const/4 v15, 0x0

    .line 94
    .local v15, "rawCodewordsOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_a5
    move/from16 v0, v18

    if-ge v5, v0, :cond_c9

    .line 95
    const/4 v7, 0x0

    .local v7, "j":I
    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .local v16, "rawCodewordsOffset":I
    :goto_ac
    if-ge v7, v13, :cond_c4

    .line 96
    aget-object v21, v17, v7

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    aget-byte v22, p0, v16

    aput-byte v22, v21, v5

    .line 95
    add-int/lit8 v7, v7, 0x1

    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .restart local v16    # "rawCodewordsOffset":I
    goto :goto_ac

    .line 86
    .end local v5    # "i":I
    .end local v7    # "j":I
    .end local v16    # "rawCodewordsOffset":I
    .end local v18    # "shorterBlocksNumDataCodewords":I
    .restart local v11    # "numCodewords":I
    :cond_c1
    add-int/lit8 v8, v8, -0x1

    .line 87
    goto :goto_8a

    .line 94
    .end local v11    # "numCodewords":I
    .restart local v5    # "i":I
    .restart local v7    # "j":I
    .restart local v16    # "rawCodewordsOffset":I
    .restart local v18    # "shorterBlocksNumDataCodewords":I
    :cond_c4
    add-int/lit8 v5, v5, 0x1

    move/from16 v15, v16

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    goto :goto_a5

    .line 100
    .end local v7    # "j":I
    :cond_c9
    move v7, v8

    .restart local v7    # "j":I
    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .restart local v16    # "rawCodewordsOffset":I
    :goto_cc
    if-ge v7, v13, :cond_e1

    .line 101
    aget-object v21, v17, v7

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    aget-byte v22, p0, v16

    aput-byte v22, v21, v18

    .line 100
    add-int/lit8 v7, v7, 0x1

    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .restart local v16    # "rawCodewordsOffset":I
    goto :goto_cc

    .line 104
    :cond_e1
    const/16 v21, 0x0

    aget-object v21, v17, v21

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v9, v0

    .line 105
    .local v9, "max":I
    move/from16 v5, v18

    move/from16 v15, v16

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    :goto_f2
    if-ge v5, v9, :cond_117

    .line 106
    const/4 v7, 0x0

    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .restart local v16    # "rawCodewordsOffset":I
    :goto_f7
    if-ge v7, v13, :cond_112

    .line 107
    if-ge v7, v8, :cond_10f

    move v6, v5

    .line 108
    .local v6, "iOffset":I
    :goto_fc
    aget-object v21, v17, v7

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    move-object/from16 v21, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    aget-byte v22, p0, v16

    aput-byte v22, v21, v6

    .line 106
    add-int/lit8 v7, v7, 0x1

    move/from16 v16, v15

    .end local v15    # "rawCodewordsOffset":I
    .restart local v16    # "rawCodewordsOffset":I
    goto :goto_f7

    .line 107
    .end local v6    # "iOffset":I
    :cond_10f
    add-int/lit8 v6, v5, 0x1

    goto :goto_fc

    .line 105
    :cond_112
    add-int/lit8 v5, v5, 0x1

    move/from16 v15, v16

    .end local v16    # "rawCodewordsOffset":I
    .restart local v15    # "rawCodewordsOffset":I
    goto :goto_f2

    .line 111
    :cond_117
    return-object v17
.end method


# virtual methods
.method getCodewords()[B
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
