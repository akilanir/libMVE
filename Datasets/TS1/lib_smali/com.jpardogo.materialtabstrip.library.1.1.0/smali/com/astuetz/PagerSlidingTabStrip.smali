.class public Lcom/astuetz/PagerSlidingTabStrip;
.super Landroid/widget/HorizontalScrollView;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;,
        Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;,
        Lcom/astuetz/PagerSlidingTabStrip$SavedState;,
        Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;,
        Lcom/astuetz/PagerSlidingTabStrip$PageListener;
    }
.end annotation


# static fields
.field private static final ANDROID_ATTRS:[I

.field public static final DEF_VALUE_TAB_TEXT_ALPHA:I = 0x96

.field private static final PADDING_INDEX:I = 0x1

.field private static final PADDING_LEFT_INDEX:I = 0x2

.field private static final PADDING_RIGHT_INDEX:I = 0x3

.field private static final TEXT_COLOR_PRIMARY:I


# instance fields
.field private firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private isCustomTabs:Z

.field private isExpandTabs:Z

.field private isPaddingMiddle:Z

.field private isTabTextAllCaps:Z

.field private final mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

.field private mCurrentPosition:I

.field private mCurrentPositionOffset:F

.field public mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mDividerColor:I

.field private mDividerPadding:I

.field private mDividerPaint:Landroid/graphics/Paint;

.field private mDividerWidth:I

.field private mIndicatorColor:I

.field private mIndicatorHeight:I

.field private mLastScrollX:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private final mPageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

.field private mPager:Landroid/support/v4/view/ViewPager;

.field private mRectPaint:Landroid/graphics/Paint;

.field private mScrollOffset:I

.field private mTabBackgroundResId:I

.field private mTabCount:I

.field private mTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mTabPadding:I

.field private mTabReselectedListener:Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;

.field private mTabTextColor:Landroid/content/res/ColorStateList;

.field private mTabTextSize:I

.field private mTabTextTypeface:Landroid/graphics/Typeface;

.field private mTabTextTypefaceStyle:I

.field private mTabsContainer:Landroid/widget/LinearLayout;

.field private mUnderlineColor:I

.field private mUnderlineHeight:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/astuetz/PagerSlidingTabStrip;->ANDROID_ATTRS:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1010036
        0x10100d5
        0x10100d6
        0x10100d8
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/astuetz/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 113
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/astuetz/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 120
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 67
    new-instance v7, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;-><init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    .line 68
    new-instance v7, Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/astuetz/PagerSlidingTabStrip$PageListener;-><init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    .line 69
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabReselectedListener:Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;

    .line 75
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    .line 76
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    .line 82
    const/4 v7, 0x2

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    .line 84
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    .line 87
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    .line 88
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    .line 91
    const/16 v7, 0xc

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    .line 92
    const/16 v7, 0xe

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    .line 93
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    .line 95
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    .line 96
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    .line 98
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    .line 100
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    .line 101
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    .line 103
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypeface:Landroid/graphics/Typeface;

    .line 104
    const/4 v7, 0x1

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    .line 107
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mLastScrollX:I

    .line 109
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$drawable;->psts_background_tab:I

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    .line 358
    new-instance v7, Lcom/astuetz/PagerSlidingTabStrip$2;

    invoke-direct {v7, p0}, Lcom/astuetz/PagerSlidingTabStrip$2;-><init>(Lcom/astuetz/PagerSlidingTabStrip;)V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 121
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setFillViewport(Z)V

    .line 122
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setWillNotDraw(Z)V

    .line 123
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    .line 124
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 125
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v7}, Lcom/astuetz/PagerSlidingTabStrip;->addView(Landroid/view/View;)V

    .line 127
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    .line 128
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 129
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 132
    .local v1, "dm":Landroid/util/DisplayMetrics;
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    .line 133
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    .line 134
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    .line 135
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    .line 136
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    .line 137
    const/4 v7, 0x1

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    .line 138
    const/4 v7, 0x2

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    int-to-float v8, v8

    invoke-static {v7, v8, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    .line 140
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    .line 141
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 142
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 145
    sget-object v7, Lcom/astuetz/PagerSlidingTabStrip;->ANDROID_ATTRS:[I

    invoke-virtual {p1, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 146
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x106000c

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    .line 147
    .local v6, "textPrimaryColor":I
    iput v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    .line 148
    iput v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    .line 149
    iput v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    .line 150
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 151
    .local v3, "padding":I
    if-lez v3, :cond_21e

    move v7, v3

    :goto_113
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    .line 152
    if-lez v3, :cond_226

    .end local v3    # "padding":I
    :goto_117
    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    .line 153
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 155
    const-string v5, "sans-serif"

    .line 157
    .local v5, "tabTextTypefaceName":Ljava/lang/String;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v7, v8, :cond_129

    .line 158
    const-string v5, "sans-serif-medium"

    .line 159
    const/4 v7, 0x0

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    .line 163
    :cond_129
    sget-object v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip:[I

    invoke-virtual {p1, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 164
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsIndicatorColor:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    .line 165
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsIndicatorHeight:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    .line 166
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsUnderlineColor:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    .line 167
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsUnderlineHeight:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    .line 168
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerColor:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    .line 169
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerWidth:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    .line 170
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerPadding:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    .line 171
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsShouldExpand:I

    iget-boolean v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    .line 172
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsScrollOffset:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    .line 173
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsPaddingMiddle:I

    iget-boolean v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    .line 174
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabPaddingLeftRight:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    .line 175
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabBackground:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    .line 176
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextSize:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    .line 177
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextColor:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v7

    if-eqz v7, :cond_22e

    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextColor:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    :goto_1bf
    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    .line 178
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextStyle:I

    iget v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    .line 179
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextAllCaps:I

    iget-boolean v8, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    .line 180
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextAlpha:I

    const/16 v8, 0x96

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 181
    .local v4, "tabTextAlpha":I
    sget v7, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabTextFontFamily:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "fontFamily":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 185
    iget-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    if-nez v7, :cond_200

    .line 186
    invoke-static {v6}, Landroid/graphics/Color;->red(I)I

    move-result v7

    invoke-static {v6}, Landroid/graphics/Color;->green(I)I

    move-result v8

    invoke-static {v6}, Landroid/graphics/Color;->blue(I)I

    move-result v9

    invoke-static {v4, v7, v8, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v7

    invoke-direct {p0, v6, v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->createColorStateList(III)Landroid/content/res/ColorStateList;

    move-result-object v7

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    .line 196
    :cond_200
    if-eqz v2, :cond_203

    .line 197
    move-object v5, v2

    .line 199
    :cond_203
    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    invoke-static {v5, v7}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypeface:Landroid/graphics/Typeface;

    .line 202
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->setTabsContainerParentViewPaddings()V

    .line 205
    iget-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    if-eqz v7, :cond_230

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    :goto_21b
    iput-object v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 208
    return-void

    .line 151
    .end local v2    # "fontFamily":Ljava/lang/String;
    .end local v4    # "tabTextAlpha":I
    .end local v5    # "tabTextTypefaceName":Ljava/lang/String;
    .restart local v3    # "padding":I
    :cond_21e
    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    goto/16 :goto_113

    .line 152
    :cond_226
    const/4 v7, 0x3

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    goto/16 :goto_117

    .line 177
    .end local v3    # "padding":I
    .restart local v5    # "tabTextTypefaceName":Ljava/lang/String;
    :cond_22e
    const/4 v7, 0x0

    goto :goto_1bf

    .line 205
    .restart local v2    # "fontFamily":Ljava/lang/String;
    .restart local v4    # "tabTextAlpha":I
    :cond_230
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    goto :goto_21b
.end method

.method static synthetic access$1000(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    return v0
.end method

.method static synthetic access$1002(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    return p1
.end method

.method static synthetic access$1102(Lcom/astuetz/PagerSlidingTabStrip;F)F
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # F

    .prologue
    .line 48
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    return p1
.end method

.method static synthetic access$1200(Lcom/astuetz/PagerSlidingTabStrip;II)V
    .registers 3
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/astuetz/PagerSlidingTabStrip;->scrollToChild(II)V

    return-void
.end method

.method static synthetic access$1300(Lcom/astuetz/PagerSlidingTabStrip;I)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->updateSelection(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    return v0
.end method

.method static synthetic access$1500(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->select(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$400(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->unSelect(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$500(Lcom/astuetz/PagerSlidingTabStrip;)Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabReselectedListener:Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/astuetz/PagerSlidingTabStrip;)Z
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    return v0
.end method

.method static synthetic access$700(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    return v0
.end method

.method static synthetic access$702(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    return p1
.end method

.method static synthetic access$800(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    return v0
.end method

.method static synthetic access$802(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    return p1
.end method

.method static synthetic access$900(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 48
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    return v0
.end method

.method static synthetic access$902(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    return p1
.end method

.method private addTab(ILjava/lang/CharSequence;Landroid/view/View;)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;
    .param p3, "tabView"    # Landroid/view/View;

    .prologue
    .line 247
    sget v1, Lcom/astuetz/pagerslidingtabstrip/R$id;->psts_tab_title:I

    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 248
    .local v0, "textView":Landroid/widget/TextView;
    if-eqz v0, :cond_f

    .line 249
    if-eqz p2, :cond_f

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    :cond_f
    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 253
    new-instance v1, Lcom/astuetz/PagerSlidingTabStrip$1;

    invoke-direct {v1, p0, p1}, Lcom/astuetz/PagerSlidingTabStrip$1;-><init>(Lcom/astuetz/PagerSlidingTabStrip;I)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 266
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, p3, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 267
    return-void
.end method

.method private createColorStateList(I)Landroid/content/res/ColorStateList;
    .registers 7
    .param p1, "color_state_default"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 750
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v4, [[I

    new-array v2, v3, [I

    aput-object v2, v1, v3

    new-array v2, v4, [I

    aput p1, v2, v3

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v0
.end method

.method private createColorStateList(III)Landroid/content/res/ColorStateList;
    .registers 12
    .param p1, "color_state_pressed"    # I
    .param p2, "color_state_selected"    # I
    .param p3, "color_state_default"    # I

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 761
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v7, [[I

    new-array v2, v5, [I

    const v3, 0x10100a7

    aput v3, v2, v4

    aput-object v2, v1, v4

    new-array v2, v5, [I

    const v3, 0x10100a1

    aput v3, v2, v4

    aput-object v2, v1, v5

    new-array v2, v4, [I

    aput-object v2, v1, v6

    new-array v2, v7, [I

    aput p1, v2, v4

    aput p2, v2, v5

    aput p3, v2, v6

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v0
.end method

.method private getIndicatorCoordinates()Landroid/support/v4/util/Pair;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/util/Pair",
            "<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    const/high16 v8, 0x3f800000    # 1.0f

    .line 316
    iget-object v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 317
    .local v0, "currentTab":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v1, v6

    .line 318
    .local v1, "lineLeft":F
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v6

    int-to-float v2, v6

    .line 320
    .local v2, "lineRight":F
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    const/4 v7, 0x0

    cmpl-float v6, v6, v7

    if-lez v6, :cond_4b

    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    add-int/lit8 v7, v7, -0x1

    if-ge v6, v7, :cond_4b

    .line 321
    iget-object v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 322
    .local v3, "nextTab":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v4, v6

    .line 323
    .local v4, "nextTabLeft":F
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v6

    int-to-float v5, v6

    .line 324
    .local v5, "nextTabRight":F
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    mul-float/2addr v6, v4

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    sub-float v7, v8, v7

    mul-float/2addr v7, v1

    add-float v1, v6, v7

    .line 325
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    mul-float/2addr v6, v5

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F

    sub-float v7, v8, v7

    mul-float/2addr v7, v2

    add-float v2, v6, v7

    .line 328
    .end local v3    # "nextTab":Landroid/view/View;
    .end local v4    # "nextTabLeft":F
    .end local v5    # "nextTabRight":F
    :cond_4b
    new-instance v6, Landroid/support/v4/util/Pair;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v6
.end method

.method private scrollToChild(II)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 293
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    if-nez v2, :cond_5

    .line 312
    :cond_4
    :goto_4
    return-void

    .line 297
    :cond_5
    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    add-int v1, v2, p2

    .line 298
    .local v1, "newScrollX":I
    if-gtz p1, :cond_15

    if-lez p2, :cond_34

    .line 303
    :cond_15
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    sub-int/2addr v1, v2

    .line 304
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getIndicatorCoordinates()Landroid/support/v4/util/Pair;

    move-result-object v0

    .line 305
    .local v0, "lines":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    int-to-float v3, v1

    iget-object v2, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v2, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    sub-float v2, v4, v2

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v2, v4

    add-float/2addr v2, v3

    float-to-int v1, v2

    .line 308
    .end local v0    # "lines":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    :cond_34
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mLastScrollX:I

    if-eq v1, v2, :cond_4

    .line 309
    iput v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mLastScrollX:I

    .line 310
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/astuetz/PagerSlidingTabStrip;->scrollTo(II)V

    goto :goto_4
.end method

.method private select(Landroid/view/View;)V
    .registers 4
    .param p1, "tab"    # Landroid/view/View;

    .prologue
    .line 505
    if-eqz p1, :cond_1f

    .line 506
    sget v1, Lcom/astuetz/pagerslidingtabstrip/R$id;->psts_tab_title:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 507
    .local v0, "tab_title":Landroid/widget/TextView;
    if-eqz v0, :cond_10

    .line 508
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 510
    :cond_10
    iget-boolean v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isCustomTabs:Z

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    check-cast v1, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    invoke-interface {v1, p1}, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;->tabSelected(Landroid/view/View;)V

    .line 512
    .end local v0    # "tab_title":Landroid/widget/TextView;
    :cond_1f
    return-void
.end method

.method private setTabsContainerParentViewPaddings()V
    .registers 5

    .prologue
    .line 211
    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    if-lt v1, v2, :cond_18

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    .line 212
    .local v0, "bottomMargin":I
    :goto_8
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setPadding(IIII)V

    .line 213
    return-void

    .line 211
    .end local v0    # "bottomMargin":I
    :cond_18
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    goto :goto_8
.end method

.method private unSelect(Landroid/view/View;)V
    .registers 4
    .param p1, "tab"    # Landroid/view/View;

    .prologue
    .line 495
    if-eqz p1, :cond_1f

    .line 496
    sget v1, Lcom/astuetz/pagerslidingtabstrip/R$id;->psts_tab_title:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 497
    .local v0, "tab_title":Landroid/widget/TextView;
    if-eqz v0, :cond_10

    .line 498
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 500
    :cond_10
    iget-boolean v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isCustomTabs:Z

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    check-cast v1, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    invoke-interface {v1, p1}, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;->tabUnselected(Landroid/view/View;)V

    .line 502
    .end local v0    # "tab_title":Landroid/widget/TextView;
    :cond_1f
    return-void
.end method

.method private updateSelection(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 483
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    if-ge v0, v3, :cond_1c

    .line 484
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 485
    .local v2, "tv":Landroid/view/View;
    if-ne v0, p1, :cond_16

    const/4 v1, 0x1

    .line 486
    .local v1, "selected":Z
    :goto_e
    if-eqz v1, :cond_18

    .line 487
    invoke-direct {p0, v2}, Lcom/astuetz/PagerSlidingTabStrip;->select(Landroid/view/View;)V

    .line 483
    :goto_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 485
    .end local v1    # "selected":Z
    :cond_16
    const/4 v1, 0x0

    goto :goto_e

    .line 489
    .restart local v1    # "selected":Z
    :cond_18
    invoke-direct {p0, v2}, Lcom/astuetz/PagerSlidingTabStrip;->unSelect(Landroid/view/View;)V

    goto :goto_13

    .line 492
    .end local v1    # "selected":Z
    .end local v2    # "tv":Landroid/view/View;
    :cond_1c
    return-void
.end method

.method private updateTabStyles()V
    .registers 8

    .prologue
    .line 270
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    if-ge v0, v3, :cond_67

    .line 271
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 272
    .local v2, "v":Landroid/view/View;
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 273
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 274
    sget v3, Lcom/astuetz/pagerslidingtabstrip/R$id;->psts_tab_title:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 275
    .local v1, "tab_title":Landroid/widget/TextView;
    if-eqz v1, :cond_4a

    .line 276
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 277
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypeface:Landroid/graphics/Typeface;

    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 278
    const/4 v3, 0x0

    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    int-to-float v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 281
    iget-boolean v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    if-eqz v3, :cond_4a

    .line 282
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_4d

    .line 283
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 270
    :cond_4a
    :goto_4a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 285
    :cond_4d
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget-object v4, v4, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4a

    .line 290
    .end local v1    # "tab_title":Landroid/widget/TextView;
    .end local v2    # "v":Landroid/view/View;
    :cond_67
    return-void
.end method


# virtual methods
.method public getDividerColor()I
    .registers 2

    .prologue
    .line 618
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    return v0
.end method

.method public getDividerPadding()I
    .registers 2

    .prologue
    .line 630
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    return v0
.end method

.method public getDividerWidth()I
    .registers 2

    .prologue
    .line 622
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    return v0
.end method

.method public getIndicatorColor()I
    .registers 2

    .prologue
    .line 606
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    return v0
.end method

.method public getIndicatorHeight()I
    .registers 2

    .prologue
    .line 610
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    return v0
.end method

.method public getScrollOffset()I
    .registers 2

    .prologue
    .line 634
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    return v0
.end method

.method public getShouldExpand()Z
    .registers 2

    .prologue
    .line 638
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    return v0
.end method

.method public getTabBackground()I
    .registers 2

    .prologue
    .line 654
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    return v0
.end method

.method public getTabPaddingLeftRight()I
    .registers 2

    .prologue
    .line 658
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    return v0
.end method

.method public getTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTextSize()I
    .registers 2

    .prologue
    .line 642
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    return v0
.end method

.method public getUnderlineColor()I
    .registers 2

    .prologue
    .line 614
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    return v0
.end method

.method public getUnderlineHeight()I
    .registers 2

    .prologue
    .line 626
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    return v0
.end method

.method public isTextAllCaps()Z
    .registers 2

    .prologue
    .line 646
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 7

    .prologue
    .line 229
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 230
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    .line 232
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    if-ge v0, v3, :cond_46

    .line 233
    iget-boolean v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->isCustomTabs:Z

    if-eqz v3, :cond_36

    .line 234
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    invoke-interface {v3, p0, v0}, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;->getCustomTabView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v1

    .line 239
    .local v1, "tabView":Landroid/view/View;
    :goto_26
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 240
    .local v2, "title":Ljava/lang/CharSequence;
    invoke-direct {p0, v0, v2, v1}, Lcom/astuetz/PagerSlidingTabStrip;->addTab(ILjava/lang/CharSequence;Landroid/view/View;)V

    .line 232
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 236
    .end local v1    # "tabView":Landroid/view/View;
    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_36
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$layout;->psts_tab:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, p0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .restart local v1    # "tabView":Landroid/view/View;
    goto :goto_26

    .line 243
    .end local v1    # "tabView":Landroid/view/View;
    :cond_46
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 244
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 534
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 535
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_20

    .line 536
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->isAttached()Z

    move-result v0

    if-nez v0, :cond_20

    .line 537
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 538
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 541
    :cond_20
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 545
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 546
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_20

    .line 547
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 548
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 549
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 552
    :cond_20
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 395
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    .line 396
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_d

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    if-nez v0, :cond_e

    .line 423
    :cond_d
    :goto_d
    return-void

    .line 400
    :cond_e
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getHeight()I

    move-result v6

    .line 402
    .local v6, "height":I
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    if-lez v0, :cond_4d

    .line 403
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 404
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 405
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_26
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I

    add-int/lit8 v0, v0, -0x1

    if-ge v7, v0, :cond_4d

    .line 406
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 407
    .local v9, "tab":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    int-to-float v2, v0

    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v3, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    sub-int v0, v6, v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 405
    add-int/lit8 v7, v7, 0x1

    goto :goto_26

    .line 412
    .end local v7    # "i":I
    .end local v9    # "tab":Landroid/view/View;
    :cond_4d
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    if-lez v0, :cond_71

    .line 413
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 414
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    int-to-float v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    sub-int v0, v6, v0

    int-to-float v2, v0

    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    add-int/2addr v0, v3

    int-to-float v3, v0

    int-to-float v4, v6

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 418
    :cond_71
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    if-lez v0, :cond_d

    .line 419
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 420
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getIndicatorCoordinates()Landroid/support/v4/util/Pair;

    move-result-object v8

    .line 421
    .local v8, "lines":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    iget-object v0, v8, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    sub-int v0, v6, v0

    int-to-float v2, v0

    iget-object v0, v8, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    int-to-float v3, v3

    add-float/2addr v3, v0

    int-to-float v4, v6

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->mRectPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_d
.end method

.method protected onLayout(ZIIII)V
    .registers 10
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v3, 0x0

    .line 333
    iget-boolean v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    if-nez v1, :cond_d

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    if-gtz v1, :cond_d

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    if-lez v1, :cond_1d

    .line 335
    :cond_d
    iget-boolean v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    if-eqz v1, :cond_38

    .line 336
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getWidth()I

    move-result v0

    .line 343
    .local v0, "width":I
    :goto_15
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 345
    invoke-virtual {p0, v3}, Lcom/astuetz/PagerSlidingTabStrip;->setClipToPadding(Z)V

    .line 348
    .end local v0    # "width":I
    :cond_1d
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_34

    .line 349
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 355
    :cond_34
    invoke-super/range {p0 .. p5}, Landroid/widget/HorizontalScrollView;->onLayout(ZIIII)V

    .line 356
    return-void

    .line 339
    :cond_38
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getWidth()I

    move-result v1

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingLeft:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPaddingRight:I

    sub-int v0, v1, v2

    .restart local v0    # "width":I
    goto :goto_15
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 556
    move-object v0, p1

    check-cast v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;

    .line 557
    .local v0, "savedState":Lcom/astuetz/PagerSlidingTabStrip$SavedState;
    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/HorizontalScrollView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 558
    iget v1, v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    iput v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    .line 559
    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_2f

    .line 560
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->unSelect(Landroid/view/View;)V

    .line 561
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->select(Landroid/view/View;)V

    .line 563
    :cond_2f
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->requestLayout()V

    .line 564
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 568
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 569
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;

    invoke-direct {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 570
    .local v0, "savedState":Lcom/astuetz/PagerSlidingTabStrip$SavedState;
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I

    iput v2, v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    .line 571
    return-object v0
.end method

.method public setAllCaps(Z)V
    .registers 2
    .param p1, "textAllCaps"    # Z

    .prologue
    .line 724
    iput-boolean p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isTabTextAllCaps:Z

    .line 725
    return-void
.end method

.method public setDividerColor(I)V
    .registers 2
    .param p1, "dividerColor"    # I

    .prologue
    .line 687
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    .line 688
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 689
    return-void
.end method

.method public setDividerColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 692
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerColor:I

    .line 693
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 694
    return-void
.end method

.method public setDividerPadding(I)V
    .registers 2
    .param p1, "dividerPaddingPx"    # I

    .prologue
    .line 707
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerPadding:I

    .line 708
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 709
    return-void
.end method

.method public setDividerWidth(I)V
    .registers 2
    .param p1, "dividerWidthPx"    # I

    .prologue
    .line 697
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDividerWidth:I

    .line 698
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 699
    return-void
.end method

.method public setIndicatorColor(I)V
    .registers 2
    .param p1, "indicatorColor"    # I

    .prologue
    .line 662
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    .line 663
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 664
    return-void
.end method

.method public setIndicatorColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 667
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorColor:I

    .line 668
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 669
    return-void
.end method

.method public setIndicatorHeight(I)V
    .registers 2
    .param p1, "indicatorLineHeightPx"    # I

    .prologue
    .line 672
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mIndicatorHeight:I

    .line 673
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 674
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 430
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 431
    return-void
.end method

.method public setOnTabReselectedListener(Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;)V
    .registers 2
    .param p1, "tabReselectedListener"    # Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;

    .prologue
    .line 426
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabReselectedListener:Lcom/astuetz/PagerSlidingTabStrip$OnTabReselectedListener;

    .line 427
    return-void
.end method

.method public setScrollOffset(I)V
    .registers 2
    .param p1, "scrollOffsetPx"    # I

    .prologue
    .line 712
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mScrollOffset:I

    .line 713
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 714
    return-void
.end method

.method public setShouldExpand(Z)V
    .registers 3
    .param p1, "shouldExpand"    # Z

    .prologue
    .line 717
    iput-boolean p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->isExpandTabs:Z

    .line 718
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_9

    .line 719
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->requestLayout()V

    .line 721
    :cond_9
    return-void
.end method

.method public setTabBackground(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 782
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabBackgroundResId:I

    .line 783
    return-void
.end method

.method public setTabPaddingLeftRight(I)V
    .registers 2
    .param p1, "paddingPx"    # I

    .prologue
    .line 786
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabPadding:I

    .line 787
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 788
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 737
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->createColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 738
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 745
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextColor:Landroid/content/res/ColorStateList;

    .line 746
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 747
    return-void
.end method

.method public setTextColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 733
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(I)V

    .line 734
    return-void
.end method

.method public setTextColorStateListResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 741
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 742
    return-void
.end method

.method public setTextSize(I)V
    .registers 2
    .param p1, "textSizePx"    # I

    .prologue
    .line 728
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextSize:I

    .line 729
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 730
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 3
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 776
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypeface:Landroid/graphics/Typeface;

    .line 777
    iput p2, p0, Lcom/astuetz/PagerSlidingTabStrip;->mTabTextTypefaceStyle:I

    .line 778
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 779
    return-void
.end method

.method public setUnderlineColor(I)V
    .registers 2
    .param p1, "underlineColor"    # I

    .prologue
    .line 677
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    .line 678
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 679
    return-void
.end method

.method public setUnderlineColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 682
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineColor:I

    .line 683
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 684
    return-void
.end method

.method public setUnderlineHeight(I)V
    .registers 2
    .param p1, "underlineHeightPx"    # I

    .prologue
    .line 702
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mUnderlineHeight:I

    .line 703
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 704
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .registers 4
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;

    .line 217
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    if-nez v0, :cond_10

    .line 218
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ViewPager does not have adapter instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_10
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    instance-of v0, v0, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    iput-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->isCustomTabs:Z

    .line 222
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mPageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 223
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 224
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->mAdapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 225
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 226
    return-void
.end method
