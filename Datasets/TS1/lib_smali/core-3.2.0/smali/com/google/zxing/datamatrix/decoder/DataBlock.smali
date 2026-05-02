.class final Lcom/google/zxing/datamatrix/decoder/DataBlock;
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
    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    .line 33
    iput-object p2, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    .line 34
    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .registers 29
    .param p0, "rawCodewords"    # [B
    .param p1, "version"    # Lcom/google/zxing/datamatrix/decoder/Version;

    .prologue
    .line 49
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getECBlocks()Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    move-result-object v4

    .line 52
    .local v4, "ecBlocks":Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;
    const/16 v22, 0x0

    .line 53
    .local v22, "totalBlocks":I
    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    move-result-object v3

    .line 54
    .local v3, "ecBlockArray":[Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    array-length v0, v3

    move/from16 v24, v0

    const/16 v23, 0x0

    :goto_f
    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_20

    aget-object v2, v3, v23

    .line 55
    .local v2, "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v25

    add-int v22, v22, v25

    .line 54
    add-int/lit8 v23, v23, 0x1

    goto :goto_f

    .line 59
    .end local v2    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    :cond_20
    move/from16 v0, v22

    new-array v0, v0, [Lcom/google/zxing/datamatrix/decoder/DataBlock;

    move-object/from16 v19, v0

    .line 60
    .local v19, "result":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    const/4 v15, 0x0

    .line 61
    .local v15, "numResultBlocks":I
    array-length v0, v3

    move/from16 v24, v0

    const/16 v23, 0x0

    :goto_2c
    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_60

    aget-object v2, v3, v23

    .line 62
    .restart local v2    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_35
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v25

    move/from16 v0, v25

    if-ge v5, v0, :cond_5d

    .line 63
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getDataCodewords()I

    move-result v13

    .line 64
    .local v13, "numDataCodewords":I
    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v25

    add-int v12, v25, v13

    .line 65
    .local v12, "numBlockCodewords":I
    add-int/lit8 v16, v15, 0x1

    .end local v15    # "numResultBlocks":I
    .local v16, "numResultBlocks":I
    new-instance v25, Lcom/google/zxing/datamatrix/decoder/DataBlock;

    new-array v0, v12, [B

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-direct {v0, v13, v1}, Lcom/google/zxing/datamatrix/decoder/DataBlock;-><init>(I[B)V

    aput-object v25, v19, v15

    .line 62
    add-int/lit8 v5, v5, 0x1

    move/from16 v15, v16

    .end local v16    # "numResultBlocks":I
    .restart local v15    # "numResultBlocks":I
    goto :goto_35

    .line 61
    .end local v12    # "numBlockCodewords":I
    .end local v13    # "numDataCodewords":I
    :cond_5d
    add-int/lit8 v23, v23, 0x1

    goto :goto_2c

    .line 72
    .end local v2    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    .end local v5    # "i":I
    :cond_60
    const/16 v23, 0x0

    aget-object v23, v19, v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v10, v0

    .line 75
    .local v10, "longerBlocksTotalCodewords":I
    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v23

    sub-int v9, v10, v23

    .line 76
    .local v9, "longerBlocksNumDataCodewords":I
    add-int/lit8 v20, v9, -0x1

    .line 79
    .local v20, "shorterBlocksNumDataCodewords":I
    const/16 v17, 0x0

    .line 80
    .local v17, "rawCodewordsOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_78
    move/from16 v0, v20

    if-ge v5, v0, :cond_99

    .line 81
    const/4 v7, 0x0

    .local v7, "j":I
    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .local v18, "rawCodewordsOffset":I
    :goto_7f
    if-ge v7, v15, :cond_94

    .line 82
    aget-object v23, v19, v7

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    move-object/from16 v23, v0

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    aget-byte v24, p0, v18

    aput-byte v24, v23, v5

    .line 81
    add-int/lit8 v7, v7, 0x1

    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .restart local v18    # "rawCodewordsOffset":I
    goto :goto_7f

    .line 80
    :cond_94
    add-int/lit8 v5, v5, 0x1

    move/from16 v17, v18

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    goto :goto_78

    .line 87
    .end local v7    # "j":I
    :cond_99
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getVersionNumber()I

    move-result v23

    const/16 v24, 0x18

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_c5

    const/16 v21, 0x1

    .line 88
    .local v21, "specialVersion":Z
    :goto_a7
    if-eqz v21, :cond_c8

    const/16 v14, 0x8

    .line 89
    .local v14, "numLongerBlocks":I
    :goto_ab
    const/4 v7, 0x0

    .restart local v7    # "j":I
    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .restart local v18    # "rawCodewordsOffset":I
    :goto_ae
    if-ge v7, v14, :cond_ca

    .line 90
    aget-object v23, v19, v7

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    move-object/from16 v23, v0

    add-int/lit8 v24, v9, -0x1

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    aget-byte v25, p0, v18

    aput-byte v25, v23, v24

    .line 89
    add-int/lit8 v7, v7, 0x1

    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .restart local v18    # "rawCodewordsOffset":I
    goto :goto_ae

    .line 87
    .end local v7    # "j":I
    .end local v14    # "numLongerBlocks":I
    .end local v18    # "rawCodewordsOffset":I
    .end local v21    # "specialVersion":Z
    .restart local v17    # "rawCodewordsOffset":I
    :cond_c5
    const/16 v21, 0x0

    goto :goto_a7

    .restart local v21    # "specialVersion":Z
    :cond_c8
    move v14, v15

    .line 88
    goto :goto_ab

    .line 94
    .end local v17    # "rawCodewordsOffset":I
    .restart local v7    # "j":I
    .restart local v14    # "numLongerBlocks":I
    .restart local v18    # "rawCodewordsOffset":I
    :cond_ca
    const/16 v23, 0x0

    aget-object v23, v19, v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v11, v0

    .line 95
    .local v11, "max":I
    move v5, v9

    move/from16 v17, v18

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    :goto_da
    if-ge v5, v11, :cond_10d

    .line 96
    const/4 v7, 0x0

    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .restart local v18    # "rawCodewordsOffset":I
    :goto_df
    if-ge v7, v15, :cond_108

    .line 97
    if-eqz v21, :cond_104

    add-int/lit8 v23, v7, 0x8

    rem-int v8, v23, v15

    .line 98
    .local v8, "jOffset":I
    :goto_e7
    if-eqz v21, :cond_106

    const/16 v23, 0x7

    move/from16 v0, v23

    if-le v8, v0, :cond_106

    add-int/lit8 v6, v5, -0x1

    .line 99
    .local v6, "iOffset":I
    :goto_f1
    aget-object v23, v19, v8

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    move-object/from16 v23, v0

    add-int/lit8 v17, v18, 0x1

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    aget-byte v24, p0, v18

    aput-byte v24, v23, v6

    .line 96
    add-int/lit8 v7, v7, 0x1

    move/from16 v18, v17

    .end local v17    # "rawCodewordsOffset":I
    .restart local v18    # "rawCodewordsOffset":I
    goto :goto_df

    .end local v6    # "iOffset":I
    .end local v8    # "jOffset":I
    :cond_104
    move v8, v7

    .line 97
    goto :goto_e7

    .restart local v8    # "jOffset":I
    :cond_106
    move v6, v5

    .line 98
    goto :goto_f1

    .line 95
    .end local v8    # "jOffset":I
    :cond_108
    add-int/lit8 v5, v5, 0x1

    move/from16 v17, v18

    .end local v18    # "rawCodewordsOffset":I
    .restart local v17    # "rawCodewordsOffset":I
    goto :goto_da

    .line 103
    :cond_10d
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v17

    move/from16 v1, v23

    if-eq v0, v1, :cond_11e

    .line 104
    new-instance v23, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v23 .. v23}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v23

    .line 107
    :cond_11e
    return-object v19
.end method


# virtual methods
.method getCodewords()[B
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
