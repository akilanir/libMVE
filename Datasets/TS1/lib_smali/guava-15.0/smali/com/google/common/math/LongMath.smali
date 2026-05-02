.class public final Lcom/google/common/math/LongMath;
.super Ljava/lang/Object;
.source "LongMath.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/math/LongMath$1;
    }
.end annotation


# static fields
.field static final FLOOR_SQRT_MAX_LONG:J = 0xb504f333L
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final MAX_POWER_OF_SQRT2_UNSIGNED:J = -0x4afb0ccc06219b7cL
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final biggestBinomials:[I

.field static final biggestSimpleBinomials:[I
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final factorials:[J

.field static final halfPowersOf10:[J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final maxLog10ForLeadingZeros:[B
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final powersOf10:[J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x13

    .line 169
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_36

    sput-object v0, Lcom/google/common/math/LongMath;->maxLog10ForLeadingZeros:[B

    .line 176
    new-array v0, v1, [J

    fill-array-data v0, :array_5a

    sput-object v0, Lcom/google/common/math/LongMath;->powersOf10:[J

    .line 201
    new-array v0, v1, [J

    fill-array-data v0, :array_aa

    sput-object v0, Lcom/google/common/math/LongMath;->halfPowersOf10:[J

    .line 614
    const/16 v0, 0x15

    new-array v0, v0, [J

    fill-array-data v0, :array_fa

    sput-object v0, Lcom/google/common/math/LongMath;->factorials:[J

    .line 723
    const/16 v0, 0x22

    new-array v0, v0, [I

    fill-array-data v0, :array_152

    sput-object v0, Lcom/google/common/math/LongMath;->biggestBinomials:[I

    .line 732
    const/16 v0, 0x1f

    new-array v0, v0, [I

    fill-array-data v0, :array_19a

    sput-object v0, Lcom/google/common/math/LongMath;->biggestSimpleBinomials:[I

    return-void

    .line 169
    nop

    :array_36
    .array-data 1
        0x13t
        0x12t
        0x12t
        0x12t
        0x12t
        0x11t
        0x11t
        0x11t
        0x10t
        0x10t
        0x10t
        0xft
        0xft
        0xft
        0xft
        0xet
        0xet
        0xet
        0xdt
        0xdt
        0xdt
        0xct
        0xct
        0xct
        0xct
        0xbt
        0xbt
        0xbt
        0xat
        0xat
        0xat
        0x9t
        0x9t
        0x9t
        0x9t
        0x8t
        0x8t
        0x8t
        0x7t
        0x7t
        0x7t
        0x6t
        0x6t
        0x6t
        0x6t
        0x5t
        0x5t
        0x5t
        0x4t
        0x4t
        0x4t
        0x3t
        0x3t
        0x3t
        0x3t
        0x2t
        0x2t
        0x2t
        0x1t
        0x1t
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 176
    :array_5a
    .array-data 8
        0x1
        0xa
        0x64
        0x3e8
        0x2710
        0x186a0
        0xf4240
        0x989680
        0x5f5e100
        0x3b9aca00
        0x2540be400L
        0x174876e800L
        0xe8d4a51000L
        0x9184e72a000L
        0x5af3107a4000L
        0x38d7ea4c68000L
        0x2386f26fc10000L
        0x16345785d8a0000L
        0xde0b6b3a7640000L
    .end array-data

    .line 201
    :array_aa
    .array-data 8
        0x3
        0x1f
        0x13c
        0xc5a
        0x7b86
        0x4d343
        0x3040a5
        0x1e28678
        0x12d940b6
        0xbc7c871cL
        0x75cdd4719L
        0x49a0a4c700L
        0x2e0466fc608L
        0x1cc2c05dbc53L
        0x11f9b83a95b45L
        0xb3c13249d90bbL
        0x7058bf6e27a751L
        0x463777a4d8c892dL
        0x2be2aac7077d5bc3L    # 2.731041190138108E-97
    .end array-data

    .line 614
    :array_fa
    .array-data 8
        0x1
        0x1
        0x2
        0x6
        0x18
        0x78
        0x2d0
        0x13b0
        0x9d80
        0x58980
        0x375f00
        0x2611500
        0x1c8cfc00
        0x17328cc00L
        0x144c3b2800L
        0x13077775800L
        0x130777758000L
        0x1437eeecd8000L
        0x16beecca730000L
        0x1b02b9306890000L
        0x21c3677c82b40000L
    .end array-data

    .line 723
    :array_152
    .array-data 4
        0x7fffffff
        0x7fffffff
        0x7fffffff
        0x3a25db
        0x1dc79
        0x3f2f
        0x10f1
        0x6c5
        0x377
        0x216
        0x169
        0x109
        0xce
        0xa9
        0x8f
        0x7d
        0x6f
        0x65
        0x5e
        0x58
        0x53
        0x4f
        0x4c
        0x4a
        0x48
        0x46
        0x45
        0x44
        0x43
        0x43
        0x42
        0x42
        0x42
        0x42
    .end array-data

    .line 732
    :array_19a
    .array-data 4
        0x7fffffff
        0x7fffffff
        0x7fffffff
        0x285146
        0x150eb
        0x2dcc
        0xc92
        0x521
        0x2ac
        0x1a3
        0x11f
        0xd6
        0xa9
        0x8b
        0x77
        0x69
        0x5f
        0x57
        0x51
        0x4c
        0x49
        0x46
        0x44
        0x42
        0x40
        0x3f
        0x3e
        0x3e
        0x3d
        0x3d
        0x3d
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static binomial(II)J
    .registers 20
    .param p0, "n"    # I
    .param p1, "k"    # I

    .prologue
    .line 645
    const-string v12, "n"

    move/from16 v0, p0

    invoke-static {v12, v0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 646
    const-string v12, "k"

    move/from16 v0, p1

    invoke-static {v12, v0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 647
    move/from16 v0, p1

    move/from16 v1, p0

    if-gt v0, v1, :cond_50

    const/4 v12, 0x1

    :goto_15
    const-string v13, "k (%s) > n (%s)"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 648
    shr-int/lit8 v12, p0, 0x1

    move/from16 v0, p1

    if-le v0, v12, :cond_33

    .line 649
    sub-int p1, p0, p1

    .line 651
    :cond_33
    packed-switch p1, :pswitch_data_d0

    .line 657
    sget-object v12, Lcom/google/common/math/LongMath;->factorials:[J

    array-length v12, v12

    move/from16 v0, p0

    if-ge v0, v12, :cond_59

    .line 658
    sget-object v12, Lcom/google/common/math/LongMath;->factorials:[J

    aget-wide v12, v12, p0

    sget-object v14, Lcom/google/common/math/LongMath;->factorials:[J

    aget-wide v14, v14, p1

    sget-object v16, Lcom/google/common/math/LongMath;->factorials:[J

    sub-int v17, p0, p1

    aget-wide v16, v16, v17

    mul-long v14, v14, v16

    div-long v2, v12, v14

    .line 699
    :cond_4f
    :goto_4f
    return-wide v2

    .line 647
    :cond_50
    const/4 v12, 0x0

    goto :goto_15

    .line 653
    :pswitch_52
    const-wide/16 v2, 0x1

    goto :goto_4f

    .line 655
    :pswitch_55
    move/from16 v0, p0

    int-to-long v2, v0

    goto :goto_4f

    .line 659
    :cond_59
    sget-object v12, Lcom/google/common/math/LongMath;->biggestBinomials:[I

    array-length v12, v12

    move/from16 v0, p1

    if-ge v0, v12, :cond_68

    sget-object v12, Lcom/google/common/math/LongMath;->biggestBinomials:[I

    aget v12, v12, p1

    move/from16 v0, p0

    if-le v0, v12, :cond_6e

    .line 660
    :cond_68
    const-wide v2, 0x7fffffffffffffffL

    goto :goto_4f

    .line 661
    :cond_6e
    sget-object v12, Lcom/google/common/math/LongMath;->biggestSimpleBinomials:[I

    array-length v12, v12

    move/from16 v0, p1

    if-ge v0, v12, :cond_94

    sget-object v12, Lcom/google/common/math/LongMath;->biggestSimpleBinomials:[I

    aget v12, v12, p1

    move/from16 v0, p0

    if-gt v0, v12, :cond_94

    .line 663
    add-int/lit8 v9, p0, -0x1

    .end local p0    # "n":I
    .local v9, "n":I
    move/from16 v0, p0

    int-to-long v2, v0

    .line 664
    .local v2, "result":J
    const/4 v8, 0x2

    .local v8, "i":I
    move/from16 p0, v9

    .end local v9    # "n":I
    .restart local p0    # "n":I
    :goto_85
    move/from16 v0, p1

    if-gt v8, v0, :cond_4f

    .line 665
    move/from16 v0, p0

    int-to-long v12, v0

    mul-long/2addr v2, v12

    .line 666
    int-to-long v12, v8

    div-long/2addr v2, v12

    .line 664
    add-int/lit8 p0, p0, -0x1

    add-int/lit8 v8, v8, 0x1

    goto :goto_85

    .line 670
    .end local v2    # "result":J
    .end local v8    # "i":I
    :cond_94
    move/from16 v0, p0

    int-to-long v12, v0

    sget-object v14, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {v12, v13, v14}, Lcom/google/common/math/LongMath;->log2(JLjava/math/RoundingMode;)I

    move-result v10

    .line 672
    .local v10, "nBits":I
    const-wide/16 v2, 0x1

    .line 673
    .restart local v2    # "result":J
    add-int/lit8 v9, p0, -0x1

    .end local p0    # "n":I
    .restart local v9    # "n":I
    move/from16 v0, p0

    int-to-long v4, v0

    .line 674
    .local v4, "numerator":J
    const-wide/16 v6, 0x1

    .line 676
    .local v6, "denominator":J
    move v11, v10

    .line 684
    .local v11, "numeratorBits":I
    const/4 v8, 0x2

    .restart local v8    # "i":I
    move/from16 p0, v9

    .end local v9    # "n":I
    .restart local p0    # "n":I
    :goto_aa
    move/from16 v0, p1

    if-gt v8, v0, :cond_ca

    .line 685
    add-int v12, v11, v10

    const/16 v13, 0x3f

    if-ge v12, v13, :cond_c0

    .line 687
    move/from16 v0, p0

    int-to-long v12, v0

    mul-long/2addr v4, v12

    .line 688
    int-to-long v12, v8

    mul-long/2addr v6, v12

    .line 689
    add-int/2addr v11, v10

    .line 684
    :goto_bb
    add-int/lit8 v8, v8, 0x1

    add-int/lit8 p0, p0, -0x1

    goto :goto_aa

    .line 693
    :cond_c0
    invoke-static/range {v2 .. v7}, Lcom/google/common/math/LongMath;->multiplyFraction(JJJ)J

    move-result-wide v2

    .line 694
    move/from16 v0, p0

    int-to-long v4, v0

    .line 695
    int-to-long v6, v8

    .line 696
    move v11, v10

    goto :goto_bb

    .line 699
    :cond_ca
    invoke-static/range {v2 .. v7}, Lcom/google/common/math/LongMath;->multiplyFraction(JJJ)J

    move-result-wide v2

    goto :goto_4f

    .line 651
    nop

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_52
        :pswitch_55
    .end packed-switch
.end method

.method public static checkedAdd(JJ)J
    .registers 13
    .param p0, "a"    # J
    .param p2, "b"    # J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 505
    add-long v0, p0, p2

    .line 506
    .local v0, "result":J
    xor-long v4, p0, p2

    cmp-long v4, v4, v7

    if-gez v4, :cond_18

    move v4, v2

    :goto_d
    xor-long v5, p0, v0

    cmp-long v5, v5, v7

    if-ltz v5, :cond_1a

    :goto_13
    or-int/2addr v2, v4

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 507
    return-wide v0

    :cond_18
    move v4, v3

    .line 506
    goto :goto_d

    :cond_1a
    move v2, v3

    goto :goto_13
.end method

.method public static checkedMultiply(JJ)J
    .registers 16
    .param p0, "a"    # J
    .param p2, "b"    # J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    const-wide/16 v8, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 530
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v3

    xor-long v6, p0, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v6

    add-int/2addr v3, v6

    invoke-static {p2, p3}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v6

    add-int/2addr v3, v6

    xor-long v6, p2, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v6

    add-int v0, v3, v6

    .line 542
    .local v0, "leadingZeros":I
    const/16 v3, 0x41

    if-le v0, v3, :cond_25

    .line 543
    mul-long v1, p0, p2

    .line 549
    :goto_24
    return-wide v1

    .line 545
    :cond_25
    const/16 v3, 0x40

    if-lt v0, v3, :cond_4e

    move v3, v4

    :goto_2a
    invoke-static {v3}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 546
    cmp-long v3, p0, v10

    if-ltz v3, :cond_50

    move v6, v4

    :goto_32
    const-wide/high16 v7, -0x8000000000000000L

    cmp-long v3, p2, v7

    if-eqz v3, :cond_52

    move v3, v4

    :goto_39
    or-int/2addr v3, v6

    invoke-static {v3}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 547
    mul-long v1, p0, p2

    .line 548
    .local v1, "result":J
    cmp-long v3, p0, v10

    if-eqz v3, :cond_49

    div-long v6, v1, p0

    cmp-long v3, v6, p2

    if-nez v3, :cond_4a

    :cond_49
    move v5, v4

    :cond_4a
    invoke-static {v5}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    goto :goto_24

    .end local v1    # "result":J
    :cond_4e
    move v3, v5

    .line 545
    goto :goto_2a

    :cond_50
    move v6, v5

    .line 546
    goto :goto_32

    :cond_52
    move v3, v5

    goto :goto_39
.end method

.method public static checkedPow(JI)J
    .registers 15
    .param p0, "b"    # J
    .param p2, "k"    # I
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const-wide/16 v4, -0x1

    const-wide/16 v2, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 560
    const-string v8, "exponent"

    invoke-static {v8, p2}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 561
    const-wide/16 v8, -0x2

    cmp-long v8, p0, v8

    if-ltz v8, :cond_26

    move v9, v6

    :goto_12
    const-wide/16 v10, 0x2

    cmp-long v8, p0, v10

    if-gtz v8, :cond_28

    move v8, v6

    :goto_19
    and-int/2addr v8, v9

    if-eqz v8, :cond_54

    .line 562
    long-to-int v8, p0

    packed-switch v8, :pswitch_data_7e

    .line 576
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    :cond_26
    move v9, v7

    .line 561
    goto :goto_12

    :cond_28
    move v8, v7

    goto :goto_19

    .line 564
    :pswitch_2a
    if-nez p2, :cond_2d

    .line 585
    :cond_2c
    :goto_2c
    :pswitch_2c
    return-wide v2

    .line 564
    :cond_2d
    const-wide/16 v2, 0x0

    goto :goto_2c

    .line 568
    :pswitch_30
    and-int/lit8 v6, p2, 0x1

    if-eqz v6, :cond_2c

    move-wide v2, v4

    goto :goto_2c

    .line 570
    :pswitch_36
    const/16 v4, 0x3f

    if-ge p2, v4, :cond_40

    move v4, v6

    :goto_3b
    invoke-static {v4}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 571
    shl-long/2addr v2, p2

    goto :goto_2c

    :cond_40
    move v4, v7

    .line 570
    goto :goto_3b

    .line 573
    :pswitch_42
    const/16 v8, 0x40

    if-ge p2, v8, :cond_4f

    :goto_46
    invoke-static {v6}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 574
    and-int/lit8 v6, p2, 0x1

    if-nez v6, :cond_51

    shl-long/2addr v2, p2

    goto :goto_2c

    :cond_4f
    move v6, v7

    .line 573
    goto :goto_46

    .line 574
    :cond_51
    shl-long v2, v4, p2

    goto :goto_2c

    .line 579
    :cond_54
    const-wide/16 v0, 0x1

    .line 581
    .local v0, "accum":J
    :cond_56
    :goto_56
    packed-switch p2, :pswitch_data_8c

    .line 587
    and-int/lit8 v2, p2, 0x1

    if-eqz v2, :cond_61

    .line 588
    invoke-static {v0, v1, p0, p1}, Lcom/google/common/math/LongMath;->checkedMultiply(JJ)J

    move-result-wide v0

    .line 590
    :cond_61
    shr-int/lit8 p2, p2, 0x1

    .line 591
    if-lez p2, :cond_56

    .line 592
    const-wide v2, 0xb504f333L

    cmp-long v2, p0, v2

    if-gtz v2, :cond_7b

    move v2, v6

    :goto_6f
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 593
    mul-long/2addr p0, p0

    goto :goto_56

    :pswitch_74
    move-wide v2, v0

    .line 583
    goto :goto_2c

    .line 585
    :pswitch_76
    invoke-static {v0, v1, p0, p1}, Lcom/google/common/math/LongMath;->checkedMultiply(JJ)J

    move-result-wide v2

    goto :goto_2c

    :cond_7b
    move v2, v7

    .line 592
    goto :goto_6f

    .line 562
    nop

    :pswitch_data_7e
    .packed-switch -0x2
        :pswitch_42
        :pswitch_30
        :pswitch_2a
        :pswitch_2c
        :pswitch_36
    .end packed-switch

    .line 581
    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_74
        :pswitch_76
    .end packed-switch
.end method

.method public static checkedSubtract(JJ)J
    .registers 13
    .param p0, "a"    # J
    .param p2, "b"    # J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 517
    sub-long v0, p0, p2

    .line 518
    .local v0, "result":J
    xor-long v4, p0, p2

    cmp-long v4, v4, v7

    if-ltz v4, :cond_18

    move v4, v2

    :goto_d
    xor-long v5, p0, v0

    cmp-long v5, v5, v7

    if-ltz v5, :cond_1a

    :goto_13
    or-int/2addr v2, v4

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 519
    return-wide v0

    :cond_18
    move v4, v3

    .line 518
    goto :goto_d

    :cond_1a
    move v2, v3

    goto :goto_13
.end method

.method public static divide(JJLjava/math/RoundingMode;)J
    .registers 23
    .param p0, "p"    # J
    .param p2, "q"    # J
    .param p4, "mode"    # Ljava/math/RoundingMode;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 348
    invoke-static/range {p4 .. p4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    div-long v5, p0, p2

    .line 350
    .local v5, "div":J
    mul-long v11, p2, v5

    sub-long v8, p0, v11

    .line 352
    .local v8, "rem":J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-nez v11, :cond_10

    .line 397
    .end local v5    # "div":J
    :cond_f
    :goto_f
    return-wide v5

    .line 363
    .restart local v5    # "div":J
    :cond_10
    xor-long v11, p0, p2

    const/16 v13, 0x3f

    shr-long/2addr v11, v13

    long-to-int v11, v11

    or-int/lit8 v10, v11, 0x1

    .line 365
    .local v10, "signum":I
    sget-object v11, Lcom/google/common/math/LongMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual/range {p4 .. p4}, Ljava/math/RoundingMode;->ordinal()I

    move-result v12

    aget v11, v11, v12

    packed-switch v11, :pswitch_data_88

    .line 395
    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11}, Ljava/lang/AssertionError;-><init>()V

    throw v11

    .line 367
    :pswitch_29
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-nez v11, :cond_39

    const/4 v11, 0x1

    :goto_30
    invoke-static {v11}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 370
    :pswitch_33
    const/4 v7, 0x0

    .line 397
    .local v7, "increment":Z
    :goto_34
    if-eqz v7, :cond_f

    int-to-long v11, v10

    add-long/2addr v5, v11

    goto :goto_f

    .line 367
    .end local v7    # "increment":Z
    :cond_39
    const/4 v11, 0x0

    goto :goto_30

    .line 373
    :pswitch_3b
    const/4 v7, 0x1

    .line 374
    .restart local v7    # "increment":Z
    goto :goto_34

    .line 376
    .end local v7    # "increment":Z
    :pswitch_3d
    if-lez v10, :cond_41

    const/4 v7, 0x1

    .line 377
    .restart local v7    # "increment":Z
    :goto_40
    goto :goto_34

    .line 376
    .end local v7    # "increment":Z
    :cond_41
    const/4 v7, 0x0

    goto :goto_40

    .line 379
    :pswitch_43
    if-gez v10, :cond_47

    const/4 v7, 0x1

    .line 380
    .restart local v7    # "increment":Z
    :goto_46
    goto :goto_34

    .line 379
    .end local v7    # "increment":Z
    :cond_47
    const/4 v7, 0x0

    goto :goto_46

    .line 384
    :pswitch_49
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    .line 385
    .local v1, "absRem":J
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v11

    sub-long/2addr v11, v1

    sub-long v3, v1, v11

    .line 388
    .local v3, "cmpRemToHalfDivisor":J
    const-wide/16 v11, 0x0

    cmp-long v11, v3, v11

    if-nez v11, :cond_7e

    .line 389
    sget-object v11, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    move-object/from16 v0, p4

    if-ne v0, v11, :cond_77

    const/4 v11, 0x1

    :goto_61
    sget-object v12, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    move-object/from16 v0, p4

    if-ne v0, v12, :cond_79

    const/4 v12, 0x1

    move v13, v12

    :goto_69
    const-wide/16 v14, 0x1

    and-long/2addr v14, v5

    const-wide/16 v16, 0x0

    cmp-long v12, v14, v16

    if-eqz v12, :cond_7c

    const/4 v12, 0x1

    :goto_73
    and-int/2addr v12, v13

    or-int v7, v11, v12

    .restart local v7    # "increment":Z
    goto :goto_34

    .end local v7    # "increment":Z
    :cond_77
    const/4 v11, 0x0

    goto :goto_61

    :cond_79
    const/4 v12, 0x0

    move v13, v12

    goto :goto_69

    :cond_7c
    const/4 v12, 0x0

    goto :goto_73

    .line 391
    :cond_7e
    const-wide/16 v11, 0x0

    cmp-long v11, v3, v11

    if-lez v11, :cond_86

    const/4 v7, 0x1

    .line 393
    .restart local v7    # "increment":Z
    :goto_85
    goto :goto_34

    .line 391
    .end local v7    # "increment":Z
    :cond_86
    const/4 v7, 0x0

    goto :goto_85

    .line 365
    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_29
        :pswitch_33
        :pswitch_43
        :pswitch_3b
        :pswitch_3d
        :pswitch_49
        :pswitch_49
        :pswitch_49
    .end packed-switch
.end method

.method public static factorial(I)J
    .registers 3
    .param p0, "n"    # I
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 610
    const-string v0, "n"

    invoke-static {v0, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 611
    sget-object v0, Lcom/google/common/math/LongMath;->factorials:[J

    array-length v0, v0

    if-ge p0, v0, :cond_f

    sget-object v0, Lcom/google/common/math/LongMath;->factorials:[J

    aget-wide v0, v0, p0

    :goto_e
    return-wide v0

    :cond_f
    const-wide v0, 0x7fffffffffffffffL

    goto :goto_e
.end method

.method static fitsInInt(J)Z
    .registers 4
    .param p0, "x"    # J

    .prologue
    .line 740
    long-to-int v0, p0

    int-to-long v0, v0

    cmp-long v0, v0, p0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static gcd(JJ)J
    .registers 13
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    const-wide/16 v7, 0x0

    .line 459
    const-string v6, "a"

    invoke-static {v6, p0, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;J)J

    .line 460
    const-string v6, "b"

    invoke-static {v6, p2, p3}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;J)J

    .line 461
    cmp-long v6, p0, v7

    if-nez v6, :cond_12

    move-wide p0, p2

    .line 495
    .end local p0    # "a":J
    :cond_11
    :goto_11
    return-wide p0

    .line 465
    .restart local p0    # "a":J
    :cond_12
    cmp-long v6, p2, v7

    if-eqz v6, :cond_11

    .line 472
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v0

    .line 473
    .local v0, "aTwos":I
    shr-long/2addr p0, v0

    .line 474
    invoke-static {p2, p3}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v1

    .line 475
    .local v1, "bTwos":I
    shr-long/2addr p2, v1

    .line 476
    :goto_20
    cmp-long v6, p0, p2

    if-eqz v6, :cond_37

    .line 484
    sub-long v2, p0, p2

    .line 486
    .local v2, "delta":J
    const/16 v6, 0x3f

    shr-long v6, v2, v6

    and-long v4, v2, v6

    .line 489
    .local v4, "minDeltaOrZero":J
    sub-long v6, v2, v4

    sub-long p0, v6, v4

    .line 492
    add-long/2addr p2, v4

    .line 493
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v6

    shr-long/2addr p0, v6

    .line 494
    goto :goto_20

    .line 495
    .end local v2    # "delta":J
    .end local v4    # "minDeltaOrZero":J
    :cond_37
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    shl-long/2addr p0, v6

    goto :goto_11
.end method

.method public static isPowerOfTwo(J)Z
    .registers 9
    .param p0, "x"    # J

    .prologue
    const-wide/16 v5, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 62
    cmp-long v2, p0, v5

    if-lez v2, :cond_14

    move v2, v0

    :goto_9
    const-wide/16 v3, 0x1

    sub-long v3, p0, v3

    and-long/2addr v3, p0

    cmp-long v3, v3, v5

    if-nez v3, :cond_16

    :goto_12
    and-int/2addr v0, v2

    return v0

    :cond_14
    move v2, v1

    goto :goto_9

    :cond_16
    move v0, v1

    goto :goto_12
.end method

.method static lessThanBranchFree(JJ)I
    .registers 8
    .param p0, "x"    # J
    .param p2, "y"    # J
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 73
    sub-long v0, p0, p2

    xor-long/2addr v0, v2

    xor-long/2addr v0, v2

    const/16 v2, 0x3f

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static log10(JLjava/math/RoundingMode;)I
    .registers 8
    .param p0, "x"    # J
    .param p2, "mode"    # Ljava/math/RoundingMode;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 128
    const-string v3, "x"

    invoke-static {v3, p0, p1}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;J)J

    .line 129
    invoke-static {p0, p1}, Lcom/google/common/math/LongMath;->log10Floor(J)I

    move-result v2

    .line 130
    .local v2, "logFloor":I
    sget-object v3, Lcom/google/common/math/LongMath;->powersOf10:[J

    aget-wide v0, v3, v2

    .line 131
    .local v0, "floorPow":J
    sget-object v3, Lcom/google/common/math/LongMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_3a

    .line 147
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 133
    :pswitch_1e
    cmp-long v3, p0, v0

    if-nez v3, :cond_27

    const/4 v3, 0x1

    :goto_23
    invoke-static {v3}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 145
    .end local v2    # "logFloor":I
    :goto_26
    :pswitch_26
    return v2

    .line 133
    .restart local v2    # "logFloor":I
    :cond_27
    const/4 v3, 0x0

    goto :goto_23

    .line 140
    :pswitch_29
    invoke-static {v0, v1, p0, p1}, Lcom/google/common/math/LongMath;->lessThanBranchFree(JJ)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_26

    .line 145
    :pswitch_2f
    sget-object v3, Lcom/google/common/math/LongMath;->halfPowersOf10:[J

    aget-wide v3, v3, v2

    invoke-static {v3, v4, p0, p1}, Lcom/google/common/math/LongMath;->lessThanBranchFree(JJ)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_26

    .line 131
    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_26
        :pswitch_26
        :pswitch_29
        :pswitch_29
        :pswitch_2f
        :pswitch_2f
        :pswitch_2f
    .end packed-switch
.end method

.method static log10Floor(J)I
    .registers 5
    .param p0, "x"    # J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 160
    sget-object v1, Lcom/google/common/math/LongMath;->maxLog10ForLeadingZeros:[B

    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v2

    aget-byte v0, v1, v2

    .line 165
    .local v0, "y":I
    sget-object v1, Lcom/google/common/math/LongMath;->powersOf10:[J

    aget-wide v1, v1, v0

    invoke-static {p0, p1, v1, v2}, Lcom/google/common/math/LongMath;->lessThanBranchFree(JJ)I

    move-result v1

    sub-int v1, v0, v1

    return v1
.end method

.method public static log2(JLjava/math/RoundingMode;)I
    .registers 9
    .param p0, "x"    # J
    .param p2, "mode"    # Ljava/math/RoundingMode;

    .prologue
    .line 86
    const-string v4, "x"

    invoke-static {v4, p0, p1}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;J)J

    .line 87
    sget-object v4, Lcom/google/common/math/LongMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_44

    .line 110
    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "impossible"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 89
    :pswitch_18
    invoke-static {p0, p1}, Lcom/google/common/math/LongMath;->isPowerOfTwo(J)Z

    move-result v4

    invoke-static {v4}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 93
    :pswitch_1f
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v4

    rsub-int/lit8 v4, v4, 0x3f

    .line 107
    :goto_25
    return v4

    .line 97
    :pswitch_26
    const-wide/16 v4, 0x1

    sub-long v4, p0, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v4

    rsub-int/lit8 v4, v4, 0x40

    goto :goto_25

    .line 103
    :pswitch_31
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v2

    .line 104
    .local v2, "leadingZeros":I
    const-wide v4, -0x4afb0ccc06219b7cL    # -2.734104117489491E-53

    ushr-long v0, v4, v2

    .line 106
    .local v0, "cmp":J
    rsub-int/lit8 v3, v2, 0x3f

    .line 107
    .local v3, "logFloor":I
    invoke-static {v0, v1, p0, p1}, Lcom/google/common/math/LongMath;->lessThanBranchFree(JJ)I

    move-result v4

    add-int/2addr v4, v3

    goto :goto_25

    .line 87
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1f
        :pswitch_1f
        :pswitch_26
        :pswitch_26
        :pswitch_31
        :pswitch_31
        :pswitch_31
    .end packed-switch
.end method

.method public static mean(JJ)J
    .registers 9
    .param p0, "x"    # J
    .param p2, "y"    # J

    .prologue
    .line 753
    and-long v0, p0, p2

    xor-long v2, p0, p2

    const/4 v4, 0x1

    shr-long/2addr v2, v4

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static mod(JI)I
    .registers 5
    .param p0, "x"    # J
    .param p2, "m"    # I
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 419
    int-to-long v0, p2

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/math/LongMath;->mod(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public static mod(JJ)J
    .registers 9
    .param p0, "x"    # J
    .param p2, "m"    # J
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 440
    cmp-long v2, p2, v3

    if-gtz v2, :cond_e

    .line 441
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "Modulus must be positive"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 443
    :cond_e
    rem-long v0, p0, p2

    .line 444
    .local v0, "result":J
    cmp-long v2, v0, v3

    if-ltz v2, :cond_15

    .end local v0    # "result":J
    :goto_14
    return-wide v0

    .restart local v0    # "result":J
    :cond_15
    add-long/2addr v0, p2

    goto :goto_14
.end method

.method static multiplyFraction(JJJ)J
    .registers 10
    .param p0, "x"    # J
    .param p2, "numerator"    # J
    .param p4, "denominator"    # J

    .prologue
    .line 708
    const-wide/16 v2, 0x1

    cmp-long v2, p0, v2

    if-nez v2, :cond_9

    .line 709
    div-long v2, p2, p4

    .line 716
    :goto_8
    return-wide v2

    .line 711
    :cond_9
    invoke-static {p0, p1, p4, p5}, Lcom/google/common/math/LongMath;->gcd(JJ)J

    move-result-wide v0

    .line 712
    .local v0, "commonDivisor":J
    div-long/2addr p0, v0

    .line 713
    div-long/2addr p4, v0

    .line 716
    div-long v2, p2, p4

    mul-long/2addr v2, p0

    goto :goto_8
.end method

.method public static pow(JI)J
    .registers 12
    .param p0, "b"    # J
    .param p2, "k"    # I
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    const/16 v8, 0x40

    const-wide/16 v4, 0x0

    const-wide/16 v2, 0x1

    .line 232
    const-string v6, "exponent"

    invoke-static {v6, p2}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 233
    const-wide/16 v6, -0x2

    cmp-long v6, v6, p0

    if-gtz v6, :cond_40

    const-wide/16 v6, 0x2

    cmp-long v6, p0, v6

    if-gtz v6, :cond_40

    .line 234
    long-to-int v6, p0

    packed-switch v6, :pswitch_data_56

    .line 250
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 236
    :pswitch_21
    if-nez p2, :cond_24

    .line 258
    :cond_23
    :goto_23
    :pswitch_23
    return-wide v2

    :cond_24
    move-wide v2, v4

    .line 236
    goto :goto_23

    .line 240
    :pswitch_26
    and-int/lit8 v4, p2, 0x1

    if-eqz v4, :cond_23

    const-wide/16 v2, -0x1

    goto :goto_23

    .line 242
    :pswitch_2d
    if-ge p2, v8, :cond_31

    shl-long v4, v2, p2

    :cond_31
    move-wide v2, v4

    goto :goto_23

    .line 244
    :pswitch_33
    if-ge p2, v8, :cond_3e

    .line 245
    and-int/lit8 v4, p2, 0x1

    if-nez v4, :cond_3b

    shl-long/2addr v2, p2

    goto :goto_23

    :cond_3b
    shl-long/2addr v2, p2

    neg-long v2, v2

    goto :goto_23

    :cond_3e
    move-wide v2, v4

    .line 247
    goto :goto_23

    .line 253
    :cond_40
    const-wide/16 v0, 0x1

    .line 254
    .local v0, "accum":J
    :goto_42
    packed-switch p2, :pswitch_data_64

    .line 260
    and-int/lit8 v4, p2, 0x1

    if-nez v4, :cond_54

    move-wide v4, v2

    :goto_4a
    mul-long/2addr v0, v4

    .line 261
    mul-long/2addr p0, p0

    .line 253
    shr-int/lit8 p2, p2, 0x1

    goto :goto_42

    :pswitch_4f
    move-wide v2, v0

    .line 256
    goto :goto_23

    .line 258
    :pswitch_51
    mul-long v2, v0, p0

    goto :goto_23

    :cond_54
    move-wide v4, p0

    .line 260
    goto :goto_4a

    .line 234
    :pswitch_data_56
    .packed-switch -0x2
        :pswitch_33
        :pswitch_26
        :pswitch_21
        :pswitch_23
        :pswitch_2d
    .end packed-switch

    .line 254
    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_51
    .end packed-switch
.end method

.method public static sqrt(JLjava/math/RoundingMode;)J
    .registers 13
    .param p0, "x"    # J
    .param p2, "mode"    # Ljava/math/RoundingMode;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "TODO"
    .end annotation

    .prologue
    .line 276
    const-string v8, "x"

    invoke-static {v8, p0, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;J)J

    .line 277
    invoke-static {p0, p1}, Lcom/google/common/math/LongMath;->fitsInInt(J)Z

    move-result v8

    if-eqz v8, :cond_12

    .line 278
    long-to-int v8, p0

    invoke-static {v8, p2}, Lcom/google/common/math/IntMath;->sqrt(ILjava/math/RoundingMode;)I

    move-result v8

    int-to-long v0, v8

    .line 332
    :cond_11
    :goto_11
    return-wide v0

    .line 295
    :cond_12
    long-to-double v8, p0

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    double-to-long v0, v8

    .line 297
    .local v0, "guess":J
    mul-long v2, v0, v0

    .line 300
    .local v2, "guessSquared":J
    sget-object v8, Lcom/google/common/math/LongMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_5c

    .line 334
    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 302
    :pswitch_2b
    cmp-long v8, v2, p0

    if-nez v8, :cond_34

    const/4 v8, 0x1

    :goto_30
    invoke-static {v8}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    goto :goto_11

    :cond_34
    const/4 v8, 0x0

    goto :goto_30

    .line 306
    :pswitch_36
    cmp-long v8, p0, v2

    if-gez v8, :cond_11

    .line 307
    const-wide/16 v8, 0x1

    sub-long/2addr v0, v8

    goto :goto_11

    .line 312
    :pswitch_3e
    cmp-long v8, p0, v2

    if-lez v8, :cond_11

    .line 313
    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    goto :goto_11

    .line 319
    :pswitch_46
    cmp-long v8, p0, v2

    if-gez v8, :cond_5a

    const/4 v8, 0x1

    :goto_4b
    int-to-long v8, v8

    sub-long v6, v0, v8

    .line 320
    .local v6, "sqrtFloor":J
    mul-long v8, v6, v6

    add-long v4, v8, v6

    .line 332
    .local v4, "halfSquare":J
    invoke-static {v4, v5, p0, p1}, Lcom/google/common/math/LongMath;->lessThanBranchFree(JJ)I

    move-result v8

    int-to-long v8, v8

    add-long v0, v6, v8

    goto :goto_11

    .line 319
    .end local v4    # "halfSquare":J
    .end local v6    # "sqrtFloor":J
    :cond_5a
    const/4 v8, 0x0

    goto :goto_4b

    .line 300
    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_36
        :pswitch_36
        :pswitch_3e
        :pswitch_3e
        :pswitch_46
        :pswitch_46
        :pswitch_46
    .end packed-switch
.end method
