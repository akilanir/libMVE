.class public Lfreemarker/template/utility/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final ESCAPES:[C

.field private static final ESC_BACKSLASH:I = 0x3

.field private static final ESC_HEXA:I = 0x1

.field private static final NO_ESC:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    invoke-static {}, Lfreemarker/template/utility/StringUtil;->createEscapes()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/StringUtil;->ESCAPES:[C

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static FTLStringLiteralDec(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v11, -0x1

    const/16 v10, 0x5c

    const/4 v12, 0x0

    .line 482
    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 483
    .local v4, "idx":I
    if-ne v4, v11, :cond_b

    .line 581
    .end local p0    # "s":Ljava/lang/String;
    :goto_a
    return-object p0

    .line 487
    .restart local p0    # "s":Ljava/lang/String;
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v5, v9, -0x1

    .line 488
    .local v5, "lidx":I
    const/4 v1, 0x0

    .line 489
    .local v1, "bidx":I
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 491
    .local v2, "buf":Ljava/lang/StringBuffer;
    :cond_17
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 492
    if-lt v4, v5, :cond_28

    .line 493
    new-instance v9, Lfreemarker/core/ParseException;

    const-string v10, "The last character of string literal is backslash"

    invoke-direct {v9, v10, v12, v12}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v9

    .line 495
    :cond_28
    add-int/lit8 v9, v4, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 496
    .local v3, "c":C
    sparse-switch v3, :sswitch_data_112

    .line 575
    new-instance v9, Lfreemarker/core/ParseException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Invalid escape sequence (\\"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, ") in a string literal"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v12, v12}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v9

    .line 498
    :sswitch_50
    const/16 v9, 0x22

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 499
    add-int/lit8 v1, v4, 0x2

    .line 577
    :goto_57
    invoke-virtual {p0, v10, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 578
    if-ne v4, v11, :cond_17

    .line 579
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 581
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_a

    .line 502
    :sswitch_69
    const/16 v9, 0x27

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 503
    add-int/lit8 v1, v4, 0x2

    .line 504
    goto :goto_57

    .line 506
    :sswitch_71
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 507
    add-int/lit8 v1, v4, 0x2

    .line 508
    goto :goto_57

    .line 510
    :sswitch_77
    const/16 v9, 0xa

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 511
    add-int/lit8 v1, v4, 0x2

    .line 512
    goto :goto_57

    .line 514
    :sswitch_7f
    const/16 v9, 0xd

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 515
    add-int/lit8 v1, v4, 0x2

    .line 516
    goto :goto_57

    .line 518
    :sswitch_87
    const/16 v9, 0x9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 519
    add-int/lit8 v1, v4, 0x2

    .line 520
    goto :goto_57

    .line 522
    :sswitch_8f
    const/16 v9, 0xc

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 523
    add-int/lit8 v1, v4, 0x2

    .line 524
    goto :goto_57

    .line 526
    :sswitch_97
    const/16 v9, 0x8

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 527
    add-int/lit8 v1, v4, 0x2

    .line 528
    goto :goto_57

    .line 530
    :sswitch_9f
    const/16 v9, 0x3e

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 531
    add-int/lit8 v1, v4, 0x2

    .line 532
    goto :goto_57

    .line 534
    :sswitch_a7
    const/16 v9, 0x3c

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 535
    add-int/lit8 v1, v4, 0x2

    .line 536
    goto :goto_57

    .line 538
    :sswitch_af
    const/16 v9, 0x26

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 539
    add-int/lit8 v1, v4, 0x2

    .line 540
    goto :goto_57

    .line 542
    :sswitch_b7
    const/16 v9, 0x7b

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 543
    add-int/lit8 v1, v4, 0x2

    .line 544
    goto :goto_57

    .line 546
    :sswitch_bf
    add-int/lit8 v4, v4, 0x2

    .line 547
    move v6, v4

    .line 548
    .local v6, "x":I
    const/4 v7, 0x0

    .line 549
    .local v7, "y":I
    add-int/lit8 v9, v4, 0x3

    if-le v5, v9, :cond_df

    add-int/lit8 v8, v4, 0x3

    .line 550
    .local v8, "z":I
    :goto_c9
    if-gt v4, v8, :cond_101

    .line 551
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 552
    .local v0, "b":C
    const/16 v9, 0x30

    if-lt v0, v9, :cond_e1

    const/16 v9, 0x39

    if-gt v0, v9, :cond_e1

    .line 553
    shl-int/lit8 v7, v7, 0x4

    .line 554
    add-int/lit8 v9, v0, -0x30

    add-int/2addr v7, v9

    .line 564
    :goto_dc
    add-int/lit8 v4, v4, 0x1

    .line 565
    goto :goto_c9

    .end local v0    # "b":C
    .end local v8    # "z":I
    :cond_df
    move v8, v5

    .line 549
    goto :goto_c9

    .line 555
    .restart local v0    # "b":C
    .restart local v8    # "z":I
    :cond_e1
    const/16 v9, 0x61

    if-lt v0, v9, :cond_f1

    const/16 v9, 0x66

    if-gt v0, v9, :cond_f1

    .line 556
    shl-int/lit8 v7, v7, 0x4

    .line 557
    add-int/lit8 v9, v0, -0x61

    add-int/lit8 v9, v9, 0xa

    add-int/2addr v7, v9

    goto :goto_dc

    .line 558
    :cond_f1
    const/16 v9, 0x41

    if-lt v0, v9, :cond_101

    const/16 v9, 0x46

    if-gt v0, v9, :cond_101

    .line 559
    shl-int/lit8 v7, v7, 0x4

    .line 560
    add-int/lit8 v9, v0, -0x41

    add-int/lit8 v9, v9, 0xa

    add-int/2addr v7, v9

    goto :goto_dc

    .line 566
    .end local v0    # "b":C
    :cond_101
    if-ge v6, v4, :cond_10a

    .line 567
    int-to-char v9, v7

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 571
    move v1, v4

    .line 572
    goto/16 :goto_57

    .line 569
    :cond_10a
    new-instance v9, Lfreemarker/core/ParseException;

    const-string v10, "Invalid \\x escape in a string literal"

    invoke-direct {v9, v10, v12, v12}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v9

    .line 496
    :sswitch_data_112
    .sparse-switch
        0x22 -> :sswitch_50
        0x27 -> :sswitch_69
        0x5c -> :sswitch_71
        0x61 -> :sswitch_af
        0x62 -> :sswitch_97
        0x66 -> :sswitch_8f
        0x67 -> :sswitch_9f
        0x6c -> :sswitch_a7
        0x6e -> :sswitch_77
        0x72 -> :sswitch_7f
        0x74 -> :sswitch_87
        0x78 -> :sswitch_bf
        0x7b -> :sswitch_b7
    .end sparse-switch
.end method

.method public static FTLStringLiteralEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0xa

    const/4 v8, 0x0

    .line 410
    const/4 v0, 0x0

    .line 411
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 412
    .local v6, "l":I
    sget-object v7, Lfreemarker/template/utility/StringUtil;->ESCAPES:[C

    array-length v3, v7

    .line 413
    .local v3, "el":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_c
    if-ge v5, v6, :cond_81

    .line 415
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 416
    .local v1, "c":C
    if-ge v1, v3, :cond_7b

    .line 418
    sget-object v7, Lfreemarker/template/utility/StringUtil;->ESCAPES:[C

    aget-char v4, v7, v1

    .line 419
    .local v4, "escape":C
    packed-switch v4, :pswitch_data_8a

    .line 445
    if-nez v0, :cond_2f

    .line 446
    new-instance v0, Ljava/lang/StringBuffer;

    .end local v0    # "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x2

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 447
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 449
    :cond_2f
    const/16 v7, 0x5c

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 450
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 413
    .end local v4    # "escape":C
    :cond_37
    :goto_37
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 423
    .restart local v4    # "escape":C
    :pswitch_3a
    if-eqz v0, :cond_37

    .line 424
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_37

    .line 430
    :pswitch_40
    if-nez v0, :cond_54

    .line 431
    new-instance v0, Ljava/lang/StringBuffer;

    .end local v0    # "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x3

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 432
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 436
    :cond_54
    const-string v7, "\\x00"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 437
    shr-int/lit8 v7, v1, 0x4

    and-int/lit8 v2, v7, 0xf

    .line 438
    .local v2, "c2":I
    and-int/lit8 v7, v1, 0xf

    int-to-char v1, v7

    .line 439
    if-ge v2, v9, :cond_71

    add-int/lit8 v7, v2, 0x30

    :goto_64
    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 440
    if-ge v1, v9, :cond_76

    add-int/lit8 v7, v1, 0x30

    :goto_6c
    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_37

    .line 439
    :cond_71
    add-int/lit8 v7, v2, -0xa

    add-int/lit8 v7, v7, 0x41

    goto :goto_64

    .line 440
    :cond_76
    add-int/lit8 v7, v1, -0xa

    add-int/lit8 v7, v7, 0x41

    goto :goto_6c

    .line 454
    .end local v2    # "c2":I
    .end local v4    # "escape":C
    :cond_7b
    if-eqz v0, :cond_37

    .line 455
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_37

    .line 459
    .end local v1    # "c":C
    :cond_81
    if-nez v0, :cond_84

    .end local p0    # "s":Ljava/lang/String;
    :goto_83
    return-object p0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_84
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_83

    .line 419
    nop

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_40
    .end packed-switch
.end method

.method public static HTMLEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-static {p0}, Lfreemarker/template/utility/StringUtil;->XMLEncNA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static RTFEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x7d

    const/16 v7, 0x7b

    const/16 v6, 0x5c

    .line 287
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 288
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v3, :cond_73

    .line 289
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 290
    .local v1, "c":C
    if-eq v1, v6, :cond_17

    if-eq v1, v7, :cond_17

    if-ne v1, v8, :cond_74

    .line 291
    :cond_17
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 293
    .local v0, "b":Ljava/lang/StringBuffer;
    sparse-switch v1, :sswitch_data_78

    .line 298
    :goto_24
    add-int/lit8 v2, v2, 0x1

    .line 299
    move v4, v2

    .line 300
    .local v4, "next":I
    :goto_27
    if-ge v2, v3, :cond_66

    .line 301
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 302
    if-eq v1, v6, :cond_33

    if-eq v1, v7, :cond_33

    if-ne v1, v8, :cond_3f

    .line 303
    :cond_33
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 304
    sparse-switch v1, :sswitch_data_86

    .line 309
    :goto_3d
    add-int/lit8 v4, v2, 0x1

    .line 311
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 294
    .end local v4    # "next":I
    :sswitch_42
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 295
    :sswitch_48
    const-string v5, "\\{"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 296
    :sswitch_4e
    const-string v5, "\\}"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 305
    .restart local v4    # "next":I
    :sswitch_54
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 306
    :sswitch_5a
    const-string v5, "\\{"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 307
    :sswitch_60
    const-string v5, "\\}"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 313
    :cond_66
    if-ge v4, v3, :cond_6f

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 314
    :cond_6f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 318
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local v4    # "next":I
    :cond_73
    return-object p0

    .line 288
    .restart local v1    # "c":C
    :cond_74
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 293
    nop

    :sswitch_data_78
    .sparse-switch
        0x5c -> :sswitch_42
        0x7b -> :sswitch_48
        0x7d -> :sswitch_4e
    .end sparse-switch

    .line 304
    :sswitch_data_86
    .sparse-switch
        0x5c -> :sswitch_54
        0x7b -> :sswitch_5a
        0x7d -> :sswitch_60
    .end sparse-switch
.end method

.method public static URLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    .line 328
    .local v8, "ln":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_5
    if-ge v6, v8, :cond_3f

    .line 329
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 330
    .local v2, "c":C
    const/16 v10, 0x61

    if-lt v2, v10, :cond_13

    const/16 v10, 0x7a

    if-le v2, v10, :cond_42

    :cond_13
    const/16 v10, 0x41

    if-lt v2, v10, :cond_1b

    const/16 v10, 0x5a

    if-le v2, v10, :cond_42

    :cond_1b
    const/16 v10, 0x30

    if-lt v2, v10, :cond_23

    const/16 v10, 0x39

    if-le v2, v10, :cond_42

    :cond_23
    const/16 v10, 0x5f

    if-eq v2, v10, :cond_42

    const/16 v10, 0x2d

    if-eq v2, v10, :cond_42

    const/16 v10, 0x2e

    if-eq v2, v10, :cond_42

    const/16 v10, 0x21

    if-eq v2, v10, :cond_42

    const/16 v10, 0x7e

    if-eq v2, v10, :cond_42

    const/16 v10, 0x27

    if-lt v2, v10, :cond_3f

    const/16 v10, 0x2a

    if-le v2, v10, :cond_42

    .line 337
    .end local v2    # "c":C
    :cond_3f
    if-ne v6, v8, :cond_45

    .line 383
    .end local p0    # "s":Ljava/lang/String;
    :goto_41
    return-object p0

    .line 328
    .restart local v2    # "c":C
    .restart local p0    # "s":Ljava/lang/String;
    :cond_42
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 342
    .end local v2    # "c":C
    :cond_45
    new-instance v0, Ljava/lang/StringBuffer;

    div-int/lit8 v10, v8, 0x3

    add-int/2addr v10, v8

    add-int/lit8 v10, v10, 0x2

    invoke-direct {v0, v10}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 343
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 345
    move v5, v6

    .line 346
    .local v5, "encstart":I
    add-int/lit8 v6, v6, 0x1

    :goto_5a
    if-ge v6, v8, :cond_dd

    .line 347
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 348
    .restart local v2    # "c":C
    const/16 v10, 0x61

    if-lt v2, v10, :cond_68

    const/16 v10, 0x7a

    if-le v2, v10, :cond_94

    :cond_68
    const/16 v10, 0x41

    if-lt v2, v10, :cond_70

    const/16 v10, 0x5a

    if-le v2, v10, :cond_94

    :cond_70
    const/16 v10, 0x30

    if-lt v2, v10, :cond_78

    const/16 v10, 0x39

    if-le v2, v10, :cond_94

    :cond_78
    const/16 v10, 0x5f

    if-eq v2, v10, :cond_94

    const/16 v10, 0x2d

    if-eq v2, v10, :cond_94

    const/16 v10, 0x2e

    if-eq v2, v10, :cond_94

    const/16 v10, 0x21

    if-eq v2, v10, :cond_94

    const/16 v10, 0x7e

    if-eq v2, v10, :cond_94

    const/16 v10, 0x27

    if-lt v2, v10, :cond_d8

    const/16 v10, 0x2a

    if-gt v2, v10, :cond_d8

    .line 352
    :cond_94
    const/4 v10, -0x1

    if-eq v5, v10, :cond_d2

    .line 353
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 354
    .local v9, "o":[B
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_a0
    array-length v10, v9

    if-ge v7, v10, :cond_d1

    .line 355
    const/16 v10, 0x25

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 356
    aget-byte v1, v9, v7

    .line 357
    .local v1, "bc":B
    and-int/lit8 v3, v1, 0xf

    .line 358
    .local v3, "c1":I
    shr-int/lit8 v10, v1, 0x4

    and-int/lit8 v4, v10, 0xf

    .line 359
    .local v4, "c2":I
    const/16 v10, 0xa

    if-ge v4, v10, :cond_c7

    add-int/lit8 v10, v4, 0x30

    :goto_b6
    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 360
    const/16 v10, 0xa

    if-ge v3, v10, :cond_cc

    add-int/lit8 v10, v3, 0x30

    :goto_c0
    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 354
    add-int/lit8 v7, v7, 0x1

    goto :goto_a0

    .line 359
    :cond_c7
    add-int/lit8 v10, v4, -0xa

    add-int/lit8 v10, v10, 0x41

    goto :goto_b6

    .line 360
    :cond_cc
    add-int/lit8 v10, v3, -0xa

    add-int/lit8 v10, v10, 0x41

    goto :goto_c0

    .line 362
    .end local v1    # "bc":B
    .end local v3    # "c1":I
    .end local v4    # "c2":I
    :cond_d1
    const/4 v5, -0x1

    .line 364
    .end local v7    # "j":I
    .end local v9    # "o":[B
    :cond_d2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 346
    :cond_d5
    :goto_d5
    add-int/lit8 v6, v6, 0x1

    goto :goto_5a

    .line 366
    :cond_d8
    const/4 v10, -0x1

    if-ne v5, v10, :cond_d5

    .line 367
    move v5, v6

    goto :goto_d5

    .line 371
    .end local v2    # "c":C
    :cond_dd
    const/4 v10, -0x1

    if-eq v5, v10, :cond_11a

    .line 372
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 373
    .restart local v9    # "o":[B
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_e9
    array-length v10, v9

    if-ge v7, v10, :cond_11a

    .line 374
    const/16 v10, 0x25

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 375
    aget-byte v1, v9, v7

    .line 376
    .restart local v1    # "bc":B
    and-int/lit8 v3, v1, 0xf

    .line 377
    .restart local v3    # "c1":I
    shr-int/lit8 v10, v1, 0x4

    and-int/lit8 v4, v10, 0xf

    .line 378
    .restart local v4    # "c2":I
    const/16 v10, 0xa

    if-ge v4, v10, :cond_110

    add-int/lit8 v10, v4, 0x30

    :goto_ff
    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 379
    const/16 v10, 0xa

    if-ge v3, v10, :cond_115

    add-int/lit8 v10, v3, 0x30

    :goto_109
    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 373
    add-int/lit8 v7, v7, 0x1

    goto :goto_e9

    .line 378
    :cond_110
    add-int/lit8 v10, v4, -0xa

    add-int/lit8 v10, v10, 0x41

    goto :goto_ff

    .line 379
    :cond_115
    add-int/lit8 v10, v3, -0xa

    add-int/lit8 v10, v10, 0x41

    goto :goto_109

    .line 383
    .end local v1    # "bc":B
    .end local v3    # "c1":I
    .end local v4    # "c2":I
    .end local v7    # "j":I
    .end local v9    # "o":[B
    :cond_11a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_41
.end method

.method public static XHTMLEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 105
    const-string v0, "&#39;"

    invoke-static {p0, v0}, Lfreemarker/template/utility/StringUtil;->XMLOrXHTMLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static XMLEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 94
    const-string v0, "&apos;"

    invoke-static {p0, v0}, Lfreemarker/template/utility/StringUtil;->XMLOrXHTMLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static XMLEncNA(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x3e

    const/16 v8, 0x3c

    const/16 v7, 0x26

    const/16 v6, 0x22

    .line 152
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 153
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, v3, :cond_85

    .line 154
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 155
    .local v1, "c":C
    if-eq v1, v8, :cond_1b

    if-eq v1, v9, :cond_1b

    if-eq v1, v7, :cond_1b

    if-ne v1, v6, :cond_86

    .line 156
    :cond_1b
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 158
    .local v0, "b":Ljava/lang/StringBuffer;
    sparse-switch v1, :sswitch_data_8a

    .line 164
    :goto_28
    add-int/lit8 v2, v2, 0x1

    .line 165
    move v4, v2

    .line 166
    .local v4, "next":I
    :goto_2b
    if-ge v2, v3, :cond_78

    .line 167
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 168
    if-eq v1, v8, :cond_39

    if-eq v1, v9, :cond_39

    if-eq v1, v7, :cond_39

    if-ne v1, v6, :cond_45

    .line 169
    :cond_39
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    sparse-switch v1, :sswitch_data_9c

    .line 176
    :goto_43
    add-int/lit8 v4, v2, 0x1

    .line 178
    :cond_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 159
    .end local v4    # "next":I
    :sswitch_48
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_28

    .line 160
    :sswitch_4e
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_28

    .line 161
    :sswitch_54
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_28

    .line 162
    :sswitch_5a
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_28

    .line 171
    .restart local v4    # "next":I
    :sswitch_60
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 172
    :sswitch_66
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 173
    :sswitch_6c
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 174
    :sswitch_72
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 180
    :cond_78
    if-ge v4, v3, :cond_81

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 181
    :cond_81
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 185
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local v4    # "next":I
    :cond_85
    return-object p0

    .line 153
    .restart local v1    # "c":C
    :cond_86
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 158
    nop

    :sswitch_data_8a
    .sparse-switch
        0x22 -> :sswitch_5a
        0x26 -> :sswitch_54
        0x3c -> :sswitch_48
        0x3e -> :sswitch_4e
    .end sparse-switch

    .line 170
    :sswitch_data_9c
    .sparse-switch
        0x22 -> :sswitch_72
        0x26 -> :sswitch_6c
        0x3c -> :sswitch_60
        0x3e -> :sswitch_66
    .end sparse-switch
.end method

.method public static XMLEncNQG(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3e

    const/16 v9, 0x3c

    const/16 v8, 0x26

    const/4 v7, 0x1

    const/16 v6, 0x5d

    .line 236
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 237
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-ge v2, v3, :cond_a8

    .line 238
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 239
    .local v1, "c":C
    if-eq v1, v9, :cond_2c

    if-ne v1, v10, :cond_2a

    if-le v2, v7, :cond_2a

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v6, :cond_2a

    add-int/lit8 v5, v2, -0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v6, :cond_2c

    :cond_2a
    if-ne v1, v8, :cond_a9

    .line 244
    :cond_2c
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 246
    .local v0, "b":Ljava/lang/StringBuffer;
    sparse-switch v1, :sswitch_data_ae

    .line 250
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Bug: unexpected char"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 247
    :sswitch_41
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 252
    :goto_46
    add-int/lit8 v2, v2, 0x1

    .line 253
    move v4, v2

    .line 254
    .local v4, "next":I
    :goto_49
    if-ge v2, v3, :cond_9b

    .line 255
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 256
    if-eq v1, v9, :cond_67

    if-ne v1, v10, :cond_65

    if-le v2, v7, :cond_65

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v6, :cond_65

    add-int/lit8 v5, v2, -0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v6, :cond_67

    :cond_65
    if-ne v1, v8, :cond_8c

    .line 261
    :cond_67
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 262
    sparse-switch v1, :sswitch_data_bc

    .line 266
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Bug: unexpected char"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 248
    .end local v4    # "next":I
    :sswitch_79
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_46

    .line 249
    :sswitch_7f
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_46

    .line 263
    .restart local v4    # "next":I
    :sswitch_85
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 268
    :goto_8a
    add-int/lit8 v4, v2, 0x1

    .line 270
    :cond_8c
    add-int/lit8 v2, v2, 0x1

    goto :goto_49

    .line 264
    :sswitch_8f
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_8a

    .line 265
    :sswitch_95
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_8a

    .line 272
    :cond_9b
    if-ge v4, v3, :cond_a4

    .line 273
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 275
    :cond_a4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 279
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local v4    # "next":I
    :cond_a8
    return-object p0

    .line 237
    .restart local v1    # "c":C
    :cond_a9
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_e

    .line 246
    nop

    :sswitch_data_ae
    .sparse-switch
        0x26 -> :sswitch_7f
        0x3c -> :sswitch_41
        0x3e -> :sswitch_79
    .end sparse-switch

    .line 262
    :sswitch_data_bc
    .sparse-switch
        0x26 -> :sswitch_95
        0x3c -> :sswitch_85
        0x3e -> :sswitch_8f
    .end sparse-switch
.end method

.method public static XMLEncQAttr(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x3c

    const/16 v7, 0x26

    const/16 v6, 0x22

    .line 194
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 195
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v3, :cond_73

    .line 196
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 197
    .local v1, "c":C
    if-eq v1, v8, :cond_17

    if-eq v1, v7, :cond_17

    if-ne v1, v6, :cond_74

    .line 198
    :cond_17
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 200
    .local v0, "b":Ljava/lang/StringBuffer;
    sparse-switch v1, :sswitch_data_78

    .line 205
    :goto_24
    add-int/lit8 v2, v2, 0x1

    .line 206
    move v4, v2

    .line 207
    .local v4, "next":I
    :goto_27
    if-ge v2, v3, :cond_66

    .line 208
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 209
    if-eq v1, v8, :cond_33

    if-eq v1, v7, :cond_33

    if-ne v1, v6, :cond_3f

    .line 210
    :cond_33
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 211
    sparse-switch v1, :sswitch_data_86

    .line 216
    :goto_3d
    add-int/lit8 v4, v2, 0x1

    .line 218
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 201
    .end local v4    # "next":I
    :sswitch_42
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 202
    :sswitch_48
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 203
    :sswitch_4e
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_24

    .line 212
    .restart local v4    # "next":I
    :sswitch_54
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 213
    :sswitch_5a
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 214
    :sswitch_60
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3d

    .line 220
    :cond_66
    if-ge v4, v3, :cond_6f

    .line 221
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 223
    :cond_6f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 227
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local v4    # "next":I
    :cond_73
    return-object p0

    .line 195
    .restart local v1    # "c":C
    :cond_74
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 200
    nop

    :sswitch_data_78
    .sparse-switch
        0x22 -> :sswitch_4e
        0x26 -> :sswitch_48
        0x3c -> :sswitch_42
    .end sparse-switch

    .line 211
    :sswitch_data_86
    .sparse-switch
        0x22 -> :sswitch_60
        0x26 -> :sswitch_5a
        0x3c -> :sswitch_54
    .end sparse-switch
.end method

.method private static XMLOrXHTMLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "aposReplacement"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3e

    const/16 v9, 0x3c

    const/16 v8, 0x27

    const/16 v7, 0x26

    const/16 v6, 0x22

    .line 109
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 110
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    if-ge v2, v3, :cond_93

    .line 111
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 112
    .local v1, "c":C
    if-eq v1, v9, :cond_1f

    if-eq v1, v10, :cond_1f

    if-eq v1, v7, :cond_1f

    if-eq v1, v6, :cond_1f

    if-ne v1, v8, :cond_94

    .line 113
    :cond_1f
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 115
    .local v0, "b":Ljava/lang/StringBuffer;
    sparse-switch v1, :sswitch_data_98

    .line 122
    :goto_2c
    add-int/lit8 v2, v2, 0x1

    .line 123
    move v4, v2

    .line 124
    .local v4, "next":I
    :goto_2f
    if-ge v2, v3, :cond_86

    .line 125
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 126
    if-eq v1, v9, :cond_3f

    if-eq v1, v10, :cond_3f

    if-eq v1, v7, :cond_3f

    if-eq v1, v6, :cond_3f

    if-ne v1, v8, :cond_4b

    .line 127
    :cond_3f
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    sparse-switch v1, :sswitch_data_ae

    .line 135
    :goto_49
    add-int/lit8 v4, v2, 0x1

    .line 137
    :cond_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 116
    .end local v4    # "next":I
    :sswitch_4e
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 117
    :sswitch_54
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 118
    :sswitch_5a
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 119
    :sswitch_60
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 120
    :sswitch_66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 129
    .restart local v4    # "next":I
    :sswitch_6a
    const-string v5, "&lt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 130
    :sswitch_70
    const-string v5, "&gt;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 131
    :sswitch_76
    const-string v5, "&amp;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 132
    :sswitch_7c
    const-string v5, "&quot;"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 133
    :sswitch_82
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 139
    :cond_86
    if-ge v4, v3, :cond_8f

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    :cond_8f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 144
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local v4    # "next":I
    :cond_93
    return-object p0

    .line 110
    .restart local v1    # "c":C
    :cond_94
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_f

    .line 115
    :sswitch_data_98
    .sparse-switch
        0x22 -> :sswitch_60
        0x26 -> :sswitch_5a
        0x27 -> :sswitch_66
        0x3c -> :sswitch_4e
        0x3e -> :sswitch_54
    .end sparse-switch

    .line 128
    :sswitch_data_ae
    .sparse-switch
        0x22 -> :sswitch_7c
        0x26 -> :sswitch_76
        0x27 -> :sswitch_82
        0x3c -> :sswitch_6a
        0x3e -> :sswitch_70
    .end sparse-switch
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 606
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v3, " \t\r\n"

    invoke-direct {v1, p0, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 607
    .local v1, "st":Ljava/util/StringTokenizer;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 608
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_11
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 609
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 610
    .local v2, "tok":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 611
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_11

    .line 613
    .end local v2    # "tok":Ljava/lang/String;
    :cond_33
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static chomp(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 766
    const-string v0, "\r\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 769
    .end local p0    # "s":Ljava/lang/String;
    :cond_13
    :goto_13
    return-object p0

    .line 767
    .restart local p0    # "s":Ljava/lang/String;
    :cond_14
    const-string v0, "\r"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 768
    :cond_24
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_13
.end method

.method private static createEscapes()[C
    .registers 7

    .prologue
    const/16 v6, 0x5c

    const/16 v5, 0x27

    const/16 v4, 0x24

    const/16 v3, 0x22

    .line 388
    const/16 v2, 0x5d

    new-array v0, v2, [C

    .line 389
    .local v0, "escapes":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    const/16 v2, 0x20

    if-ge v1, v2, :cond_17

    .line 391
    const/4 v2, 0x1

    aput-char v2, v0, v1

    .line 389
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 393
    :cond_17
    aput-char v6, v0, v6

    .line 394
    aput-char v5, v0, v5

    .line 395
    aput-char v3, v0, v3

    .line 396
    const/16 v2, 0x3c

    const/16 v3, 0x6c

    aput-char v3, v0, v2

    .line 397
    const/16 v2, 0x3e

    const/16 v3, 0x67

    aput-char v3, v0, v2

    .line 398
    const/16 v2, 0x26

    const/16 v3, 0x61

    aput-char v3, v0, v2

    .line 399
    const/16 v2, 0x8

    const/16 v3, 0x62

    aput-char v3, v0, v2

    .line 400
    const/16 v2, 0x9

    const/16 v3, 0x74

    aput-char v3, v0, v2

    .line 401
    const/16 v2, 0xa

    const/16 v3, 0x6e

    aput-char v3, v0, v2

    .line 402
    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-char v3, v0, v2

    .line 403
    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-char v3, v0, v2

    .line 404
    aput-char v4, v0, v4

    .line 405
    return-object v0
.end method

.method public static deduceLocale(Ljava/lang/String;)Ljava/util/Locale;
    .registers 7
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 585
    if-nez p0, :cond_4

    const/4 v2, 0x0

    .line 602
    :goto_3
    return-object v2

    .line 586
    :cond_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    .line 587
    .local v2, "locale":Ljava/util/Locale;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_22

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x22

    if-ne v4, v5, :cond_22

    const/4 v4, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 588
    :cond_22
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, ",_ "

    invoke-direct {v3, p0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    .local v3, "st":Ljava/util/StringTokenizer;
    const-string v1, ""

    .local v1, "lang":Ljava/lang/String;
    const-string v0, ""

    .line 590
    .local v0, "country":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_37

    .line 591
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 593
    :cond_37
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 594
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 596
    :cond_41
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-nez v4, :cond_4d

    .line 597
    new-instance v2, Ljava/util/Locale;

    .end local v2    # "locale":Ljava/util/Locale;
    invoke-direct {v2, v1, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2    # "locale":Ljava/util/Locale;
    goto :goto_3

    .line 600
    :cond_4d
    new-instance v2, Ljava/util/Locale;

    .end local v2    # "locale":Ljava/util/Locale;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v0, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2    # "locale":Ljava/util/Locale;
    goto :goto_3
.end method

.method public static emptyToNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 777
    if-nez p0, :cond_4

    .line 778
    .end local p0    # "s":Ljava/lang/String;
    :goto_3
    return-object v0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_b

    move-object p0, v0

    .end local p0    # "s":Ljava/lang/String;
    :cond_b
    move-object v0, p0

    goto :goto_3
.end method

.method public static getYesNo(Ljava/lang/String;)Z
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 617
    const-string v1, "\""

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 618
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 621
    :cond_13
    const-string v1, "n"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_33

    const-string v1, "no"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_33

    const-string v1, "f"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_33

    const-string v1, "false"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 625
    :cond_33
    const/4 v0, 0x0

    .line 631
    :cond_34
    return v0

    .line 627
    :cond_35
    const-string v1, "y"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    const-string v1, "yes"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    const-string v1, "t"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    const-string v1, "true"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    .line 633
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal boolean value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isXMLID(Ljava/lang/String;)Z
    .registers 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2e

    const/16 v4, 0x2d

    const/4 v2, 0x0

    .line 1296
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_32

    .line 1297
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1298
    .local v0, "c":C
    if-nez v1, :cond_1d

    .line 1299
    if-eq v0, v4, :cond_1c

    if-eq v0, v5, :cond_1c

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 1306
    .end local v0    # "c":C
    :cond_1c
    :goto_1c
    return v2

    .line 1302
    .restart local v0    # "c":C
    :cond_1d
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_2f

    const/16 v3, 0x3a

    if-eq v0, v3, :cond_2f

    const/16 v3, 0x5f

    if-eq v0, v3, :cond_2f

    if-eq v0, v4, :cond_2f

    if-ne v0, v5, :cond_1c

    .line 1296
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1306
    .end local v0    # "c":C
    :cond_32
    const/4 v2, 0x1

    goto :goto_1c
.end method

.method public static jQuote(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 786
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-static {v0}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static jQuote(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x22

    .line 795
    if-nez p0, :cond_7

    .line 796
    const-string v5, "null"

    .line 830
    :goto_6
    return-object v5

    .line 798
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 799
    .local v3, "ln":I
    new-instance v0, Ljava/lang/StringBuffer;

    add-int/lit8 v5, v3, 0x4

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 800
    .local v0, "b":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 801
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    if-ge v2, v3, :cond_82

    .line 802
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 803
    .local v1, "c":C
    if-ne v1, v6, :cond_26

    .line 804
    const-string v5, "\\\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 801
    :goto_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 805
    :cond_26
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_30

    .line 806
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 807
    :cond_30
    const/16 v5, 0x20

    if-ge v1, v5, :cond_7e

    .line 808
    const/16 v5, 0xa

    if-ne v1, v5, :cond_3e

    .line 809
    const-string v5, "\\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 810
    :cond_3e
    const/16 v5, 0xd

    if-ne v1, v5, :cond_48

    .line 811
    const-string v5, "\\r"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 812
    :cond_48
    const/16 v5, 0xc

    if-ne v1, v5, :cond_52

    .line 813
    const-string v5, "\\f"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 814
    :cond_52
    const/16 v5, 0x8

    if-ne v1, v5, :cond_5c

    .line 815
    const-string v5, "\\b"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 816
    :cond_5c
    const/16 v5, 0x9

    if-ne v1, v5, :cond_66

    .line 817
    const-string v5, "\\t"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 819
    :cond_66
    const-string v5, "\\u00"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 820
    div-int/lit8 v4, v1, 0x10

    .line 821
    .local v4, "x":I
    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 822
    and-int/lit8 v4, v1, 0xf

    .line 823
    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 826
    .end local v4    # "x":I
    :cond_7e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 829
    .end local v1    # "c":C
    :cond_82
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 830
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_6
.end method

.method public static jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 838
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-static {v0}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x22

    .line 847
    if-nez p0, :cond_7

    .line 848
    const-string v5, "null"

    .line 884
    :goto_6
    return-object v5

    .line 850
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 851
    .local v3, "ln":I
    new-instance v0, Ljava/lang/StringBuffer;

    add-int/lit8 v5, v3, 0x4

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 852
    .local v0, "b":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 853
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    if-ge v2, v3, :cond_8c

    .line 854
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 855
    .local v1, "c":C
    if-ne v1, v6, :cond_26

    .line 856
    const-string v5, "\\\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 853
    :goto_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 857
    :cond_26
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_30

    .line 858
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 859
    :cond_30
    const/16 v5, 0x3c

    if-ne v1, v5, :cond_3a

    .line 860
    const-string v5, "\\u003C"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 861
    :cond_3a
    const/16 v5, 0x20

    if-ge v1, v5, :cond_88

    .line 862
    const/16 v5, 0xa

    if-ne v1, v5, :cond_48

    .line 863
    const-string v5, "\\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 864
    :cond_48
    const/16 v5, 0xd

    if-ne v1, v5, :cond_52

    .line 865
    const-string v5, "\\r"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 866
    :cond_52
    const/16 v5, 0xc

    if-ne v1, v5, :cond_5c

    .line 867
    const-string v5, "\\f"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 868
    :cond_5c
    const/16 v5, 0x8

    if-ne v1, v5, :cond_66

    .line 869
    const-string v5, "\\b"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 870
    :cond_66
    const/16 v5, 0x9

    if-ne v1, v5, :cond_70

    .line 871
    const-string v5, "\\t"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 873
    :cond_70
    const-string v5, "\\u00"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 874
    div-int/lit8 v4, v1, 0x10

    .line 875
    .local v4, "x":I
    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 876
    and-int/lit8 v4, v1, 0xf

    .line 877
    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 880
    .end local v4    # "x":I
    :cond_88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 883
    .end local v1    # "c":C
    :cond_8c
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 884
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_6
.end method

.method public static javaScriptStringEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 949
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lfreemarker/template/utility/StringUtil;->jsStringEnc(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static javaStringEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x5c

    const/16 v8, 0x22

    const/16 v7, 0x20

    const/16 v6, 0xa

    .line 899
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 900
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, v3, :cond_37

    .line 901
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 902
    .local v1, "c":C
    if-eq v1, v8, :cond_19

    if-eq v1, v9, :cond_19

    if-ge v1, v7, :cond_9f

    .line 903
    :cond_19
    new-instance v0, Ljava/lang/StringBuffer;

    add-int/lit8 v5, v3, 0x4

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 904
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 906
    :goto_28
    if-ne v1, v8, :cond_38

    .line 907
    const-string v5, "\\\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 933
    :goto_2f
    add-int/lit8 v2, v2, 0x1

    .line 934
    if-lt v2, v3, :cond_9a

    .line 935
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 941
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v1    # "c":C
    .end local p0    # "s":Ljava/lang/String;
    :cond_37
    return-object p0

    .line 908
    .restart local v0    # "b":Ljava/lang/StringBuffer;
    .restart local v1    # "c":C
    .restart local p0    # "s":Ljava/lang/String;
    :cond_38
    if-ne v1, v9, :cond_40

    .line 909
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 910
    :cond_40
    if-ge v1, v7, :cond_96

    .line 911
    if-ne v1, v6, :cond_4a

    .line 912
    const-string v5, "\\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 913
    :cond_4a
    const/16 v5, 0xd

    if-ne v1, v5, :cond_54

    .line 914
    const-string v5, "\\r"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 915
    :cond_54
    const/16 v5, 0xc

    if-ne v1, v5, :cond_5e

    .line 916
    const-string v5, "\\f"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 917
    :cond_5e
    const/16 v5, 0x8

    if-ne v1, v5, :cond_68

    .line 918
    const-string v5, "\\b"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 919
    :cond_68
    const/16 v5, 0x9

    if-ne v1, v5, :cond_72

    .line 920
    const-string v5, "\\t"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 922
    :cond_72
    const-string v5, "\\u00"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 923
    div-int/lit8 v4, v1, 0x10

    .line 924
    .local v4, "x":I
    if-ge v4, v6, :cond_8c

    add-int/lit8 v5, v4, 0x30

    :goto_7d
    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 926
    and-int/lit8 v4, v1, 0xf

    .line 927
    if-ge v4, v6, :cond_91

    add-int/lit8 v5, v4, 0x30

    :goto_87
    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 924
    :cond_8c
    add-int/lit8 v5, v4, -0xa

    add-int/lit8 v5, v5, 0x61

    goto :goto_7d

    .line 927
    :cond_91
    add-int/lit8 v5, v4, -0xa

    add-int/lit8 v5, v5, 0x61

    goto :goto_87

    .line 931
    .end local v4    # "x":I
    :cond_96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 937
    :cond_9a
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    goto :goto_28

    .line 900
    .end local v0    # "b":Ljava/lang/StringBuffer;
    :cond_9f
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_d
.end method

.method public static jsStringEnc(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 14
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "json"    # Z

    .prologue
    .line 1017
    const-string v10, "s"

    invoke-static {v10, p0}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1019
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 1020
    .local v5, "ln":I
    const/4 v9, 0x0

    .line 1021
    .local v9, "sb":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_b
    if-ge v4, v5, :cond_166

    .line 1022
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1024
    .local v0, "c":C
    const/16 v10, 0x3e

    if-le v0, v10, :cond_1d

    const/16 v10, 0x7f

    if-ge v0, v10, :cond_1d

    const/16 v10, 0x5c

    if-ne v0, v10, :cond_15f

    :cond_1d
    const/16 v10, 0x20

    if-eq v0, v10, :cond_15f

    const/16 v10, 0xa0

    if-lt v0, v10, :cond_29

    const/16 v10, 0x2028

    if-lt v0, v10, :cond_15f

    .line 1025
    :cond_29
    const/16 v10, 0x1f

    if-gt v0, v10, :cond_74

    .line 1026
    const/16 v10, 0xa

    if-ne v0, v10, :cond_56

    .line 1027
    const/16 v3, 0x6e

    .line 1082
    .local v3, "escapeType":I
    :goto_33
    if-eqz v3, :cond_15f

    .line 1083
    if-nez v9, :cond_46

    .line 1084
    new-instance v9, Ljava/lang/StringBuffer;

    .end local v9    # "sb":Ljava/lang/StringBuffer;
    add-int/lit8 v10, v5, 0x6

    invoke-direct {v9, v10}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1085
    .restart local v9    # "sb":Ljava/lang/StringBuffer;
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1088
    :cond_46
    const/16 v10, 0x5c

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1089
    const/16 v10, 0x20

    if-le v3, v10, :cond_106

    .line 1090
    int-to-char v10, v3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1021
    .end local v3    # "escapeType":I
    :cond_53
    :goto_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 1028
    :cond_56
    const/16 v10, 0xd

    if-ne v0, v10, :cond_5d

    .line 1029
    const/16 v3, 0x72

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1030
    .end local v3    # "escapeType":I
    :cond_5d
    const/16 v10, 0xc

    if-ne v0, v10, :cond_64

    .line 1031
    const/16 v3, 0x66

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1032
    .end local v3    # "escapeType":I
    :cond_64
    const/16 v10, 0x8

    if-ne v0, v10, :cond_6b

    .line 1033
    const/16 v3, 0x62

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1034
    .end local v3    # "escapeType":I
    :cond_6b
    const/16 v10, 0x9

    if-ne v0, v10, :cond_72

    .line 1035
    const/16 v3, 0x74

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1037
    .end local v3    # "escapeType":I
    :cond_72
    const/4 v3, 0x1

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1039
    .end local v3    # "escapeType":I
    :cond_74
    const/16 v10, 0x22

    if-ne v0, v10, :cond_7a

    .line 1040
    const/4 v3, 0x3

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1041
    .end local v3    # "escapeType":I
    :cond_7a
    const/16 v10, 0x27

    if-ne v0, v10, :cond_84

    .line 1042
    if-eqz p1, :cond_82

    const/4 v3, 0x0

    .restart local v3    # "escapeType":I
    :goto_81
    goto :goto_33

    .end local v3    # "escapeType":I
    :cond_82
    const/4 v3, 0x3

    goto :goto_81

    .line 1043
    :cond_84
    const/16 v10, 0x5c

    if-ne v0, v10, :cond_8a

    .line 1044
    const/4 v3, 0x3

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1045
    .end local v3    # "escapeType":I
    :cond_8a
    const/16 v10, 0x2f

    if-ne v0, v10, :cond_9c

    if-eqz v4, :cond_9a

    add-int/lit8 v10, v4, -0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x3c

    if-ne v10, v11, :cond_9c

    .line 1046
    :cond_9a
    const/4 v3, 0x3

    .restart local v3    # "escapeType":I
    goto :goto_33

    .line 1047
    .end local v3    # "escapeType":I
    :cond_9c
    const/16 v10, 0x3e

    if-ne v0, v10, :cond_ce

    .line 1049
    if-nez v4, :cond_a9

    .line 1050
    const/4 v2, 0x1

    .line 1064
    .local v2, "dangerous":Z
    :goto_a3
    if-eqz v2, :cond_cc

    if-eqz p1, :cond_ca

    const/4 v3, 0x1

    .line 1065
    .restart local v3    # "escapeType":I
    :goto_a8
    goto :goto_33

    .line 1052
    .end local v2    # "dangerous":Z
    .end local v3    # "escapeType":I
    :cond_a9
    add-int/lit8 v10, v4, -0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 1053
    .local v7, "prevC":C
    const/16 v10, 0x5d

    if-eq v7, v10, :cond_b7

    const/16 v10, 0x2d

    if-ne v7, v10, :cond_c8

    .line 1054
    :cond_b7
    const/4 v10, 0x1

    if-ne v4, v10, :cond_bc

    .line 1055
    const/4 v2, 0x1

    .restart local v2    # "dangerous":Z
    goto :goto_a3

    .line 1057
    .end local v2    # "dangerous":Z
    :cond_bc
    add-int/lit8 v10, v4, -0x2

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 1058
    .local v8, "prevPrevC":C
    if-ne v8, v7, :cond_c6

    const/4 v2, 0x1

    .line 1059
    .restart local v2    # "dangerous":Z
    :goto_c5
    goto :goto_a3

    .line 1058
    .end local v2    # "dangerous":Z
    :cond_c6
    const/4 v2, 0x0

    goto :goto_c5

    .line 1061
    .end local v8    # "prevPrevC":C
    :cond_c8
    const/4 v2, 0x0

    .restart local v2    # "dangerous":Z
    goto :goto_a3

    .line 1064
    .end local v7    # "prevC":C
    :cond_ca
    const/4 v3, 0x3

    goto :goto_a8

    :cond_cc
    const/4 v3, 0x0

    goto :goto_a8

    .line 1065
    .end local v2    # "dangerous":Z
    :cond_ce
    const/16 v10, 0x3c

    if-ne v0, v10, :cond_f0

    .line 1067
    add-int/lit8 v10, v5, -0x1

    if-ne v4, v10, :cond_dc

    .line 1068
    const/4 v2, 0x1

    .line 1073
    .restart local v2    # "dangerous":Z
    :goto_d7
    if-eqz v2, :cond_ee

    const/4 v3, 0x1

    .line 1074
    .restart local v3    # "escapeType":I
    :goto_da
    goto/16 :goto_33

    .line 1070
    .end local v2    # "dangerous":Z
    .end local v3    # "escapeType":I
    :cond_dc
    add-int/lit8 v10, v4, 0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 1071
    .local v6, "nextC":C
    const/16 v10, 0x21

    if-eq v6, v10, :cond_ea

    const/16 v10, 0x3f

    if-ne v6, v10, :cond_ec

    :cond_ea
    const/4 v2, 0x1

    .restart local v2    # "dangerous":Z
    :goto_eb
    goto :goto_d7

    .end local v2    # "dangerous":Z
    :cond_ec
    const/4 v2, 0x0

    goto :goto_eb

    .line 1073
    .end local v6    # "nextC":C
    .restart local v2    # "dangerous":Z
    :cond_ee
    const/4 v3, 0x0

    goto :goto_da

    .line 1074
    .end local v2    # "dangerous":Z
    :cond_f0
    const/16 v10, 0x7f

    if-lt v0, v10, :cond_f8

    const/16 v10, 0x9f

    if-le v0, v10, :cond_100

    :cond_f8
    const/16 v10, 0x2028

    if-eq v0, v10, :cond_100

    const/16 v10, 0x2029

    if-ne v0, v10, :cond_103

    .line 1077
    :cond_100
    const/4 v3, 0x1

    .restart local v3    # "escapeType":I
    goto/16 :goto_33

    .line 1079
    .end local v3    # "escapeType":I
    :cond_103
    const/4 v3, 0x0

    .restart local v3    # "escapeType":I
    goto/16 :goto_33

    .line 1091
    :cond_106
    const/4 v10, 0x1

    if-ne v3, v10, :cond_15a

    .line 1092
    if-nez p1, :cond_128

    const/16 v10, 0x100

    if-ge v0, v10, :cond_128

    .line 1093
    const/16 v10, 0x78

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1094
    shr-int/lit8 v10, v0, 0x4

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1095
    and-int/lit8 v10, v0, 0xf

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_53

    .line 1097
    :cond_128
    const/16 v10, 0x75

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1098
    move v1, v0

    .line 1099
    .local v1, "cp":I
    shr-int/lit8 v10, v1, 0xc

    and-int/lit8 v10, v10, 0xf

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1100
    shr-int/lit8 v10, v1, 0x8

    and-int/lit8 v10, v10, 0xf

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1101
    shr-int/lit8 v10, v1, 0x4

    and-int/lit8 v10, v10, 0xf

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1102
    and-int/lit8 v10, v1, 0xf

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->toHexDigit(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_53

    .line 1105
    .end local v1    # "cp":I
    :cond_15a
    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_53

    .line 1113
    .end local v3    # "escapeType":I
    :cond_15f
    if-eqz v9, :cond_53

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_53

    .line 1116
    .end local v0    # "c":C
    :cond_166
    if-nez v9, :cond_169

    .end local p0    # "s":Ljava/lang/String;
    :goto_168
    return-object p0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_169
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_168
.end method

.method public static jsonStringEnc(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 957
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lfreemarker/template/utility/StringUtil;->jsStringEnc(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static leftPad(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I

    .prologue
    .line 1342
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/StringUtil;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static leftPad(Ljava/lang/String;IC)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I
    .param p2, "filling"    # C

    .prologue
    .line 1355
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1356
    .local v2, "ln":I
    if-gt p1, v2, :cond_7

    .line 1369
    .end local p0    # "s":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 1360
    .restart local p0    # "s":Ljava/lang/String;
    :cond_7
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1362
    .local v3, "res":Ljava/lang/StringBuffer;
    sub-int v0, p1, v2

    .line 1363
    .local v0, "dif":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v0, :cond_17

    .line 1364
    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1363
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 1367
    :cond_17
    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1369
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I
    .param p2, "filling"    # Ljava/lang/String;

    .prologue
    .line 1384
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 1385
    .local v4, "ln":I
    if-gt p1, v4, :cond_7

    .line 1408
    .end local p0    # "s":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 1389
    .restart local p0    # "s":Ljava/lang/String;
    :cond_7
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1391
    .local v5, "res":Ljava/lang/StringBuffer;
    sub-int v1, p1, v4

    .line 1392
    .local v1, "dif":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 1393
    .local v2, "fln":I
    if-nez v2, :cond_1c

    .line 1394
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "The \"filling\" argument can\'t be 0 length string."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1397
    :cond_1c
    div-int v0, v1, v2

    .line 1398
    .local v0, "cnt":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1f
    if-ge v3, v0, :cond_27

    .line 1399
    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1398
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1401
    :cond_27
    rem-int v0, v1, v2

    .line 1402
    const/4 v3, 0x0

    :goto_2a
    if-ge v3, v0, :cond_36

    .line 1403
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1402
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 1406
    :cond_36
    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1408
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static matchesName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)Z
    .registers 10
    .param p0, "qname"    # Ljava/lang/String;
    .param p1, "nodeName"    # Ljava/lang/String;
    .param p2, "nsURI"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1314
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    .line 1315
    .local v0, "defaultNS":Ljava/lang/String;
    if-eqz v0, :cond_2f

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 1316
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2d

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "D:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    :cond_2d
    move v2, v3

    .line 1330
    :cond_2e
    :goto_2e
    return v2

    .line 1319
    :cond_2f
    const-string v4, ""

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_72

    .line 1320
    if-eqz v0, :cond_51

    .line 1321
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "N:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_2e

    .line 1323
    :cond_51
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_70

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "N:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    :cond_70
    move v2, v3

    goto :goto_2e

    .line 1326
    :cond_72
    invoke-virtual {p3, p2}, Lfreemarker/core/Environment;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1327
    .local v1, "prefix":Ljava/lang/String;
    if-eqz v1, :cond_2e

    .line 1330
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_2e
.end method

.method public static parseNameValuePairList(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .registers 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x5f

    const/16 v9, 0x2c

    .line 1144
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1146
    .local v4, "map":Ljava/util/Map;
    const/16 v0, 0x20

    .line 1147
    .local v0, "c":C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1148
    .local v3, "ln":I
    const/4 v5, 0x0

    .line 1156
    .local v5, "p":I
    :cond_10
    :goto_10
    if-ge v5, v3, :cond_1c

    .line 1157
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1158
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v8

    if-nez v8, :cond_1f

    .line 1163
    :cond_1c
    if-ne v5, v3, :cond_22

    .line 1288
    return-object v4

    .line 1161
    :cond_1f
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 1166
    :cond_22
    move v2, v5

    .line 1169
    .local v2, "keyStart":I
    :goto_23
    if-ge v5, v3, :cond_31

    .line 1170
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1171
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v8

    if-nez v8, :cond_64

    if-eq v0, v10, :cond_64

    .line 1176
    :cond_31
    if-ne v2, v5, :cond_67

    .line 1177
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Expecting letter, digit or \"_\" here, (the first character of the key) but found "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1174
    :cond_64
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 1184
    :cond_67
    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1187
    .local v1, "key":Ljava/lang/String;
    :goto_6b
    if-ge v5, v3, :cond_77

    .line 1188
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1189
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v8

    if-nez v8, :cond_9a

    .line 1194
    :cond_77
    if-ne v5, v3, :cond_c1

    .line 1195
    if-nez p1, :cond_9d

    .line 1196
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Expecting \":\", but reached the end of the string  at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1192
    :cond_9a
    add-int/lit8 v5, v5, 0x1

    goto :goto_6b

    .line 1202
    :cond_9d
    move-object v6, p1

    .line 1281
    .local v6, "value":Ljava/lang/String;
    :cond_9e
    :goto_9e
    invoke-interface {v4, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_10

    .line 1282
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Dublicated key: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {v1}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1203
    .end local v6    # "value":Ljava/lang/String;
    :cond_c1
    const/16 v8, 0x3a

    if-eq v0, v8, :cond_fe

    .line 1204
    if-eqz p1, :cond_c9

    if-eq v0, v9, :cond_fa

    .line 1205
    :cond_c9
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Expecting \":\" here, but found "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1213
    :cond_fa
    add-int/lit8 v5, v5, 0x1

    .line 1215
    move-object v6, p1

    .restart local v6    # "value":Ljava/lang/String;
    goto :goto_9e

    .line 1218
    .end local v6    # "value":Ljava/lang/String;
    :cond_fe
    add-int/lit8 v5, v5, 0x1

    .line 1221
    :goto_100
    if-ge v5, v3, :cond_10c

    .line 1222
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1223
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v8

    if-nez v8, :cond_12d

    .line 1228
    :cond_10c
    if-ne v5, v3, :cond_130

    .line 1229
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Expecting the value of the key here, but reached the end of the string  at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1226
    :cond_12d
    add-int/lit8 v5, v5, 0x1

    goto :goto_100

    .line 1235
    :cond_130
    move v7, v5

    .line 1238
    .local v7, "valueStart":I
    :goto_131
    if-ge v5, v3, :cond_13f

    .line 1239
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1240
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v8

    if-nez v8, :cond_172

    if-eq v0, v10, :cond_172

    .line 1245
    :cond_13f
    if-ne v7, v5, :cond_175

    .line 1246
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Expecting letter, digit or \"_\" here, (the first character of the value) but found "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1243
    :cond_172
    add-int/lit8 v5, v5, 0x1

    goto :goto_131

    .line 1254
    :cond_175
    invoke-virtual {p0, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 1257
    .restart local v6    # "value":Ljava/lang/String;
    :goto_179
    if-ge v5, v3, :cond_185

    .line 1258
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1259
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v8

    if-nez v8, :cond_1ba

    .line 1266
    :cond_185
    if-ge v5, v3, :cond_9e

    .line 1267
    if-eq v0, v9, :cond_1bd

    .line 1268
    new-instance v8, Ljava/text/ParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Excpecting \",\" or the end of the string here, but found "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " at position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1262
    :cond_1ba
    add-int/lit8 v5, v5, 0x1

    goto :goto_179

    .line 1275
    :cond_1bd
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_9e
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "oldSub"    # Ljava/lang/String;
    .param p2, "newSub"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 703
    invoke-static {p0, p1, p2, v0, v0}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;
    .registers 16
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "oldsub"    # Ljava/lang/String;
    .param p2, "newsub"    # Ljava/lang/String;
    .param p3, "caseInsensitive"    # Z
    .param p4, "firstOnly"    # Z

    .prologue
    const/4 v10, -0x1

    .line 720
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    .line 722
    .local v6, "oln":I
    if-nez v6, :cond_47

    .line 723
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    .line 724
    .local v5, "nln":I
    if-nez v5, :cond_e

    .line 758
    .end local v5    # "nln":I
    .end local p0    # "text":Ljava/lang/String;
    :cond_d
    :goto_d
    return-object p0

    .line 727
    .restart local v5    # "nln":I
    .restart local p0    # "text":Ljava/lang/String;
    :cond_e
    if-eqz p4, :cond_22

    .line 728
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_d

    .line 730
    :cond_22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    .line 731
    .local v7, "tln":I
    new-instance v1, Ljava/lang/StringBuffer;

    add-int/lit8 v8, v7, 0x1

    mul-int/2addr v8, v5

    add-int/2addr v8, v7

    invoke-direct {v1, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 732
    .local v1, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 733
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_33
    if-ge v3, v7, :cond_42

    .line 734
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 735
    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 733
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .line 737
    :cond_42
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_d

    .line 741
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v5    # "nln":I
    .end local v7    # "tln":I
    :cond_47
    if-eqz p3, :cond_4d

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 742
    :cond_4d
    if-eqz p3, :cond_91

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 743
    .local v4, "input":Ljava/lang/String;
    :goto_53
    invoke-virtual {v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 744
    .local v2, "e":I
    if-eq v2, v10, :cond_d

    .line 747
    const/4 v0, 0x0

    .line 748
    .local v0, "b":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    .line 749
    .restart local v7    # "tln":I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v6

    const/4 v9, 0x0

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    mul-int/lit8 v8, v8, 0x3

    add-int/2addr v8, v7

    invoke-direct {v1, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 752
    .restart local v1    # "buf":Ljava/lang/StringBuffer;
    :cond_70
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 753
    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 754
    add-int v0, v2, v6

    .line 755
    invoke-virtual {v4, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 756
    if-eq v2, v10, :cond_84

    if-eqz p4, :cond_70

    .line 757
    :cond_84
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 758
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_d

    .end local v0    # "b":I
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "e":I
    .end local v4    # "input":Ljava/lang/String;
    .end local v7    # "tln":I
    :cond_91
    move-object v4, p0

    .line 742
    goto :goto_53
.end method

.method public static rightPad(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I

    .prologue
    .line 1420
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/StringUtil;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static rightPad(Ljava/lang/String;IC)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I
    .param p2, "filling"    # C

    .prologue
    .line 1433
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1434
    .local v2, "ln":I
    if-gt p1, v2, :cond_7

    .line 1447
    .end local p0    # "s":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 1438
    .restart local p0    # "s":Ljava/lang/String;
    :cond_7
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1440
    .local v3, "res":Ljava/lang/StringBuffer;
    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1442
    sub-int v0, p1, v2

    .line 1443
    .local v0, "dif":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    if-ge v1, v0, :cond_1a

    .line 1444
    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1443
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 1447
    :cond_1a
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "minLength"    # I
    .param p2, "filling"    # Ljava/lang/String;

    .prologue
    .line 1464
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 1465
    .local v5, "ln":I
    if-gt p1, v5, :cond_7

    .line 1496
    .end local p0    # "s":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 1469
    .restart local p0    # "s":Ljava/lang/String;
    :cond_7
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1471
    .local v6, "res":Ljava/lang/StringBuffer;
    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1473
    sub-int v1, p1, v5

    .line 1474
    .local v1, "dif":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1475
    .local v3, "fln":I
    if-nez v3, :cond_1f

    .line 1476
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "The \"filling\" argument can\'t be 0 length string."

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1479
    :cond_1f
    rem-int v7, v5, v3

    .line 1480
    .local v7, "start":I
    sub-int v8, v3, v7

    if-gt v8, v1, :cond_33

    move v2, v3

    .line 1483
    .local v2, "end":I
    :goto_26
    move v4, v7

    .local v4, "i":I
    :goto_27
    if-ge v4, v2, :cond_36

    .line 1484
    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1483
    add-int/lit8 v4, v4, 0x1

    goto :goto_27

    .line 1480
    .end local v2    # "end":I
    .end local v4    # "i":I
    :cond_33
    add-int v2, v7, v1

    goto :goto_26

    .line 1486
    .restart local v2    # "end":I
    .restart local v4    # "i":I
    :cond_36
    sub-int v8, v2, v7

    sub-int/2addr v1, v8

    .line 1487
    div-int v0, v1, v3

    .line 1488
    .local v0, "cnt":I
    const/4 v4, 0x0

    :goto_3c
    if-ge v4, v0, :cond_44

    .line 1489
    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1488
    add-int/lit8 v4, v4, 0x1

    goto :goto_3c

    .line 1491
    :cond_44
    rem-int v0, v1, v3

    .line 1492
    const/4 v4, 0x0

    :goto_47
    if-ge v4, v0, :cond_53

    .line 1493
    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1492
    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    .line 1496
    :cond_53
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static split(Ljava/lang/String;C)[Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "c"    # C

    .prologue
    const/4 v8, -0x1

    .line 643
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 645
    .local v5, "ln":I
    const/4 v3, 0x0

    .line 646
    .local v3, "i":I
    const/4 v1, 0x1

    .line 647
    .local v1, "cnt":I
    :goto_7
    invoke-virtual {p0, p1, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-eq v3, v8, :cond_12

    .line 648
    add-int/lit8 v1, v1, 0x1

    .line 649
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 651
    :cond_12
    new-array v6, v1, [Ljava/lang/String;

    .line 653
    .local v6, "res":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 654
    const/4 v0, 0x0

    .local v0, "b":I
    move v4, v3

    .line 655
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_17
    if-gt v0, v5, :cond_2c

    .line 656
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 657
    .local v2, "e":I
    if-ne v2, v8, :cond_20

    move v2, v5

    .line 658
    :cond_20
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    .line 659
    add-int/lit8 v0, v2, 0x1

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_17

    .line 661
    .end local v2    # "e":I
    :cond_2c
    return-object v6
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 15
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;
    .param p2, "caseInsensitive"    # Z

    .prologue
    const/4 v11, -0x1

    .line 668
    if-eqz p2, :cond_1f

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    .line 669
    .local v9, "splitString":Ljava/lang/String;
    :goto_7
    if-eqz p2, :cond_21

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 673
    .local v5, "input":Ljava/lang/String;
    :goto_d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 674
    .local v6, "ln":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 676
    .local v8, "sln":I
    if-nez v8, :cond_23

    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "The separator string has 0 length"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .end local v5    # "input":Ljava/lang/String;
    .end local v6    # "ln":I
    .end local v8    # "sln":I
    .end local v9    # "splitString":Ljava/lang/String;
    :cond_1f
    move-object v9, p1

    .line 668
    goto :goto_7

    .restart local v9    # "splitString":Ljava/lang/String;
    :cond_21
    move-object v5, p0

    .line 669
    goto :goto_d

    .line 679
    .restart local v5    # "input":Ljava/lang/String;
    .restart local v6    # "ln":I
    .restart local v8    # "sln":I
    :cond_23
    const/4 v3, 0x0

    .line 680
    .local v3, "i":I
    const/4 v1, 0x1

    .line 681
    .local v1, "cnt":I
    :goto_25
    invoke-virtual {v5, v9, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v11, :cond_2f

    .line 682
    add-int/lit8 v1, v1, 0x1

    .line 683
    add-int/2addr v3, v8

    goto :goto_25

    .line 685
    :cond_2f
    new-array v7, v1, [Ljava/lang/String;

    .line 687
    .local v7, "res":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 688
    const/4 v0, 0x0

    .local v0, "b":I
    move v4, v3

    .line 689
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_34
    if-gt v0, v6, :cond_49

    .line 690
    invoke-virtual {v5, v9, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 691
    .local v2, "e":I
    if-ne v2, v11, :cond_3d

    move v2, v6

    .line 692
    :cond_3d
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v7, v4

    .line 693
    add-int v0, v2, v8

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_34

    .line 695
    .end local v2    # "e":I
    :cond_49
    return-object v7
.end method

.method private static toHexDigit(I)C
    .registers 2
    .param p0, "d"    # I

    .prologue
    .line 1120
    const/16 v0, 0xa

    if-ge p0, v0, :cond_8

    add-int/lit8 v0, p0, 0x30

    :goto_6
    int-to-char v0, v0

    return v0

    :cond_8
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    goto :goto_6
.end method

.method public static tryToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 1521
    if-nez p0, :cond_4

    const/4 v2, 0x0

    .line 1529
    :goto_3
    return-object v2

    .line 1524
    :cond_4
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v2

    goto :goto_3

    .line 1525
    :catch_9
    move-exception v0

    .line 1527
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_a
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "[toString() failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_22} :catch_24

    move-result-object v2

    goto :goto_3

    .line 1528
    :catch_24
    move-exception v1

    .line 1529
    .local v1, "e2":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "[toString() failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public static versionStringToInt(Ljava/lang/String;)I
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 1511
    new-instance v0, Lfreemarker/template/Version;

    invoke-direct {v0, p0}, Lfreemarker/template/Version;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lfreemarker/template/Version;->intValue()I

    move-result v0

    return v0
.end method
