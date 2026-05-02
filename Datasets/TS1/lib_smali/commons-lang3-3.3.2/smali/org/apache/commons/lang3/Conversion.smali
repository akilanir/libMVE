.class public Lorg/apache/commons/lang3/Conversion;
.super Ljava/lang/Object;
.source "Conversion.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    const-class v0, Lorg/apache/commons/lang3/Conversion;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/apache/commons/lang3/Conversion;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static binaryBeMsb0ToHexDigit([Z)C
    .registers 2
    .param p0, "src"    # [Z

    .prologue
    .line 494
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryBeMsb0ToHexDigit([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryBeMsb0ToHexDigit([ZI)C
    .registers 10
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    const/4 v4, 0x4

    const/4 v7, 0x1

    const/4 v6, 0x2

    const/4 v5, 0x3

    .line 514
    array-length v3, p0

    if-nez v3, :cond_f

    .line 515
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Cannot convert an empty array."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 517
    :cond_f
    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    sub-int v0, v3, p1

    .line 518
    .local v0, "beSrcPos":I
    add-int/lit8 v3, v0, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 519
    .local v2, "srcLen":I
    new-array v1, v4, [Z

    .line 520
    .local v1, "paddedSrc":[Z
    add-int/lit8 v3, v0, 0x1

    sub-int/2addr v3, v2

    rsub-int/lit8 v4, v2, 0x4

    invoke-static {p0, v3, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 521
    move-object p0, v1

    .line 522
    const/4 p1, 0x0

    .line 523
    aget-boolean v3, p0, p1

    if-eqz v3, :cond_73

    .line 524
    array-length v3, p0

    if-le v3, v7, :cond_52

    aget-boolean v3, p0, v7

    if-eqz v3, :cond_52

    .line 525
    array-length v3, p0

    if-le v3, v6, :cond_45

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_45

    .line 526
    array-length v3, p0

    if-le v3, v5, :cond_42

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_42

    .line 527
    const/16 v3, 0x66

    .line 579
    :goto_41
    return v3

    .line 529
    :cond_42
    const/16 v3, 0x65

    goto :goto_41

    .line 532
    :cond_45
    array-length v3, p0

    if-le v3, v5, :cond_4f

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_4f

    .line 533
    const/16 v3, 0x64

    goto :goto_41

    .line 535
    :cond_4f
    const/16 v3, 0x63

    goto :goto_41

    .line 539
    :cond_52
    array-length v3, p0

    if-le v3, v6, :cond_66

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_66

    .line 540
    array-length v3, p0

    if-le v3, v5, :cond_63

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_63

    .line 541
    const/16 v3, 0x62

    goto :goto_41

    .line 543
    :cond_63
    const/16 v3, 0x61

    goto :goto_41

    .line 546
    :cond_66
    array-length v3, p0

    if-le v3, v5, :cond_70

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_70

    .line 547
    const/16 v3, 0x39

    goto :goto_41

    .line 549
    :cond_70
    const/16 v3, 0x38

    goto :goto_41

    .line 554
    :cond_73
    array-length v3, p0

    if-le v3, v7, :cond_9b

    aget-boolean v3, p0, v7

    if-eqz v3, :cond_9b

    .line 555
    array-length v3, p0

    if-le v3, v6, :cond_8e

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_8e

    .line 556
    array-length v3, p0

    if-le v3, v5, :cond_8b

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_8b

    .line 557
    const/16 v3, 0x37

    goto :goto_41

    .line 559
    :cond_8b
    const/16 v3, 0x36

    goto :goto_41

    .line 562
    :cond_8e
    array-length v3, p0

    if-le v3, v5, :cond_98

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_98

    .line 563
    const/16 v3, 0x35

    goto :goto_41

    .line 565
    :cond_98
    const/16 v3, 0x34

    goto :goto_41

    .line 569
    :cond_9b
    array-length v3, p0

    if-le v3, v6, :cond_af

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_af

    .line 570
    array-length v3, p0

    if-le v3, v5, :cond_ac

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_ac

    .line 571
    const/16 v3, 0x33

    goto :goto_41

    .line 573
    :cond_ac
    const/16 v3, 0x32

    goto :goto_41

    .line 576
    :cond_af
    array-length v3, p0

    if-le v3, v5, :cond_b9

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_b9

    .line 577
    const/16 v3, 0x31

    goto :goto_41

    .line 579
    :cond_b9
    const/16 v3, 0x30

    goto :goto_41
.end method

.method public static binaryToByte([ZIBII)B
    .registers 13
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # B
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1154
    array-length v5, p0

    if-nez v5, :cond_6

    if-eqz p1, :cond_8

    :cond_6
    if-nez p4, :cond_9

    .line 1168
    .end local p2    # "dstInit":B
    :cond_8
    :goto_8
    return p2

    .line 1157
    .restart local p2    # "dstInit":B
    :cond_9
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x8

    if-lt v5, v7, :cond_18

    .line 1158
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "nBools-1+dstPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1160
    :cond_18
    move v3, p2

    .line 1161
    .local v3, "out":B
    const/4 v4, 0x0

    .line 1162
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, p4, :cond_36

    .line 1163
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1164
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_34

    move v5, v6

    :goto_28
    shl-int v0, v5, v4

    .line 1165
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1166
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-byte v3, v5

    .line 1162
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 1164
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_34
    const/4 v5, 0x0

    goto :goto_28

    :cond_36
    move p2, v3

    .line 1168
    goto :goto_8
.end method

.method public static binaryToHexDigit([Z)C
    .registers 2
    .param p0, "src"    # [Z

    .prologue
    .line 284
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryToHexDigit([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryToHexDigit([ZI)C
    .registers 4
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    .line 303
    array-length v0, p0

    if-nez v0, :cond_b

    .line 304
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot convert an empty array."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_b
    array-length v0, p0

    add-int/lit8 v1, p1, 0x3

    if-le v0, v1, :cond_5f

    add-int/lit8 v0, p1, 0x3

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_5f

    .line 307
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-le v0, v1, :cond_40

    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_40

    .line 308
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_36

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_36

    .line 309
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_33

    .line 310
    const/16 v0, 0x66

    .line 362
    :goto_32
    return v0

    .line 312
    :cond_33
    const/16 v0, 0x65

    goto :goto_32

    .line 315
    :cond_36
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_3d

    .line 316
    const/16 v0, 0x64

    goto :goto_32

    .line 318
    :cond_3d
    const/16 v0, 0x63

    goto :goto_32

    .line 322
    :cond_40
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_55

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_55

    .line 323
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_52

    .line 324
    const/16 v0, 0x62

    goto :goto_32

    .line 326
    :cond_52
    const/16 v0, 0x61

    goto :goto_32

    .line 329
    :cond_55
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_5c

    .line 330
    const/16 v0, 0x39

    goto :goto_32

    .line 332
    :cond_5c
    const/16 v0, 0x38

    goto :goto_32

    .line 337
    :cond_5f
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-le v0, v1, :cond_89

    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_89

    .line 338
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_7f

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_7f

    .line 339
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_7c

    .line 340
    const/16 v0, 0x37

    goto :goto_32

    .line 342
    :cond_7c
    const/16 v0, 0x36

    goto :goto_32

    .line 345
    :cond_7f
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_86

    .line 346
    const/16 v0, 0x35

    goto :goto_32

    .line 348
    :cond_86
    const/16 v0, 0x34

    goto :goto_32

    .line 352
    :cond_89
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_9e

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_9e

    .line 353
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_9b

    .line 354
    const/16 v0, 0x33

    goto :goto_32

    .line 356
    :cond_9b
    const/16 v0, 0x32

    goto :goto_32

    .line 359
    :cond_9e
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_a5

    .line 360
    const/16 v0, 0x31

    goto :goto_32

    .line 362
    :cond_a5
    const/16 v0, 0x30

    goto :goto_32
.end method

.method public static binaryToHexDigitMsb0_4bits([Z)C
    .registers 2
    .param p0, "src"    # [Z

    .prologue
    .line 385
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryToHexDigitMsb0_4bits([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryToHexDigitMsb0_4bits([ZI)C
    .registers 5
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    .line 406
    array-length v0, p0

    const/16 v1, 0x8

    if-le v0, v1, :cond_1f

    .line 407
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "src.length>8: src.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 409
    :cond_1f
    array-length v0, p0

    sub-int/2addr v0, p1

    const/4 v1, 0x4

    if-ge v0, v1, :cond_48

    .line 410
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "src.length-srcPos<4: src.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", srcPos="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 415
    :cond_48
    add-int/lit8 v0, p1, 0x3

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_88

    .line 416
    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_6e

    .line 417
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_64

    .line 418
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_61

    .line 419
    const/16 v0, 0x66

    .line 471
    :goto_60
    return v0

    .line 421
    :cond_61
    const/16 v0, 0x37

    goto :goto_60

    .line 424
    :cond_64
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_6b

    .line 425
    const/16 v0, 0x62

    goto :goto_60

    .line 427
    :cond_6b
    const/16 v0, 0x33

    goto :goto_60

    .line 431
    :cond_6e
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_7e

    .line 432
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_7b

    .line 433
    const/16 v0, 0x64

    goto :goto_60

    .line 435
    :cond_7b
    const/16 v0, 0x35

    goto :goto_60

    .line 438
    :cond_7e
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_85

    .line 439
    const/16 v0, 0x39

    goto :goto_60

    .line 441
    :cond_85
    const/16 v0, 0x31

    goto :goto_60

    .line 446
    :cond_88
    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_a8

    .line 447
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_9e

    .line 448
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_9b

    .line 449
    const/16 v0, 0x65

    goto :goto_60

    .line 451
    :cond_9b
    const/16 v0, 0x36

    goto :goto_60

    .line 454
    :cond_9e
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_a5

    .line 455
    const/16 v0, 0x61

    goto :goto_60

    .line 457
    :cond_a5
    const/16 v0, 0x32

    goto :goto_60

    .line 461
    :cond_a8
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_b8

    .line 462
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_b5

    .line 463
    const/16 v0, 0x63

    goto :goto_60

    .line 465
    :cond_b5
    const/16 v0, 0x34

    goto :goto_60

    .line 468
    :cond_b8
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_bf

    .line 469
    const/16 v0, 0x38

    goto :goto_60

    .line 471
    :cond_bf
    const/16 v0, 0x30

    goto :goto_60
.end method

.method public static binaryToInt([ZIIII)I
    .registers 13
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1080
    array-length v5, p0

    if-nez v5, :cond_6

    if-eqz p1, :cond_8

    :cond_6
    if-nez p4, :cond_9

    .line 1095
    .end local p2    # "dstInit":I
    :cond_8
    :goto_8
    return p2

    .line 1083
    .restart local p2    # "dstInit":I
    :cond_9
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x20

    if-lt v5, v7, :cond_18

    .line 1084
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "nBools-1+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1087
    :cond_18
    move v3, p2

    .line 1088
    .local v3, "out":I
    const/4 v4, 0x0

    .line 1089
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, p4, :cond_36

    .line 1090
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1091
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_34

    move v5, v6

    :goto_28
    shl-int v0, v5, v4

    .line 1092
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1093
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 1089
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 1091
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_34
    const/4 v5, 0x0

    goto :goto_28

    :cond_36
    move p2, v3

    .line 1095
    goto :goto_8
.end method

.method public static binaryToLong([ZIJII)J
    .registers 16
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nBools"    # I

    .prologue
    .line 1044
    array-length v8, p0

    if-nez v8, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p5, :cond_8

    .line 1059
    .end local p2    # "dstInit":J
    :cond_7
    :goto_7
    return-wide p2

    .line 1047
    .restart local p2    # "dstInit":J
    :cond_8
    add-int/lit8 v8, p5, -0x1

    add-int/2addr v8, p4

    const/16 v9, 0x40

    if-lt v8, v9, :cond_17

    .line 1048
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "nBools-1+dstPos is greather or equal to than 64"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1051
    :cond_17
    move-wide v5, p2

    .line 1052
    .local v5, "out":J
    const/4 v7, 0x0

    .line 1053
    .local v7, "shift":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    if-ge v2, p5, :cond_3a

    .line 1054
    mul-int/lit8 v8, v2, 0x1

    add-int v7, v8, p4

    .line 1055
    add-int v8, v2, p1

    aget-boolean v8, p0, v8

    if-eqz v8, :cond_37

    const-wide/16 v8, 0x1

    :goto_28
    shl-long v0, v8, v7

    .line 1056
    .local v0, "bits":J
    const-wide/16 v8, 0x1

    shl-long v3, v8, v7

    .line 1057
    .local v3, "mask":J
    const-wide/16 v8, -0x1

    xor-long/2addr v8, v3

    and-long/2addr v8, v5

    or-long v5, v8, v0

    .line 1053
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1055
    .end local v0    # "bits":J
    .end local v3    # "mask":J
    :cond_37
    const-wide/16 v8, 0x0

    goto :goto_28

    :cond_3a
    move-wide p2, v5

    .line 1059
    goto :goto_7
.end method

.method public static binaryToShort([ZISII)S
    .registers 13
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1117
    array-length v5, p0

    if-nez v5, :cond_6

    if-eqz p1, :cond_8

    :cond_6
    if-nez p4, :cond_9

    .line 1132
    .end local p2    # "dstInit":S
    :cond_8
    :goto_8
    return p2

    .line 1120
    .restart local p2    # "dstInit":S
    :cond_9
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x10

    if-lt v5, v7, :cond_18

    .line 1121
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "nBools-1+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1124
    :cond_18
    move v3, p2

    .line 1125
    .local v3, "out":S
    const/4 v4, 0x0

    .line 1126
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, p4, :cond_36

    .line 1127
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1128
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_34

    move v5, v6

    :goto_28
    shl-int v0, v5, v4

    .line 1129
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1130
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 1126
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 1128
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_34
    const/4 v5, 0x0

    goto :goto_28

    :cond_36
    move p2, v3

    .line 1132
    goto :goto_8
.end method

.method public static byteArrayToInt([BIIII)I
    .registers 12
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 834
    array-length v5, p0

    if-nez v5, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p4, :cond_8

    .line 849
    .end local p2    # "dstInit":I
    :cond_7
    :goto_7
    return p2

    .line 837
    .restart local p2    # "dstInit":I
    :cond_8
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x8

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_19

    .line 838
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nBytes-1)*8+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 841
    :cond_19
    move v3, p2

    .line 842
    .local v3, "out":I
    const/4 v4, 0x0

    .line 843
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    if-ge v1, p4, :cond_36

    .line 844
    mul-int/lit8 v5, v1, 0x8

    add-int v4, v5, p3

    .line 845
    add-int v5, v1, p1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int v0, v5, v4

    .line 846
    .local v0, "bits":I
    const/16 v5, 0xff

    shl-int v2, v5, v4

    .line 847
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 843
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_36
    move p2, v3

    .line 849
    goto :goto_7
.end method

.method public static byteArrayToLong([BIJII)J
    .registers 19
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nBytes"    # I

    .prologue
    .line 798
    array-length v9, p0

    if-nez v9, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p5, :cond_8

    .line 813
    .end local p2    # "dstInit":J
    :cond_7
    :goto_7
    return-wide p2

    .line 801
    .restart local p2    # "dstInit":J
    :cond_8
    add-int/lit8 v9, p5, -0x1

    mul-int/lit8 v9, v9, 0x8

    add-int v9, v9, p4

    const/16 v10, 0x40

    if-lt v9, v10, :cond_1a

    .line 802
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "(nBytes-1)*8+dstPos is greather or equal to than 64"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 805
    :cond_1a
    move-wide v6, p2

    .line 806
    .local v6, "out":J
    const/4 v8, 0x0

    .line 807
    .local v8, "shift":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    move/from16 v0, p5

    if-ge v3, v0, :cond_3c

    .line 808
    mul-int/lit8 v9, v3, 0x8

    add-int v8, v9, p4

    .line 809
    const-wide/16 v9, 0xff

    add-int v11, v3, p1

    aget-byte v11, p0, v11

    int-to-long v11, v11

    and-long/2addr v9, v11

    shl-long v1, v9, v8

    .line 810
    .local v1, "bits":J
    const-wide/16 v9, 0xff

    shl-long v4, v9, v8

    .line 811
    .local v4, "mask":J
    const-wide/16 v9, -0x1

    xor-long/2addr v9, v4

    and-long/2addr v9, v6

    or-long v6, v9, v1

    .line 807
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .end local v1    # "bits":J
    .end local v4    # "mask":J
    :cond_3c
    move-wide p2, v6

    .line 813
    goto :goto_7
.end method

.method public static byteArrayToShort([BISII)S
    .registers 12
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 871
    array-length v5, p0

    if-nez v5, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p4, :cond_8

    .line 886
    .end local p2    # "dstInit":S
    :cond_7
    :goto_7
    return p2

    .line 874
    .restart local p2    # "dstInit":S
    :cond_8
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x8

    add-int/2addr v5, p3

    const/16 v6, 0x10

    if-lt v5, v6, :cond_19

    .line 875
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nBytes-1)*8+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 878
    :cond_19
    move v3, p2

    .line 879
    .local v3, "out":S
    const/4 v4, 0x0

    .line 880
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    if-ge v1, p4, :cond_36

    .line 881
    mul-int/lit8 v5, v1, 0x8

    add-int v4, v5, p3

    .line 882
    add-int v5, v1, p1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int v0, v5, v4

    .line 883
    .local v0, "bits":I
    const/16 v5, 0xff

    shl-int v2, v5, v4

    .line 884
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 880
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_36
    move p2, v3

    .line 886
    goto :goto_7
.end method

.method public static byteArrayToUuid([BI)Ljava/util/UUID;
    .registers 11
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I

    .prologue
    const-wide/16 v2, 0x0

    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 1713
    array-length v0, p0

    sub-int/2addr v0, p1

    const/16 v1, 0x10

    if-ge v0, v1, :cond_13

    .line 1714
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Need at least 16 bytes for UUID"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1716
    :cond_13
    new-instance v6, Ljava/util/UUID;

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->byteArrayToLong([BIJII)J

    move-result-wide v7

    add-int/lit8 v1, p1, 0x8

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->byteArrayToLong([BIJII)J

    move-result-wide v0

    invoke-direct {v6, v7, v8, v0, v1}, Ljava/util/UUID;-><init>(JJ)V

    return-object v6
.end method

.method public static byteToBinary(BI[ZII)[Z
    .registers 9
    .param p0, "src"    # B
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1655
    if-nez p4, :cond_3

    .line 1666
    :cond_2
    return-object p2

    .line 1658
    :cond_3
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x8

    if-lt v2, v3, :cond_12

    .line 1659
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nBools-1+srcPos is greather or equal to than 8"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1661
    :cond_12
    const/4 v1, 0x0

    .line 1662
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, p4, :cond_2

    .line 1663
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1664
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_28

    const/4 v2, 0x1

    :goto_23
    aput-boolean v2, p2, v3

    .line 1662
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1664
    :cond_28
    const/4 v2, 0x0

    goto :goto_23
.end method

.method public static byteToHex(BILjava/lang/String;II)Ljava/lang/String;
    .registers 12
    .param p0, "src"    # B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1510
    if-nez p4, :cond_3

    .line 1530
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_2
    return-object p2

    .line 1513
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x8

    if-lt v5, v6, :cond_14

    .line 1514
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+srcPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1517
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1518
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1519
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1520
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    if-ge v2, p4, :cond_43

    .line 1521
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1522
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1523
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_39

    .line 1524
    add-int/lit8 v0, v0, 0x1

    .line 1525
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1520
    :goto_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 1527
    :cond_39
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_36

    .line 1530
    .end local v1    # "bits":I
    :cond_43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2
.end method

.method public static hexDigitMsb0ToBinary(C)[Z
    .registers 4
    .param p0, "hexDigit"    # C

    .prologue
    const/4 v0, 0x4

    .line 223
    sparse-switch p0, :sswitch_data_84

    .line 263
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :sswitch_23
    new-array v0, v0, [Z

    fill-array-data v0, :array_de

    .line 261
    :goto_28
    return-object v0

    .line 227
    :sswitch_29
    new-array v0, v0, [Z

    fill-array-data v0, :array_e4

    goto :goto_28

    .line 229
    :sswitch_2f
    new-array v0, v0, [Z

    fill-array-data v0, :array_ea

    goto :goto_28

    .line 231
    :sswitch_35
    new-array v0, v0, [Z

    fill-array-data v0, :array_f0

    goto :goto_28

    .line 233
    :sswitch_3b
    new-array v0, v0, [Z

    fill-array-data v0, :array_f6

    goto :goto_28

    .line 235
    :sswitch_41
    new-array v0, v0, [Z

    fill-array-data v0, :array_fc

    goto :goto_28

    .line 237
    :sswitch_47
    new-array v0, v0, [Z

    fill-array-data v0, :array_102

    goto :goto_28

    .line 239
    :sswitch_4d
    new-array v0, v0, [Z

    fill-array-data v0, :array_108

    goto :goto_28

    .line 241
    :sswitch_53
    new-array v0, v0, [Z

    fill-array-data v0, :array_10e

    goto :goto_28

    .line 243
    :sswitch_59
    new-array v0, v0, [Z

    fill-array-data v0, :array_114

    goto :goto_28

    .line 246
    :sswitch_5f
    new-array v0, v0, [Z

    fill-array-data v0, :array_11a

    goto :goto_28

    .line 249
    :sswitch_65
    new-array v0, v0, [Z

    fill-array-data v0, :array_120

    goto :goto_28

    .line 252
    :sswitch_6b
    new-array v0, v0, [Z

    fill-array-data v0, :array_126

    goto :goto_28

    .line 255
    :sswitch_71
    new-array v0, v0, [Z

    fill-array-data v0, :array_12c

    goto :goto_28

    .line 258
    :sswitch_77
    new-array v0, v0, [Z

    fill-array-data v0, :array_132

    goto :goto_28

    .line 261
    :sswitch_7d
    new-array v0, v0, [Z

    fill-array-data v0, :array_138

    goto :goto_28

    .line 223
    nop

    :sswitch_data_84
    .sparse-switch
        0x30 -> :sswitch_23
        0x31 -> :sswitch_29
        0x32 -> :sswitch_2f
        0x33 -> :sswitch_35
        0x34 -> :sswitch_3b
        0x35 -> :sswitch_41
        0x36 -> :sswitch_47
        0x37 -> :sswitch_4d
        0x38 -> :sswitch_53
        0x39 -> :sswitch_59
        0x41 -> :sswitch_5f
        0x42 -> :sswitch_65
        0x43 -> :sswitch_6b
        0x44 -> :sswitch_71
        0x45 -> :sswitch_77
        0x46 -> :sswitch_7d
        0x61 -> :sswitch_5f
        0x62 -> :sswitch_65
        0x63 -> :sswitch_6b
        0x64 -> :sswitch_71
        0x65 -> :sswitch_77
        0x66 -> :sswitch_7d
    .end sparse-switch

    .line 225
    :array_de
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 227
    :array_e4
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 229
    :array_ea
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 231
    :array_f0
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 233
    :array_f6
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 235
    :array_fc
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 237
    :array_102
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 239
    :array_108
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 241
    :array_10e
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 243
    :array_114
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 246
    :array_11a
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 249
    :array_120
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 252
    :array_126
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 255
    :array_12c
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 258
    :array_132
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 261
    :array_138
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public static hexDigitMsb0ToInt(C)I
    .registers 4
    .param p0, "hexDigit"    # C

    .prologue
    .line 103
    sparse-switch p0, :sswitch_data_4a

    .line 143
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :sswitch_22
    const/4 v0, 0x0

    .line 141
    :goto_23
    return v0

    .line 107
    :sswitch_24
    const/16 v0, 0x8

    goto :goto_23

    .line 109
    :sswitch_27
    const/4 v0, 0x4

    goto :goto_23

    .line 111
    :sswitch_29
    const/16 v0, 0xc

    goto :goto_23

    .line 113
    :sswitch_2c
    const/4 v0, 0x2

    goto :goto_23

    .line 115
    :sswitch_2e
    const/16 v0, 0xa

    goto :goto_23

    .line 117
    :sswitch_31
    const/4 v0, 0x6

    goto :goto_23

    .line 119
    :sswitch_33
    const/16 v0, 0xe

    goto :goto_23

    .line 121
    :sswitch_36
    const/4 v0, 0x1

    goto :goto_23

    .line 123
    :sswitch_38
    const/16 v0, 0x9

    goto :goto_23

    .line 126
    :sswitch_3b
    const/4 v0, 0x5

    goto :goto_23

    .line 129
    :sswitch_3d
    const/16 v0, 0xd

    goto :goto_23

    .line 132
    :sswitch_40
    const/4 v0, 0x3

    goto :goto_23

    .line 135
    :sswitch_42
    const/16 v0, 0xb

    goto :goto_23

    .line 138
    :sswitch_45
    const/4 v0, 0x7

    goto :goto_23

    .line 141
    :sswitch_47
    const/16 v0, 0xf

    goto :goto_23

    .line 103
    :sswitch_data_4a
    .sparse-switch
        0x30 -> :sswitch_22
        0x31 -> :sswitch_24
        0x32 -> :sswitch_27
        0x33 -> :sswitch_29
        0x34 -> :sswitch_2c
        0x35 -> :sswitch_2e
        0x36 -> :sswitch_31
        0x37 -> :sswitch_33
        0x38 -> :sswitch_36
        0x39 -> :sswitch_38
        0x41 -> :sswitch_3b
        0x42 -> :sswitch_3d
        0x43 -> :sswitch_40
        0x44 -> :sswitch_42
        0x45 -> :sswitch_45
        0x46 -> :sswitch_47
        0x61 -> :sswitch_3b
        0x62 -> :sswitch_3d
        0x63 -> :sswitch_40
        0x64 -> :sswitch_42
        0x65 -> :sswitch_45
        0x66 -> :sswitch_47
    .end sparse-switch
.end method

.method public static hexDigitToBinary(C)[Z
    .registers 4
    .param p0, "hexDigit"    # C

    .prologue
    const/4 v0, 0x4

    .line 163
    sparse-switch p0, :sswitch_data_84

    .line 203
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :sswitch_23
    new-array v0, v0, [Z

    fill-array-data v0, :array_de

    .line 201
    :goto_28
    return-object v0

    .line 167
    :sswitch_29
    new-array v0, v0, [Z

    fill-array-data v0, :array_e4

    goto :goto_28

    .line 169
    :sswitch_2f
    new-array v0, v0, [Z

    fill-array-data v0, :array_ea

    goto :goto_28

    .line 171
    :sswitch_35
    new-array v0, v0, [Z

    fill-array-data v0, :array_f0

    goto :goto_28

    .line 173
    :sswitch_3b
    new-array v0, v0, [Z

    fill-array-data v0, :array_f6

    goto :goto_28

    .line 175
    :sswitch_41
    new-array v0, v0, [Z

    fill-array-data v0, :array_fc

    goto :goto_28

    .line 177
    :sswitch_47
    new-array v0, v0, [Z

    fill-array-data v0, :array_102

    goto :goto_28

    .line 179
    :sswitch_4d
    new-array v0, v0, [Z

    fill-array-data v0, :array_108

    goto :goto_28

    .line 181
    :sswitch_53
    new-array v0, v0, [Z

    fill-array-data v0, :array_10e

    goto :goto_28

    .line 183
    :sswitch_59
    new-array v0, v0, [Z

    fill-array-data v0, :array_114

    goto :goto_28

    .line 186
    :sswitch_5f
    new-array v0, v0, [Z

    fill-array-data v0, :array_11a

    goto :goto_28

    .line 189
    :sswitch_65
    new-array v0, v0, [Z

    fill-array-data v0, :array_120

    goto :goto_28

    .line 192
    :sswitch_6b
    new-array v0, v0, [Z

    fill-array-data v0, :array_126

    goto :goto_28

    .line 195
    :sswitch_71
    new-array v0, v0, [Z

    fill-array-data v0, :array_12c

    goto :goto_28

    .line 198
    :sswitch_77
    new-array v0, v0, [Z

    fill-array-data v0, :array_132

    goto :goto_28

    .line 201
    :sswitch_7d
    new-array v0, v0, [Z

    fill-array-data v0, :array_138

    goto :goto_28

    .line 163
    nop

    :sswitch_data_84
    .sparse-switch
        0x30 -> :sswitch_23
        0x31 -> :sswitch_29
        0x32 -> :sswitch_2f
        0x33 -> :sswitch_35
        0x34 -> :sswitch_3b
        0x35 -> :sswitch_41
        0x36 -> :sswitch_47
        0x37 -> :sswitch_4d
        0x38 -> :sswitch_53
        0x39 -> :sswitch_59
        0x41 -> :sswitch_5f
        0x42 -> :sswitch_65
        0x43 -> :sswitch_6b
        0x44 -> :sswitch_71
        0x45 -> :sswitch_77
        0x46 -> :sswitch_7d
        0x61 -> :sswitch_5f
        0x62 -> :sswitch_65
        0x63 -> :sswitch_6b
        0x64 -> :sswitch_71
        0x65 -> :sswitch_77
        0x66 -> :sswitch_7d
    .end sparse-switch

    .line 165
    :array_de
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 167
    :array_e4
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 169
    :array_ea
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 171
    :array_f0
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 173
    :array_f6
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 175
    :array_fc
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 177
    :array_102
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 179
    :array_108
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 181
    :array_10e
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 183
    :array_114
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 186
    :array_11a
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 189
    :array_120
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 192
    :array_126
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 195
    :array_12c
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 198
    :array_132
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 201
    :array_138
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public static hexDigitToInt(C)I
    .registers 5
    .param p0, "hexDigit"    # C

    .prologue
    .line 81
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 82
    .local v0, "digit":I
    if-gez v0, :cond_27

    .line 83
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot interpret \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' as a hexadecimal digit"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 87
    :cond_27
    return v0
.end method

.method public static hexToByte(Ljava/lang/String;IBII)B
    .registers 12
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # B
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 1007
    if-nez p4, :cond_3

    .line 1022
    .end local p2    # "dstInit":B
    :goto_2
    return p2

    .line 1010
    .restart local p2    # "dstInit":B
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x8

    if-lt v5, v6, :cond_14

    .line 1011
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+dstPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1014
    :cond_14
    move v3, p2

    .line 1015
    .local v3, "out":B
    const/4 v4, 0x0

    .line 1016
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, p4, :cond_37

    .line 1017
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 1018
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 1019
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 1020
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-byte v3, v5

    .line 1016
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_37
    move p2, v3

    .line 1022
    goto :goto_2
.end method

.method public static hexToInt(Ljava/lang/String;IIII)I
    .registers 12
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 939
    if-nez p4, :cond_3

    .line 954
    .end local p2    # "dstInit":I
    :goto_2
    return p2

    .line 942
    .restart local p2    # "dstInit":I
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_14

    .line 943
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 946
    :cond_14
    move v3, p2

    .line 947
    .local v3, "out":I
    const/4 v4, 0x0

    .line 948
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, p4, :cond_37

    .line 949
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 950
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 951
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 952
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 948
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_37
    move p2, v3

    .line 954
    goto :goto_2
.end method

.method public static hexToLong(Ljava/lang/String;IJII)J
    .registers 19
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nHex"    # I

    .prologue
    .line 905
    if-nez p5, :cond_3

    .line 920
    .end local p2    # "dstInit":J
    :goto_2
    return-wide p2

    .line 908
    .restart local p2    # "dstInit":J
    :cond_3
    add-int/lit8 v9, p5, -0x1

    mul-int/lit8 v9, v9, 0x4

    add-int v9, v9, p4

    const/16 v10, 0x40

    if-lt v9, v10, :cond_15

    .line 909
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "(nHexs-1)*4+dstPos is greather or equal to than 64"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 912
    :cond_15
    move-wide v6, p2

    .line 913
    .local v6, "out":J
    const/4 v8, 0x0

    .line 914
    .local v8, "shift":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    move/from16 v0, p5

    if-ge v3, v0, :cond_3d

    .line 915
    mul-int/lit8 v9, v3, 0x4

    add-int v8, v9, p4

    .line 916
    const-wide/16 v9, 0xf

    add-int v11, v3, p1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v11

    int-to-long v11, v11

    and-long/2addr v9, v11

    shl-long v1, v9, v8

    .line 917
    .local v1, "bits":J
    const-wide/16 v9, 0xf

    shl-long v4, v9, v8

    .line 918
    .local v4, "mask":J
    const-wide/16 v9, -0x1

    xor-long/2addr v9, v4

    and-long/2addr v9, v6

    or-long v6, v9, v1

    .line 914
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .end local v1    # "bits":J
    .end local v4    # "mask":J
    :cond_3d
    move-wide p2, v6

    .line 920
    goto :goto_2
.end method

.method public static hexToShort(Ljava/lang/String;ISII)S
    .registers 12
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 973
    if-nez p4, :cond_3

    .line 988
    .end local p2    # "dstInit":S
    :goto_2
    return p2

    .line 976
    .restart local p2    # "dstInit":S
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x10

    if-lt v5, v6, :cond_14

    .line 977
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 980
    :cond_14
    move v3, p2

    .line 981
    .local v3, "out":S
    const/4 v4, 0x0

    .line 982
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, p4, :cond_37

    .line 983
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 984
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 985
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 986
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 982
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_37
    move p2, v3

    .line 988
    goto :goto_2
.end method

.method public static intArrayToLong([IIJII)J
    .registers 19
    .param p0, "src"    # [I
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nInts"    # I

    .prologue
    .line 687
    array-length v9, p0

    if-nez v9, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p5, :cond_8

    .line 702
    .end local p2    # "dstInit":J
    :cond_7
    :goto_7
    return-wide p2

    .line 690
    .restart local p2    # "dstInit":J
    :cond_8
    add-int/lit8 v9, p5, -0x1

    mul-int/lit8 v9, v9, 0x20

    add-int v9, v9, p4

    const/16 v10, 0x40

    if-lt v9, v10, :cond_1a

    .line 691
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "(nInts-1)*32+dstPos is greather or equal to than 64"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 694
    :cond_1a
    move-wide v6, p2

    .line 695
    .local v6, "out":J
    const/4 v8, 0x0

    .line 696
    .local v8, "shift":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    move/from16 v0, p5

    if-ge v3, v0, :cond_42

    .line 697
    mul-int/lit8 v9, v3, 0x20

    add-int v8, v9, p4

    .line 698
    const-wide v9, 0xffffffffL

    add-int v11, v3, p1

    aget v11, p0, v11

    int-to-long v11, v11

    and-long/2addr v9, v11

    shl-long v1, v9, v8

    .line 699
    .local v1, "bits":J
    const-wide v9, 0xffffffffL

    shl-long v4, v9, v8

    .line 700
    .local v4, "mask":J
    const-wide/16 v9, -0x1

    xor-long/2addr v9, v4

    and-long/2addr v9, v6

    or-long v6, v9, v1

    .line 696
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .end local v1    # "bits":J
    .end local v4    # "mask":J
    :cond_42
    move-wide p2, v6

    .line 702
    goto :goto_7
.end method

.method public static intToBinary(II[ZII)[Z
    .registers 9
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1586
    if-nez p4, :cond_3

    .line 1598
    :cond_2
    return-object p2

    .line 1589
    :cond_3
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_12

    .line 1590
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nBools-1+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1593
    :cond_12
    const/4 v1, 0x0

    .line 1594
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, p4, :cond_2

    .line 1595
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1596
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_28

    const/4 v2, 0x1

    :goto_23
    aput-boolean v2, p2, v3

    .line 1594
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1596
    :cond_28
    const/4 v2, 0x0

    goto :goto_23
.end method

.method public static intToByteArray(II[BII)[B
    .registers 9
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [B
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 1324
    if-nez p4, :cond_3

    .line 1336
    :cond_2
    return-object p2

    .line 1327
    :cond_3
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_14

    .line 1328
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nBytes-1)*8+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1331
    :cond_14
    const/4 v1, 0x0

    .line 1332
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p4, :cond_2

    .line 1333
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p1

    .line 1334
    add-int v2, p3, v0

    shr-int v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1332
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static intToHex(IILjava/lang/String;II)Ljava/lang/String;
    .registers 12
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1430
    if-nez p4, :cond_3

    .line 1450
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_2
    return-object p2

    .line 1433
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x20

    if-lt v5, v6, :cond_14

    .line 1434
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+srcPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1437
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1438
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1439
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1440
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    if-ge v2, p4, :cond_43

    .line 1441
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1442
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1443
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_39

    .line 1444
    add-int/lit8 v0, v0, 0x1

    .line 1445
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1440
    :goto_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 1447
    :cond_39
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_36

    .line 1450
    .end local v1    # "bits":I
    :cond_43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2
.end method

.method public static intToHexDigit(I)C
    .registers 5
    .param p0, "nibble"    # I

    .prologue
    .line 605
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Character;->forDigit(II)C

    move-result v0

    .line 606
    .local v0, "c":C
    if-nez v0, :cond_21

    .line 607
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nibble value not between 0 and 15: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 609
    :cond_21
    return v0
.end method

.method public static intToHexDigitMsb0(I)C
    .registers 4
    .param p0, "nibble"    # I

    .prologue
    .line 631
    packed-switch p0, :pswitch_data_4c

    .line 665
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nibble value not between 0 and 15: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 633
    :pswitch_1c
    const/16 v0, 0x30

    .line 663
    :goto_1e
    return v0

    .line 635
    :pswitch_1f
    const/16 v0, 0x38

    goto :goto_1e

    .line 637
    :pswitch_22
    const/16 v0, 0x34

    goto :goto_1e

    .line 639
    :pswitch_25
    const/16 v0, 0x63

    goto :goto_1e

    .line 641
    :pswitch_28
    const/16 v0, 0x32

    goto :goto_1e

    .line 643
    :pswitch_2b
    const/16 v0, 0x61

    goto :goto_1e

    .line 645
    :pswitch_2e
    const/16 v0, 0x36

    goto :goto_1e

    .line 647
    :pswitch_31
    const/16 v0, 0x65

    goto :goto_1e

    .line 649
    :pswitch_34
    const/16 v0, 0x31

    goto :goto_1e

    .line 651
    :pswitch_37
    const/16 v0, 0x39

    goto :goto_1e

    .line 653
    :pswitch_3a
    const/16 v0, 0x35

    goto :goto_1e

    .line 655
    :pswitch_3d
    const/16 v0, 0x64

    goto :goto_1e

    .line 657
    :pswitch_40
    const/16 v0, 0x33

    goto :goto_1e

    .line 659
    :pswitch_43
    const/16 v0, 0x62

    goto :goto_1e

    .line 661
    :pswitch_46
    const/16 v0, 0x37

    goto :goto_1e

    .line 663
    :pswitch_49
    const/16 v0, 0x66

    goto :goto_1e

    .line 631
    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
        :pswitch_28
        :pswitch_2b
        :pswitch_2e
        :pswitch_31
        :pswitch_34
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
        :pswitch_40
        :pswitch_43
        :pswitch_46
        :pswitch_49
    .end packed-switch
.end method

.method public static intToShortArray(II[SII)[S
    .registers 10
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [S
    .param p3, "dstPos"    # I
    .param p4, "nShorts"    # I

    .prologue
    .line 1257
    if-nez p4, :cond_3

    .line 1269
    :cond_2
    return-object p2

    .line 1260
    :cond_3
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x10

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_14

    .line 1261
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nShorts-1)*16+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1264
    :cond_14
    const/4 v1, 0x0

    .line 1265
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p4, :cond_2

    .line 1266
    mul-int/lit8 v2, v0, 0x10

    add-int v1, v2, p1

    .line 1267
    add-int v2, p3, v0

    const v3, 0xffff

    shr-int v4, p0, v1

    and-int/2addr v3, v4

    int-to-short v3, v3

    aput-short v3, p2, v2

    .line 1265
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static longToBinary(JI[ZII)[Z
    .registers 14
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [Z
    .param p4, "dstPos"    # I
    .param p5, "nBools"    # I

    .prologue
    .line 1552
    if-nez p5, :cond_3

    .line 1564
    :cond_2
    return-object p3

    .line 1555
    :cond_3
    add-int/lit8 v2, p5, -0x1

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_12

    .line 1556
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nBools-1+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1559
    :cond_12
    const/4 v1, 0x0

    .line 1560
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, p5, :cond_2

    .line 1561
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p2

    .line 1562
    add-int v3, p4, v0

    const-wide/16 v4, 0x1

    shr-long v6, p0, v1

    and-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-eqz v2, :cond_2d

    const/4 v2, 0x1

    :goto_28
    aput-boolean v2, p3, v3

    .line 1560
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1562
    :cond_2d
    const/4 v2, 0x0

    goto :goto_28
.end method

.method public static longToByteArray(JI[BII)[B
    .registers 13
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [B
    .param p4, "dstPos"    # I
    .param p5, "nBytes"    # I

    .prologue
    .line 1291
    if-nez p5, :cond_3

    .line 1303
    :cond_2
    return-object p3

    .line 1294
    :cond_3
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_14

    .line 1295
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nBytes-1)*8+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1298
    :cond_14
    const/4 v1, 0x0

    .line 1299
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p5, :cond_2

    .line 1300
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p2

    .line 1301
    add-int v2, p4, v0

    const-wide/16 v3, 0xff

    shr-long v5, p0, v1

    and-long/2addr v3, v5

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p3, v2

    .line 1299
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static longToHex(JILjava/lang/String;II)Ljava/lang/String;
    .registers 15
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dstInit"    # Ljava/lang/String;
    .param p4, "dstPos"    # I
    .param p5, "nHexs"    # I

    .prologue
    .line 1390
    if-nez p5, :cond_3

    .line 1410
    .end local p3    # "dstInit":Ljava/lang/String;
    :goto_2
    return-object p3

    .line 1393
    .restart local p3    # "dstInit":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, p5, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p2

    const/16 v6, 0x40

    if-lt v5, v6, :cond_14

    .line 1394
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+srcPos is greather or equal to than 64"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1397
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1398
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1399
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1400
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    if-ge v2, p5, :cond_45

    .line 1401
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p2

    .line 1402
    const-wide/16 v5, 0xf

    shr-long v7, p0, v4

    and-long/2addr v5, v7

    long-to-int v1, v5

    .line 1403
    .local v1, "bits":I
    add-int v5, p4, v2

    if-ne v5, v0, :cond_3b

    .line 1404
    add-int/lit8 v0, v0, 0x1

    .line 1405
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1400
    :goto_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 1407
    :cond_3b
    add-int v5, p4, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_38

    .line 1410
    .end local v1    # "bits":I
    :cond_45
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_2
.end method

.method public static longToIntArray(JI[III)[I
    .registers 13
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [I
    .param p4, "dstPos"    # I
    .param p5, "nInts"    # I

    .prologue
    .line 1189
    if-nez p5, :cond_3

    .line 1201
    :cond_2
    return-object p3

    .line 1192
    :cond_3
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x20

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_14

    .line 1193
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nInts-1)*32+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1196
    :cond_14
    const/4 v1, 0x0

    .line 1197
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p5, :cond_2

    .line 1198
    mul-int/lit8 v2, v0, 0x20

    add-int v1, v2, p2

    .line 1199
    add-int v2, p4, v0

    const-wide/16 v3, -0x1

    shr-long v5, p0, v1

    and-long/2addr v3, v5

    long-to-int v3, v3

    aput v3, p3, v2

    .line 1197
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static longToShortArray(JI[SII)[S
    .registers 13
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [S
    .param p4, "dstPos"    # I
    .param p5, "nShorts"    # I

    .prologue
    .line 1223
    if-nez p5, :cond_3

    .line 1235
    :cond_2
    return-object p3

    .line 1226
    :cond_3
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x10

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_14

    .line 1227
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nShorts-1)*16+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1230
    :cond_14
    const/4 v1, 0x0

    .line 1231
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p5, :cond_2

    .line 1232
    mul-int/lit8 v2, v0, 0x10

    add-int v1, v2, p2

    .line 1233
    add-int v2, p4, v0

    const-wide/32 v3, 0xffff

    shr-long v5, p0, v1

    and-long/2addr v3, v5

    long-to-int v3, v3

    int-to-short v3, v3

    aput-short v3, p3, v2

    .line 1231
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static shortArrayToInt([SIIII)I
    .registers 13
    .param p0, "src"    # [S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nShorts"    # I

    .prologue
    const v7, 0xffff

    .line 761
    array-length v5, p0

    if-nez v5, :cond_8

    if-eqz p1, :cond_a

    :cond_8
    if-nez p4, :cond_b

    .line 776
    .end local p2    # "dstInit":I
    :cond_a
    :goto_a
    return p2

    .line 764
    .restart local p2    # "dstInit":I
    :cond_b
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_1c

    .line 765
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nShorts-1)*16+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 768
    :cond_1c
    move v3, p2

    .line 769
    .local v3, "out":I
    const/4 v4, 0x0

    .line 770
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1f
    if-ge v1, p4, :cond_36

    .line 771
    mul-int/lit8 v5, v1, 0x10

    add-int v4, v5, p3

    .line 772
    add-int v5, v1, p1

    aget-short v5, p0, v5

    and-int/2addr v5, v7

    shl-int v0, v5, v4

    .line 773
    .local v0, "bits":I
    shl-int v2, v7, v4

    .line 774
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 770
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_36
    move p2, v3

    .line 776
    goto :goto_a
.end method

.method public static shortArrayToLong([SIJII)J
    .registers 19
    .param p0, "src"    # [S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nShorts"    # I

    .prologue
    .line 724
    array-length v9, p0

    if-nez v9, :cond_5

    if-eqz p1, :cond_7

    :cond_5
    if-nez p5, :cond_8

    .line 739
    .end local p2    # "dstInit":J
    :cond_7
    :goto_7
    return-wide p2

    .line 727
    .restart local p2    # "dstInit":J
    :cond_8
    add-int/lit8 v9, p5, -0x1

    mul-int/lit8 v9, v9, 0x10

    add-int v9, v9, p4

    const/16 v10, 0x40

    if-lt v9, v10, :cond_1a

    .line 728
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "(nShorts-1)*16+dstPos is greather or equal to than 64"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 731
    :cond_1a
    move-wide v6, p2

    .line 732
    .local v6, "out":J
    const/4 v8, 0x0

    .line 733
    .local v8, "shift":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    move/from16 v0, p5

    if-ge v3, v0, :cond_3e

    .line 734
    mul-int/lit8 v9, v3, 0x10

    add-int v8, v9, p4

    .line 735
    const-wide/32 v9, 0xffff

    add-int v11, v3, p1

    aget-short v11, p0, v11

    int-to-long v11, v11

    and-long/2addr v9, v11

    shl-long v1, v9, v8

    .line 736
    .local v1, "bits":J
    const-wide/32 v9, 0xffff

    shl-long v4, v9, v8

    .line 737
    .local v4, "mask":J
    const-wide/16 v9, -0x1

    xor-long/2addr v9, v4

    and-long/2addr v9, v6

    or-long v6, v9, v1

    .line 733
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .end local v1    # "bits":J
    .end local v4    # "mask":J
    :cond_3e
    move-wide p2, v6

    .line 739
    goto :goto_7
.end method

.method public static shortToBinary(SI[ZII)[Z
    .registers 9
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1620
    if-nez p4, :cond_3

    .line 1633
    :cond_2
    return-object p2

    .line 1623
    :cond_3
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x10

    if-lt v2, v3, :cond_12

    .line 1624
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nBools-1+srcPos is greather or equal to than 16"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1627
    :cond_12
    const/4 v1, 0x0

    .line 1628
    .local v1, "shift":I
    sget-boolean v2, Lorg/apache/commons/lang3/Conversion;->$assertionsDisabled:Z

    if-nez v2, :cond_25

    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x1

    rsub-int/lit8 v3, p1, 0x10

    if-lt v2, v3, :cond_25

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1629
    :cond_25
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_26
    if-ge v0, p4, :cond_2

    .line 1630
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1631
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3a

    const/4 v2, 0x1

    :goto_35
    aput-boolean v2, p2, v3

    .line 1629
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 1631
    :cond_3a
    const/4 v2, 0x0

    goto :goto_35
.end method

.method public static shortToByteArray(SI[BII)[B
    .registers 9
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [B
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 1358
    if-nez p4, :cond_3

    .line 1370
    :cond_2
    return-object p2

    .line 1361
    :cond_3
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p1

    const/16 v3, 0x10

    if-lt v2, v3, :cond_14

    .line 1362
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "(nBytes-1)*8+srcPos is greather or equal to than 16"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1365
    :cond_14
    const/4 v1, 0x0

    .line 1366
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p4, :cond_2

    .line 1367
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p1

    .line 1368
    add-int v2, p3, v0

    shr-int v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1366
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public static shortToHex(SILjava/lang/String;II)Ljava/lang/String;
    .registers 12
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1470
    if-nez p4, :cond_3

    .line 1490
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_2
    return-object p2

    .line 1473
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x10

    if-lt v5, v6, :cond_14

    .line 1474
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "(nHexs-1)*4+srcPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1477
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1478
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1479
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1480
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    if-ge v2, p4, :cond_43

    .line 1481
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1482
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1483
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_39

    .line 1484
    add-int/lit8 v0, v0, 0x1

    .line 1485
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1480
    :goto_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 1487
    :cond_39
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_36

    .line 1490
    .end local v1    # "bits":I
    :cond_43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2
.end method

.method public static uuidToByteArray(Ljava/util/UUID;[BII)[B
    .registers 11
    .param p0, "src"    # Ljava/util/UUID;
    .param p1, "dst"    # [B
    .param p2, "dstPos"    # I
    .param p3, "nBytes"    # I

    .prologue
    const/4 v2, 0x0

    const/16 v6, 0x8

    .line 1686
    if-nez p3, :cond_6

    .line 1696
    :cond_5
    :goto_5
    return-object p1

    .line 1689
    :cond_6
    const/16 v0, 0x10

    if-le p3, v0, :cond_12

    .line 1690
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "nBytes is greather than 16"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1692
    :cond_12
    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    if-le p3, v6, :cond_2d

    move v5, v6

    :goto_19
    move-object v3, p1

    move v4, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->longToByteArray(JI[BII)[B

    .line 1693
    if-lt p3, v6, :cond_5

    .line 1694
    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    add-int/lit8 v4, p2, 0x8

    add-int/lit8 v5, p3, -0x8

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->longToByteArray(JI[BII)[B

    goto :goto_5

    :cond_2d
    move v5, p3

    .line 1692
    goto :goto_19
.end method
