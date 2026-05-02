.class Lorg/mozilla/javascript/DToA;
.super Ljava/lang/Object;
.source "DToA.java"


# static fields
.field private static final Bias:I = 0x3ff

.field private static final Bletch:I = 0x10

.field private static final Bndry_mask:I = 0xfffff

.field static final DTOSTR_EXPONENTIAL:I = 0x3

.field static final DTOSTR_FIXED:I = 0x2

.field static final DTOSTR_PRECISION:I = 0x4

.field static final DTOSTR_STANDARD:I = 0x0

.field static final DTOSTR_STANDARD_EXPONENTIAL:I = 0x1

.field private static final Exp_11:I = 0x3ff00000

.field private static final Exp_mask:I = 0x7ff00000

.field private static final Exp_mask_shifted:I = 0x7ff

.field private static final Exp_msk1:I = 0x100000

.field private static final Exp_msk1L:J = 0x10000000000000L

.field private static final Exp_shift:I = 0x14

.field private static final Exp_shift1:I = 0x14

.field private static final Exp_shiftL:I = 0x34

.field private static final Frac_mask:I = 0xfffff

.field private static final Frac_mask1:I = 0xfffff

.field private static final Frac_maskL:J = 0xfffffffffffffL

.field private static final Int_max:I = 0xe

.field private static final Log2P:I = 0x1

.field private static final P:I = 0x35

.field private static final Quick_max:I = 0xe

.field private static final Sign_bit:I = -0x80000000

.field private static final Ten_pmax:I = 0x16

.field private static final bigtens:[D

.field private static final dtoaModes:[I

.field private static final n_bigtens:I = 0x5

.field private static final tens:[D


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x5

    .line 72
    const/16 v0, 0x17

    new-array v0, v0, [D

    fill-array-data v0, :array_1a

    sput-object v0, Lorg/mozilla/javascript/DToA;->tens:[D

    .line 78
    new-array v0, v1, [D

    fill-array-data v0, :array_7a

    sput-object v0, Lorg/mozilla/javascript/DToA;->bigtens:[D

    .line 1124
    new-array v0, v1, [I

    fill-array-data v0, :array_92

    sput-object v0, Lorg/mozilla/javascript/DToA;->dtoaModes:[I

    return-void

    .line 72
    nop

    :array_1a
    .array-data 8
        0x3ff0000000000000L    # 1.0
        0x4024000000000000L    # 10.0
        0x4059000000000000L    # 100.0
        0x408f400000000000L    # 1000.0
        0x40c3880000000000L    # 10000.0
        0x40f86a0000000000L    # 100000.0
        0x412e848000000000L    # 1000000.0
        0x416312d000000000L    # 1.0E7
        0x4197d78400000000L    # 1.0E8
        0x41cdcd6500000000L    # 1.0E9
        0x4202a05f20000000L    # 1.0E10
        0x42374876e8000000L    # 1.0E11
        0x426d1a94a2000000L    # 1.0E12
        0x42a2309ce5400000L    # 1.0E13
        0x42d6bcc41e900000L    # 1.0E14
        0x430c6bf526340000L    # 1.0E15
        0x4341c37937e08000L    # 1.0E16
        0x4376345785d8a000L    # 1.0E17
        0x43abc16d674ec800L    # 1.0E18
        0x43e158e460913d00L    # 1.0E19
        0x4415af1d78b58c40L    # 1.0E20
        0x444b1ae4d6e2ef50L    # 1.0E21
        0x4480f0cf064dd592L    # 1.0E22
    .end array-data

    .line 78
    :array_7a
    .array-data 8
        0x4341c37937e08000L    # 1.0E16
        0x4693b8b5b5056e17L    # 1.0E32
        0x4d384f03e93ff9f5L    # 1.0E64
        0x5a827748f9301d32L    # 1.0E128
        0x75154fdd7f73bf3cL    # 1.0E256
    .end array-data

    .line 1124
    :array_92
    .array-data 4
        0x0
        0x0
        0x3
        0x2
        0x2
    .end array-data
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static BASEDIGIT(I)C
    .registers 2
    .param p0, "digit"    # I

    .prologue
    .line 34
    const/16 v0, 0xa

    if-lt p0, v0, :cond_8

    add-int/lit8 v0, p0, 0x57

    :goto_6
    int-to-char v0, v0

    return v0

    :cond_8
    add-int/lit8 v0, p0, 0x30

    goto :goto_6
.end method

.method static JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I
    .registers 62
    .param p0, "d"    # D
    .param p2, "mode"    # I
    .param p3, "biasUp"    # Z
    .param p4, "ndigits"    # I
    .param p5, "sign"    # [Z
    .param p6, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 487
    const/16 v49, 0x1

    move/from16 v0, v49

    new-array v13, v0, [I

    .line 488
    .local v13, "be":[I
    const/16 v49, 0x1

    move/from16 v0, v49

    new-array v12, v0, [I

    .line 492
    .local v12, "bbits":[I
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const/high16 v50, -0x80000000

    and-int v49, v49, v50

    if-eqz v49, :cond_5a

    .line 494
    const/16 v49, 0x0

    const/16 v50, 0x1

    aput-boolean v50, p5, v49

    .line 496
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const v50, 0x7fffffff

    and-int v49, v49, v50

    move-wide/from16 v0, p0

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide p0

    .line 501
    :goto_2d
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const/high16 v50, 0x7ff00000

    and-int v49, v49, v50

    const/high16 v50, 0x7ff00000

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_64

    .line 503
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v49

    if-nez v49, :cond_61

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const v50, 0xfffff

    and-int v49, v49, v50

    if-nez v49, :cond_61

    const-string v49, "Infinity"

    :goto_50
    move-object/from16 v0, p6

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    const/16 v49, 0x270f

    .line 1108
    :goto_59
    return v49

    .line 499
    :cond_5a
    const/16 v49, 0x0

    const/16 v50, 0x0

    aput-boolean v50, p5, v49

    goto :goto_2d

    .line 503
    :cond_61
    const-string v49, "NaN"

    goto :goto_50

    .line 506
    :cond_64
    const-wide/16 v49, 0x0

    cmpl-double v49, p0, v49

    if-nez v49, :cond_7f

    .line 508
    const/16 v49, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 509
    const/16 v49, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    const/16 v49, 0x1

    goto :goto_59

    .line 513
    :cond_7f
    move-wide/from16 v0, p0

    invoke-static {v0, v1, v13, v12}, Lorg/mozilla/javascript/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v8

    .line 514
    .local v8, "b":Ljava/math/BigInteger;
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    ushr-int/lit8 v49, v49, 0x14

    move/from16 v0, v49

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v26, v0

    .local v26, "i":I
    if-eqz v26, :cond_17a

    .line 515
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const v50, 0xfffff

    and-int v49, v49, v50

    const/high16 v50, 0x3ff00000    # 1.875f

    or-int v49, v49, v50

    move-wide/from16 v0, p0

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v14

    .line 537
    .local v14, "d2":D
    move/from16 v0, v26

    add-int/lit16 v0, v0, -0x3ff

    move/from16 v26, v0

    .line 538
    const/16 v17, 0x0

    .line 553
    .local v17, "denorm":Z
    :goto_b0
    const-wide/high16 v49, 0x3ff8000000000000L    # 1.5

    sub-double v49, v14, v49

    const-wide v51, 0x3fd287a7636f4361L    # 0.289529654602168

    mul-double v49, v49, v51

    const-wide v51, 0x3fc68a288b60c8b3L    # 0.1760912590558

    add-double v49, v49, v51

    move/from16 v0, v26

    int-to-double v0, v0

    move-wide/from16 v51, v0

    const-wide v53, 0x3fd34413509f79fbL    # 0.301029995663981

    mul-double v51, v51, v53

    add-double v21, v49, v51

    .line 554
    .local v21, "ds":D
    move-wide/from16 v0, v21

    double-to-int v0, v0

    move/from16 v34, v0

    .line 555
    .local v34, "k":I
    const-wide/16 v49, 0x0

    cmpg-double v49, v21, v49

    if-gez v49, :cond_e6

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v49, v0

    cmpl-double v49, v21, v49

    if-eqz v49, :cond_e6

    .line 556
    add-int/lit8 v34, v34, -0x1

    .line 557
    :cond_e6
    const/16 v36, 0x1

    .line 558
    .local v36, "k_check":Z
    if-ltz v34, :cond_fe

    const/16 v49, 0x16

    move/from16 v0, v34

    move/from16 v1, v49

    if-gt v0, v1, :cond_fe

    .line 559
    sget-object v49, Lorg/mozilla/javascript/DToA;->tens:[D

    aget-wide v49, v49, v34

    cmpg-double v49, p0, v49

    if-gez v49, :cond_fc

    .line 560
    add-int/lit8 v34, v34, -0x1

    .line 561
    :cond_fc
    const/16 v36, 0x0

    .line 565
    :cond_fe
    const/16 v49, 0x0

    aget v49, v12, v49

    sub-int v49, v49, v26

    add-int/lit8 v32, v49, -0x1

    .line 567
    .local v32, "j":I
    if-ltz v32, :cond_1dc

    .line 568
    const/4 v10, 0x0

    .line 569
    .local v10, "b2":I
    move/from16 v43, v32

    .line 575
    .local v43, "s2":I
    :goto_10b
    if-ltz v34, :cond_1e3

    .line 576
    const/4 v11, 0x0

    .line 577
    .local v11, "b5":I
    move/from16 v44, v34

    .line 578
    .local v44, "s5":I
    add-int v43, v43, v34

    .line 587
    :goto_112
    if-ltz p2, :cond_11c

    const/16 v49, 0x9

    move/from16 v0, p2

    move/from16 v1, v49

    if-le v0, v1, :cond_11e

    .line 588
    :cond_11c
    const/16 p2, 0x0

    .line 589
    :cond_11e
    const/16 v46, 0x1

    .line 590
    .local v46, "try_quick":Z
    const/16 v49, 0x5

    move/from16 v0, p2

    move/from16 v1, v49

    if-le v0, v1, :cond_12c

    .line 591
    add-int/lit8 p2, p2, -0x4

    .line 592
    const/16 v46, 0x0

    .line 594
    :cond_12c
    const/16 v38, 0x1

    .line 595
    .local v38, "leftright":Z
    const/16 v31, 0x0

    .local v31, "ilim1":I
    move/from16 v29, v31

    .line 596
    .local v29, "ilim":I
    packed-switch p2, :pswitch_data_84a

    .line 625
    :cond_135
    :goto_135
    const/16 v25, 0x0

    .line 626
    .local v25, "fast_failed":Z
    if-ltz v29, :cond_346

    const/16 v49, 0xe

    move/from16 v0, v29

    move/from16 v1, v49

    if-gt v0, v1, :cond_346

    if-eqz v46, :cond_346

    .line 630
    const/16 v26, 0x0

    .line 631
    move-wide/from16 v14, p0

    .line 632
    move/from16 v35, v34

    .line 633
    .local v35, "k0":I
    move/from16 v30, v29

    .line 634
    .local v30, "ilim0":I
    const/16 v28, 0x2

    .line 636
    .local v28, "ieps":I
    if-lez v34, :cond_25c

    .line 637
    sget-object v49, Lorg/mozilla/javascript/DToA;->tens:[D

    and-int/lit8 v50, v34, 0xf

    aget-wide v21, v49, v50

    .line 638
    shr-int/lit8 v32, v34, 0x4

    .line 639
    and-int/lit8 v49, v32, 0x10

    if-eqz v49, :cond_167

    .line 641
    and-int/lit8 v32, v32, 0xf

    .line 642
    sget-object v49, Lorg/mozilla/javascript/DToA;->bigtens:[D

    const/16 v50, 0x4

    aget-wide v49, v49, v50

    div-double p0, p0, v49

    .line 643
    add-int/lit8 v28, v28, 0x1

    .line 645
    :cond_167
    :goto_167
    if-eqz v32, :cond_214

    .line 646
    and-int/lit8 v49, v32, 0x1

    if-eqz v49, :cond_175

    .line 647
    add-int/lit8 v28, v28, 0x1

    .line 648
    sget-object v49, Lorg/mozilla/javascript/DToA;->bigtens:[D

    aget-wide v49, v49, v26

    mul-double v21, v21, v49

    .line 645
    :cond_175
    shr-int/lit8 v32, v32, 0x1

    add-int/lit8 v26, v26, 0x1

    goto :goto_167

    .line 542
    .end local v10    # "b2":I
    .end local v11    # "b5":I
    .end local v14    # "d2":D
    .end local v17    # "denorm":Z
    .end local v21    # "ds":D
    .end local v25    # "fast_failed":Z
    .end local v28    # "ieps":I
    .end local v29    # "ilim":I
    .end local v30    # "ilim0":I
    .end local v31    # "ilim1":I
    .end local v32    # "j":I
    .end local v34    # "k":I
    .end local v35    # "k0":I
    .end local v36    # "k_check":Z
    .end local v38    # "leftright":Z
    .end local v43    # "s2":I
    .end local v44    # "s5":I
    .end local v46    # "try_quick":Z
    :cond_17a
    const/16 v49, 0x0

    aget v49, v12, v49

    const/16 v50, 0x0

    aget v50, v13, v50

    add-int v49, v49, v50

    move/from16 v0, v49

    add-int/lit16 v0, v0, 0x432

    move/from16 v26, v0

    .line 543
    const/16 v49, 0x20

    move/from16 v0, v26

    move/from16 v1, v49

    if-le v0, v1, :cond_1ce

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    rsub-int/lit8 v51, v26, 0x40

    shl-long v49, v49, v51

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v51

    add-int/lit8 v52, v26, -0x20

    ushr-int v51, v51, v52

    move/from16 v0, v51

    int-to-long v0, v0

    move-wide/from16 v51, v0

    or-long v47, v49, v51

    .line 548
    .local v47, "x":J
    :goto_1ae
    move-wide/from16 v0, v47

    long-to-double v0, v0

    move-wide/from16 v49, v0

    move-wide/from16 v0, v47

    long-to-double v0, v0

    move-wide/from16 v51, v0

    invoke-static/range {v51 .. v52}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v51

    const/high16 v52, 0x1f00000

    sub-int v51, v51, v52

    invoke-static/range {v49 .. v51}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v14

    .line 549
    .restart local v14    # "d2":D
    move/from16 v0, v26

    add-int/lit16 v0, v0, -0x433

    move/from16 v26, v0

    .line 550
    const/16 v17, 0x1

    .restart local v17    # "denorm":Z
    goto/16 :goto_b0

    .line 543
    .end local v14    # "d2":D
    .end local v17    # "denorm":Z
    .end local v47    # "x":J
    :cond_1ce
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    rsub-int/lit8 v51, v26, 0x20

    shl-long v47, v49, v51

    goto :goto_1ae

    .line 572
    .restart local v14    # "d2":D
    .restart local v17    # "denorm":Z
    .restart local v21    # "ds":D
    .restart local v32    # "j":I
    .restart local v34    # "k":I
    .restart local v36    # "k_check":Z
    :cond_1dc
    move/from16 v0, v32

    neg-int v10, v0

    .line 573
    .restart local v10    # "b2":I
    const/16 v43, 0x0

    .restart local v43    # "s2":I
    goto/16 :goto_10b

    .line 581
    :cond_1e3
    sub-int v10, v10, v34

    .line 582
    move/from16 v0, v34

    neg-int v11, v0

    .line 583
    .restart local v11    # "b5":I
    const/16 v44, 0x0

    .restart local v44    # "s5":I
    goto/16 :goto_112

    .line 599
    .restart local v29    # "ilim":I
    .restart local v31    # "ilim1":I
    .restart local v38    # "leftright":Z
    .restart local v46    # "try_quick":Z
    :pswitch_1ec
    const/16 v31, -0x1

    move/from16 v29, v31

    .line 600
    const/16 v26, 0x12

    .line 601
    const/16 p4, 0x0

    .line 602
    goto/16 :goto_135

    .line 604
    :pswitch_1f6
    const/16 v38, 0x0

    .line 607
    :pswitch_1f8
    if-gtz p4, :cond_1fc

    .line 608
    const/16 p4, 0x1

    .line 609
    :cond_1fc
    move/from16 v26, p4

    move/from16 v31, p4

    move/from16 v29, p4

    .line 610
    goto/16 :goto_135

    .line 612
    :pswitch_204
    const/16 v38, 0x0

    .line 615
    :pswitch_206
    add-int v49, p4, v34

    add-int/lit8 v26, v49, 0x1

    .line 616
    move/from16 v29, v26

    .line 617
    add-int/lit8 v31, v26, -0x1

    .line 618
    if-gtz v26, :cond_135

    .line 619
    const/16 v26, 0x1

    goto/16 :goto_135

    .line 650
    .restart local v25    # "fast_failed":Z
    .restart local v28    # "ieps":I
    .restart local v30    # "ilim0":I
    .restart local v35    # "k0":I
    :cond_214
    div-double p0, p0, v21

    .line 661
    :cond_216
    if-eqz v36, :cond_224

    const-wide/high16 v49, 0x3ff0000000000000L    # 1.0

    cmpg-double v49, p0, v49

    if-gez v49, :cond_224

    if-lez v29, :cond_224

    .line 662
    if-gtz v31, :cond_280

    .line 663
    const/16 v25, 0x1

    .line 674
    :cond_224
    :goto_224
    move/from16 v0, v28

    int-to-double v0, v0

    move-wide/from16 v49, v0

    mul-double v49, v49, p0

    const-wide/high16 v51, 0x401c000000000000L    # 7.0

    add-double v23, v49, v51

    .line 675
    .local v23, "eps":D
    invoke-static/range {v23 .. v24}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const/high16 v50, 0x3400000

    sub-int v49, v49, v50

    move-wide/from16 v0, v23

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v23

    .line 676
    if-nez v29, :cond_2ac

    .line 677
    const/16 v41, 0x0

    .local v41, "mhi":Ljava/math/BigInteger;
    move-object/from16 v5, v41

    .line 678
    .local v5, "S":Ljava/lang/Object;
    const-wide/high16 v49, 0x4014000000000000L    # 5.0

    sub-double p0, p0, v49

    .line 679
    cmpl-double v49, p0, v23

    if-lez v49, :cond_28b

    .line 680
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 681
    add-int/lit8 v34, v34, 0x1

    .line 682
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 652
    .end local v5    # "S":Ljava/lang/Object;
    .end local v23    # "eps":D
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_25c
    move/from16 v0, v34

    neg-int v0, v0

    move/from16 v33, v0

    .local v33, "j1":I
    if-eqz v33, :cond_216

    .line 653
    sget-object v49, Lorg/mozilla/javascript/DToA;->tens:[D

    and-int/lit8 v50, v33, 0xf

    aget-wide v49, v49, v50

    mul-double p0, p0, v49

    .line 654
    shr-int/lit8 v32, v33, 0x4

    :goto_26d
    if-eqz v32, :cond_216

    .line 655
    and-int/lit8 v49, v32, 0x1

    if-eqz v49, :cond_27b

    .line 656
    add-int/lit8 v28, v28, 0x1

    .line 657
    sget-object v49, Lorg/mozilla/javascript/DToA;->bigtens:[D

    aget-wide v49, v49, v26

    mul-double p0, p0, v49

    .line 654
    :cond_27b
    shr-int/lit8 v32, v32, 0x1

    add-int/lit8 v26, v26, 0x1

    goto :goto_26d

    .line 665
    .end local v33    # "j1":I
    :cond_280
    move/from16 v29, v31

    .line 666
    add-int/lit8 v34, v34, -0x1

    .line 667
    const-wide/high16 v49, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v49

    .line 668
    add-int/lit8 v28, v28, 0x1

    goto :goto_224

    .line 684
    .restart local v5    # "S":Ljava/lang/Object;
    .restart local v23    # "eps":D
    .restart local v41    # "mhi":Ljava/math/BigInteger;
    :cond_28b
    move-wide/from16 v0, v23

    neg-double v0, v0

    move-wide/from16 v49, v0

    cmpg-double v49, p0, v49

    if-gez v49, :cond_2aa

    .line 685
    const/16 v49, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 686
    const/16 v49, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 687
    const/16 v49, 0x1

    goto/16 :goto_59

    .line 689
    :cond_2aa
    const/16 v25, 0x1

    .line 691
    .end local v5    # "S":Ljava/lang/Object;
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_2ac
    if-nez v25, :cond_335

    .line 692
    const/16 v25, 0x1

    .line 693
    if-eqz v38, :cond_394

    .line 697
    const-wide/high16 v49, 0x3fe0000000000000L    # 0.5

    sget-object v51, Lorg/mozilla/javascript/DToA;->tens:[D

    add-int/lit8 v52, v29, -0x1

    aget-wide v51, v51, v52

    div-double v49, v49, v51

    sub-double v23, v49, v23

    .line 698
    const/16 v26, 0x0

    .line 699
    :goto_2c0
    move-wide/from16 v0, p0

    double-to-long v3, v0

    .line 700
    .local v3, "L":J
    long-to-double v0, v3

    move-wide/from16 v49, v0

    sub-double p0, p0, v49

    .line 701
    const-wide/16 v49, 0x30

    add-long v49, v49, v3

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 702
    cmpg-double v49, p0, v23

    if-gez v49, :cond_2e5

    .line 703
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 705
    :cond_2e5
    const-wide/high16 v49, 0x3ff0000000000000L    # 1.0

    sub-double v49, v49, p0

    cmpg-double v49, v49, v23

    if-gez v49, :cond_32d

    .line 709
    :cond_2ed
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v37

    .line 710
    .local v37, "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 711
    const/16 v49, 0x39

    move/from16 v0, v37

    move/from16 v1, v49

    if-eq v0, v1, :cond_322

    .line 718
    :goto_310
    add-int/lit8 v49, v37, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 719
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 712
    :cond_322
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    if-nez v49, :cond_2ed

    .line 713
    add-int/lit8 v34, v34, 0x1

    .line 714
    const/16 v37, 0x30

    .line 715
    goto :goto_310

    .line 721
    .end local v37    # "lastCh":C
    :cond_32d
    add-int/lit8 v26, v26, 0x1

    move/from16 v0, v26

    move/from16 v1, v29

    if-lt v0, v1, :cond_38a

    .line 763
    .end local v3    # "L":J
    :cond_335
    if-eqz v25, :cond_346

    .line 764
    const/16 v49, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 765
    move-wide/from16 p0, v14

    .line 766
    move/from16 v34, v35

    .line 767
    move/from16 v29, v30

    .line 773
    .end local v23    # "eps":D
    .end local v28    # "ieps":I
    .end local v30    # "ilim0":I
    .end local v35    # "k0":I
    :cond_346
    const/16 v49, 0x0

    aget v49, v13, v49

    if-ltz v49, :cond_4bb

    const/16 v49, 0xe

    move/from16 v0, v34

    move/from16 v1, v49

    if-gt v0, v1, :cond_4bb

    .line 775
    sget-object v49, Lorg/mozilla/javascript/DToA;->tens:[D

    aget-wide v21, v49, v34

    .line 776
    if-gez p4, :cond_42e

    if-gtz v29, :cond_42e

    .line 777
    const/16 v41, 0x0

    .restart local v41    # "mhi":Ljava/math/BigInteger;
    move-object/from16 v5, v41

    .line 778
    .restart local v5    # "S":Ljava/lang/Object;
    if-ltz v29, :cond_374

    const-wide/high16 v49, 0x4014000000000000L    # 5.0

    mul-double v49, v49, v21

    cmpg-double v49, p0, v49

    if-ltz v49, :cond_374

    if-nez p3, :cond_41f

    const-wide/high16 v49, 0x4014000000000000L    # 5.0

    mul-double v49, v49, v21

    cmpl-double v49, p0, v49

    if-nez v49, :cond_41f

    .line 779
    :cond_374
    const/16 v49, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 780
    const/16 v49, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 781
    const/16 v49, 0x1

    goto/16 :goto_59

    .line 723
    .end local v5    # "S":Ljava/lang/Object;
    .end local v41    # "mhi":Ljava/math/BigInteger;
    .restart local v3    # "L":J
    .restart local v23    # "eps":D
    .restart local v28    # "ieps":I
    .restart local v30    # "ilim0":I
    .restart local v35    # "k0":I
    :cond_38a
    const-wide/high16 v49, 0x4024000000000000L    # 10.0

    mul-double v23, v23, v49

    .line 724
    const-wide/high16 v49, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v49

    goto/16 :goto_2c0

    .line 729
    .end local v3    # "L":J
    :cond_394
    sget-object v49, Lorg/mozilla/javascript/DToA;->tens:[D

    add-int/lit8 v50, v29, -0x1

    aget-wide v49, v49, v50

    mul-double v23, v23, v49

    .line 730
    const/16 v26, 0x1

    .line 731
    :goto_39e
    move-wide/from16 v0, p0

    double-to-long v3, v0

    .line 732
    .restart local v3    # "L":J
    long-to-double v0, v3

    move-wide/from16 v49, v0

    sub-double p0, p0, v49

    .line 733
    const-wide/16 v49, 0x30

    add-long v49, v49, v3

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 734
    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_418

    .line 735
    const-wide/high16 v49, 0x3fe0000000000000L    # 0.5

    add-double v49, v49, v23

    cmpl-double v49, p0, v49

    if-lez v49, :cond_409

    .line 739
    :cond_3c9
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v37

    .line 740
    .restart local v37    # "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 741
    const/16 v49, 0x39

    move/from16 v0, v37

    move/from16 v1, v49

    if-eq v0, v1, :cond_3fe

    .line 748
    :goto_3ec
    add-int/lit8 v49, v37, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 749
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 742
    :cond_3fe
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    if-nez v49, :cond_3c9

    .line 743
    add-int/lit8 v34, v34, 0x1

    .line 744
    const/16 v37, 0x30

    .line 745
    goto :goto_3ec

    .line 752
    .end local v37    # "lastCh":C
    :cond_409
    const-wide/high16 v49, 0x3fe0000000000000L    # 0.5

    sub-double v49, v49, v23

    cmpg-double v49, p0, v49

    if-gez v49, :cond_335

    .line 753
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    .line 756
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 730
    :cond_418
    add-int/lit8 v26, v26, 0x1

    const-wide/high16 v49, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v49

    goto :goto_39e

    .line 783
    .end local v3    # "L":J
    .end local v23    # "eps":D
    .end local v28    # "ieps":I
    .end local v30    # "ilim0":I
    .end local v35    # "k0":I
    .restart local v5    # "S":Ljava/lang/Object;
    .restart local v41    # "mhi":Ljava/math/BigInteger;
    :cond_41f
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 784
    add-int/lit8 v34, v34, 0x1

    .line 785
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 787
    .end local v5    # "S":Ljava/lang/Object;
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_42e
    const/16 v26, 0x1

    .line 788
    :goto_430
    div-double v49, p0, v21

    move-wide/from16 v0, v49

    double-to-long v3, v0

    .line 789
    .restart local v3    # "L":J
    long-to-double v0, v3

    move-wide/from16 v49, v0

    mul-double v49, v49, v21

    sub-double p0, p0, v49

    .line 790
    const-wide/16 v49, 0x30

    add-long v49, v49, v3

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 791
    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_4ad

    .line 792
    add-double p0, p0, p0

    .line 793
    cmpl-double v49, p0, v21

    if-gtz v49, :cond_46d

    cmpl-double v49, p0, v21

    if-nez v49, :cond_49e

    const-wide/16 v49, 0x1

    and-long v49, v49, v3

    const-wide/16 v51, 0x0

    cmp-long v49, v49, v51

    if-nez v49, :cond_46d

    if-eqz p3, :cond_49e

    .line 804
    :cond_46d
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v37

    .line 805
    .restart local v37    # "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    add-int/lit8 v49, v49, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 806
    const/16 v49, 0x39

    move/from16 v0, v37

    move/from16 v1, v49

    if-eq v0, v1, :cond_4a2

    .line 813
    :goto_490
    add-int/lit8 v49, v37, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 821
    .end local v37    # "lastCh":C
    :cond_49e
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 807
    .restart local v37    # "lastCh":C
    :cond_4a2
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v49

    if-nez v49, :cond_46d

    .line 808
    add-int/lit8 v34, v34, 0x1

    .line 809
    const/16 v37, 0x30

    .line 810
    goto :goto_490

    .line 817
    .end local v37    # "lastCh":C
    :cond_4ad
    const-wide/high16 v49, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v49

    .line 818
    const-wide/16 v49, 0x0

    cmpl-double v49, p0, v49

    if-eqz v49, :cond_49e

    .line 787
    add-int/lit8 v26, v26, 0x1

    goto/16 :goto_430

    .line 824
    .end local v3    # "L":J
    :cond_4bb
    move/from16 v39, v10

    .line 825
    .local v39, "m2":I
    move/from16 v40, v11

    .line 826
    .local v40, "m5":I
    const/16 v42, 0x0

    .local v42, "mlo":Ljava/math/BigInteger;
    move-object/from16 v41, v42

    .line 827
    .local v41, "mhi":Ljava/lang/Object;
    if-eqz v38, :cond_4e3

    .line 828
    const/16 v49, 0x2

    move/from16 v0, p2

    move/from16 v1, v49

    if-ge v0, v1, :cond_57c

    .line 829
    if-eqz v17, :cond_574

    const/16 v49, 0x0

    aget v49, v13, v49

    move/from16 v0, v49

    add-int/lit16 v0, v0, 0x433

    move/from16 v26, v0

    .line 848
    :cond_4d9
    :goto_4d9
    add-int v10, v10, v26

    .line 849
    add-int v43, v43, v26

    .line 850
    const-wide/16 v49, 0x1

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v41

    .line 856
    .end local v41    # "mhi":Ljava/lang/Object;
    :cond_4e3
    if-lez v39, :cond_4f5

    if-lez v43, :cond_4f5

    .line 857
    move/from16 v0, v39

    move/from16 v1, v43

    if-ge v0, v1, :cond_599

    move/from16 v26, v39

    .line 858
    :goto_4ef
    sub-int v10, v10, v26

    .line 859
    sub-int v39, v39, v26

    .line 860
    sub-int v43, v43, v26

    .line 864
    :cond_4f5
    if-lez v11, :cond_514

    .line 865
    if-eqz v38, :cond_59d

    .line 866
    if-lez v40, :cond_50a

    .line 867
    move-object/from16 v0, v41

    move/from16 v1, v40

    invoke-static {v0, v1}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v41

    .line 868
    .local v41, "mhi":Ljava/math/BigInteger;
    move-object/from16 v0, v41

    invoke-virtual {v0, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 869
    .local v9, "b1":Ljava/math/BigInteger;
    move-object v8, v9

    .line 871
    .end local v9    # "b1":Ljava/math/BigInteger;
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_50a
    sub-int v32, v11, v40

    if-eqz v32, :cond_514

    .line 872
    move/from16 v0, v32

    invoke-static {v8, v0}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v8

    .line 880
    :cond_514
    :goto_514
    const-wide/16 v49, 0x1

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    .line 881
    .local v5, "S":Ljava/math/BigInteger;
    if-lez v44, :cond_522

    .line 882
    move/from16 v0, v44

    invoke-static {v5, v0}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v5

    .line 887
    :cond_522
    const/16 v45, 0x0

    .line 888
    .local v45, "spec_case":Z
    const/16 v49, 0x2

    move/from16 v0, p2

    move/from16 v1, v49

    if-ge v0, v1, :cond_54d

    .line 889
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v49

    if-nez v49, :cond_54d

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const v50, 0xfffff

    and-int v49, v49, v50

    if-nez v49, :cond_54d

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v49

    const/high16 v50, 0x7fe00000

    and-int v49, v49, v50

    if-eqz v49, :cond_54d

    .line 894
    add-int/lit8 v10, v10, 0x1

    .line 895
    add-int/lit8 v43, v43, 0x1

    .line 896
    const/16 v45, 0x1

    .line 907
    :cond_54d
    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v6

    .line 908
    .local v6, "S_bytes":[B
    const/4 v7, 0x0

    .line 909
    .local v7, "S_hiWord":I
    const/16 v27, 0x0

    .local v27, "idx":I
    :goto_554
    const/16 v49, 0x4

    move/from16 v0, v27

    move/from16 v1, v49

    if-ge v0, v1, :cond_5a3

    .line 910
    shl-int/lit8 v7, v7, 0x8

    .line 911
    array-length v0, v6

    move/from16 v49, v0

    move/from16 v0, v27

    move/from16 v1, v49

    if-ge v0, v1, :cond_571

    .line 912
    aget-byte v49, v6, v27

    move/from16 v0, v49

    and-int/lit16 v0, v0, 0xff

    move/from16 v49, v0

    or-int v7, v7, v49

    .line 909
    :cond_571
    add-int/lit8 v27, v27, 0x1

    goto :goto_554

    .line 829
    .end local v5    # "S":Ljava/math/BigInteger;
    .end local v6    # "S_bytes":[B
    .end local v7    # "S_hiWord":I
    .end local v27    # "idx":I
    .end local v45    # "spec_case":Z
    .local v41, "mhi":Ljava/lang/Object;
    :cond_574
    const/16 v49, 0x0

    aget v49, v12, v49

    rsub-int/lit8 v26, v49, 0x36

    goto/16 :goto_4d9

    .line 834
    :cond_57c
    add-int/lit8 v32, v29, -0x1

    .line 835
    move/from16 v0, v40

    move/from16 v1, v32

    if-lt v0, v1, :cond_590

    .line 836
    sub-int v40, v40, v32

    .line 842
    :goto_586
    move/from16 v26, v29

    if-gez v29, :cond_4d9

    .line 843
    sub-int v39, v39, v26

    .line 844
    const/16 v26, 0x0

    goto/16 :goto_4d9

    .line 838
    :cond_590
    sub-int v32, v32, v40

    add-int v44, v44, v32

    .line 839
    add-int v11, v11, v32

    .line 840
    const/16 v40, 0x0

    goto :goto_586

    .end local v41    # "mhi":Ljava/lang/Object;
    :cond_599
    move/from16 v26, v43

    .line 857
    goto/16 :goto_4ef

    .line 875
    :cond_59d
    invoke-static {v8, v11}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v8

    goto/16 :goto_514

    .line 914
    .restart local v5    # "S":Ljava/math/BigInteger;
    .restart local v6    # "S_bytes":[B
    .restart local v7    # "S_hiWord":I
    .restart local v27    # "idx":I
    .restart local v45    # "spec_case":Z
    :cond_5a3
    if-eqz v44, :cond_631

    invoke-static {v7}, Lorg/mozilla/javascript/DToA;->hi0bits(I)I

    move-result v49

    rsub-int/lit8 v49, v49, 0x20

    :goto_5ab
    add-int v49, v49, v43

    and-int/lit8 v26, v49, 0x1f

    if-eqz v26, :cond_5b3

    .line 915
    rsub-int/lit8 v26, v26, 0x20

    .line 917
    :cond_5b3
    const/16 v49, 0x4

    move/from16 v0, v26

    move/from16 v1, v49

    if-le v0, v1, :cond_635

    .line 918
    add-int/lit8 v26, v26, -0x4

    .line 919
    add-int v10, v10, v26

    .line 920
    add-int v39, v39, v26

    .line 921
    add-int v43, v43, v26

    .line 930
    :cond_5c3
    :goto_5c3
    if-lez v10, :cond_5c9

    .line 931
    invoke-virtual {v8, v10}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v8

    .line 932
    :cond_5c9
    if-lez v43, :cond_5d1

    .line 933
    move/from16 v0, v43

    invoke-virtual {v5, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v5

    .line 936
    :cond_5d1
    if-eqz v36, :cond_5f9

    .line 937
    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v49

    if-gez v49, :cond_5f9

    .line 938
    add-int/lit8 v34, v34, -0x1

    .line 939
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    .line 940
    if-eqz v38, :cond_5f7

    .line 941
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v41

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v41

    .line 942
    :cond_5f7
    move/from16 v29, v31

    .line 947
    :cond_5f9
    if-gtz v29, :cond_656

    const/16 v49, 0x2

    move/from16 v0, p2

    move/from16 v1, v49

    if-le v0, v1, :cond_656

    .line 950
    if-ltz v29, :cond_61b

    const-wide/16 v49, 0x5

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v5, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v26

    if-ltz v26, :cond_61b

    if-nez v26, :cond_647

    if-nez p3, :cond_647

    .line 958
    :cond_61b
    const/16 v49, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 959
    const/16 v49, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 960
    const/16 v49, 0x1

    goto/16 :goto_59

    .line 914
    :cond_631
    const/16 v49, 0x1

    goto/16 :goto_5ab

    .line 923
    :cond_635
    const/16 v49, 0x4

    move/from16 v0, v26

    move/from16 v1, v49

    if-ge v0, v1, :cond_5c3

    .line 924
    add-int/lit8 v26, v26, 0x1c

    .line 925
    add-int v10, v10, v26

    .line 926
    add-int v39, v39, v26

    .line 927
    add-int v43, v43, v26

    goto/16 :goto_5c3

    .line 964
    :cond_647
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 965
    add-int/lit8 v34, v34, 0x1

    .line 966
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 968
    :cond_656
    if-eqz v38, :cond_80d

    .line 969
    if-lez v39, :cond_662

    .line 970
    move-object/from16 v0, v41

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v41

    .line 976
    :cond_662
    move-object/from16 v42, v41

    .line 977
    if-eqz v45, :cond_672

    .line 978
    move-object/from16 v41, v42

    .line 979
    .local v41, "mhi":Ljava/math/BigInteger;
    const/16 v49, 0x1

    move-object/from16 v0, v41

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v41

    .line 984
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_672
    const/16 v26, 0x1

    .line 985
    :goto_674
    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v20

    .line 986
    .local v20, "divResult":[Ljava/math/BigInteger;
    const/16 v49, 0x1

    aget-object v8, v20, v49

    .line 987
    const/16 v49, 0x0

    aget-object v49, v20, v49

    invoke-virtual/range {v49 .. v49}, Ljava/math/BigInteger;->intValue()I

    move-result v49

    add-int/lit8 v49, v49, 0x30

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v18, v0

    .line 991
    .local v18, "dig":C
    move-object/from16 v0, v42

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v32

    .line 993
    move-object/from16 v0, v41

    invoke-virtual {v5, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v16

    .line 994
    .local v16, "delta":Ljava/math/BigInteger;
    invoke-virtual/range {v16 .. v16}, Ljava/math/BigInteger;->signum()I

    move-result v49

    if-gtz v49, :cond_6d1

    const/16 v33, 0x1

    .line 996
    .restart local v33    # "j1":I
    :goto_69f
    if-nez v33, :cond_6ec

    if-nez p2, :cond_6ec

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v49

    and-int/lit8 v49, v49, 0x1

    if-nez v49, :cond_6ec

    .line 997
    const/16 v49, 0x39

    move/from16 v0, v18

    move/from16 v1, v49

    if-ne v0, v1, :cond_6d8

    .line 998
    const/16 v49, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 999
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v49

    if-eqz v49, :cond_6cd

    .line 1000
    add-int/lit8 v34, v34, 0x1

    .line 1001
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1003
    :cond_6cd
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 994
    .end local v33    # "j1":I
    :cond_6d1
    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    goto :goto_69f

    .line 1006
    .restart local v33    # "j1":I
    :cond_6d8
    if-lez v32, :cond_6e1

    .line 1007
    add-int/lit8 v49, v18, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v18, v0

    .line 1008
    :cond_6e1
    move-object/from16 v0, p6

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1009
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 1011
    :cond_6ec
    if-ltz v32, :cond_6fa

    if-nez v32, :cond_752

    if-nez p2, :cond_752

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v49

    and-int/lit8 v49, v49, 0x1

    if-nez v49, :cond_752

    .line 1016
    :cond_6fa
    if-lez v33, :cond_747

    .line 1019
    const/16 v49, 0x1

    move/from16 v0, v49

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v8

    .line 1020
    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    .line 1021
    if-gtz v33, :cond_718

    if-nez v33, :cond_747

    and-int/lit8 v49, v18, 0x1

    const/16 v50, 0x1

    move/from16 v0, v49

    move/from16 v1, v50

    if-eq v0, v1, :cond_718

    if-eqz p3, :cond_747

    :cond_718
    add-int/lit8 v49, v18, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v19, v0

    .end local v18    # "dig":C
    .local v19, "dig":C
    const/16 v49, 0x39

    move/from16 v0, v18

    move/from16 v1, v49

    if-ne v0, v1, :cond_745

    .line 1023
    const/16 v49, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1024
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v49

    if-eqz v49, :cond_741

    .line 1025
    add-int/lit8 v34, v34, 0x1

    .line 1026
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1028
    :cond_741
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    :cond_745
    move/from16 v18, v19

    .line 1032
    .end local v19    # "dig":C
    .restart local v18    # "dig":C
    :cond_747
    move-object/from16 v0, p6

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1033
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 1035
    :cond_752
    if-lez v33, :cond_78c

    .line 1036
    const/16 v49, 0x39

    move/from16 v0, v18

    move/from16 v1, v49

    if-ne v0, v1, :cond_77a

    .line 1040
    const/16 v49, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1041
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v49

    if-eqz v49, :cond_776

    .line 1042
    add-int/lit8 v34, v34, 0x1

    .line 1043
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1045
    :cond_776
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 1047
    :cond_77a
    add-int/lit8 v49, v18, 0x1

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v49, v0

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1048
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 1050
    :cond_78c
    move-object/from16 v0, p6

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1051
    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_7ca

    .line 1076
    .end local v16    # "delta":Ljava/math/BigInteger;
    .end local v33    # "j1":I
    :cond_799
    const/16 v49, 0x1

    move/from16 v0, v49

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v8

    .line 1077
    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v32

    .line 1078
    if-gtz v32, :cond_7b5

    if-nez v32, :cond_842

    and-int/lit8 v49, v18, 0x1

    const/16 v50, 0x1

    move/from16 v0, v49

    move/from16 v1, v50

    if-eq v0, v1, :cond_7b5

    if-eqz p3, :cond_842

    .line 1087
    :cond_7b5
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v49

    if-eqz v49, :cond_845

    .line 1088
    add-int/lit8 v34, v34, 0x1

    .line 1089
    const/16 v49, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1090
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 1053
    .restart local v16    # "delta":Ljava/math/BigInteger;
    .restart local v33    # "j1":I
    :cond_7ca
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    .line 1054
    move-object/from16 v0, v42

    move-object/from16 v1, v41

    if-ne v0, v1, :cond_7f0

    .line 1055
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v41

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v41

    .restart local v41    # "mhi":Ljava/math/BigInteger;
    move-object/from16 v42, v41

    .line 984
    :goto_7ec
    add-int/lit8 v26, v26, 0x1

    goto/16 :goto_674

    .line 1057
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_7f0
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v42

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v42

    .line 1058
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v41

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v41

    .restart local v41    # "mhi":Ljava/math/BigInteger;
    goto :goto_7ec

    .line 1063
    .end local v16    # "delta":Ljava/math/BigInteger;
    .end local v18    # "dig":C
    .end local v20    # "divResult":[Ljava/math/BigInteger;
    .end local v33    # "j1":I
    .end local v41    # "mhi":Ljava/math/BigInteger;
    :cond_80d
    const/16 v26, 0x1

    .line 1065
    :goto_80f
    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v20

    .line 1066
    .restart local v20    # "divResult":[Ljava/math/BigInteger;
    const/16 v49, 0x1

    aget-object v8, v20, v49

    .line 1067
    const/16 v49, 0x0

    aget-object v49, v20, v49

    invoke-virtual/range {v49 .. v49}, Ljava/math/BigInteger;->intValue()I

    move-result v49

    add-int/lit8 v49, v49, 0x30

    move/from16 v0, v49

    int-to-char v0, v0

    move/from16 v18, v0

    .line 1068
    .restart local v18    # "dig":C
    move-object/from16 v0, p6

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1069
    move/from16 v0, v26

    move/from16 v1, v29

    if-ge v0, v1, :cond_799

    .line 1071
    const-wide/16 v49, 0xa

    invoke-static/range {v49 .. v50}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    .line 1063
    add-int/lit8 v26, v26, 0x1

    goto :goto_80f

    .line 1094
    :cond_842
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    .line 1108
    :cond_845
    add-int/lit8 v49, v34, 0x1

    goto/16 :goto_59

    .line 596
    nop

    :pswitch_data_84a
    .packed-switch 0x0
        :pswitch_1ec
        :pswitch_1ec
        :pswitch_1f6
        :pswitch_204
        :pswitch_1f8
        :pswitch_206
    .end packed-switch
.end method

.method static JS_dtobasestr(ID)Ljava/lang/String;
    .registers 43
    .param p0, "base"    # I
    .param p1, "d"    # D

    .prologue
    .line 208
    const/16 v36, 0x2

    move/from16 v0, v36

    move/from16 v1, p0

    if-gt v0, v1, :cond_10

    const/16 v36, 0x24

    move/from16 v0, p0

    move/from16 v1, v36

    if-le v0, v1, :cond_2d

    .line 209
    :cond_10
    new-instance v36, Ljava/lang/IllegalArgumentException;

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Bad base: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 212
    :cond_2d
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v36

    if-eqz v36, :cond_36

    .line 213
    const-string v36, "NaN"

    .line 355
    :goto_35
    return-object v36

    .line 214
    :cond_36
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v36

    if-eqz v36, :cond_48

    .line 215
    const-wide/16 v36, 0x0

    cmpl-double v36, p1, v36

    if-lez v36, :cond_45

    const-string v36, "Infinity"

    goto :goto_35

    :cond_45
    const-string v36, "-Infinity"

    goto :goto_35

    .line 216
    :cond_48
    const-wide/16 v36, 0x0

    cmpl-double v36, p1, v36

    if-nez v36, :cond_51

    .line 218
    const-string v36, "0"

    goto :goto_35

    .line 222
    :cond_51
    const-wide/16 v36, 0x0

    cmpl-double v36, p1, v36

    if-ltz v36, :cond_7f

    .line 223
    const/16 v30, 0x0

    .line 232
    .local v30, "negative":Z
    :goto_59
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    .line 233
    .local v12, "dfloor":D
    double-to-long v0, v12

    move-wide/from16 v24, v0

    .line 234
    .local v24, "lfloor":J
    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v36, v0

    cmpl-double v36, v36, v12

    if-nez v36, :cond_87

    .line 236
    if-eqz v30, :cond_70

    move-wide/from16 v0, v24

    neg-long v0, v0

    move-wide/from16 v24, v0

    .end local v24    # "lfloor":J
    :cond_70
    move-wide/from16 v0, v24

    move/from16 v2, p0

    invoke-static {v0, v1, v2}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v21

    .line 260
    .local v21, "intDigits":Ljava/lang/String;
    :goto_78
    cmpl-double v36, p1, v12

    if-nez v36, :cond_e3

    move-object/from16 v36, v21

    .line 262
    goto :goto_35

    .line 225
    .end local v12    # "dfloor":D
    .end local v21    # "intDigits":Ljava/lang/String;
    .end local v30    # "negative":Z
    :cond_7f
    const/16 v30, 0x1

    .line 226
    .restart local v30    # "negative":Z
    move-wide/from16 v0, p1

    neg-double v0, v0

    move-wide/from16 p1, v0

    goto :goto_59

    .line 239
    .restart local v12    # "dfloor":D
    .restart local v24    # "lfloor":J
    :cond_87
    invoke-static {v12, v13}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v19

    .line 240
    .local v19, "floorBits":J
    const/16 v36, 0x34

    shr-long v36, v19, v36

    move-wide/from16 v0, v36

    long-to-int v0, v0

    move/from16 v36, v0

    move/from16 v0, v36

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v18, v0

    .line 242
    .local v18, "exp":I
    if-nez v18, :cond_cb

    .line 243
    const-wide v36, 0xfffffffffffffL

    and-long v36, v36, v19

    const/16 v38, 0x1

    shl-long v26, v36, v38

    .line 247
    .local v26, "mantissa":J
    :goto_a7
    if-eqz v30, :cond_ae

    .line 248
    move-wide/from16 v0, v26

    neg-long v0, v0

    move-wide/from16 v26, v0

    .line 250
    :cond_ae
    move/from16 v0, v18

    add-int/lit16 v0, v0, -0x433

    move/from16 v18, v0

    .line 251
    invoke-static/range {v26 .. v27}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v35

    .line 252
    .local v35, "x":Ljava/math/BigInteger;
    if-lez v18, :cond_d7

    .line 253
    move-object/from16 v0, v35

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v35

    .line 257
    :cond_c2
    :goto_c2
    move-object/from16 v0, v35

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v21

    .restart local v21    # "intDigits":Ljava/lang/String;
    goto :goto_78

    .line 245
    .end local v21    # "intDigits":Ljava/lang/String;
    .end local v26    # "mantissa":J
    .end local v35    # "x":Ljava/math/BigInteger;
    :cond_cb
    const-wide v36, 0xfffffffffffffL

    and-long v36, v36, v19

    const-wide/high16 v38, 0x10000000000000L

    or-long v26, v36, v38

    .restart local v26    # "mantissa":J
    goto :goto_a7

    .line 254
    .restart local v35    # "x":Ljava/math/BigInteger;
    :cond_d7
    if-gez v18, :cond_c2

    .line 255
    move/from16 v0, v18

    neg-int v0, v0

    move/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v35

    goto :goto_c2

    .line 271
    .end local v18    # "exp":I
    .end local v19    # "floorBits":J
    .end local v24    # "lfloor":J
    .end local v26    # "mantissa":J
    .end local v35    # "x":Ljava/math/BigInteger;
    .restart local v21    # "intDigits":Ljava/lang/String;
    :cond_e3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v6, "buffer":Ljava/lang/StringBuilder;
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x2e

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    sub-double v10, p1, v12

    .line 275
    .local v10, "df":D
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v7

    .line 276
    .local v7, "dBits":J
    const/16 v36, 0x20

    shr-long v36, v7, v36

    move-wide/from16 v0, v36

    long-to-int v0, v0

    move/from16 v33, v0

    .line 277
    .local v33, "word0":I
    long-to-int v0, v7

    move/from16 v34, v0

    .line 279
    .local v34, "word1":I
    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 280
    .local v17, "e":[I
    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v4, v0, [I

    .line 282
    .local v4, "bbits":[I
    move-object/from16 v0, v17

    invoke-static {v10, v11, v0, v4}, Lorg/mozilla/javascript/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v3

    .line 286
    .local v3, "b":Ljava/math/BigInteger;
    ushr-int/lit8 v36, v33, 0x14

    move/from16 v0, v36

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v36, v0

    move/from16 v0, v36

    neg-int v0, v0

    move/from16 v32, v0

    .line 287
    .local v32, "s2":I
    if-nez v32, :cond_12a

    .line 288
    const/16 v32, -0x1

    .line 289
    :cond_12a
    move/from16 v0, v32

    add-int/lit16 v0, v0, 0x434

    move/from16 v32, v0

    .line 292
    const-wide/16 v36, 0x1

    invoke-static/range {v36 .. v37}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v29

    .line 293
    .local v29, "mlo":Ljava/math/BigInteger;
    move-object/from16 v28, v29

    .line 294
    .local v28, "mhi":Ljava/math/BigInteger;
    if-nez v34, :cond_14f

    const v36, 0xfffff

    and-int v36, v36, v33

    if-nez v36, :cond_14f

    const/high16 v36, 0x7fe00000

    and-int v36, v36, v33

    if-eqz v36, :cond_14f

    .line 298
    add-int/lit8 v32, v32, 0x1

    .line 299
    const-wide/16 v36, 0x2

    invoke-static/range {v36 .. v37}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v28

    .line 302
    :cond_14f
    const/16 v36, 0x0

    aget v36, v17, v36

    add-int v36, v36, v32

    move/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 303
    const-wide/16 v36, 0x1

    invoke-static/range {v36 .. v37}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v31

    .line 304
    .local v31, "s":Ljava/math/BigInteger;
    invoke-virtual/range {v31 .. v32}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v31

    .line 310
    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v36, v0

    invoke-static/range {v36 .. v37}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    .line 312
    .local v5, "bigBase":Ljava/math/BigInteger;
    const/16 v16, 0x0

    .line 314
    .local v16, "done":Z
    :cond_170
    invoke-virtual {v3, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 315
    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v15

    .line 316
    .local v15, "divResult":[Ljava/math/BigInteger;
    const/16 v36, 0x1

    aget-object v3, v15, v36

    .line 317
    const/16 v36, 0x0

    aget-object v36, v15, v36

    invoke-virtual/range {v36 .. v36}, Ljava/math/BigInteger;->intValue()I

    move-result v36

    move/from16 v0, v36

    int-to-char v14, v0

    .line 318
    .local v14, "digit":I
    move-object/from16 v0, v29

    move-object/from16 v1, v28

    if-ne v0, v1, :cond_1ca

    .line 319
    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v28

    move-object/from16 v29, v28

    .line 326
    :goto_197
    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v22

    .line 328
    .local v22, "j":I
    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 329
    .local v9, "delta":Ljava/math/BigInteger;
    invoke-virtual {v9}, Ljava/math/BigInteger;->signum()I

    move-result v36

    if-gtz v36, :cond_1d7

    const/16 v23, 0x1

    .line 331
    .local v23, "j1":I
    :goto_1ad
    if-nez v23, :cond_1dc

    and-int/lit8 v36, v34, 0x1

    if-nez v36, :cond_1dc

    .line 332
    if-lez v22, :cond_1b7

    .line 333
    add-int/lit8 v14, v14, 0x1

    .line 334
    :cond_1b7
    const/16 v16, 0x1

    .line 352
    :cond_1b9
    :goto_1b9
    invoke-static {v14}, Lorg/mozilla/javascript/DToA;->BASEDIGIT(I)C

    move-result v36

    move/from16 v0, v36

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    if-eqz v16, :cond_170

    .line 355
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    goto/16 :goto_35

    .line 321
    .end local v9    # "delta":Ljava/math/BigInteger;
    .end local v22    # "j":I
    .end local v23    # "j1":I
    :cond_1ca
    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v29

    .line 322
    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v28

    goto :goto_197

    .line 329
    .restart local v9    # "delta":Ljava/math/BigInteger;
    .restart local v22    # "j":I
    :cond_1d7
    invoke-virtual {v3, v9}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v23

    goto :goto_1ad

    .line 336
    .restart local v23    # "j1":I
    :cond_1dc
    if-ltz v22, :cond_1e4

    if-nez v22, :cond_1fb

    and-int/lit8 v36, v34, 0x1

    if-nez v36, :cond_1fb

    .line 337
    :cond_1e4
    if-lez v23, :cond_1f8

    .line 340
    const/16 v36, 0x1

    move/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 341
    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v23

    .line 342
    if-lez v23, :cond_1f8

    .line 344
    add-int/lit8 v14, v14, 0x1

    .line 346
    :cond_1f8
    const/16 v16, 0x1

    goto :goto_1b9

    .line 347
    :cond_1fb
    if-lez v23, :cond_1b9

    .line 348
    add-int/lit8 v14, v14, 0x1

    .line 349
    const/16 v16, 0x1

    goto :goto_1b9
.end method

.method static JS_dtostr(Ljava/lang/StringBuilder;IID)V
    .registers 18
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "mode"    # I
    .param p2, "precision"    # I
    .param p3, "d"    # D

    .prologue
    .line 1135
    const/4 v0, 0x1

    new-array v5, v0, [Z

    .line 1141
    .local v5, "sign":[Z
    const/4 v0, 0x2

    if-ne p1, v0, :cond_19

    const-wide v0, 0x444b1ae4d6e2ef50L    # 1.0E21

    cmpl-double v0, p3, v0

    if-gez v0, :cond_18

    const-wide v0, -0x3bb4e51b291d10b0L    # -1.0E21

    cmpg-double v0, p3, v0

    if-gtz v0, :cond_19

    .line 1142
    :cond_18
    const/4 p1, 0x0

    .line 1144
    :cond_19
    sget-object v0, Lorg/mozilla/javascript/DToA;->dtoaModes:[I

    aget v2, v0, p1

    const/4 v0, 0x2

    if-lt p1, v0, :cond_98

    const/4 v3, 0x1

    :goto_21
    move-wide/from16 v0, p3

    move v4, p2

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lorg/mozilla/javascript/DToA;->JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I

    move-result v7

    .line 1145
    .local v7, "decPt":I
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    .line 1148
    .local v11, "nDigits":I
    const/16 v0, 0x270f

    if-eq v7, v0, :cond_63

    .line 1149
    const/4 v8, 0x0

    .line 1150
    .local v8, "exponentialNotation":Z
    const/4 v10, 0x0

    .line 1153
    .local v10, "minNDigits":I
    packed-switch p1, :pswitch_data_d6

    .line 1185
    :cond_36
    :goto_36
    if-ge v11, v10, :cond_45

    .line 1186
    move v12, v10

    .line 1187
    .local v12, "p":I
    move v11, v10

    .line 1189
    :cond_3a
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1190
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-ne v0, v12, :cond_3a

    .line 1193
    .end local v12    # "p":I
    :cond_45
    if-eqz v8, :cond_b7

    .line 1195
    const/4 v0, 0x1

    if-eq v11, v0, :cond_50

    .line 1196
    const/4 v0, 0x1

    const/16 v1, 0x2e

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1198
    :cond_50
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1199
    add-int/lit8 v0, v7, -0x1

    if-ltz v0, :cond_5e

    .line 1200
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1201
    :cond_5e
    add-int/lit8 v0, v7, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1219
    .end local v8    # "exponentialNotation":Z
    .end local v10    # "minNDigits":I
    :cond_63
    :goto_63
    const/4 v0, 0x0

    aget-boolean v0, v5, v0

    if-eqz v0, :cond_97

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_76

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v0

    if-eqz v0, :cond_97

    :cond_76
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const/high16 v1, 0x7ff00000

    and-int/2addr v0, v1

    const/high16 v1, 0x7ff00000

    if-ne v0, v1, :cond_91

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v0

    if-nez v0, :cond_97

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const v1, 0xfffff

    and-int/2addr v0, v1

    if-nez v0, :cond_97

    .line 1223
    :cond_91
    const/4 v0, 0x0

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1225
    :cond_97
    return-void

    .line 1144
    .end local v7    # "decPt":I
    .end local v11    # "nDigits":I
    :cond_98
    const/4 v3, 0x0

    goto :goto_21

    .line 1155
    .restart local v7    # "decPt":I
    .restart local v8    # "exponentialNotation":Z
    .restart local v10    # "minNDigits":I
    .restart local v11    # "nDigits":I
    :pswitch_9a
    const/4 v0, -0x5

    if-lt v7, v0, :cond_a1

    const/16 v0, 0x15

    if-le v7, v0, :cond_a3

    .line 1156
    :cond_a1
    const/4 v8, 0x1

    goto :goto_36

    .line 1158
    :cond_a3
    move v10, v7

    .line 1159
    goto :goto_36

    .line 1162
    :pswitch_a5
    if-ltz p2, :cond_aa

    .line 1163
    add-int v10, v7, p2

    goto :goto_36

    .line 1165
    :cond_aa
    move v10, v7

    .line 1166
    goto :goto_36

    .line 1170
    :pswitch_ac
    move v10, p2

    .line 1173
    :pswitch_ad
    const/4 v8, 0x1

    .line 1174
    goto :goto_36

    .line 1178
    :pswitch_af
    move v10, p2

    .line 1179
    const/4 v0, -0x5

    if-lt v7, v0, :cond_b5

    if-le v7, p2, :cond_36

    .line 1180
    :cond_b5
    const/4 v8, 0x1

    goto :goto_36

    .line 1203
    :cond_b7
    if-eq v7, v11, :cond_63

    .line 1206
    if-lez v7, :cond_c1

    .line 1208
    const/16 v0, 0x2e

    invoke-virtual {p0, v7, v0}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_63

    .line 1211
    :cond_c1
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_c2
    rsub-int/lit8 v0, v7, 0x1

    if-ge v9, v0, :cond_cf

    .line 1212
    const/4 v0, 0x0

    const/16 v1, 0x30

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1211
    add-int/lit8 v9, v9, 0x1

    goto :goto_c2

    .line 1213
    :cond_cf
    const/4 v0, 0x1

    const/16 v1, 0x2e

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_63

    .line 1153
    :pswitch_data_d6
    .packed-switch 0x0
        :pswitch_9a
        :pswitch_ad
        :pswitch_a5
        :pswitch_ac
        :pswitch_af
    .end packed-switch
.end method

.method private static d2b(D[I[I)Ljava/math/BigInteger;
    .registers 17
    .param p0, "d"    # D
    .param p2, "e"    # [I
    .param p3, "bits"    # [I

    .prologue
    .line 163
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 164
    .local v2, "dBits":J
    const/16 v10, 0x20

    ushr-long v10, v2, v10

    long-to-int v0, v10

    .line 165
    .local v0, "d0":I
    long-to-int v1, v2

    .line 167
    .local v1, "d1":I
    const v10, 0xfffff

    and-int v9, v0, v10

    .line 168
    .local v9, "z":I
    const v10, 0x7fffffff

    and-int/2addr v0, v10

    .line 170
    ushr-int/lit8 v5, v0, 0x14

    .local v5, "de":I
    if-eqz v5, :cond_1a

    .line 171
    const/high16 v10, 0x100000

    or-int/2addr v9, v10

    .line 173
    :cond_1a
    move v8, v1

    .local v8, "y":I
    if-eqz v1, :cond_55

    .line 174
    const/16 v10, 0x8

    new-array v4, v10, [B

    .line 175
    .local v4, "dbl_bits":[B
    invoke-static {v8}, Lorg/mozilla/javascript/DToA;->lo0bits(I)I

    move-result v7

    .line 176
    .local v7, "k":I
    ushr-int/2addr v8, v7

    .line 177
    if-eqz v7, :cond_4e

    .line 178
    const/4 v10, 0x4

    rsub-int/lit8 v11, v7, 0x20

    shl-int v11, v9, v11

    or-int/2addr v11, v8

    invoke-static {v4, v10, v11}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 179
    shr-int/2addr v9, v7

    .line 183
    :goto_32
    const/4 v10, 0x0

    invoke-static {v4, v10, v9}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 184
    if-eqz v9, :cond_53

    const/4 v6, 0x2

    .line 195
    .local v6, "i":I
    :goto_39
    if-eqz v5, :cond_65

    .line 196
    const/4 v10, 0x0

    add-int/lit16 v11, v5, -0x3ff

    add-int/lit8 v11, v11, -0x34

    add-int/2addr v11, v7

    aput v11, p2, v10

    .line 197
    const/4 v10, 0x0

    rsub-int/lit8 v11, v7, 0x35

    aput v11, p3, v10

    .line 203
    :goto_48
    new-instance v10, Ljava/math/BigInteger;

    invoke-direct {v10, v4}, Ljava/math/BigInteger;-><init>([B)V

    return-object v10

    .line 182
    .end local v6    # "i":I
    :cond_4e
    const/4 v10, 0x4

    invoke-static {v4, v10, v8}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    goto :goto_32

    .line 184
    :cond_53
    const/4 v6, 0x1

    goto :goto_39

    .line 188
    .end local v4    # "dbl_bits":[B
    .end local v7    # "k":I
    :cond_55
    const/4 v10, 0x4

    new-array v4, v10, [B

    .line 189
    .restart local v4    # "dbl_bits":[B
    invoke-static {v9}, Lorg/mozilla/javascript/DToA;->lo0bits(I)I

    move-result v7

    .line 190
    .restart local v7    # "k":I
    ushr-int/2addr v9, v7

    .line 191
    const/4 v10, 0x0

    invoke-static {v4, v10, v9}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 192
    add-int/lit8 v7, v7, 0x20

    .line 193
    const/4 v6, 0x1

    .restart local v6    # "i":I
    goto :goto_39

    .line 200
    :cond_65
    const/4 v10, 0x0

    add-int/lit16 v11, v5, -0x3ff

    add-int/lit8 v11, v11, -0x34

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v11, v7

    aput v11, p2, v10

    .line 201
    const/4 v10, 0x0

    mul-int/lit8 v11, v6, 0x20

    invoke-static {v9}, Lorg/mozilla/javascript/DToA;->hi0bits(I)I

    move-result v12

    sub-int/2addr v11, v12

    aput v11, p3, v10

    goto :goto_48
.end method

.method private static hi0bits(I)I
    .registers 3
    .param p0, "x"    # I

    .prologue
    .line 122
    const/4 v0, 0x0

    .line 124
    .local v0, "k":I
    const/high16 v1, -0x10000

    and-int/2addr v1, p0

    if-nez v1, :cond_a

    .line 125
    const/16 v0, 0x10

    .line 126
    shl-int/lit8 p0, p0, 0x10

    .line 128
    :cond_a
    const/high16 v1, -0x1000000

    and-int/2addr v1, p0

    if-nez v1, :cond_13

    .line 129
    add-int/lit8 v0, v0, 0x8

    .line 130
    shl-int/lit8 p0, p0, 0x8

    .line 132
    :cond_13
    const/high16 v1, -0x10000000

    and-int/2addr v1, p0

    if-nez v1, :cond_1c

    .line 133
    add-int/lit8 v0, v0, 0x4

    .line 134
    shl-int/lit8 p0, p0, 0x4

    .line 136
    :cond_1c
    const/high16 v1, -0x40000000    # -2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_25

    .line 137
    add-int/lit8 v0, v0, 0x2

    .line 138
    shl-int/lit8 p0, p0, 0x2

    .line 140
    :cond_25
    const/high16 v1, -0x80000000

    and-int/2addr v1, p0

    if-nez v1, :cond_34

    .line 141
    add-int/lit8 v0, v0, 0x1

    .line 142
    const/high16 v1, 0x40000000    # 2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_34

    .line 143
    const/16 v1, 0x20

    .line 145
    :goto_33
    return v1

    :cond_34
    move v1, v0

    goto :goto_33
.end method

.method private static lo0bits(I)I
    .registers 4
    .param p0, "y"    # I

    .prologue
    .line 83
    move v1, p0

    .line 85
    .local v1, "x":I
    and-int/lit8 v2, v1, 0x7

    if-eqz v2, :cond_13

    .line 86
    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_b

    .line 87
    const/4 v0, 0x0

    .line 116
    :cond_a
    :goto_a
    return v0

    .line 88
    :cond_b
    and-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_11

    .line 89
    const/4 v0, 0x1

    goto :goto_a

    .line 91
    :cond_11
    const/4 v0, 0x2

    goto :goto_a

    .line 93
    :cond_13
    const/4 v0, 0x0

    .line 94
    .local v0, "k":I
    const v2, 0xffff

    and-int/2addr v2, v1

    if-nez v2, :cond_1e

    .line 95
    const/16 v0, 0x10

    .line 96
    ushr-int/lit8 v1, v1, 0x10

    .line 98
    :cond_1e
    and-int/lit16 v2, v1, 0xff

    if-nez v2, :cond_26

    .line 99
    add-int/lit8 v0, v0, 0x8

    .line 100
    ushr-int/lit8 v1, v1, 0x8

    .line 102
    :cond_26
    and-int/lit8 v2, v1, 0xf

    if-nez v2, :cond_2e

    .line 103
    add-int/lit8 v0, v0, 0x4

    .line 104
    ushr-int/lit8 v1, v1, 0x4

    .line 106
    :cond_2e
    and-int/lit8 v2, v1, 0x3

    if-nez v2, :cond_36

    .line 107
    add-int/lit8 v0, v0, 0x2

    .line 108
    ushr-int/lit8 v1, v1, 0x2

    .line 110
    :cond_36
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_a

    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    ushr-int/lit8 v1, v1, 0x1

    .line 113
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_a

    .line 114
    const/16 v0, 0x20

    goto :goto_a
.end method

.method static pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;
    .registers 4
    .param p0, "b"    # Ljava/math/BigInteger;
    .param p1, "k"    # I

    .prologue
    .line 417
    const-wide/16 v0, 0x5

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method static roundOff(Ljava/lang/StringBuilder;)Z
    .registers 5
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    const/4 v2, 0x0

    .line 422
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 423
    .local v1, "i":I
    :cond_5
    if-eqz v1, :cond_1d

    .line 424
    add-int/lit8 v1, v1, -0x1

    .line 425
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    .line 426
    .local v0, "c":C
    const/16 v3, 0x39

    if-eq v0, v3, :cond_5

    .line 427
    add-int/lit8 v3, v0, 0x1

    int-to-char v3, v3

    invoke-virtual {p0, v1, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 428
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 433
    .end local v0    # "c":C
    :goto_1c
    return v2

    .line 432
    :cond_1d
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 433
    const/4 v2, 0x1

    goto :goto_1c
.end method

.method static setWord0(DI)D
    .registers 9
    .param p0, "d"    # D
    .param p2, "i"    # I

    .prologue
    .line 402
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 403
    .local v0, "dBits":J
    int-to-long v2, p2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    and-long/2addr v4, v0

    or-long v0, v2, v4

    .line 404
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    return-wide v2
.end method

.method private static stripTrailingZeroes(Ljava/lang/StringBuilder;)V
    .registers 5
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 1116
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .local v0, "bl":I
    move v1, v0

    .line 1117
    .end local v0    # "bl":I
    .local v1, "bl":I
    :goto_5
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "bl":I
    .restart local v0    # "bl":I
    if-lez v1, :cond_13

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-ne v2, v3, :cond_13

    move v1, v0

    .end local v0    # "bl":I
    .restart local v1    # "bl":I
    goto :goto_5

    .line 1120
    .end local v1    # "bl":I
    .restart local v0    # "bl":I
    :cond_13
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1121
    return-void
.end method

.method private static stuffBits([BII)V
    .registers 5
    .param p0, "bits"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I

    .prologue
    .line 150
    shr-int/lit8 v0, p2, 0x18

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 151
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 152
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 153
    add-int/lit8 v0, p1, 0x3

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 154
    return-void
.end method

.method static word0(D)I
    .registers 6
    .param p0, "d"    # D

    .prologue
    .line 396
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 397
    .local v0, "dBits":J
    const/16 v2, 0x20

    shr-long v2, v0, v2

    long-to-int v2, v2

    return v2
.end method

.method static word1(D)I
    .registers 5
    .param p0, "d"    # D

    .prologue
    .line 409
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 410
    .local v0, "dBits":J
    long-to-int v2, v0

    return v2
.end method
