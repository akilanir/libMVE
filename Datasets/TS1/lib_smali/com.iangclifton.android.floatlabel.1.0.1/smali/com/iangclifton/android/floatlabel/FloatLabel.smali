.class public Lcom/iangclifton/android/floatlabel/FloatLabel;
.super Landroid/widget/FrameLayout;
.source "FloatLabel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/iangclifton/android/floatlabel/FloatLabel$1;,
        Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;,
        Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;,
        Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;
    }
.end annotation


# static fields
.field private static final SAVE_STATE_KEY_EDIT_TEXT:Ljava/lang/String; = "saveStateEditText"

.field private static final SAVE_STATE_KEY_LABEL:Ljava/lang/String; = "saveStateLabel"

.field private static final SAVE_STATE_PARENT:Ljava/lang/String; = "saveStateParent"

.field private static final SAVE_STATE_TAG:Ljava/lang/String; = "saveStateTag"


# instance fields
.field private mEditText:Landroid/widget/EditText;

.field private mInitComplete:Z

.field private mLabel:Landroid/widget/TextView;

.field private mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

.field private mLabelShowing:Z

.field private mSavedState:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 107
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 108
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 115
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    .line 74
    new-instance v0, Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;-><init>(Lcom/iangclifton/android/floatlabel/FloatLabel$1;)V

    iput-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    .line 116
    invoke-direct {p0, p1, p2, p3}, Lcom/iangclifton/android/floatlabel/FloatLabel;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 117
    return-void
.end method

.method static synthetic access$200(Lcom/iangclifton/android/floatlabel/FloatLabel;)Z
    .registers 2
    .param p0, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel;

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z

    return v0
.end method

.method static synthetic access$202(Lcom/iangclifton/android/floatlabel/FloatLabel;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z

    return p1
.end method

.method static synthetic access$300(Lcom/iangclifton/android/floatlabel/FloatLabel;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/iangclifton/android/floatlabel/FloatLabel;)Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;
    .registers 2
    .param p0, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    return-object v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 354
    if-nez p2, :cond_24

    .line 355
    sget v5, Lcom/iangclifton/android/floatlabel/R$layout;->float_label:I

    .line 356
    .local v5, "layout":I
    const/4 v6, 0x0

    .line 357
    .local v6, "text":Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 358
    .local v2, "hint":Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 359
    .local v3, "hintColor":Landroid/content/res/ColorStateList;
    const/4 v1, 0x0

    .line 360
    .local v1, "floatLabelColor":I
    const/4 v4, 0x0

    .line 374
    .local v4, "inputType":I
    :goto_b
    invoke-static {p1, v5, p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 375
    sget v7, Lcom/iangclifton/android/floatlabel/R$id;->edit_text:I

    invoke-virtual {p0, v7}, Lcom/iangclifton/android/floatlabel/FloatLabel;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    iput-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    .line 376
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    if-nez v7, :cond_4c

    .line 377
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Your layout must have an EditText whose ID is @id/edit_text"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 362
    .end local v1    # "floatLabelColor":I
    .end local v2    # "hint":Ljava/lang/CharSequence;
    .end local v3    # "hintColor":Landroid/content/res/ColorStateList;
    .end local v4    # "inputType":I
    .end local v5    # "layout":I
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_24
    sget-object v7, Lcom/iangclifton/android/floatlabel/R$styleable;->FloatLabel:[I

    invoke-virtual {p1, p2, v7, p3, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 364
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v7, Lcom/iangclifton/android/floatlabel/R$layout;->float_label:I

    invoke-virtual {v0, v11, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 365
    .restart local v5    # "layout":I
    const/4 v7, 0x2

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 366
    .restart local v6    # "text":Ljava/lang/CharSequence;
    const/4 v7, 0x3

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 367
    .restart local v2    # "hint":Ljava/lang/CharSequence;
    invoke-virtual {v0, v10}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 368
    .restart local v3    # "hintColor":Landroid/content/res/ColorStateList;
    const/4 v7, 0x5

    invoke-virtual {v0, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 370
    .restart local v1    # "floatLabelColor":I
    const/4 v7, 0x4

    invoke-virtual {v0, v7, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 371
    .restart local v4    # "inputType":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_b

    .line 380
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_4c
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v7, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 381
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v7, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 382
    if-eqz v3, :cond_5d

    .line 383
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v7, v3}, Landroid/widget/EditText;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 385
    :cond_5d
    if-eqz v4, :cond_64

    .line 386
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v7, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 389
    :cond_64
    sget v7, Lcom/iangclifton/android/floatlabel/R$id;->float_label:I

    invoke-virtual {p0, v7}, Lcom/iangclifton/android/floatlabel/FloatLabel;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    .line 390
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    if-nez v7, :cond_7a

    .line 391
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Your layout must have a TextView whose ID is @id/float_label"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 394
    :cond_7a
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 395
    if-eqz v1, :cond_8c

    .line 396
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 399
    :cond_8c
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    new-instance v8, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;-><init>(Lcom/iangclifton/android/floatlabel/FloatLabel;Lcom/iangclifton/android/floatlabel/FloatLabel$1;)V

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 402
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    if-nez v7, :cond_ae

    .line 403
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setAlpha(F)V

    .line 404
    iput-boolean v10, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z

    .line 412
    :goto_ab
    iput-boolean v11, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    .line 413
    return-void

    .line 406
    :cond_ae
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 407
    iput-boolean v11, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z

    goto :goto_ab
.end method

.method private layoutChild(Landroid/view/View;IIII)V
    .registers 16
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentLeft"    # I
    .param p3, "parentTop"    # I
    .param p4, "parentRight"    # I
    .param p5, "parentBottom"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 223
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_3d

    .line 224
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 226
    .local v6, "lp":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    .line 227
    .local v7, "width":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    .line 230
    .local v4, "height":I
    iget v8, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int v2, p3, v8

    .line 232
    .local v2, "childTop":I
    iget v3, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 233
    .local v3, "gravity":I
    const/4 v8, -0x1

    if-ne v3, v8, :cond_22

    .line 234
    const v3, 0x800033

    .line 238
    :cond_22
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x11

    if-ge v8, v9, :cond_3e

    .line 239
    const/4 v5, 0x0

    .line 244
    .local v5, "layoutDirection":I
    :goto_29
    invoke-static {v3, v5}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    .line 246
    .local v0, "absoluteGravity":I
    and-int/lit8 v8, v0, 0x7

    sparse-switch v8, :sswitch_data_58

    .line 255
    iget v8, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int v1, p2, v8

    .line 258
    .local v1, "childLeft":I
    :goto_36
    add-int v8, v1, v7

    add-int v9, v2, v4

    invoke-virtual {p1, v1, v2, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 260
    .end local v0    # "absoluteGravity":I
    .end local v1    # "childLeft":I
    .end local v2    # "childTop":I
    .end local v3    # "gravity":I
    .end local v4    # "height":I
    .end local v5    # "layoutDirection":I
    .end local v6    # "lp":Landroid/widget/FrameLayout$LayoutParams;
    .end local v7    # "width":I
    :cond_3d
    return-void

    .line 241
    .restart local v2    # "childTop":I
    .restart local v3    # "gravity":I
    .restart local v4    # "height":I
    .restart local v6    # "lp":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v7    # "width":I
    :cond_3e
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getLayoutDirection()I

    move-result v5

    .restart local v5    # "layoutDirection":I
    goto :goto_29

    .line 248
    .restart local v0    # "absoluteGravity":I
    :sswitch_43
    sub-int v8, p4, p2

    sub-int/2addr v8, v7

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, p2

    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v8, v9

    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    sub-int v1, v8, v9

    .line 249
    .restart local v1    # "childLeft":I
    goto :goto_36

    .line 251
    .end local v1    # "childLeft":I
    :sswitch_51
    sub-int v8, p4, v7

    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    sub-int v1, v8, v9

    .line 252
    .restart local v1    # "childLeft":I
    goto :goto_36

    .line 246
    :sswitch_data_58
    .sparse-switch
        0x1 -> :sswitch_43
        0x5 -> :sswitch_51
    .end sparse-switch
.end method

.method private measureHeight(I)I
    .registers 7
    .param p1, "heightMeasureSpec"    # I

    .prologue
    .line 307
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 308
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 310
    .local v2, "specSize":I
    const/4 v0, 0x0

    .line 311
    .local v0, "result":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_f

    .line 312
    move v0, v2

    .line 323
    :cond_e
    :goto_e
    return v0

    .line 314
    :cond_f
    iget-object v3, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v4

    add-int v0, v3, v4

    .line 315
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v0, v3

    .line 316
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getSuggestedMinimumHeight()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 318
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_e

    .line 319
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_e
.end method

.method private measureWidth(I)I
    .registers 7
    .param p1, "widthMeasureSpec"    # I

    .prologue
    .line 327
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 328
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 330
    .local v2, "specSize":I
    const/4 v0, 0x0

    .line 331
    .local v0, "result":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_f

    .line 332
    move v0, v2

    .line 342
    :cond_e
    :goto_e
    return v0

    .line 334
    :cond_f
    iget-object v3, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result v3

    iget-object v4, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 335
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 336
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v0, v3

    .line 337
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_e

    .line 338
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_e
.end method


# virtual methods
.method public addView(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 121
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    if-eqz v0, :cond_c

    .line 122
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "You cannot add child views to a FloatLabel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_c
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 126
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    if-eqz v0, :cond_c

    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "You cannot add child views to a FloatLabel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_c
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 135
    return-void
.end method

.method public addView(Landroid/view/View;II)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 148
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    if-eqz v0, :cond_c

    .line 149
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "You cannot add child views to a FloatLabel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_c
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 153
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    if-eqz v0, :cond_c

    .line 140
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "You cannot add child views to a FloatLabel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_c
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 144
    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mInitComplete:Z

    if-eqz v0, :cond_c

    .line 158
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "You cannot add child views to a FloatLabel"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_c
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    return-void
.end method

.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .registers 18
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingLeft()I

    move-result v2

    .line 212
    .local v2, "childLeft":I
    sub-int v0, p4, p2

    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingRight()I

    move-result v1

    sub-int v4, v0, v1

    .line 214
    .local v4, "childRight":I
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingTop()I

    move-result v3

    .line 215
    .local v3, "childTop":I
    sub-int v0, p5, p3

    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getPaddingBottom()I

    move-result v1

    sub-int v5, v0, v1

    .line 217
    .local v5, "childBottom":I
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/iangclifton/android/floatlabel/FloatLabel;->layoutChild(Landroid/view/View;IIII)V

    .line 218
    iget-object v7, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v0

    add-int v9, v3, v0

    move-object v6, p0

    move v8, v2

    move v10, v4

    move v11, v5

    invoke-direct/range {v6 .. v11}, Lcom/iangclifton/android/floatlabel/FloatLabel;->layoutChild(Landroid/view/View;IIII)V

    .line 219
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 265
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mSavedState:Landroid/os/Bundle;

    if-eqz v1, :cond_21

    .line 266
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mSavedState:Landroid/os/Bundle;

    const-string v2, "saveStateEditText"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .line 267
    .local v0, "childState":Landroid/os/Parcelable;
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 268
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mSavedState:Landroid/os/Bundle;

    const-string v2, "saveStateLabel"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 270
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mSavedState:Landroid/os/Bundle;

    .line 272
    .end local v0    # "childState":Landroid/os/Parcelable;
    :cond_21
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p0, v1, p1, p2}, Lcom/iangclifton/android/floatlabel/FloatLabel;->measureChild(Landroid/view/View;II)V

    .line 273
    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {p0, v1, p1, p2}, Lcom/iangclifton/android/floatlabel/FloatLabel;->measureChild(Landroid/view/View;II)V

    .line 274
    invoke-direct {p0, p1}, Lcom/iangclifton/android/floatlabel/FloatLabel;->measureWidth(I)I

    move-result v1

    invoke-direct {p0, p2}, Lcom/iangclifton/android/floatlabel/FloatLabel;->measureHeight(I)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/iangclifton/android/floatlabel/FloatLabel;->setMeasuredDimension(II)V

    .line 275
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 279
    instance-of v1, p1, Landroid/os/Bundle;

    if-eqz v1, :cond_1c

    move-object v0, p1

    .line 280
    check-cast v0, Landroid/os/Bundle;

    .line 281
    .local v0, "savedState":Landroid/os/Bundle;
    const-string v1, "saveStateTag"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 285
    iput-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mSavedState:Landroid/os/Bundle;

    .line 286
    const-string v1, "saveStateParent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 292
    .end local v0    # "savedState":Landroid/os/Bundle;
    :goto_1b
    return-void

    .line 291
    :cond_1c
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_1b
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 296
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 297
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 298
    .local v0, "saveState":Landroid/os/Bundle;
    const-string v2, "saveStateEditText"

    iget-object v3, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 299
    const-string v2, "saveStateLabel"

    iget-object v3, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 300
    const-string v2, "saveStateTag"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 301
    const-string v2, "saveStateParent"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 303
    return-object v0
.end method

.method public setLabel(I)V
    .registers 3
    .param p1, "resid"    # I

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->setLabel(Ljava/lang/CharSequence;)V

    .line 182
    return-void
.end method

.method public setLabel(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 193
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    return-void
.end method

.method public setLabelAnimator(Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;)V
    .registers 4
    .param p1, "labelAnimator"    # Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    .prologue
    .line 202
    if-nez p1, :cond_b

    .line 203
    new-instance v0, Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator;-><init>(Lcom/iangclifton/android/floatlabel/FloatLabel$1;)V

    iput-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    .line 207
    :goto_a
    return-void

    .line 205
    :cond_b
    iput-object p1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    goto :goto_a
.end method
