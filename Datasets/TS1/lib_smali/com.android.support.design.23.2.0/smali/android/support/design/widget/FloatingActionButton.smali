.class public Landroid/support/design/widget/FloatingActionButton;
.super Landroid/support/design/widget/VisibilityAwareImageButton;
.source "FloatingActionButton.java"


# annotations
.annotation runtime Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    value = Landroid/support/design/widget/FloatingActionButton$Behavior;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;,
        Landroid/support/design/widget/FloatingActionButton$Behavior;,
        Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "FloatingActionButton"

.field private static final SIZE_MINI:I = 0x1

.field private static final SIZE_NORMAL:I


# instance fields
.field private mBackgroundTint:Landroid/content/res/ColorStateList;

.field private mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

.field private mBorderWidth:I

.field private mCompatPadding:Z

.field private mImagePadding:I

.field private mImpl:Landroid/support/design/widget/FloatingActionButtonImpl;

.field private mRippleColor:I

.field private final mShadowPadding:Landroid/graphics/Rect;

.field private mSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 106
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 109
    invoke-direct {p0, p1, p2, p3}, Landroid/support/design/widget/VisibilityAwareImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 96
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    .line 111
    invoke-static {p1}, Landroid/support/design/widget/ThemeUtils;->checkAppCompatTheme(Landroid/content/Context;)V

    .line 113
    sget-object v4, Landroid/support/design/R$styleable;->FloatingActionButton:[I

    sget v5, Landroid/support/design/R$style;->Widget_Design_FloatingActionButton:I

    invoke-virtual {p1, p2, v4, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 116
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_backgroundTint:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTint:Landroid/content/res/ColorStateList;

    .line 117
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_backgroundTintMode:I

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/support/design/widget/FloatingActionButton;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v4

    iput-object v4, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 119
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_rippleColor:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Landroid/support/design/widget/FloatingActionButton;->mRippleColor:I

    .line 120
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_fabSize:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroid/support/design/widget/FloatingActionButton;->mSize:I

    .line 121
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_borderWidth:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroid/support/design/widget/FloatingActionButton;->mBorderWidth:I

    .line 122
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_elevation:I

    invoke-virtual {v0, v4, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 123
    .local v1, "elevation":F
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_pressedTranslationZ:I

    invoke-virtual {v0, v4, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    .line 125
    .local v3, "pressedTranslationZ":F
    sget v4, Landroid/support/design/R$styleable;->FloatingActionButton_useCompatPadding:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Landroid/support/design/widget/FloatingActionButton;->mCompatPadding:Z

    .line 126
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Landroid/support/design/R$dimen;->design_fab_image_size:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v2, v4

    .line 129
    .local v2, "maxImageSize":I
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getSizeDimension()I

    move-result v4

    sub-int/2addr v4, v2

    div-int/lit8 v4, v4, 0x2

    iput v4, p0, Landroid/support/design/widget/FloatingActionButton;->mImagePadding:I

    .line 131
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v4

    iget-object v5, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTint:Landroid/content/res/ColorStateList;

    iget-object v6, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

    iget v7, p0, Landroid/support/design/widget/FloatingActionButton;->mRippleColor:I

    iget v8, p0, Landroid/support/design/widget/FloatingActionButton;->mBorderWidth:I

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/support/design/widget/FloatingActionButtonImpl;->setBackgroundDrawable(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;II)V

    .line 133
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/support/design/widget/FloatingActionButtonImpl;->setElevation(F)V

    .line 134
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/support/design/widget/FloatingActionButtonImpl;->setPressedTranslationZ(F)V

    .line 135
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/design/widget/FloatingActionButtonImpl;->updatePadding()V

    .line 136
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V
    .registers 3
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;
    .param p1, "x1"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
    .param p2, "x2"    # Z

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/FloatingActionButton;->hide(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V

    return-void
.end method

.method static synthetic access$100(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V
    .registers 3
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;
    .param p1, "x1"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
    .param p2, "x2"    # Z

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/FloatingActionButton;->show(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/design/widget/FloatingActionButton;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;

    .prologue
    .line 58
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/design/widget/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;

    .prologue
    .line 58
    iget v0, p0, Landroid/support/design/widget/FloatingActionButton;->mImagePadding:I

    return v0
.end method

.method static synthetic access$501(Landroid/support/design/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;
    .param p1, "x1"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$600(Landroid/support/design/widget/FloatingActionButton;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/FloatingActionButton;

    .prologue
    .line 58
    iget-boolean v0, p0, Landroid/support/design/widget/FloatingActionButton;->mCompatPadding:Z

    return v0
.end method

.method private createImpl()Landroid/support/design/widget/FloatingActionButtonImpl;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 646
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 647
    .local v0, "sdk":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_12

    .line 648
    new-instance v1, Landroid/support/design/widget/FloatingActionButtonLollipop;

    new-instance v2, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;

    invoke-direct {v2, p0, v3}, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;-><init>(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$1;)V

    invoke-direct {v1, p0, v2}, Landroid/support/design/widget/FloatingActionButtonLollipop;-><init>(Landroid/support/design/widget/VisibilityAwareImageButton;Landroid/support/design/widget/ShadowViewDelegate;)V

    .line 652
    :goto_11
    return-object v1

    .line 649
    :cond_12
    const/16 v1, 0xe

    if-lt v0, v1, :cond_21

    .line 650
    new-instance v1, Landroid/support/design/widget/FloatingActionButtonIcs;

    new-instance v2, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;

    invoke-direct {v2, p0, v3}, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;-><init>(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$1;)V

    invoke-direct {v1, p0, v2}, Landroid/support/design/widget/FloatingActionButtonIcs;-><init>(Landroid/support/design/widget/VisibilityAwareImageButton;Landroid/support/design/widget/ShadowViewDelegate;)V

    goto :goto_11

    .line 652
    :cond_21
    new-instance v1, Landroid/support/design/widget/FloatingActionButtonEclairMr1;

    new-instance v2, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;

    invoke-direct {v2, p0, v3}, Landroid/support/design/widget/FloatingActionButton$ShadowDelegateImpl;-><init>(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$1;)V

    invoke-direct {v1, p0, v2}, Landroid/support/design/widget/FloatingActionButtonEclairMr1;-><init>(Landroid/support/design/widget/VisibilityAwareImageButton;Landroid/support/design/widget/ShadowViewDelegate;)V

    goto :goto_11
.end method

.method private getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;
    .registers 2

    .prologue
    .line 639
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mImpl:Landroid/support/design/widget/FloatingActionButtonImpl;

    if-nez v0, :cond_a

    .line 640
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->createImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mImpl:Landroid/support/design/widget/FloatingActionButtonImpl;

    .line 642
    :cond_a
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mImpl:Landroid/support/design/widget/FloatingActionButtonImpl;

    return-object v0
.end method

.method private hide(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V
    .registers 5
    .param p1, "listener"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "fromUser"    # Z

    .prologue
    .line 281
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-direct {p0, p1}, Landroid/support/design/widget/FloatingActionButton;->wrapOnVisibilityChangedListener(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)Landroid/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/design/widget/FloatingActionButtonImpl;->hide(Landroid/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener;Z)V

    .line 282
    return-void
.end method

.method static parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .param p0, "value"    # I
    .param p1, "defaultMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 421
    sparse-switch p0, :sswitch_data_14

    .line 433
    .end local p1    # "defaultMode":Landroid/graphics/PorterDuff$Mode;
    :goto_3
    return-object p1

    .line 423
    .restart local p1    # "defaultMode":Landroid/graphics/PorterDuff$Mode;
    :sswitch_4
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 425
    :sswitch_7
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 427
    :sswitch_a
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 429
    :sswitch_d
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 431
    :sswitch_10
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 421
    nop

    :sswitch_data_14
    .sparse-switch
        0x3 -> :sswitch_4
        0x5 -> :sswitch_7
        0x9 -> :sswitch_a
        0xe -> :sswitch_d
        0xf -> :sswitch_10
    .end sparse-switch
.end method

.method private static resolveAdjustedSize(II)I
    .registers 5
    .param p0, "desiredSize"    # I
    .param p1, "measureSpec"    # I

    .prologue
    .line 397
    move v0, p0

    .line 398
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 399
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 400
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_16

    .line 417
    :goto_c
    return v0

    .line 404
    :sswitch_d
    move v0, p0

    .line 405
    goto :goto_c

    .line 410
    :sswitch_f
    invoke-static {p0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 411
    goto :goto_c

    .line 414
    :sswitch_14
    move v0, v2

    goto :goto_c

    .line 400
    :sswitch_data_16
    .sparse-switch
        -0x80000000 -> :sswitch_f
        0x0 -> :sswitch_d
        0x40000000 -> :sswitch_14
    .end sparse-switch
.end method

.method private show(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V
    .registers 5
    .param p1, "listener"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
    .param p2, "fromUser"    # Z

    .prologue
    .line 259
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-direct {p0, p1}, Landroid/support/design/widget/FloatingActionButton;->wrapOnVisibilityChangedListener(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)Landroid/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/design/widget/FloatingActionButtonImpl;->show(Landroid/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener;Z)V

    .line 260
    return-void
.end method

.method private wrapOnVisibilityChangedListener(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)Landroid/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener;
    .registers 3
    .param p1, "listener"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 317
    if-nez p1, :cond_4

    .line 318
    const/4 v0, 0x0

    .line 321
    :goto_3
    return-object v0

    :cond_4
    new-instance v0, Landroid/support/design/widget/FloatingActionButton$1;

    invoke-direct {v0, p0, p1}, Landroid/support/design/widget/FloatingActionButton$1;-><init>(Landroid/support/design/widget/FloatingActionButton;Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)V

    goto :goto_3
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 358
    invoke-super {p0}, Landroid/support/design/widget/VisibilityAwareImageButton;->drawableStateChanged()V

    .line 359
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/FloatingActionButtonImpl;->onDrawableStateChanged([I)V

    .line 360
    return-void
.end method

.method public getBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTint:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 207
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

    return-object v0
.end method

.method public getCompatElevation()F
    .registers 2

    .prologue
    .line 623
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->getElevation()F

    move-result v0

    return v0
.end method

.method public getContentBackground()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 393
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->getContentBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getContentRect(Landroid/graphics/Rect;)Z
    .registers 5
    .param p1, "rect"    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 376
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 377
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getHeight()I

    move-result v2

    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 378
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 379
    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget-object v1, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 380
    iget v0, p1, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 381
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iget-object v1, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 382
    const/4 v0, 0x1

    .line 384
    :cond_37
    return v0
.end method

.method final getSizeDimension()I
    .registers 3

    .prologue
    .line 335
    iget v0, p0, Landroid/support/design/widget/FloatingActionButton;->mSize:I

    packed-switch v0, :pswitch_data_1c

    .line 340
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroid/support/design/R$dimen;->design_fab_size_normal:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_f
    return v0

    .line 337
    :pswitch_10
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroid/support/design/R$dimen;->design_fab_size_mini:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_f

    .line 335
    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_10
    .end packed-switch
.end method

.method public getUseCompatPadding()Z
    .registers 2

    .prologue
    .line 311
    iget-boolean v0, p0, Landroid/support/design/widget/FloatingActionButton;->mCompatPadding:Z

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 267
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/FloatingActionButton;->hide(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)V

    .line 268
    return-void
.end method

.method public hide(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 277
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/FloatingActionButton;->hide(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V

    .line 278
    return-void
.end method

.method public jumpDrawablesToCurrentState()V
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 365
    invoke-super {p0}, Landroid/support/design/widget/VisibilityAwareImageButton;->jumpDrawablesToCurrentState()V

    .line 366
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->jumpDrawableToCurrentState()V

    .line 367
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 346
    invoke-super {p0}, Landroid/support/design/widget/VisibilityAwareImageButton;->onAttachedToWindow()V

    .line 347
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->onAttachedToWindow()V

    .line 348
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 352
    invoke-super {p0}, Landroid/support/design/widget/VisibilityAwareImageButton;->onDetachedFromWindow()V

    .line 353
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->onDetachedFromWindow()V

    .line 354
    return-void
.end method

.method protected onMeasure(II)V
    .registers 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 140
    invoke-virtual {p0}, Landroid/support/design/widget/FloatingActionButton;->getSizeDimension()I

    move-result v2

    .line 142
    .local v2, "preferredSize":I
    invoke-static {v2, p1}, Landroid/support/design/widget/FloatingActionButton;->resolveAdjustedSize(II)I

    move-result v3

    .line 143
    .local v3, "w":I
    invoke-static {v2, p2}, Landroid/support/design/widget/FloatingActionButton;->resolveAdjustedSize(II)I

    move-result v1

    .line 147
    .local v1, "h":I
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 150
    .local v0, "d":I
    iget-object v4, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v0

    iget-object v5, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    iget-object v5, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v0

    iget-object v6, p0, Landroid/support/design/widget/FloatingActionButton;->mShadowPadding:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    invoke-virtual {p0, v4, v5}, Landroid/support/design/widget/FloatingActionButton;->setMeasuredDimension(II)V

    .line 153
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 237
    const-string v0, "FloatingActionButton"

    const-string v1, "Setting a custom background is not supported."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 227
    const-string v0, "FloatingActionButton"

    const-string v1, "Setting a custom background is not supported."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 4
    .param p1, "resid"    # I

    .prologue
    .line 232
    const-string v0, "FloatingActionButton"

    const-string v1, "Setting a custom background is not supported."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    return-void
.end method

.method public setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 190
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTint:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_d

    .line 191
    iput-object p1, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTint:Landroid/content/res/ColorStateList;

    .line 192
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/design/widget/FloatingActionButtonImpl;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 194
    :cond_d
    return-void
.end method

.method public setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 219
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_d

    .line 220
    iput-object p1, p0, Landroid/support/design/widget/FloatingActionButton;->mBackgroundTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 221
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/design/widget/FloatingActionButtonImpl;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 223
    :cond_d
    return-void
.end method

.method public setCompatElevation(F)V
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 635
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/design/widget/FloatingActionButtonImpl;->setElevation(F)V

    .line 636
    return-void
.end method

.method public setRippleColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 165
    iget v0, p0, Landroid/support/design/widget/FloatingActionButton;->mRippleColor:I

    if-eq v0, p1, :cond_d

    .line 166
    iput p1, p0, Landroid/support/design/widget/FloatingActionButton;->mRippleColor:I

    .line 167
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/design/widget/FloatingActionButtonImpl;->setRippleColor(I)V

    .line 169
    :cond_d
    return-void
.end method

.method public setUseCompatPadding(Z)V
    .registers 3
    .param p1, "useCompatPadding"    # Z

    .prologue
    .line 295
    iget-boolean v0, p0, Landroid/support/design/widget/FloatingActionButton;->mCompatPadding:Z

    if-eq v0, p1, :cond_d

    .line 296
    iput-boolean p1, p0, Landroid/support/design/widget/FloatingActionButton;->mCompatPadding:Z

    .line 297
    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton;->getImpl()Landroid/support/design/widget/FloatingActionButtonImpl;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButtonImpl;->onCompatShadowChanged()V

    .line 299
    :cond_d
    return-void
.end method

.method public bridge synthetic setVisibility(I)V
    .registers 2

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/support/design/widget/VisibilityAwareImageButton;->setVisibility(I)V

    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 245
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/FloatingActionButton;->show(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)V

    .line 246
    return-void
.end method

.method public show(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 255
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/FloatingActionButton;->show(Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;Z)V

    .line 256
    return-void
.end method
