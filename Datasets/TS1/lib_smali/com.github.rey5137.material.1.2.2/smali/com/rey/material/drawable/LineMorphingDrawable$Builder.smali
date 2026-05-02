.class public Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
.super Ljava/lang/Object;
.source "LineMorphingDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/LineMorphingDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final TAG_ITEM:Ljava/lang/String; = "item"

.field private static final TAG_LINKS:Ljava/lang/String; = "links"

.field private static final TAG_POINTS:Ljava/lang/String; = "points"

.field private static final TAG_STATE:Ljava/lang/String; = "state"

.field private static final TAG_STATE_LIST:Ljava/lang/String; = "state-list"


# instance fields
.field private mAnimDuration:I

.field private mClockwise:Z

.field private mCurState:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsRtl:Z

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

.field private mStrokeCap:Landroid/graphics/Paint$Cap;

.field private mStrokeColor:I

.field private mStrokeJoin:Landroid/graphics/Paint$Join;

.field private mStrokeSize:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 412
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 415
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 416
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v10, 0x3

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 419
    sget-object v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable:[I

    invoke-virtual {p1, p2, v7, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 422
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_state:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .local v4, "resId":I
    if-eqz v4, :cond_1b

    .line 423
    invoke-direct {p0, p1, v4}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->readStates(Landroid/content/Context;I)[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->states([Lcom/rey/material/drawable/LineMorphingDrawable$State;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 424
    :cond_1b
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_curState:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->curState(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 425
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_padding:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->padding(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 426
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_paddingLeft:I

    iget v8, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingLeft:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->paddingLeft(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 427
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_paddingTop:I

    iget v8, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingTop:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->paddingTop(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 428
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_paddingRight:I

    iget v8, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingRight:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->paddingRight(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 429
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_paddingBottom:I

    iget v8, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingBottom:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->paddingBottom(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 430
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_animDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x10e0001

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->animDuration(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 431
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_interpolator:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    if-eqz v4, :cond_7c

    .line 432
    invoke-static {p1, v4}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->interpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 433
    :cond_7c
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_strokeSize:I

    invoke-static {p1, v10}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeSize(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 434
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_strokeColor:I

    const/4 v8, -0x1

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeColor(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 435
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_strokeCap:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    .line 436
    .local v1, "cap":I
    if-nez v1, :cond_cf

    .line 437
    sget-object v7, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeCap(Landroid/graphics/Paint$Cap;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 442
    :goto_a0
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_strokeJoin:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    .line 443
    .local v3, "join":I
    if-nez v3, :cond_dd

    .line 444
    sget-object v7, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeJoin(Landroid/graphics/Paint$Join;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 449
    :goto_ad
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_clockwise:I

    invoke-virtual {v0, v7, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->clockwise(Z)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 451
    sget v7, Lcom/rey/material/R$styleable;->LineMorphingDrawable_lmd_layoutDirection:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    .line 452
    .local v2, "direction":I
    if-ne v2, v10, :cond_ed

    .line 453
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-static {v7}, Landroid/support/v4/text/TextUtilsCompat;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v7

    if-ne v7, v5, :cond_eb

    :goto_c8
    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->rtl(Z)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    .line 457
    :goto_cb
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 458
    return-void

    .line 438
    .end local v2    # "direction":I
    .end local v3    # "join":I
    :cond_cf
    if-ne v1, v5, :cond_d7

    .line 439
    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeCap(Landroid/graphics/Paint$Cap;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    goto :goto_a0

    .line 441
    :cond_d7
    sget-object v7, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeCap(Landroid/graphics/Paint$Cap;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    goto :goto_a0

    .line 445
    .restart local v3    # "join":I
    :cond_dd
    if-ne v3, v5, :cond_e5

    .line 446
    sget-object v7, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeJoin(Landroid/graphics/Paint$Join;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    goto :goto_ad

    .line 448
    :cond_e5
    sget-object v7, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->strokeJoin(Landroid/graphics/Paint$Join;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    goto :goto_ad

    .restart local v2    # "direction":I
    :cond_eb
    move v5, v6

    .line 453
    goto :goto_c8

    .line 455
    :cond_ed
    if-ne v2, v5, :cond_f3

    :goto_ef
    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->rtl(Z)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    goto :goto_cb

    :cond_f3
    move v5, v6

    goto :goto_ef
.end method

.method private readStates(Landroid/content/Context;I)[Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .registers 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # I

    .prologue
    .line 461
    const/4 v6, 0x0

    .line 462
    .local v6, "parser":Landroid/content/res/XmlResourceParser;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 465
    .local v9, "states":Ljava/util/List;, "Ljava/util/List<Lcom/rey/material/drawable/LineMorphingDrawable$State;>;"
    :try_start_6
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v6

    .line 467
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v3

    .line 469
    .local v3, "eventType":I
    const/4 v5, 0x0

    .line 470
    .local v5, "lookingForEndOfUnknownTag":Z
    const/4 v11, 0x0

    .line 474
    .local v11, "unknownTagName":Ljava/lang/String;
    :cond_16
    const/4 v12, 0x2

    if-ne v3, v12, :cond_66

    .line 475
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v10

    .line 476
    .local v10, "tagName":Ljava/lang/String;
    const-string v12, "state-list"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3f

    .line 477
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v3

    .line 485
    .end local v10    # "tagName":Ljava/lang/String;
    :goto_29
    const/4 v7, 0x0

    .line 486
    .local v7, "reachedEndOfStateList":Z
    const/4 v8, 0x0

    .line 487
    .local v8, "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .local v1, "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 490
    .local v2, "currentValue":Ljava/lang/StringBuilder;
    :goto_35
    if-nez v7, :cond_16d

    .line 491
    packed-switch v3, :pswitch_data_182

    .line 556
    :cond_3a
    :goto_3a
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v3

    goto :goto_35

    .line 480
    .end local v1    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "currentValue":Ljava/lang/StringBuilder;
    .end local v7    # "reachedEndOfStateList":Z
    .end local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .restart local v10    # "tagName":Ljava/lang/String;
    :cond_3f
    new-instance v12, Ljava/lang/RuntimeException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Expecting menu, got "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_58} :catch_58
    .catchall {:try_start_6 .. :try_end_58} :catchall_b4

    .line 560
    .end local v3    # "eventType":I
    .end local v5    # "lookingForEndOfUnknownTag":Z
    .end local v10    # "tagName":Ljava/lang/String;
    .end local v11    # "unknownTagName":Ljava/lang/String;
    :catch_58
    move-exception v12

    .line 562
    if-eqz v6, :cond_5e

    .line 563
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->close()V

    .line 566
    :cond_5e
    :goto_5e
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_174

    .line 567
    const/4 v12, 0x0

    .line 569
    :goto_65
    return-object v12

    .line 482
    .restart local v3    # "eventType":I
    .restart local v5    # "lookingForEndOfUnknownTag":Z
    .restart local v11    # "unknownTagName":Ljava/lang/String;
    :cond_66
    :try_start_66
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v3

    .line 483
    const/4 v12, 0x1

    if-ne v3, v12, :cond_16

    goto :goto_29

    .line 493
    .restart local v1    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "currentValue":Ljava/lang/StringBuilder;
    .restart local v7    # "reachedEndOfStateList":Z
    .restart local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    :pswitch_6e
    if-nez v5, :cond_3a

    .line 496
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v10

    .line 497
    .restart local v10    # "tagName":Ljava/lang/String;
    const/4 v12, -0x1

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v13

    sparse-switch v13, :sswitch_data_18e

    :cond_7c
    :goto_7c
    packed-switch v12, :pswitch_data_1a0

    .line 509
    const/4 v5, 0x1

    .line 510
    move-object v11, v10

    goto :goto_3a

    .line 497
    :sswitch_82
    const-string v13, "state"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7c

    const/4 v12, 0x0

    goto :goto_7c

    :sswitch_8c
    const-string v13, "points"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7c

    const/4 v12, 0x1

    goto :goto_7c

    :sswitch_96
    const-string v13, "links"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7c

    const/4 v12, 0x2

    goto :goto_7c

    :sswitch_a0
    const-string v13, "item"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7c

    const/4 v12, 0x3

    goto :goto_7c

    .line 499
    :pswitch_aa
    new-instance v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;

    .end local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    invoke-direct {v8}, Lcom/rey/material/drawable/LineMorphingDrawable$State;-><init>()V

    .line 500
    .restart local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    goto :goto_3a

    .line 503
    :pswitch_b0
    invoke-interface {v1}, Ljava/util/List;->clear()V
    :try_end_b3
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_b3} :catch_58
    .catchall {:try_start_66 .. :try_end_b3} :catchall_b4

    goto :goto_3a

    .line 562
    .end local v1    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "currentValue":Ljava/lang/StringBuilder;
    .end local v3    # "eventType":I
    .end local v5    # "lookingForEndOfUnknownTag":Z
    .end local v7    # "reachedEndOfStateList":Z
    .end local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .end local v10    # "tagName":Ljava/lang/String;
    .end local v11    # "unknownTagName":Ljava/lang/String;
    :catchall_b4
    move-exception v12

    if-eqz v6, :cond_ba

    .line 563
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_ba
    throw v12

    .line 506
    .restart local v1    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "currentValue":Ljava/lang/StringBuilder;
    .restart local v3    # "eventType":I
    .restart local v5    # "lookingForEndOfUnknownTag":Z
    .restart local v7    # "reachedEndOfStateList":Z
    .restart local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .restart local v10    # "tagName":Ljava/lang/String;
    .restart local v11    # "unknownTagName":Ljava/lang/String;
    :pswitch_bb
    const/4 v12, 0x0

    :try_start_bc
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v13

    invoke-virtual {v2, v12, v13}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto/16 :goto_3a

    .line 516
    .end local v10    # "tagName":Ljava/lang/String;
    :pswitch_c5
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v10

    .line 518
    .restart local v10    # "tagName":Ljava/lang/String;
    if-eqz v5, :cond_d3

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_d3

    .line 519
    const/4 v5, 0x0

    .line 520
    const/4 v11, 0x0

    .line 523
    :cond_d3
    const/4 v12, -0x1

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v13

    sparse-switch v13, :sswitch_data_1ac

    :cond_db
    :goto_db
    packed-switch v12, :pswitch_data_1c2

    goto/16 :goto_3a

    .line 525
    :pswitch_e0
    const/4 v7, 0x1

    .line 526
    goto/16 :goto_3a

    .line 523
    :sswitch_e3
    const-string v13, "state-list"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_db

    const/4 v12, 0x0

    goto :goto_db

    :sswitch_ed
    const-string v13, "state"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_db

    const/4 v12, 0x1

    goto :goto_db

    :sswitch_f7
    const-string v13, "points"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_db

    const/4 v12, 0x2

    goto :goto_db

    :sswitch_101
    const-string v13, "links"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_db

    const/4 v12, 0x3

    goto :goto_db

    :sswitch_10b
    const-string v13, "item"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_db

    const/4 v12, 0x4

    goto :goto_db

    .line 528
    :pswitch_115
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    .line 531
    :pswitch_11a
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [F

    iput-object v12, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    .line 532
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_123
    iget-object v12, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    array-length v12, v12

    if-ge v4, v12, :cond_3a

    .line 533
    iget-object v13, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    aput v12, v13, v4

    .line 532
    add-int/lit8 v4, v4, 0x1

    goto :goto_123

    .line 536
    .end local v4    # "i":I
    :pswitch_139
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [I

    iput-object v12, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    .line 537
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_142
    iget-object v12, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    array-length v12, v12

    if-ge v4, v12, :cond_3a

    .line 538
    iget-object v13, v8, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    aput v12, v13, v4

    .line 537
    add-int/lit8 v4, v4, 0x1

    goto :goto_142

    .line 541
    .end local v4    # "i":I
    :pswitch_158
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    .line 548
    .end local v10    # "tagName":Ljava/lang/String;
    :pswitch_161
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getText()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_168
    .catch Ljava/lang/Exception; {:try_start_bc .. :try_end_168} :catch_58
    .catchall {:try_start_bc .. :try_end_168} :catchall_b4

    goto/16 :goto_3a

    .line 552
    :pswitch_16a
    const/4 v7, 0x1

    goto/16 :goto_3a

    .line 562
    :cond_16d
    if-eqz v6, :cond_5e

    .line 563
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->close()V

    goto/16 :goto_5e

    .line 569
    .end local v1    # "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "currentValue":Ljava/lang/StringBuilder;
    .end local v3    # "eventType":I
    .end local v5    # "lookingForEndOfUnknownTag":Z
    .end local v7    # "reachedEndOfStateList":Z
    .end local v8    # "state":Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .end local v11    # "unknownTagName":Ljava/lang/String;
    :cond_174
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Lcom/rey/material/drawable/LineMorphingDrawable$State;

    invoke-interface {v9, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Lcom/rey/material/drawable/LineMorphingDrawable$State;

    goto/16 :goto_65

    .line 491
    :pswitch_data_182
    .packed-switch 0x1
        :pswitch_16a
        :pswitch_6e
        :pswitch_c5
        :pswitch_161
    .end packed-switch

    .line 497
    :sswitch_data_18e
    .sparse-switch
        -0x3a93a31d -> :sswitch_8c
        0x317b13 -> :sswitch_a0
        0x6234fb9 -> :sswitch_96
        0x68ac491 -> :sswitch_82
    .end sparse-switch

    :pswitch_data_1a0
    .packed-switch 0x0
        :pswitch_aa
        :pswitch_b0
        :pswitch_b0
        :pswitch_bb
    .end packed-switch

    .line 523
    :sswitch_data_1ac
    .sparse-switch
        -0x3a93a31d -> :sswitch_f7
        -0x1054bfa6 -> :sswitch_e3
        0x317b13 -> :sswitch_10b
        0x6234fb9 -> :sswitch_101
        0x68ac491 -> :sswitch_ed
    .end sparse-switch

    :pswitch_data_1c2
    .packed-switch 0x0
        :pswitch_e0
        :pswitch_115
        :pswitch_11a
        :pswitch_139
        :pswitch_158
    .end packed-switch
.end method


# virtual methods
.method public animDuration(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 624
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mAnimDuration:I

    .line 625
    return-object p0
.end method

.method public build()Lcom/rey/material/drawable/LineMorphingDrawable;
    .registers 18

    .prologue
    .line 573
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeCap:Landroid/graphics/Paint$Cap;

    if-nez v1, :cond_c

    .line 574
    sget-object v1, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeCap:Landroid/graphics/Paint$Cap;

    .line 576
    :cond_c
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeJoin:Landroid/graphics/Paint$Join;

    if-nez v1, :cond_18

    .line 577
    sget-object v1, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeJoin:Landroid/graphics/Paint$Join;

    .line 579
    :cond_18
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_27

    .line 580
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 582
    :cond_27
    new-instance v1, Lcom/rey/material/drawable/LineMorphingDrawable;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mCurState:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingLeft:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingTop:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingRight:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingBottom:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mAnimDuration:I

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeSize:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeColor:I

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeCap:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeJoin:Landroid/graphics/Paint$Join;

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mClockwise:Z

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mIsRtl:Z

    const/16 v16, 0x0

    invoke-direct/range {v1 .. v16}, Lcom/rey/material/drawable/LineMorphingDrawable;-><init>([Lcom/rey/material/drawable/LineMorphingDrawable$State;IIIIIILandroid/view/animation/Interpolator;IILandroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;ZZLcom/rey/material/drawable/LineMorphingDrawable$1;)V

    return-object v1
.end method

.method public clockwise(Z)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "clockwise"    # Z

    .prologue
    .line 654
    iput-boolean p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mClockwise:Z

    .line 655
    return-object p0
.end method

.method public curState(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 591
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mCurState:I

    .line 592
    return-object p0
.end method

.method public interpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 629
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 630
    return-object p0
.end method

.method public padding(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 596
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingLeft:I

    .line 597
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingTop:I

    .line 598
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingRight:I

    .line 599
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingBottom:I

    .line 600
    return-object p0
.end method

.method public paddingBottom(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 619
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingBottom:I

    .line 620
    return-object p0
.end method

.method public paddingLeft(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 604
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingLeft:I

    .line 605
    return-object p0
.end method

.method public paddingRight(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 614
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingRight:I

    .line 615
    return-object p0
.end method

.method public paddingTop(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 609
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mPaddingTop:I

    .line 610
    return-object p0
.end method

.method public rtl(Z)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "rtl"    # Z

    .prologue
    .line 659
    iput-boolean p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mIsRtl:Z

    .line 660
    return-object p0
.end method

.method public varargs states([Lcom/rey/material/drawable/LineMorphingDrawable$State;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "states"    # [Lcom/rey/material/drawable/LineMorphingDrawable$State;

    .prologue
    .line 586
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    .line 587
    return-object p0
.end method

.method public strokeCap(Landroid/graphics/Paint$Cap;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "cap"    # Landroid/graphics/Paint$Cap;

    .prologue
    .line 644
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeCap:Landroid/graphics/Paint$Cap;

    .line 645
    return-object p0
.end method

.method public strokeColor(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "strokeColor"    # I

    .prologue
    .line 639
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeColor:I

    .line 640
    return-object p0
.end method

.method public strokeJoin(Landroid/graphics/Paint$Join;)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "join"    # Landroid/graphics/Paint$Join;

    .prologue
    .line 649
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeJoin:Landroid/graphics/Paint$Join;

    .line 650
    return-object p0
.end method

.method public strokeSize(I)Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 634
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->mStrokeSize:I

    .line 635
    return-object p0
.end method
