.class public Lcom/mikepenz/iconics/view/IconicsImageView;
.super Landroid/widget/ImageView;
.source "IconicsImageView.java"


# instance fields
.field private mBackgroundColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private mColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private mContourColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

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
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
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

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 36
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 38
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 39
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 40
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 42
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 43
    iput v4, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 45
    iput v3, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 57
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_6a

    .line 59
    sget-object v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView:[I

    invoke-virtual {p1, p2, v2, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 60
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "icon":Ljava/lang/String;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 64
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_size:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    .line 65
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_padding:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 66
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_contour_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 67
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_contour_width:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 68
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_background_color:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 69
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_corner_radius:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 72
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 78
    if-nez v1, :cond_6b

    .line 92
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "icon":Ljava/lang/String;
    :cond_6a
    :goto_6a
    return-void

    .line 84
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v1    # "icon":Ljava/lang/String;
    :cond_6b
    new-instance v2, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-direct {v2, p1, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 87
    invoke-direct {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setAttributes()V

    .line 90
    iget-object v2, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6a
.end method

.method private setAttributes()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 141
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    if-eqz v0, :cond_c

    .line 142
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 144
    :cond_c
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    if-eq v0, v2, :cond_17

    .line 145
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mSize:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 147
    :cond_17
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    if-eq v0, v2, :cond_22

    .line 148
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 150
    :cond_22
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    if-eqz v0, :cond_2d

    .line 151
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 153
    :cond_2d
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    if-eq v0, v2, :cond_38

    .line 154
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 156
    :cond_38
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    if-eqz v0, :cond_43

    .line 157
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 159
    :cond_43
    iget v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    if-eq v0, v2, :cond_4e

    .line 160
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    iget v1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 162
    :cond_4e
    return-void
.end method


# virtual methods
.method public getIcon()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 270
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_f

    .line 271
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    .line 273
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    goto :goto_e
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 236
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 238
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 239
    return-void
.end method

.method public setBackgroundColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 243
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 245
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mBackgroundColor:I

    .line 246
    return-void
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 166
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 168
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 169
    return-void
.end method

.method public setColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

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

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 175
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mColor:I

    .line 176
    return-void
.end method

.method public setContourColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 200
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 201
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 203
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 204
    return-void
.end method

.method public setContourColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 207
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 208
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 210
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourColor:I

    .line 211
    return-void
.end method

.method public setContourWidthDp(I)V
    .registers 4
    .param p1, "contourWidthDp"    # I

    .prologue
    .line 221
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 222
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 224
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 225
    return-void
.end method

.method public setContourWidthPx(I)V
    .registers 3
    .param p1, "contourWidth"    # I

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

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 217
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 218
    return-void
.end method

.method public setContourWidthRes(I)V
    .registers 3
    .param p1, "contourWidthRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 229
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 231
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mContourWidth:I

    .line 232
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/IconicsDrawable;)V
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/IconicsDrawable;

    .prologue
    .line 119
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 120
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V
    .registers 4
    .param p1, "icon"    # Lcom/mikepenz/iconics/IconicsDrawable;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 123
    iput-object p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 125
    if-eqz p2, :cond_7

    .line 126
    invoke-direct {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setAttributes()V

    .line 129
    :cond_7
    iget-object v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mIcon:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 111
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/typeface/IIcon;Z)V

    .line 112
    return-void
.end method

.method public setIcon(Lcom/mikepenz/iconics/typeface/IIcon;Z)V
    .registers 5
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 115
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 116
    return-void
.end method

.method public setIcon(Ljava/lang/Character;)V
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 95
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Ljava/lang/Character;Z)V

    .line 96
    return-void
.end method

.method public setIcon(Ljava/lang/Character;Z)V
    .registers 5
    .param p1, "icon"    # Ljava/lang/Character;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 99
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/Character;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 100
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .registers 3
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Ljava/lang/String;Z)V

    .line 104
    return-void
.end method

.method public setIcon(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "icon"    # Ljava/lang/String;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 107
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 108
    return-void
.end method

.method public setIconText(Ljava/lang/String;)V
    .registers 3
    .param p1, "iconText"    # Ljava/lang/String;

    .prologue
    .line 133
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIconText(Ljava/lang/String;Z)V

    .line 134
    return-void
.end method

.method public setIconText(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "iconText"    # Ljava/lang/String;
    .param p2, "resetAttributes"    # Z

    .prologue
    .line 137
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/view/IconicsImageView;->setIcon(Lcom/mikepenz/iconics/IconicsDrawable;Z)V

    .line 138
    return-void
.end method

.method public setPaddingDp(I)V
    .registers 4
    .param p1, "paddingDp"    # I

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 187
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 189
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 190
    return-void
.end method

.method public setPaddingPx(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 180
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 182
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 183
    return-void
.end method

.method public setPaddingRes(I)V
    .registers 3
    .param p1, "paddingRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 194
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 196
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mPadding:I

    .line 197
    return-void
.end method

.method public setRoundedCornersDp(I)V
    .registers 4
    .param p1, "cornerRadiusDp"    # I

    .prologue
    .line 256
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 257
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 259
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 260
    return-void
.end method

.method public setRoundedCornersPx(I)V
    .registers 3
    .param p1, "cornerRadius"    # I

    .prologue
    .line 249
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 250
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 252
    :cond_11
    iput p1, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 253
    return-void
.end method

.method public setRoundedCornersRes(I)V
    .registers 3
    .param p1, "cornerRadiusRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 263
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/IconicsDrawable;

    if-eqz v0, :cond_11

    .line 264
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 266
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/view/IconicsImageView;->mCornerRadius:I

    .line 267
    return-void
.end method
