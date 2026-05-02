.class public Lorg/mozilla/javascript/v8dtoa/FastDtoa;
.super Ljava/lang/Object;
.source "FastDtoa.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final kFastDtoaMaximalLength:I = 0x11

.field static final kTen4:I = 0x2710

.field static final kTen5:I = 0x186a0

.field static final kTen6:I = 0xf4240

.field static final kTen7:I = 0x989680

.field static final kTen8:I = 0x5f5e100

.field static final kTen9:I = 0x3b9aca00

.field static final maximal_target_exponent:I = -0x20

.field static final minimal_target_exponent:I = -0x3c


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-class v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static biggestPowerTen(II)J
    .registers 10
    .param p0, "number"    # I
    .param p1, "number_bits"    # I

    .prologue
    .line 183
    packed-switch p1, :pswitch_data_70

    .line 272
    const/4 v1, 0x0

    .line 273
    .local v1, "power":I
    const/4 v0, 0x0

    .line 276
    .local v0, "exponent":I
    :goto_5
    int-to-long v2, v1

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    int-to-long v6, v0

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2

    .line 187
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :pswitch_12
    const v2, 0x3b9aca00

    if-gt v2, p0, :cond_1d

    .line 188
    const v1, 0x3b9aca00

    .line 189
    .restart local v1    # "power":I
    const/16 v0, 0x9

    .line 190
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 195
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_1d
    :pswitch_1d
    const v2, 0x5f5e100

    if-gt v2, p0, :cond_28

    .line 196
    const v1, 0x5f5e100

    .line 197
    .restart local v1    # "power":I
    const/16 v0, 0x8

    .line 198
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 203
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_28
    :pswitch_28
    const v2, 0x989680

    if-gt v2, p0, :cond_32

    .line 204
    const v1, 0x989680

    .line 205
    .restart local v1    # "power":I
    const/4 v0, 0x7

    .line 206
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 212
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_32
    :pswitch_32
    const v2, 0xf4240

    if-gt v2, p0, :cond_3c

    .line 213
    const v1, 0xf4240

    .line 214
    .restart local v1    # "power":I
    const/4 v0, 0x6

    .line 215
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 220
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_3c
    :pswitch_3c
    const v2, 0x186a0

    if-gt v2, p0, :cond_46

    .line 221
    const v1, 0x186a0

    .line 222
    .restart local v1    # "power":I
    const/4 v0, 0x5

    .line 223
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 228
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_46
    :pswitch_46
    const/16 v2, 0x2710

    if-gt v2, p0, :cond_4e

    .line 229
    const/16 v1, 0x2710

    .line 230
    .restart local v1    # "power":I
    const/4 v0, 0x4

    .line 231
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 237
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_4e
    :pswitch_4e
    const/16 v2, 0x3e8

    if-gt v2, p0, :cond_56

    .line 238
    const/16 v1, 0x3e8

    .line 239
    .restart local v1    # "power":I
    const/4 v0, 0x3

    .line 240
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 245
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_56
    :pswitch_56
    const/16 v2, 0x64

    if-gt v2, p0, :cond_5e

    .line 246
    const/16 v1, 0x64

    .line 247
    .restart local v1    # "power":I
    const/4 v0, 0x2

    .line 248
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 253
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_5e
    :pswitch_5e
    const/16 v2, 0xa

    if-gt v2, p0, :cond_66

    .line 254
    const/16 v1, 0xa

    .line 255
    .restart local v1    # "power":I
    const/4 v0, 0x1

    .line 256
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 261
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_66
    :pswitch_66
    const/4 v2, 0x1

    if-gt v2, p0, :cond_6c

    .line 262
    const/4 v1, 0x1

    .line 263
    .restart local v1    # "power":I
    const/4 v0, 0x0

    .line 264
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 267
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_6c
    :pswitch_6c
    const/4 v1, 0x0

    .line 268
    .restart local v1    # "power":I
    const/4 v0, -0x1

    .line 269
    .restart local v0    # "exponent":I
    goto :goto_5

    .line 183
    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_6c
        :pswitch_66
        :pswitch_66
        :pswitch_66
        :pswitch_5e
        :pswitch_5e
        :pswitch_5e
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_4e
        :pswitch_4e
        :pswitch_4e
        :pswitch_4e
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_3c
        :pswitch_3c
        :pswitch_3c
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_12
        :pswitch_12
        :pswitch_12
    .end packed-switch
.end method

.method static digitGen(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;I)Z
    .registers 40
    .param p0, "low"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p1, "w"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p2, "high"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p3, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    .param p4, "mk"    # I

    .prologue
    .line 331
    sget-boolean v2, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v2, :cond_1e

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    if-ne v2, v3, :cond_18

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    if-eq v2, v3, :cond_1e

    :cond_18
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 332
    :cond_1e
    sget-boolean v2, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v2, :cond_3c

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/16 v9, 0x1

    sub-long/2addr v4, v9

    invoke-static {v2, v3, v4, v5}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->uint64_lte(JJ)Z

    move-result v2

    if-nez v2, :cond_3c

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 333
    :cond_3c
    sget-boolean v2, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v2, :cond_56

    const/16 v2, -0x3c

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    if-gt v2, v3, :cond_50

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    const/16 v3, -0x20

    if-le v2, v3, :cond_56

    :cond_50
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 345
    :cond_56
    const-wide/16 v11, 0x1

    .line 346
    .local v11, "unit":J
    new-instance v33, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    sub-long/2addr v2, v11

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    move-object/from16 v0, v33

    invoke-direct {v0, v2, v3, v4}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 347
    .local v33, "too_low":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v32, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    add-long/2addr v2, v11

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    move-object/from16 v0, v32

    invoke-direct {v0, v2, v3, v4}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 350
    .local v32, "too_high":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static/range {v32 .. v33}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v34

    .line 358
    .local v34, "unsafe_interval":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v29, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    const-wide/16 v2, 0x1

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    neg-int v4, v4

    shl-long/2addr v2, v4

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v4}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 360
    .local v29, "one":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    neg-int v4, v4

    ushr-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    move/from16 v27, v0

    .line 362
    .local v27, "integrals":I
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/16 v9, 0x1

    sub-long/2addr v4, v9

    and-long v18, v2, v4

    .line 363
    .local v18, "fractionals":J
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    neg-int v2, v2

    rsub-int/lit8 v2, v2, 0x40

    move/from16 v0, v27

    invoke-static {v0, v2}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->biggestPowerTen(II)J

    move-result-wide v30

    .line 364
    .local v30, "result":J
    const/16 v2, 0x20

    ushr-long v2, v30, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    move/from16 v25, v0

    .line 365
    .local v25, "divider":I
    const-wide v2, 0xffffffffL

    and-long v2, v2, v30

    long-to-int v0, v2

    move/from16 v26, v0

    .line 366
    .local v26, "divider_exponent":I
    add-int/lit8 v28, v26, 0x1

    .line 371
    .local v28, "kappa":I
    :goto_d5
    if-lez v28, :cond_127

    .line 372
    div-int v24, v27, v25

    .line 373
    .local v24, "digit":I
    add-int/lit8 v2, v24, 0x30

    int-to-char v2, v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 374
    rem-int v27, v27, v25

    .line 375
    add-int/lit8 v28, v28, -0x1

    .line 378
    move/from16 v0, v27

    int-to-long v2, v0

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    neg-int v4, v4

    shl-long/2addr v2, v4

    add-long v7, v2, v18

    .line 382
    .local v7, "rest":J
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    cmp-long v2, v7, v2

    if-gez v2, :cond_124

    .line 385
    move-object/from16 v0, p3

    iget v2, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v2, v2, p4

    add-int v2, v2, v28

    move-object/from16 v0, p3

    iput v2, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    .line 386
    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v3

    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v5

    move/from16 v0, v25

    int-to-long v9, v0

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    neg-int v2, v2

    shl-long/2addr v9, v2

    move-object/from16 v2, p3

    invoke-static/range {v2 .. v12}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v2

    .line 421
    .end local v7    # "rest":J
    :goto_123
    return v2

    .line 390
    .restart local v7    # "rest":J
    :cond_124
    div-int/lit8 v25, v25, 0xa

    .line 391
    goto :goto_d5

    .line 408
    .end local v7    # "rest":J
    .end local v24    # "digit":I
    :cond_127
    const-wide/16 v2, 0x5

    mul-long v18, v18, v2

    .line 409
    const-wide/16 v2, 0x5

    mul-long/2addr v11, v2

    .line 410
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const-wide/16 v4, 0x5

    mul-long/2addr v2, v4

    move-object/from16 v0, v34

    invoke-virtual {v0, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 411
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v34

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 412
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const/4 v4, 0x1

    ushr-long/2addr v2, v4

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 413
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v29

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 415
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    neg-int v2, v2

    ushr-long v2, v18, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    move/from16 v24, v0

    .line 416
    .restart local v24    # "digit":I
    add-int/lit8 v2, v24, 0x30

    int-to-char v2, v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 417
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    and-long v18, v18, v2

    .line 418
    add-int/lit8 v28, v28, -0x1

    .line 419
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    cmp-long v2, v18, v2

    if-gez v2, :cond_127

    .line 420
    move-object/from16 v0, p3

    iget v2, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v2, v2, p4

    add-int v2, v2, v28

    move-object/from16 v0, p3

    iput v2, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    .line 421
    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    mul-long v14, v2, v11

    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v16

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v20

    move-object/from16 v13, p3

    move-wide/from16 v22, v11

    invoke-static/range {v13 .. v23}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v2

    goto/16 :goto_123
.end method

.method public static dtoa(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .registers 5
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 488
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-gtz v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 489
    :cond_10
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_20

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 490
    :cond_20
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_30

    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_30

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 492
    :cond_30
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->grisu3(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static grisu3(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .registers 16
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 440
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 441
    .local v0, "bits":J
    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->asNormalizedDiyFp(J)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v9

    .line 446
    .local v9, "w":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v2, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .local v2, "boundary_minus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v3, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .line 447
    .local v3, "boundary_plus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->normalizedBoundaries(JLorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)V

    .line 448
    sget-boolean v10, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v10, :cond_29

    invoke-virtual {v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v10

    invoke-virtual {v9}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v11

    if-eq v10, v11, :cond_29

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 449
    :cond_29
    new-instance v8, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .line 450
    .local v8, "ten_mk":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v9}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v10

    add-int/lit8 v10, v10, 0x40

    const/16 v11, -0x3c

    const/16 v12, -0x20

    invoke-static {v10, v11, v12, v8}, Lorg/mozilla/javascript/v8dtoa/CachedPowers;->getCachedPower(IIILorg/mozilla/javascript/v8dtoa/DiyFp;)I

    move-result v4

    .line 452
    .local v4, "mk":I
    sget-boolean v10, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v10, :cond_64

    const/16 v10, -0x3c

    invoke-virtual {v9}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v11

    invoke-virtual {v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x40

    if-gt v10, v11, :cond_5e

    const/16 v10, -0x20

    invoke-virtual {v9}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v11

    invoke-virtual {v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x40

    if-ge v10, v11, :cond_64

    :cond_5e
    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 465
    :cond_64
    invoke-static {v9, v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v7

    .line 466
    .local v7, "scaled_w":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    sget-boolean v10, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v10, :cond_83

    invoke-virtual {v7}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v10

    invoke-virtual {v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v11

    invoke-virtual {v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x40

    if-eq v10, v11, :cond_83

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 473
    :cond_83
    invoke-static {v2, v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v5

    .line 474
    .local v5, "scaled_boundary_minus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static {v3, v8}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v6

    .line 482
    .local v6, "scaled_boundary_plus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static {v5, v7, v6, p2, v4}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->digitGen(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;I)Z

    move-result v10

    return v10
.end method

.method public static numberToString(D)Ljava/lang/String;
    .registers 4
    .param p0, "v"    # D

    .prologue
    .line 496
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    invoke-direct {v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;-><init>()V

    .line 497
    .local v0, "buffer":Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->numberToString(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->format()Ljava/lang/String;

    move-result-object v1

    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public static numberToString(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .registers 5
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 501
    invoke-virtual {p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->reset()V

    .line 502
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_f

    .line 503
    const/16 v0, 0x2d

    invoke-virtual {p2, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 504
    neg-double p0, p0

    .line 506
    :cond_f
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->dtoa(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z
    .registers 19
    .param p0, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    .param p1, "distance_too_high_w"    # J
    .param p3, "unsafe_interval"    # J
    .param p5, "rest"    # J
    .param p7, "ten_kappa"    # J
    .param p9, "unit"    # J

    .prologue
    .line 69
    sub-long v2, p1, p9

    .line 70
    .local v2, "small_distance":J
    add-long v0, p1, p9

    .line 141
    .local v0, "big_distance":J
    :goto_4
    cmp-long v4, p5, v2

    if-gez v4, :cond_22

    sub-long v4, p3, p5

    cmp-long v4, v4, p7

    if-ltz v4, :cond_22

    add-long v4, p5, p7

    cmp-long v4, v4, v2

    if-ltz v4, :cond_1d

    sub-long v4, v2, p5

    add-long v6, p5, p7

    sub-long/2addr v6, v2

    cmp-long v4, v4, v6

    if-ltz v4, :cond_22

    .line 144
    :cond_1d
    invoke-virtual {p0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->decreaseLast()V

    .line 145
    add-long/2addr p5, p7

    goto :goto_4

    .line 151
    :cond_22
    cmp-long v4, p5, v0

    if-gez v4, :cond_3d

    sub-long v4, p3, p5

    cmp-long v4, v4, p7

    if-ltz v4, :cond_3d

    add-long v4, p5, p7

    cmp-long v4, v4, v0

    if-ltz v4, :cond_3b

    sub-long v4, v0, p5

    add-long v6, p5, p7

    sub-long/2addr v6, v0

    cmp-long v4, v4, v6

    if-lez v4, :cond_3d

    .line 155
    :cond_3b
    const/4 v4, 0x0

    .line 163
    :goto_3c
    return v4

    :cond_3d
    const-wide/16 v4, 0x2

    mul-long v4, v4, p9

    cmp-long v4, v4, p5

    if-gtz v4, :cond_51

    const-wide/16 v4, 0x4

    mul-long v4, v4, p9

    sub-long v4, p3, v4

    cmp-long v4, p5, v4

    if-gtz v4, :cond_51

    const/4 v4, 0x1

    goto :goto_3c

    :cond_51
    const/4 v4, 0x0

    goto :goto_3c
.end method

.method private static uint64_lte(JJ)Z
    .registers 10
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 281
    cmp-long v2, p0, p2

    if-eqz v2, :cond_1b

    cmp-long v2, p0, p2

    if-gez v2, :cond_1d

    move v3, v1

    :goto_d
    cmp-long v2, p0, v4

    if-gez v2, :cond_1f

    move v2, v1

    :goto_12
    xor-int/2addr v3, v2

    cmp-long v2, p2, v4

    if-gez v2, :cond_21

    move v2, v1

    :goto_18
    xor-int/2addr v2, v3

    if-eqz v2, :cond_1c

    :cond_1b
    move v0, v1

    :cond_1c
    return v0

    :cond_1d
    move v3, v0

    goto :goto_d

    :cond_1f
    move v2, v0

    goto :goto_12

    :cond_21
    move v2, v0

    goto :goto_18
.end method
