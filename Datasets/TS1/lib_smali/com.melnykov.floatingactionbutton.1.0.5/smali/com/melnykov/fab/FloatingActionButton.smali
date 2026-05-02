.class public Lcom/melnykov/fab/FloatingActionButton;
.super Landroid/widget/ImageButton;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;,
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

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field protected mListView:Landroid/widget/AbsListView;

.field private mOnScrollListener:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

.field private mShadow:Z

.field private mType:I

.field private mVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 63
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/melnykov/fab/FloatingActionButton;ZZZ)V
    .registers 4
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    return-void
.end method

.method private createDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 11
    .param p1, "color"    # I

    .prologue
    const/4 v1, 0x1

    .line 114
    new-instance v6, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v6}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 115
    .local v6, "ovalShape":Landroid/graphics/drawable/shapes/OvalShape;
    new-instance v7, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v7, v6}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 116
    .local v7, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v7}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 118
    iget-boolean v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v3, :cond_41

    .line 119
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v8, Lcom/melnykov/fab/R$drawable;->shadow:I

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aput-object v5, v3, v4

    aput-object v7, v3, v1

    invoke-direct {v0, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 122
    .local v0, "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    iget v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v3, :cond_3e

    sget v3, Lcom/melnykov/fab/R$dimen;->fab_shadow_size:I

    :goto_33
    invoke-direct {p0, v3}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v2

    .local v2, "shadowSize":I
    move v3, v2

    move v4, v2

    move v5, v2

    .line 124
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 127
    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v2    # "shadowSize":I
    :goto_3d
    return-object v0

    .line 122
    .restart local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    :cond_3e
    sget v3, Lcom/melnykov/fab/R$dimen;->fab_mini_shadow_size:I

    goto :goto_33

    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    :cond_41
    move-object v0, v7

    .line 127
    goto :goto_3d
.end method

.method private getColor(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 136
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
    .line 140
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private getMarginBottom()I
    .registers 4

    .prologue
    .line 165
    const/4 v1, 0x0

    .line 166
    .local v1, "marginBottom":I
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 167
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_d

    .line 168
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 170
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

    .line 132
    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    return-object v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 79
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 80
    const v0, 0x1060013

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 81
    const v0, 0x1060012

    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 83
    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 84
    if-eqz p2, :cond_1f

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 87
    :cond_1f
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 88
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 91
    sget-object v1, Lcom/melnykov/fab/R$styleable;->FloatingActionButton:[I

    invoke-direct {p0, p1, p2, v1}, Lcom/melnykov/fab/FloatingActionButton;->getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 92
    .local v0, "attr":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_37

    .line 94
    const/4 v1, 0x1

    const v2, 0x1060013

    :try_start_c
    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 96
    const/4 v1, 0x0

    const v2, 0x1060012

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 98
    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 99
    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I
    :try_end_34
    .catchall {:try_start_c .. :try_end_34} :catchall_38

    .line 101
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 104
    :cond_37
    return-void

    .line 101
    :catchall_38
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 146
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 147
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    :goto_9
    return-void

    .line 149
    :cond_a
    invoke-virtual {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method private toggle(ZZZ)V
    .registers 10
    .param p1, "visible"    # Z
    .param p2, "animate"    # Z
    .param p3, "force"    # Z

    .prologue
    .line 247
    iget-boolean v3, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    if-ne v3, p1, :cond_6

    if-eqz p3, :cond_22

    .line 248
    :cond_6
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mVisible:Z

    .line 249
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getHeight()I

    move-result v0

    .line 250
    .local v0, "height":I
    if-nez v0, :cond_23

    if-nez p3, :cond_23

    .line 251
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 252
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 253
    new-instance v3, Lcom/melnykov/fab/FloatingActionButton$1;

    invoke-direct {v3, p0, p1, p2}, Lcom/melnykov/fab/FloatingActionButton$1;-><init>(Lcom/melnykov/fab/FloatingActionButton;ZZ)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 276
    .end local v0    # "height":I
    .end local v2    # "vto":Landroid/view/ViewTreeObserver;
    :cond_22
    :goto_22
    return-void

    .line 267
    .restart local v0    # "height":I
    :cond_23
    if-eqz p1, :cond_3d

    const/4 v1, 0x0

    .line 268
    .local v1, "translationY":I
    :goto_26
    if-eqz p2, :cond_44

    .line 269
    invoke-virtual {p0}, Lcom/melnykov/fab/FloatingActionButton;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    iget-object v4, p0, Lcom/melnykov/fab/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    const-wide/16 v4, 0xc8

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-float v4, v1

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    goto :goto_22

    .line 267
    .end local v1    # "translationY":I
    :cond_3d
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->getMarginBottom()I

    move-result v3

    add-int v1, v0, v3

    goto :goto_26

    .line 273
    .restart local v1    # "translationY":I
    :cond_44
    int-to-float v3, v1

    invoke-virtual {p0, v3}, Lcom/melnykov/fab/FloatingActionButton;->setTranslationY(F)V

    goto :goto_22
.end method

.method private updateBackground()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 107
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 108
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 109
    new-array v1, v3, [I

    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->createDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 110
    invoke-direct {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 111
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
    .line 283
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    invoke-direct {v0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)V

    .line 284
    return-void
.end method

.method public attachToListView(Landroid/widget/AbsListView;Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)V
    .registers 4
    .param p1, "listView"    # Landroid/widget/AbsListView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "onScrollListener"    # Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 287
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mListView:Landroid/widget/AbsListView;

    .line 288
    iput-object p2, p0, Lcom/melnykov/fab/FloatingActionButton;->mOnScrollListener:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    .line 289
    invoke-virtual {p2, p0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->setFloatingActionButton(Lcom/melnykov/fab/FloatingActionButton;)V

    .line 290
    invoke-virtual {p2, p1}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->setListView(Landroid/widget/AbsListView;)V

    .line 291
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p2}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 292
    return-void
.end method

.method public getColorNormal()I
    .registers 2

    .prologue
    .line 185
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method public getColorPressed()I
    .registers 2

    .prologue
    .line 200
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    return v0
.end method

.method protected getListViewScrollY()I
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 159
    iget-object v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 160
    .local v0, "topChild":Landroid/view/View;
    if-nez v0, :cond_a

    :goto_9
    return v1

    :cond_a
    iget-object v1, p0, Lcom/melnykov/fab/FloatingActionButton;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    goto :goto_9
.end method

.method protected getOnScrollListener()Landroid/widget/AbsListView$OnScrollListener;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mOnScrollListener:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    return-object v0
.end method

.method public getType()I
    .registers 2
    .annotation build Lcom/melnykov/fab/FloatingActionButton$TYPE;
    .end annotation

    .prologue
    .line 223
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    return v0
.end method

.method public hasShadow()Z
    .registers 2

    .prologue
    .line 211
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 235
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->hide(Z)V

    .line 236
    return-void
.end method

.method public hide(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    const/4 v0, 0x0

    .line 243
    invoke-direct {p0, v0, p1, v0}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 244
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 68
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onMeasure(II)V

    .line 69
    iget v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-nez v2, :cond_1e

    sget v2, Lcom/melnykov/fab/R$dimen;->fab_size_normal:I

    :goto_9
    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v1

    .line 71
    .local v1, "size":I
    iget-boolean v2, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eqz v2, :cond_1a

    .line 72
    sget v2, Lcom/melnykov/fab/R$dimen;->fab_shadow_size:I

    invoke-direct {p0, v2}, Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I

    move-result v0

    .line 73
    .local v0, "shadowSize":I
    mul-int/lit8 v2, v0, 0x2

    add-int/2addr v1, v2

    .line 75
    .end local v0    # "shadowSize":I
    :cond_1a
    invoke-virtual {p0, v1, v1}, Lcom/melnykov/fab/FloatingActionButton;->setMeasuredDimension(II)V

    .line 76
    return-void

    .line 69
    .end local v1    # "size":I
    :cond_1e
    sget v2, Lcom/melnykov/fab/R$dimen;->fab_size_mini:I

    goto :goto_9
.end method

.method public setColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 174
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    if-eq p1, v0, :cond_9

    .line 175
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorNormal:I

    .line 176
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 178
    :cond_9
    return-void
.end method

.method public setColorNormalResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorNormal(I)V

    .line 182
    return-void
.end method

.method public setColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 189
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    if-eq p1, v0, :cond_9

    .line 190
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mColorPressed:I

    .line 191
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 193
    :cond_9
    return-void
.end method

.method public setColorPressedResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 196
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->setColorPressed(I)V

    .line 197
    return-void
.end method

.method public setShadow(Z)V
    .registers 3
    .param p1, "shadow"    # Z

    .prologue
    .line 204
    iget-boolean v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    if-eq p1, v0, :cond_9

    .line 205
    iput-boolean p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mShadow:Z

    .line 206
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 208
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
    .line 215
    iget v0, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    if-eq p1, v0, :cond_9

    .line 216
    iput p1, p0, Lcom/melnykov/fab/FloatingActionButton;->mType:I

    .line 217
    invoke-direct {p0}, Lcom/melnykov/fab/FloatingActionButton;->updateBackground()V

    .line 219
    :cond_9
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 231
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton;->show(Z)V

    .line 232
    return-void
.end method

.method public show(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 239
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/melnykov/fab/FloatingActionButton;->toggle(ZZZ)V

    .line 240
    return-void
.end method
