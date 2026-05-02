.class public Lcom/mikepenz/iconics/view/IconicsImageView;
.super Landroid/widget/ImageView;
.source "IconicsImageView.java"


# instance fields
.field private mBackgroundColor:I

.field private mColor:I

.field private mContourColor:I

.field private mContourWidth:I

.field private mCornerRadius:I

.field private mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

.field private mPadding:I

.field private mSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 51
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 34
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 35
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 36
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 37
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 38
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 39
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 40
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 52
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_6a

    .line 54
    sget-object v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView:[I

    invoke-virtual {p1, p2, v2, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 55
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "icon":Ljava/lang/String;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 59
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_size:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 60
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_padding:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 61
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_contour_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 62
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_contour_width:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 63
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_background_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 64
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_corner_radius:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 67
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 70
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 73
    if-nez v1, :cond_6b

    .line 87
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "icon":Ljava/lang/String;
    :cond_6a
    :goto_6a
    return-void

    .line 79
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v1    # "icon":Ljava/lang/String;
    :cond_6b
    new-instance v2, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-direct {v2, p1, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 82
    invoke-direct {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setAttributes()V

    .line 85
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6a
.end method

.method private setAttributes()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 136
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    if-eqz v0, :cond_c

    .line 137
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 139
    :cond_c
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    if-eq v0, v2, :cond_17

    .line 140
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 142
    :cond_17
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    if-eq v0, v2, :cond_22

    .line 143
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 145
    :cond_22
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    if-eqz v0, :cond_2d

    .line 146
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 148
    :cond_2d
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    if-eq v0, v2, :cond_38

    .line 149
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 151
    :cond_38
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    if-eqz v0, :cond_43

    .line 152
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 154
    :cond_43
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    if-eq v0, v2, :cond_4e

    .line 155
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 157
    :cond_4e
    return-void
.end method


# virtual methods
.method public getIcon()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_f

    .line 251
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    .line 253
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 221
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 223
    :cond_11
    return-void
.end method

.method public setBackgroundColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 226
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 227
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 229
    :cond_11
    return-void
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 160
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 161
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 163
    :cond_11
    return-void
.end method

.method public setColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 167
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 169
    :cond_11
    return-void
.end method

.method public setContourColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 190
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 191
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 193
    :cond_11
    return-void
.end method

.method public setContourColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 196
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 197
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 199
    :cond_11
    return-void
.end method

.method public setContourWidthDp(I)V
    .registers 3
    .param p1, "paddingDp"    # I

    .prologue
    .line 208
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 209
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 211
    :cond_11
    return-void
.end method

.method public setContourWidthPx(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 203
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 205
    :cond_11
    return-void
.end method

.method public setContourWidthRes(I)V
    .registers 3
    .param p1, "paddingRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 215
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 217
    :cond_11
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/IconicsDrawable;)V
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/IconicsDrawable;

    .prologue
    .line 114
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 115
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V
    .registers 4
    .param p1, "icon"    # Lcom/mikepenz/iconics/IconicsDrawable;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 118
    iput-object p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 120
    if-eqz p2, :cond_7

    .line 121
    invoke-direct {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setAttributes()V

    .line 124
    :cond_7
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 125
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/typeface/IIcon;Z)V

    .line 107
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/typeface/IIcon;Z)V
    .registers 5
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 110
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 111
    return-void
.end method

.method public setIcon(Ljava/lang/Character;)V
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 90
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Ljava/lang/Character;Z)V

    .line 91
    return-void
.end method

.method public setIcon(Ljava/lang/Character;Z)V
    .registers 5
    .param p1, "icon"    # Ljava/lang/Character;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 94
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/Character;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 95
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .registers 3
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Ljava/lang/String;Z)V

    .line 99
    return-void
.end method

.method public setIcon(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "icon"    # Ljava/lang/String;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 102
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 103
    return-void
.end method

.method public setIconText(Ljava/lang/String;)V
    .registers 3
    .param p1, "iconText"    # Ljava/lang/String;

    .prologue
    .line 128
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIconText(Ljava/lang/String;Z)V

    .line 129
    return-void
.end method

.method public setIconText(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "iconText"    # Ljava/lang/String;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 132
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 133
    return-void
.end method

.method public setPaddingDp(I)V
    .registers 3
    .param p1, "paddingDp"    # I

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 179
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 181
    :cond_11
    return-void
.end method

.method public setPaddingPx(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 172
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 173
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 175
    :cond_11
    return-void
.end method

.method public setPaddingRes(I)V
    .registers 3
    .param p1, "paddingRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 184
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 185
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 187
    :cond_11
    return-void
.end method

.method public setRoundedCornersDp(I)V
    .registers 3
    .param p1, "paddingDp"    # I

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 239
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 241
    :cond_11
    return-void
.end method

.method public setRoundedCornersPx(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 233
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 235
    :cond_11
    return-void
.end method

.method public setRoundedCornersRes(I)V
    .registers 3
    .param p1, "paddingRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 245
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 247
    :cond_11
    return-void
.end method
