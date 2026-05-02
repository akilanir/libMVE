.class public Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;
.super Ljava/lang/Object;
.source "ParallaxListViewHelper.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem;
    }
.end annotation


# static fields
.field private static final DEFAULT_ALPHA_FACTOR:F = -1.0f

.field private static final DEFAULT_IS_CIRCULAR:Z = false

.field private static final DEFAULT_PARALLAX_FACTOR:F = 1.9f


# instance fields
.field private alphaFactor:F

.field private isCircular:Z

.field private listView:Landroid/widget/ListView;

.field private listener:Landroid/widget/AbsListView$OnScrollListener;

.field private parallaxFactor:F

.field private parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/widget/ListView;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "listView"    # Landroid/widget/ListView;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const v0, 0x3ff33333    # 1.9f

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxFactor:F

    .line 20
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->alphaFactor:F

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->init(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/widget/ListView;)V

    .line 28
    return-void
.end method

.method private circularParallax()V
    .registers 4

    .prologue
    .line 63
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1c

    .line 64
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    neg-int v0, v1

    .line 65
    .local v0, "top":I
    if-ltz v0, :cond_1c

    .line 66
    invoke-direct {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->fillParallaxedViews()V

    .line 67
    invoke-direct {p0, v0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->setFilters(I)V

    .line 70
    .end local v0    # "top":I
    :cond_1c
    return-void
.end method

.method private fillParallaxedViews()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 93
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->is(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 94
    :cond_13
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    if-eqz v0, :cond_26

    .line 95
    invoke-direct {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->resetFilters()V

    .line 96
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setView(Landroid/view/View;)V

    .line 101
    :cond_25
    :goto_25
    return-void

    .line 98
    :cond_26
    new-instance v0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem;

    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem;-><init>(Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;Landroid/view/View;)V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    goto :goto_25
.end method

.method private headerParallax()V
    .registers 4

    .prologue
    .line 73
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    if-eqz v1, :cond_1d

    .line 74
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1d

    .line 75
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    neg-int v0, v1

    .line 76
    .local v0, "top":I
    if-ltz v0, :cond_1d

    .line 77
    invoke-direct {p0, v0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->setFilters(I)V

    .line 81
    .end local v0    # "top":I
    :cond_1d
    return-void
.end method

.method private resetFilters()V
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setOffset(F)V

    .line 105
    iget v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->alphaFactor:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_15

    .line 106
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setAlpha(F)V

    .line 107
    :cond_15
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    invoke-virtual {v0}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animateNow()V

    .line 108
    return-void
.end method

.method private setFilters(I)V
    .registers 6
    .param p1, "top"    # I

    .prologue
    .line 84
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    int-to-float v2, p1

    iget v3, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxFactor:F

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setOffset(F)V

    .line 85
    iget v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->alphaFactor:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1a

    .line 86
    if-gtz p1, :cond_20

    const/high16 v0, 0x3f800000    # 1.0f

    .line 87
    .local v0, "alpha":F
    :goto_15
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    invoke-virtual {v1, v0}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->setAlpha(F)V

    .line 89
    .end local v0    # "alpha":F
    :cond_1a
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    invoke-virtual {v1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animateNow()V

    .line 90
    return-void

    .line 86
    :cond_20
    const/high16 v1, 0x42c80000    # 100.0f

    int-to-float v2, p1

    iget v3, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->alphaFactor:F

    mul-float/2addr v2, v3

    div-float v0, v1, v2

    goto :goto_15
.end method


# virtual methods
.method protected addParallaxedHeaderView(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->addParallaxedView(Landroid/view/View;)V

    .line 45
    return-void
.end method

.method protected addParallaxedHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "isSelectable"    # Z

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->addParallaxedView(Landroid/view/View;)V

    .line 49
    return-void
.end method

.method protected addParallaxedView(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 52
    new-instance v0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem;

    invoke-direct {v0, p0, p1}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem;-><init>(Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;Landroid/view/View;)V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxedView:Lcom/nirhart/parallaxscroll/views/ParallaxedView;

    .line 53
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/widget/ListView;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "listView"    # Landroid/widget/ListView;

    .prologue
    const/4 v3, 0x0

    .line 31
    iput-object p3, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listView:Landroid/widget/ListView;

    .line 32
    sget-object v1, Lcom/nirhart/parallaxscroll/R$styleable;->ParallaxScroll:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 33
    .local v0, "typeArray":Landroid/content/res/TypedArray;
    const v1, 0x3ff33333    # 1.9f

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxFactor:F

    .line 34
    const/4 v1, 0x1

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->alphaFactor:F

    .line 35
    const/4 v1, 0x4

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->isCircular:Z

    .line 36
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 37
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->parallaxScroll()V

    .line 113
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_c

    .line 114
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 115
    :cond_c
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 4
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 120
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 121
    :cond_9
    return-void
.end method

.method protected parallaxScroll()V
    .registers 2

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->isCircular:Z

    if-eqz v0, :cond_8

    .line 57
    invoke-direct {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->circularParallax()V

    .line 60
    :goto_7
    return-void

    .line 59
    :cond_8
    invoke-direct {p0}, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->headerParallax()V

    goto :goto_7
.end method

.method protected setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .registers 2
    .param p1, "l"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxListViewHelper;->listener:Landroid/widget/AbsListView$OnScrollListener;

    .line 41
    return-void
.end method
