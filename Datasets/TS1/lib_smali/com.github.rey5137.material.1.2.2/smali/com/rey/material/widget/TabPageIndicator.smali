.class public Lcom/rey/material/widget/TabPageIndicator;
.super Landroid/widget/HorizontalScrollView;
.source "TabPageIndicator.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;
    }
.end annotation


# static fields
.field public static final MODE_FIXED:I = 0x1

.field public static final MODE_SCROLL:I


# instance fields
.field protected mCurrentStyle:I

.field private mIndicatorAtTop:Z

.field private mIndicatorHeight:I

.field private mIndicatorOffset:I

.field private mIndicatorWidth:I

.field private mIsRtl:Z

.field private mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mMode:I

.field private mObserver:Landroid/database/DataSetObserver;

.field private mPaint:Landroid/graphics/Paint;

.field private mScrolling:Z

.field private mSelectedPosition:I

.field protected mStyleId:I

.field private mTabAnimSelector:Ljava/lang/Runnable;

.field private mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

.field private mTabPadding:I

.field private mTabRippleStyle:I

.field private mTabSingleLine:Z

.field private mTextAppearance:I

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    .line 63
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabPageIndicator$1;-><init>(Lcom/rey/material/widget/TabPageIndicator;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    .line 80
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/TabPageIndicator;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    .line 63
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabPageIndicator$1;-><init>(Lcom/rey/material/widget/TabPageIndicator;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    .line 86
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/TabPageIndicator;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 90
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    .line 63
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabPageIndicator$1;-><init>(Lcom/rey/material/widget/TabPageIndicator;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    .line 92
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/TabPageIndicator;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 93
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 97
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    .line 63
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabPageIndicator$1;-><init>(Lcom/rey/material/widget/TabPageIndicator;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    .line 99
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/TabPageIndicator;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/TabPageIndicator;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetChanged()V

    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/widget/TabPageIndicator;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetInvalidated()V

    return-void
.end method

.method static synthetic access$200(Lcom/rey/material/widget/TabPageIndicator;I)Lcom/rey/material/widget/CheckedTextView;
    .registers 3
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;
    .param p1, "x1"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/rey/material/widget/TabPageIndicator;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mScrolling:Z

    return v0
.end method

.method static synthetic access$400(Lcom/rey/material/widget/TabPageIndicator;II)V
    .registers 3
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/TabPageIndicator;->updateIndicator(II)V

    return-void
.end method

.method static synthetic access$502(Lcom/rey/material/widget/TabPageIndicator;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$600(Lcom/rey/material/widget/TabPageIndicator;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;

    .prologue
    .line 31
    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/TabPageIndicator;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabPageIndicator;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIsRtl:Z

    return v0
.end method

.method private addTemporaryTab()V
    .registers 11

    .prologue
    const/4 v9, -0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 523
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    const/4 v4, 0x3

    if-ge v0, v4, :cond_78

    .line 524
    const/4 v2, 0x0

    .line 525
    .local v2, "title":Ljava/lang/CharSequence;
    if-nez v0, :cond_58

    .line 526
    const-string v2, "TAB ONE"

    .line 532
    :cond_c
    :goto_c
    new-instance v3, Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/rey/material/widget/CheckedTextView;-><init>(Landroid/content/Context;)V

    .line 533
    .local v3, "tv":Lcom/rey/material/widget/CheckedTextView;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 534
    invoke-virtual {v3, v2}, Lcom/rey/material/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 535
    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CheckedTextView;->setGravity(I)V

    .line 536
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v4

    iget v7, p0, Lcom/rey/material/widget/TabPageIndicator;->mTextAppearance:I

    invoke-virtual {v3, v4, v7}, Lcom/rey/material/widget/CheckedTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 537
    invoke-virtual {v3, v5}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    .line 538
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CheckedTextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 539
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CheckedTextView;->setTag(Ljava/lang/Object;)V

    .line 540
    if-nez v0, :cond_63

    move v4, v5

    :goto_3c
    invoke-virtual {v3, v4}, Lcom/rey/material/widget/CheckedTextView;->setChecked(Z)V

    .line 541
    iget v4, p0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    if-nez v4, :cond_65

    .line 542
    iget v4, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    iget v7, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    invoke-virtual {v3, v4, v6, v7, v6}, Lcom/rey/material/widget/CheckedTextView;->setPadding(IIII)V

    .line 543
    iget-object v4, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v7, v8, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v3, v7}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 523
    :cond_55
    :goto_55
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 527
    .end local v3    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_58
    if-ne v0, v5, :cond_5d

    .line 528
    const-string v2, "TAB TWO"

    goto :goto_c

    .line 529
    :cond_5d
    const/4 v4, 0x2

    if-ne v0, v4, :cond_c

    .line 530
    const-string v2, "TAB THREE"

    goto :goto_c

    .restart local v3    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_63
    move v4, v6

    .line 540
    goto :goto_3c

    .line 545
    :cond_65
    iget v4, p0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    if-ne v4, v5, :cond_55

    .line 546
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 547
    .local v1, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 548
    iget-object v4, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v4, v3, v1}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_55

    .line 551
    .end local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    .end local v2    # "title":Ljava/lang/CharSequence;
    .end local v3    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_78
    return-void
.end method

.method private animateToTab(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 304
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    if-nez v0, :cond_7

    .line 324
    :goto_6
    return-void

    .line 307
    :cond_7
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_10

    .line 308
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 310
    :cond_10
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$2;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/widget/TabPageIndicator$2;-><init>(Lcom/rey/material/widget/TabPageIndicator;I)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    .line 323
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->post(Ljava/lang/Runnable;)Z

    goto :goto_6
.end method

.method private getTabView(I)Lcom/rey/material/widget/CheckedTextView;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 300
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/rey/material/widget/CheckedTextView;

    return-object v0
.end method

.method private notifyDataSetChanged()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 466
    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->removeAllViews()V

    .line 468
    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 469
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 471
    .local v1, "count":I
    iget v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    if-le v5, v1, :cond_18

    .line 472
    add-int/lit8 v5, v1, -0x1

    iput v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    .line 474
    :cond_18
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_19
    if-ge v2, v1, :cond_8c

    .line 475
    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 476
    .local v3, "title":Ljava/lang/CharSequence;
    if-nez v3, :cond_23

    .line 477
    const-string v3, "NULL"

    .line 479
    :cond_23
    new-instance v4, Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/rey/material/widget/CheckedTextView;-><init>(Landroid/content/Context;)V

    .line 480
    .local v4, "tv":Lcom/rey/material/widget/CheckedTextView;
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 481
    invoke-virtual {v4, v3}, Lcom/rey/material/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 482
    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setGravity(I)V

    .line 483
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, p0, Lcom/rey/material/widget/TabPageIndicator;->mTextAppearance:I

    invoke-virtual {v4, v5, v6}, Lcom/rey/material/widget/CheckedTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 484
    iget-boolean v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabSingleLine:Z

    if-eqz v5, :cond_84

    .line 485
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    .line 490
    :goto_49
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 491
    invoke-virtual {v4, p0}, Lcom/rey/material/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 492
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setTag(Ljava/lang/Object;)V

    .line 493
    iget v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabRippleStyle:I

    if-lez v5, :cond_6e

    .line 494
    new-instance v5, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v6

    iget v7, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabRippleStyle:I

    invoke-direct {v5, v6, v7}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v5}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 496
    :cond_6e
    iget v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    iget v6, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    invoke-virtual {v4, v5, v9, v6, v9}, Lcom/rey/material/widget/CheckedTextView;->setPadding(IIII)V

    .line 497
    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x2

    const/4 v8, -0x1

    invoke-direct {v6, v7, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v6}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 474
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 487
    :cond_84
    invoke-virtual {v4, v9}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    .line 488
    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/CheckedTextView;->setMaxLines(I)V

    goto :goto_49

    .line 500
    .end local v3    # "title":Ljava/lang/CharSequence;
    .end local v4    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_8c
    iget v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator;->setCurrentItem(I)V

    .line 501
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->requestLayout()V

    .line 502
    return-void
.end method

.method private notifyDataSetInvalidated()V
    .registers 7

    .prologue
    .line 505
    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 506
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 507
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v1, :cond_21

    .line 508
    invoke-direct {p0, v2}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v4

    .line 510
    .local v4, "tv":Landroid/widget/TextView;
    if-eqz v4, :cond_1e

    .line 511
    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 512
    .local v3, "title":Ljava/lang/CharSequence;
    if-nez v3, :cond_1b

    .line 513
    const-string v3, "NULL"

    .line 515
    :cond_1b
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 507
    .end local v3    # "title":Ljava/lang/CharSequence;
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 519
    .end local v4    # "tv":Landroid/widget/TextView;
    :cond_21
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->requestLayout()V

    .line 520
    return-void
.end method

.method private updateIndicator(II)V
    .registers 3
    .param p1, "offset"    # I
    .param p2, "width"    # I

    .prologue
    .line 378
    iput p1, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorOffset:I

    .line 379
    iput p2, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorWidth:I

    .line 380
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->invalidate()V

    .line 381
    return-void
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 128
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 129
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/TabPageIndicator;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 130
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 21
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 133
    sget-object v12, Lcom/rey/material/R$styleable;->TabPageIndicator:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v12, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 135
    .local v4, "a":Landroid/content/res/TypedArray;
    const/4 v10, 0x0

    .line 136
    .local v10, "textAppearance":I
    const/4 v8, -0x1

    .line 137
    .local v8, "mode":I
    const/4 v9, 0x0

    .line 139
    .local v9, "rippleStyle":I
    const/4 v7, 0x0

    .local v7, "i":I
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v6

    .local v6, "count":I
    :goto_16
    if-ge v7, v6, :cond_85

    .line 140
    invoke-virtual {v4, v7}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 141
    .local v5, "attr":I
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabPadding:I

    if-ne v5, v12, :cond_2c

    .line 142
    const/4 v12, 0x0

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    .line 139
    :cond_29
    :goto_29
    add-int/lit8 v7, v7, 0x1

    goto :goto_16

    .line 143
    :cond_2c
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabRipple:I

    if-ne v5, v12, :cond_36

    .line 144
    const/4 v12, 0x0

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    goto :goto_29

    .line 145
    :cond_36
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorColor:I

    if-ne v5, v12, :cond_47

    .line 146
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    const/4 v13, 0x0

    invoke-virtual {v4, v5, v13}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_29

    .line 147
    :cond_47
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorHeight:I

    if-ne v5, v12, :cond_55

    .line 148
    const/4 v12, 0x0

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    goto :goto_29

    .line 149
    :cond_55
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorAtTop:I

    if-ne v5, v12, :cond_63

    .line 150
    const/4 v12, 0x1

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorAtTop:Z

    goto :goto_29

    .line 151
    :cond_63
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabSingleLine:I

    if-ne v5, v12, :cond_71

    .line 152
    const/4 v12, 0x1

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabSingleLine:Z

    goto :goto_29

    .line 153
    :cond_71
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_android_textAppearance:I

    if-ne v5, v12, :cond_7b

    .line 154
    const/4 v12, 0x0

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    goto :goto_29

    .line 155
    :cond_7b
    sget v12, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_mode:I

    if-ne v5, v12, :cond_29

    .line 156
    const/4 v12, 0x0

    invoke-virtual {v4, v5, v12}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v8

    goto :goto_29

    .line 159
    .end local v5    # "attr":I
    :cond_85
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 161
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    if-gez v12, :cond_9a

    .line 162
    const/16 v12, 0xc

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    .line 164
    :cond_9a
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    if-gez v12, :cond_ab

    .line 165
    const/4 v12, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    .line 167
    :cond_ab
    if-ltz v8, :cond_dc

    .line 168
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    if-ne v12, v8, :cond_b9

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/TabPageIndicator;->getChildCount()I

    move-result v12

    if-nez v12, :cond_dc

    .line 169
    :cond_b9
    move-object/from16 v0, p0

    iput v8, v0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    .line 170
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/TabPageIndicator;->removeAllViews()V

    .line 171
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    if-nez v12, :cond_109

    .line 172
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    new-instance v13, Landroid/view/ViewGroup$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x1

    invoke-direct {v13, v14, v15}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/rey/material/widget/TabPageIndicator;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/rey/material/widget/TabPageIndicator;->setFillViewport(Z)V

    .line 182
    :cond_dc
    :goto_dc
    if-eqz v10, :cond_127

    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTextAppearance:I

    if-eq v12, v10, :cond_127

    .line 183
    move-object/from16 v0, p0

    iput v10, v0, Lcom/rey/material/widget/TabPageIndicator;->mTextAppearance:I

    .line 184
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v12}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v6

    :goto_f1
    if-ge v7, v6, :cond_127

    .line 185
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v12, v7}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/rey/material/widget/CheckedTextView;

    .line 186
    .local v11, "tv":Lcom/rey/material/widget/CheckedTextView;
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTextAppearance:I

    move-object/from16 v0, p1

    invoke-virtual {v11, v0, v12}, Lcom/rey/material/widget/CheckedTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 184
    add-int/lit8 v7, v7, 0x1

    goto :goto_f1

    .line 175
    .end local v11    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_109
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mMode:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_dc

    .line 176
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    new-instance v13, Landroid/view/ViewGroup$LayoutParams;

    const/4 v14, -0x1

    const/4 v15, -0x1

    invoke-direct {v13, v14, v15}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/rey/material/widget/TabPageIndicator;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/rey/material/widget/TabPageIndicator;->setFillViewport(Z)V

    goto :goto_dc

    .line 190
    :cond_127
    if-eqz v9, :cond_15d

    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabRippleStyle:I

    if-eq v9, v12, :cond_15d

    .line 191
    move-object/from16 v0, p0

    iput v9, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabRippleStyle:I

    .line 192
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v12}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v6

    :goto_13c
    if-ge v7, v6, :cond_15d

    .line 193
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v12, v7}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    new-instance v13, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/TabPageIndicator;->getContext()Landroid/content/Context;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabPageIndicator;->mTabRippleStyle:I

    invoke-direct {v13, v14, v15}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v13}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 192
    add-int/lit8 v7, v7, 0x1

    goto :goto_13c

    .line 196
    :cond_15d
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v12, :cond_166

    .line 197
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetChanged()V

    .line 198
    :cond_166
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/TabPageIndicator;->requestLayout()V

    .line 199
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x0

    .line 385
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->draw(Landroid/graphics/Canvas;)V

    .line 387
    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorOffset:I

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v1

    add-int v6, v0, v1

    .line 388
    .local v6, "x":I
    iget-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorAtTop:Z

    if-eqz v0, :cond_48

    move v7, v8

    .line 389
    .local v7, "y":I
    :goto_11
    int-to-float v1, v6

    int-to-float v2, v7

    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorWidth:I

    add-int/2addr v0, v6

    int-to-float v3, v0

    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    add-int/2addr v0, v7

    int-to-float v4, v0

    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 391
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 392
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v0

    int-to-float v1, v0

    int-to-float v2, v7

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v0

    iget-object v3, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v3, v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v3, v0

    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    add-int/2addr v0, v7

    int-to-float v4, v0

    iget-object v5, p0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 393
    :cond_47
    return-void

    .line 388
    .end local v7    # "y":I
    :cond_48
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    sub-int v7, v0, v1

    goto :goto_11
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, -0x1

    const/4 v0, 0x0

    .line 103
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->setHorizontalScrollBarEnabled(Z)V

    .line 105
    iput v2, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabPadding:I

    .line 106
    iput-boolean v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabSingleLine:Z

    .line 107
    iput v2, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorHeight:I

    .line 108
    iput-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIndicatorAtTop:Z

    .line 109
    iput-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mScrolling:Z

    .line 110
    iput-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIsRtl:Z

    .line 112
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    .line 113
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 114
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-static {p1, v2}, Lcom/rey/material/util/ThemeUtil;->colorAccent(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    new-instance v0, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;-><init>(Lcom/rey/material/widget/TabPageIndicator;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    .line 118
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/TabPageIndicator;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 120
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 121
    invoke-direct {p0}, Lcom/rey/material/widget/TabPageIndicator;->addTemporaryTab()V

    .line 123
    :cond_3c
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_48

    .line 124
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mStyleId:I

    .line 125
    :cond_48
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .prologue
    .line 212
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 214
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    .line 215
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->post(Ljava/lang/Runnable;)Z

    .line 217
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mStyleId:I

    if-eqz v0, :cond_1b

    .line 218
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 219
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 221
    :cond_1b
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 439
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 440
    .local v0, "position":I
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    if-ne v0, v1, :cond_17

    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_17

    .line 441
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v1, v0}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 443
    :cond_17
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 444
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 225
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 226
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    .line 227
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabPageIndicator;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 229
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mStyleId:I

    if-eqz v0, :cond_17

    .line 230
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 231
    :cond_17
    return-void
.end method

.method protected onMeasure(II)V
    .registers 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v12, 0x40000000    # 2.0f

    .line 244
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 245
    .local v5, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 246
    .local v6, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 247
    .local v1, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 249
    .local v2, "heightSize":I
    move v7, p1

    .line 250
    .local v7, "ws":I
    if-eqz v7, :cond_24

    .line 251
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v8

    sub-int v8, v6, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingRight()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v8, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 253
    :cond_24
    move v3, p2

    .line 254
    .local v3, "hs":I
    if-eqz v1, :cond_36

    .line 255
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingTop()I

    move-result v8

    sub-int v8, v2, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingBottom()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v8, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 257
    :cond_36
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8, v7, v3}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->measure(II)V

    .line 259
    const/4 v4, 0x0

    .line 260
    .local v4, "width":I
    sparse-switch v5, :sswitch_data_e6

    .line 272
    :goto_3f
    const/4 v0, 0x0

    .line 273
    .local v0, "height":I
    sparse-switch v1, :sswitch_data_f4

    .line 285
    :goto_43
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingRight()I

    move-result v10

    sub-int/2addr v9, v10

    if-ne v8, v9, :cond_69

    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingTop()I

    move-result v9

    sub-int v9, v0, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    if-eq v8, v9, :cond_8c

    .line 286
    :cond_69
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingRight()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-static {v9, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingTop()I

    move-result v10

    sub-int v10, v0, v10

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingBottom()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-static {v10, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v8, v9, v10}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->measure(II)V

    .line 288
    :cond_8c
    invoke-virtual {p0, v4, v0}, Lcom/rey/material/widget/TabPageIndicator;->setMeasuredDimension(II)V

    .line 289
    return-void

    .line 262
    .end local v0    # "height":I
    :sswitch_90
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingRight()I

    move-result v9

    add-int v4, v8, v9

    .line 263
    goto :goto_3f

    .line 265
    :sswitch_a2
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingRight()I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v8, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 266
    goto :goto_3f

    .line 268
    :sswitch_b7
    move v4, v6

    goto :goto_3f

    .line 275
    .restart local v0    # "height":I
    :sswitch_b9
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingBottom()I

    move-result v9

    add-int v0, v8, v9

    .line 276
    goto/16 :goto_43

    .line 278
    :sswitch_cc
    iget-object v8, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v8}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingBottom()I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v8, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 279
    goto/16 :goto_43

    .line 281
    :sswitch_e2
    move v0, v2

    goto/16 :goto_43

    .line 260
    nop

    :sswitch_data_e6
    .sparse-switch
        -0x80000000 -> :sswitch_a2
        0x0 -> :sswitch_90
        0x40000000 -> :sswitch_b7
    .end sparse-switch

    .line 273
    :sswitch_data_f4
    .sparse-switch
        -0x80000000 -> :sswitch_cc
        0x0 -> :sswitch_b9
        0x40000000 -> :sswitch_e2
    .end sparse-switch
.end method

.method public onPageScrollStateChanged(I)V
    .registers 5
    .param p1, "state"    # I

    .prologue
    .line 397
    if-nez p1, :cond_22

    .line 398
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mScrolling:Z

    .line 399
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    invoke-direct {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    .line 400
    .local v0, "tv":Landroid/widget/TextView;
    if-eqz v0, :cond_18

    .line 401
    invoke-virtual {v0}, Landroid/widget/TextView;->getLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/rey/material/widget/TabPageIndicator;->updateIndicator(II)V

    .line 407
    .end local v0    # "tv":Landroid/widget/TextView;
    :cond_18
    :goto_18
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_21

    .line 408
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v1, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 409
    :cond_21
    return-void

    .line 405
    :cond_22
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mScrolling:Z

    goto :goto_18
.end method

.method public onPageScrolled(IFI)V
    .registers 15
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    const/high16 v10, 0x3f000000    # 0.5f

    const/high16 v9, 0x40000000    # 2.0f

    .line 413
    iget-object v7, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v7, :cond_d

    .line 414
    iget-object v7, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v7, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 416
    :cond_d
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v3

    .line 417
    .local v3, "tv_scroll":Lcom/rey/material/widget/CheckedTextView;
    add-int/lit8 v7, p1, 0x1

    invoke-direct {p0, v7}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v2

    .line 419
    .local v2, "tv_next":Lcom/rey/material/widget/CheckedTextView;
    if-eqz v3, :cond_43

    if-eqz v2, :cond_43

    .line 420
    invoke-virtual {v3}, Lcom/rey/material/widget/CheckedTextView;->getMeasuredWidth()I

    move-result v6

    .line 421
    .local v6, "width_scroll":I
    invoke-virtual {v2}, Lcom/rey/material/widget/CheckedTextView;->getMeasuredWidth()I

    move-result v5

    .line 422
    .local v5, "width_next":I
    add-int v7, v6, v5

    int-to-float v7, v7

    div-float v0, v7, v9

    .line 424
    .local v0, "distance":F
    int-to-float v7, v6

    sub-int v8, v5, v6

    int-to-float v8, v8

    mul-float/2addr v8, p2

    add-float/2addr v7, v8

    add-float/2addr v7, v10

    float-to-int v4, v7

    .line 425
    .local v4, "width":I
    invoke-virtual {v3}, Lcom/rey/material/widget/CheckedTextView;->getLeft()I

    move-result v7

    int-to-float v7, v7

    int-to-float v8, v6

    div-float/2addr v8, v9

    add-float/2addr v7, v8

    mul-float v8, v0, p2

    add-float/2addr v7, v8

    int-to-float v8, v4

    div-float/2addr v8, v9

    sub-float/2addr v7, v8

    add-float/2addr v7, v10

    float-to-int v1, v7

    .line 426
    .local v1, "offset":I
    invoke-direct {p0, v1, v4}, Lcom/rey/material/widget/TabPageIndicator;->updateIndicator(II)V

    .line 428
    .end local v0    # "distance":F
    .end local v1    # "offset":I
    .end local v4    # "width":I
    .end local v5    # "width_next":I
    .end local v6    # "width_scroll":I
    :cond_43
    return-void
.end method

.method public onPageSelected(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 432
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->setCurrentItem(I)V

    .line 433
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_c

    .line 434
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 435
    :cond_c
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 4
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    .line 235
    if-ne p1, v0, :cond_d

    .line 236
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mIsRtl:Z

    if-eq v1, v0, :cond_c

    .line 237
    iput-boolean v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mIsRtl:Z

    .line 238
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator;->invalidate()V

    .line 240
    :cond_c
    return-void

    .line 235
    .end local v0    # "rtl":Z
    :cond_d
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected onSizeChanged(IIII)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 293
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onSizeChanged(IIII)V

    .line 294
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    invoke-direct {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    .line 295
    .local v0, "tv":Landroid/widget/TextView;
    if-eqz v0, :cond_16

    .line 296
    invoke-virtual {v0}, Landroid/widget/TextView;->getLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/rey/material/widget/TabPageIndicator;->updateIndicator(II)V

    .line 297
    :cond_16
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 203
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/TabPageIndicator;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 204
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 205
    iput v0, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    .line 206
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->applyStyle(I)V

    .line 208
    :cond_15
    return-void
.end method

.method public setCurrentItem(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 451
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    if-eq v1, p1, :cond_10

    .line 452
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    invoke-direct {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    .line 453
    .local v0, "tv":Lcom/rey/material/widget/CheckedTextView;
    if-eqz v0, :cond_10

    .line 454
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CheckedTextView;->setChecked(Z)V

    .line 457
    .end local v0    # "tv":Lcom/rey/material/widget/CheckedTextView;
    :cond_10
    iput p1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    .line 458
    iget v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mSelectedPosition:I

    invoke-direct {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    .line 459
    .restart local v0    # "tv":Lcom/rey/material/widget/CheckedTextView;
    if-eqz v0, :cond_1e

    .line 460
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CheckedTextView;->setChecked(Z)V

    .line 462
    :cond_1e
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->animateToTab(I)V

    .line 463
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 331
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator;->mListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 332
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .registers 5
    .param p1, "view"    # Landroid/support/v4/view/ViewPager;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 339
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-ne v1, p1, :cond_5

    .line 365
    :goto_4
    return-void

    .line 342
    :cond_5
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_1b

    .line 343
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ViewPager;->removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 344
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 345
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    if-eqz v0, :cond_1b

    .line 346
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 349
    .end local v0    # "adapter":Landroid/support/v4/view/PagerAdapter;
    :cond_1b
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 351
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_48

    .line 352
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 353
    .restart local v0    # "adapter":Landroid/support/v4/view/PagerAdapter;
    if-nez v0, :cond_31

    .line 354
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ViewPager does not have adapter instance."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 356
    :cond_31
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 358
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 360
    invoke-direct {p0}, Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetChanged()V

    .line 361
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TabPageIndicator;->onPageSelected(I)V

    goto :goto_4

    .line 364
    .end local v0    # "adapter":Landroid/support/v4/view/PagerAdapter;
    :cond_48
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator;->mTabContainer:Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;

    invoke-virtual {v1}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->removeAllViews()V

    goto :goto_4
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;I)V
    .registers 3
    .param p1, "view"    # Landroid/support/v4/view/ViewPager;
    .param p2, "initialPosition"    # I

    .prologue
    .line 373
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/TabPageIndicator;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 374
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/TabPageIndicator;->setCurrentItem(I)V

    .line 375
    return-void
.end method
