.class public Lcom/shamanland/fab/FloatingActionButton;
.super Landroid/widget/ImageButton;
.source "FloatingActionButton.java"


# static fields
.field public static final SIZE_MINI:I = 0x1

.field public static final SIZE_NORMAL:I


# instance fields
.field private mCircleDrawable:Landroid/graphics/drawable/GradientDrawable;

.field private mColor:I

.field private mColorStateList:Landroid/content/res/ColorStateList;

.field private mSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    invoke-direct {p0, p1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 142
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/shamanland/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 143
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 146
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 147
    sget v0, Lcom/shamanland/fab/R$attr;->floatingActionButtonStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/shamanland/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 148
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 151
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 152
    invoke-direct {p0, p1, p2, p3}, Lcom/shamanland/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 153
    return-void
.end method

.method protected static getShadowRadius(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)I
    .registers 7
    .param p0, "shadow"    # Landroid/graphics/drawable/Drawable;
    .param p1, "circle"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 259
    const/4 v0, 0x0

    .line 261
    .local v0, "radius":I
    if-eqz p0, :cond_1c

    if-eqz p1, :cond_1c

    .line 262
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 263
    .local v1, "rect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_22

    iget v2, v1, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v4

    :goto_19
    add-int/2addr v2, v3

    div-int/lit8 v0, v2, 0x2

    .line 266
    .end local v1    # "rect":Landroid/graphics/Rect;
    :cond_1c
    const/4 v2, 0x1

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    return v2

    .line 263
    .restart local v1    # "rect":Landroid/graphics/Rect;
    :cond_22
    const/4 v2, 0x0

    goto :goto_19
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    const v4, -0x777778

    .line 159
    :try_start_5
    invoke-virtual {p0}, Lcom/shamanland/fab/FloatingActionButton;->isInEditMode()Z
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_49

    move-result v2

    if-eqz v2, :cond_12

    .line 177
    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 189
    :goto_11
    return-void

    .line 163
    :cond_12
    if-nez p2, :cond_1b

    .line 177
    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    goto :goto_11

    .line 167
    :cond_1b
    :try_start_1b
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_49

    move-result-object v1

    .line 168
    .local v1, "theme":Landroid/content/res/Resources$Theme;
    if-nez v1, :cond_28

    .line 177
    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    goto :goto_11

    .line 172
    :cond_28
    :try_start_28
    sget-object v2, Lcom/shamanland/fab/R$styleable;->FloatingActionButton:[I

    sget v3, Lcom/shamanland/fab/R$style;->FloatingActionButton_Dark:I

    invoke-virtual {v1, p2, v2, p3, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_49

    move-result-object v0

    .line 173
    .local v0, "a":Landroid/content/res/TypedArray;
    if-nez v0, :cond_39

    .line 177
    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    goto :goto_11

    .line 177
    :cond_39
    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 183
    :try_start_3f
    invoke-direct {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->initAttrs(Landroid/content/res/TypedArray;)V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_51

    .line 185
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 188
    invoke-virtual {p0}, Lcom/shamanland/fab/FloatingActionButton;->initBackground()V

    goto :goto_11

    .line 177
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "theme":Landroid/content/res/Resources$Theme;
    :catchall_49
    move-exception v2

    iput v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 178
    iput v4, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 179
    iput-object v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    throw v2

    .line 185
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v1    # "theme":Landroid/content/res/Resources$Theme;
    :catchall_51
    move-exception v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v2
.end method

.method private initAttrs(Landroid/content/res/TypedArray;)V
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;

    .prologue
    const/4 v1, 0x0

    .line 192
    const/4 v0, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->setSize(I)V

    .line 193
    const v0, -0x777778

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->setColor(I)V

    .line 194
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->setColorStateList(Landroid/content/res/ColorStateList;)V

    .line 195
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 5

    .prologue
    .line 241
    invoke-super {p0}, Landroid/widget/ImageButton;->drawableStateChanged()V

    .line 243
    iget-object v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mCircleDrawable:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1f

    .line 244
    iget-object v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mCircleDrawable:Landroid/graphics/drawable/GradientDrawable;

    iget-object v1, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/shamanland/fab/FloatingActionButton;->getDrawableState()[I

    move-result-object v2

    iget v3, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 247
    invoke-virtual {p0}, Lcom/shamanland/fab/FloatingActionButton;->invalidate()V

    .line 249
    :cond_1f
    return-void
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 106
    iget v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    return v0
.end method

.method public getColorStateList()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    return v0
.end method

.method public initBackground()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    .line 206
    iget v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    if-ne v5, v7, :cond_55

    .line 207
    sget v1, Lcom/shamanland/fab/R$drawable;->com_shamanland_fab_circle_mini:I

    .line 212
    .local v1, "backgroundId":I
    :goto_7
    invoke-virtual {p0}, Lcom/shamanland/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 214
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v5, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v5, :cond_4b

    move-object v3, v0

    .line 215
    check-cast v3, Landroid/graphics/drawable/LayerDrawable;

    .line 216
    .local v3, "layers":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v3}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4b

    .line 217
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 218
    .local v4, "shadow":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v3, v7}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 220
    .local v2, "circle":Landroid/graphics/drawable/Drawable;
    instance-of v5, v4, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v5, :cond_38

    .line 221
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    check-cast v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-static {v4, v2}, Lcom/shamanland/fab/FloatingActionButton;->getShadowRadius(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setGradientRadius(F)V

    .line 224
    :cond_38
    instance-of v5, v2, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v5, :cond_4b

    .line 225
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    check-cast v5, Landroid/graphics/drawable/GradientDrawable;

    iput-object v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mCircleDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 226
    iget-object v5, p0, Lcom/shamanland/fab/FloatingActionButton;->mCircleDrawable:Landroid/graphics/drawable/GradientDrawable;

    iget v6, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 231
    .end local v2    # "circle":Landroid/graphics/drawable/Drawable;
    .end local v3    # "layers":Landroid/graphics/drawable/LayerDrawable;
    .end local v4    # "shadow":Landroid/graphics/drawable/Drawable;
    :cond_4b
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-ge v5, v6, :cond_58

    .line 233
    invoke-virtual {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 237
    :goto_54
    return-void

    .line 209
    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    .end local v1    # "backgroundId":I
    :cond_55
    sget v1, Lcom/shamanland/fab/R$drawable;->com_shamanland_fab_circle_normal:I

    .restart local v1    # "backgroundId":I
    goto :goto_7

    .line 235
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_58
    invoke-virtual {p0, v0}, Lcom/shamanland/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_54
.end method

.method public setColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 117
    iput p1, p0, Lcom/shamanland/fab/FloatingActionButton;->mColor:I

    .line 118
    return-void
.end method

.method public setColorStateList(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/shamanland/fab/FloatingActionButton;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 138
    return-void
.end method

.method public setSize(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 97
    iput p1, p0, Lcom/shamanland/fab/FloatingActionButton;->mSize:I

    .line 98
    return-void
.end method
