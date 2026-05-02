.class public Lcom/larswerkman/holocolorpicker/ColorPicker;
.super Landroid/view/View;
.source "ColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;,
        Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;
    }
.end annotation


# static fields
.field private static final COLORS:[I

.field private static final STATE_ANGLE:Ljava/lang/String; = "angle"

.field private static final STATE_OLD_COLOR:Ljava/lang/String; = "color"

.field private static final STATE_PARENT:Ljava/lang/String; = "parent"

.field private static final STATE_SHOW_OLD_COLOR:Ljava/lang/String; = "showColor"


# instance fields
.field private mAngle:F

.field private mCenterHaloPaint:Landroid/graphics/Paint;

.field private mCenterNewColor:I

.field private mCenterNewPaint:Landroid/graphics/Paint;

.field private mCenterOldColor:I

.field private mCenterOldPaint:Landroid/graphics/Paint;

.field private mCenterRectangle:Landroid/graphics/RectF;

.field private mColor:I

.field private mColorCenterHaloRadius:I

.field private mColorCenterRadius:I

.field private mColorPointerHaloRadius:I

.field private mColorPointerRadius:I

.field private mColorWheelPaint:Landroid/graphics/Paint;

.field private mColorWheelRadius:I

.field private mColorWheelRectangle:Landroid/graphics/RectF;

.field private mColorWheelThickness:I

.field private mHSV:[F

.field private mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

.field private mPointerColor:Landroid/graphics/Paint;

.field private mPointerHaloPaint:Landroid/graphics/Paint;

.field private mPreferredColorCenterHaloRadius:I

.field private mPreferredColorCenterRadius:I

.field private mPreferredColorWheelRadius:I

.field private mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

.field private mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

.field private mShowCenterOldColor:Z

.field private mSlopX:F

.field private mSlopY:F

.field private mTouchAnywhereOnColorWheelEnabled:Z

.field private mTranslationOffset:F

.field private mUserIsMovingPointer:Z

.field private mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

.field private oldChangedListenerColor:I

.field private oldSelectedListenerColor:I

.field private onColorChangedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

.field private onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    return-void

    nop

    :array_a
    .array-data 4
        -0x10000
        -0xff01
        -0xffff01
        -0xff0001
        -0xff0100
        -0x100
        -0x10000
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 241
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 111
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRectangle:Landroid/graphics/RectF;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    .line 124
    iput-boolean v2, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 201
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    .line 206
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    .line 211
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    .line 216
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    .line 228
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    .line 242
    invoke-direct {p0, v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->init(Landroid/util/AttributeSet;I)V

    .line 243
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 246
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 111
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRectangle:Landroid/graphics/RectF;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    .line 124
    iput-boolean v2, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 201
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    .line 206
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    .line 211
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    .line 216
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    .line 228
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    .line 247
    invoke-direct {p0, p2, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->init(Landroid/util/AttributeSet;I)V

    .line 248
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 251
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 111
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRectangle:Landroid/graphics/RectF;

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    .line 124
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 201
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    .line 206
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    .line 211
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    .line 216
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    .line 228
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    .line 252
    invoke-direct {p0, p2, p3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->init(Landroid/util/AttributeSet;I)V

    .line 253
    return-void
.end method

.method private ave(IIF)I
    .registers 5
    .param p1, "s"    # I
    .param p2, "d"    # I
    .param p3, "p"    # F

    .prologue
    .line 464
    sub-int v0, p2, p1

    int-to-float v0, v0

    mul-float/2addr v0, p3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v0, p1

    return v0
.end method

.method private calculateColor(F)I
    .registers 15
    .param p1, "angle"    # F

    .prologue
    .line 476
    float-to-double v9, p1

    const-wide v11, 0x401921fb54442d18L    # 6.283185307179586

    div-double/2addr v9, v11

    double-to-float v8, v9

    .line 477
    .local v8, "unit":F
    const/4 v9, 0x0

    cmpg-float v9, v8, v9

    if-gez v9, :cond_10

    .line 478
    const/high16 v9, 0x3f800000    # 1.0f

    add-float/2addr v8, v9

    .line 481
    :cond_10
    const/4 v9, 0x0

    cmpg-float v9, v8, v9

    if-gtz v9, :cond_22

    .line 482
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    const/4 v10, 0x0

    aget v9, v9, v10

    iput v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    .line 483
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    const/4 v10, 0x0

    aget v9, v9, v10

    .line 502
    :goto_21
    return v9

    .line 485
    :cond_22
    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v9, v8, v9

    if-ltz v9, :cond_3d

    .line 486
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    sget-object v10, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    array-length v10, v10

    add-int/lit8 v10, v10, -0x1

    aget v9, v9, v10

    iput v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    .line 487
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    sget-object v10, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    array-length v10, v10

    add-int/lit8 v10, v10, -0x1

    aget v9, v9, v10

    goto :goto_21

    .line 490
    :cond_3d
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    array-length v9, v9

    add-int/lit8 v9, v9, -0x1

    int-to-float v9, v9

    mul-float v6, v8, v9

    .line 491
    .local v6, "p":F
    float-to-int v5, v6

    .line 492
    .local v5, "i":I
    int-to-float v9, v5

    sub-float/2addr v6, v9

    .line 494
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    aget v2, v9, v5

    .line 495
    .local v2, "c0":I
    sget-object v9, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    add-int/lit8 v10, v5, 0x1

    aget v3, v9, v10

    .line 496
    .local v3, "c1":I
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v9

    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    move-result v10

    invoke-direct {p0, v9, v10, v6}, Lcom/larswerkman/holocolorpicker/ColorPicker;->ave(IIF)I

    move-result v0

    .line 497
    .local v0, "a":I
    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v9

    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    move-result v10

    invoke-direct {p0, v9, v10, v6}, Lcom/larswerkman/holocolorpicker/ColorPicker;->ave(IIF)I

    move-result v7

    .line 498
    .local v7, "r":I
    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v9

    invoke-static {v3}, Landroid/graphics/Color;->green(I)I

    move-result v10

    invoke-direct {p0, v9, v10, v6}, Lcom/larswerkman/holocolorpicker/ColorPicker;->ave(IIF)I

    move-result v4

    .line 499
    .local v4, "g":I
    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v9

    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    move-result v10

    invoke-direct {p0, v9, v10, v6}, Lcom/larswerkman/holocolorpicker/ColorPicker;->ave(IIF)I

    move-result v1

    .line 501
    .local v1, "b":I
    invoke-static {v0, v7, v4, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v9

    iput v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    .line 502
    invoke-static {v0, v7, v4, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v9

    goto :goto_21
.end method

.method private calculatePointerPosition(F)[F
    .registers 8
    .param p1, "angle"    # F

    .prologue
    .line 688
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-double v2, v2

    float-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    double-to-float v0, v2

    .line 689
    .local v0, "x":F
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-double v2, v2

    float-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    double-to-float v1, v2

    .line 691
    .local v1, "y":F
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v3, 0x1

    aput v1, v2, v3

    return-object v2
.end method

.method private colorToAngle(I)F
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 578
    const/4 v1, 0x3

    new-array v0, v1, [F

    .line 579
    .local v0, "colors":[F
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 581
    const/4 v1, 0x0

    aget v1, v0, v1

    neg-float v1, v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    double-to-float v1, v1

    return v1
.end method

.method private init(Landroid/util/AttributeSet;I)V
    .registers 12
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    const/4 v8, 0x0

    const/high16 v7, -0x1000000

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 322
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker:[I

    invoke-virtual {v3, p1, v4, p2, v8}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 324
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 326
    .local v1, "b":Landroid/content/res/Resources;
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_wheel_thickness:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_wheel_thickness:I

    .line 328
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 326
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelThickness:I

    .line 329
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_wheel_radius:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_wheel_radius:I

    .line 331
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 329
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    .line 332
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorWheelRadius:I

    .line 333
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_center_radius:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_center_radius:I

    .line 335
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 333
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    .line 336
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorCenterRadius:I

    .line 337
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_center_halo_radius:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_center_halo_radius:I

    .line 339
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 337
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterHaloRadius:I

    .line 340
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterHaloRadius:I

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorCenterHaloRadius:I

    .line 341
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_pointer_radius:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_pointer_radius:I

    .line 343
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 341
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerRadius:I

    .line 344
    sget v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorPicker_color_pointer_halo_radius:I

    sget v4, Lcom/larswerkman/holocolorpicker/R$dimen;->color_pointer_halo_radius:I

    .line 346
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 344
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    .line 348
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 350
    const v3, -0x4036f025

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    .line 352
    new-instance v2, Landroid/graphics/SweepGradient;

    sget-object v3, Lcom/larswerkman/holocolorpicker/ColorPicker;->COLORS:[I

    const/4 v4, 0x0

    invoke-direct {v2, v6, v6, v3, v4}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 354
    .local v2, "s":Landroid/graphics/Shader;
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelPaint:Landroid/graphics/Paint;

    .line 355
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 356
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 357
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelThickness:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 359
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerHaloPaint:Landroid/graphics/Paint;

    .line 360
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 361
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerHaloPaint:Landroid/graphics/Paint;

    const/16 v4, 0x50

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 363
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    .line 364
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v4}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 366
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    .line 367
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v4}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 368
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 370
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    .line 371
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v4}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 372
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 374
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    .line 375
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 376
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 378
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    .line 379
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    .line 380
    iput-boolean v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    .line 381
    return-void
.end method


# virtual methods
.method public addOpacityBar(Lcom/larswerkman/holocolorpicker/OpacityBar;)V
    .registers 4
    .param p1, "bar"    # Lcom/larswerkman/holocolorpicker/OpacityBar;

    .prologue
    .line 712
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    .line 714
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    invoke-virtual {v0, p0}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V

    .line 715
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setColor(I)V

    .line 716
    return-void
.end method

.method public addSVBar(Lcom/larswerkman/holocolorpicker/SVBar;)V
    .registers 4
    .param p1, "bar"    # Lcom/larswerkman/holocolorpicker/SVBar;

    .prologue
    .line 700
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    .line 702
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    invoke-virtual {v0, p0}, Lcom/larswerkman/holocolorpicker/SVBar;->setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V

    .line 703
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->setColor(I)V

    .line 704
    return-void
.end method

.method public addSaturationBar(Lcom/larswerkman/holocolorpicker/SaturationBar;)V
    .registers 4
    .param p1, "bar"    # Lcom/larswerkman/holocolorpicker/SaturationBar;

    .prologue
    .line 719
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    .line 720
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    invoke-virtual {v0, p0}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V

    .line 721
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setColor(I)V

    .line 722
    return-void
.end method

.method public addValueBar(Lcom/larswerkman/holocolorpicker/ValueBar;)V
    .registers 4
    .param p1, "bar"    # Lcom/larswerkman/holocolorpicker/ValueBar;

    .prologue
    .line 725
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    .line 726
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    invoke-virtual {v0, p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V

    .line 727
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColor(I)V

    .line 728
    return-void
.end method

.method public changeOpacityBarColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 785
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    if-eqz v0, :cond_9

    .line 786
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    invoke-virtual {v0, p1}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setColor(I)V

    .line 788
    :cond_9
    return-void
.end method

.method public changeSaturationBarColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 797
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    if-eqz v0, :cond_9

    .line 798
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    invoke-virtual {v0, p1}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setColor(I)V

    .line 800
    :cond_9
    return-void
.end method

.method public changeValueBarColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 808
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    if-eqz v0, :cond_9

    .line 809
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    invoke-virtual {v0, p1}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColor(I)V

    .line 811
    :cond_9
    return-void
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 511
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    return v0
.end method

.method public getOldCenterColor()I
    .registers 2

    .prologue
    .line 761
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    return v0
.end method

.method public getOnColorChangedListener()Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorChangedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

    return-object v0
.end method

.method public getOnColorSelectedListener()Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    return-object v0
.end method

.method public getShowOldCenterColor()Z
    .registers 2

    .prologue
    .line 775
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    return v0
.end method

.method public getTouchAnywhereOnColorWheel()Z
    .registers 2

    .prologue
    .line 882
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    return v0
.end method

.method public hasOpacityBar()Z
    .registers 2

    .prologue
    .line 819
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasSVBar()Z
    .registers 2

    .prologue
    .line 846
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasSaturationBar()Z
    .registers 2

    .prologue
    .line 837
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasValueBar()Z
    .registers 2

    .prologue
    .line 828
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v8, 0x0

    const/high16 v3, 0x43340000    # 180.0f

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 388
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTranslationOffset:F

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTranslationOffset:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 391
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRectangle:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 393
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculatePointerPosition(F)[F

    move-result-object v6

    .line 396
    .local v6, "pointerPosition":[F
    aget v0, v6, v8

    aget v1, v6, v4

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    int-to-float v5, v5

    iget-object v7, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v5, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 401
    aget v0, v6, v8

    aget v1, v6, v4

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerRadius:I

    int-to-float v5, v5

    iget-object v7, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v5, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 405
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterHaloRadius:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 407
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    if-eqz v0, :cond_52

    .line 409
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    const/high16 v2, 0x42b40000    # 90.0f

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 412
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    const/high16 v2, 0x43870000    # 270.0f

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 418
    :goto_51
    return-void

    .line 416
    :cond_52
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    const/high16 v3, 0x43b40000    # 360.0f

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_51
.end method

.method protected onMeasure(II)V
    .registers 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, -0x80000000

    .line 422
    iget v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorWheelRadius:I

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    add-int/2addr v8, v9

    mul-int/lit8 v3, v8, 0x2

    .line 424
    .local v3, "intrinsicSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    .line 425
    .local v6, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 426
    .local v7, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 427
    .local v1, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 432
    .local v2, "heightSize":I
    if-ne v6, v11, :cond_7b

    .line 433
    move v5, v7

    .line 440
    .local v5, "width":I
    :goto_1e
    if-ne v1, v11, :cond_84

    .line 441
    move v0, v2

    .line 448
    .local v0, "height":I
    :goto_21
    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 449
    .local v4, "min":I
    invoke-virtual {p0, v4, v4}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setMeasuredDimension(II)V

    .line 450
    int-to-float v8, v4

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v8, v9

    iput v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTranslationOffset:F

    .line 453
    div-int/lit8 v8, v4, 0x2

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelThickness:I

    sub-int/2addr v8, v9

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    sub-int/2addr v8, v9

    iput v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    .line 454
    iget-object v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRectangle:Landroid/graphics/RectF;

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    neg-int v9, v9

    int-to-float v9, v9

    iget v10, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    neg-int v10, v10

    int-to-float v10, v10

    iget v11, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-float v11, v11

    iget v12, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-float v12, v12

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;->set(FFFF)V

    .line 457
    iget v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorCenterRadius:I

    int-to-float v8, v8

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-float v9, v9

    iget v10, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorWheelRadius:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    mul-float/2addr v8, v9

    float-to-int v8, v8

    iput v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    .line 458
    iget v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorCenterHaloRadius:I

    int-to-float v8, v8

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    int-to-float v9, v9

    iget v10, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPreferredColorWheelRadius:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    mul-float/2addr v8, v9

    float-to-int v8, v8

    iput v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterHaloRadius:I

    .line 459
    iget-object v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterRectangle:Landroid/graphics/RectF;

    iget v9, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    neg-int v9, v9

    int-to-float v9, v9

    iget v10, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    neg-int v10, v10

    int-to-float v10, v10

    iget v11, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    int-to-float v11, v11

    iget v12, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    int-to-float v12, v12

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;->set(FFFF)V

    .line 461
    return-void

    .line 434
    .end local v0    # "height":I
    .end local v4    # "min":I
    .end local v5    # "width":I
    :cond_7b
    if-ne v6, v10, :cond_82

    .line 435
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .restart local v5    # "width":I
    goto :goto_1e

    .line 437
    .end local v5    # "width":I
    :cond_82
    move v5, v3

    .restart local v5    # "width":I
    goto :goto_1e

    .line 442
    :cond_84
    if-ne v1, v10, :cond_8b

    .line 443
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_21

    .line 445
    .end local v0    # "height":I
    :cond_8b
    move v0, v3

    .restart local v0    # "height":I
    goto :goto_21
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 864
    move-object v1, p1

    check-cast v1, Landroid/os/Bundle;

    .line 866
    .local v1, "savedState":Landroid/os/Bundle;
    const-string v3, "parent"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    .line 867
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-super {p0, v2}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 869
    const-string v3, "angle"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    .line 870
    const-string v3, "color"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setOldCenterColor(I)V

    .line 871
    const-string v3, "showColor"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    .line 872
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v0

    .line 873
    .local v0, "currentColor":I
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 874
    invoke-virtual {p0, v0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 875
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 851
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 853
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 854
    .local v0, "state":Landroid/os/Bundle;
    const-string v2, "parent"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 855
    const-string v2, "angle"

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 856
    const-string v2, "color"

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 857
    const-string v2, "showColor"

    iget-boolean v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 859
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 586
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 589
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTranslationOffset:F

    sub-float v1, v5, v6

    .line 590
    .local v1, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTranslationOffset:F

    sub-float v2, v5, v6

    .line 592
    .local v2, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_170

    :cond_20
    :goto_20
    move v3, v4

    .line 675
    :goto_21
    return v3

    .line 595
    :pswitch_22
    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v5}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculatePointerPosition(F)[F

    move-result-object v0

    .line 596
    .local v0, "pointerPosition":[F
    aget v5, v0, v3

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    cmpl-float v5, v1, v5

    if-ltz v5, :cond_62

    aget v5, v0, v3

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    cmpg-float v5, v1, v5

    if-gtz v5, :cond_62

    aget v5, v0, v4

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    cmpl-float v5, v2, v5

    if-ltz v5, :cond_62

    aget v5, v0, v4

    iget v6, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    cmpg-float v5, v2, v5

    if-gtz v5, :cond_62

    .line 600
    aget v3, v0, v3

    sub-float v3, v1, v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSlopX:F

    .line 601
    aget v3, v0, v4

    sub-float v3, v2, v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSlopY:F

    .line 602
    iput-boolean v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 603
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    goto :goto_20

    .line 606
    :cond_62
    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    neg-int v5, v5

    int-to-float v5, v5

    cmpl-float v5, v1, v5

    if-ltz v5, :cond_96

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    int-to-float v5, v5

    cmpg-float v5, v1, v5

    if-gtz v5, :cond_96

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    neg-int v5, v5

    int-to-float v5, v5

    cmpl-float v5, v2, v5

    if-ltz v5, :cond_96

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorCenterRadius:I

    int-to-float v5, v5

    cmpg-float v5, v2, v5

    if-gtz v5, :cond_96

    iget-boolean v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    if-eqz v5, :cond_96

    .line 609
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    const/16 v5, 0x50

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 610
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getOldCenterColor()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setColor(I)V

    .line 611
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    goto :goto_20

    .line 614
    :cond_96
    mul-float v5, v1, v1

    mul-float v6, v2, v2

    add-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    iget v7, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    iget v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    add-int/2addr v7, v8

    int-to-double v7, v7

    cmpg-double v5, v5, v7

    if-gtz v5, :cond_c9

    mul-float v5, v1, v1

    mul-float v6, v2, v2

    add-float/2addr v5, v6

    float-to-double v5, v5

    .line 615
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    iget v7, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorWheelRadius:I

    iget v8, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColorPointerHaloRadius:I

    sub-int/2addr v7, v8

    int-to-double v7, v7

    cmpl-double v5, v5, v7

    if-ltz v5, :cond_c9

    iget-boolean v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    if-eqz v5, :cond_c9

    .line 617
    iput-boolean v4, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 618
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    goto/16 :goto_20

    .line 622
    :cond_c9
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_21

    .line 627
    .end local v0    # "pointerPosition":[F
    :pswitch_d2
    iget-boolean v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    if-eqz v5, :cond_12e

    .line 628
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSlopY:F

    sub-float v3, v2, v3

    float-to-double v5, v3

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSlopX:F

    sub-float v3, v1, v3

    float-to-double v7, v3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v5

    double-to-float v3, v5

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    .line 629
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v5}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 631
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v3

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    invoke-virtual {p0, v3}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 633
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    if-eqz v3, :cond_108

    .line 634
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v3, v5}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setColor(I)V

    .line 637
    :cond_108
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    if-eqz v3, :cond_113

    .line 638
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v3, v5}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColor(I)V

    .line 641
    :cond_113
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    if-eqz v3, :cond_11e

    .line 642
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v3, v5}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setColor(I)V

    .line 645
    :cond_11e
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    if-eqz v3, :cond_129

    .line 646
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v3, v5}, Lcom/larswerkman/holocolorpicker/SVBar;->setColor(I)V

    .line 649
    :cond_129
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    goto/16 :goto_20

    .line 653
    :cond_12e
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_21

    .line 658
    :pswitch_137
    iput-boolean v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mUserIsMovingPointer:Z

    .line 659
    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 661
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    if-eqz v3, :cond_153

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldSelectedListenerColor:I

    if-eq v3, v5, :cond_153

    .line 662
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    invoke-interface {v3, v5}, Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;->onColorSelected(I)V

    .line 663
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldSelectedListenerColor:I

    .line 666
    :cond_153
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    goto/16 :goto_20

    .line 669
    :pswitch_158
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    if-eqz v3, :cond_20

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldSelectedListenerColor:I

    if-eq v3, v5, :cond_20

    .line 670
    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    invoke-interface {v3, v5}, Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;->onColorSelected(I)V

    .line 671
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    iput v3, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldSelectedListenerColor:I

    goto/16 :goto_20

    .line 592
    nop

    :pswitch_data_170
    .packed-switch 0x0
        :pswitch_22
        :pswitch_137
        :pswitch_d2
        :pswitch_158
    .end packed-switch
.end method

.method public setColor(I)V
    .registers 6
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x2

    .line 526
    invoke-direct {p0, p1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->colorToAngle(I)F

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    .line 527
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mPointerColor:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mAngle:F

    invoke-direct {p0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->calculateColor(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 530
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    if-eqz v0, :cond_27

    .line 532
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setColor(I)V

    .line 533
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mOpacityBar:Lcom/larswerkman/holocolorpicker/OpacityBar;

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/OpacityBar;->setOpacity(I)V

    .line 537
    :cond_27
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    if-eqz v0, :cond_4c

    .line 539
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 540
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->setColor(I)V

    .line 545
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v0, v0, v3

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_86

    .line 546
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v3

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->setSaturation(F)V

    .line 552
    :cond_4c
    :goto_4c
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    if-eqz v0, :cond_65

    .line 553
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 554
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setColor(I)V

    .line 555
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v3

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SaturationBar;->setSaturation(F)V

    .line 558
    :cond_65
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    if-eqz v0, :cond_9c

    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSaturationBar:Lcom/larswerkman/holocolorpicker/SaturationBar;

    if-nez v0, :cond_9c

    .line 559
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 560
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColor(I)V

    .line 561
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->setValue(F)V

    .line 566
    :cond_82
    :goto_82
    invoke-virtual {p0, p1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 567
    return-void

    .line 547
    :cond_86
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v0, v0, v3

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4c

    .line 548
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mSVbar:Lcom/larswerkman/holocolorpicker/SVBar;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->setValue(F)V

    goto :goto_4c

    .line 562
    :cond_9c
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    if-eqz v0, :cond_82

    .line 563
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 564
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mValueBar:Lcom/larswerkman/holocolorpicker/ValueBar;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mHSV:[F

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->setValue(F)V

    goto :goto_82
.end method

.method public setNewCenterColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 736
    iput p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewColor:I

    .line 737
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterNewPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 738
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    if-nez v0, :cond_12

    .line 739
    iput p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    .line 740
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 742
    :cond_12
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorChangedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

    if-eqz v0, :cond_21

    iget v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldChangedListenerColor:I

    if-eq p1, v0, :cond_21

    .line 743
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorChangedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

    invoke-interface {v0, p1}, Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;->onColorChanged(I)V

    .line 744
    iput p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->oldChangedListenerColor:I

    .line 746
    :cond_21
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    .line 747
    return-void
.end method

.method public setOldCenterColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 755
    iput p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldColor:I

    .line 756
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mCenterOldPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 757
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    .line 758
    return-void
.end method

.method public setOnColorChangedListener(Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorChangedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorChangedListener;

    .line 282
    return-void
.end method

.method public setOnColorSelectedListener(Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    .prologue
    .line 299
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->onColorSelectedListener:Lcom/larswerkman/holocolorpicker/ColorPicker$OnColorSelectedListener;

    .line 300
    return-void
.end method

.method public setShowOldCenterColor(Z)V
    .registers 2
    .param p1, "show"    # Z

    .prologue
    .line 770
    iput-boolean p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mShowCenterOldColor:Z

    .line 771
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->invalidate()V

    .line 772
    return-void
.end method

.method public setTouchAnywhereOnColorWheelEnabled(Z)V
    .registers 2
    .param p1, "TouchAnywhereOnColorWheelEnabled"    # Z

    .prologue
    .line 878
    iput-boolean p1, p0, Lcom/larswerkman/holocolorpicker/ColorPicker;->mTouchAnywhereOnColorWheelEnabled:Z

    .line 879
    return-void
.end method
