.class public Landroid/support/design/widget/CollapsingToolbarLayout;
.super Landroid/widget/FrameLayout;
.source "CollapsingToolbarLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;,
        Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;
    }
.end annotation


# static fields
.field private static final SCRIM_ANIMATION_DURATION:I = 0x258


# instance fields
.field private final mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

.field private mContentScrim:Landroid/graphics/drawable/Drawable;

.field private mCurrentOffset:I

.field private mDummyView:Landroid/view/View;

.field private mExpandedMarginBottom:I

.field private mExpandedMarginLeft:I

.field private mExpandedMarginRight:I

.field private mExpandedMarginTop:I

.field private mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

.field private mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

.field private mRefreshToolbar:Z

.field private mScrimAlpha:I

.field private mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private mScrimsAreShown:Z

.field private mStatusBarScrim:Landroid/graphics/drawable/Drawable;

.field private final mTmpRect:Landroid/graphics/Rect;

.field private mToolbar:Landroid/support/v7/widget/Toolbar;

.field private mToolbarId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 119
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 122
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 88
    iput-boolean v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    .line 98
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    .line 124
    new-instance v6, Landroid/support/design/widget/CollapsingTextHelper;

    invoke-direct {v6, p0}, Landroid/support/design/widget/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    .line 125
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    const/16 v7, 0x50

    invoke-virtual {v6, v7}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextVerticalGravity(I)V

    .line 126
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    sget-object v7, Landroid/support/design/widget/AnimationUtils;->DECELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v6, v7}, Landroid/support/design/widget/CollapsingTextHelper;->setTextSizeInterpolator(Landroid/view/animation/Interpolator;)V

    .line 128
    sget-object v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout:[I

    sget v7, Landroid/support/design/R$style;->Widget_Design_CollapsingToolbar:I

    invoke-virtual {p1, p2, v6, p3, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 132
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMargin:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    .line 135
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v6

    if-ne v6, v1, :cond_c7

    .line 137
    .local v1, "isRtl":Z
    :goto_3f
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_51

    .line 138
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 140
    .local v3, "marginStart":I
    if-eqz v1, :cond_ca

    .line 141
    iput v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    .line 146
    .end local v3    # "marginStart":I
    :cond_51
    :goto_51
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_63

    .line 147
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    .line 149
    .local v2, "marginEnd":I
    if-eqz v1, :cond_cd

    .line 150
    iput v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    .line 155
    .end local v2    # "marginEnd":I
    :cond_63
    :goto_63
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_73

    .line 156
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    .line 159
    :cond_73
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_83

    .line 160
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    .line 164
    :cond_83
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleTextAppearance:I

    sget v7, Landroid/support/design/R$style;->TextAppearance_AppCompat_Title:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 167
    .local v4, "tp":I
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v6, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    .line 169
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_collapsedTitleTextAppearance:I

    sget v7, Landroid/support/design/R$style;->TextAppearance_AppCompat_Widget_ActionBar_Title:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 172
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v6, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 174
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_contentScrim:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 175
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_statusBarScrim:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 177
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_toolbarId:I

    const/4 v7, -0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    .line 179
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 181
    invoke-virtual {p0, v5}, Landroid/support/design/widget/CollapsingToolbarLayout;->setWillNotDraw(Z)V

    .line 183
    new-instance v5, Landroid/support/design/widget/CollapsingToolbarLayout$1;

    invoke-direct {v5, p0}, Landroid/support/design/widget/CollapsingToolbarLayout$1;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;)V

    invoke-static {p0, v5}, Landroid/support/v4/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroid/support/v4/view/OnApplyWindowInsetsListener;)V

    .line 193
    return-void

    .end local v1    # "isRtl":Z
    .end local v4    # "tp":I
    :cond_c7
    move v1, v5

    .line 135
    goto/16 :goto_3f

    .line 143
    .restart local v1    # "isRtl":Z
    .restart local v3    # "marginStart":I
    :cond_ca
    iput v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    goto :goto_51

    .line 152
    .end local v3    # "marginStart":I
    .restart local v2    # "marginEnd":I
    :cond_cd
    iput v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    goto :goto_63
.end method

.method static synthetic access$000(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    return-object v0
.end method

.method static synthetic access$002(Landroid/support/design/widget/CollapsingToolbarLayout;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # Landroid/support/v4/view/WindowInsetsCompat;

    .prologue
    .line 84
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    return-object p1
.end method

.method static synthetic access$200(Landroid/support/design/widget/CollapsingToolbarLayout;I)V
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout;->setScrimAlpha(I)V

    return-void
.end method

.method static synthetic access$302(Landroid/support/design/widget/CollapsingToolbarLayout;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # I

    .prologue
    .line 84
    iput p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    return p1
.end method

.method static synthetic access$400(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;
    .registers 2
    .param p0, "x0"    # Landroid/view/View;

    .prologue
    .line 84
    invoke-static {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$600(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/design/widget/CollapsingToolbarLayout;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->showScrim()V

    return-void
.end method

.method static synthetic access$800(Landroid/support/design/widget/CollapsingToolbarLayout;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->hideScrim()V

    return-void
.end method

.method static synthetic access$900(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/design/widget/CollapsingTextHelper;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    return-object v0
.end method

.method private animateScrim(I)V
    .registers 4
    .param p1, "targetAlpha"    # I

    .prologue
    .line 401
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 402
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v0, :cond_32

    .line 403
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 404
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    const/16 v1, 0x258

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 405
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 406
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v1, Landroid/support/design/widget/CollapsingToolbarLayout$2;

    invoke-direct {v1, p0}, Landroid/support/design/widget/CollapsingToolbarLayout$2;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 416
    :cond_25
    :goto_25
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1, p1}, Landroid/support/design/widget/ValueAnimatorCompat;->setIntValues(II)V

    .line 417
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 418
    return-void

    .line 412
    :cond_32
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_25

    .line 413
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_25
.end method

.method private ensureToolbar()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 271
    iget-boolean v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    if-nez v5, :cond_7

    .line 313
    :goto_6
    return-void

    .line 275
    :cond_7
    const/4 v2, 0x0

    .local v2, "fallback":Landroid/support/v7/widget/Toolbar;
    const/4 v4, 0x0

    .line 277
    .local v4, "selected":Landroid/support/v7/widget/Toolbar;
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_e
    if-ge v3, v1, :cond_27

    .line 278
    invoke-virtual {p0, v3}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 279
    .local v0, "child":Landroid/view/View;
    instance-of v5, v0, Landroid/support/v7/widget/Toolbar;

    if-eqz v5, :cond_49

    .line 280
    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    if-eq v5, v7, :cond_4c

    .line 282
    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v5, v6, :cond_44

    move-object v4, v0

    .line 284
    check-cast v4, Landroid/support/v7/widget/Toolbar;

    .line 299
    .end local v0    # "child":Landroid/view/View;
    :cond_27
    :goto_27
    if-nez v4, :cond_2a

    .line 301
    move-object v4, v2

    .line 304
    :cond_2a
    if-eqz v4, :cond_50

    .line 305
    iput-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 306
    new-instance v5, Landroid/view/View;

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    .line 307
    iget-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    invoke-virtual {v5, v6, v7, v7}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;II)V

    .line 312
    :goto_40
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    goto :goto_6

    .line 287
    .restart local v0    # "child":Landroid/view/View;
    :cond_44
    if-nez v2, :cond_49

    move-object v2, v0

    .line 289
    check-cast v2, Landroid/support/v7/widget/Toolbar;

    .line 277
    :cond_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_4c
    move-object v4, v0

    .line 293
    check-cast v4, Landroid/support/v7/widget/Toolbar;

    .line 294
    goto :goto_27

    .line 309
    .end local v0    # "child":Landroid/view/View;
    :cond_50
    iput-object v8, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 310
    iput-object v8, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    goto :goto_40
.end method

.method private static getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;
    .registers 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 361
    sget v1, Landroid/support/design/R$id;->view_offset_helper:I

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/ViewOffsetHelper;

    .line 362
    .local v0, "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    if-nez v0, :cond_14

    .line 363
    new-instance v0, Landroid/support/design/widget/ViewOffsetHelper;

    .end local v0    # "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    invoke-direct {v0, p0}, Landroid/support/design/widget/ViewOffsetHelper;-><init>(Landroid/view/View;)V

    .line 364
    .restart local v0    # "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    sget v1, Landroid/support/design/R$id;->view_offset_helper:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 366
    :cond_14
    return-object v0
.end method

.method private hideScrim()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 390
    iget-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    if-eqz v0, :cond_16

    .line 391
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_17

    .line 392
    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->animateScrim(I)V

    .line 396
    :goto_14
    iput-boolean v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    .line 398
    :cond_16
    return-void

    .line 394
    :cond_17
    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->setScrimAlpha(I)V

    goto :goto_14
.end method

.method private setScrimAlpha(I)V
    .registers 4
    .param p1, "alpha"    # I

    .prologue
    .line 421
    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-eq p1, v1, :cond_16

    .line 422
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    .line 423
    .local v0, "contentScrim":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_11

    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v1, :cond_11

    .line 424
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 426
    :cond_11
    iput p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    .line 427
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 429
    .end local v0    # "contentScrim":Landroid/graphics/drawable/Drawable;
    :cond_16
    return-void
.end method

.method private showScrim()V
    .registers 3

    .prologue
    const/16 v1, 0xff

    .line 379
    iget-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    if-nez v0, :cond_18

    .line 380
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_19

    .line 381
    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->animateScrim(I)V

    .line 385
    :goto_15
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    .line 387
    :cond_18
    return-void

    .line 383
    :cond_19
    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->setScrimAlpha(I)V

    goto :goto_15
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 596
    instance-of v0, p1, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 222
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 226
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 227
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-nez v2, :cond_23

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_23

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v2, :cond_23

    .line 228
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 229
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 233
    :cond_23
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v2, p1}, Landroid/support/design/widget/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 236
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_5c

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v2, :cond_5c

    .line 237
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v2, :cond_5d

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v2}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    .line 238
    .local v0, "topInset":I
    :goto_3a
    if-lez v0, :cond_5c

    .line 239
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    neg-int v3, v3

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getWidth()I

    move-result v4

    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    sub-int v5, v0, v5

    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 241
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 242
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 245
    .end local v0    # "topInset":I
    :cond_5c
    return-void

    :cond_5d
    move v0, v1

    .line 237
    goto :goto_3a
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .prologue
    .line 252
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 253
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne p2, v0, :cond_1f

    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1f

    iget v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v0, :cond_1f

    .line 254
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 255
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 259
    :cond_1f
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v0

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;
    .registers 3

    .prologue
    .line 601
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-super {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .registers 2

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 606
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 611
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getContentScrim()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 486
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method final getScrimTriggerOffset()I
    .registers 2

    .prologue
    .line 591
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getStatusBarScrim()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 546
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .registers 4

    .prologue
    .line 197
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 200
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 201
    .local v0, "parent":Landroid/view/ViewParent;
    instance-of v1, v0, Landroid/support/design/widget/AppBarLayout;

    if-eqz v1, :cond_1e

    .line 202
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    if-nez v1, :cond_17

    .line 203
    new-instance v1, Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;Landroid/support/design/widget/CollapsingToolbarLayout$1;)V

    iput-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    .line 205
    :cond_17
    check-cast v0, Landroid/support/design/widget/AppBarLayout;

    .end local v0    # "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/AppBarLayout;->addOnOffsetChangedListener(Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;)V

    .line 207
    :cond_1e
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 212
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 213
    .local v0, "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    if-eqz v1, :cond_13

    instance-of v1, v0, Landroid/support/design/widget/AppBarLayout;

    if-eqz v1, :cond_13

    .line 214
    check-cast v0, Landroid/support/design/widget/AppBarLayout;

    .end local v0    # "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/AppBarLayout;->removeOnOffsetChangedListener(Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;)V

    .line 217
    :cond_13
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 218
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 15
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 323
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 326
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildCount()I

    move-result v3

    .local v3, "z":I
    :goto_8
    if-ge v1, v3, :cond_31

    .line 327
    invoke-virtual {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 329
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v4, :cond_27

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_27

    .line 330
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v4}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v2

    .line 331
    .local v2, "insetTop":I
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v4

    if-ge v4, v2, :cond_27

    .line 334
    invoke-virtual {v0, v2}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 338
    .end local v2    # "insetTop":I
    :cond_27
    invoke-static {v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/design/widget/ViewOffsetHelper;->onViewLayout()V

    .line 326
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 342
    .end local v0    # "child":Landroid/view/View;
    :cond_31
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    if-eqz v4, :cond_6d

    .line 343
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    iget-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-static {p0, v4, v5}, Landroid/support/design/widget/ViewGroupUtils;->getDescendantRect(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 344
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    sub-int v6, p5, v6

    iget-object v7, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    invoke-virtual {v4, v5, v6, v7, p5}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedBounds(IIII)V

    .line 347
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    add-int/2addr v5, p2

    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    iget v7, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    add-int/2addr v6, v7

    iget v7, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    sub-int v7, p4, v7

    iget v8, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    sub-int v8, p5, v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedBounds(IIII)V

    .line 351
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v4}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 355
    :cond_6d
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v4, :cond_7a

    .line 356
    iget-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/support/design/widget/CollapsingToolbarLayout;->setMinimumHeight(I)V

    .line 358
    :cond_7a
    return-void
.end method

.method protected onMeasure(II)V
    .registers 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 317
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 318
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 319
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v1, 0x0

    .line 264
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 265
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_d

    .line 266
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 268
    :cond_d
    return-void
.end method

.method public setCollapsedTitleTextAppearance(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 556
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 557
    return-void
.end method

.method public setCollapsedTitleTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 565
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 566
    return-void
.end method

.method public setContentScrim(Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 441
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_2b

    .line 442
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    .line 443
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 446
    :cond_f
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    .line 447
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getHeight()I

    move-result v1

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 448
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 449
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 450
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 452
    :cond_2b
    return-void
.end method

.method public setContentScrimColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 463
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 464
    return-void
.end method

.method public setContentScrimResource(I)V
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 475
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 477
    return-void
.end method

.method public setExpandedTitleColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 584
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextColor(I)V

    .line 585
    return-void
.end method

.method public setExpandedTitleTextAppearance(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 575
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    .line 576
    return-void
.end method

.method public setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 501
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_1f

    .line 502
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    .line 503
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 506
    :cond_e
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    .line 507
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 508
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 509
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 511
    :cond_1f
    return-void
.end method

.method public setStatusBarScrimColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 524
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 525
    return-void
.end method

.method public setStatusBarScrimResource(I)V
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 536
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 537
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 375
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 376
    return-void
.end method
