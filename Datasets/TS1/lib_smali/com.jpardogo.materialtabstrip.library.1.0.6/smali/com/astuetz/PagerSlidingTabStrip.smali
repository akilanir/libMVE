.class public Lcom/astuetz/PagerSlidingTabStrip;
.super Landroid/widget/HorizontalScrollView;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/astuetz/PagerSlidingTabStrip$SavedState;,
        Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;,
        Lcom/astuetz/PagerSlidingTabStrip$PageListener;,
        Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;
    }
.end annotation


# static fields
.field private static final ATTRS:[I

.field private static final HALF_TRANSP:F = 0.5f

.field private static final OPAQUE:F = 1.0f

.field private static final PADDING_LEFT_INDEX:I = 0x2

.field private static final PADDING_RIGHT_INDEX:I = 0x3

.field private static final TEXT_COLOR_INDEX:I = 0x1

.field private static final TEXT_COLOR_PRIMARY:I = 0x4

.field private static final TEXT_SIZE_INDEX:I


# instance fields
.field private final adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

.field private currentPosition:I

.field private currentPositionOffset:F

.field private defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field public delegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private dividerColor:I

.field private dividerPadding:I

.field private dividerPaint:Landroid/graphics/Paint;

.field private dividerWidth:I

.field private expandedTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private indicatorColor:I

.field private indicatorHeight:I

.field private isPaddingMiddle:Z

.field private lastScrollX:I

.field private locale:Ljava/util/Locale;

.field private paddingLeft:I

.field private paddingRight:I

.field private final pageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

.field private pager:Landroid/support/v4/view/ViewPager;

.field private rectPaint:Landroid/graphics/Paint;

.field private scrollOffset:I

.field private shouldExpand:Z

.field private tabBackgroundResId:I

.field private tabCount:I

.field private tabPadding:I

.field private tabTextAlpha:F

.field private tabTextColor:Landroid/content/res/ColorStateList;

.field private tabTextSelectedAlpha:F

.field private tabTextSize:I

.field private tabTypeface:Landroid/graphics/Typeface;

.field private tabTypefaceSelectedStyle:I

.field private tabTypefaceStyle:I

.field private tabsContainer:Landroid/widget/LinearLayout;

.field private textAllCaps:Z

.field private underlineColor:I

.field private underlineHeight:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/astuetz/PagerSlidingTabStrip;->ATTRS:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1010095
        0x1010098
        0x10100d6
        0x10100d8
        0x1010036
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/astuetz/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 131
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 134
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/astuetz/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 135
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v8, -0x1

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 138
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    new-instance v4, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-direct {v4, p0, v5}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;-><init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    .line 81
    new-instance v4, Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    invoke-direct {v4, p0, v5}, Lcom/astuetz/PagerSlidingTabStrip$PageListener;-><init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->pageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    .line 89
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    .line 90
    const/4 v4, 0x0

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    .line 96
    const/4 v4, 0x2

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    .line 98
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    .line 101
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    .line 102
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    .line 105
    const/16 v4, 0xc

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    .line 106
    const/16 v4, 0xe

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    .line 107
    iput-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    .line 108
    const/high16 v4, 0x3f000000    # 0.5f

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextAlpha:F

    .line 109
    iput v9, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSelectedAlpha:F

    .line 111
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    .line 112
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    .line 114
    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    .line 115
    iput-boolean v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    .line 116
    iput-boolean v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    .line 118
    iput-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    .line 119
    iput v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceStyle:I

    .line 120
    iput v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceSelectedStyle:I

    .line 123
    iput v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->lastScrollX:I

    .line 125
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$drawable;->background_tab:I

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 377
    new-instance v4, Lcom/astuetz/PagerSlidingTabStrip$3;

    invoke-direct {v4, p0}, Lcom/astuetz/PagerSlidingTabStrip$3;-><init>(Lcom/astuetz/PagerSlidingTabStrip;)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 139
    invoke-virtual {p0, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setFillViewport(Z)V

    .line 140
    invoke-virtual {p0, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setWillNotDraw(Z)V

    .line 141
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    .line 142
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 143
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v4}, Lcom/astuetz/PagerSlidingTabStrip;->addView(Landroid/view/View;)V

    .line 146
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 147
    .local v2, "dm":Landroid/util/DisplayMetrics;
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    .line 148
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    .line 149
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    .line 150
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    .line 151
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    .line 152
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    int-to-float v4, v4

    invoke-static {v6, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    .line 153
    const/4 v4, 0x2

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    int-to-float v5, v5

    invoke-static {v4, v5, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    .line 156
    sget-object v4, Lcom/astuetz/PagerSlidingTabStrip;->ATTRS:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 157
    .local v0, "a":Landroid/content/res/TypedArray;
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    invoke-virtual {v0, v7, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    .line 158
    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 159
    .local v1, "colorStateList":Landroid/content/res/ColorStateList;
    const/4 v4, 0x4

    const v5, 0x106000b

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    .line 160
    .local v3, "textPrimaryColor":I
    if-eqz v1, :cond_203

    .line 161
    iput-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    .line 166
    :goto_e0
    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    .line 167
    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    .line 168
    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    .line 169
    const/4 v4, 0x2

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    .line 170
    const/4 v4, 0x3

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    .line 171
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 174
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    if-ge v4, v5, :cond_105

    .line 175
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    .line 178
    :cond_105
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    if-ge v4, v5, :cond_10f

    .line 179
    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    .line 183
    :cond_10f
    sget-object v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 184
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsIndicatorColor:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    .line 185
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsUnderlineColor:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    .line 186
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerColor:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    .line 187
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerWidth:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    .line 188
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsIndicatorHeight:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    .line 189
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsUnderlineHeight:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    .line 190
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsDividerPadding:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    .line 191
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabPaddingLeftRight:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    .line 192
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTabBackground:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 193
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsShouldExpand:I

    iget-boolean v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    .line 194
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsScrollOffset:I

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    .line 195
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTextAllCaps:I

    iget-boolean v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    .line 196
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsPaddingMiddle:I

    iget-boolean v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    .line 197
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTextStyle:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceStyle:I

    .line 198
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTextSelectedStyle:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceSelectedStyle:I

    .line 199
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTextAlpha:I

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextAlpha:F

    .line 200
    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$styleable;->PagerSlidingTabStrip_pstsTextSelectedAlpha:I

    invoke-virtual {v0, v4, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSelectedAlpha:F

    .line 201
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 203
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    .line 204
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 205
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 208
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    .line 209
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 210
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 212
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v4, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 213
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->expandedTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 215
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    if-nez v4, :cond_202

    .line 216
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget-object v4, v4, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    .line 218
    :cond_202
    return-void

    .line 163
    :cond_203
    invoke-direct {p0, v3}, Lcom/astuetz/PagerSlidingTabStrip;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    goto/16 :goto_e0
.end method

.method static synthetic access$1000(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    return v0
.end method

.method static synthetic access$1002(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    return p1
.end method

.method static synthetic access$1100(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    return v0
.end method

.method static synthetic access$1102(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    return p1
.end method

.method static synthetic access$1200(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    return v0
.end method

.method static synthetic access$1202(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    return p1
.end method

.method static synthetic access$1300(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    return v0
.end method

.method static synthetic access$1400(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->selected(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/astuetz/PagerSlidingTabStrip;)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    return v0
.end method

.method static synthetic access$202(Lcom/astuetz/PagerSlidingTabStrip;I)I
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    return p1
.end method

.method static synthetic access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$402(Lcom/astuetz/PagerSlidingTabStrip;F)F
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # F

    .prologue
    .line 50
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    return p1
.end method

.method static synthetic access$500(Lcom/astuetz/PagerSlidingTabStrip;II)V
    .registers 3
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/astuetz/PagerSlidingTabStrip;->scrollToChild(II)V

    return-void
.end method

.method static synthetic access$600(Lcom/astuetz/PagerSlidingTabStrip;I)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->updateSelection(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$800(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->notSelected(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$900(Lcom/astuetz/PagerSlidingTabStrip;)Z
    .registers 2
    .param p0, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->isPaddingMiddle:Z

    return v0
.end method

.method private addTab(ILjava/lang/CharSequence;Landroid/view/View;)V
    .registers 10
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;
    .param p3, "tabView"    # Landroid/view/View;

    .prologue
    .line 272
    sget v2, Lcom/astuetz/pagerslidingtabstrip/R$id;->tab_title:I

    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 273
    .local v1, "textView":Landroid/widget/TextView;
    if-eqz v1, :cond_1c

    .line 274
    if-eqz p2, :cond_f

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    :cond_f
    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v2

    if-ne v2, p1, :cond_43

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSelectedAlpha:F

    .line 276
    .local v0, "alpha":F
    :goto_19
    invoke-static {v1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 279
    .end local v0    # "alpha":F
    :cond_1c
    const/4 v2, 0x1

    invoke-virtual {p3, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 280
    new-instance v2, Lcom/astuetz/PagerSlidingTabStrip$2;

    invoke-direct {v2, p0, p1}, Lcom/astuetz/PagerSlidingTabStrip$2;-><init>(Lcom/astuetz/PagerSlidingTabStrip;I)V

    invoke-virtual {p3, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 291
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {p3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {p3}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    invoke-virtual {p3, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 292
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    iget-boolean v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    if-eqz v2, :cond_46

    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->expandedTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    :goto_3f
    invoke-virtual {v3, p3, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 293
    return-void

    .line 275
    :cond_43
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextAlpha:F

    goto :goto_19

    .line 292
    :cond_46
    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    goto :goto_3f
.end method

.method private getColorStateList(I)Landroid/content/res/ColorStateList;
    .registers 7
    .param p1, "textColor"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 722
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v4, [[I

    new-array v2, v3, [I

    aput-object v2, v1, v3

    new-array v2, v4, [I

    aput p1, v2, v3

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

    .line 345
    iget-object v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 346
    .local v0, "currentTab":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v1, v6

    .line 347
    .local v1, "lineLeft":F
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v6

    int-to-float v2, v6

    .line 350
    .local v2, "lineRight":F
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    const/4 v7, 0x0

    cmpl-float v6, v6, v7

    if-lez v6, :cond_4b

    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    add-int/lit8 v7, v7, -0x1

    if-ge v6, v7, :cond_4b

    .line 352
    iget-object v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 353
    .local v3, "nextTab":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v4, v6

    .line 354
    .local v4, "nextTabLeft":F
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v6

    int-to-float v5, v6

    .line 356
    .local v5, "nextTabRight":F
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    mul-float/2addr v6, v4

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    sub-float v7, v8, v7

    mul-float/2addr v7, v1

    add-float v1, v6, v7

    .line 357
    iget v6, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    mul-float/2addr v6, v5

    iget v7, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F

    sub-float v7, v8, v7

    mul-float/2addr v7, v2

    add-float v2, v6, v7

    .line 359
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

.method private notSelected(Landroid/view/View;)V
    .registers 5
    .param p1, "tab"    # Landroid/view/View;

    .prologue
    .line 484
    sget v1, Lcom/astuetz/pagerslidingtabstrip/R$id;->tab_title:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 485
    .local v0, "title":Landroid/widget/TextView;
    if-eqz v0, :cond_16

    .line 486
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceStyle:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 487
    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextAlpha:F

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 489
    :cond_16
    return-void
.end method

.method private scrollToChild(II)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 321
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    if-nez v2, :cond_5

    .line 341
    :cond_4
    :goto_4
    return-void

    .line 325
    :cond_5
    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    add-int v1, v2, p2

    .line 326
    .local v1, "newScrollX":I
    if-gtz p1, :cond_15

    if-lez p2, :cond_34

    .line 332
    :cond_15
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    sub-int/2addr v1, v2

    .line 333
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getIndicatorCoordinates()Landroid/support/v4/util/Pair;

    move-result-object v0

    .line 334
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

    .line 337
    .end local v0    # "lines":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    :cond_34
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->lastScrollX:I

    if-eq v1, v2, :cond_4

    .line 338
    iput v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->lastScrollX:I

    .line 339
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/astuetz/PagerSlidingTabStrip;->scrollTo(II)V

    goto :goto_4
.end method

.method private selected(Landroid/view/View;)V
    .registers 5
    .param p1, "tab"    # Landroid/view/View;

    .prologue
    .line 492
    sget v1, Lcom/astuetz/pagerslidingtabstrip/R$id;->tab_title:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 493
    .local v0, "title":Landroid/widget/TextView;
    if-eqz v0, :cond_16

    .line 494
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceSelectedStyle:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 495
    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSelectedAlpha:F

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 497
    :cond_16
    return-void
.end method

.method private updateSelection(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 477
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    if-ge v0, v2, :cond_16

    .line 478
    iget-object v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 479
    .local v1, "tv":Landroid/view/View;
    if-ne v0, p1, :cond_14

    const/4 v2, 0x1

    :goto_e
    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 477
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 479
    :cond_14
    const/4 v2, 0x0

    goto :goto_e

    .line 481
    .end local v1    # "tv":Landroid/view/View;
    :cond_16
    return-void
.end method

.method private updateTabStyles()V
    .registers 6

    .prologue
    .line 296
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    if-ge v0, v3, :cond_5f

    .line 297
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 298
    .local v2, "v":Landroid/view/View;
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 299
    sget v3, Lcom/astuetz/pagerslidingtabstrip/R$id;->tab_title:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 301
    .local v1, "tab_title":Landroid/widget/TextView;
    if-eqz v1, :cond_47

    .line 302
    const/4 v3, 0x0

    iget v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    int-to-float v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 303
    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    if-ne v3, v0, :cond_4a

    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceSelectedStyle:I

    :goto_2d
    invoke-virtual {v1, v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 304
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_39

    .line 305
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 309
    :cond_39
    iget-boolean v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    if-eqz v3, :cond_47

    .line 310
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_4d

    .line 311
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 296
    :cond_47
    :goto_47
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 303
    :cond_4a
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceStyle:I

    goto :goto_2d

    .line 313
    :cond_4d
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_47

    .line 318
    .end local v1    # "tab_title":Landroid/widget/TextView;
    .end local v2    # "v":Landroid/view/View;
    :cond_5f
    return-void
.end method


# virtual methods
.method public getDividerColor()I
    .registers 2

    .prologue
    .line 603
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    return v0
.end method

.method public getDividerPadding()I
    .registers 2

    .prologue
    .line 615
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    return v0
.end method

.method public getDividerWidth()I
    .registers 2

    .prologue
    .line 607
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    return v0
.end method

.method public getIndicatorColor()I
    .registers 2

    .prologue
    .line 591
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    return v0
.end method

.method public getIndicatorHeight()I
    .registers 2

    .prologue
    .line 595
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    return v0
.end method

.method public getScrollOffset()I
    .registers 2

    .prologue
    .line 619
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    return v0
.end method

.method public getShouldExpand()Z
    .registers 2

    .prologue
    .line 623
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    return v0
.end method

.method public getTabBackground()I
    .registers 2

    .prologue
    .line 639
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    return v0
.end method

.method public getTabPaddingLeftRight()I
    .registers 2

    .prologue
    .line 643
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    return v0
.end method

.method public getTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 635
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTextSize()I
    .registers 2

    .prologue
    .line 627
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    return v0
.end method

.method public getUnderlineColor()I
    .registers 2

    .prologue
    .line 599
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    return v0
.end method

.method public getUnderlineHeight()I
    .registers 2

    .prologue
    .line 611
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    return v0
.end method

.method public isTextAllCaps()Z
    .registers 2

    .prologue
    .line 631
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 7

    .prologue
    .line 233
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 234
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    iput v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    .line 236
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    if-ge v0, v3, :cond_4c

    .line 238
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    if-eqz v3, :cond_3c

    .line 239
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;

    invoke-interface {v3, p0, v0}, Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;->getCustomTabView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v1

    .line 244
    .local v1, "tabView":Landroid/view/View;
    :goto_2c
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 246
    .local v2, "title":Ljava/lang/CharSequence;
    invoke-direct {p0, v0, v2, v1}, Lcom/astuetz/PagerSlidingTabStrip;->addTab(ILjava/lang/CharSequence;Landroid/view/View;)V

    .line 236
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 241
    .end local v1    # "tabView":Landroid/view/View;
    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_3c
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    sget v4, Lcom/astuetz/pagerslidingtabstrip/R$layout;->tab:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, p0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .restart local v1    # "tabView":Landroid/view/View;
    goto :goto_2c

    .line 249
    .end local v1    # "tabView":Landroid/view/View;
    :cond_4c
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 250
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    new-instance v4, Lcom/astuetz/PagerSlidingTabStrip$1;

    invoke-direct {v4, p0}, Lcom/astuetz/PagerSlidingTabStrip$1;-><init>(Lcom/astuetz/PagerSlidingTabStrip;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 269
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 519
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 520
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_20

    .line 521
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->isAttached()Z

    move-result v0

    if-nez v0, :cond_20

    .line 522
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 523
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 526
    :cond_20
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 530
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 531
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_20

    .line 532
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 533
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 534
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 537
    :cond_20
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 400
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    .line 401
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_d

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    if-nez v0, :cond_e

    .line 422
    :cond_d
    return-void

    .line 405
    :cond_e
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getHeight()I

    move-result v6

    .line 407
    .local v6, "height":I
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 408
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getIndicatorCoordinates()Landroid/support/v4/util/Pair;

    move-result-object v8

    .line 409
    .local v8, "lines":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    iget-object v0, v8, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    sub-int v0, v6, v0

    int-to-float v2, v0

    iget-object v0, v8, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    int-to-float v3, v3

    add-float/2addr v3, v0

    int-to-float v4, v6

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 411
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 412
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingLeft:I

    int-to-float v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    sub-int v0, v6, v0

    int-to-float v2, v0

    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    iget v3, p0, Lcom/astuetz/PagerSlidingTabStrip;->paddingRight:I

    add-int/2addr v0, v3

    int-to-float v3, v0

    int-to-float v4, v6

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 414
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    if-eqz v0, :cond_d

    .line 415
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 416
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 417
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_75
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabCount:I

    add-int/lit8 v0, v0, -0x1

    if-ge v7, v0, :cond_d

    .line 418
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 419
    .local v9, "tab":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v1, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    int-to-float v2, v0

    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v3, v0

    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    sub-int v0, v6, v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 417
    add-int/lit8 v7, v7, 0x1

    goto :goto_75
.end method

.method protected onLayout(ZIIII)V
    .registers 9
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v2, 0x0

    .line 365
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 367
    invoke-virtual {p0, v2}, Lcom/astuetz/PagerSlidingTabStrip;->setClipToPadding(Z)V

    .line 368
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_24

    .line 369
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    .line 370
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 371
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->firstTabGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 372
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 374
    :cond_24
    invoke-super/range {p0 .. p5}, Landroid/widget/HorizontalScrollView;->onLayout(ZIIII)V

    .line 375
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 541
    move-object v0, p1

    check-cast v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;

    .line 542
    .local v0, "savedState":Lcom/astuetz/PagerSlidingTabStrip$SavedState;
    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/HorizontalScrollView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 543
    iget v1, v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    iput v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    .line 544
    iget v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_2f

    .line 545
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->notSelected(Landroid/view/View;)V

    .line 546
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->selected(Landroid/view/View;)V

    .line 548
    :cond_2f
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->requestLayout()V

    .line 549
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 553
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 554
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;

    invoke-direct {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 555
    .local v0, "savedState":Lcom/astuetz/PagerSlidingTabStrip$SavedState;
    iget v2, p0, Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I

    iput v2, v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    .line 556
    return-object v0
.end method

.method public setAllCaps(Z)V
    .registers 2
    .param p1, "textAllCaps"    # Z

    .prologue
    .line 709
    iput-boolean p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->textAllCaps:Z

    .line 710
    return-void
.end method

.method public setDividerColor(I)V
    .registers 2
    .param p1, "dividerColor"    # I

    .prologue
    .line 672
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    .line 673
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 674
    return-void
.end method

.method public setDividerColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 677
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerColor:I

    .line 678
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 679
    return-void
.end method

.method public setDividerPadding(I)V
    .registers 2
    .param p1, "dividerPaddingPx"    # I

    .prologue
    .line 692
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerPadding:I

    .line 693
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 694
    return-void
.end method

.method public setDividerWidth(I)V
    .registers 2
    .param p1, "dividerWidthPx"    # I

    .prologue
    .line 682
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->dividerWidth:I

    .line 683
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 684
    return-void
.end method

.method public setIndicatorColor(I)V
    .registers 2
    .param p1, "indicatorColor"    # I

    .prologue
    .line 647
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    .line 648
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 649
    return-void
.end method

.method public setIndicatorColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 652
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorColor:I

    .line 653
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 654
    return-void
.end method

.method public setIndicatorHeight(I)V
    .registers 2
    .param p1, "indicatorLineHeightPx"    # I

    .prologue
    .line 657
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->indicatorHeight:I

    .line 658
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 659
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 425
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->delegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 426
    return-void
.end method

.method public setScrollOffset(I)V
    .registers 2
    .param p1, "scrollOffsetPx"    # I

    .prologue
    .line 697
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->scrollOffset:I

    .line 698
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 699
    return-void
.end method

.method public setShouldExpand(Z)V
    .registers 3
    .param p1, "shouldExpand"    # Z

    .prologue
    .line 702
    iput-boolean p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->shouldExpand:Z

    .line 703
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_9

    .line 704
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->requestLayout()V

    .line 706
    :cond_9
    return-void
.end method

.method public setTabBackground(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 745
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 746
    return-void
.end method

.method public setTabPaddingLeftRight(I)V
    .registers 2
    .param p1, "paddingPx"    # I

    .prologue
    .line 749
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabPadding:I

    .line 750
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 751
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 718
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 719
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 726
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextColor:Landroid/content/res/ColorStateList;

    .line 727
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 728
    return-void
.end method

.method public setTextColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 731
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(I)V

    .line 732
    return-void
.end method

.method public setTextColorStateListResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 735
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 736
    return-void
.end method

.method public setTextSize(I)V
    .registers 2
    .param p1, "textSizePx"    # I

    .prologue
    .line 713
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTextSize:I

    .line 714
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 715
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 3
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 739
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    .line 740
    iput p2, p0, Lcom/astuetz/PagerSlidingTabStrip;->tabTypefaceSelectedStyle:I

    .line 741
    invoke-direct {p0}, Lcom/astuetz/PagerSlidingTabStrip;->updateTabStyles()V

    .line 742
    return-void
.end method

.method public setUnderlineColor(I)V
    .registers 2
    .param p1, "underlineColor"    # I

    .prologue
    .line 662
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    .line 663
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 664
    return-void
.end method

.method public setUnderlineColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 667
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineColor:I

    .line 668
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 669
    return-void
.end method

.method public setUnderlineHeight(I)V
    .registers 2
    .param p1, "underlineHeightPx"    # I

    .prologue
    .line 687
    iput p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->underlineHeight:I

    .line 688
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 689
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .registers 4
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    .line 222
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    if-nez v0, :cond_10

    .line 223
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ViewPager does not have adapter instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 226
    :cond_10
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->pageListener:Lcom/astuetz/PagerSlidingTabStrip$PageListener;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 227
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 228
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip;->adapterObserver:Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->setAttached(Z)V

    .line 229
    invoke-virtual {p0}, Lcom/astuetz/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 230
    return-void
.end method
