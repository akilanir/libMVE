.class public Lcom/afollestad/materialdialogs/internal/MDRootLayout;
.super Landroid/view/ViewGroup;
.source "MDRootLayout.java"


# static fields
.field private static final INDEX_NEGATIVE:I = 0x1

.field private static final INDEX_NEUTRAL:I = 0x0

.field private static final INDEX_POSITIVE:I = 0x2


# instance fields
.field private mBottomOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

.field private mButtonBarHeight:I

.field private mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field private mButtonHorizontalEdgeMargin:I

.field private mButtonPaddingFull:I

.field private mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

.field private mContent:Landroid/view/View;

.field private mDividerPaint:Landroid/graphics/Paint;

.field private mDividerWidth:I

.field private mDrawBottomDivider:Z

.field private mDrawTopDivider:Z

.field private mForceStack:Z

.field private mIsStacked:Z

.field private mNoTitleNoPadding:Z

.field private mNoTitlePaddingFull:I

.field private mReducePaddingNoTitleNoButtons:Z

.field private mTitleBar:Landroid/view/View;

.field private mTopOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

.field private mUseFullPadding:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 68
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 43
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 44
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/afollestad/materialdialogs/internal/MDButton;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 46
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    .line 47
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 56
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 44
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/afollestad/materialdialogs/internal/MDButton;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 46
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    .line 47
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 56
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 74
    invoke-direct {p0, p1, p2, v1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 44
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/afollestad/materialdialogs/internal/MDButton;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 46
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    .line 47
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 56
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 80
    invoke-direct {p0, p1, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 43
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 44
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/afollestad/materialdialogs/internal/MDButton;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 46
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    .line 47
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 56
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 86
    invoke-direct {p0, p1, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 87
    return-void
.end method

.method static synthetic access$000(Landroid/webkit/WebView;)Z
    .registers 2
    .param p0, "x0"    # Landroid/webkit/WebView;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->canWebViewScroll(Landroid/webkit/WebView;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    return p1
.end method

.method static synthetic access$202(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    return p1
.end method

.method static synthetic access$300(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/ViewGroup;ZZ)V
    .registers 4
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;
    .param p1, "x1"    # Landroid/view/ViewGroup;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->addScrollListener(Landroid/view/ViewGroup;ZZ)V

    return-void
.end method

.method static synthetic access$400(Lcom/afollestad/materialdialogs/internal/MDRootLayout;)[Lcom/afollestad/materialdialogs/internal/MDButton;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    return-object v0
.end method

.method static synthetic access$500(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/webkit/WebView;ZZZ)V
    .registers 5
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;
    .param p1, "x1"    # Landroid/webkit/WebView;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidateDividersForWebView(Landroid/webkit/WebView;ZZZ)V

    return-void
.end method

.method static synthetic access$600(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/ViewGroup;ZZZ)V
    .registers 5
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/internal/MDRootLayout;
    .param p1, "x1"    # Landroid/view/ViewGroup;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidateDividersForScrollingView(Landroid/view/ViewGroup;ZZZ)V

    return-void
.end method

.method private addScrollListener(Landroid/view/ViewGroup;ZZ)V
    .registers 7
    .param p1, "vg"    # Landroid/view/ViewGroup;
    .param p2, "setForTop"    # Z
    .param p3, "setForBottom"    # Z

    .prologue
    .line 428
    if-nez p3, :cond_6

    iget-object v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTopOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    if-eqz v1, :cond_c

    :cond_6
    if-eqz p3, :cond_21

    iget-object v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mBottomOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    if-nez v1, :cond_21

    .line 430
    :cond_c
    new-instance v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;-><init>(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/ViewGroup;ZZ)V

    .line 448
    .local v0, "onScrollChangedListener":Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    if-nez p3, :cond_22

    .line 449
    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTopOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 450
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTopOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 455
    :goto_1e
    invoke-interface {v0}, Landroid/view/ViewTreeObserver$OnScrollChangedListener;->onScrollChanged()V

    .line 457
    .end local v0    # "onScrollChangedListener":Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    :cond_21
    return-void

    .line 452
    .restart local v0    # "onScrollChangedListener":Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    :cond_22
    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mBottomOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 453
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mBottomOnScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    goto :goto_1e
.end method

.method private static canAdapterViewScroll(Landroid/widget/AdapterView;)Z
    .registers 8
    .param p0, "lv"    # Landroid/widget/AdapterView;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 521
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_b

    move v2, v3

    .line 537
    :cond_a
    :goto_a
    return v2

    .line 525
    :cond_b
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    move-result v4

    if-nez v4, :cond_52

    move v0, v2

    .line 526
    .local v0, "firstItemVisible":Z
    :goto_12
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_54

    move v1, v2

    .line 528
    .local v1, "lastItemVisible":Z
    :goto_1f
    if-eqz v0, :cond_a

    if-eqz v1, :cond_a

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getChildCount()I

    move-result v4

    if-lez v4, :cond_a

    .line 530
    invoke-virtual {p0, v3}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getPaddingTop()I

    move-result v5

    if-lt v4, v5, :cond_a

    .line 533
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    if-gt v4, v5, :cond_a

    move v2, v3

    goto :goto_a

    .end local v0    # "firstItemVisible":Z
    .end local v1    # "lastItemVisible":Z
    :cond_52
    move v0, v3

    .line 525
    goto :goto_12

    .restart local v0    # "firstItemVisible":Z
    :cond_54
    move v1, v3

    .line 526
    goto :goto_1f
.end method

.method public static canRecyclerViewScroll(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 11
    .param p0, "view"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 488
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v4

    .line 489
    .local v4, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    .line 492
    .local v0, "count":I
    instance-of v7, v4, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v7, :cond_1d

    move-object v3, v4

    .line 493
    check-cast v3, Landroid/support/v7/widget/LinearLayoutManager;

    .line 494
    .local v3, "llm":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v2

    .line 499
    .local v2, "lastVisible":I
    const/4 v7, -0x1

    if-ne v2, v7, :cond_25

    .line 503
    :cond_1c
    :goto_1c
    return v5

    .line 496
    .end local v2    # "lastVisible":I
    .end local v3    # "llm":Landroid/support/v7/widget/LinearLayoutManager;
    :cond_1d
    new-instance v5, Lcom/afollestad/materialdialogs/MaterialDialog$NotImplementedException;

    const-string v6, "Material Dialogs currently only supports LinearLayoutManager. Please report any new layout managers."

    invoke-direct {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$NotImplementedException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 502
    .restart local v2    # "lastVisible":I
    .restart local v3    # "llm":Landroid/support/v7/widget/LinearLayoutManager;
    :cond_25
    add-int/lit8 v7, v0, -0x1

    if-ne v2, v7, :cond_4d

    move v1, v6

    .line 503
    .local v1, "lastItemVisible":Z
    :goto_2a
    if-eqz v1, :cond_4b

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v7

    if-lez v7, :cond_1c

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v7

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v8

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v9

    sub-int/2addr v8, v9

    if-le v7, v8, :cond_1c

    :cond_4b
    move v5, v6

    goto :goto_1c

    .end local v1    # "lastItemVisible":Z
    :cond_4d
    move v1, v5

    .line 502
    goto :goto_2a
.end method

.method private static canScrollViewScroll(Landroid/widget/ScrollView;)Z
    .registers 5
    .param p0, "sv"    # Landroid/widget/ScrollView;

    .prologue
    const/4 v1, 0x0

    .line 508
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getChildCount()I

    move-result v2

    if-nez v2, :cond_8

    .line 511
    :cond_7
    :goto_7
    return v1

    .line 510
    :cond_8
    invoke-virtual {p0, v1}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 511
    .local v0, "childHeight":I
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/widget/ScrollView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    if-ge v2, v0, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method private static canWebViewScroll(Landroid/webkit/WebView;)Z
    .registers 4
    .param p0, "view"    # Landroid/webkit/WebView;

    .prologue
    .line 516
    invoke-virtual {p0}, Landroid/webkit/WebView;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/webkit/WebView;->getScale()F

    move-result v2

    mul-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private static getBottomView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6
    .param p0, "viewGroup"    # Landroid/view/ViewGroup;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 549
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-nez v3, :cond_a

    .line 550
    :cond_8
    const/4 v0, 0x0

    .line 559
    :cond_9
    :goto_9
    return-object v0

    .line 551
    :cond_a
    const/4 v0, 0x0

    .line 552
    .local v0, "bottomView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_11
    if-ltz v2, :cond_9

    .line 553
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 554
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_29

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v4

    if-ne v3, v4, :cond_29

    .line 555
    move-object v0, v1

    .line 556
    goto :goto_9

    .line 552
    :cond_29
    add-int/lit8 v2, v2, -0x1

    goto :goto_11
.end method

.method private static getTopView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p0, "viewGroup"    # Landroid/view/ViewGroup;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 564
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-nez v3, :cond_a

    .line 565
    :cond_8
    const/4 v2, 0x0

    .line 574
    :cond_9
    :goto_9
    return-object v2

    .line 566
    :cond_a
    const/4 v2, 0x0

    .line 567
    .local v2, "topView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_11
    if-ltz v1, :cond_9

    .line 568
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 569
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_25

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    if-nez v3, :cond_25

    .line 570
    move-object v2, v0

    .line 571
    goto :goto_9

    .line 567
    :cond_25
    add-int/lit8 v1, v1, -0x1

    goto :goto_11
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v4, 0x0

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 92
    .local v1, "r":Landroid/content/res/Resources;
    sget-object v2, Lcom/afollestad/materialdialogs/R$styleable;->MDRootLayout:[I

    invoke-virtual {p1, p2, v2, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 93
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/afollestad/materialdialogs/R$styleable;->MDRootLayout_md_reduce_padding_no_title_no_buttons:I

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mReducePaddingNoTitleNoButtons:Z

    .line 94
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 96
    sget v2, Lcom/afollestad/materialdialogs/R$dimen;->md_notitle_vertical_padding:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitlePaddingFull:I

    .line 97
    sget v2, Lcom/afollestad/materialdialogs/R$dimen;->md_button_frame_vertical_padding:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    .line 99
    sget v2, Lcom/afollestad/materialdialogs/R$dimen;->md_button_padding_frame_side:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonHorizontalEdgeMargin:I

    .line 100
    sget v2, Lcom/afollestad/materialdialogs/R$dimen;->md_button_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonBarHeight:I

    .line 102
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerPaint:Landroid/graphics/Paint;

    .line 103
    sget v2, Lcom/afollestad/materialdialogs/R$dimen;->md_divider_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerWidth:I

    .line 104
    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerPaint:Landroid/graphics/Paint;

    sget v3, Lcom/afollestad/materialdialogs/R$attr;->md_divider_color:I

    invoke-static {p1, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    invoke-virtual {p0, v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setWillNotDraw(Z)V

    .line 106
    return-void
.end method

.method private invalidateDividersForScrollingView(Landroid/view/ViewGroup;ZZZ)V
    .registers 9
    .param p1, "view"    # Landroid/view/ViewGroup;
    .param p2, "setForTop"    # Z
    .param p3, "setForBottom"    # Z
    .param p4, "hasButtons"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 460
    if-eqz p2, :cond_2e

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_2e

    .line 461
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    if-eqz v0, :cond_59

    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v3, 0x8

    if-eq v0, v3, :cond_59

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    add-int/2addr v0, v3

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    if-le v0, v3, :cond_59

    move v0, v1

    :goto_2c
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 467
    :cond_2e
    if-eqz p3, :cond_58

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_58

    .line 468
    if-eqz p4, :cond_5b

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    add-int/2addr v0, v3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v0, v3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    if-ge v0, v3, :cond_5b

    :goto_56
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 471
    :cond_58
    return-void

    :cond_59
    move v0, v2

    .line 461
    goto :goto_2c

    :cond_5b
    move v1, v2

    .line 468
    goto :goto_56
.end method

.method private invalidateDividersForWebView(Landroid/webkit/WebView;ZZZ)V
    .registers 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "setForTop"    # Z
    .param p3, "setForBottom"    # Z
    .param p4, "hasButtons"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 474
    if-eqz p2, :cond_20

    .line 475
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    if-eqz v0, :cond_44

    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v3, 0x8

    if-eq v0, v3, :cond_44

    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/webkit/WebView;->getPaddingTop()I

    move-result v3

    add-int/2addr v0, v3

    if-lez v0, :cond_44

    move v0, v1

    :goto_1e
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 480
    :cond_20
    if-eqz p3, :cond_43

    .line 482
    if-eqz p4, :cond_46

    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/webkit/WebView;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v0, v3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getScale()F

    move-result v4

    mul-float/2addr v3, v4

    cmpg-float v0, v0, v3

    if-gez v0, :cond_46

    :goto_41
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    .line 485
    :cond_43
    return-void

    :cond_44
    move v0, v2

    .line 475
    goto :goto_1e

    :cond_46
    move v1, v2

    .line 482
    goto :goto_41
.end method

.method private static isVisible(Landroid/view/View;)Z
    .registers 6
    .param p0, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 221
    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_29

    move v0, v1

    .line 222
    .local v0, "visible":Z
    :goto_d
    if-eqz v0, :cond_28

    instance-of v3, p0, Lcom/afollestad/materialdialogs/internal/MDButton;

    if-eqz v3, :cond_28

    .line 223
    check-cast p0, Lcom/afollestad/materialdialogs/internal/MDButton;

    .end local p0    # "v":Landroid/view/View;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDButton;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2b

    move v0, v1

    .line 224
    :cond_28
    :goto_28
    return v0

    .end local v0    # "visible":Z
    .restart local p0    # "v":Landroid/view/View;
    :cond_29
    move v0, v2

    .line 221
    goto :goto_d

    .end local p0    # "v":Landroid/view/View;
    .restart local v0    # "visible":Z
    :cond_2b
    move v0, v2

    .line 223
    goto :goto_28
.end method

.method private setUpDividersVisibility(Landroid/view/View;ZZ)V
    .registers 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "setForTop"    # Z
    .param p3, "setForBottom"    # Z

    .prologue
    const/4 v5, 0x0

    .line 368
    if-nez p1, :cond_4

    .line 425
    .end local p1    # "view":Landroid/view/View;
    :cond_3
    :goto_3
    return-void

    .line 370
    .restart local p1    # "view":Landroid/view/View;
    :cond_4
    instance-of v4, p1, Landroid/widget/ScrollView;

    if-eqz v4, :cond_1e

    move-object v2, p1

    .line 371
    check-cast v2, Landroid/widget/ScrollView;

    .line 372
    .local v2, "sv":Landroid/widget/ScrollView;
    invoke-static {v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->canScrollViewScroll(Landroid/widget/ScrollView;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 373
    invoke-direct {p0, v2, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->addScrollListener(Landroid/view/ViewGroup;ZZ)V

    goto :goto_3

    .line 375
    :cond_15
    if-eqz p2, :cond_19

    .line 376
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 377
    :cond_19
    if-eqz p3, :cond_3

    .line 378
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    goto :goto_3

    .line 380
    .end local v2    # "sv":Landroid/widget/ScrollView;
    :cond_1e
    instance-of v4, p1, Landroid/widget/AdapterView;

    if-eqz v4, :cond_38

    move-object v2, p1

    .line 381
    check-cast v2, Landroid/widget/AdapterView;

    .line 382
    .local v2, "sv":Landroid/widget/AdapterView;
    invoke-static {v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->canAdapterViewScroll(Landroid/widget/AdapterView;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 383
    invoke-direct {p0, v2, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->addScrollListener(Landroid/view/ViewGroup;ZZ)V

    goto :goto_3

    .line 385
    :cond_2f
    if-eqz p2, :cond_33

    .line 386
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 387
    :cond_33
    if-eqz p3, :cond_3

    .line 388
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    goto :goto_3

    .line 390
    .end local v2    # "sv":Landroid/widget/AdapterView;
    :cond_38
    instance-of v4, p1, Landroid/webkit/WebView;

    if-eqz v4, :cond_49

    .line 391
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    new-instance v5, Lcom/afollestad/materialdialogs/internal/MDRootLayout$1;

    invoke-direct {v5, p0, p1, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout$1;-><init>(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/View;ZZ)V

    invoke-virtual {v4, v5}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_3

    .line 408
    :cond_49
    instance-of v4, p1, Landroid/support/v7/widget/RecyclerView;

    if-eqz v4, :cond_5c

    .line 412
    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    .end local p1    # "view":Landroid/view/View;
    invoke-static {p1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->canRecyclerViewScroll(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v1

    .line 413
    .local v1, "canScroll":Z
    if-eqz p2, :cond_57

    .line 414
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    .line 415
    :cond_57
    if-eqz p3, :cond_3

    .line 416
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    goto :goto_3

    .line 417
    .end local v1    # "canScroll":Z
    .restart local p1    # "view":Landroid/view/View;
    :cond_5c
    instance-of v4, p1, Landroid/view/ViewGroup;

    if-eqz v4, :cond_3

    move-object v4, p1

    .line 418
    check-cast v4, Landroid/view/ViewGroup;

    invoke-static {v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getTopView(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 419
    .local v3, "topView":Landroid/view/View;
    invoke-direct {p0, v3, p2, p3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setUpDividersVisibility(Landroid/view/View;ZZ)V

    .line 420
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "view":Landroid/view/View;
    invoke-static {p1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getBottomView(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 421
    .local v0, "bottomView":Landroid/view/View;
    if-eq v0, v3, :cond_3

    .line 422
    const/4 v4, 0x1

    invoke-direct {p0, v0, v5, v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setUpDividersVisibility(Landroid/view/View;ZZ)V

    goto :goto_3
.end method


# virtual methods
.method public noTitleNoPadding()V
    .registers 2

    .prologue
    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitleNoPadding:Z

    .line 110
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 229
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 231
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    if-eqz v0, :cond_3d

    .line 232
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawTopDivider:Z

    if-eqz v0, :cond_23

    .line 233
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v6

    .line 234
    .local v6, "y":I
    iget v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerWidth:I

    sub-int v0, v6, v0

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getMeasuredWidth()I

    move-result v0

    int-to-float v3, v0

    int-to-float v4, v6

    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 237
    .end local v6    # "y":I
    :cond_23
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDrawBottomDivider:Z

    if-eqz v0, :cond_3d

    .line 238
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v6

    .line 239
    .restart local v6    # "y":I
    int-to-float v2, v6

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getMeasuredWidth()I

    move-result v0

    int-to-float v3, v0

    iget v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerWidth:I

    add-int/2addr v0, v6

    int-to-float v4, v0

    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 242
    .end local v6    # "y":I
    :cond_3d
    return-void
.end method

.method public onFinishInflate()V
    .registers 5

    .prologue
    .line 114
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 115
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_4e

    .line 116
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 117
    .local v1, "v":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/afollestad/materialdialogs/R$id;->titleFrame:I

    if-ne v2, v3, :cond_1b

    .line 118
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    .line 115
    .end local v1    # "v":Landroid/view/View;
    :goto_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 119
    .restart local v1    # "v":Landroid/view/View;
    :cond_1b
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNeutral:I

    if-ne v2, v3, :cond_2b

    .line 120
    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    const/4 v3, 0x0

    check-cast v1, Lcom/afollestad/materialdialogs/internal/MDButton;

    .end local v1    # "v":Landroid/view/View;
    aput-object v1, v2, v3

    goto :goto_18

    .line 121
    .restart local v1    # "v":Landroid/view/View;
    :cond_2b
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNegative:I

    if-ne v2, v3, :cond_3b

    .line 122
    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    const/4 v3, 0x1

    check-cast v1, Lcom/afollestad/materialdialogs/internal/MDButton;

    .end local v1    # "v":Landroid/view/View;
    aput-object v1, v2, v3

    goto :goto_18

    .line 123
    .restart local v1    # "v":Landroid/view/View;
    :cond_3b
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultPositive:I

    if-ne v2, v3, :cond_4b

    .line 124
    iget-object v2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    const/4 v3, 0x2

    check-cast v1, Lcom/afollestad/materialdialogs/internal/MDButton;

    .end local v1    # "v":Landroid/view/View;
    aput-object v1, v2, v3

    goto :goto_18

    .line 126
    .restart local v1    # "v":Landroid/view/View;
    :cond_4b
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    goto :goto_18

    .line 129
    .end local v1    # "v":Landroid/view/View;
    :cond_4e
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 26
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_92

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    .line 248
    .local v10, "height":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v17, v0

    add-int v18, p3, v10

    move-object/from16 v0, v17

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 249
    add-int p3, p3, v10

    .line 254
    .end local v10    # "height":I
    :cond_2d
    :goto_2d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_58

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    add-int v18, v18, p3

    move-object/from16 v0, v17

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 257
    :cond_58
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    move/from16 v17, v0

    if-eqz v17, :cond_ab

    .line 258
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v17, v0

    sub-int p5, p5, v17

    .line 259
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .local v5, "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    array-length v12, v5

    .local v12, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_6e
    if-ge v11, v12, :cond_1a0

    aget-object v13, v5, v11

    .line 260
    .local v13, "mButton":Lcom/afollestad/materialdialogs/internal/MDButton;
    invoke-static {v13}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_8f

    .line 261
    invoke-virtual {v13}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredHeight()I

    move-result v17

    sub-int v17, p5, v17

    move/from16 v0, p2

    move/from16 v1, v17

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/afollestad/materialdialogs/internal/MDButton;->layout(IIII)V

    .line 262
    invoke-virtual {v13}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredHeight()I

    move-result v17

    sub-int p5, p5, v17

    .line 259
    :cond_8f
    add-int/lit8 v11, v11, 0x1

    goto :goto_6e

    .line 250
    .end local v5    # "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v11    # "i$":I
    .end local v12    # "len$":I
    .end local v13    # "mButton":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_92
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitleNoPadding:Z

    move/from16 v17, v0

    if-nez v17, :cond_2d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2d

    .line 251
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitlePaddingFull:I

    move/from16 v17, v0

    add-int p3, p3, v17

    goto :goto_2d

    .line 267
    :cond_ab
    move/from16 v6, p5

    .line 268
    .local v6, "barBottom":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    move/from16 v17, v0

    if-eqz v17, :cond_bd

    .line 269
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v17, v0

    sub-int v6, v6, v17

    .line 270
    :cond_bd
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonBarHeight:I

    move/from16 v17, v0

    sub-int v7, v6, v17

    .line 282
    .local v7, "barTop":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonHorizontalEdgeMargin:I

    move/from16 v16, v0

    .line 285
    .local v16, "offset":I
    const/4 v14, -0x1

    .line 286
    .local v14, "neutralLeft":I
    const/4 v15, -0x1

    .line 288
    .local v15, "neutralRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget-object v17, v17, v18

    invoke-static/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_11c

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v17, v0

    sget-object v18, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_1b6

    .line 291
    add-int v8, p2, v16

    .line 292
    .local v8, "bl":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v9, v8, v17

    .line 298
    .local v9, "br":I
    :goto_fd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v7, v9, v6}, Lcom/afollestad/materialdialogs/internal/MDButton;->layout(IIII)V

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v16, v16, v17

    .line 302
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_11c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget-object v17, v17, v18

    invoke-static/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_15b

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v17, v0

    sget-object v18, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_1cb

    .line 305
    add-int v8, p2, v16

    .line 306
    .restart local v8    # "bl":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v9, v8, v17

    .line 315
    .restart local v9    # "br":I
    :goto_14c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v7, v9, v6}, Lcom/afollestad/materialdialogs/internal/MDButton;->layout(IIII)V

    .line 318
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_15b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-static/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_1a0

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v17, v0

    sget-object v18, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_208

    .line 321
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonHorizontalEdgeMargin:I

    move/from16 v17, v0

    sub-int v9, p4, v17

    .line 322
    .restart local v9    # "br":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    sub-int v8, v9, v17

    .line 339
    .restart local v8    # "bl":I
    :goto_191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v7, v9, v6}, Lcom/afollestad/materialdialogs/internal/MDButton;->layout(IIII)V

    .line 343
    .end local v6    # "barBottom":I
    .end local v7    # "barTop":I
    .end local v8    # "bl":I
    .end local v9    # "br":I
    .end local v14    # "neutralLeft":I
    .end local v15    # "neutralRight":I
    .end local v16    # "offset":I
    :cond_1a0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setUpDividersVisibility(Landroid/view/View;ZZ)V

    .line 344
    return-void

    .line 294
    .restart local v6    # "barBottom":I
    .restart local v7    # "barTop":I
    .restart local v14    # "neutralLeft":I
    .restart local v15    # "neutralRight":I
    .restart local v16    # "offset":I
    :cond_1b6
    sub-int v9, p4, v16

    .line 295
    .restart local v9    # "br":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    sub-int v8, v9, v17

    .line 296
    .restart local v8    # "bl":I
    move v15, v8

    goto/16 :goto_fd

    .line 307
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_1cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v17, v0

    sget-object v18, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_1ed

    .line 308
    sub-int v9, p4, v16

    .line 309
    .restart local v9    # "br":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    sub-int v8, v9, v17

    .restart local v8    # "bl":I
    goto/16 :goto_14c

    .line 311
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_1ed
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonHorizontalEdgeMargin:I

    move/from16 v17, v0

    add-int v8, p2, v17

    .line 312
    .restart local v8    # "bl":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v9, v8, v17

    .line 313
    .restart local v9    # "br":I
    move v14, v9

    goto/16 :goto_14c

    .line 323
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v17, v0

    sget-object v18, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_230

    .line 324
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonHorizontalEdgeMargin:I

    move/from16 v17, v0

    add-int v8, p2, v17

    .line 325
    .restart local v8    # "bl":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v9, v8, v17

    .restart local v9    # "br":I
    goto/16 :goto_191

    .line 327
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_230
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v14, v0, :cond_250

    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_250

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    sub-int v14, v15, v17

    .line 335
    :cond_24c
    :goto_24c
    move v8, v14

    .line 336
    .restart local v8    # "bl":I
    move v9, v15

    .restart local v9    # "br":I
    goto/16 :goto_191

    .line 329
    .end local v8    # "bl":I
    .end local v9    # "br":I
    :cond_250
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_26d

    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v14, v0, :cond_26d

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v15, v14, v17

    goto :goto_24c

    .line 331
    :cond_26d
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_24c

    .line 332
    sub-int v17, p4, p2

    div-int/lit8 v17, v17, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget-object v18, v18, v19

    invoke-virtual/range {v18 .. v18}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v18

    div-int/lit8 v18, v18, 0x2

    sub-int v14, v17, v18

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    invoke-virtual/range {v17 .. v17}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v17

    add-int v15, v14, v17

    goto :goto_24c
.end method

.method public onMeasure(II)V
    .registers 25
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 133
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v17

    .line 134
    .local v17, "width":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v11

    .line 136
    .local v11, "height":I
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 137
    const/4 v10, 0x0

    .line 140
    .local v10, "hasButtons":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    move/from16 v18, v0

    if-nez v18, :cond_99

    .line 141
    const/4 v8, 0x0

    .line 142
    .local v8, "buttonsWidth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .local v3, "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    array-length v13, v3

    .local v13, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_20
    if-ge v12, v13, :cond_4a

    aget-object v5, v3, v12

    .line 143
    .local v5, "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    if-eqz v5, :cond_47

    invoke-static {v5}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v18

    if-eqz v18, :cond_47

    .line 144
    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStacked(ZZ)V

    .line 145
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v5, v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->measureChild(Landroid/view/View;II)V

    .line 146
    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredWidth()I

    move-result v18

    add-int v8, v8, v18

    .line 147
    const/4 v10, 0x1

    .line 142
    :cond_47
    add-int/lit8 v12, v12, 0x1

    goto :goto_20

    .line 151
    .end local v5    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_4a
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    sget v19, Lcom/afollestad/materialdialogs/R$dimen;->md_neutral_button_margin:I

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 153
    .local v6, "buttonBarPadding":I
    mul-int/lit8 v18, v6, 0x2

    sub-int v7, v17, v18

    .line 154
    .local v7, "buttonFrameWidth":I
    if-le v8, v7, :cond_97

    const/4 v15, 0x1

    .line 159
    .end local v3    # "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v6    # "buttonBarPadding":I
    .end local v7    # "buttonFrameWidth":I
    .end local v8    # "buttonsWidth":I
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .local v15, "stacked":Z
    :goto_5f
    const/16 v16, 0x0

    .line 160
    .local v16, "stackedHeight":I
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    .line 161
    if-eqz v15, :cond_9b

    .line 162
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .restart local v3    # "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    array-length v13, v3

    .restart local v13    # "len$":I
    const/4 v12, 0x0

    .restart local v12    # "i$":I
    :goto_6d
    if-ge v12, v13, :cond_9b

    aget-object v5, v3, v12

    .line 163
    .restart local v5    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    if-eqz v5, :cond_94

    invoke-static {v5}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v18

    if-eqz v18, :cond_94

    .line 164
    const/16 v18, 0x1

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStacked(ZZ)V

    .line 165
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v5, v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->measureChild(Landroid/view/View;II)V

    .line 166
    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/internal/MDButton;->getMeasuredHeight()I

    move-result v18

    add-int v16, v16, v18

    .line 167
    const/4 v10, 0x1

    .line 162
    :cond_94
    add-int/lit8 v12, v12, 0x1

    goto :goto_6d

    .line 154
    .end local v5    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v15    # "stacked":Z
    .end local v16    # "stackedHeight":I
    .restart local v6    # "buttonBarPadding":I
    .restart local v7    # "buttonFrameWidth":I
    .restart local v8    # "buttonsWidth":I
    :cond_97
    const/4 v15, 0x0

    goto :goto_5f

    .line 156
    .end local v3    # "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v6    # "buttonBarPadding":I
    .end local v7    # "buttonFrameWidth":I
    .end local v8    # "buttonsWidth":I
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    :cond_99
    const/4 v15, 0x1

    .restart local v15    # "stacked":Z
    goto :goto_5f

    .line 172
    .restart local v16    # "stackedHeight":I
    :cond_9b
    move v4, v11

    .line 173
    .local v4, "availableHeight":I
    const/4 v9, 0x0

    .line 174
    .local v9, "fullPadding":I
    const/4 v14, 0x0

    .line 175
    .local v14, "minPadding":I
    if-eqz v10, :cond_170

    .line 176
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mIsStacked:Z

    move/from16 v18, v0

    if-eqz v18, :cond_15c

    .line 177
    sub-int v4, v4, v16

    .line 178
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    add-int v9, v9, v18

    .line 179
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    add-int v14, v14, v18

    .line 190
    :goto_be
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v18

    if-eqz v18, :cond_17c

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Landroid/view/View;->measure(II)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v4, v4, v18

    .line 198
    :cond_eb
    :goto_eb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v18

    if-eqz v18, :cond_150

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    sub-int v20, v4, v14

    const/high16 v21, -0x80000000

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v20

    invoke-virtual/range {v18 .. v20}, Landroid/view/View;->measure(II)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v19, v4, v9

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_1a5

    .line 203
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mReducePaddingNoTitleNoButtons:Z

    move/from16 v18, v0

    if-eqz v18, :cond_13a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mTitleBar:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->isVisible(Landroid/view/View;)Z

    move-result v18

    if-nez v18, :cond_13a

    if-eqz v10, :cond_18e

    .line 204
    :cond_13a
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    add-int v18, v18, v9

    sub-int v4, v4, v18

    .line 217
    :cond_150
    :goto_150
    sub-int v18, v11, v4

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setMeasuredDimension(II)V

    .line 218
    return-void

    .line 181
    :cond_15c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonBarHeight:I

    move/from16 v18, v0

    sub-int v4, v4, v18

    .line 182
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    add-int v9, v9, v18

    goto/16 :goto_be

    .line 187
    :cond_170
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonPaddingFull:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    add-int v9, v9, v18

    goto/16 :goto_be

    .line 194
    :cond_17c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitleNoPadding:Z

    move/from16 v18, v0

    if-nez v18, :cond_eb

    .line 195
    move-object/from16 v0, p0

    iget v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mNoTitlePaddingFull:I

    move/from16 v18, v0

    add-int v9, v9, v18

    goto/16 :goto_eb

    .line 207
    :cond_18e
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mContent:Landroid/view/View;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    add-int v18, v18, v14

    sub-int v4, v4, v18

    goto :goto_150

    .line 211
    :cond_1a5
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mUseFullPadding:Z

    .line 212
    const/4 v4, 0x0

    goto :goto_150
.end method

.method public setButtonGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;

    .prologue
    .line 357
    iput-object p1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtonGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 358
    return-void
.end method

.method public setButtonStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V
    .registers 6
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;

    .local v0, "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_10

    aget-object v3, v0, v1

    .line 362
    .local v3, "mButton":Lcom/afollestad/materialdialogs/internal/MDButton;
    if-eqz v3, :cond_d

    .line 363
    invoke-virtual {v3, p1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V

    .line 361
    :cond_d
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 365
    .end local v3    # "mButton":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_10
    return-void
.end method

.method public setDividerColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 352
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mDividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 353
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidate()V

    .line 354
    return-void
.end method

.method public setForceStack(Z)V
    .registers 2
    .param p1, "forceStack"    # Z

    .prologue
    .line 347
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mForceStack:Z

    .line 348
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidate()V

    .line 349
    return-void
.end method
