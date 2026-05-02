.class public Lcom/rey/material/widget/ProgressView;
.super Landroid/view/View;
.source "ProgressView.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# static fields
.field public static final MODE_BUFFER:I = 0x2

.field public static final MODE_DETERMINATE:I = 0x0

.field public static final MODE_INDETERMINATE:I = 0x1

.field public static final MODE_QUERY:I = 0x3


# instance fields
.field private mAutostart:Z

.field private mCircular:Z

.field protected mCurrentStyle:I

.field private mProgressDrawable:Landroid/graphics/drawable/Drawable;

.field private mProgressId:I

.field protected mStyleId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    .line 24
    iput-boolean v1, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    .line 39
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/ProgressView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    .line 24
    iput-boolean v1, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    .line 45
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/ProgressView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    .line 24
    iput-boolean v1, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    .line 51
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/rey/material/widget/ProgressView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 52
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
    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 22
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    .line 58
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ProgressView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 59
    return-void
.end method

.method private needCreateProgress(Z)Z
    .registers 5
    .param p1, "circular"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 73
    iget-object v2, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_7

    .line 79
    :cond_6
    :goto_6
    return v0

    .line 76
    :cond_7
    if-eqz p1, :cond_11

    .line 77
    iget-object v2, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v2, v2, Lcom/rey/material/drawable/CircularProgressDrawable;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 79
    :cond_11
    iget-object v2, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v2, v2, Lcom/rey/material/drawable/LinearProgressDrawable;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 68
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 69
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/ProgressView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 70
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 83
    sget-object v9, Lcom/rey/material/R$styleable;->ProgressView:[I

    invoke-virtual {p1, p2, v9, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 85
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v6, 0x0

    .line 86
    .local v6, "progressId":I
    const/4 v7, -0x1

    .line 87
    .local v7, "progressMode":I
    const/high16 v5, -0x40800000    # -1.0f

    .line 88
    .local v5, "progress":F
    const/high16 v8, -0x40800000    # -1.0f

    .line 90
    .local v8, "secondaryProgress":F
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .local v2, "count":I
    :goto_11
    if-ge v3, v2, :cond_59

    .line 91
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 93
    .local v1, "attr":I
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_autostart:I

    if-ne v1, v9, :cond_25

    .line 94
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v9

    iput-boolean v9, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    .line 90
    :cond_22
    :goto_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 95
    :cond_25
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_circular:I

    if-ne v1, v9, :cond_31

    .line 96
    const/4 v9, 0x1

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v9

    iput-boolean v9, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    goto :goto_22

    .line 97
    :cond_31
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_progressStyle:I

    if-ne v1, v9, :cond_3b

    .line 98
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    goto :goto_22

    .line 99
    :cond_3b
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_progressMode:I

    if-ne v1, v9, :cond_45

    .line 100
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    goto :goto_22

    .line 101
    :cond_45
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_progress:I

    if-ne v1, v9, :cond_4f

    .line 102
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    goto :goto_22

    .line 103
    :cond_4f
    sget v9, Lcom/rey/material/R$styleable;->ProgressView_pv_secondaryProgress:I

    if-ne v1, v9, :cond_22

    .line 104
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v8

    goto :goto_22

    .line 107
    .end local v1    # "attr":I
    :cond_59
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 109
    const/4 v4, 0x0

    .line 111
    .local v4, "needStart":Z
    iget-boolean v9, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    invoke-direct {p0, v9}, Lcom/rey/material/widget/ProgressView;->needCreateProgress(Z)Z

    move-result v9

    if-eqz v9, :cond_ce

    .line 112
    iput v6, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    .line 113
    iget v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    if-nez v9, :cond_73

    .line 114
    iget-boolean v9, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v9, :cond_bd

    sget v9, Lcom/rey/material/R$style;->Material_Drawable_CircularProgress:I

    :goto_71
    iput v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    .line 116
    :cond_73
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v9, :cond_c0

    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v9, Landroid/graphics/drawable/Animatable;

    invoke-interface {v9}, Landroid/graphics/drawable/Animatable;->isRunning()Z

    move-result v9

    if-eqz v9, :cond_c0

    const/4 v4, 0x1

    .line 117
    :goto_82
    iget-boolean v9, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v9, :cond_c2

    new-instance v9, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    iget v10, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    invoke-direct {v9, p1, v10}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v9}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->build()Lcom/rey/material/drawable/CircularProgressDrawable;

    move-result-object v9

    :goto_91
    iput-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    .line 118
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, v9}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 128
    :cond_98
    :goto_98
    if-ltz v7, :cond_a7

    .line 129
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v9, v9, Lcom/rey/material/drawable/CircularProgressDrawable;

    if-eqz v9, :cond_ee

    .line 130
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v9, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v9, v7}, Lcom/rey/material/drawable/CircularProgressDrawable;->setProgressMode(I)V

    .line 135
    :cond_a7
    :goto_a7
    const/4 v9, 0x0

    cmpl-float v9, v5, v9

    if-ltz v9, :cond_af

    .line 136
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/ProgressView;->setProgress(F)V

    .line 138
    :cond_af
    const/4 v9, 0x0

    cmpl-float v9, v8, v9

    if-ltz v9, :cond_b7

    .line 139
    invoke-virtual {p0, v8}, Lcom/rey/material/widget/ProgressView;->setSecondaryProgress(F)V

    .line 141
    :cond_b7
    if-eqz v4, :cond_bc

    .line 142
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->start()V

    .line 143
    :cond_bc
    return-void

    .line 114
    :cond_bd
    sget v9, Lcom/rey/material/R$style;->Material_Drawable_LinearProgress:I

    goto :goto_71

    .line 116
    :cond_c0
    const/4 v4, 0x0

    goto :goto_82

    .line 117
    :cond_c2
    new-instance v9, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    iget v10, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    invoke-direct {v9, p1, v10}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v9}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->build()Lcom/rey/material/drawable/LinearProgressDrawable;

    move-result-object v9

    goto :goto_91

    .line 120
    :cond_ce
    iget v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    if-eq v9, v6, :cond_98

    .line 121
    iput v6, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    .line 122
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v9, v9, Lcom/rey/material/drawable/CircularProgressDrawable;

    if-eqz v9, :cond_e4

    .line 123
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v9, Lcom/rey/material/drawable/CircularProgressDrawable;

    iget v10, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    invoke-virtual {v9, p1, v10}, Lcom/rey/material/drawable/CircularProgressDrawable;->applyStyle(Landroid/content/Context;I)V

    goto :goto_98

    .line 125
    :cond_e4
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v9, Lcom/rey/material/drawable/LinearProgressDrawable;

    iget v10, p0, Lcom/rey/material/widget/ProgressView;->mProgressId:I

    invoke-virtual {v9, p1, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->applyStyle(Landroid/content/Context;I)V

    goto :goto_98

    .line 132
    :cond_ee
    iget-object v9, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v9, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v9, v7}, Lcom/rey/material/drawable/LinearProgressDrawable;->setProgressMode(I)V

    goto :goto_a7
.end method

.method public getProgress()F
    .registers 2

    .prologue
    .line 201
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v0, :cond_d

    .line 202
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getProgress()F

    move-result v0

    .line 204
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getProgress()F

    move-result v0

    goto :goto_c
.end method

.method public getProgressMode()I
    .registers 2

    .prologue
    .line 191
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v0, :cond_d

    .line 192
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getProgressMode()I

    move-result v0

    .line 194
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getProgressMode()I

    move-result v0

    goto :goto_c
.end method

.method public getSecondaryProgress()F
    .registers 2

    .prologue
    .line 211
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v0, :cond_d

    .line 212
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getSecondaryProgress()F

    move-result v0

    .line 214
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getSecondaryProgress()F

    move-result v0

    goto :goto_c
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 62
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ProgressView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 63
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_f

    .line 64
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mStyleId:I

    .line 65
    :cond_f
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 171
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 172
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    if-eqz v0, :cond_10

    .line 173
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->start()V

    .line 174
    :cond_10
    iget v0, p0, Lcom/rey/material/widget/ProgressView;->mStyleId:I

    if-eqz v0, :cond_1f

    .line 175
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 176
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ProgressView;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 178
    :cond_1f
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 182
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    if-eqz v0, :cond_7

    .line 183
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->stop()V

    .line 185
    :cond_7
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 186
    iget v0, p0, Lcom/rey/material/widget/ProgressView;->mStyleId:I

    if-eqz v0, :cond_15

    .line 187
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 188
    :cond_15
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 147
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/ProgressView;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 148
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 149
    iput v0, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    .line 150
    iget v1, p0, Lcom/rey/material/widget/ProgressView;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/ProgressView;->applyStyle(I)V

    .line 152
    :cond_15
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 4
    .param p1, "changedView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visibility"    # I

    .prologue
    .line 156
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 158
    if-eq p1, p0, :cond_6

    .line 167
    :cond_5
    :goto_5
    return-void

    .line 161
    :cond_6
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mAutostart:Z

    if-eqz v0, :cond_5

    .line 162
    const/16 v0, 0x8

    if-eq p2, v0, :cond_11

    const/4 v0, 0x4

    if-ne p2, v0, :cond_15

    .line 163
    :cond_11
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->stop()V

    goto :goto_5

    .line 165
    :cond_15
    invoke-virtual {p0}, Lcom/rey/material/widget/ProgressView;->start()V

    goto :goto_5
.end method

.method public setProgress(F)V
    .registers 3
    .param p1, "percent"    # F

    .prologue
    .line 222
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v0, :cond_c

    .line 223
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/CircularProgressDrawable;->setProgress(F)V

    .line 226
    :goto_b
    return-void

    .line 225
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->setProgress(F)V

    goto :goto_b
.end method

.method public setSecondaryProgress(F)V
    .registers 3
    .param p1, "percent"    # F

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/rey/material/widget/ProgressView;->mCircular:Z

    if-eqz v0, :cond_c

    .line 234
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/CircularProgressDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/CircularProgressDrawable;->setSecondaryProgress(F)V

    .line 237
    :goto_b
    return-void

    .line 236
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LinearProgressDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->setSecondaryProgress(F)V

    goto :goto_b
.end method

.method public start()V
    .registers 2

    .prologue
    .line 243
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    .line 244
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 245
    :cond_b
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    .line 252
    iget-object v0, p0, Lcom/rey/material/widget/ProgressView;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 253
    :cond_b
    return-void
.end method
