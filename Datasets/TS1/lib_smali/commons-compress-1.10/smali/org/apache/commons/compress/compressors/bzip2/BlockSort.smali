.class Lorg/apache/commons/compress/compressors/bzip2/BlockSort;
.super Ljava/lang/Object;
.source "BlockSort.java"


# static fields
.field private static final CLEARMASK:I = -0x200001

.field private static final DEPTH_THRESH:I = 0xa

.field private static final FALLBACK_QSORT_SMALL_THRESH:I = 0xa

.field private static final FALLBACK_QSORT_STACK_SIZE:I = 0x64

.field private static final INCS:[I

.field private static final QSORT_STACK_SIZE:I = 0x3e8

.field private static final SETMASK:I = 0x200000

.field private static final SMALL_THRESH:I = 0x14

.field private static final STACK_SIZE:I = 0x3e8

.field private static final WORK_FACTOR:I = 0x1e


# instance fields
.field private eclass:[I

.field private firstAttempt:Z

.field private final ftab:[I

.field private final mainSort_bigDone:[Z

.field private final mainSort_copy:[I

.field private final mainSort_runningOrder:[I

.field private final quadrant:[C

.field private final stack_dd:[I

.field private final stack_hh:[I

.field private final stack_ll:[I

.field private workDone:I

.field private workLimit:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 580
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->INCS:[I

    return-void

    :array_a
    .array-data 4
        0x1
        0x4
        0xd
        0x28
        0x79
        0x16c
        0x445
        0xcd0
        0x2671
        0x7354
        0x159fd
        0x40df8
        0xc29e9
        0x247dbc
    .end array-data
.end method

.method constructor <init>(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;)V
    .registers 5
    .param p1, "data"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .prologue
    const/16 v2, 0x3e8

    const/16 v1, 0x100

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_ll:[I

    .line 133
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_hh:[I

    .line 134
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_dd:[I

    .line 136
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_runningOrder:[I

    .line 137
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_copy:[I

    .line 138
    new-array v0, v1, [Z

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_bigDone:[Z

    .line 140
    const v0, 0x10001

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->ftab:[I

    .line 150
    iget-object v0, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sfmap:[C

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->quadrant:[C

    .line 151
    return-void
.end method

.method private fallbackQSort3([I[III)V
    .registers 30
    .param p1, "fmap"    # [I
    .param p2, "eclass"    # [I
    .param p3, "loSt"    # I
    .param p4, "hiSt"    # I

    .prologue
    .line 348
    const-wide/16 v12, 0x0

    .line 349
    .local v12, "r":J
    const/16 v17, 0x0

    .line 350
    .local v17, "sp":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "sp":I
    .local v18, "sp":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpush(III)V

    move/from16 v17, v18

    .line 352
    .end local v18    # "sp":I
    .restart local v17    # "sp":I
    :cond_13
    :goto_13
    if-lez v17, :cond_156

    .line 353
    add-int/lit8 v17, v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpop(I)[I

    move-result-object v16

    .line 354
    .local v16, "s":[I
    const/16 v21, 0x0

    aget v6, v16, v21

    .local v6, "lo":I
    const/16 v21, 0x1

    aget v5, v16, v21

    .line 356
    .local v5, "hi":I
    sub-int v21, v5, v6

    const/16 v22, 0xa

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_3b

    .line 357
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v6, v5}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fallbackSimpleSort([I[III)V

    goto :goto_13

    .line 368
    :cond_3b
    const-wide/16 v21, 0x1dc5

    mul-long v21, v21, v12

    const-wide/16 v23, 0x1

    add-long v21, v21, v23

    const-wide/32 v23, 0x8000

    rem-long v12, v21, v23

    .line 369
    const-wide/16 v21, 0x3

    rem-long v14, v12, v21

    .line 370
    .local v14, "r3":J
    const-wide/16 v21, 0x0

    cmp-long v21, v14, v21

    if-nez v21, :cond_d5

    .line 371
    aget v21, p1, v6

    aget v21, p2, v21

    move/from16 v0, v21

    int-to-long v9, v0

    .line 378
    .local v9, "med":J
    :goto_59
    move v7, v6

    .local v7, "ltLo":I
    move/from16 v20, v6

    .line 379
    .local v20, "unLo":I
    move v4, v5

    .local v4, "gtHi":I
    move/from16 v19, v5

    .line 385
    .local v19, "unHi":I
    :goto_5f
    move/from16 v0, v20

    move/from16 v1, v19

    if-le v0, v1, :cond_f1

    .line 400
    :cond_65
    :goto_65
    move/from16 v0, v20

    move/from16 v1, v19

    if-le v0, v1, :cond_111

    .line 414
    :cond_6b
    move/from16 v0, v20

    move/from16 v1, v19

    if-le v0, v1, :cond_131

    .line 420
    if-lt v4, v7, :cond_13

    .line 424
    sub-int v21, v7, v6

    sub-int v22, v20, v7

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fmin(II)I

    move-result v11

    .line 425
    .local v11, "n":I
    sub-int v21, v20, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v21

    invoke-direct {v0, v1, v6, v2, v11}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fvswap([IIII)V

    .line 426
    sub-int v21, v5, v4

    sub-int v22, v4, v19

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fmin(II)I

    move-result v8

    .line 427
    .local v8, "m":I
    add-int/lit8 v21, v19, 0x1

    sub-int v22, v5, v8

    add-int/lit8 v22, v22, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v2, v3, v8}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fvswap([IIII)V

    .line 429
    add-int v21, v6, v20

    sub-int v21, v21, v7

    add-int/lit8 v11, v21, -0x1

    .line 430
    sub-int v21, v4, v19

    sub-int v21, v5, v21

    add-int/lit8 v8, v21, 0x1

    .line 432
    sub-int v21, v11, v6

    sub-int v22, v5, v8

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_142

    .line 433
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "sp":I
    .restart local v18    # "sp":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1, v6, v11}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpush(III)V

    .line 434
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "sp":I
    .restart local v17    # "sp":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1, v8, v5}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpush(III)V

    goto/16 :goto_13

    .line 372
    .end local v4    # "gtHi":I
    .end local v7    # "ltLo":I
    .end local v8    # "m":I
    .end local v9    # "med":J
    .end local v11    # "n":I
    .end local v19    # "unHi":I
    .end local v20    # "unLo":I
    :cond_d5
    const-wide/16 v21, 0x1

    cmp-long v21, v14, v21

    if-nez v21, :cond_e8

    .line 373
    add-int v21, v6, v5

    ushr-int/lit8 v21, v21, 0x1

    aget v21, p1, v21

    aget v21, p2, v21

    move/from16 v0, v21

    int-to-long v9, v0

    .restart local v9    # "med":J
    goto/16 :goto_59

    .line 375
    .end local v9    # "med":J
    :cond_e8
    aget v21, p1, v5

    aget v21, p2, v21

    move/from16 v0, v21

    int-to-long v9, v0

    .restart local v9    # "med":J
    goto/16 :goto_59

    .line 388
    .restart local v4    # "gtHi":I
    .restart local v7    # "ltLo":I
    .restart local v19    # "unHi":I
    .restart local v20    # "unLo":I
    :cond_f1
    aget v21, p1, v20

    aget v21, p2, v21

    long-to-int v0, v9

    move/from16 v22, v0

    sub-int v11, v21, v22

    .line 389
    .restart local v11    # "n":I
    if-nez v11, :cond_10b

    .line 390
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v7}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fswap([III)V

    .line 391
    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v20, v20, 0x1

    .line 392
    goto/16 :goto_5f

    .line 394
    :cond_10b
    if-gtz v11, :cond_65

    .line 397
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_5f

    .line 403
    .end local v11    # "n":I
    :cond_111
    aget v21, p1, v19

    aget v21, p2, v21

    long-to-int v0, v9

    move/from16 v22, v0

    sub-int v11, v21, v22

    .line 404
    .restart local v11    # "n":I
    if-nez v11, :cond_12b

    .line 405
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    invoke-direct {v0, v1, v2, v4}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fswap([III)V

    .line 406
    add-int/lit8 v4, v4, -0x1

    add-int/lit8 v19, v19, -0x1

    .line 407
    goto/16 :goto_65

    .line 409
    :cond_12b
    if-ltz v11, :cond_6b

    .line 412
    add-int/lit8 v19, v19, -0x1

    goto/16 :goto_65

    .line 417
    .end local v11    # "n":I
    :cond_131
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v20

    move/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fswap([III)V

    add-int/lit8 v20, v20, 0x1

    add-int/lit8 v19, v19, -0x1

    goto/16 :goto_5f

    .line 436
    .restart local v8    # "m":I
    .restart local v11    # "n":I
    :cond_142
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "sp":I
    .restart local v18    # "sp":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1, v8, v5}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpush(III)V

    .line 437
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "sp":I
    .restart local v17    # "sp":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1, v6, v11}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fpush(III)V

    goto/16 :goto_13

    .line 440
    .end local v4    # "gtHi":I
    .end local v5    # "hi":I
    .end local v6    # "lo":I
    .end local v7    # "ltLo":I
    .end local v8    # "m":I
    .end local v9    # "med":J
    .end local v11    # "n":I
    .end local v14    # "r3":J
    .end local v16    # "s":[I
    .end local v19    # "unHi":I
    .end local v20    # "unLo":I
    :cond_156
    return-void
.end method

.method private fallbackSimpleSort([I[III)V
    .registers 11
    .param p1, "fmap"    # [I
    .param p2, "eclass"    # [I
    .param p3, "lo"    # I
    .param p4, "hi"    # I

    .prologue
    .line 271
    if-ne p3, p4, :cond_3

    .line 296
    :cond_2
    return-void

    .line 276
    :cond_3
    sub-int v4, p4, p3

    const/4 v5, 0x3

    if-le v4, v5, :cond_2a

    .line 277
    add-int/lit8 v1, p4, -0x4

    .local v1, "i":I
    :goto_a
    if-lt v1, p3, :cond_2a

    .line 278
    aget v3, p1, v1

    .line 279
    .local v3, "tmp":I
    aget v0, p2, v3

    .line 280
    .local v0, "ec_tmp":I
    add-int/lit8 v2, v1, 0x4

    .local v2, "j":I
    :goto_12
    if-gt v2, p4, :cond_23

    aget v4, p1, v2

    aget v4, p2, v4

    if-le v0, v4, :cond_23

    .line 282
    add-int/lit8 v4, v2, -0x4

    aget v5, p1, v2

    aput v5, p1, v4

    .line 281
    add-int/lit8 v2, v2, 0x4

    goto :goto_12

    .line 284
    :cond_23
    add-int/lit8 v4, v2, -0x4

    aput v3, p1, v4

    .line 277
    add-int/lit8 v1, v1, -0x1

    goto :goto_a

    .line 288
    .end local v0    # "ec_tmp":I
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "tmp":I
    :cond_2a
    add-int/lit8 v1, p4, -0x1

    .restart local v1    # "i":I
    :goto_2c
    if-lt v1, p3, :cond_2

    .line 289
    aget v3, p1, v1

    .line 290
    .restart local v3    # "tmp":I
    aget v0, p2, v3

    .line 291
    .restart local v0    # "ec_tmp":I
    add-int/lit8 v2, v1, 0x1

    .restart local v2    # "j":I
    :goto_34
    if-gt v2, p4, :cond_45

    aget v4, p1, v2

    aget v4, p2, v4

    if-le v0, v4, :cond_45

    .line 292
    add-int/lit8 v4, v2, -0x1

    aget v5, p1, v2

    aput v5, p1, v4

    .line 291
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 294
    :cond_45
    add-int/lit8 v4, v2, -0x1

    aput v3, p1, v4

    .line 288
    add-int/lit8 v1, v1, -0x1

    goto :goto_2c
.end method

.method private fmin(II)I
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .prologue
    .line 320
    if-ge p1, p2, :cond_3

    .end local p1    # "a":I
    :goto_2
    return p1

    .restart local p1    # "a":I
    :cond_3
    move p1, p2

    goto :goto_2
.end method

.method private fpop(I)[I
    .registers 5
    .param p1, "sp"    # I

    .prologue
    .line 329
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_ll:[I

    aget v2, v2, p1

    aput v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_hh:[I

    aget v2, v2, p1

    aput v2, v0, v1

    return-object v0
.end method

.method private fpush(III)V
    .registers 5
    .param p1, "sp"    # I
    .param p2, "lz"    # I
    .param p3, "hz"    # I

    .prologue
    .line 324
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_ll:[I

    aput p2, v0, p1

    .line 325
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_hh:[I

    aput p3, v0, p1

    .line 326
    return-void
.end method

.method private fswap([III)V
    .registers 6
    .param p1, "fmap"    # [I
    .param p2, "zz1"    # I
    .param p3, "zz2"    # I

    .prologue
    .line 304
    aget v0, p1, p2

    .line 305
    .local v0, "zztmp":I
    aget v1, p1, p3

    aput v1, p1, p2

    .line 306
    aput v0, p1, p3

    .line 307
    return-void
.end method

.method private fvswap([IIII)V
    .registers 5
    .param p1, "fmap"    # [I
    .param p2, "yyp1"    # I
    .param p3, "yyp2"    # I
    .param p4, "yyn"    # I

    .prologue
    .line 313
    :goto_0
    if-lez p4, :cond_c

    .line 314
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fswap([III)V

    .line 315
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p3, p3, 0x1

    add-int/lit8 p4, p4, -0x1

    goto :goto_0

    .line 317
    :cond_c
    return-void
.end method

.method private getEclass()[I
    .registers 2

    .prologue
    .line 448
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->eclass:[I

    if-nez v0, :cond_e

    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->quadrant:[C

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->eclass:[I

    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->eclass:[I

    goto :goto_d
.end method

.method private mainQSort3(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;IIII)V
    .registers 33
    .param p1, "dataShadow"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p2, "loSt"    # I
    .param p3, "hiSt"    # I
    .param p4, "dSt"    # I
    .param p5, "last"    # I

    .prologue
    .line 810
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_ll:[I

    move-object/from16 v21, v0

    .line 811
    .local v21, "stack_ll":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_hh:[I

    move-object/from16 v20, v0

    .line 812
    .local v20, "stack_hh":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->stack_dd:[I

    move-object/from16 v19, v0

    .line 813
    .local v19, "stack_dd":[I
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    .line 814
    .local v10, "fmap":[I
    move-object/from16 v0, p1

    iget-object v8, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 816
    .local v8, "block":[B
    const/4 v2, 0x0

    aput p2, v21, v2

    .line 817
    const/4 v2, 0x0

    aput p3, v20, v2

    .line 818
    const/4 v2, 0x0

    aput p4, v19, v2

    .line 820
    const/16 v18, 0x1

    .local v18, "sp":I
    :cond_25
    :goto_25
    add-int/lit8 v18, v18, -0x1

    if-ltz v18, :cond_45

    .line 821
    aget v4, v21, v18

    .line 822
    .local v4, "lo":I
    aget v5, v20, v18

    .line 823
    .local v5, "hi":I
    aget v6, v19, v18

    .line 825
    .local v6, "d":I
    sub-int v2, v5, v4

    const/16 v3, 0x14

    if-lt v2, v3, :cond_39

    const/16 v2, 0xa

    if-le v6, v2, :cond_46

    :cond_39
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v7, p5

    .line 826
    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSimpleSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;IIII)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 910
    .end local v4    # "lo":I
    .end local v5    # "hi":I
    .end local v6    # "d":I
    :cond_45
    return-void

    .line 830
    .restart local v4    # "lo":I
    .restart local v5    # "hi":I
    .restart local v6    # "d":I
    :cond_46
    add-int/lit8 v9, v6, 0x1

    .line 831
    .local v9, "d1":I
    aget v2, v10, v4

    add-int/2addr v2, v9

    aget-byte v2, v8, v2

    aget v3, v10, v5

    add-int/2addr v3, v9

    aget-byte v3, v8, v3

    add-int v7, v4, v5

    ushr-int/lit8 v7, v7, 0x1

    aget v7, v10, v7

    add-int/2addr v7, v9

    aget-byte v7, v8, v7

    invoke-static {v2, v3, v7}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->med3(BBB)B

    move-result v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v16, v0

    .line 834
    .local v16, "med":I
    move/from16 v25, v4

    .line 835
    .local v25, "unLo":I
    move/from16 v23, v5

    .line 836
    .local v23, "unHi":I
    move v13, v4

    .line 837
    .local v13, "ltLo":I
    move v11, v5

    .local v11, "gtHi":I
    move v14, v13

    .end local v13    # "ltLo":I
    .local v14, "ltLo":I
    move/from16 v26, v25

    .line 840
    .end local v25    # "unLo":I
    .local v26, "unLo":I
    :goto_6c
    move/from16 v0, v26

    move/from16 v1, v23

    if-gt v0, v1, :cond_12b

    .line 841
    aget v2, v10, v26

    add-int/2addr v2, v9

    aget-byte v2, v8, v2

    and-int/lit16 v2, v2, 0xff

    sub-int v17, v2, v16

    .line 843
    .local v17, "n":I
    if-nez v17, :cond_8d

    .line 844
    aget v22, v10, v26

    .line 845
    .local v22, "temp":I
    add-int/lit8 v25, v26, 0x1

    .end local v26    # "unLo":I
    .restart local v25    # "unLo":I
    aget v2, v10, v14

    aput v2, v10, v26

    .line 846
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "ltLo":I
    .restart local v13    # "ltLo":I
    aput v22, v10, v14

    .end local v22    # "temp":I
    :goto_89
    move v14, v13

    .end local v13    # "ltLo":I
    .restart local v14    # "ltLo":I
    move/from16 v26, v25

    .line 852
    .end local v25    # "unLo":I
    .restart local v26    # "unLo":I
    goto :goto_6c

    .line 847
    :cond_8d
    if-gez v17, :cond_12b

    .line 848
    add-int/lit8 v25, v26, 0x1

    .end local v26    # "unLo":I
    .restart local v25    # "unLo":I
    move v13, v14

    .end local v14    # "ltLo":I
    .restart local v13    # "ltLo":I
    goto :goto_89

    .line 854
    .end local v11    # "gtHi":I
    .end local v13    # "ltLo":I
    .end local v17    # "n":I
    .end local v23    # "unHi":I
    .end local v25    # "unLo":I
    .local v12, "gtHi":I
    .restart local v14    # "ltLo":I
    .local v24, "unHi":I
    .restart local v26    # "unLo":I
    :goto_93
    move/from16 v0, v26

    move/from16 v1, v24

    if-gt v0, v1, :cond_ba

    .line 855
    aget v2, v10, v24

    add-int/2addr v2, v9

    aget-byte v2, v8, v2

    and-int/lit16 v2, v2, 0xff

    sub-int v17, v2, v16

    .line 857
    .restart local v17    # "n":I
    if-nez v17, :cond_b4

    .line 858
    aget v22, v10, v24

    .line 859
    .restart local v22    # "temp":I
    add-int/lit8 v23, v24, -0x1

    .end local v24    # "unHi":I
    .restart local v23    # "unHi":I
    aget v2, v10, v12

    aput v2, v10, v24

    .line 860
    add-int/lit8 v11, v12, -0x1

    .end local v12    # "gtHi":I
    .restart local v11    # "gtHi":I
    aput v22, v10, v12

    .end local v22    # "temp":I
    :goto_b0
    move v12, v11

    .end local v11    # "gtHi":I
    .restart local v12    # "gtHi":I
    move/from16 v24, v23

    .line 866
    .end local v23    # "unHi":I
    .restart local v24    # "unHi":I
    goto :goto_93

    .line 861
    :cond_b4
    if-lez v17, :cond_ba

    .line 862
    add-int/lit8 v23, v24, -0x1

    .end local v24    # "unHi":I
    .restart local v23    # "unHi":I
    move v11, v12

    .end local v12    # "gtHi":I
    .restart local v11    # "gtHi":I
    goto :goto_b0

    .line 868
    .end local v11    # "gtHi":I
    .end local v17    # "n":I
    .end local v23    # "unHi":I
    .restart local v12    # "gtHi":I
    .restart local v24    # "unHi":I
    :cond_ba
    move/from16 v0, v26

    move/from16 v1, v24

    if-gt v0, v1, :cond_d0

    .line 869
    aget v22, v10, v26

    .line 870
    .restart local v22    # "temp":I
    add-int/lit8 v25, v26, 0x1

    .end local v26    # "unLo":I
    .restart local v25    # "unLo":I
    aget v2, v10, v24

    aput v2, v10, v26

    .line 871
    add-int/lit8 v23, v24, -0x1

    .end local v24    # "unHi":I
    .restart local v23    # "unHi":I
    aput v22, v10, v24

    move v11, v12

    .end local v12    # "gtHi":I
    .restart local v11    # "gtHi":I
    move/from16 v26, v25

    .line 872
    .end local v25    # "unLo":I
    .restart local v26    # "unLo":I
    goto :goto_6c

    .line 877
    .end local v11    # "gtHi":I
    .end local v22    # "temp":I
    .end local v23    # "unHi":I
    .restart local v12    # "gtHi":I
    .restart local v24    # "unHi":I
    :cond_d0
    if-ge v12, v14, :cond_dc

    .line 878
    aput v4, v21, v18

    .line 879
    aput v5, v20, v18

    .line 880
    aput v9, v19, v18

    .line 881
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_25

    .line 883
    :cond_dc
    sub-int v2, v14, v4

    sub-int v3, v26, v14

    if-ge v2, v3, :cond_125

    sub-int v17, v14, v4

    .line 885
    .restart local v17    # "n":I
    :goto_e4
    sub-int v2, v26, v17

    move/from16 v0, v17

    invoke-static {v10, v4, v2, v0}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->vswap([IIII)V

    .line 886
    sub-int v2, v5, v12

    sub-int v3, v12, v24

    if-ge v2, v3, :cond_128

    sub-int v15, v5, v12

    .line 888
    .local v15, "m":I
    :goto_f3
    sub-int v2, v5, v15

    add-int/lit8 v2, v2, 0x1

    move/from16 v0, v26

    invoke-static {v10, v0, v2, v15}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->vswap([IIII)V

    .line 890
    add-int v2, v4, v26

    sub-int/2addr v2, v14

    add-int/lit8 v17, v2, -0x1

    .line 891
    sub-int v2, v12, v24

    sub-int v2, v5, v2

    add-int/lit8 v15, v2, 0x1

    .line 893
    aput v4, v21, v18

    .line 894
    aput v17, v20, v18

    .line 895
    aput v6, v19, v18

    .line 896
    add-int/lit8 v18, v18, 0x1

    .line 898
    add-int/lit8 v2, v17, 0x1

    aput v2, v21, v18

    .line 899
    add-int/lit8 v2, v15, -0x1

    aput v2, v20, v18

    .line 900
    aput v9, v19, v18

    .line 901
    add-int/lit8 v18, v18, 0x1

    .line 903
    aput v15, v21, v18

    .line 904
    aput v5, v20, v18

    .line 905
    aput v6, v19, v18

    .line 906
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_25

    .line 883
    .end local v15    # "m":I
    .end local v17    # "n":I
    :cond_125
    sub-int v17, v26, v14

    goto :goto_e4

    .line 886
    .restart local v17    # "n":I
    :cond_128
    sub-int v15, v12, v24

    goto :goto_f3

    .end local v12    # "gtHi":I
    .end local v17    # "n":I
    .end local v24    # "unHi":I
    .restart local v11    # "gtHi":I
    .restart local v23    # "unHi":I
    :cond_12b
    move v12, v11

    .end local v11    # "gtHi":I
    .restart local v12    # "gtHi":I
    move/from16 v24, v23

    .end local v23    # "unHi":I
    .restart local v24    # "unHi":I
    goto/16 :goto_93
.end method

.method private mainSimpleSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;IIII)Z
    .registers 31
    .param p1, "dataShadow"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p2, "lo"    # I
    .param p3, "hi"    # I
    .param p4, "d"    # I
    .param p5, "lastShadow"    # I

    .prologue
    .line 597
    sub-int v23, p3, p2

    add-int/lit8 v3, v23, 0x1

    .line 598
    .local v3, "bigN":I
    const/16 v23, 0x2

    move/from16 v0, v23

    if-ge v3, v0, :cond_2a

    .line 599
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->firstAttempt:Z

    move/from16 v23, v0

    if-eqz v23, :cond_27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workLimit:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_27

    const/16 v23, 0x1

    .line 775
    :goto_26
    return v23

    .line 599
    :cond_27
    const/16 v23, 0x0

    goto :goto_26

    .line 602
    :cond_2a
    const/4 v8, 0x0

    .line 603
    .local v8, "hp":I
    :goto_2b
    sget-object v23, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->INCS:[I

    aget v23, v23, v8

    move/from16 v0, v23

    if-ge v0, v3, :cond_36

    .line 604
    add-int/lit8 v8, v8, 0x1

    goto :goto_2b

    .line 607
    :cond_36
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    .line 608
    .local v6, "fmap":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->quadrant:[C

    move-object/from16 v17, v0

    .line 609
    .local v17, "quadrant":[C
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 610
    .local v4, "block":[B
    add-int/lit8 v14, p5, 0x1

    .line 611
    .local v14, "lastPlus1":I
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->firstAttempt:Z

    .line 612
    .local v5, "firstAttemptShadow":Z
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workLimit:I

    move/from16 v21, v0

    .line 613
    .local v21, "workLimitShadow":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    move/from16 v20, v0

    .line 618
    .local v20, "workDoneShadow":I
    :cond_56
    add-int/lit8 v8, v8, -0x1

    if-ltz v8, :cond_2be

    .line 619
    sget-object v23, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->INCS:[I

    aget v7, v23, v8

    .line 620
    .local v7, "h":I
    add-int v23, p2, v7

    add-int/lit8 v15, v23, -0x1

    .line 622
    .local v15, "mj":I
    add-int v9, p2, v7

    .local v9, "i":I
    :cond_64
    move/from16 v0, p3

    if-gt v9, v0, :cond_56

    .line 624
    const/4 v13, 0x3

    .local v13, "k":I
    :goto_69
    move/from16 v0, p3

    if-gt v9, v0, :cond_2b2

    add-int/lit8 v13, v13, -0x1

    if-ltz v13, :cond_2b2

    .line 625
    aget v18, v6, v9

    .line 626
    .local v18, "v":I
    add-int v19, v18, p4

    .line 627
    .local v19, "vd":I
    move v12, v9

    .line 639
    .local v12, "j":I
    const/16 v16, 0x0

    .line 640
    .local v16, "onceRunned":Z
    const/4 v2, 0x0

    .line 643
    .local v2, "a":I
    :goto_79
    if-eqz v16, :cond_85

    .line 644
    aput v2, v6, v12

    .line 645
    sub-int/2addr v12, v7

    if-gt v12, v15, :cond_87

    .line 764
    :cond_80
    aput v18, v6, v12

    .line 624
    add-int/lit8 v9, v9, 0x1

    goto :goto_69

    .line 649
    :cond_85
    const/16 v16, 0x1

    .line 652
    :cond_87
    sub-int v23, v12, v7

    aget v2, v6, v23

    .line 653
    add-int v10, v2, p4

    .line 654
    .local v10, "i1":I
    move/from16 v11, v19

    .line 658
    .local v11, "i2":I
    add-int/lit8 v23, v10, 0x1

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_296

    .line 659
    add-int/lit8 v23, v10, 0x2

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_27a

    .line 660
    add-int/lit8 v23, v10, 0x3

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_25e

    .line 661
    add-int/lit8 v23, v10, 0x4

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_242

    .line 662
    add-int/lit8 v23, v10, 0x5

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x5

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_226

    .line 663
    add-int/lit8 v10, v10, 0x6

    aget-byte v23, v4, v10

    add-int/lit8 v11, v11, 0x6

    aget-byte v24, v4, v11

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_20e

    .line 664
    move/from16 v22, p5

    .line 665
    .local v22, "x":I
    :goto_e5
    if-lez v22, :cond_80

    .line 666
    add-int/lit8 v22, v22, -0x4

    .line 668
    add-int/lit8 v23, v10, 0x1

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1f2

    .line 669
    aget-char v23, v17, v10

    aget-char v24, v17, v11

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1e6

    .line 670
    add-int/lit8 v23, v10, 0x2

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1ca

    .line 671
    add-int/lit8 v23, v10, 0x1

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x1

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1ba

    .line 672
    add-int/lit8 v23, v10, 0x3

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_19e

    .line 673
    add-int/lit8 v23, v10, 0x2

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x2

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_18e

    .line 674
    add-int/lit8 v23, v10, 0x4

    aget-byte v23, v4, v23

    add-int/lit8 v24, v11, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_172

    .line 675
    add-int/lit8 v23, v10, 0x3

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x3

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_162

    .line 676
    add-int/lit8 v10, v10, 0x4

    if-lt v10, v14, :cond_15a

    .line 677
    sub-int/2addr v10, v14

    .line 679
    :cond_15a
    add-int/lit8 v11, v11, 0x4

    if-lt v11, v14, :cond_15f

    .line 680
    sub-int/2addr v11, v14

    .line 682
    :cond_15f
    add-int/lit8 v20, v20, 0x1

    .line 683
    goto :goto_e5

    .line 684
    :cond_162
    add-int/lit8 v23, v10, 0x3

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x3

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 689
    :cond_172
    add-int/lit8 v23, v10, 0x4

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 694
    :cond_18e
    add-int/lit8 v23, v10, 0x2

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x2

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 699
    :cond_19e
    add-int/lit8 v23, v10, 0x3

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 704
    :cond_1ba
    add-int/lit8 v23, v10, 0x1

    aget-char v23, v17, v23

    add-int/lit8 v24, v11, 0x1

    aget-char v24, v17, v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 709
    :cond_1ca
    add-int/lit8 v23, v10, 0x2

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 714
    :cond_1e6
    aget-char v23, v17, v10

    aget-char v24, v17, v11

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 719
    :cond_1f2
    add-int/lit8 v23, v10, 0x1

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 729
    .end local v22    # "x":I
    :cond_20e
    aget-byte v23, v4, v10

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    aget-byte v24, v4, v11

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 735
    :cond_226
    add-int/lit8 v23, v10, 0x5

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x5

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 740
    :cond_242
    add-int/lit8 v23, v10, 0x4

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 745
    :cond_25e
    add-int/lit8 v23, v10, 0x3

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 750
    :cond_27a
    add-int/lit8 v23, v10, 0x2

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 755
    :cond_296
    add-int/lit8 v23, v10, 0x1

    aget-byte v23, v4, v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    add-int/lit8 v24, v11, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_80

    goto/16 :goto_79

    .line 767
    .end local v2    # "a":I
    .end local v10    # "i1":I
    .end local v11    # "i2":I
    .end local v12    # "j":I
    .end local v16    # "onceRunned":Z
    .end local v18    # "v":I
    .end local v19    # "vd":I
    :cond_2b2
    if-eqz v5, :cond_64

    move/from16 v0, p3

    if-gt v9, v0, :cond_64

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_64

    .line 774
    .end local v7    # "h":I
    .end local v9    # "i":I
    .end local v13    # "k":I
    .end local v15    # "mj":I
    :cond_2be
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    .line 775
    if-eqz v5, :cond_2d0

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_2d0

    const/16 v23, 0x1

    goto/16 :goto_26

    :cond_2d0
    const/16 v23, 0x0

    goto/16 :goto_26
.end method

.method private static med3(BBB)B
    .registers 3
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 796
    if-ge p0, p1, :cond_b

    if-ge p1, p2, :cond_5

    .end local p1    # "b":B
    :cond_4
    :goto_4
    return p1

    .restart local p1    # "b":B
    :cond_5
    if-ge p0, p2, :cond_9

    move p1, p2

    goto :goto_4

    :cond_9
    move p1, p0

    goto :goto_4

    :cond_b
    if-gt p1, p2, :cond_4

    if-le p0, p2, :cond_11

    move p1, p2

    goto :goto_4

    :cond_11
    move p1, p0

    goto :goto_4
.end method

.method private static vswap([IIII)V
    .registers 8
    .param p0, "fmap"    # [I
    .param p1, "p1"    # I
    .param p2, "p2"    # I
    .param p3, "n"    # I

    .prologue
    .line 787
    add-int/2addr p3, p1

    move v1, p2

    .end local p2    # "p2":I
    .local v1, "p2":I
    move v0, p1

    .line 788
    .end local p1    # "p1":I
    .local v0, "p1":I
    :goto_3
    if-ge v0, p3, :cond_14

    .line 789
    aget v2, p0, v0

    .line 790
    .local v2, "t":I
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "p1":I
    .restart local p1    # "p1":I
    aget v3, p0, v1

    aput v3, p0, v0

    .line 791
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "p2":I
    .restart local p2    # "p2":I
    aput v2, p0, v1

    move v1, p2

    .end local p2    # "p2":I
    .restart local v1    # "p2":I
    move v0, p1

    .line 792
    .end local p1    # "p1":I
    .restart local v0    # "p1":I
    goto :goto_3

    .line 793
    .end local v2    # "t":I
    :cond_14
    return-void
.end method


# virtual methods
.method blockSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V
    .registers 7
    .param p1, "data"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p2, "last"    # I

    .prologue
    .line 154
    mul-int/lit8 v2, p2, 0x1e

    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workLimit:I

    .line 155
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    .line 156
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->firstAttempt:Z

    .line 158
    add-int/lit8 v2, p2, 0x1

    const/16 v3, 0x2710

    if-ge v2, v3, :cond_22

    .line 159
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fallbackSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V

    .line 168
    :cond_13
    :goto_13
    iget-object v0, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    .line 169
    .local v0, "fmap":[I
    const/4 v2, -0x1

    iput v2, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->origPtr:I

    .line 170
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    if-gt v1, p2, :cond_21

    .line 171
    aget v2, v0, v1

    if-nez v2, :cond_33

    .line 172
    iput v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->origPtr:I

    .line 178
    :cond_21
    return-void

    .line 161
    .end local v0    # "fmap":[I
    .end local v1    # "i":I
    :cond_22
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V

    .line 163
    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->firstAttempt:Z

    if-eqz v2, :cond_13

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workLimit:I

    if-le v2, v3, :cond_13

    .line 164
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fallbackSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V

    goto :goto_13

    .line 170
    .restart local v0    # "fmap":[I
    .restart local v1    # "i":I
    :cond_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method final fallbackSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V
    .registers 8
    .param p1, "data"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p2, "last"    # I

    .prologue
    .line 187
    iget-object v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    const/4 v2, 0x0

    iget-object v3, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    add-int/lit8 v4, p2, 0x1

    aget-byte v3, v3, v4

    aput-byte v3, v1, v2

    .line 188
    iget-object v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    iget-object v2, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    add-int/lit8 v3, p2, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fallbackSort([I[BI)V

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    add-int/lit8 v1, p2, 0x1

    if-ge v0, v1, :cond_24

    .line 190
    iget-object v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    aget v2, v1, v0

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, v0

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 192
    :cond_24
    const/4 v0, 0x0

    :goto_25
    add-int/lit8 v1, p2, 0x1

    if-ge v0, v1, :cond_34

    .line 193
    iget-object v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    aget v1, v1, v0

    const/4 v2, -0x1

    if-ne v1, v2, :cond_35

    .line 194
    iget-object v1, p1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    aput p2, v1, v0

    .line 198
    :cond_34
    return-void

    .line 192
    :cond_35
    add-int/lit8 v0, v0, 0x1

    goto :goto_25
.end method

.method final fallbackSort([I[BI)V
    .registers 21
    .param p1, "fmap"    # [I
    .param p2, "block"    # [B
    .param p3, "nblock"    # I

    .prologue
    .line 471
    const/16 v15, 0x101

    new-array v7, v15, [I

    .line 475
    .local v7, "ftab":[I
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->getEclass()[I

    move-result-object v6

    .line 477
    .local v6, "eclass":[I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_9
    move/from16 v0, p3

    if-ge v8, v0, :cond_13

    .line 478
    const/4 v15, 0x0

    aput v15, v6, v8

    .line 477
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 484
    :cond_13
    const/4 v8, 0x0

    :goto_14
    move/from16 v0, p3

    if-ge v8, v0, :cond_25

    .line 485
    aget-byte v15, p2, v8

    and-int/lit16 v15, v15, 0xff

    aget v16, v7, v15

    add-int/lit8 v16, v16, 0x1

    aput v16, v7, v15

    .line 484
    add-int/lit8 v8, v8, 0x1

    goto :goto_14

    .line 487
    :cond_25
    const/4 v8, 0x1

    :goto_26
    const/16 v15, 0x101

    if-ge v8, v15, :cond_37

    .line 488
    aget v15, v7, v8

    add-int/lit8 v16, v8, -0x1

    aget v16, v7, v16

    add-int v15, v15, v16

    aput v15, v7, v8

    .line 487
    add-int/lit8 v8, v8, 0x1

    goto :goto_26

    .line 491
    :cond_37
    const/4 v8, 0x0

    :goto_38
    move/from16 v0, p3

    if-ge v8, v0, :cond_4b

    .line 492
    aget-byte v15, p2, v8

    and-int/lit16 v9, v15, 0xff

    .line 493
    .local v9, "j":I
    aget v15, v7, v9

    add-int/lit8 v10, v15, -0x1

    .line 494
    .local v10, "k":I
    aput v10, v7, v9

    .line 495
    aput v8, p1, v10

    .line 491
    add-int/lit8 v8, v8, 0x1

    goto :goto_38

    .line 498
    .end local v9    # "j":I
    .end local v10    # "k":I
    :cond_4b
    add-int/lit8 v12, p3, 0x40

    .line 499
    .local v12, "nBhtab":I
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v12}, Ljava/util/BitSet;-><init>(I)V

    .line 500
    .local v3, "bhtab":Ljava/util/BitSet;
    const/4 v8, 0x0

    :goto_53
    const/16 v15, 0x100

    if-ge v8, v15, :cond_5f

    .line 501
    aget v15, v7, v8

    invoke-virtual {v3, v15}, Ljava/util/BitSet;->set(I)V

    .line 500
    add-int/lit8 v8, v8, 0x1

    goto :goto_53

    .line 511
    :cond_5f
    const/4 v8, 0x0

    :goto_60
    const/16 v15, 0x20

    if-ge v8, v15, :cond_77

    .line 512
    mul-int/lit8 v15, v8, 0x2

    add-int v15, v15, p3

    invoke-virtual {v3, v15}, Ljava/util/BitSet;->set(I)V

    .line 513
    mul-int/lit8 v15, v8, 0x2

    add-int v15, v15, p3

    add-int/lit8 v15, v15, 0x1

    invoke-virtual {v3, v15}, Ljava/util/BitSet;->clear(I)V

    .line 511
    add-int/lit8 v8, v8, 0x1

    goto :goto_60

    .line 517
    :cond_77
    const/4 v2, 0x1

    .line 520
    .local v2, "H":I
    :cond_78
    const/4 v9, 0x0

    .line 521
    .restart local v9    # "j":I
    const/4 v8, 0x0

    :goto_7a
    move/from16 v0, p3

    if-ge v8, v0, :cond_92

    .line 522
    invoke-virtual {v3, v8}, Ljava/util/BitSet;->get(I)Z

    move-result v15

    if-eqz v15, :cond_85

    .line 523
    move v9, v8

    .line 525
    :cond_85
    aget v15, p1, v8

    sub-int v10, v15, v2

    .line 526
    .restart local v10    # "k":I
    if-gez v10, :cond_8d

    .line 527
    add-int v10, v10, p3

    .line 529
    :cond_8d
    aput v9, v6, v10

    .line 521
    add-int/lit8 v8, v8, 0x1

    goto :goto_7a

    .line 532
    .end local v10    # "k":I
    :cond_92
    const/4 v13, 0x0

    .line 533
    .local v13, "nNotDone":I
    const/4 v14, -0x1

    .line 537
    .local v14, "r":I
    :cond_94
    add-int/lit8 v10, v14, 0x1

    .line 538
    .restart local v10    # "k":I
    invoke-virtual {v3, v10}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result v10

    .line 539
    add-int/lit8 v11, v10, -0x1

    .line 540
    .local v11, "l":I
    move/from16 v0, p3

    if-lt v11, v0, :cond_a9

    .line 566
    :cond_a0
    mul-int/lit8 v2, v2, 0x2

    .line 567
    move/from16 v0, p3

    if-gt v2, v0, :cond_a8

    if-nez v13, :cond_78

    .line 571
    :cond_a8
    return-void

    .line 543
    :cond_a9
    add-int/lit8 v15, v10, 0x1

    invoke-virtual {v3, v15}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v10

    .line 544
    add-int/lit8 v14, v10, -0x1

    .line 545
    move/from16 v0, p3

    if-ge v14, v0, :cond_a0

    .line 550
    if-le v14, v11, :cond_94

    .line 551
    sub-int v15, v14, v11

    add-int/lit8 v15, v15, 0x1

    add-int/2addr v13, v15

    .line 552
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6, v11, v14}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->fallbackQSort3([I[III)V

    .line 555
    const/4 v4, -0x1

    .line 556
    .local v4, "cc":I
    move v8, v11

    :goto_c5
    if-gt v8, v14, :cond_94

    .line 557
    aget v15, p1, v8

    aget v5, v6, v15

    .line 558
    .local v5, "cc1":I
    if-eq v4, v5, :cond_d1

    .line 559
    invoke-virtual {v3, v8}, Ljava/util/BitSet;->set(I)V

    .line 560
    move v4, v5

    .line 556
    :cond_d1
    add-int/lit8 v8, v8, 0x1

    goto :goto_c5
.end method

.method final mainSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V
    .registers 39
    .param p1, "dataShadow"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p2, "lastShadow"    # I

    .prologue
    .line 917
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_runningOrder:[I

    move-object/from16 v30, v0

    .line 918
    .local v30, "runningOrder":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_copy:[I

    move-object/from16 v17, v0

    .line 919
    .local v17, "copy":[I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainSort_bigDone:[Z

    .line 920
    .local v13, "bigDone":[Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->ftab:[I

    move-object/from16 v21, v0

    .line 921
    .local v21, "ftab":[I
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 922
    .local v14, "block":[B
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    move-object/from16 v19, v0

    .line 923
    .local v19, "fmap":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->quadrant:[C

    move-object/from16 v28, v0

    .line 924
    .local v28, "quadrant":[C
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workLimit:I

    move/from16 v35, v0

    .line 925
    .local v35, "workLimitShadow":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->firstAttempt:Z

    move/from16 v18, v0

    .line 928
    .local v18, "firstAttemptShadow":Z
    const v25, 0x10001

    .local v25, "i":I
    :goto_35
    add-int/lit8 v25, v25, -0x1

    if-ltz v25, :cond_3d

    .line 929
    const/4 v2, 0x0

    aput v2, v21, v25

    goto :goto_35

    .line 937
    :cond_3d
    const/16 v25, 0x0

    :goto_3f
    const/16 v2, 0x14

    move/from16 v0, v25

    if-ge v0, v2, :cond_56

    .line 938
    add-int v2, p2, v25

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, p2, 0x1

    rem-int v3, v25, v3

    add-int/lit8 v3, v3, 0x1

    aget-byte v3, v14, v3

    aput-byte v3, v14, v2

    .line 937
    add-int/lit8 v25, v25, 0x1

    goto :goto_3f

    .line 940
    :cond_56
    add-int/lit8 v2, p2, 0x14

    add-int/lit8 v25, v2, 0x1

    :goto_5a
    add-int/lit8 v25, v25, -0x1

    if-ltz v25, :cond_62

    .line 941
    const/4 v2, 0x0

    aput-char v2, v28, v25

    goto :goto_5a

    .line 943
    :cond_62
    const/4 v2, 0x0

    add-int/lit8 v3, p2, 0x1

    aget-byte v3, v14, v3

    aput-byte v3, v14, v2

    .line 947
    const/4 v2, 0x0

    aget-byte v2, v14, v2

    and-int/lit16 v15, v2, 0xff

    .line 948
    .local v15, "c1":I
    const/16 v25, 0x0

    :goto_70
    move/from16 v0, v25

    move/from16 v1, p2

    if-gt v0, v1, :cond_8d

    .line 949
    add-int/lit8 v2, v25, 0x1

    aget-byte v2, v14, v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v16, v0

    .line 950
    .local v16, "c2":I
    shl-int/lit8 v2, v15, 0x8

    add-int v2, v2, v16

    aget v3, v21, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v21, v2

    .line 951
    move/from16 v15, v16

    .line 948
    add-int/lit8 v25, v25, 0x1

    goto :goto_70

    .line 954
    .end local v16    # "c2":I
    :cond_8d
    const/16 v25, 0x1

    :goto_8f
    const/high16 v2, 0x10000

    move/from16 v0, v25

    if-gt v0, v2, :cond_a1

    .line 955
    aget v2, v21, v25

    add-int/lit8 v3, v25, -0x1

    aget v3, v21, v3

    add-int/2addr v2, v3

    aput v2, v21, v25

    .line 954
    add-int/lit8 v25, v25, 0x1

    goto :goto_8f

    .line 958
    :cond_a1
    const/4 v2, 0x1

    aget-byte v2, v14, v2

    and-int/lit16 v15, v2, 0xff

    .line 959
    const/16 v25, 0x0

    :goto_a8
    move/from16 v0, v25

    move/from16 v1, p2

    if-ge v0, v1, :cond_c7

    .line 960
    add-int/lit8 v2, v25, 0x2

    aget-byte v2, v14, v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v16, v0

    .line 961
    .restart local v16    # "c2":I
    shl-int/lit8 v2, v15, 0x8

    add-int v2, v2, v16

    aget v3, v21, v2

    add-int/lit8 v3, v3, -0x1

    aput v3, v21, v2

    aput v25, v19, v3

    .line 962
    move/from16 v15, v16

    .line 959
    add-int/lit8 v25, v25, 0x1

    goto :goto_a8

    .line 965
    .end local v16    # "c2":I
    :cond_c7
    add-int/lit8 v2, p2, 0x1

    aget-byte v2, v14, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    const/4 v3, 0x1

    aget-byte v3, v14, v3

    and-int/lit16 v3, v3, 0xff

    add-int/2addr v2, v3

    aget v3, v21, v2

    add-int/lit8 v3, v3, -0x1

    aput v3, v21, v2

    aput p2, v19, v3

    .line 971
    const/16 v25, 0x100

    :goto_df
    add-int/lit8 v25, v25, -0x1

    if-ltz v25, :cond_e9

    .line 972
    const/4 v2, 0x0

    aput-boolean v2, v13, v25

    .line 973
    aput v25, v30, v25

    goto :goto_df

    .line 976
    :cond_e9
    const/16 v23, 0x16c

    .local v23, "h":I
    :cond_eb
    const/4 v2, 0x1

    move/from16 v0, v23

    if-eq v0, v2, :cond_12f

    .line 977
    div-int/lit8 v23, v23, 0x3

    .line 978
    move/from16 v25, v23

    :goto_f4
    const/16 v2, 0xff

    move/from16 v0, v25

    if-gt v0, v2, :cond_eb

    .line 979
    aget v34, v30, v25

    .line 980
    .local v34, "vv":I
    add-int/lit8 v2, v34, 0x1

    shl-int/lit8 v2, v2, 0x8

    aget v2, v21, v2

    shl-int/lit8 v3, v34, 0x8

    aget v3, v21, v3

    sub-int v8, v2, v3

    .line 981
    .local v8, "a":I
    add-int/lit8 v10, v23, -0x1

    .line 982
    .local v10, "b":I
    move/from16 v26, v25

    .line 983
    .local v26, "j":I
    sub-int v2, v26, v23

    aget v29, v30, v2

    .local v29, "ro":I
    :goto_110
    add-int/lit8 v2, v29, 0x1

    shl-int/lit8 v2, v2, 0x8

    aget v2, v21, v2

    shl-int/lit8 v3, v29, 0x8

    aget v3, v21, v3

    sub-int/2addr v2, v3

    if-le v2, v8, :cond_125

    .line 985
    aput v29, v30, v26

    .line 986
    sub-int v26, v26, v23

    .line 987
    move/from16 v0, v26

    if-gt v0, v10, :cond_12a

    .line 991
    :cond_125
    aput v34, v30, v26

    .line 978
    add-int/lit8 v25, v25, 0x1

    goto :goto_f4

    .line 983
    :cond_12a
    sub-int v2, v26, v23

    aget v29, v30, v2

    goto :goto_110

    .line 998
    .end local v8    # "a":I
    .end local v10    # "b":I
    .end local v26    # "j":I
    .end local v29    # "ro":I
    .end local v34    # "vv":I
    :cond_12f
    const/16 v25, 0x0

    :goto_131
    const/16 v2, 0xff

    move/from16 v0, v25

    if-gt v0, v2, :cond_174

    .line 1002
    aget v33, v30, v25

    .line 1011
    .local v33, "ss":I
    const/16 v26, 0x0

    .restart local v26    # "j":I
    :goto_13b
    const/16 v2, 0xff

    move/from16 v0, v26

    if-gt v0, v2, :cond_17e

    .line 1012
    shl-int/lit8 v2, v33, 0x8

    add-int v31, v2, v26

    .line 1013
    .local v31, "sb":I
    aget v22, v21, v31

    .line 1014
    .local v22, "ftab_sb":I
    const/high16 v2, 0x200000

    and-int v2, v2, v22

    const/high16 v3, 0x200000

    if-eq v2, v3, :cond_17b

    .line 1015
    const v2, -0x200001

    and-int v4, v22, v2

    .line 1016
    .local v4, "lo":I
    add-int/lit8 v2, v31, 0x1

    aget v2, v21, v2

    const v3, -0x200001

    and-int/2addr v2, v3

    add-int/lit8 v5, v2, -0x1

    .line 1017
    .local v5, "hi":I
    if-le v5, v4, :cond_175

    .line 1018
    const/4 v6, 0x2

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->mainQSort3(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;IIII)V

    .line 1019
    if-eqz v18, :cond_175

    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->workDone:I

    move/from16 v0, v35

    if-le v2, v0, :cond_175

    .line 1079
    .end local v4    # "lo":I
    .end local v5    # "hi":I
    .end local v22    # "ftab_sb":I
    .end local v26    # "j":I
    .end local v31    # "sb":I
    .end local v33    # "ss":I
    :cond_174
    return-void

    .line 1024
    .restart local v4    # "lo":I
    .restart local v5    # "hi":I
    .restart local v22    # "ftab_sb":I
    .restart local v26    # "j":I
    .restart local v31    # "sb":I
    .restart local v33    # "ss":I
    :cond_175
    const/high16 v2, 0x200000

    or-int v2, v2, v22

    aput v2, v21, v31

    .line 1011
    .end local v4    # "lo":I
    .end local v5    # "hi":I
    :cond_17b
    add-int/lit8 v26, v26, 0x1

    goto :goto_13b

    .line 1032
    .end local v22    # "ftab_sb":I
    .end local v31    # "sb":I
    :cond_17e
    const/16 v26, 0x0

    :goto_180
    const/16 v2, 0xff

    move/from16 v0, v26

    if-gt v0, v2, :cond_195

    .line 1033
    shl-int/lit8 v2, v26, 0x8

    add-int v2, v2, v33

    aget v2, v21, v2

    const v3, -0x200001

    and-int/2addr v2, v3

    aput v2, v17, v26

    .line 1032
    add-int/lit8 v26, v26, 0x1

    goto :goto_180

    .line 1036
    :cond_195
    shl-int/lit8 v2, v33, 0x8

    aget v2, v21, v2

    const v3, -0x200001

    and-int v26, v2, v3

    add-int/lit8 v2, v33, 0x1

    shl-int/lit8 v2, v2, 0x8

    aget v2, v21, v2

    const v3, -0x200001

    and-int v24, v2, v3

    .local v24, "hj":I
    :goto_1a9
    move/from16 v0, v26

    move/from16 v1, v24

    if-ge v0, v1, :cond_1cd

    .line 1037
    aget v20, v19, v26

    .line 1038
    .local v20, "fmap_j":I
    aget-byte v2, v14, v20

    and-int/lit16 v15, v2, 0xff

    .line 1039
    aget-boolean v2, v13, v15

    if-nez v2, :cond_1c7

    .line 1040
    aget v3, v17, v15

    if-nez v20, :cond_1ca

    move/from16 v2, p2

    :goto_1bf
    aput v2, v19, v3

    .line 1041
    aget v2, v17, v15

    add-int/lit8 v2, v2, 0x1

    aput v2, v17, v15

    .line 1036
    :cond_1c7
    add-int/lit8 v26, v26, 0x1

    goto :goto_1a9

    .line 1040
    :cond_1ca
    add-int/lit8 v2, v20, -0x1

    goto :goto_1bf

    .line 1045
    .end local v20    # "fmap_j":I
    :cond_1cd
    const/16 v26, 0x100

    :goto_1cf
    add-int/lit8 v26, v26, -0x1

    if-ltz v26, :cond_1df

    .line 1046
    shl-int/lit8 v2, v26, 0x8

    add-int v2, v2, v33

    aget v3, v21, v2

    const/high16 v6, 0x200000

    or-int/2addr v3, v6

    aput v3, v21, v2

    goto :goto_1cf

    .line 1057
    :cond_1df
    const/4 v2, 0x1

    aput-boolean v2, v13, v33

    .line 1059
    const/16 v2, 0xff

    move/from16 v0, v25

    if-ge v0, v2, :cond_227

    .line 1060
    shl-int/lit8 v2, v33, 0x8

    aget v2, v21, v2

    const v3, -0x200001

    and-int v12, v2, v3

    .line 1061
    .local v12, "bbStart":I
    add-int/lit8 v2, v33, 0x1

    shl-int/lit8 v2, v2, 0x8

    aget v2, v21, v2

    const v3, -0x200001

    and-int/2addr v2, v3

    sub-int v11, v2, v12

    .line 1062
    .local v11, "bbSize":I
    const/16 v32, 0x0

    .line 1064
    .local v32, "shifts":I
    :goto_1ff
    shr-int v2, v11, v32

    const v3, 0xfffe

    if-le v2, v3, :cond_209

    .line 1065
    add-int/lit8 v32, v32, 0x1

    goto :goto_1ff

    .line 1068
    :cond_209
    const/16 v26, 0x0

    :goto_20b
    move/from16 v0, v26

    if-ge v0, v11, :cond_227

    .line 1069
    add-int v2, v12, v26

    aget v9, v19, v2

    .line 1070
    .local v9, "a2update":I
    shr-int v2, v26, v32

    int-to-char v0, v2

    move/from16 v27, v0

    .line 1071
    .local v27, "qVal":C
    aput-char v27, v28, v9

    .line 1072
    const/16 v2, 0x14

    if-ge v9, v2, :cond_224

    .line 1073
    add-int v2, v9, p2

    add-int/lit8 v2, v2, 0x1

    aput-char v27, v28, v2

    .line 1068
    :cond_224
    add-int/lit8 v26, v26, 0x1

    goto :goto_20b

    .line 998
    .end local v9    # "a2update":I
    .end local v11    # "bbSize":I
    .end local v12    # "bbStart":I
    .end local v27    # "qVal":C
    .end local v32    # "shifts":I
    :cond_227
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_131
.end method
