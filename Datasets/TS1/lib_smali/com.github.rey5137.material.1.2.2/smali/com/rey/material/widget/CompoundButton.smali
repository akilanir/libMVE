.class public Lcom/rey/material/widget/CompoundButton;
.super Landroid/widget/CompoundButton;
.source "CompoundButton.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# instance fields
.field protected mCurrentStyle:I

.field private mIsRtl:Z

.field private volatile mPaddingDrawable:Lcom/rey/material/drawable/PaddingDrawable;

.field private mRippleManager:Lcom/rey/material/widget/RippleManager;

.field protected mStyleId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-direct {p0, p1}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;)V

    .line 21
    iput-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    .line 24
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    .line 29
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/CompoundButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    iput-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    .line 24
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    .line 35
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/CompoundButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    iput-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    .line 24
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    .line 41
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/rey/material/widget/CompoundButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    .line 24
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    .line 48
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CompoundButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 49
    return-void
.end method

.method private applyPadding(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 27
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 74
    const/16 v20, 0x7

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    fill-array-data v20, :array_130

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move/from16 v3, p3

    move/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 76
    .local v5, "a":Landroid/content/res/TypedArray;
    const/4 v14, -0x1

    .line 77
    .local v14, "padding":I
    const/4 v12, -0x1

    .line 78
    .local v12, "leftPadding":I
    const/16 v19, -0x1

    .line 79
    .local v19, "topPadding":I
    const/4 v15, -0x1

    .line 80
    .local v15, "rightPadding":I
    const/4 v7, -0x1

    .line 81
    .local v7, "bottomPadding":I
    const/high16 v17, -0x80000000

    .line 82
    .local v17, "startPadding":I
    const/high16 v9, -0x80000000

    .line 84
    .local v9, "endPadding":I
    const/16 v18, 0x0

    .line 85
    .local v18, "startPaddingDefined":Z
    const/4 v10, 0x0

    .line 86
    .local v10, "endPaddingDefined":Z
    const/4 v13, 0x0

    .line 87
    .local v13, "leftPaddingDefined":Z
    const/16 v16, 0x0

    .line 89
    .local v16, "rightPaddingDefined":Z
    const/4 v11, 0x0

    .local v11, "i":I
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v8

    .local v8, "count":I
    :goto_2e
    if-ge v11, v8, :cond_cc

    .line 90
    invoke-virtual {v5, v11}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v6

    .line 91
    .local v6, "attr":I
    if-nez v6, :cond_44

    .line 92
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    .line 93
    const/4 v13, 0x1

    .line 94
    const/16 v16, 0x1

    .line 89
    :cond_41
    :goto_41
    add-int/lit8 v11, v11, 0x1

    goto :goto_2e

    .line 96
    :cond_44
    const/16 v20, 0x1

    move/from16 v0, v20

    if-ne v6, v0, :cond_54

    .line 97
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    .line 98
    const/4 v13, 0x1

    goto :goto_41

    .line 100
    :cond_54
    const/16 v20, 0x2

    move/from16 v0, v20

    if-ne v6, v0, :cond_63

    .line 101
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    goto :goto_41

    .line 102
    :cond_63
    const/16 v20, 0x3

    move/from16 v0, v20

    if-ne v6, v0, :cond_74

    .line 103
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    .line 104
    const/16 v16, 0x1

    goto :goto_41

    .line 106
    :cond_74
    const/16 v20, 0x4

    move/from16 v0, v20

    if-ne v6, v0, :cond_83

    .line 107
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    goto :goto_41

    .line 108
    :cond_83
    const/16 v20, 0x5

    move/from16 v0, v20

    if-ne v6, v0, :cond_a9

    .line 109
    sget v20, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v21, 0x11

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_41

    .line 110
    const/high16 v20, -0x80000000

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v17

    .line 111
    const/high16 v20, -0x80000000

    move/from16 v0, v17

    move/from16 v1, v20

    if-eq v0, v1, :cond_a6

    const/16 v18, 0x1

    :goto_a5
    goto :goto_41

    :cond_a6
    const/16 v18, 0x0

    goto :goto_a5

    .line 114
    :cond_a9
    const/16 v20, 0x6

    move/from16 v0, v20

    if-ne v6, v0, :cond_41

    .line 115
    sget v20, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v21, 0x11

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_41

    .line 116
    const/high16 v20, -0x80000000

    move/from16 v0, v20

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    .line 117
    const/high16 v20, -0x80000000

    move/from16 v0, v20

    if-eq v9, v0, :cond_ca

    const/4 v10, 0x1

    :goto_c8
    goto/16 :goto_41

    :cond_ca
    const/4 v10, 0x0

    goto :goto_c8

    .line 122
    .end local v6    # "attr":I
    :cond_cc
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 124
    if-ltz v14, :cond_d7

    .line 125
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v14, v14, v14}, Lcom/rey/material/widget/CompoundButton;->setPadding(IIII)V

    .line 139
    .end local v7    # "bottomPadding":I
    .end local v9    # "endPadding":I
    .end local v12    # "leftPadding":I
    .end local v15    # "rightPadding":I
    .end local v17    # "startPadding":I
    .end local v19    # "topPadding":I
    :cond_d6
    :goto_d6
    return-void

    .line 127
    .restart local v7    # "bottomPadding":I
    .restart local v9    # "endPadding":I
    .restart local v12    # "leftPadding":I
    .restart local v15    # "rightPadding":I
    .restart local v17    # "startPadding":I
    .restart local v19    # "topPadding":I
    :cond_d7
    if-nez v13, :cond_db

    if-eqz v16, :cond_f0

    .line 128
    :cond_db
    if-eqz v13, :cond_106

    .end local v12    # "leftPadding":I
    :goto_dd
    if-ltz v19, :cond_10b

    move/from16 v21, v19

    :goto_e1
    if-eqz v16, :cond_112

    .end local v15    # "rightPadding":I
    :goto_e3
    if-ltz v7, :cond_117

    move/from16 v20, v7

    :goto_e7
    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v20

    invoke-virtual {v0, v12, v1, v15, v2}, Lcom/rey/material/widget/CompoundButton;->setPadding(IIII)V

    .line 133
    :cond_f0
    if-nez v18, :cond_f4

    if-eqz v10, :cond_d6

    .line 134
    :cond_f4
    if-eqz v18, :cond_11c

    .end local v17    # "startPadding":I
    :goto_f6
    if-ltz v19, :cond_121

    .end local v19    # "topPadding":I
    :goto_f8
    if-eqz v10, :cond_126

    .end local v9    # "endPadding":I
    :goto_fa
    if-ltz v7, :cond_12b

    .end local v7    # "bottomPadding":I
    :goto_fc
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2, v9, v7}, Lcom/rey/material/widget/CompoundButton;->setPaddingRelative(IIII)V

    goto :goto_d6

    .line 128
    .restart local v7    # "bottomPadding":I
    .restart local v9    # "endPadding":I
    .restart local v12    # "leftPadding":I
    .restart local v15    # "rightPadding":I
    .restart local v17    # "startPadding":I
    .restart local v19    # "topPadding":I
    :cond_106
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingLeft()I

    move-result v12

    goto :goto_dd

    .end local v12    # "leftPadding":I
    :cond_10b
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingTop()I

    move-result v20

    move/from16 v21, v20

    goto :goto_e1

    :cond_112
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingRight()I

    move-result v15

    goto :goto_e3

    .end local v15    # "rightPadding":I
    :cond_117
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingBottom()I

    move-result v20

    goto :goto_e7

    .line 134
    :cond_11c
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingStart()I

    move-result v17

    goto :goto_f6

    .end local v17    # "startPadding":I
    :cond_121
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingTop()I

    move-result v19

    goto :goto_f8

    .end local v19    # "topPadding":I
    :cond_126
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingEnd()I

    move-result v9

    goto :goto_fa

    .end local v9    # "endPadding":I
    :cond_12b
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingBottom()I

    move-result v7

    goto :goto_fc

    .line 74
    :array_130
    .array-data 4
        0x10100d5
        0x10100d6
        0x10100d7
        0x10100d8
        0x10100d9
        0x10103b3
        0x10103b4
    .end array-data
.end method

.method private getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;
    .registers 3

    .prologue
    .line 142
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mPaddingDrawable:Lcom/rey/material/drawable/PaddingDrawable;

    if-nez v0, :cond_12

    .line 143
    monitor-enter p0

    .line 144
    :try_start_5
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mPaddingDrawable:Lcom/rey/material/drawable/PaddingDrawable;

    if-nez v0, :cond_11

    .line 145
    new-instance v0, Lcom/rey/material/drawable/PaddingDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/PaddingDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mPaddingDrawable:Lcom/rey/material/drawable/PaddingDrawable;

    .line 146
    :cond_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_15

    .line 149
    :cond_12
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mPaddingDrawable:Lcom/rey/material/drawable/PaddingDrawable;

    return-object v0

    .line 146
    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v0
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 64
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 65
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/CompoundButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 66
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 70
    return-void
.end method

.method public getButtonDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getCompoundPaddingLeft()I
    .registers 3

    .prologue
    .line 289
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-eqz v1, :cond_9

    .line 290
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingLeft()I

    move-result v1

    .line 293
    :goto_8
    return v1

    .line 292
    :cond_9
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    .line 293
    .local v0, "drawable":Lcom/rey/material/drawable/PaddingDrawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getIntrinsicWidth()I

    move-result v1

    goto :goto_8
.end method

.method public getCompoundPaddingRight()I
    .registers 3

    .prologue
    .line 299
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-nez v1, :cond_9

    .line 300
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingRight()I

    move-result v1

    .line 303
    :goto_8
    return v1

    .line 302
    :cond_9
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    .line 303
    .local v0, "drawable":Lcom/rey/material/drawable/PaddingDrawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getIntrinsicWidth()I

    move-result v1

    goto :goto_8
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 215
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 216
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 217
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 218
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 219
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 222
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/CompoundButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 219
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 52
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_9

    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CompoundButton;->applyPadding(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 55
    :cond_9
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/CompoundButton;->setClickable(Z)V

    .line 56
    invoke-static {p0, p2, p3, p4}, Lcom/rey/material/util/ViewUtil;->applyFont(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    .line 57
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CompoundButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 59
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 60
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mStyleId:I

    .line 61
    :cond_1f
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 173
    invoke-super {p0}, Landroid/widget/CompoundButton;->onAttachedToWindow()V

    .line 174
    iget v0, p0, Lcom/rey/material/widget/CompoundButton;->mStyleId:I

    if-eqz v0, :cond_12

    .line 175
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 176
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/CompoundButton;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 178
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 182
    invoke-super {p0}, Landroid/widget/CompoundButton;->onDetachedFromWindow()V

    .line 183
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 184
    iget v0, p0, Lcom/rey/material/widget/CompoundButton;->mStyleId:I

    if-eqz v0, :cond_11

    .line 185
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 186
    :cond_11
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 7
    .param p1, "layoutDirection"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 191
    if-ne p1, v0, :cond_2d

    .line 192
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-eq v1, v0, :cond_2c

    .line 193
    iput-boolean v0, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    .line 195
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_2f

    .line 196
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingStart()I

    move-result v1

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingEnd()I

    move-result v3

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/rey/material/widget/CompoundButton;->setPaddingRelative(IIII)V

    .line 200
    :goto_22
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getCompoundDrawablePadding()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/CompoundButton;->setCompoundDrawablePadding(I)V

    .line 201
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->invalidate()V

    .line 203
    :cond_2c
    return-void

    .line 191
    .end local v0    # "rtl":Z
    :cond_2d
    const/4 v0, 0x0

    goto :goto_3

    .line 198
    .restart local v0    # "rtl":Z
    :cond_2f
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/rey/material/widget/CompoundButton;->setPadding(IIII)V

    goto :goto_22
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 164
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/CompoundButton;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 165
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 166
    iput v0, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    .line 167
    iget v1, p0, Lcom/rey/material/widget/CompoundButton;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/CompoundButton;->applyStyle(I)V

    .line 169
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 238
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 239
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Lcom/rey/material/widget/RippleManager;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-nez v1, :cond_10

    if-eqz v0, :cond_12

    :cond_10
    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 207
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 208
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_12

    instance-of v1, p1, Lcom/rey/material/drawable/RippleDrawable;

    if-nez v1, :cond_12

    .line 209
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 212
    :goto_11
    return-void

    .line 211
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setButtonDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 244
    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 245
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/PaddingDrawable;->setWrappedDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 246
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 247
    return-void
.end method

.method public setCompoundDrawablePadding(I)V
    .registers 6
    .param p1, "pad"    # I

    .prologue
    .line 278
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    .line 279
    .local v0, "drawable":Lcom/rey/material/drawable/PaddingDrawable;
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-eqz v1, :cond_1b

    .line 280
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingTop()I

    move-result v1

    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingRight()I

    move-result v2

    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    .line 284
    :goto_17
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setCompoundDrawablePadding(I)V

    .line 285
    return-void

    .line 282
    :cond_1b
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    goto :goto_17
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/rey/material/widget/CompoundButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 228
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 229
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    :goto_9
    return-void

    .line 231
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method

.method public setPadding(IIII)V
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 256
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    .line 257
    .local v0, "drawable":Lcom/rey/material/drawable/PaddingDrawable;
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-eqz v1, :cond_13

    .line 258
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0, v1, p2, p3, p4}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    .line 262
    :goto_f
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CompoundButton;->setPadding(IIII)V

    .line 263
    return-void

    .line 260
    :cond_13
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingRight()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1, p4}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    goto :goto_f
.end method

.method public setPaddingRelative(IIII)V
    .registers 7
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 267
    invoke-direct {p0}, Lcom/rey/material/widget/CompoundButton;->getPaddingDrawable()Lcom/rey/material/drawable/PaddingDrawable;

    move-result-object v0

    .line 268
    .local v0, "drawable":Lcom/rey/material/drawable/PaddingDrawable;
    iget-boolean v1, p0, Lcom/rey/material/widget/CompoundButton;->mIsRtl:Z

    if-eqz v1, :cond_13

    .line 269
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0, v1, p2, p1, p4}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    .line 273
    :goto_f
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/CompoundButton;->setPaddingRelative(IIII)V

    .line 274
    return-void

    .line 271
    :cond_13
    invoke-virtual {v0}, Lcom/rey/material/drawable/PaddingDrawable;->getPaddingRight()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1, p4}, Lcom/rey/material/drawable/PaddingDrawable;->setPadding(IIII)V

    goto :goto_f
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 154
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 155
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 159
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 160
    return-void
.end method
