.class public Lcom/rey/material/widget/TabIndicatorView;
.super Landroid/support/v7/widget/RecyclerView;
.source "TabIndicatorView.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;,
        Lcom/rey/material/widget/TabIndicatorView$ViewHolder;,
        Lcom/rey/material/widget/TabIndicatorView$Adapter;,
        Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;
    }
.end annotation


# static fields
.field public static final MODE_FIXED:I = 0x1

.field public static final MODE_SCROLL:I = 0x0

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2


# instance fields
.field private mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

.field private mCenterCurrentTab:Z

.field protected mCurrentStyle:I

.field private mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

.field private mIndicatorAtTop:Z

.field private mIndicatorHeight:I

.field private mIndicatorOffset:I

.field private mIndicatorWidth:I

.field private mIsRtl:Z

.field private mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private mMode:I

.field private mPaint:Landroid/graphics/Paint;

.field private mScrolling:Z

.field private mScrollingToCenter:Z

.field private mSelectedPosition:I

.field protected mStyleId:I

.field private mTabAnimSelector:Ljava/lang/Runnable;

.field private mTabPadding:I

.field private mTabRippleStyle:I

.field private mTabSingleLine:Z

.field private mTextAppearance:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    .line 67
    iput-boolean v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/TabIndicatorView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    .line 67
    iput-boolean v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    .line 78
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/TabIndicatorView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 82
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    .line 67
    iput-boolean v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    .line 84
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/rey/material/widget/TabIndicatorView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 85
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/TabIndicatorView;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    return v0
.end method

.method static synthetic access$100(Lcom/rey/material/widget/TabIndicatorView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$300(Lcom/rey/material/widget/TabIndicatorView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrolling:Z

    return v0
.end method

.method static synthetic access$402(Lcom/rey/material/widget/TabIndicatorView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$500(Lcom/rey/material/widget/TabIndicatorView;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/widget/TabIndicatorView;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/TabIndicatorView;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I

    return v0
.end method

.method static synthetic access$800(Lcom/rey/material/widget/TabIndicatorView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z

    return v0
.end method

.method private animateToTab(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 213
    if-ltz p1, :cond_a

    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_b

    .line 231
    :cond_a
    :goto_a
    return-void

    .line 216
    :cond_b
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_14

    .line 217
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 219
    :cond_14
    new-instance v0, Lcom/rey/material/widget/TabIndicatorView$2;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/widget/TabIndicatorView$2;-><init>(Lcom/rey/material/widget/TabIndicatorView;I)V

    iput-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    .line 230
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->post(Ljava/lang/Runnable;)Z

    goto :goto_a
.end method

.method private updateIndicator(II)V
    .registers 3
    .param p1, "offset"    # I
    .param p2, "width"    # I

    .prologue
    .line 234
    iput p1, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorOffset:I

    .line 235
    iput p2, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorWidth:I

    .line 236
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->invalidate()V

    .line 237
    return-void
.end method

.method private updateIndicator(Landroid/view/View;)V
    .registers 4
    .param p1, "anchorView"    # Landroid/view/View;

    .prologue
    .line 240
    if-eqz p1, :cond_14

    .line 241
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(II)V

    .line 242
    check-cast p1, Landroid/widget/Checkable;

    .end local p1    # "anchorView":Landroid/view/View;
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 247
    :goto_13
    return-void

    .line 245
    .restart local p1    # "anchorView":Landroid/view/View;
    :cond_14
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(II)V

    goto :goto_13
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 130
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 131
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/TabIndicatorView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 132
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 23
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 135
    sget-object v15, Lcom/rey/material/R$styleable;->TabPageIndicator:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v15, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 137
    .local v4, "a":Landroid/content/res/TypedArray;
    const/4 v12, -0x1

    .line 138
    .local v12, "tabPadding":I
    const/4 v14, 0x0

    .line 139
    .local v14, "textAppearance":I
    const/4 v8, -0x1

    .line 140
    .local v8, "mode":I
    const/4 v9, 0x0

    .line 141
    .local v9, "rippleStyle":I
    const/4 v13, 0x0

    .line 142
    .local v13, "tabSingleLine":Z
    const/4 v11, 0x0

    .line 144
    .local v11, "singleLineDefined":Z
    const/4 v7, 0x0

    .local v7, "i":I
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v6

    .local v6, "count":I
    :goto_19
    if-ge v7, v6, :cond_92

    .line 145
    invoke-virtual {v4, v7}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 146
    .local v5, "attr":I
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabPadding:I

    if-ne v5, v15, :cond_2b

    .line 147
    const/4 v15, 0x0

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    .line 144
    :cond_28
    :goto_28
    add-int/lit8 v7, v7, 0x1

    goto :goto_19

    .line 148
    :cond_2b
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabRipple:I

    if-ne v5, v15, :cond_35

    .line 149
    const/4 v15, 0x0

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    goto :goto_28

    .line 150
    :cond_35
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorColor:I

    if-ne v5, v15, :cond_49

    .line 151
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mPaint:Landroid/graphics/Paint;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v5, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_28

    .line 152
    :cond_49
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorHeight:I

    if-ne v5, v15, :cond_57

    .line 153
    const/4 v15, 0x0

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    goto :goto_28

    .line 154
    :cond_57
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_indicatorAtTop:I

    if-ne v5, v15, :cond_65

    .line 155
    const/4 v15, 0x1

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v15

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorAtTop:Z

    goto :goto_28

    .line 156
    :cond_65
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_tabSingleLine:I

    if-ne v5, v15, :cond_70

    .line 157
    const/4 v15, 0x1

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v13

    .line 158
    const/4 v11, 0x1

    goto :goto_28

    .line 160
    :cond_70
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_centerCurrentTab:I

    if-ne v5, v15, :cond_7e

    .line 161
    const/4 v15, 0x1

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v15

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mCenterCurrentTab:Z

    goto :goto_28

    .line 162
    :cond_7e
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_android_textAppearance:I

    if-ne v5, v15, :cond_88

    .line 163
    const/4 v15, 0x0

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    goto :goto_28

    .line 164
    :cond_88
    sget v15, Lcom/rey/material/R$styleable;->TabPageIndicator_tpi_mode:I

    if-ne v5, v15, :cond_28

    .line 165
    const/4 v15, 0x0

    invoke-virtual {v4, v5, v15}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v8

    goto :goto_28

    .line 168
    .end local v5    # "attr":I
    :cond_92
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 170
    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    if-gez v15, :cond_a6

    .line 171
    const/4 v15, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    .line 173
    :cond_a6
    const/4 v10, 0x0

    .line 175
    .local v10, "shouldNotify":Z
    if-ltz v12, :cond_b4

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I

    if-eq v15, v12, :cond_b4

    .line 176
    move-object/from16 v0, p0

    iput v12, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I

    .line 177
    const/4 v10, 0x1

    .line 180
    :cond_b4
    if-eqz v11, :cond_c1

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z

    if-eq v15, v13, :cond_c1

    .line 181
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z

    .line 182
    const/4 v10, 0x1

    .line 185
    :cond_c1
    if-ltz v8, :cond_d9

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mMode:I

    if-eq v15, v8, :cond_d9

    .line 186
    move-object/from16 v0, p0

    iput v8, v0, Lcom/rey/material/widget/TabIndicatorView;->mMode:I

    .line 187
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-virtual/range {v15 .. v17}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->setFixedWidth(II)V

    .line 188
    const/4 v10, 0x1

    .line 191
    :cond_d9
    if-eqz v14, :cond_e6

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I

    if-eq v15, v14, :cond_e6

    .line 192
    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I

    .line 193
    const/4 v10, 0x1

    .line 196
    :cond_e6
    if-eqz v9, :cond_f3

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I

    if-eq v9, v15, :cond_f3

    .line 197
    move-object/from16 v0, p0

    iput v9, v0, Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I

    .line 198
    const/4 v10, 0x1

    .line 201
    :cond_f3
    if-eqz v10, :cond_108

    .line 202
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v17

    invoke-virtual/range {v15 .. v17}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->notifyItemRangeChanged(II)V

    .line 204
    :cond_108
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/TabIndicatorView;->invalidate()V

    .line 205
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 336
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->draw(Landroid/graphics/Canvas;)V

    .line 338
    iget v6, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorOffset:I

    .line 339
    .local v6, "x":I
    iget-boolean v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorAtTop:Z

    if-eqz v0, :cond_1b

    const/4 v7, 0x0

    .line 340
    .local v7, "y":I
    :goto_a
    int-to-float v1, v6

    int-to-float v2, v7

    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorWidth:I

    add-int/2addr v0, v6

    int-to-float v3, v0

    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    add-int/2addr v0, v7

    int-to-float v4, v0

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 346
    return-void

    .line 339
    .end local v7    # "y":I
    :cond_1b
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    sub-int v7, v0, v1

    goto :goto_a
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 88
    invoke-virtual {p0, v2}, Lcom/rey/material/widget/TabIndicatorView;->setHorizontalScrollBarEnabled(Z)V

    .line 90
    iput v3, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I

    .line 91
    iput-boolean v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z

    .line 92
    iput-boolean v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mCenterCurrentTab:Z

    .line 93
    iput v3, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorHeight:I

    .line 94
    iput-boolean v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mIndicatorAtTop:Z

    .line 95
    iput-boolean v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrolling:Z

    .line 96
    iput-boolean v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mIsRtl:Z

    .line 98
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mPaint:Landroid/graphics/Paint;

    .line 99
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mPaint:Landroid/graphics/Paint;

    invoke-static {p1, v3}, Lcom/rey/material/util/ThemeUtil;->colorAccent(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 102
    new-instance v0, Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;-><init>(Lcom/rey/material/widget/TabIndicatorView;)V

    iput-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    .line 103
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 104
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-boolean v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mIsRtl:Z

    invoke-direct {v0, p1, v2, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 105
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 106
    new-instance v0, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v0}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 107
    new-instance v0, Lcom/rey/material/widget/TabIndicatorView$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TabIndicatorView$1;-><init>(Lcom/rey/material/widget/TabIndicatorView;)V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 123
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/TabIndicatorView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 125
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_64

    .line 126
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mStyleId:I

    .line 127
    :cond_64
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .prologue
    .line 279
    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView;->onAttachedToWindow()V

    .line 281
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    .line 282
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->post(Ljava/lang/Runnable;)Z

    .line 284
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mStyleId:I

    if-eqz v0, :cond_1b

    .line 285
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 286
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 288
    :cond_1b
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 292
    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView;->onDetachedFromWindow()V

    .line 293
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    .line 294
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 296
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mStyleId:I

    if-eqz v0, :cond_17

    .line 297
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 298
    :cond_17
    return-void
.end method

.method protected onMeasure(II)V
    .registers 9
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    .line 313
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->onMeasure(II)V

    .line 315
    iget v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mMode:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2b

    .line 316
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getMeasuredWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 317
    .local v2, "totalWidth":I
    iget-object v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {v4}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v0

    .line 318
    .local v0, "count":I
    if-lez v0, :cond_2c

    .line 319
    div-int v3, v2, v0

    .line 320
    .local v3, "width":I
    add-int/lit8 v4, v0, -0x1

    mul-int/2addr v4, v3

    sub-int v1, v2, v4

    .line 321
    .local v1, "lastWidth":I
    iget-object v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {v4, v3, v1}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->setFixedWidth(II)V

    .line 326
    .end local v0    # "count":I
    .end local v1    # "lastWidth":I
    .end local v2    # "totalWidth":I
    .end local v3    # "width":I
    :cond_2b
    :goto_2b
    return-void

    .line 324
    .restart local v0    # "count":I
    .restart local v2    # "totalWidth":I
    :cond_2c
    iget-object v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {v4, v2, v2}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->setFixedWidth(II)V

    goto :goto_2b
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 7
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 302
    if-ne p1, v0, :cond_20

    .line 303
    .local v0, "rtl":Z
    :goto_4
    iget-boolean v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mIsRtl:Z

    if-eq v2, v0, :cond_1f

    .line 304
    iput-boolean v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mIsRtl:Z

    .line 305
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-boolean v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mIsRtl:Z

    invoke-direct {v2, v3, v1, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 306
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TabIndicatorView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 307
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->requestLayout()V

    .line 309
    :cond_1f
    return-void

    .end local v0    # "rtl":Z
    :cond_20
    move v0, v1

    .line 302
    goto :goto_4
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 330
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView;->onSizeChanged(IIII)V

    .line 331
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V

    .line 332
    return-void
.end method

.method protected onTabScrollStateChanged(I)V
    .registers 10
    .param p1, "state"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 349
    iget-boolean v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mCenterCurrentTab:Z

    if-eqz v4, :cond_46

    .line 350
    if-nez p1, :cond_3f

    .line 351
    iget-boolean v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    if-nez v4, :cond_3f

    .line 352
    iget-object v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v5, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v2

    .line 353
    .local v2, "v":Landroid/view/View;
    if-eqz v2, :cond_3f

    .line 354
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v5

    add-int/2addr v4, v5

    div-int/lit8 v3, v4, 0x2

    .line 355
    .local v3, "viewCenter":I
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getPaddingLeft()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getRight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v0, v4, 0x2

    .line 356
    .local v0, "parentCenter":I
    sub-int v1, v3, v0

    .line 357
    .local v1, "scrollNeeded":I
    if-eqz v1, :cond_3f

    .line 358
    invoke-virtual {p0, v1, v6}, Lcom/rey/material/widget/TabIndicatorView;->smoothScrollBy(II)V

    .line 359
    iput-boolean v7, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    .line 365
    .end local v0    # "parentCenter":I
    .end local v1    # "scrollNeeded":I
    .end local v2    # "v":Landroid/view/View;
    .end local v3    # "viewCenter":I
    :cond_3f
    if-eq p1, v7, :cond_44

    const/4 v4, 0x2

    if-ne p1, v4, :cond_46

    .line 366
    :cond_44
    iput-boolean v6, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrollingToCenter:Z

    .line 369
    :cond_46
    if-nez p1, :cond_56

    .line 370
    iput-boolean v6, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrolling:Z

    .line 371
    iget-object v4, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v5, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v2

    .line 372
    .restart local v2    # "v":Landroid/view/View;
    invoke-direct {p0, v2}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V

    .line 376
    .end local v2    # "v":Landroid/view/View;
    :goto_55
    return-void

    .line 375
    :cond_56
    iput-boolean v7, p0, Lcom/rey/material/widget/TabIndicatorView;->mScrolling:Z

    goto :goto_55
.end method

.method protected onTabScrolled(IF)V
    .registers 14
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F

    .prologue
    const/high16 v10, 0x3f000000    # 0.5f

    const/high16 v9, 0x40000000    # 2.0f

    .line 379
    iget-object v7, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v7, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v3

    .line 380
    .local v3, "scrollView":Landroid/view/View;
    iget-object v7, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    add-int/lit8 v8, p1, 0x1

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v1

    .line 382
    .local v1, "nextView":Landroid/view/View;
    if-eqz v3, :cond_3e

    if-eqz v1, :cond_3e

    .line 383
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    .line 384
    .local v6, "width_scroll":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    .line 385
    .local v5, "width_next":I
    add-int v7, v6, v5

    int-to-float v7, v7

    div-float v0, v7, v9

    .line 387
    .local v0, "distance":F
    int-to-float v7, v6

    sub-int v8, v5, v6

    int-to-float v8, v8

    mul-float/2addr v8, p2

    add-float/2addr v7, v8

    add-float/2addr v7, v10

    float-to-int v4, v7

    .line 388
    .local v4, "width":I
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

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

    float-to-int v2, v7

    .line 389
    .local v2, "offset":I
    invoke-direct {p0, v2, v4}, Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(II)V

    .line 391
    .end local v0    # "distance":F
    .end local v2    # "offset":I
    .end local v4    # "width":I
    .end local v5    # "width_next":I
    .end local v6    # "width_scroll":I
    :cond_3e
    return-void
.end method

.method protected onTabSelected(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 394
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/TabIndicatorView;->setCurrentTab(I)V

    .line 395
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 270
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 271
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 272
    iput v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    .line 273
    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TabIndicatorView;->applyStyle(I)V

    .line 275
    :cond_15
    return-void
.end method

.method public setCurrentTab(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 254
    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    if-eq v1, p1, :cond_14

    .line 255
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 256
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_14

    .line 257
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "v":Landroid/view/View;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 260
    :cond_14
    iput p1, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    .line 261
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 262
    .restart local v0    # "v":Landroid/view/View;
    if-eqz v0, :cond_26

    .line 263
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "v":Landroid/view/View;
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 265
    :cond_26
    invoke-direct {p0, p1}, Lcom/rey/material/widget/TabIndicatorView;->animateToTab(I)V

    .line 266
    return-void
.end method

.method public setTabIndicatorFactory(Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;)V
    .registers 3
    .param p1, "factory"    # Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    .line 209
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView;->mAdapter:Lcom/rey/material/widget/TabIndicatorView$Adapter;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->setFactory(Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;)V

    .line 210
    return-void
.end method
