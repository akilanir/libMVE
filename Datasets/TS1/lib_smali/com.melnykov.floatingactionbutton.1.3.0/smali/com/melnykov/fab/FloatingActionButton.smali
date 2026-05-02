.class public Lcom/melnykov/fab/FloatingActionButton;
.super Landroid/widget/ImageButton;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;,
        Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;,
        Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;,
        Lcom/melnykov/fab/FloatingActionButton$TYPE;
    }
.end annotation


# static fields
.field private static final TRANSLATE_DURATION_MILLIS:I = 0xc8

.field public static final TYPE_MINI:I = 0x1

.field public static final TYPE_NORMAL:I


# instance fields
.field private mColorDisabled:I

.field private mColorNormal:I

.field private mColorPressed:I

.field private mColorRipple:I

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private mMarginsSet:Z

.field private mScrollThreshold:I

.field private mShadow:Z

.field private mShadowSize:I

.field private mType:I

.field private mVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/melnykov/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton;

    .prologue
    .line 38
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    return v0
.end method

.method static synthetic access$100(Lcom/melnykov/fab/FloatingActionButton;I)I
    .registers 3
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p1, "x1"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/melnykov/fab/FloatingActionButton;ZZZ)V
    .registers 4
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    return-void
.end method

.method private createDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 11
    .param p1, "color"    # I

    .prologue
    const/4 v1, 0x1

    .line 137
    new-instance v6, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v6}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 138
    .local v6, "ovalShape":Landroid/graphics/drawable/shapes/OvalShape;
    new-instance v8, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v8, v6}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 139
    .local v8, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v8}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    iget-boolean v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v2, :cond_46

    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v2

    if-nez v2, :cond_46

    .line 142
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v2, :cond_43

    sget v2, Lcom/melnykov/fab/R$drawable;->fab_shadow:I

    :goto_26
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 144
    .local v7, "shadowDrawable":Landroid/graphics/drawable/Drawable;
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    aput-object v7, v2, v3

    aput-object v8, v2, v1

    invoke-direct {v0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 145
    .local v0, "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v4, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 148
    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v7    # "shadowDrawable":Landroid/graphics/drawable/Drawable;
    :goto_42
    return-object v0

    .line 142
    :cond_43
    sget v2, Lcom/melnykov/fab/R$drawable;->fab_shadow_mini:I

    goto :goto_26

    :cond_46
    move-object v0, v8

    .line 148
    goto :goto_42
.end method

.method private static darkenColor(I)I
    .registers 5
    .param p0, "color"    # I

    .prologue
    .line 416
    const/4 v1, 0x3

    new-array v0, v1, [F

    .line 417
    .local v0, "hsv":[F
    invoke-static {p0, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 418
    const/4 v1, 0x2

    aget v2, v0, v1

    const v3, 0x3f666666    # 0.9f

    mul-float/2addr v2, v3

    aput v2, v0, v1

    .line 419
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    return v1
.end method

.method private getColor(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method private getDimension(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private getMarginBottom()I
    .registers 4

    .prologue
    .line 212
    const/4 v1, 0x0

    .line 213
    .local v1, "marginBottom":I
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 214
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_d

    .line 215
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 217
    :cond_d
    return v1
.end method

.method private getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;
    .param p3, "attr"    # [I

    .prologue
    const/4 v0, 0x0

    .line 153
    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    return-object v0
.end method

.method private hasHoneycombApi()Z
    .registers 3

    .prologue
    .line 412
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private hasJellyBeanApi()Z
    .registers 3

    .prologue
    .line 408
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private hasLollipopApi()Z
    .registers 3

    .prologue
    .line 404
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 93
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 94
    sget v0, Lcom/melnykov/fab/R$color;->material_blue_500:I

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 95
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-static {v0}, Lcom/melnykov/fab/FloatingActionButton;->darkenColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 96
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-static {v0}, Lcom/melnykov/fab/FloatingActionButton;->lightenColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 97
    const/high16 v0, 0x1060000

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorDisabled:I

    .line 98
    const/4 v0, 0x0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 99
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 100
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_scroll_threshold:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    .line 101
    sget v0, Lcom/melnykov/fab/R$dimen;->fab_shadow_size:I

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    .line 102
    if-eqz p2, :cond_41

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 105
    :cond_41
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 106
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 109
    sget-object v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton:[I

    invoke-direct {p0, p1, p2, v1}, Lcom/melnykov/fab/FloatingActionButton;->getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 110
    .local v0, "attr":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_51

    .line 112
    :try_start_8
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorNormal:I

    sget v2, Lcom/melnykov/fab/R$color;->material_blue_500:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 114
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorPressed:I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-static {v2}, Lcom/melnykov/fab/FloatingActionButton;->darkenColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 116
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorRipple:I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-static {v2}, Lcom/melnykov/fab/FloatingActionButton;->lightenColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 118
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorDisabled:I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorDisabled:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorDisabled:I

    .line 120
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_shadow:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 121
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_type:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I
    :try_end_4e
    .catchall {:try_start_8 .. :try_end_4e} :catchall_52

    .line 123
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 126
    :cond_51
    return-void

    .line 123
    :catchall_52
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private static lightenColor(I)I
    .registers 5
    .param p0, "color"    # I

    .prologue
    .line 423
    const/4 v1, 0x3

    new-array v0, v1, [F

    .line 424
    .local v0, "hsv":[F
    invoke-static {p0, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 425
    const/4 v1, 0x2

    aget v2, v0, v1

    const v3, 0x3f8ccccd    # 1.1f

    mul-float/2addr v2, v3

    aput v2, v0, v1

    .line 426
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    return v1
.end method

.method private setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .registers 10
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 183
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v2

    if-eqz v2, :cond_4c

    .line 185
    iget-boolean v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v2, :cond_4a

    .line 186
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getElevation()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_42

    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getElevation()F

    move-result v0

    .line 191
    .local v0, "elevation":F
    :goto_19
    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setElevation(F)V

    .line 192
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v7, [[I

    new-array v4, v6, [I

    aput-object v4, v3, v6

    new-array v4, v7, [I

    iget v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    aput v5, v4, v6

    invoke-direct {v2, v3, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 194
    .local v1, "rippleDrawable":Landroid/graphics/drawable/RippleDrawable;
    new-instance v2, Lcom/melnykov/fab/FloatingActionButton$1;

    invoke-direct {v2, p0}, Lcom/melnykov/fab/FloatingActionButton$1;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    invoke-virtual {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 202
    invoke-virtual {p0, v7}, Lcom/melnykov/fab/FloatingActionButton;->setClipToOutline(Z)V

    .line 203
    invoke-virtual {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 209
    .end local v0    # "elevation":F
    .end local v1    # "rippleDrawable":Landroid/graphics/drawable/RippleDrawable;
    :goto_41
    return-void

    .line 186
    :cond_42
    sget v2, Lcom/melnykov/fab/R$dimen;->fab_elevation_lollipop:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v2

    int-to-float v0, v2

    goto :goto_19

    .line 189
    :cond_4a
    const/4 v0, 0x0

    .restart local v0    # "elevation":F
    goto :goto_19

    .line 204
    .end local v0    # "elevation":F
    :cond_4c
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasJellyBeanApi()Z

    move-result v2

    if-eqz v2, :cond_56

    .line 205
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_41

    .line 207
    :cond_56
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_41
.end method

.method private setMarginsWithoutShadow()V
    .registers 8

    .prologue
    .line 165
    iget-boolean v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mMarginsSet:Z

    if-nez v5, :cond_33

    .line 166
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_33

    .line 167
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 168
    .local v1, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v2, v5, v6

    .line 169
    .local v2, "leftMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v4, v5, v6

    .line 170
    .local v4, "topMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v3, v5, v6

    .line 171
    .local v3, "rightMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v0, v5, v6

    .line 172
    .local v0, "bottomMargin":I
    invoke-virtual {v1, v2, v4, v3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 174
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->requestLayout()V

    .line 175
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mMarginsSet:Z

    .line 178
    .end local v0    # "bottomMargin":I
    .end local v1    # "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v2    # "leftMargin":I
    .end local v3    # "rightMargin":I
    .end local v4    # "topMargin":I
    :cond_33
    return-void
.end method

.method private toggle(ZZZ)V
    .registers 10
    .param p1, "visible"    # Z
    .param p2, "animate"    # Z
    .param p3, "force"    # Z

    .prologue
    .line 309
    iget-boolean v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    if-ne v3, p1, :cond_6

    if-eqz p3, :cond_22

    .line 310
    :cond_6
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 311
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getHeight()I

    move-result v0

    .line 312
    .local v0, "height":I
    if-nez v0, :cond_23

    if-nez p3, :cond_23

    .line 313
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 314
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 315
    new-instance v3, Lcom/melnykov/fab/FloatingActionButton$2;

    invoke-direct {v3, p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton$2;-><init>(Lcom/melnykov/fab/FloatingActionButton;ZZ)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 343
    .end local v0    # "height":I
    .end local v2    # "vto":Landroid/view/ViewTreeObserver;
    :cond_22
    :goto_22
    return-void

    .line 329
    .restart local v0    # "height":I
    :cond_23
    if-eqz p1, :cond_46

    const/4 v1, 0x0

    .line 330
    .local v1, "translationY":I
    :goto_26
    if-eqz p2, :cond_4d

    .line 331
    invoke-static {p0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v3

    iget-object v4, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v3, v4}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v3

    const-wide/16 v4, 0xc8

    invoke-virtual {v3, v4, v5}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-float v4, v1

    invoke-virtual {v3, v4}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 339
    :goto_3c
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasHoneycombApi()Z

    move-result v3

    if-nez v3, :cond_22

    .line 340
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setClickable(Z)V

    goto :goto_22

    .line 329
    .end local v1    # "translationY":I
    :cond_46
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->getMarginBottom()I

    move-result v3

    add-int v1, v0, v3

    goto :goto_26

    .line 335
    .restart local v1    # "translationY":I
    :cond_4d
    int-to-float v3, v1

    invoke-static {p0, v3}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationY(Landroid/view/View;F)V

    goto :goto_3c
.end method

.method private updateBackground()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 129
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 130
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v1, v4, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 131
    new-array v1, v4, [I

    const v2, -0x101009e

    aput v2, v1, v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorDisabled:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 132
    new-array v1, v3, [I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 133
    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 134
    return-void
.end method


# virtual methods
.method public attachToListView(Landroid/widget/AbsListView;)V
    .registers 3
    .param p1, "listView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 346
    invoke-virtual {p0, p1, v0, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/widget/AbsListView$OnScrollListener;)V

    .line 347
    return-void
.end method

.method public attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 4
    .param p1, "listView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 351
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/widget/AbsListView$OnScrollListener;)V

    .line 352
    return-void
.end method

.method public attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/widget/AbsListView$OnScrollListener;)V
    .registers 6
    .param p1, "listView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;
    .param p3, "onScrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 375
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 376
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->access$400(Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 377
    invoke-virtual {v0, p3}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 378
    invoke-virtual {v0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setListView(Landroid/widget/AbsListView;)V

    .line 379
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 380
    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 381
    return-void
.end method

.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 355
    invoke-virtual {p0, p1, v0, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 356
    return-void
.end method

.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 360
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 361
    return-void
.end method

.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionlistener"    # Lcom/melnykov/fab/ScrollDirectionListener;
    .param p3, "onScrollListener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 386
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 387
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->access$600(Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 388
    invoke-virtual {v0, p3}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 389
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 390
    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 391
    return-void
.end method

.method public attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;)V
    .registers 3
    .param p1, "scrollView"    # Lcom/melnykov/fab/ObservableScrollView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 364
    invoke-virtual {p0, p1, v0, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V

    .line 365
    return-void
.end method

.method public attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 4
    .param p1, "scrollView"    # Lcom/melnykov/fab/ObservableScrollView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 369
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V

    .line 370
    return-void
.end method

.method public attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V
    .registers 6
    .param p1, "scrollView"    # Lcom/melnykov/fab/ObservableScrollView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;
    .param p3, "onScrollChangedListener"    # Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    .prologue
    .line 396
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 397
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->access$800(Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 398
    invoke-virtual {v0, p3}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setOnScrollChangedListener(Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V

    .line 399
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 400
    invoke-virtual {p1, v0}, Lcom/melnykov/fab/ObservableScrollView;->setOnScrollChangedListener(Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V

    .line 401
    return-void
.end method

.method public getColorNormal()I
    .registers 2

    .prologue
    .line 232
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method public getColorPressed()I
    .registers 2

    .prologue
    .line 247
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    return v0
.end method

.method public getColorRipple()I
    .registers 2

    .prologue
    .line 262
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    return v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 285
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    return v0
.end method

.method public hasShadow()Z
    .registers 2

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 297
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->hide(Z)V

    .line 298
    return-void
.end method

.method public hide(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    const/4 v0, 0x0

    .line 305
    invoke-direct {p0, v0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 306
    return-void
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 289
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    return v0
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 82
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onMeasure(II)V

    .line 83
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v1, :cond_23

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_normal:I

    :goto_9
    invoke-direct {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    .line 85
    .local v0, "size":I
    iget-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v1, :cond_1f

    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 86
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 87
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->setMarginsWithoutShadow()V

    .line 89
    :cond_1f
    invoke-virtual {p0, v0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setMeasuredDimension(II)V

    .line 90
    return-void

    .line 83
    .end local v0    # "size":I
    :cond_23
    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_mini:I

    goto :goto_9
.end method

.method public setColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 221
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    if-eq p1, v0, :cond_9

    .line 222
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 223
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 225
    :cond_9
    return-void
.end method

.method public setColorNormalResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 228
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorNormal(I)V

    .line 229
    return-void
.end method

.method public setColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 236
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    if-eq p1, v0, :cond_9

    .line 237
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 238
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 240
    :cond_9
    return-void
.end method

.method public setColorPressedResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 243
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorPressed(I)V

    .line 244
    return-void
.end method

.method public setColorRipple(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 251
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    if-eq p1, v0, :cond_9

    .line 252
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 253
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 255
    :cond_9
    return-void
.end method

.method public setColorRippleResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 258
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorRipple(I)V

    .line 259
    return-void
.end method

.method public setShadow(Z)V
    .registers 3
    .param p1, "shadow"    # Z

    .prologue
    .line 266
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eq p1, v0, :cond_9

    .line 267
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 268
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 270
    :cond_9
    return-void
.end method

.method public setType(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 277
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-eq p1, v0, :cond_9

    .line 278
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 279
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 281
    :cond_9
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 293
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->show(Z)V

    .line 294
    return-void
.end method

.method public show(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 301
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 302
    return-void
.end method
