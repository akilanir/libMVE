.class public Lorg/mozilla/javascript/regexp/RegExpImpl;
.super Ljava/lang/Object;
.source "RegExpImpl.java"

# interfaces
.implements Lorg/mozilla/javascript/RegExpProxy;


# instance fields
.field protected input:Ljava/lang/String;

.field protected lastMatch:Lorg/mozilla/javascript/regexp/SubString;

.field protected lastParen:Lorg/mozilla/javascript/regexp/SubString;

.field protected leftContext:Lorg/mozilla/javascript/regexp/SubString;

.field protected multiline:Z

.field protected parens:[Lorg/mozilla/javascript/regexp/SubString;

.field protected rightContext:Lorg/mozilla/javascript/regexp/SubString;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;IZ)Lorg/mozilla/javascript/regexp/NativeRegExp;
    .registers 13
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "optarg"    # I
    .param p4, "forceFlat"    # Z

    .prologue
    const/4 v7, 0x0

    .line 127
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 128
    .local v4, "topScope":Lorg/mozilla/javascript/Scriptable;
    array-length v5, p2

    if-eqz v5, :cond_e

    aget-object v5, p2, v7

    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v6, :cond_1c

    .line 129
    :cond_e
    const-string v5, ""

    const-string v6, ""

    invoke-static {p0, v5, v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;

    move-result-object v0

    .line 130
    .local v0, "compiled":Lorg/mozilla/javascript/regexp/RECompiled;
    new-instance v2, Lorg/mozilla/javascript/regexp/NativeRegExp;

    invoke-direct {v2, v4, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RECompiled;)V

    .line 145
    .end local v0    # "compiled":Lorg/mozilla/javascript/regexp/RECompiled;
    .local v2, "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :goto_1b
    return-object v2

    .line 131
    .end local v2    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :cond_1c
    aget-object v5, p2, v7

    instance-of v5, v5, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-eqz v5, :cond_27

    .line 132
    aget-object v2, p2, v7

    check-cast v2, Lorg/mozilla/javascript/regexp/NativeRegExp;

    .restart local v2    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    goto :goto_1b

    .line 134
    .end local v2    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :cond_27
    aget-object v5, p2, v7

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 136
    .local v3, "src":Ljava/lang/String;
    array-length v5, p2

    if-ge p3, v5, :cond_42

    .line 137
    aput-object v3, p2, v7

    .line 138
    aget-object v5, p2, p3

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "opt":Ljava/lang/String;
    :goto_38
    invoke-static {p0, v3, v1, p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;

    move-result-object v0

    .line 143
    .restart local v0    # "compiled":Lorg/mozilla/javascript/regexp/RECompiled;
    new-instance v2, Lorg/mozilla/javascript/regexp/NativeRegExp;

    invoke-direct {v2, v4, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RECompiled;)V

    .restart local v2    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    goto :goto_1b

    .line 140
    .end local v0    # "compiled":Lorg/mozilla/javascript/regexp/RECompiled;
    .end local v1    # "opt":Ljava/lang/String;
    .end local v2    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :cond_42
    const/4 v1, 0x0

    .restart local v1    # "opt":Ljava/lang/String;
    goto :goto_38
.end method

.method private static do_replace(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/regexp/RegExpImpl;)V
    .registers 15
    .param p0, "rdata"    # Lorg/mozilla/javascript/regexp/GlobData;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "regExpImpl"    # Lorg/mozilla/javascript/regexp/RegExpImpl;

    .prologue
    const/4 v11, 0x0

    .line 479
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 480
    .local v0, "charBuf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 481
    .local v1, "cp":I
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/GlobData;->repstr:Ljava/lang/String;

    .line 482
    .local v2, "da":Ljava/lang/String;
    iget v4, p0, Lorg/mozilla/javascript/regexp/GlobData;->dollar:I

    .line 483
    .local v4, "dp":I
    const/4 v8, -0x1

    if-eq v4, v8, :cond_3a

    .line 484
    const/4 v8, 0x1

    new-array v6, v8, [I

    .line 486
    .local v6, "skip":[I
    :cond_e
    sub-int v5, v4, v1

    .line 487
    .local v5, "len":I
    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    move v1, v4

    .line 489
    invoke-static {p1, p2, v2, v4, v6}, Lorg/mozilla/javascript/regexp/RegExpImpl;->interpretDollar(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;I[I)Lorg/mozilla/javascript/regexp/SubString;

    move-result-object v7

    .line 491
    .local v7, "sub":Lorg/mozilla/javascript/regexp/SubString;
    if-eqz v7, :cond_48

    .line 492
    iget v5, v7, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 493
    if-lez v5, :cond_2c

    .line 494
    iget-object v8, v7, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    iget v9, v7, Lorg/mozilla/javascript/regexp/SubString;->index:I

    iget v10, v7, Lorg/mozilla/javascript/regexp/SubString;->index:I

    add-int/2addr v10, v5

    invoke-virtual {v0, v8, v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 496
    :cond_2c
    aget v8, v6, v11

    add-int/2addr v1, v8

    .line 497
    aget v8, v6, v11

    add-int/2addr v4, v8

    .line 501
    :goto_32
    const/16 v8, 0x24

    invoke-virtual {v2, v8, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 502
    if-gez v4, :cond_e

    .line 504
    .end local v5    # "len":I
    .end local v6    # "skip":[I
    .end local v7    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_3a
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 505
    .local v3, "daL":I
    if-le v3, v1, :cond_47

    .line 506
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    :cond_47
    return-void

    .line 499
    .end local v3    # "daL":I
    .restart local v5    # "len":I
    .restart local v6    # "skip":[I
    .restart local v7    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_48
    add-int/lit8 v4, v4, 0x1

    goto :goto_32
.end method

.method private static find_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;ILorg/mozilla/javascript/RegExpProxy;Lorg/mozilla/javascript/Scriptable;[I[I[Z[[Ljava/lang/String;)I
    .registers 26
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "separator"    # Ljava/lang/String;
    .param p4, "version"    # I
    .param p5, "reProxy"    # Lorg/mozilla/javascript/RegExpProxy;
    .param p6, "re"    # Lorg/mozilla/javascript/Scriptable;
    .param p7, "ip"    # [I
    .param p8, "matchlen"    # [I
    .param p9, "matched"    # [Z
    .param p10, "parensp"    # [[Ljava/lang/String;

    .prologue
    .line 626
    const/4 v2, 0x0

    aget v12, p7, v2

    .line 627
    .local v12, "i":I
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    .line 634
    .local v14, "length":I
    const/16 v2, 0x78

    move/from16 v0, p4

    if-ne v0, v2, :cond_65

    if-nez p6, :cond_65

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_65

    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_65

    .line 638
    if-nez v12, :cond_37

    .line 639
    :goto_23
    if-ge v12, v14, :cond_34

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 640
    add-int/lit8 v12, v12, 0x1

    goto :goto_23

    .line 641
    :cond_34
    const/4 v2, 0x0

    aput v12, p7, v2

    .line 645
    :cond_37
    if-ne v12, v14, :cond_3b

    .line 646
    const/4 v14, -0x1

    .line 724
    .end local v14    # "length":I
    :cond_3a
    :goto_3a
    return v14

    .line 650
    .restart local v14    # "length":I
    :cond_3b
    :goto_3b
    if-ge v12, v14, :cond_4c

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_4c

    .line 651
    add-int/lit8 v12, v12, 0x1

    goto :goto_3b

    .line 654
    :cond_4c
    move v13, v12

    .line 655
    .local v13, "j":I
    :goto_4d
    if-ge v13, v14, :cond_5e

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 656
    add-int/lit8 v13, v13, 0x1

    goto :goto_4d

    .line 659
    :cond_5e
    const/4 v2, 0x0

    sub-int v3, v13, v12

    aput v3, p8, v2

    move v14, v12

    .line 660
    goto :goto_3a

    .line 673
    .end local v13    # "j":I
    :cond_65
    if-le v12, v14, :cond_69

    .line 674
    const/4 v14, -0x1

    goto :goto_3a

    .line 681
    :cond_69
    if-eqz p6, :cond_83

    move-object/from16 v2, p5

    move-object v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    .line 682
    invoke-interface/range {v2 .. v11}, Lorg/mozilla/javascript/RegExpProxy;->find_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;[I[I[Z[[Ljava/lang/String;)I

    move-result v14

    goto :goto_3a

    .line 691
    :cond_83
    if-eqz p4, :cond_8f

    const/16 v2, 0x82

    move/from16 v0, p4

    if-ge v0, v2, :cond_8f

    if-nez v14, :cond_8f

    .line 693
    const/4 v14, -0x1

    goto :goto_3a

    .line 705
    :cond_8f
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_ae

    .line 706
    const/16 v2, 0x78

    move/from16 v0, p4

    if-ne v0, v2, :cond_a6

    .line 707
    if-ne v12, v14, :cond_a3

    .line 708
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput v3, p8, v2

    move v14, v12

    .line 709
    goto :goto_3a

    .line 711
    :cond_a3
    add-int/lit8 v14, v12, 0x1

    goto :goto_3a

    .line 713
    :cond_a6
    if-ne v12, v14, :cond_ab

    const/4 v2, -0x1

    :goto_a9
    move v14, v2

    goto :goto_3a

    :cond_ab
    add-int/lit8 v2, v12, 0x1

    goto :goto_a9

    .line 719
    :cond_ae
    const/4 v2, 0x0

    aget v2, p7, v2

    if-ge v2, v14, :cond_3a

    .line 722
    const/4 v2, 0x0

    aget v2, p7, v2

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    .line 724
    const/4 v2, -0x1

    if-eq v12, v2, :cond_3a

    move v14, v12

    goto/16 :goto_3a
.end method

.method private static interpretDollar(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;I[I)Lorg/mozilla/javascript/regexp/SubString;
    .registers 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "res"    # Lorg/mozilla/javascript/regexp/RegExpImpl;
    .param p2, "da"    # Ljava/lang/String;
    .param p3, "dp"    # I
    .param p4, "skip"    # [I

    .prologue
    .line 389
    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x24

    if-eq v7, v8, :cond_b

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 392
    :cond_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v6

    .line 393
    .local v6, "version":I
    if-eqz v6, :cond_23

    const/16 v7, 0x8c

    if-gt v6, v7, :cond_23

    .line 396
    if-lez p3, :cond_23

    add-int/lit8 v7, p3, -0x1

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x5c

    if-ne v7, v8, :cond_23

    .line 397
    const/4 v7, 0x0

    .line 470
    :goto_22
    return-object v7

    .line 399
    :cond_23
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 400
    .local v1, "daL":I
    add-int/lit8 v7, p3, 0x1

    if-lt v7, v1, :cond_2d

    .line 401
    const/4 v7, 0x0

    goto :goto_22

    .line 403
    :cond_2d
    add-int/lit8 v7, p3, 0x1

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 404
    .local v2, "dc":C
    invoke-static {v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v7

    if-eqz v7, :cond_9b

    .line 406
    if-eqz v6, :cond_6b

    const/16 v7, 0x8c

    if-gt v6, v7, :cond_6b

    .line 409
    const/16 v7, 0x30

    if-ne v2, v7, :cond_45

    .line 410
    const/4 v7, 0x0

    goto :goto_22

    .line 412
    :cond_45
    const/4 v3, 0x0

    .line 413
    .local v3, "num":I
    move v0, p3

    .line 414
    .local v0, "cp":I
    :goto_47
    add-int/lit8 v0, v0, 0x1

    if-ge v0, v1, :cond_5d

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 416
    mul-int/lit8 v7, v3, 0xa

    add-int/lit8 v8, v2, -0x30

    add-int v5, v7, v8

    .line 417
    .local v5, "tmp":I
    if-ge v5, v3, :cond_69

    .line 441
    .end local v5    # "tmp":I
    :cond_5d
    add-int/lit8 v3, v3, -0x1

    .line 442
    const/4 v7, 0x0

    sub-int v8, v0, p3

    aput v8, p4, v7

    .line 443
    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/regexp/RegExpImpl;->getParenSubString(I)Lorg/mozilla/javascript/regexp/SubString;

    move-result-object v7

    goto :goto_22

    .line 419
    .restart local v5    # "tmp":I
    :cond_69
    move v3, v5

    goto :goto_47

    .line 423
    .end local v0    # "cp":I
    .end local v3    # "num":I
    .end local v5    # "tmp":I
    :cond_6b
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    if-nez v7, :cond_76

    const/4 v4, 0x0

    .line 424
    .local v4, "parenCount":I
    :goto_70
    add-int/lit8 v3, v2, -0x30

    .line 425
    .restart local v3    # "num":I
    if-le v3, v4, :cond_7a

    .line 426
    const/4 v7, 0x0

    goto :goto_22

    .line 423
    .end local v3    # "num":I
    .end local v4    # "parenCount":I
    :cond_76
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    array-length v4, v7

    goto :goto_70

    .line 427
    .restart local v3    # "num":I
    .restart local v4    # "parenCount":I
    :cond_7a
    add-int/lit8 v0, p3, 0x2

    .line 428
    .restart local v0    # "cp":I
    add-int/lit8 v7, p3, 0x2

    if-ge v7, v1, :cond_97

    .line 429
    add-int/lit8 v7, p3, 0x2

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 430
    invoke-static {v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v7

    if-eqz v7, :cond_97

    .line 431
    mul-int/lit8 v7, v3, 0xa

    add-int/lit8 v8, v2, -0x30

    add-int v5, v7, v8

    .line 432
    .restart local v5    # "tmp":I
    if-gt v5, v4, :cond_97

    .line 433
    add-int/lit8 v0, v0, 0x1

    .line 434
    move v3, v5

    .line 438
    .end local v5    # "tmp":I
    :cond_97
    if-nez v3, :cond_5d

    const/4 v7, 0x0

    goto :goto_22

    .line 446
    .end local v0    # "cp":I
    .end local v3    # "num":I
    .end local v4    # "parenCount":I
    :cond_9b
    const/4 v7, 0x0

    const/4 v8, 0x2

    aput v8, p4, v7

    .line 447
    sparse-switch v2, :sswitch_data_d0

    .line 470
    const/4 v7, 0x0

    goto/16 :goto_22

    .line 449
    :sswitch_a5
    new-instance v7, Lorg/mozilla/javascript/regexp/SubString;

    const-string v8, "$"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/regexp/SubString;-><init>(Ljava/lang/String;)V

    goto/16 :goto_22

    .line 451
    :sswitch_ae
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    goto/16 :goto_22

    .line 453
    :sswitch_b2
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastParen:Lorg/mozilla/javascript/regexp/SubString;

    goto/16 :goto_22

    .line 455
    :sswitch_b6
    const/16 v7, 0x78

    if-ne v6, v7, :cond_c7

    .line 463
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    const/4 v8, 0x0

    iput v8, v7, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 464
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    iget-object v8, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    iget v8, v8, Lorg/mozilla/javascript/regexp/SubString;->index:I

    iput v8, v7, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 466
    :cond_c7
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    goto/16 :goto_22

    .line 468
    :sswitch_cb
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    goto/16 :goto_22

    .line 447
    nop

    :sswitch_data_d0
    .sparse-switch
        0x24 -> :sswitch_a5
        0x26 -> :sswitch_ae
        0x27 -> :sswitch_cb
        0x2b -> :sswitch_b2
        0x60 -> :sswitch_b6
    .end sparse-switch
.end method

.method private static matchOrReplace(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/regexp/RegExpImpl;Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/regexp/NativeRegExp;)Ljava/lang/Object;
    .registers 27
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "reImpl"    # Lorg/mozilla/javascript/regexp/RegExpImpl;
    .param p5, "data"    # Lorg/mozilla/javascript/regexp/GlobData;
    .param p6, "re"    # Lorg/mozilla/javascript/regexp/NativeRegExp;

    .prologue
    .line 156
    move-object/from16 v0, p5

    iget-object v9, v0, Lorg/mozilla/javascript/regexp/GlobData;->str:Ljava/lang/String;

    .line 157
    .local v9, "str":Ljava/lang/String;
    invoke-virtual/range {p6 .. p6}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getFlags()I

    move-result v5

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_45

    const/4 v5, 0x1

    :goto_d
    move-object/from16 v0, p5

    iput-boolean v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->global:Z

    .line 158
    const/4 v5, 0x1

    new-array v10, v5, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v10, v5

    .line 159
    .local v10, "indexp":[I
    const/16 v19, 0x0

    .line 160
    .local v19, "result":Ljava/lang/Object;
    move-object/from16 v0, p5

    iget v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->mode:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_4d

    .line 161
    const/4 v11, 0x0

    move-object/from16 v5, p6

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p4

    invoke-virtual/range {v5 .. v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v19

    .line 163
    if-eqz v19, :cond_47

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 164
    move-object/from16 v0, p4

    iget-object v5, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    iget v5, v5, Lorg/mozilla/javascript/regexp/SubString;->length:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    .line 197
    .end local v19    # "result":Ljava/lang/Object;
    :cond_44
    :goto_44
    return-object v19

    .line 157
    .end local v10    # "indexp":[I
    :cond_45
    const/4 v5, 0x0

    goto :goto_d

    .line 166
    .restart local v10    # "indexp":[I
    .restart local v19    # "result":Ljava/lang/Object;
    :cond_47
    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    .local v19, "result":Ljava/lang/Integer;
    goto :goto_44

    .line 167
    .local v19, "result":Ljava/lang/Object;
    :cond_4d
    move-object/from16 v0, p5

    iget-boolean v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->global:Z

    if-eqz v5, :cond_e3

    .line 168
    const-wide/16 v5, 0x0

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, p6

    iput-object v5, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 169
    const/16 v17, 0x0

    .end local v19    # "result":Ljava/lang/Object;
    .local v17, "count":I
    :goto_5f
    const/4 v5, 0x0

    aget v5, v10, v5

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v6

    if-gt v5, v6, :cond_44

    .line 170
    const/4 v11, 0x0

    move-object/from16 v5, p6

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p4

    invoke-virtual/range {v5 .. v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v19

    .line 172
    .restart local v19    # "result":Ljava/lang/Object;
    if-eqz v19, :cond_44

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_44

    .line 174
    move-object/from16 v0, p5

    iget v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->mode:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_b0

    .line 175
    move-object/from16 v0, p5

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, v17

    move-object/from16 v4, p4

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/regexp/RegExpImpl;->match_glob(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILorg/mozilla/javascript/regexp/RegExpImpl;)V

    .line 184
    :goto_95
    move-object/from16 v0, p4

    iget-object v5, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    iget v5, v5, Lorg/mozilla/javascript/regexp/SubString;->length:I

    if-nez v5, :cond_ad

    .line 185
    const/4 v5, 0x0

    aget v5, v10, v5

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v5, v6, :cond_44

    .line 187
    const/4 v5, 0x0

    aget v6, v10, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v10, v5

    .line 169
    :cond_ad
    add-int/lit8 v17, v17, 0x1

    goto :goto_5f

    .line 177
    :cond_b0
    move-object/from16 v0, p5

    iget v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->mode:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_ba

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 178
    :cond_ba
    move-object/from16 v0, p4

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v18, v0

    .line 179
    .local v18, "lastMatch":Lorg/mozilla/javascript/regexp/SubString;
    move-object/from16 v0, p5

    iget v15, v0, Lorg/mozilla/javascript/regexp/GlobData;->leftIndex:I

    .line 180
    .local v15, "leftIndex":I
    move-object/from16 v0, v18

    iget v5, v0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    sub-int v16, v5, v15

    .line 181
    .local v16, "leftlen":I
    move-object/from16 v0, v18

    iget v5, v0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    move-object/from16 v0, v18

    iget v6, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    add-int/2addr v5, v6

    move-object/from16 v0, p5

    iput v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->leftIndex:I

    move-object/from16 v11, p5

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p4

    .line 182
    invoke-static/range {v11 .. v16}, Lorg/mozilla/javascript/regexp/RegExpImpl;->replace_glob(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;II)V

    goto :goto_95

    .line 191
    .end local v15    # "leftIndex":I
    .end local v16    # "leftlen":I
    .end local v17    # "count":I
    .end local v18    # "lastMatch":Lorg/mozilla/javascript/regexp/SubString;
    :cond_e3
    move-object/from16 v0, p5

    iget v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->mode:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_f9

    const/4 v11, 0x0

    :goto_eb
    move-object/from16 v5, p6

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p4

    invoke-virtual/range {v5 .. v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v19

    goto/16 :goto_44

    :cond_f9
    const/4 v11, 0x1

    goto :goto_eb
.end method

.method private static match_glob(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILorg/mozilla/javascript/regexp/RegExpImpl;)V
    .registers 9
    .param p0, "mdata"    # Lorg/mozilla/javascript/regexp/GlobData;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "count"    # I
    .param p4, "reImpl"    # Lorg/mozilla/javascript/regexp/RegExpImpl;

    .prologue
    .line 295
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    if-nez v2, :cond_b

    .line 296
    const/4 v2, 0x0

    invoke-virtual {p1, p2, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    iput-object v2, p0, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    .line 298
    :cond_b
    iget-object v1, p4, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    .line 299
    .local v1, "matchsub":Lorg/mozilla/javascript/regexp/SubString;
    invoke-virtual {v1}, Lorg/mozilla/javascript/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "matchstr":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, p3, v3, v0}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 301
    return-void
.end method

.method private static replace_glob(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;II)V
    .registers 25
    .param p0, "rdata"    # Lorg/mozilla/javascript/regexp/GlobData;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "reImpl"    # Lorg/mozilla/javascript/regexp/RegExpImpl;
    .param p4, "leftIndex"    # I
    .param p5, "leftlen"    # I

    .prologue
    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->lambda:Lorg/mozilla/javascript/Function;

    move-object/from16 v17, v0

    if-eqz v17, :cond_f3

    .line 315
    move-object/from16 v0, p3

    iget-object v10, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    .line 316
    .local v10, "parens":[Lorg/mozilla/javascript/regexp/SubString;
    if-nez v10, :cond_35

    const/4 v9, 0x0

    .line 317
    .local v9, "parenCount":I
    :goto_f
    add-int/lit8 v17, v9, 0x3

    move/from16 v0, v17

    new-array v3, v0, [Ljava/lang/Object;

    .line 318
    .local v3, "args":[Ljava/lang/Object;
    const/16 v17, 0x0

    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v3, v17

    .line 319
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_24
    if-ge v7, v9, :cond_3e

    .line 320
    aget-object v16, v10, v7

    .line 321
    .local v16, "sub":Lorg/mozilla/javascript/regexp/SubString;
    if-eqz v16, :cond_37

    .line 322
    add-int/lit8 v17, v7, 0x1

    invoke-virtual/range {v16 .. v16}, Lorg/mozilla/javascript/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v3, v17

    .line 319
    :goto_32
    add-int/lit8 v7, v7, 0x1

    goto :goto_24

    .line 316
    .end local v3    # "args":[Ljava/lang/Object;
    .end local v7    # "i":I
    .end local v9    # "parenCount":I
    .end local v16    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_35
    array-length v9, v10

    goto :goto_f

    .line 324
    .restart local v3    # "args":[Ljava/lang/Object;
    .restart local v7    # "i":I
    .restart local v9    # "parenCount":I
    .restart local v16    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_37
    add-int/lit8 v17, v7, 0x1

    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aput-object v18, v3, v17

    goto :goto_32

    .line 327
    .end local v16    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_3e
    add-int/lit8 v17, v9, 0x1

    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v3, v17

    .line 328
    add-int/lit8 v17, v9, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->str:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v3, v17

    .line 333
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptRuntime;->getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v17

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_69

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 334
    :cond_69
    new-instance v12, Lorg/mozilla/javascript/regexp/RegExpImpl;

    invoke-direct {v12}, Lorg/mozilla/javascript/regexp/RegExpImpl;-><init>()V

    .line 335
    .local v12, "re2":Lorg/mozilla/javascript/regexp/RegExpImpl;
    move-object/from16 v0, p3

    iget-boolean v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->multiline:Z

    move/from16 v17, v0

    move/from16 v0, v17

    iput-boolean v0, v12, Lorg/mozilla/javascript/regexp/RegExpImpl;->multiline:Z

    .line 336
    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->input:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iput-object v0, v12, Lorg/mozilla/javascript/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 337
    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lorg/mozilla/javascript/ScriptRuntime;->setRegExpProxy(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/RegExpProxy;)V

    .line 339
    :try_start_87
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v11

    .line 340
    .local v11, "parent":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->lambda:Lorg/mozilla/javascript/Function;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-interface {v0, v1, v11, v11, v3}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 341
    .local v14, "result":Ljava/lang/Object;
    invoke-static {v14}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_9c
    .catchall {:try_start_87 .. :try_end_9c} :catchall_ea

    move-result-object v8

    .line 343
    .local v8, "lambdaStr":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setRegExpProxy(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/RegExpProxy;)V

    .line 345
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v13

    .line 366
    .end local v3    # "args":[Ljava/lang/Object;
    .end local v7    # "i":I
    .end local v9    # "parenCount":I
    .end local v10    # "parens":[Lorg/mozilla/javascript/regexp/SubString;
    .end local v11    # "parent":Lorg/mozilla/javascript/Scriptable;
    .end local v12    # "re2":Lorg/mozilla/javascript/regexp/RegExpImpl;
    .end local v14    # "result":Ljava/lang/Object;
    .local v13, "replen":I
    :cond_a8
    :goto_a8
    add-int v17, p5, v13

    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    move/from16 v18, v0

    add-int v6, v17, v18

    .line 367
    .local v6, "growth":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 368
    .local v4, "charBuf":Ljava/lang/StringBuilder;
    if-nez v4, :cond_14d

    .line 369
    new-instance v4, Ljava/lang/StringBuilder;

    .end local v4    # "charBuf":Ljava/lang/StringBuilder;
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 370
    .restart local v4    # "charBuf":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 375
    :goto_c7
    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    move-object/from16 v17, v0

    add-int v18, p4, p5

    move-object/from16 v0, v17

    move/from16 v1, p4

    move/from16 v2, v18

    invoke-virtual {v4, v0, v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 376
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->lambda:Lorg/mozilla/javascript/Function;

    move-object/from16 v17, v0

    if-eqz v17, :cond_160

    .line 377
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    :goto_e9
    return-void

    .line 343
    .end local v4    # "charBuf":Ljava/lang/StringBuilder;
    .end local v6    # "growth":I
    .end local v8    # "lambdaStr":Ljava/lang/String;
    .end local v13    # "replen":I
    .restart local v3    # "args":[Ljava/lang/Object;
    .restart local v7    # "i":I
    .restart local v9    # "parenCount":I
    .restart local v10    # "parens":[Lorg/mozilla/javascript/regexp/SubString;
    .restart local v12    # "re2":Lorg/mozilla/javascript/regexp/RegExpImpl;
    :catchall_ea
    move-exception v17

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setRegExpProxy(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/RegExpProxy;)V

    throw v17

    .line 347
    .end local v3    # "args":[Ljava/lang/Object;
    .end local v7    # "i":I
    .end local v9    # "parenCount":I
    .end local v10    # "parens":[Lorg/mozilla/javascript/regexp/SubString;
    .end local v12    # "re2":Lorg/mozilla/javascript/regexp/RegExpImpl;
    :cond_f3
    const/4 v8, 0x0

    .line 348
    .restart local v8    # "lambdaStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->repstr:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v13

    .line 349
    .restart local v13    # "replen":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->dollar:I

    move/from16 v17, v0

    if-ltz v17, :cond_a8

    .line 350
    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v15, v0, [I

    .line 351
    .local v15, "skip":[I
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/regexp/GlobData;->dollar:I

    .line 353
    .local v5, "dp":I
    :cond_110
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->repstr:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2, v5, v15}, Lorg/mozilla/javascript/regexp/RegExpImpl;->interpretDollar(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;I[I)Lorg/mozilla/javascript/regexp/SubString;

    move-result-object v16

    .line 355
    .restart local v16    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    if-eqz v16, :cond_14a

    .line 356
    move-object/from16 v0, v16

    iget v0, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    move/from16 v17, v0

    const/16 v18, 0x0

    aget v18, v15, v18

    sub-int v17, v17, v18

    add-int v13, v13, v17

    .line 357
    const/16 v17, 0x0

    aget v17, v15, v17

    add-int v5, v5, v17

    .line 361
    :goto_136
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->repstr:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x24

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v1, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 362
    if-gez v5, :cond_110

    goto/16 :goto_a8

    .line 359
    :cond_14a
    add-int/lit8 v5, v5, 0x1

    goto :goto_136

    .line 372
    .end local v5    # "dp":I
    .end local v15    # "skip":[I
    .end local v16    # "sub":Lorg/mozilla/javascript/regexp/SubString;
    .restart local v4    # "charBuf":Ljava/lang/StringBuilder;
    .restart local v6    # "growth":I
    :cond_14d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->length()I

    move-result v17

    add-int v17, v17, v6

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    goto/16 :goto_c7

    .line 379
    :cond_160
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/regexp/RegExpImpl;->do_replace(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/regexp/RegExpImpl;)V

    goto :goto_e9
.end method


# virtual methods
.method public action(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 35
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;
    .param p5, "actionType"    # I

    .prologue
    .line 35
    new-instance v8, Lorg/mozilla/javascript/regexp/GlobData;

    invoke-direct {v8}, Lorg/mozilla/javascript/regexp/GlobData;-><init>()V

    .line 36
    .local v8, "data":Lorg/mozilla/javascript/regexp/GlobData;
    move/from16 v0, p5

    iput v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->mode:I

    .line 37
    invoke-static/range {p3 .. p3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->str:Ljava/lang/String;

    .line 39
    packed-switch p5, :pswitch_data_182

    .line 118
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 42
    :pswitch_17
    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/regexp/RegExpImpl;->createRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;IZ)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v9

    .local v9, "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p0

    .line 43
    invoke-static/range {v3 .. v9}, Lorg/mozilla/javascript/regexp/RegExpImpl;->matchOrReplace(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/regexp/RegExpImpl;Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v23

    .line 45
    .local v23, "rval":Ljava/lang/Object;
    iget-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    if-nez v3, :cond_36

    .line 114
    .end local v23    # "rval":Ljava/lang/Object;
    :goto_35
    return-object v23

    .line 45
    .restart local v23    # "rval":Ljava/lang/Object;
    :cond_36
    iget-object v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->arrayobj:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v23, v0

    goto :goto_35

    .line 50
    .end local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    .end local v23    # "rval":Ljava/lang/Object;
    :pswitch_3b
    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/regexp/RegExpImpl;->createRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;IZ)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v9

    .restart local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p0

    .line 51
    invoke-static/range {v3 .. v9}, Lorg/mozilla/javascript/regexp/RegExpImpl;->matchOrReplace(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/regexp/RegExpImpl;Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v23

    goto :goto_35

    .line 57
    .end local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :pswitch_56
    move-object/from16 v0, p4

    array-length v3, v0

    if-lez v3, :cond_62

    const/4 v3, 0x0

    aget-object v3, p4, v3

    instance-of v3, v3, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-nez v3, :cond_68

    :cond_62
    move-object/from16 v0, p4

    array-length v3, v0

    const/4 v4, 0x2

    if-le v3, v4, :cond_ce

    :cond_68
    const/16 v27, 0x1

    .line 59
    .local v27, "useRE":Z
    :goto_6a
    const/4 v9, 0x0

    .line 60
    .restart local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    const/16 v24, 0x0

    .line 61
    .local v24, "search":Ljava/lang/String;
    if-eqz v27, :cond_d1

    .line 62
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/regexp/RegExpImpl;->createRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;IZ)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v9

    .line 68
    :goto_7b
    move-object/from16 v0, p4

    array-length v3, v0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_e2

    sget-object v17, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 69
    .local v17, "arg1":Ljava/lang/Object;
    :goto_83
    const/16 v22, 0x0

    .line 70
    .local v22, "repstr":Ljava/lang/String;
    const/16 v19, 0x0

    .line 71
    .local v19, "lambda":Lorg/mozilla/javascript/Function;
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/mozilla/javascript/Function;

    if-eqz v3, :cond_e6

    move-object/from16 v19, v17

    .line 72
    check-cast v19, Lorg/mozilla/javascript/Function;

    .line 77
    :goto_91
    move-object/from16 v0, v19

    iput-object v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->lambda:Lorg/mozilla/javascript/Function;

    .line 78
    move-object/from16 v0, v22

    iput-object v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->repstr:Ljava/lang/String;

    .line 79
    if-nez v22, :cond_eb

    const/4 v3, -0x1

    :goto_9c
    iput v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->dollar:I

    .line 80
    const/4 v3, 0x0

    iput-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 81
    const/4 v3, 0x0

    iput v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->leftIndex:I

    .line 84
    if-eqz v27, :cond_f4

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p0

    .line 85
    invoke-static/range {v3 .. v9}, Lorg/mozilla/javascript/regexp/RegExpImpl;->matchOrReplace(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/regexp/RegExpImpl;Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v28

    .line 102
    :goto_b4
    iget-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    if-nez v3, :cond_15d

    .line 103
    iget-boolean v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->global:Z

    if-nez v3, :cond_c8

    if-eqz v28, :cond_c8

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_145

    .line 107
    :cond_c8
    iget-object v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->str:Ljava/lang/String;

    move-object/from16 v23, v0

    goto/16 :goto_35

    .line 57
    .end local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    .end local v17    # "arg1":Ljava/lang/Object;
    .end local v19    # "lambda":Lorg/mozilla/javascript/Function;
    .end local v22    # "repstr":Ljava/lang/String;
    .end local v24    # "search":Ljava/lang/String;
    .end local v27    # "useRE":Z
    :cond_ce
    const/16 v27, 0x0

    goto :goto_6a

    .line 64
    .restart local v9    # "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    .restart local v24    # "search":Ljava/lang/String;
    .restart local v27    # "useRE":Z
    :cond_d1
    move-object/from16 v0, p4

    array-length v3, v0

    const/4 v4, 0x1

    if-ge v3, v4, :cond_de

    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 65
    .local v16, "arg0":Ljava/lang/Object;
    :goto_d9
    invoke-static/range {v16 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    goto :goto_7b

    .line 64
    .end local v16    # "arg0":Ljava/lang/Object;
    :cond_de
    const/4 v3, 0x0

    aget-object v16, p4, v3

    goto :goto_d9

    .line 68
    :cond_e2
    const/4 v3, 0x1

    aget-object v17, p4, v3

    goto :goto_83

    .line 74
    .restart local v17    # "arg1":Ljava/lang/Object;
    .restart local v19    # "lambda":Lorg/mozilla/javascript/Function;
    .restart local v22    # "repstr":Ljava/lang/String;
    :cond_e6
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    goto :goto_91

    .line 79
    :cond_eb
    const/16 v3, 0x24

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    goto :goto_9c

    .line 88
    :cond_f4
    iget-object v0, v8, Lorg/mozilla/javascript/regexp/GlobData;->str:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 89
    .local v26, "str":Ljava/lang/String;
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v18

    .line 90
    .local v18, "index":I
    if-ltz v18, :cond_141

    .line 91
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v25

    .line 92
    .local v25, "slen":I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastParen:Lorg/mozilla/javascript/regexp/SubString;

    .line 93
    new-instance v3, Lorg/mozilla/javascript/regexp/SubString;

    const/4 v4, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v18

    invoke-direct {v3, v0, v4, v1}, Lorg/mozilla/javascript/regexp/SubString;-><init>(Ljava/lang/String;II)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 94
    new-instance v3, Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, v26

    move/from16 v1, v18

    move/from16 v2, v25

    invoke-direct {v3, v0, v1, v2}, Lorg/mozilla/javascript/regexp/SubString;-><init>(Ljava/lang/String;II)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    .line 95
    new-instance v3, Lorg/mozilla/javascript/regexp/SubString;

    add-int v4, v18, v25

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v5

    sub-int v5, v5, v18

    sub-int v5, v5, v25

    move-object/from16 v0, v26

    invoke-direct {v3, v0, v4, v5}, Lorg/mozilla/javascript/regexp/SubString;-><init>(Ljava/lang/String;II)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 96
    sget-object v28, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 97
    .local v28, "val":Ljava/lang/Boolean;
    goto/16 :goto_b4

    .line 98
    .end local v25    # "slen":I
    .end local v28    # "val":Ljava/lang/Boolean;
    :cond_141
    sget-object v28, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .restart local v28    # "val":Ljava/lang/Boolean;
    goto/16 :goto_b4

    .line 109
    .end local v18    # "index":I
    .end local v26    # "str":Ljava/lang/String;
    .end local v28    # "val":Ljava/lang/Boolean;
    :cond_145
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v20, v0

    .line 110
    .local v20, "lc":Lorg/mozilla/javascript/regexp/SubString;
    move-object/from16 v0, v20

    iget v14, v0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    move-object/from16 v0, v20

    iget v15, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    move-object v10, v8

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p0

    invoke-static/range {v10 .. v15}, Lorg/mozilla/javascript/regexp/RegExpImpl;->replace_glob(Lorg/mozilla/javascript/regexp/GlobData;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;II)V

    .line 112
    .end local v20    # "lc":Lorg/mozilla/javascript/regexp/SubString;
    :cond_15d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v21, v0

    .line 113
    .local v21, "rc":Lorg/mozilla/javascript/regexp/SubString;
    iget-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    move-object/from16 v0, v21

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    move-object/from16 v0, v21

    iget v5, v0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    move-object/from16 v0, v21

    iget v6, v0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    move-object/from16 v0, v21

    iget v7, v0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    add-int/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 114
    iget-object v3, v8, Lorg/mozilla/javascript/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    goto/16 :goto_35

    .line 39
    nop

    :pswitch_data_182
    .packed-switch 0x1
        :pswitch_17
        :pswitch_56
        :pswitch_3b
    .end packed-switch
.end method

.method public compileRegExp(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "flags"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;

    move-result-object v0

    return-object v0
.end method

.method public find_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;[I[I[Z[[Ljava/lang/String;)I
    .registers 28
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "separator"    # Ljava/lang/String;
    .param p5, "reObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p6, "ip"    # [I
    .param p7, "matchlen"    # [I
    .param p8, "matched"    # [Z
    .param p9, "parensp"    # [[Ljava/lang/String;

    .prologue
    .line 207
    const/4 v2, 0x0

    aget v8, p6, v2

    .line 208
    .local v8, "i":I
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v10

    .line 211
    .local v10, "length":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v17

    .local v17, "version":I
    move-object/from16 v1, p5

    .line 212
    check-cast v1, Lorg/mozilla/javascript/regexp/NativeRegExp;

    .line 216
    .local v1, "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :goto_f
    const/4 v2, 0x0

    aget v9, p6, v2

    .line 217
    .local v9, "ipsave":I
    const/4 v2, 0x0

    aput v8, p6, v2

    .line 218
    const/4 v7, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p0

    move-object/from16 v5, p3

    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v14

    .line 220
    .local v14, "ret":Ljava/lang/Object;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-eq v14, v2, :cond_34

    .line 222
    const/4 v2, 0x0

    aput v9, p6, v2

    .line 223
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput v3, p7, v2

    .line 224
    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-boolean v3, p8, v2

    .line 270
    .end local v10    # "length":I
    :goto_33
    return v10

    .line 227
    .restart local v10    # "length":I
    :cond_34
    const/4 v2, 0x0

    aget v8, p6, v2

    .line 228
    const/4 v2, 0x0

    aput v9, p6, v2

    .line 229
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput-boolean v3, p8, v2

    .line 231
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    .line 232
    .local v15, "sep":Lorg/mozilla/javascript/regexp/SubString;
    const/4 v2, 0x0

    iget v3, v15, Lorg/mozilla/javascript/regexp/SubString;->length:I

    aput v3, p7, v2

    .line 233
    const/4 v2, 0x0

    aget v2, p7, v2

    if-nez v2, :cond_89

    .line 240
    const/4 v2, 0x0

    aget v2, p6, v2

    if-ne v8, v2, :cond_89

    .line 247
    if-ne v8, v10, :cond_86

    .line 248
    const/16 v2, 0x78

    move/from16 v0, v17

    if-ne v0, v2, :cond_84

    .line 249
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput v3, p7, v2

    .line 250
    move v13, v8

    .line 264
    .local v13, "result":I
    :goto_5e
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    if-nez v2, :cond_8f

    const/16 v16, 0x0

    .line 265
    .local v16, "size":I
    :goto_66
    const/4 v2, 0x0

    move/from16 v0, v16

    new-array v3, v0, [Ljava/lang/String;

    aput-object v3, p9, v2

    .line 266
    const/4 v11, 0x0

    .local v11, "num":I
    :goto_6e
    move/from16 v0, v16

    if-ge v11, v0, :cond_97

    .line 267
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/mozilla/javascript/regexp/RegExpImpl;->getParenSubString(I)Lorg/mozilla/javascript/regexp/SubString;

    move-result-object v12

    .line 268
    .local v12, "parsub":Lorg/mozilla/javascript/regexp/SubString;
    const/4 v2, 0x0

    aget-object v2, p9, v2

    invoke-virtual {v12}, Lorg/mozilla/javascript/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v11

    .line 266
    add-int/lit8 v11, v11, 0x1

    goto :goto_6e

    .line 253
    .end local v11    # "num":I
    .end local v12    # "parsub":Lorg/mozilla/javascript/regexp/SubString;
    .end local v13    # "result":I
    .end local v16    # "size":I
    :cond_84
    const/4 v13, -0x1

    .line 254
    .restart local v13    # "result":I
    goto :goto_5e

    .line 256
    .end local v13    # "result":I
    :cond_86
    add-int/lit8 v8, v8, 0x1

    .line 257
    goto :goto_f

    .line 261
    :cond_89
    const/4 v2, 0x0

    aget v2, p7, v2

    sub-int v13, v8, v2

    .line 262
    .restart local v13    # "result":I
    goto :goto_5e

    .line 264
    :cond_8f
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    array-length v0, v2

    move/from16 v16, v0

    goto :goto_66

    .restart local v11    # "num":I
    .restart local v16    # "size":I
    :cond_97
    move v10, v13

    .line 270
    goto :goto_33
.end method

.method getParenSubString(I)Lorg/mozilla/javascript/regexp/SubString;
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 279
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    array-length v1, v1

    if-ge p1, v1, :cond_10

    .line 280
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    aget-object v0, v1, p1

    .line 281
    .local v0, "parsub":Lorg/mozilla/javascript/regexp/SubString;
    if-eqz v0, :cond_10

    .line 285
    .end local v0    # "parsub":Lorg/mozilla/javascript/regexp/SubString;
    :goto_f
    return-object v0

    :cond_10
    sget-object v0, Lorg/mozilla/javascript/regexp/SubString;->emptySubString:Lorg/mozilla/javascript/regexp/SubString;

    goto :goto_f
.end method

.method public isRegExp(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 3
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 17
    instance-of v0, p1, Lorg/mozilla/javascript/regexp/NativeRegExp;

    return v0
.end method

.method public js_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 29
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 519
    const/4 v3, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v3}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v20

    .line 522
    .local v20, "result":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p4

    array-length v3, v0

    const/4 v4, 0x1

    if-le v3, v4, :cond_4b

    const/4 v3, 0x1

    aget-object v3, p4, v3

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v3, v4, :cond_4b

    const/16 v17, 0x1

    .line 523
    .local v17, "limited":Z
    :goto_18
    const-wide/16 v15, 0x0

    .line 524
    .local v15, "limit":J
    if-eqz v17, :cond_33

    .line 526
    const/4 v3, 0x1

    aget-object v3, p4, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v15

    .line 527
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-long v3, v3

    cmp-long v3, v15, v3

    if-lez v3, :cond_33

    .line 528
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    int-to-long v15, v3

    .line 532
    :cond_33
    move-object/from16 v0, p4

    array-length v3, v0

    const/4 v4, 0x1

    if-lt v3, v4, :cond_40

    const/4 v3, 0x0

    aget-object v3, p4, v3

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v3, v4, :cond_4e

    .line 533
    :cond_40
    const/4 v3, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v20

    move-object/from16 v2, p3

    invoke-interface {v0, v3, v1, v2}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 605
    :cond_4a
    :goto_4a
    return-object v20

    .line 522
    .end local v15    # "limit":J
    .end local v17    # "limited":Z
    :cond_4b
    const/16 v17, 0x0

    goto :goto_18

    .line 537
    .restart local v15    # "limit":J
    .restart local v17    # "limited":Z
    :cond_4e
    const/4 v6, 0x0

    .line 538
    .local v6, "separator":Ljava/lang/String;
    const/4 v3, 0x1

    new-array v11, v3, [I

    .line 539
    .local v11, "matchlen":[I
    const/4 v9, 0x0

    .line 540
    .local v9, "re":Lorg/mozilla/javascript/Scriptable;
    const/4 v8, 0x0

    .line 541
    .local v8, "reProxy":Lorg/mozilla/javascript/RegExpProxy;
    const/4 v3, 0x0

    aget-object v3, p4, v3

    instance-of v3, v3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v3, :cond_70

    .line 542
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptRuntime;->getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v8

    .line 543
    if-eqz v8, :cond_70

    .line 544
    const/4 v3, 0x0

    aget-object v23, p4, v3

    check-cast v23, Lorg/mozilla/javascript/Scriptable;

    .line 545
    .local v23, "test":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, v23

    invoke-interface {v8, v0}, Lorg/mozilla/javascript/RegExpProxy;->isRegExp(Lorg/mozilla/javascript/Scriptable;)Z

    move-result v3

    if-eqz v3, :cond_70

    .line 546
    move-object/from16 v9, v23

    .line 550
    .end local v23    # "test":Lorg/mozilla/javascript/Scriptable;
    :cond_70
    if-nez v9, :cond_80

    .line 551
    const/4 v3, 0x0

    aget-object v3, p4, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 552
    const/4 v3, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    aput v4, v11, v3

    .line 556
    :cond_80
    const/4 v3, 0x1

    new-array v10, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v10, v3

    .line 558
    .local v10, "ip":[I
    const/4 v14, 0x0

    .line 559
    .local v14, "len":I
    const/4 v3, 0x1

    new-array v12, v3, [Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-boolean v4, v12, v3

    .line 560
    .local v12, "matched":[Z
    const/4 v3, 0x1

    new-array v13, v3, [[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v13, v3

    .line 561
    .local v13, "parens":[[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v7

    .local v7, "version":I
    :cond_9a
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    .line 564
    invoke-static/range {v3 .. v13}, Lorg/mozilla/javascript/regexp/RegExpImpl;->find_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;ILorg/mozilla/javascript/RegExpProxy;Lorg/mozilla/javascript/Scriptable;[I[I[Z[[Ljava/lang/String;)I

    move-result v18

    .local v18, "match":I
    if-ltz v18, :cond_4a

    .line 566
    if-eqz v17, :cond_ad

    int-to-long v3, v14

    cmp-long v3, v3, v15

    if-gez v3, :cond_4a

    :cond_ad
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    move/from16 v0, v18

    if-gt v0, v3, :cond_4a

    .line 570
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_104

    .line 571
    move-object/from16 v22, p3

    .line 575
    .local v22, "substr":Ljava/lang/String;
    :goto_bd
    move-object/from16 v0, v20

    move-object/from16 v1, v20

    move-object/from16 v2, v22

    invoke-interface {v0, v14, v1, v2}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 576
    add-int/lit8 v14, v14, 0x1

    .line 582
    if-eqz v9, :cond_e9

    const/4 v3, 0x0

    aget-boolean v3, v12, v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_e9

    .line 583
    const/4 v3, 0x0

    aget-object v3, v13, v3

    array-length v0, v3

    move/from16 v21, v0

    .line 584
    .local v21, "size":I
    const/16 v19, 0x0

    .local v19, "num":I
    :goto_d8
    move/from16 v0, v19

    move/from16 v1, v21

    if-ge v0, v1, :cond_e5

    .line 585
    if-eqz v17, :cond_110

    int-to-long v3, v14

    cmp-long v3, v3, v15

    if-ltz v3, :cond_110

    .line 590
    :cond_e5
    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-boolean v4, v12, v3

    .line 592
    .end local v19    # "num":I
    .end local v21    # "size":I
    :cond_e9
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget v4, v11, v4

    add-int v4, v4, v18

    aput v4, v10, v3

    .line 594
    const/16 v3, 0x82

    if-ge v7, v3, :cond_9a

    if-eqz v7, :cond_9a

    .line 601
    if-nez v17, :cond_9a

    const/4 v3, 0x0

    aget v3, v10, v3

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_9a

    goto/16 :goto_4a

    .line 573
    .end local v22    # "substr":Ljava/lang/String;
    :cond_104
    const/4 v3, 0x0

    aget v3, v10, v3

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v22

    .restart local v22    # "substr":Ljava/lang/String;
    goto :goto_bd

    .line 587
    .restart local v19    # "num":I
    .restart local v21    # "size":I
    :cond_110
    const/4 v3, 0x0

    aget-object v3, v13, v3

    aget-object v3, v3, v19

    move-object/from16 v0, v20

    move-object/from16 v1, v20

    invoke-interface {v0, v14, v1, v3}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 588
    add-int/lit8 v14, v14, 0x1

    .line 584
    add-int/lit8 v19, v19, 0x1

    goto :goto_d8
.end method

.method public wrapRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "compiled"    # Ljava/lang/Object;

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    check-cast p3, Lorg/mozilla/javascript/regexp/RECompiled;

    .end local p3    # "compiled":Ljava/lang/Object;
    invoke-direct {v0, p2, p3}, Lorg/mozilla/javascript/regexp/NativeRegExp;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RECompiled;)V

    return-object v0
.end method
