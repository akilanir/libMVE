.class public Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;
.super Landroid/widget/ImageView;
.source "PreferenceImageView.java"


# instance fields
.field private mMaxHeight:I

.field private mMaxWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const v3, 0x7fffffff

    .line 51
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    iput v3, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxWidth:I

    .line 37
    iput v3, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxHeight:I

    .line 53
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->PreferenceImageView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 56
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->PreferenceImageView_maxWidth:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->setMaxWidth(I)V

    .line 59
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->PreferenceImageView_maxHeight:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->setMaxHeight(I)V

    .line 62
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    return-void
.end method


# virtual methods
.method public getMaxHeight()I
    .registers 2

    .prologue
    .line 91
    iget v0, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxHeight:I

    return v0
.end method

.method public getMaxWidth()I
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxWidth:I

    return v0
.end method

.method protected onMeasure(II)V
    .registers 11
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const v7, 0x7fffffff

    const/high16 v6, -0x80000000

    .line 97
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 98
    .local v4, "widthMode":I
    if-eq v4, v6, :cond_d

    if-nez v4, :cond_1f

    .line 100
    :cond_d
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 101
    .local v5, "widthSize":I
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->getMaxWidth()I

    move-result v3

    .line 102
    .local v3, "maxWidth":I
    if-eq v3, v7, :cond_1f

    if-lt v3, v5, :cond_1b

    if-nez v4, :cond_1f

    .line 105
    :cond_1b
    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 109
    .end local v3    # "maxWidth":I
    .end local v5    # "widthSize":I
    :cond_1f
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 110
    .local v0, "heightMode":I
    if-eq v0, v6, :cond_27

    if-nez v0, :cond_39

    .line 112
    :cond_27
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 113
    .local v1, "heightSize":I
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->getMaxHeight()I

    move-result v2

    .line 114
    .local v2, "maxHeight":I
    if-eq v2, v7, :cond_39

    if-lt v2, v1, :cond_35

    if-nez v0, :cond_39

    .line 117
    :cond_35
    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 121
    .end local v1    # "heightSize":I
    .end local v2    # "maxHeight":I
    :cond_39
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 122
    return-void
.end method

.method public setMaxHeight(I)V
    .registers 2
    .param p1, "maxHeight"    # I

    .prologue
    .line 85
    iput p1, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxHeight:I

    .line 86
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setMaxHeight(I)V

    .line 87
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 2
    .param p1, "maxWidth"    # I

    .prologue
    .line 73
    iput p1, p0, Lcom/lb/material_preferences_library/internal/widget/PreferenceImageView;->mMaxWidth:I

    .line 74
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setMaxWidth(I)V

    .line 75
    return-void
.end method
