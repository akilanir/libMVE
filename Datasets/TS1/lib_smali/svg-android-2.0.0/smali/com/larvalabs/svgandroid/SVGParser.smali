.class public Lcom/larvalabs/svgandroid/SVGParser;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/larvalabs/svgandroid/SVGParser$1;,
        Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;,
        Lcom/larvalabs/svgandroid/SVGParser$Properties;,
        Lcom/larvalabs/svgandroid/SVGParser$StyleSet;,
        Lcom/larvalabs/svgandroid/SVGParser$Gradient;,
        Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    }
.end annotation


# static fields
.field private static DISALLOW_DOCTYPE_DECL:Z = false

.field static final TAG:Ljava/lang/String; = "SVGAndroid"

.field private static final TRANSFORM_SEP:Ljava/util/regex/Pattern;

.field private static final arcMatrix:Landroid/graphics/Matrix;

.field private static final arcMatrix2:Landroid/graphics/Matrix;

.field private static final arcRectf:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const/4 v0, 0x1

    sput-boolean v0, Lcom/larvalabs/svgandroid/SVGParser;->DISALLOW_DOCTYPE_DECL:Z

    .line 189
    const-string v0, "[\\s,]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/larvalabs/svgandroid/SVGParser;->TRANSFORM_SEP:Ljava/util/regex/Pattern;

    .line 497
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lcom/larvalabs/svgandroid/SVGParser;->arcRectf:Landroid/graphics/RectF;

    .line 498
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    sput-object v0, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    .line 499
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    sput-object v0, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix2:Landroid/graphics/Matrix;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 797
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/lang/String;)Landroid/graphics/Path;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/larvalabs/svgandroid/SVGParser;->doPath(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Lorg/xml/sax/Attributes;
    .param p2, "x2"    # Ljava/lang/Float;

    .prologue
    .line 47
    invoke-static {p0, p1, p2}, Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/larvalabs/svgandroid/SVGParser;->parseTransform(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/Float;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->getNumberParseAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v0

    return-object v0
.end method

.method private static angle(FFFF)F
    .registers 10
    .param p0, "x1"    # F
    .param p1, "y1"    # F
    .param p2, "x2"    # F
    .param p3, "y2"    # F

    .prologue
    .line 494
    float-to-double v0, p0

    float-to-double v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    float-to-double v2, p2

    float-to-double v4, p3

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    sub-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float/2addr v0, v1

    return v0
.end method

.method private static doPath(Ljava/lang/String;)Landroid/graphics/Path;
    .registers 29
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 299
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v22

    .line 300
    .local v22, "n":I
    new-instance v23, Lcom/larvalabs/svgandroid/ParserHelper;

    const/4 v9, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9}, Lcom/larvalabs/svgandroid/ParserHelper;-><init>(Ljava/lang/String;I)V

    .line 301
    .local v23, "ph":Lcom/larvalabs/svgandroid/ParserHelper;
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->skipWhitespace()V

    .line 302
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 303
    .local v2, "p":Landroid/graphics/Path;
    const/4 v10, 0x0

    .line 304
    .local v10, "lastX":F
    const/4 v11, 0x0

    .line 305
    .local v11, "lastY":F
    const/16 v20, 0x0

    .line 306
    .local v20, "lastX1":F
    const/16 v21, 0x0

    .line 307
    .local v21, "lastY1":F
    const/16 v25, 0x0

    .line 308
    .local v25, "subPathStartX":F
    const/16 v26, 0x0

    .line 309
    .local v26, "subPathStartY":F
    const/16 v24, 0x0

    .line 310
    .local v24, "prevCmd":C
    :goto_22
    move-object/from16 v0, v23

    iget v9, v0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    move/from16 v0, v22

    if-ge v9, v0, :cond_198

    .line 311
    move-object/from16 v0, v23

    iget v9, v0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v19

    .line 312
    .local v19, "cmd":C
    packed-switch v19, :pswitch_data_19a

    .line 333
    :cond_37
    :pswitch_37
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->advance()V

    .line 334
    move/from16 v24, v19

    .line 338
    :goto_3c
    const/16 v27, 0x0

    .line 339
    .local v27, "wasCurve":Z
    sparse-switch v19, :sswitch_data_1bc

    .line 480
    const-string v9, "SVGAndroid"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Invalid path command: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->advance()V

    .line 483
    :goto_5e
    if-nez v27, :cond_64

    .line 484
    move/from16 v20, v10

    .line 485
    move/from16 v21, v11

    .line 487
    :cond_64
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->skipWhitespace()V

    goto :goto_22

    .line 325
    .end local v27    # "wasCurve":Z
    :pswitch_68
    const/16 v9, 0x6d

    move/from16 v0, v24

    if-eq v0, v9, :cond_74

    const/16 v9, 0x4d

    move/from16 v0, v24

    if-ne v0, v9, :cond_7a

    .line 326
    :cond_74
    add-int/lit8 v9, v24, -0x1

    int-to-char v0, v9

    move/from16 v19, v0

    .line 327
    goto :goto_3c

    .line 328
    :cond_7a
    const-string v9, "lhvcsqta"

    invoke-static/range {v24 .. v24}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v12

    invoke-virtual {v9, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :cond_37

    .line 329
    move/from16 v19, v24

    .line 330
    goto :goto_3c

    .line 342
    .restart local v27    # "wasCurve":Z
    :sswitch_89
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 343
    .local v7, "x":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 344
    .local v8, "y":F
    const/16 v9, 0x6d

    move/from16 v0, v19

    if-ne v0, v9, :cond_a1

    .line 345
    add-float v25, v25, v7

    .line 346
    add-float v26, v26, v8

    .line 347
    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->rMoveTo(FF)V

    .line 348
    add-float/2addr v10, v7

    .line 349
    add-float/2addr v11, v8

    goto :goto_5e

    .line 351
    :cond_a1
    move/from16 v25, v7

    .line 352
    move/from16 v26, v8

    .line 353
    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 354
    move v10, v7

    .line 355
    move v11, v8

    .line 357
    goto :goto_5e

    .line 361
    .end local v7    # "x":F
    .end local v8    # "y":F
    :sswitch_ab
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 362
    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 363
    move/from16 v10, v25

    .line 364
    move/from16 v11, v26

    .line 365
    move/from16 v20, v25

    .line 366
    move/from16 v21, v26

    .line 367
    const/16 v27, 0x1

    .line 368
    goto :goto_5e

    .line 375
    :sswitch_c0
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 376
    .restart local v7    # "x":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 377
    .restart local v8    # "y":F
    const/16 v9, 0x6c

    move/from16 v0, v19

    if-ne v0, v9, :cond_d4

    .line 378
    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 379
    add-float/2addr v10, v7

    .line 380
    add-float/2addr v11, v8

    goto :goto_5e

    .line 382
    :cond_d4
    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 383
    move v10, v7

    .line 384
    move v11, v8

    .line 386
    goto :goto_5e

    .line 390
    .end local v7    # "x":F
    .end local v8    # "y":F
    :sswitch_da
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 391
    .restart local v7    # "x":F
    const/16 v9, 0x68

    move/from16 v0, v19

    if-ne v0, v9, :cond_eb

    .line 392
    const/4 v9, 0x0

    invoke-virtual {v2, v7, v9}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 393
    add-float/2addr v10, v7

    goto/16 :goto_5e

    .line 395
    :cond_eb
    invoke-virtual {v2, v7, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 396
    move v10, v7

    .line 398
    goto/16 :goto_5e

    .line 402
    .end local v7    # "x":F
    :sswitch_f1
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 403
    .restart local v8    # "y":F
    const/16 v9, 0x76

    move/from16 v0, v19

    if-ne v0, v9, :cond_102

    .line 404
    const/4 v9, 0x0

    invoke-virtual {v2, v9, v8}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 405
    add-float/2addr v11, v8

    goto/16 :goto_5e

    .line 407
    :cond_102
    invoke-virtual {v2, v10, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 408
    move v11, v8

    .line 410
    goto/16 :goto_5e

    .line 414
    .end local v8    # "y":F
    :sswitch_108
    const/16 v27, 0x1

    .line 415
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v3

    .line 416
    .local v3, "x1":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v4

    .line 417
    .local v4, "y1":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v5

    .line 418
    .local v5, "x2":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v6

    .line 419
    .local v6, "y2":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 420
    .restart local v7    # "x":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 421
    .restart local v8    # "y":F
    const/16 v9, 0x63

    move/from16 v0, v19

    if-ne v0, v9, :cond_12e

    .line 422
    add-float/2addr v3, v10

    .line 423
    add-float/2addr v5, v10

    .line 424
    add-float/2addr v7, v10

    .line 425
    add-float/2addr v4, v11

    .line 426
    add-float/2addr v6, v11

    .line 427
    add-float/2addr v8, v11

    .line 429
    :cond_12e
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 430
    move/from16 v20, v5

    .line 431
    move/from16 v21, v6

    .line 432
    move v10, v7

    .line 433
    move v11, v8

    .line 434
    goto/16 :goto_5e

    .line 441
    .end local v3    # "x1":F
    .end local v4    # "y1":F
    .end local v5    # "x2":F
    .end local v6    # "y2":F
    .end local v7    # "x":F
    .end local v8    # "y":F
    :sswitch_139
    const/16 v27, 0x1

    .line 442
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v5

    .line 443
    .restart local v5    # "x2":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v6

    .line 444
    .restart local v6    # "y2":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 445
    .restart local v7    # "x":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 446
    .restart local v8    # "y":F
    invoke-static/range {v19 .. v19}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v9

    if-eqz v9, :cond_155

    .line 447
    add-float/2addr v5, v10

    .line 448
    add-float/2addr v7, v10

    .line 449
    add-float/2addr v6, v11

    .line 450
    add-float/2addr v8, v11

    .line 452
    :cond_155
    const/high16 v9, 0x40000000    # 2.0f

    mul-float/2addr v9, v10

    sub-float v3, v9, v20

    .line 453
    .restart local v3    # "x1":F
    const/high16 v9, 0x40000000    # 2.0f

    mul-float/2addr v9, v11

    sub-float v4, v9, v21

    .line 454
    .restart local v4    # "y1":F
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 455
    move/from16 v20, v5

    .line 456
    move/from16 v21, v6

    .line 457
    move v10, v7

    .line 458
    move v11, v8

    .line 459
    goto/16 :goto_5e

    .line 463
    .end local v3    # "x1":F
    .end local v4    # "y1":F
    .end local v5    # "x2":F
    .end local v6    # "y2":F
    .end local v7    # "x":F
    .end local v8    # "y":F
    :sswitch_16a
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v14

    .line 464
    .local v14, "rx":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v15

    .line 465
    .local v15, "ry":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v16

    .line 466
    .local v16, "theta":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFlag()I

    move-result v17

    .line 467
    .local v17, "largeArc":I
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFlag()I

    move-result v18

    .line 468
    .local v18, "sweepArc":I
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v7

    .line 469
    .restart local v7    # "x":F
    invoke-virtual/range {v23 .. v23}, Lcom/larvalabs/svgandroid/ParserHelper;->nextFloat()F

    move-result v8

    .line 470
    .restart local v8    # "y":F
    const/16 v9, 0x61

    move/from16 v0, v19

    if-ne v0, v9, :cond_18e

    .line 471
    add-float/2addr v7, v10

    .line 472
    add-float/2addr v8, v11

    :cond_18e
    move-object v9, v2

    move v12, v7

    move v13, v8

    .line 474
    invoke-static/range {v9 .. v18}, Lcom/larvalabs/svgandroid/SVGParser;->drawArc(Landroid/graphics/Path;FFFFFFFII)V

    .line 475
    move v10, v7

    .line 476
    move v11, v8

    .line 477
    goto/16 :goto_5e

    .line 489
    .end local v7    # "x":F
    .end local v8    # "y":F
    .end local v14    # "rx":F
    .end local v15    # "ry":F
    .end local v16    # "theta":F
    .end local v17    # "largeArc":I
    .end local v18    # "sweepArc":I
    .end local v19    # "cmd":C
    .end local v27    # "wasCurve":Z
    :cond_198
    return-object v2

    .line 312
    nop

    :pswitch_data_19a
    .packed-switch 0x2b
        :pswitch_68
        :pswitch_37
        :pswitch_68
        :pswitch_37
        :pswitch_37
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_68
    .end packed-switch

    .line 339
    :sswitch_data_1bc
    .sparse-switch
        0x41 -> :sswitch_16a
        0x43 -> :sswitch_108
        0x48 -> :sswitch_da
        0x4c -> :sswitch_c0
        0x4d -> :sswitch_89
        0x51 -> :sswitch_139
        0x53 -> :sswitch_139
        0x54 -> :sswitch_c0
        0x56 -> :sswitch_f1
        0x5a -> :sswitch_ab
        0x61 -> :sswitch_16a
        0x63 -> :sswitch_108
        0x68 -> :sswitch_da
        0x6c -> :sswitch_c0
        0x6d -> :sswitch_89
        0x71 -> :sswitch_139
        0x73 -> :sswitch_139
        0x74 -> :sswitch_c0
        0x76 -> :sswitch_f1
        0x7a -> :sswitch_ab
    .end sparse-switch
.end method

.method private static drawArc(Landroid/graphics/Path;FFFFFFFII)V
    .registers 40
    .param p0, "p"    # Landroid/graphics/Path;
    .param p1, "lastX"    # F
    .param p2, "lastY"    # F
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "rx"    # F
    .param p6, "ry"    # F
    .param p7, "theta"    # F
    .param p8, "largeArc"    # I
    .param p9, "sweepArc"    # I

    .prologue
    .line 508
    const/16 v25, 0x0

    cmpl-float v25, p5, v25

    if-eqz v25, :cond_c

    const/16 v25, 0x0

    cmpl-float v25, p6, v25

    if-nez v25, :cond_16

    .line 509
    :cond_c
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 579
    :cond_15
    :goto_15
    return-void

    .line 513
    :cond_16
    cmpl-float v25, p3, p1

    if-nez v25, :cond_1e

    cmpl-float v25, p4, p2

    if-eqz v25, :cond_15

    .line 517
    :cond_1e
    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->abs(F)F

    move-result p5

    .line 518
    invoke-static/range {p6 .. p6}, Ljava/lang/Math;->abs(F)F

    move-result p6

    .line 520
    const v25, 0x40490fdb    # (float)Math.PI

    mul-float v25, v25, p7

    const/high16 v26, 0x43340000    # 180.0f

    div-float v18, v25, v26

    .line 521
    .local v18, "thrad":F
    invoke-static/range {v18 .. v18}, Landroid/util/FloatMath;->sin(F)F

    move-result v16

    .line 522
    .local v16, "st":F
    invoke-static/range {v18 .. v18}, Landroid/util/FloatMath;->cos(F)F

    move-result v6

    .line 524
    .local v6, "ct":F
    sub-float v25, p1, p3

    const/high16 v26, 0x40000000    # 2.0f

    div-float v21, v25, v26

    .line 525
    .local v21, "xc":F
    sub-float v25, p2, p4

    const/high16 v26, 0x40000000    # 2.0f

    div-float v24, v25, v26

    .line 526
    .local v24, "yc":F
    mul-float v25, v6, v21

    mul-float v26, v16, v24

    add-float v19, v25, v26

    .line 527
    .local v19, "x1t":F
    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v25, v0

    mul-float v25, v25, v21

    mul-float v26, v6, v24

    add-float v22, v25, v26

    .line 529
    .local v22, "y1t":F
    mul-float v20, v19, v19

    .line 530
    .local v20, "x1ts":F
    mul-float v23, v22, v22

    .line 531
    .local v23, "y1ts":F
    mul-float v14, p5, p5

    .line 532
    .local v14, "rxs":F
    mul-float v15, p6, p6

    .line 534
    .local v15, "rys":F
    div-float v25, v20, v14

    div-float v26, v23, v15

    add-float v25, v25, v26

    const v26, 0x3f8020c5    # 1.001f

    mul-float v12, v25, v26

    .line 536
    .local v12, "lambda":F
    const/high16 v25, 0x3f800000    # 1.0f

    cmpl-float v25, v12, v25

    if-lez v25, :cond_79

    .line 537
    invoke-static {v12}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v13

    .line 538
    .local v13, "lambdasr":F
    mul-float p5, p5, v13

    .line 539
    mul-float p6, p6, v13

    .line 540
    mul-float v14, p5, p5

    .line 541
    mul-float v15, p6, p6

    .line 544
    .end local v13    # "lambdasr":F
    :cond_79
    mul-float v25, v14, v15

    mul-float v26, v14, v23

    sub-float v25, v25, v26

    mul-float v26, v15, v20

    sub-float v25, v25, v26

    mul-float v26, v14, v23

    mul-float v27, v15, v20

    add-float v26, v26, v27

    div-float v25, v25, v26

    invoke-static/range {v25 .. v25}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v26

    move/from16 v0, p8

    move/from16 v1, p9

    if-ne v0, v1, :cond_127

    const/16 v25, -0x1

    :goto_97
    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    mul-float v5, v26, v25

    .line 547
    .local v5, "R":F
    mul-float v25, v5, p5

    mul-float v25, v25, v22

    div-float v8, v25, p6

    .line 548
    .local v8, "cxt":F
    neg-float v0, v5

    move/from16 v25, v0

    mul-float v25, v25, p6

    mul-float v25, v25, v19

    div-float v10, v25, p5

    .line 549
    .local v10, "cyt":F
    mul-float v25, v6, v8

    mul-float v26, v16, v10

    sub-float v25, v25, v26

    add-float v26, p1, p3

    const/high16 v27, 0x40000000    # 2.0f

    div-float v26, v26, v27

    add-float v7, v25, v26

    .line 550
    .local v7, "cx":F
    mul-float v25, v16, v8

    mul-float v26, v6, v10

    add-float v25, v25, v26

    add-float v26, p2, p4

    const/high16 v27, 0x40000000    # 2.0f

    div-float v26, v26, v27

    add-float v9, v25, v26

    .line 552
    .local v9, "cy":F
    const/high16 v25, 0x3f800000    # 1.0f

    const/16 v26, 0x0

    sub-float v27, v19, v8

    div-float v27, v27, p5

    sub-float v28, v22, v10

    div-float v28, v28, p6

    invoke-static/range {v25 .. v28}, Lcom/larvalabs/svgandroid/SVGParser;->angle(FFFF)F

    move-result v17

    .line 553
    .local v17, "th1":F
    sub-float v25, v19, v8

    div-float v25, v25, p5

    sub-float v26, v22, v10

    div-float v26, v26, p6

    move/from16 v0, v19

    neg-float v0, v0

    move/from16 v27, v0

    sub-float v27, v27, v8

    div-float v27, v27, p5

    move/from16 v0, v22

    neg-float v0, v0

    move/from16 v28, v0

    sub-float v28, v28, v10

    div-float v28, v28, p6

    invoke-static/range {v25 .. v28}, Lcom/larvalabs/svgandroid/SVGParser;->angle(FFFF)F

    move-result v11

    .line 555
    .local v11, "dth":F
    if-nez p9, :cond_12b

    const/16 v25, 0x0

    cmpl-float v25, v11, v25

    if-lez v25, :cond_12b

    .line 556
    const/high16 v25, 0x43b40000    # 360.0f

    sub-float v11, v11, v25

    .line 562
    :cond_103
    :goto_103
    const/high16 v25, 0x43b40000    # 360.0f

    rem-float v25, p7, v25

    const/16 v26, 0x0

    cmpl-float v25, v25, v26

    if-nez v25, :cond_138

    .line 564
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcRectf:Landroid/graphics/RectF;

    sub-float v26, v7, p5

    sub-float v27, v9, p6

    add-float v28, v7, p5

    add-float v29, v9, p6

    invoke-virtual/range {v25 .. v29}, Landroid/graphics/RectF;->set(FFFF)V

    .line 565
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcRectf:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2, v11}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_15

    .line 544
    .end local v5    # "R":F
    .end local v7    # "cx":F
    .end local v8    # "cxt":F
    .end local v9    # "cy":F
    .end local v10    # "cyt":F
    .end local v11    # "dth":F
    .end local v17    # "th1":F
    :cond_127
    const/16 v25, 0x1

    goto/16 :goto_97

    .line 557
    .restart local v5    # "R":F
    .restart local v7    # "cx":F
    .restart local v8    # "cxt":F
    .restart local v9    # "cy":F
    .restart local v10    # "cyt":F
    .restart local v11    # "dth":F
    .restart local v17    # "th1":F
    :cond_12b
    if-eqz p9, :cond_103

    const/16 v25, 0x0

    cmpg-float v25, v11, v25

    if-gez v25, :cond_103

    .line 558
    const/high16 v25, 0x43b40000    # 360.0f

    add-float v11, v11, v25

    goto :goto_103

    .line 568
    :cond_138
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcRectf:Landroid/graphics/RectF;

    move/from16 v0, p5

    neg-float v0, v0

    move/from16 v26, v0

    move/from16 v0, p6

    neg-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, p5

    move/from16 v4, p6

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 570
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    invoke-virtual/range {v25 .. v25}, Landroid/graphics/Matrix;->reset()V

    .line 571
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, v25

    move/from16 v1, p7

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 572
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, v25

    invoke-virtual {v0, v7, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 573
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    sget-object v26, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix2:Landroid/graphics/Matrix;

    invoke-virtual/range {v25 .. v26}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 575
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix2:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 576
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcRectf:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2, v11}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 577
    sget-object v25, Lcom/larvalabs/svgandroid/SVGParser;->arcMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    goto/16 :goto_15
.end method

.method private static getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 602
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method private static getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .param p2, "defaultValue"    # Ljava/lang/Float;

    .prologue
    .line 606
    invoke-static {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v0

    .line 607
    .local v0, "v":Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v1

    return-object v1
.end method

.method private static getNumberParseAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 582
    invoke-interface {p1}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    .line 583
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_1d

    .line 584
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 585
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v2

    .line 588
    :goto_19
    return-object v2

    .line 583
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 588
    :cond_1d
    const/4 v2, 0x0

    goto :goto_19
.end method

.method private static getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 592
    invoke-interface {p1}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    .line 593
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_19

    .line 594
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 595
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    .line 598
    :goto_15
    return-object v2

    .line 593
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 598
    :cond_19
    const/4 v2, 0x0

    goto :goto_15
.end method

.method static parse(Lorg/xml/sax/InputSource;Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;)Lcom/larvalabs/svgandroid/SVG;
    .registers 10
    .param p0, "data"    # Lorg/xml/sax/InputSource;
    .param p1, "handler"    # Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/larvalabs/svgandroid/SVGParseException;
        }
    .end annotation

    .prologue
    .line 65
    :try_start_0
    new-instance v1, Landroid/graphics/Picture;

    invoke-direct {v1}, Landroid/graphics/Picture;-><init>()V

    .line 66
    .local v1, "picture":Landroid/graphics/Picture;
    invoke-virtual {p1, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->setPicture(Landroid/graphics/Picture;)V

    .line 68
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v4

    .line 69
    .local v4, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    .line 70
    .local v3, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v5

    .line 71
    .local v5, "xr":Lorg/xml/sax/XMLReader;
    invoke-interface {v5, p1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 72
    const-string v6, "http://xml.org/sax/features/validation"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 73
    sget-boolean v6, Lcom/larvalabs/svgandroid/SVGParser;->DISALLOW_DOCTYPE_DECL:Z
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1f} :catch_46

    if-eqz v6, :cond_27

    .line 75
    :try_start_21
    const-string v6, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v7, 0x1

    invoke-interface {v5, v6, v7}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V
    :try_end_27
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_21 .. :try_end_27} :catch_41
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_27} :catch_46

    .line 80
    :cond_27
    :goto_27
    :try_start_27
    invoke-interface {v5, p0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 82
    new-instance v2, Lcom/larvalabs/svgandroid/SVG;

    iget-object v6, p1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->bounds:Landroid/graphics/RectF;

    invoke-direct {v2, v1, v6}, Lcom/larvalabs/svgandroid/SVG;-><init>(Landroid/graphics/Picture;Landroid/graphics/RectF;)V

    .line 84
    .local v2, "result":Lcom/larvalabs/svgandroid/SVG;
    iget-object v6, p1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    invoke-static {v6}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v6

    if-nez v6, :cond_40

    .line 85
    iget-object v6, p1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    invoke-virtual {v2, v6}, Lcom/larvalabs/svgandroid/SVG;->setLimits(Landroid/graphics/RectF;)V

    .line 87
    :cond_40
    return-object v2

    .line 76
    .end local v2    # "result":Lcom/larvalabs/svgandroid/SVG;
    :catch_41
    move-exception v0

    .line 77
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    const/4 v6, 0x0

    sput-boolean v6, Lcom/larvalabs/svgandroid/SVGParser;->DISALLOW_DOCTYPE_DECL:Z
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_45} :catch_46

    goto :goto_27

    .line 88
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    .end local v1    # "picture":Landroid/graphics/Picture;
    .end local v3    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v4    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v5    # "xr":Lorg/xml/sax/XMLReader;
    :catch_46
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "SVGAndroid"

    const-string v7, "Failed to parse SVG."

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    new-instance v6, Lcom/larvalabs/svgandroid/SVGParseException;

    invoke-direct {v6, v0}, Lcom/larvalabs/svgandroid/SVGParseException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method private static parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/Float;

    .prologue
    const/4 v1, 0x0

    .line 611
    if-nez p0, :cond_4

    .line 620
    .end local p1    # "defaultValue":Ljava/lang/Float;
    :goto_3
    return-object p1

    .line 613
    .restart local p1    # "defaultValue":Ljava/lang/Float;
    :cond_4
    const-string v0, "px"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 614
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 620
    :cond_16
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    goto :goto_3

    .line 615
    :cond_1f
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 616
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 617
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    goto :goto_3
.end method

.method private static parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .registers 12
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 97
    .local v4, "n":I
    const/4 v6, 0x0

    .line 98
    .local v6, "p":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .local v5, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Float;>;"
    const/4 v8, 0x0

    .line 100
    .local v8, "skipChar":Z
    const/4 v7, 0x0

    .line 101
    .local v7, "prevWasE":Z
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_d
    if-ge v2, v4, :cond_6b

    .line 102
    if-eqz v8, :cond_15

    .line 103
    const/4 v8, 0x0

    .line 101
    :goto_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 106
    :cond_15
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 107
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_8c

    .line 172
    const/4 v7, 0x0

    goto :goto_12

    .line 130
    :sswitch_1e
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 131
    .local v9, "str":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_37

    .line 133
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 134
    .local v1, "f":Ljava/lang/Float;
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    .end local v1    # "f":Ljava/lang/Float;
    :cond_37
    move v6, v2

    .line 137
    new-instance v10, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    invoke-direct {v10, v5, v6}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;-><init>(Ljava/util/ArrayList;I)V

    .line 186
    .end local v0    # "c":C
    .end local v9    # "str":Ljava/lang/String;
    :goto_3d
    return-object v10

    .line 141
    .restart local v0    # "c":C
    :sswitch_3e
    if-eqz v7, :cond_42

    .line 142
    const/4 v7, 0x0

    .line 143
    goto :goto_12

    .line 150
    :cond_42
    :sswitch_42
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 152
    .restart local v9    # "str":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_66

    .line 154
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 155
    .restart local v1    # "f":Ljava/lang/Float;
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    const/16 v10, 0x2d

    if-ne v0, v10, :cond_62

    .line 157
    move v6, v2

    .line 165
    .end local v1    # "f":Ljava/lang/Float;
    :goto_60
    const/4 v7, 0x0

    .line 166
    goto :goto_12

    .line 159
    .restart local v1    # "f":Ljava/lang/Float;
    :cond_62
    add-int/lit8 v6, v2, 0x1

    .line 160
    const/4 v8, 0x1

    goto :goto_60

    .line 163
    .end local v1    # "f":Ljava/lang/Float;
    :cond_66
    add-int/lit8 v6, v6, 0x1

    goto :goto_60

    .line 169
    .end local v9    # "str":Ljava/lang/String;
    :sswitch_69
    const/4 v7, 0x1

    .line 170
    goto :goto_12

    .line 176
    .end local v0    # "c":C
    :cond_6b
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 177
    .local v3, "last":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_84

    .line 180
    :try_start_75
    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_80
    .catch Ljava/lang/NumberFormatException; {:try_start_75 .. :try_end_80} :catch_8a

    .line 184
    :goto_80
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 186
    :cond_84
    new-instance v10, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    invoke-direct {v10, v5, v6}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;-><init>(Ljava/util/ArrayList;I)V

    goto :goto_3d

    .line 181
    :catch_8a
    move-exception v10

    goto :goto_80

    .line 107
    :sswitch_data_8c
    .sparse-switch
        0x9 -> :sswitch_42
        0xa -> :sswitch_42
        0x20 -> :sswitch_42
        0x29 -> :sswitch_1e
        0x2c -> :sswitch_42
        0x2d -> :sswitch_3e
        0x41 -> :sswitch_1e
        0x43 -> :sswitch_1e
        0x48 -> :sswitch_1e
        0x4c -> :sswitch_1e
        0x4d -> :sswitch_1e
        0x51 -> :sswitch_1e
        0x53 -> :sswitch_1e
        0x54 -> :sswitch_1e
        0x56 -> :sswitch_1e
        0x5a -> :sswitch_1e
        0x61 -> :sswitch_1e
        0x63 -> :sswitch_1e
        0x65 -> :sswitch_69
        0x68 -> :sswitch_1e
        0x6c -> :sswitch_1e
        0x6d -> :sswitch_1e
        0x71 -> :sswitch_1e
        0x73 -> :sswitch_1e
        0x74 -> :sswitch_1e
        0x76 -> :sswitch_1e
        0x7a -> :sswitch_1e
    .end sparse-switch
.end method

.method public static parsePath(Ljava/lang/String;)Landroid/graphics/Path;
    .registers 2
    .param p0, "pathString"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-static {p0}, Lcom/larvalabs/svgandroid/SVGParser;->doPath(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v0

    return-object v0
.end method

.method private static parseTransform(Ljava/lang/String;)Landroid/graphics/Matrix;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 195
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 197
    .local v0, "matrix":Landroid/graphics/Matrix;
    :goto_5
    invoke-static {p0, v0}, Lcom/larvalabs/svgandroid/SVGParser;->parseTransformItem(Ljava/lang/String;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 199
    const-string v2, ")"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 200
    .local v1, "rparen":I
    if-lez v1, :cond_2b

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v3, v1, 0x1

    if-le v2, v3, :cond_2b

    .line 201
    sget-object v2, Lcom/larvalabs/svgandroid/SVGParser;->TRANSFORM_SEP:Ljava/util/regex/Pattern;

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 205
    goto :goto_5

    .line 206
    :cond_2b
    return-object v0
.end method

.method private static parseTransformItem(Ljava/lang/String;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 15
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 210
    const-string v9, "matrix("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_ab

    .line 211
    const-string v9, "matrix("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 212
    .local v4, "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x6

    if-ne v9, v10, :cond_aa

    .line 213
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 214
    .local v3, "mat":Landroid/graphics/Matrix;
    const/16 v9, 0x9

    new-array v10, v9, [F

    const/4 v11, 0x0

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v11, 0x1

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x2

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v11, 0x2

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x4

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v11, 0x3

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v11, 0x4

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x3

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v11, 0x5

    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v12, 0x5

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    aput v9, v10, v11

    const/4 v9, 0x6

    const/4 v11, 0x0

    aput v11, v10, v9

    const/4 v9, 0x7

    const/4 v11, 0x0

    aput v11, v10, v9

    const/16 v9, 0x8

    const/high16 v11, 0x3f800000    # 1.0f

    aput v11, v10, v9

    invoke-virtual {v3, v10}, Landroid/graphics/Matrix;->setValues([F)V

    .line 221
    invoke-virtual {p1, v3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 272
    .end local v3    # "mat":Landroid/graphics/Matrix;
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    :cond_aa
    :goto_aa
    return-object p1

    .line 223
    :cond_ab
    const-string v9, "translate("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_f9

    .line 224
    const-string v9, "translate("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 225
    .restart local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_aa

    .line 226
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v7

    .line 227
    .local v7, "tx":F
    const/4 v8, 0x0

    .line 228
    .local v8, "ty":F
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_f5

    .line 229
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v8

    .line 231
    :cond_f5
    invoke-virtual {p1, v7, v8}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    goto :goto_aa

    .line 233
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .end local v7    # "tx":F
    .end local v8    # "ty":F
    :cond_f9
    const-string v9, "scale("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_148

    .line 234
    const-string v9, "scale("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 235
    .restart local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_aa

    .line 236
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 237
    .local v5, "sx":F
    move v6, v5

    .line 238
    .local v6, "sy":F
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_143

    .line 239
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v6

    .line 241
    :cond_143
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto/16 :goto_aa

    .line 243
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .end local v5    # "sx":F
    .end local v6    # "sy":F
    :cond_148
    const-string v9, "skewX("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_183

    .line 244
    const-string v9, "skewX("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 245
    .restart local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_aa

    .line 246
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 247
    .local v0, "angle":F
    float-to-double v9, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->tan(D)D

    move-result-wide v9

    double-to-float v9, v9

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Matrix;->preSkew(FF)Z

    goto/16 :goto_aa

    .line 249
    .end local v0    # "angle":F
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    :cond_183
    const-string v9, "skewY("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1be

    .line 250
    const-string v9, "skewY("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 251
    .restart local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_aa

    .line 252
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 253
    .restart local v0    # "angle":F
    const/4 v9, 0x0

    float-to-double v10, v0

    invoke-static {v10, v11}, Ljava/lang/Math;->tan(D)D

    move-result-wide v10

    double-to-float v10, v10

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Matrix;->preSkew(FF)Z

    goto/16 :goto_aa

    .line 255
    .end local v0    # "angle":F
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    :cond_1be
    const-string v9, "rotate("

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_225

    .line 256
    const-string v9, "rotate("

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/larvalabs/svgandroid/SVGParser;->parseNumbers(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v4

    .line 257
    .restart local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_aa

    .line 258
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 259
    .restart local v0    # "angle":F
    const/4 v1, 0x0

    .line 260
    .local v1, "cx":F
    const/4 v2, 0x0

    .line 261
    .local v2, "cy":F
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x2

    if-le v9, v10, :cond_218

    .line 262
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 263
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 265
    :cond_218
    neg-float v9, v1

    neg-float v10, v2

    invoke-virtual {p1, v9, v10}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 266
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 267
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    goto/16 :goto_aa

    .line 270
    .end local v0    # "angle":F
    .end local v1    # "cx":F
    .end local v2    # "cy":F
    .end local v4    # "np":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    :cond_225
    const-string v9, "SVGAndroid"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid transform ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_aa
.end method
