.class public Lorg/dmfs/android/view/DrawablePagerTabStrip;
.super Lorg/dmfs/android/view/DrawablePagerTitleStrip;
.source "DrawablePagerTabStrip.java"


# static fields
.field private static final FULL_UNDERLINE_HEIGHT:I = 0x1

.field private static final INDICATOR_HEIGHT:I = 0x3

.field private static final MIN_PADDING_BOTTOM:I = 0x6

.field private static final MIN_STRIP_HEIGHT:I = 0x20

.field private static final MIN_TEXT_SPACING:I = 0x0

.field private static final TAB_PADDING:I = 0x0

.field private static final TAB_SPACING:I = 0x0

.field private static final TAG:Ljava/lang/String; = "PagerTabStrip"


# instance fields
.field private mDrawFullUnderline:Z

.field private mDrawFullUnderlineSet:Z

.field private mFullUnderlineHeight:I

.field private mIgnoreTap:Z

.field private mIndicatorColor:I

.field private mIndicatorHeight:I

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mMinPaddingBottom:I

.field private mMinStripHeight:I

.field private mMinTextSpacing:I

.field private mTabAlpha:I

.field private mTabPadding:I

.field private final mTabPaint:Landroid/graphics/Paint;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTouchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    .line 85
    invoke-direct {p0, p1, p2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPaint:Landroid/graphics/Paint;

    .line 63
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTempRect:Landroid/graphics/Rect;

    .line 65
    const/16 v1, 0xff

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabAlpha:I

    .line 67
    iput-boolean v5, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 68
    iput-boolean v5, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderlineSet:Z

    .line 87
    iput v5, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    .line 88
    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPaint:Landroid/graphics/Paint;

    iget v2, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 93
    .local v0, "density":F
    const/high16 v1, 0x40400000    # 3.0f

    mul-float/2addr v1, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorHeight:I

    .line 94
    const/high16 v1, 0x40c00000    # 6.0f

    mul-float/2addr v1, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinPaddingBottom:I

    .line 95
    mul-float v1, v4, v0

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinTextSpacing:I

    .line 96
    mul-float v1, v4, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPadding:I

    .line 97
    const/high16 v1, 0x3f800000    # 1.0f

    mul-float/2addr v1, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mFullUnderlineHeight:I

    .line 98
    const/high16 v1, 0x42000000    # 32.0f

    mul-float/2addr v1, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinStripHeight:I

    .line 99
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTouchSlop:I

    .line 102
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->setPadding(IIII)V

    .line 103
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getTextSpacing()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->setTextSpacing(I)V

    .line 105
    invoke-virtual {p0, v5}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->setWillNotDraw(Z)V

    .line 107
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_87

    .line 109
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 111
    :cond_87
    return-void
.end method


# virtual methods
.method public getDrawFullUnderline()Z
    .registers 2

    .prologue
    .line 225
    iget-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    return v0
.end method

.method getMinHeight()I
    .registers 3

    .prologue
    .line 232
    invoke-super {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getMinHeight()I

    move-result v0

    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinStripHeight:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getTabIndicatorColor()I
    .registers 2

    .prologue
    .line 145
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 284
    invoke-super {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->onDraw(Landroid/graphics/Canvas;)V

    .line 286
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getHeight()I

    move-result v7

    .line 287
    .local v7, "height":I
    move v6, v7

    .line 288
    .local v6, "bottom":I
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v1, v1

    div-int/lit8 v1, v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLeft()I

    move-result v0

    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPadding:I

    sub-int v8, v0, v1

    .line 289
    .local v8, "left":I
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v1, v1

    div-int/lit8 v1, v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v0

    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPadding:I

    add-int v9, v0, v1

    .line 290
    .local v9, "right":I
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorHeight:I

    sub-int v10, v6, v0

    .line 292
    .local v10, "top":I
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPaint:Landroid/graphics/Paint;

    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabAlpha:I

    shl-int/lit8 v1, v1, 0x18

    iget v2, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 293
    int-to-float v1, v8

    int-to-float v2, v10

    int-to-float v3, v9

    int-to-float v4, v6

    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 294
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 185
    invoke-super {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setBackgroundColor(I)V

    .line 186
    iget-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderlineSet:Z

    if-nez v0, :cond_f

    .line 188
    const/high16 v0, -0x1000000

    and-int/2addr v0, p1

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_d
    iput-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 190
    :cond_f
    return-void

    .line 188
    :cond_10
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 174
    invoke-super {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 175
    iget-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderlineSet:Z

    if-nez v0, :cond_c

    .line 177
    if-nez p1, :cond_d

    const/4 v0, 0x1

    :goto_a
    iput-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 179
    :cond_c
    return-void

    .line 177
    :cond_d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 196
    invoke-super {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setBackgroundResource(I)V

    .line 197
    iget-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderlineSet:Z

    if-nez v0, :cond_c

    .line 199
    if-nez p1, :cond_d

    const/4 v0, 0x1

    :goto_a
    iput-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 201
    :cond_c
    return-void

    .line 199
    :cond_d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setDrawFullUnderline(Z)V
    .registers 3
    .param p1, "drawFull"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderline:Z

    .line 213
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mDrawFullUnderlineSet:Z

    .line 214
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->invalidate()V

    .line 215
    return-void
.end method

.method public setPadding(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 152
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinPaddingBottom:I

    if-ge p4, v0, :cond_6

    .line 154
    iget p4, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinPaddingBottom:I

    .line 156
    :cond_6
    invoke-super {p0, p1, p2, p3, p4}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setPadding(IIII)V

    .line 157
    return-void
.end method

.method public setTabIndicatorColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 122
    iput p1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    .line 123
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mTabPaint:Landroid/graphics/Paint;

    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mIndicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 124
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->invalidate()V

    .line 125
    return-void
.end method

.method public setTabIndicatorColorResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/DrawablePagerTabStrip;->setTabIndicatorColor(I)V

    .line 137
    return-void
.end method

.method public setTextSpacing(I)V
    .registers 3
    .param p1, "textSpacing"    # I

    .prologue
    .line 163
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinTextSpacing:I

    if-ge p1, v0, :cond_6

    .line 165
    iget p1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mMinTextSpacing:I

    .line 167
    :cond_6
    invoke-super {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setTextSpacing(I)V

    .line 168
    return-void
.end method

.method updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
    .registers 8
    .param p1, "oldAdapter"    # Landroid/support/v4/view/PagerAdapter;
    .param p2, "newAdapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    .line 300
    invoke-super {p0, p1, p2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 302
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    if-eqz v3, :cond_d

    .line 304
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v1, v3

    .local v1, "l":I
    :goto_b
    if-lt v0, v1, :cond_e

    .line 323
    .end local v0    # "i":I
    .end local v1    # "l":I
    :cond_d
    return-void

    .line 306
    .restart local v0    # "i":I
    .restart local v1    # "l":I
    :cond_e
    div-int/lit8 v3, v1, 0x2

    if-ne v0, v3, :cond_15

    .line 304
    :goto_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 310
    :cond_15
    div-int/lit8 v3, v1, 0x2

    sub-int v2, v0, v3

    .line 312
    .local v2, "x":I
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 313
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mImageViews:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    new-instance v4, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;

    invoke-direct {v4, p0, v2}, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;-><init>(Lorg/dmfs/android/view/DrawablePagerTabStrip;I)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_12
.end method
