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
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 70
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 75
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 76
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

    .line 131
    new-instance v6, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v6}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 132
    .local v6, "ovalShape":Landroid/graphics/drawable/shapes/OvalShape;
    new-instance v8, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v8, v6}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 133
    .local v8, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v8}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    iget-boolean v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v2, :cond_46

    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v2

    if-nez v2, :cond_46

    .line 136
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v2, :cond_43

    sget v2, Lcom/melnykov/fab/R$drawable;->shadow:I

    :goto_26
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 138
    .local v7, "shadowDrawable":Landroid/graphics/drawable/Drawable;
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    aput-object v7, v2, v3

    aput-object v8, v2, v1

    invoke-direct {v0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 139
    .local v0, "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v4, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    iget v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 142
    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v7    # "shadowDrawable":Landroid/graphics/drawable/Drawable;
    :goto_42
    return-object v0

    .line 136
    :cond_43
    sget v2, Lcom/melnykov/fab/R$drawable;->shadow_mini:I

    goto :goto_26

    :cond_46
    move-object v0, v8

    .line 142
    goto :goto_42
.end method

.method private getColor(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 151
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
    .line 155
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private getMarginBottom()I
    .registers 4

    .prologue
    .line 198
    const/4 v1, 0x0

    .line 199
    .local v1, "marginBottom":I
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 200
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_d

    .line 201
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 203
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

    .line 147
    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    return-object v0
.end method

.method private hasHoneycombApi()Z
    .registers 3

    .prologue
    .line 374
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
    .line 370
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
    .line 366
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

    .line 91
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 92
    sget v0, Lcom/melnykov/fab/R$color;->material_blue_500:I

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 93
    sget v0, Lcom/melnykov/fab/R$color;->material_blue_600:I

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 94
    const v0, 0x106000b

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 95
    const/4 v0, 0x0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 96
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 97
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_scroll_threshold:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    .line 98
    sget v0, Lcom/melnykov/fab/R$dimen;->fab_shadow_size:I

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    .line 99
    if-eqz p2, :cond_3a

    .line 100
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 102
    :cond_3a
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 103
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 106
    sget-object v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton:[I

    invoke-direct {p0, p1, p2, v1}, Lcom/melnykov/fab/FloatingActionButton;->getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 107
    .local v0, "attr":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_48

    .line 109
    :try_start_8
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorNormal:I

    sget v2, Lcom/melnykov/fab/R$color;->material_blue_500:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 111
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorPressed:I

    sget v2, Lcom/melnykov/fab/R$color;->material_blue_600:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 113
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_colorRipple:I

    const v2, 0x106000b

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 115
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_shadow:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 116
    sget v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton_fab_type:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I
    :try_end_45
    .catchall {:try_start_8 .. :try_end_45} :catchall_49

    .line 118
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    :cond_48
    return-void

    .line 118
    :catchall_49
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .registers 9
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 177
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 178
    iget-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v1, :cond_3c

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_elevation_lollipop:I

    invoke-direct {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v1

    int-to-float v1, v1

    :goto_13
    invoke-virtual {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->setElevation(F)V

    .line 179
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    new-instance v1, Landroid/content/res/ColorStateList;

    new-array v2, v6, [[I

    new-array v3, v5, [I

    aput-object v3, v2, v5

    new-array v3, v6, [I

    iget v4, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    aput v4, v3, v5

    invoke-direct {v1, v2, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 181
    .local v0, "rippleDrawable":Landroid/graphics/drawable/RippleDrawable;
    new-instance v1, Lcom/melnykov/fab/FloatingActionButton$1;

    invoke-direct {v1, p0}, Lcom/melnykov/fab/FloatingActionButton$1;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    invoke-virtual {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 188
    invoke-virtual {p0, v6}, Lcom/melnykov/fab/FloatingActionButton;->setClipToOutline(Z)V

    .line 189
    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 195
    .end local v0    # "rippleDrawable":Landroid/graphics/drawable/RippleDrawable;
    :goto_3b
    return-void

    .line 178
    :cond_3c
    const/4 v1, 0x0

    goto :goto_13

    .line 190
    :cond_3e
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasJellyBeanApi()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 191
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3b

    .line 193
    :cond_48
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3b
.end method

.method private setMarginsWithoutShadow()V
    .registers 8

    .prologue
    .line 159
    iget-boolean v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mMarginsSet:Z

    if-nez v5, :cond_33

    .line 160
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_33

    .line 161
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 162
    .local v1, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v2, v5, v6

    .line 163
    .local v2, "leftMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v4, v5, v6

    .line 164
    .local v4, "topMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v3, v5, v6

    .line 165
    .local v3, "rightMargin":I
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v6, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    sub-int v0, v5, v6

    .line 166
    .local v0, "bottomMargin":I
    invoke-virtual {v1, v2, v4, v3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 168
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->requestLayout()V

    .line 169
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/melnykov/fab/FloatingActionButton;->mMarginsSet:Z

    .line 172
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
    .line 295
    iget-boolean v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    if-ne v3, p1, :cond_6

    if-eqz p3, :cond_22

    .line 296
    :cond_6
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 297
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getHeight()I

    move-result v0

    .line 298
    .local v0, "height":I
    if-nez v0, :cond_23

    if-nez p3, :cond_23

    .line 299
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 300
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 301
    new-instance v3, Lcom/melnykov/fab/FloatingActionButton$2;

    invoke-direct {v3, p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton$2;-><init>(Lcom/melnykov/fab/FloatingActionButton;ZZ)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 329
    .end local v0    # "height":I
    .end local v2    # "vto":Landroid/view/ViewTreeObserver;
    :cond_22
    :goto_22
    return-void

    .line 315
    .restart local v0    # "height":I
    :cond_23
    if-eqz p1, :cond_46

    const/4 v1, 0x0

    .line 316
    .local v1, "translationY":I
    :goto_26
    if-eqz p2, :cond_4d

    .line 317
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

    .line 325
    :goto_3c
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasHoneycombApi()Z

    move-result v3

    if-nez v3, :cond_22

    .line 326
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setClickable(Z)V

    goto :goto_22

    .line 315
    .end local v1    # "translationY":I
    :cond_46
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->getMarginBottom()I

    move-result v3

    add-int v1, v0, v3

    goto :goto_26

    .line 321
    .restart local v1    # "translationY":I
    :cond_4d
    int-to-float v3, v1

    invoke-static {p0, v3}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationY(Landroid/view/View;F)V

    goto :goto_3c
.end method

.method private updateBackground()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 124
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 125
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 126
    new-array v1, v3, [I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 127
    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 128
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
    .line 332
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 333
    return-void
.end method

.method public attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 5
    .param p1, "listView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 344
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 345
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->access$400(Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 346
    invoke-virtual {v0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setListView(Landroid/widget/AbsListView;)V

    .line 347
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 348
    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 349
    return-void
.end method

.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 336
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 337
    return-void
.end method

.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 352
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 353
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->access$600(Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 354
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 355
    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 356
    return-void
.end method

.method public attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;)V
    .registers 3
    .param p1, "scrollView"    # Lcom/melnykov/fab/ObservableScrollView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 340
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 341
    return-void
.end method

.method public attachToScrollView(Lcom/melnykov/fab/ObservableScrollView;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 5
    .param p1, "scrollView"    # Lcom/melnykov/fab/ObservableScrollView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 359
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V

    .line 360
    .local v0, "scrollDetector":Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;
    # invokes: Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    invoke-static {v0, p2}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->access$800(Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 361
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mScrollThreshold:I

    invoke-virtual {v0, v1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setScrollThreshold(I)V

    .line 362
    invoke-virtual {p1, v0}, Lcom/melnykov/fab/ObservableScrollView;->setOnScrollChangedListener(Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V

    .line 363
    return-void
.end method

.method public getColorNormal()I
    .registers 2

    .prologue
    .line 218
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method public getColorPressed()I
    .registers 2

    .prologue
    .line 233
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    return v0
.end method

.method public getColorRipple()I
    .registers 2

    .prologue
    .line 248
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    return v0
.end method

.method public getType()I
    .registers 2
    .annotation build Lcom/melnykov/fab/FloatingActionButton$TYPE;
    .end annotation

    .prologue
    .line 271
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    return v0
.end method

.method public hasShadow()Z
    .registers 2

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 283
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->hide(Z)V

    .line 284
    return-void
.end method

.method public hide(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    const/4 v0, 0x0

    .line 291
    invoke-direct {p0, v0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 292
    return-void
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 275
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    return v0
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 80
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onMeasure(II)V

    .line 81
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v1, :cond_23

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_normal:I

    :goto_9
    invoke-direct {p0, v1}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    .line 83
    .local v0, "size":I
    iget-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v1, :cond_1f

    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->hasLollipopApi()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 84
    iget v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadowSize:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 85
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->setMarginsWithoutShadow()V

    .line 87
    :cond_1f
    invoke-virtual {p0, v0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setMeasuredDimension(II)V

    .line 88
    return-void

    .line 81
    .end local v0    # "size":I
    :cond_23
    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_mini:I

    goto :goto_9
.end method

.method public setColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 207
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    if-eq p1, v0, :cond_9

    .line 208
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 209
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 211
    :cond_9
    return-void
.end method

.method public setColorNormalResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 214
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorNormal(I)V

    .line 215
    return-void
.end method

.method public setColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 222
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    if-eq p1, v0, :cond_9

    .line 223
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 224
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 226
    :cond_9
    return-void
.end method

.method public setColorPressedResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 229
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorPressed(I)V

    .line 230
    return-void
.end method

.method public setColorRipple(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 237
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    if-eq p1, v0, :cond_9

    .line 238
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorRipple:I

    .line 239
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 241
    :cond_9
    return-void
.end method

.method public setColorRippleResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 244
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorRipple(I)V

    .line 245
    return-void
.end method

.method public setShadow(Z)V
    .registers 3
    .param p1, "shadow"    # Z

    .prologue
    .line 252
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eq p1, v0, :cond_9

    .line 253
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 254
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 256
    :cond_9
    return-void
.end method

.method public setType(I)V
    .registers 3
    .param p1, "type"    # I
        .annotation build Lcom/melnykov/fab/FloatingActionButton$TYPE;
        .end annotation
    .end param

    .prologue
    .line 263
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-eq p1, v0, :cond_9

    .line 264
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 265
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 267
    :cond_9
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 279
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->show(Z)V

    .line 280
    return-void
.end method

.method public show(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 287
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 288
    return-void
.end method
