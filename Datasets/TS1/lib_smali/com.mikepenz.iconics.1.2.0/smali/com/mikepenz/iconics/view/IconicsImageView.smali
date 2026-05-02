.class public Lcom/mikepenz/iconics/view/IconicsImageView;
.super Landroid/widget/ImageView;
.source "IconicsImageView.java"


# instance fields
.field private mColor:I

.field private mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

.field private mPadding:I

.field private mSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 31
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 32
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 33
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 46
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_22

    .line 48
    sget-object v2, Lcom/mikepenz/iconics/R$styleable;->IconicsImageView:[I

    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 49
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/iconics/R$styleable;->IconicsImageView_iiv_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 50
    .local v1, "icon":Ljava/lang/String;
    if-nez v1, :cond_23

    .line 75
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "icon":Ljava/lang/String;
    :cond_22
    :goto_22
    return-void

    .line 53
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v1    # "icon":Ljava/lang/String;
    :cond_23
    sget v2, Lcom/mikepenz/iconics/R$styleable;->IconicsImageView_iiv_color:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 54
    sget v2, Lcom/mikepenz/iconics/R$styleable;->IconicsImageView_iiv_size:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 55
    sget v2, Lcom/mikepenz/iconics/R$styleable;->IconicsImageView_iiv_padding:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 58
    new-instance v2, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-direct {v2, p1, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 59
    iget v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    if-eqz v2, :cond_4d

    .line 60
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    invoke-virtual {v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 62
    :cond_4d
    iget v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    if-eq v2, v4, :cond_58

    .line 63
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    invoke-virtual {v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 65
    :cond_58
    iget v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    if-eq v2, v4, :cond_63

    .line 66
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    invoke-virtual {v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 69
    :cond_63
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 72
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 73
    sget-object v2, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_22
.end method


# virtual methods
.method public getIcon()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_f

    .line 107
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    .line 109
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldW"    # I
    .param p4, "oldH"    # I

    .prologue
    .line 114
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->onSizeChanged(IIII)V

    .line 115
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_16

    .line 117
    if-le p1, p2, :cond_17

    .line 118
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 123
    :cond_16
    :goto_16
    return-void

    .line 120
    :cond_17
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    goto :goto_16
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 95
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 97
    :cond_11
    return-void
.end method

.method public setColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 101
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 103
    :cond_11
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/IconicsDrawable;)V
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/IconicsDrawable;

    .prologue
    .line 86
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    if-eqz v0, :cond_9

    .line 87
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    invoke-virtual {p1, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 89
    :cond_9
    iput-object p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 90
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 4
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 82
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;)V

    .line 83
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .registers 4
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 78
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;)V

    .line 79
    return-void
.end method
