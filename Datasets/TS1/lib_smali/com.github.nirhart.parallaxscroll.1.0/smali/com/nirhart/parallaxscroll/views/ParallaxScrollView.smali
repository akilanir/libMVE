.class public Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;
.super Landroid/widget/ScrollView;
.source "ParallaxScrollView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nirhart/parallaxscroll/views/ParallaxScrollView$ScrollViewParallaxedItem;
    }
.end annotation


# static fields
.field private static final DEFAULT_ALPHA_FACTOR:F = -1.0f

.field private static final DEFAULT_INNER_PARALLAX_FACTOR:F = 1.9f

.field private static final DEFAULT_PARALLAX_FACTOR:F = 1.9f

.field private static final DEFAULT_PARALLAX_VIEWS:I = 0x1


# instance fields
.field private alphaFactor:F

.field private innerParallaxFactor:F

.field private numOfParallaxViews:I

.field private parallaxFactor:F

.field private parallaxedViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nirhart/parallaxscroll/views/ParallaxedView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v1, 0x3ff33333    # 1.9f

    .line 37
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->numOfParallaxViews:I

    .line 21
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->innerParallaxFactor:F

    .line 22
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxFactor:F

    .line 23
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxedViews:Ljava/util/ArrayList;

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const v1, 0x3ff33333    # 1.9f

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->numOfParallaxViews:I

    .line 21
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->innerParallaxFactor:F

    .line 22
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxFactor:F

    .line 23
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxedViews:Ljava/util/ArrayList;

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const v1, 0x3ff33333    # 1.9f

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->numOfParallaxViews:I

    .line 21
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->innerParallaxFactor:F

    .line 22
    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxFactor:F

    .line 23
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxedViews:Ljava/util/ArrayList;

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    return-void
.end method

.method private makeViewsParallax()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 56
    invoke-virtual {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->getChildCount()I

    move-result v4

    if-lez v4, :cond_33

    invoke-virtual {p0, v5}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup;

    if-eqz v4, :cond_33

    .line 57
    invoke-virtual {p0, v5}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 58
    .local v3, "viewsHolder":Landroid/view/ViewGroup;
    iget v4, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->numOfParallaxViews:I

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 59
    .local v1, "numOfParallaxViews":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    if-ge v0, v1, :cond_33

    .line 60
    new-instance v2, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView$ScrollViewParallaxedItem;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView$ScrollViewParallaxedItem;-><init>(Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;Landroid/view/View;)V

    .line 61
    .local v2, "parallaxedView":Lcom/nirhart/parallaxscroll/views/ParallaxedView;
    iget-object v4, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 64
    .end local v0    # "i":I
    .end local v1    # "numOfParallaxViews":I
    .end local v2    # "parallaxedView":Lcom/nirhart/parallaxscroll/views/ParallaxedView;
    .end local v3    # "viewsHolder":Landroid/view/ViewGroup;
    :cond_33
    return-void
.end method


# virtual methods
.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    const v2, 0x3ff33333    # 1.9f

    .line 41
    sget-object v1, Lcom/nirhart/parallaxscroll/R$styleable;->ParallaxScroll:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 42
    .local v0, "typeArray":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxFactor:F

    .line 43
    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    .line 44
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->innerParallaxFactor:F

    .line 45
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->numOfParallaxViews:I

    .line 46
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    return-void
.end method

.method protected onFinishInflate()V
    .registers 1

    .prologue
    .line 51
    invoke-super {p0}, Landroid/widget/ScrollView;->onFinishInflate()V

    .line 52
    invoke-direct {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->makeViewsParallax()V

    .line 53
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .registers 12
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "oldl"    # I
    .param p4, "oldt"    # I

    .prologue
    .line 68
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ScrollView;->onScrollChanged(IIII)V

    .line 69
    iget v3, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxFactor:F

    .line 70
    .local v3, "parallax":F
    iget v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    .line 71
    .local v0, "alpha":F
    iget-object v5, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->parallaxedViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    .line 72
    .local v4, "parallaxedView":Lcom/nirhart/parallaxscroll/views/ParallaxedView;
    int-to-float v5, p2

    div-float/2addr v5, v3

    invoke-virtual {v4, v5}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setOffset(F)V

    .line 73
    iget v5, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->innerParallaxFactor:F

    mul-float/2addr v3, v5

    .line 74
    const/high16 v5, -0x40800000    # -1.0f

    cmpl-float v5, v0, v5

    if-eqz v5, :cond_31

    .line 75
    if-gtz p2, :cond_35

    const/high16 v1, 0x3f800000    # 1.0f

    .line 76
    .local v1, "fixedAlpha":F
    :goto_2b
    invoke-virtual {v4, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setAlpha(F)V

    .line 77
    iget v5, p0, Lcom/nirhart/parallaxscroll/views/ParallaxScrollView;->alphaFactor:F

    div-float/2addr v0, v5

    .line 79
    .end local v1    # "fixedAlpha":F
    :cond_31
    invoke-virtual {v4}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animateNow()V

    goto :goto_d

    .line 75
    :cond_35
    const/high16 v5, 0x42c80000    # 100.0f

    int-to-float v6, p2

    mul-float/2addr v6, v0

    div-float v1, v5, v6

    goto :goto_2b

    .line 81
    .end local v4    # "parallaxedView":Lcom/nirhart/parallaxscroll/views/ParallaxedView;
    :cond_3c
    return-void
.end method
