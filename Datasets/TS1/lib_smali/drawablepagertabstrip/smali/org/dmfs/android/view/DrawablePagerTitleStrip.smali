.class public Lorg/dmfs/android/view/DrawablePagerTitleStrip;
.super Landroid/view/ViewGroup;
.source "DrawablePagerTitleStrip.java"

# interfaces
.implements Lorg/dmfs/android/view/ViewPager$Decor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;
    }
.end annotation


# static fields
.field private static final ATTRS:[I

.field private static final TAG:Ljava/lang/String; = "PagerTitleStrip"

.field private static final TEXT_SPACING:I = 0x10


# instance fields
.field private mGravity:I

.field mImageViews:[Landroid/widget/ImageView;

.field private mLastKnownCurrentPage:I

.field private mLastKnownPositionOffset:F

.field private final mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

.field mPager:Lorg/dmfs/android/view/ViewPager;

.field private mScaledTextSpacing:I

.field private mUpdatingDrawables:Z

.field private mUpdatingPositions:Z

.field private mWatchingAdapter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/view/PagerAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 65
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100af

    aput v2, v0, v1

    sput-object v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->ATTRS:[I

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    .line 78
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    iput-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    .line 53
    const/4 v2, -0x1

    iput v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownCurrentPage:I

    .line 54
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    .line 61
    new-instance v2, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    invoke-direct {v2, p0, v3}, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;-><init>(Lorg/dmfs/android/view/DrawablePagerTitleStrip;Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;)V

    iput-object v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    .line 80
    sget-object v2, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->ATTRS:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 82
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    const/16 v3, 0x50

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mGravity:I

    .line 83
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v1, v2, Landroid/util/DisplayMetrics;->density:F

    .line 86
    .local v1, "density":F
    const/high16 v2, 0x41800000    # 16.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    iput v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    .line 87
    return-void
.end method

.method static synthetic access$0(Lorg/dmfs/android/view/DrawablePagerTitleStrip;)F
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    return v0
.end method


# virtual methods
.method getMinHeight()I
    .registers 3

    .prologue
    .line 464
    const/4 v1, 0x0

    .line 465
    .local v1, "minHeight":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 466
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_b

    .line 468
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    .line 470
    :cond_b
    return v1
.end method

.method public getTextSpacing()I
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 6

    .prologue
    .line 128
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 130
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 131
    .local v2, "parent":Landroid/view/ViewParent;
    instance-of v3, v2, Lorg/dmfs/android/view/ViewPager;

    if-nez v3, :cond_13

    .line 133
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "PagerTitleStrip must be a direct child of a ViewPager."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_13
    move-object v1, v2

    .line 136
    check-cast v1, Lorg/dmfs/android/view/ViewPager;

    .line 137
    .local v1, "pager":Lorg/dmfs/android/view/ViewPager;
    invoke-virtual {v1}, Lorg/dmfs/android/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 139
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    invoke-virtual {v1, v3}, Lorg/dmfs/android/view/ViewPager;->setInternalPageChangeListener(Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;)Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .line 140
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    invoke-virtual {v1, v3}, Lorg/dmfs/android/view/ViewPager;->setOnAdapterChangeListener(Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;)V

    .line 141
    iput-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    .line 142
    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_36

    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/PagerAdapter;

    :goto_32
    invoke-virtual {p0, v3, v0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 143
    return-void

    .line 142
    :cond_36
    const/4 v3, 0x0

    goto :goto_32
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 149
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 150
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    if-eqz v0, :cond_1d

    .line 152
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0}, Lorg/dmfs/android/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 153
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->setInternalPageChangeListener(Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;)Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .line 154
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->setOnAdapterChangeListener(Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;)V

    .line 155
    iput-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    .line 157
    :cond_1d
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 9
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v0, 0x0

    .line 454
    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    if-eqz v1, :cond_13

    .line 456
    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    cmpl-float v1, v1, v0

    if-ltz v1, :cond_d

    iget v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    .line 457
    .local v0, "offset":F
    :cond_d
    iget v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownCurrentPage:I

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateDrawablePositions(IFZ)V

    .line 459
    .end local v0    # "offset":F
    :cond_13
    return-void
.end method

.method protected onMeasure(II)V
    .registers 17
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 415
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 416
    .local v9, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 417
    .local v3, "heightMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v10

    .line 418
    .local v10, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 420
    .local v4, "heightSize":I
    const/high16 v11, 0x40000000    # 2.0f

    if-eq v9, v11, :cond_1c

    .line 422
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Must measure with an exact width"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 425
    :cond_1c
    move v0, v4

    .line 426
    .local v0, "childHeight":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getMinHeight()I

    move-result v6

    .line 427
    .local v6, "minHeight":I
    const/4 v7, 0x0

    .line 428
    .local v7, "padding":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingTop()I

    move-result v11

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingBottom()I

    move-result v12

    add-int v7, v11, v12

    .line 429
    sub-int/2addr v0, v7

    .line 431
    int-to-float v11, v10

    const v12, 0x3f4ccccd    # 0.8f

    mul-float/2addr v11, v12

    float-to-int v11, v11

    const/high16 v12, -0x80000000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 432
    .local v2, "childWidthSpec":I
    const/high16 v11, -0x80000000

    invoke-static {v0, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 434
    .local v1, "childHeightSpec":I
    iget-object v12, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v13, v12

    const/4 v11, 0x0

    :goto_43
    if-lt v11, v13, :cond_4d

    .line 439
    const/high16 v11, 0x40000000    # 2.0f

    if-ne v3, v11, :cond_55

    .line 441
    invoke-virtual {p0, v10, v4}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setMeasuredDimension(II)V

    .line 448
    :goto_4c
    return-void

    .line 434
    :cond_4d
    aget-object v5, v12, v11

    .line 436
    .local v5, "iv":Landroid/widget/ImageView;
    invoke-virtual {v5, v2, v1}, Landroid/widget/ImageView;->measure(II)V

    .line 434
    add-int/lit8 v11, v11, 0x1

    goto :goto_43

    .line 445
    .end local v5    # "iv":Landroid/widget/ImageView;
    :cond_55
    iget-object v11, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    iget-object v12, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v12, v12

    div-int/lit8 v12, v12, 0x2

    aget-object v11, v11, v12

    invoke-virtual {v11}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v8

    .line 446
    .local v8, "textHeight":I
    add-int v11, v8, v7

    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    invoke-virtual {p0, v10, v11}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->setMeasuredDimension(II)V

    goto :goto_4c
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 203
    iget-boolean v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingDrawables:Z

    if-nez v0, :cond_7

    .line 205
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 207
    :cond_7
    return-void
.end method

.method public setGravity(I)V
    .registers 2
    .param p1, "gravity"    # I

    .prologue
    .line 120
    iput p1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mGravity:I

    .line 121
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->requestLayout()V

    .line 122
    return-void
.end method

.method public setTextSpacing(I)V
    .registers 2
    .param p1, "spacingPixels"    # I

    .prologue
    .line 98
    iput p1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    .line 99
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->requestLayout()V

    .line 100
    return-void
.end method

.method updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
    .registers 12
    .param p1, "oldAdapter"    # Landroid/support/v4/view/PagerAdapter;
    .param p2, "newAdapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 212
    if-eqz p1, :cond_b

    .line 214
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    invoke-virtual {p1, v5}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 215
    iput-object v6, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    .line 217
    :cond_b
    if-eqz p2, :cond_9c

    .line 219
    instance-of v5, p2, Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;

    if-nez v5, :cond_19

    .line 221
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Adapter must implement IDrawableTitlePagerAdapter"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 224
    :cond_19
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPageListener:Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;

    invoke-virtual {p2, v5}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 225
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    .line 227
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 230
    .local v0, "context":Landroid/content/Context;
    const/4 v5, 0x1

    const/16 v6, 0x9

    invoke-virtual {p2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 232
    .local v2, "newCount":I
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    if-eqz v5, :cond_41

    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v5, v5

    if-ge v5, v2, :cond_7d

    .line 234
    :cond_41
    new-array v3, v2, [Landroid/widget/ImageView;

    .line 235
    .local v3, "newImages":[Landroid/widget/ImageView;
    const/4 v4, 0x0

    .line 236
    .local v4, "start":I
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    if-eqz v5, :cond_53

    .line 238
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    iget-object v6, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v6, v6

    invoke-static {v5, v8, v3, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v4, v5

    .line 242
    :cond_53
    move v1, v4

    .local v1, "i":I
    :goto_54
    if-lt v1, v2, :cond_70

    .line 246
    iput-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    .line 266
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "i":I
    .end local v2    # "newCount":I
    .end local v3    # "newImages":[Landroid/widget/ImageView;
    .end local v4    # "start":I
    :cond_58
    :goto_58
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    if-eqz v5, :cond_6f

    .line 268
    const/4 v5, -0x1

    iput v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownCurrentPage:I

    .line 269
    const/high16 v5, -0x40800000    # -1.0f

    iput v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    .line 270
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v5}, Lorg/dmfs/android/view/ViewPager;->getCurrentItem()I

    move-result v5

    invoke-virtual {p0, v5, p2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateImages(ILandroid/support/v4/view/PagerAdapter;)V

    .line 271
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->requestLayout()V

    .line 273
    :cond_6f
    return-void

    .line 244
    .restart local v0    # "context":Landroid/content/Context;
    .restart local v1    # "i":I
    .restart local v2    # "newCount":I
    .restart local v3    # "newImages":[Landroid/widget/ImageView;
    .restart local v4    # "start":I
    :cond_70
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    aput-object v5, v3, v1

    invoke-virtual {p0, v5}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->addView(Landroid/view/View;)V

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_54

    .line 248
    .end local v1    # "i":I
    .end local v3    # "newImages":[Landroid/widget/ImageView;
    .end local v4    # "start":I
    :cond_7d
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v5, v5

    if-le v5, v2, :cond_58

    .line 250
    new-array v3, v2, [Landroid/widget/ImageView;

    .line 251
    .restart local v3    # "newImages":[Landroid/widget/ImageView;
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    invoke-static {v5, v8, v3, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 253
    move v1, v2

    .restart local v1    # "i":I
    :goto_8a
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v5, v5

    if-lt v1, v5, :cond_92

    .line 258
    iput-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    goto :goto_58

    .line 255
    :cond_92
    iget-object v5, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    aget-object v5, v5, v1

    invoke-virtual {p0, v5}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->removeView(Landroid/view/View;)V

    .line 253
    add-int/lit8 v1, v1, 0x1

    goto :goto_8a

    .line 263
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "i":I
    .end local v2    # "newCount":I
    .end local v3    # "newImages":[Landroid/widget/ImageView;
    :cond_9c
    iput-object v6, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    goto :goto_58
.end method

.method updateDrawablePositions(IFZ)V
    .registers 36
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "force"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    if-eqz v27, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    if-nez v27, :cond_16

    .line 409
    :cond_15
    :goto_15
    return-void

    .line 284
    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownCurrentPage:I

    move/from16 v27, v0

    move/from16 v0, p1

    move/from16 v1, v27

    if-eq v0, v1, :cond_11d

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/dmfs/android/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v27

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateImages(ILandroid/support/v4/view/PagerAdapter;)V

    .line 293
    :cond_35
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingPositions:Z

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v26, v0

    .line 296
    .local v26, "widths":[I
    const/4 v10, 0x0

    .local v10, "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v12, v0

    .local v12, "l":I
    :goto_58
    if-lt v10, v12, :cond_12b

    .line 301
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getWidth()I

    move-result v23

    .line 302
    .local v23, "stripWidth":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getHeight()I

    move-result v22

    .line 303
    .local v22, "stripHeight":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingLeft()I

    move-result v18

    .line 304
    .local v18, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingRight()I

    move-result v19

    .line 305
    .local v19, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingTop()I

    move-result v20

    .line 306
    .local v20, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingBottom()I

    move-result v17

    .line 308
    .local v17, "paddingBottom":I
    const/high16 v27, 0x3f000000    # 0.5f

    add-float v9, p2, v27

    .line 309
    .local v9, "currOffset":F
    const/high16 v27, 0x3f800000    # 1.0f

    cmpl-float v27, v9, v27

    if-lez v27, :cond_80

    .line 311
    const/high16 v27, 0x3f800000    # 1.0f

    sub-float v9, v9, v27

    .line 313
    :cond_80
    div-int/lit8 v27, v23, 0x2

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v28, v0

    div-int/lit8 v28, v28, 0x2

    aget v28, v26, v28

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    move/from16 v29, v0

    add-int v28, v28, v29

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x3f000000    # 0.5f

    sub-float v29, v9, v29

    mul-float v28, v28, v29

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    sub-int v7, v27, v28

    .line 314
    .local v7, "currCenter":I
    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    div-int/lit8 v27, v27, 0x2

    aget v27, v26, v27

    div-int/lit8 v27, v27, 0x2

    sub-int v8, v7, v27

    .line 316
    .local v8, "currLeft":I
    const/4 v14, 0x0

    .line 317
    .local v14, "maxBaseline":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v29, v0

    const/16 v27, 0x0

    :goto_c0
    move/from16 v0, v27

    move/from16 v1, v29

    if-lt v0, v1, :cond_13d

    .line 322
    const/4 v15, 0x0

    .line 323
    .local v15, "maxTextHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v29, v0

    const/16 v27, 0x0

    :goto_d4
    move/from16 v0, v27

    move/from16 v1, v29

    if-lt v0, v1, :cond_14d

    .line 328
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mGravity:I

    move/from16 v27, v0

    and-int/lit8 v25, v27, 0x70

    .line 330
    .local v25, "vgrav":I
    move v13, v8

    .line 331
    .local v13, "left":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    div-int/lit8 v10, v27, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v12, v0

    :goto_f9
    if-lt v10, v12, :cond_165

    .line 369
    move v13, v8

    .line 370
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    div-int/lit8 v27, v27, 0x2

    add-int/lit8 v10, v27, -0x1

    :goto_10b
    if-gez v10, :cond_20f

    .line 407
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    .line 408
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingPositions:Z

    goto/16 :goto_15

    .line 288
    .end local v7    # "currCenter":I
    .end local v8    # "currLeft":I
    .end local v9    # "currOffset":F
    .end local v10    # "i":I
    .end local v12    # "l":I
    .end local v13    # "left":I
    .end local v14    # "maxBaseline":I
    .end local v15    # "maxTextHeight":I
    .end local v17    # "paddingBottom":I
    .end local v18    # "paddingLeft":I
    .end local v19    # "paddingRight":I
    .end local v20    # "paddingTop":I
    .end local v22    # "stripHeight":I
    .end local v23    # "stripWidth":I
    .end local v25    # "vgrav":I
    .end local v26    # "widths":[I
    :cond_11d
    if-nez p3, :cond_35

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    move/from16 v27, v0

    cmpl-float v27, p2, v27

    if-nez v27, :cond_35

    goto/16 :goto_15

    .line 298
    .restart local v10    # "i":I
    .restart local v12    # "l":I
    .restart local v26    # "widths":[I
    :cond_12b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    invoke-virtual/range {v27 .. v27}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v27

    aput v27, v26, v10

    .line 296
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_58

    .line 317
    .restart local v7    # "currCenter":I
    .restart local v8    # "currLeft":I
    .restart local v9    # "currOffset":F
    .restart local v14    # "maxBaseline":I
    .restart local v17    # "paddingBottom":I
    .restart local v18    # "paddingLeft":I
    .restart local v19    # "paddingRight":I
    .restart local v20    # "paddingTop":I
    .restart local v22    # "stripHeight":I
    .restart local v23    # "stripWidth":I
    :cond_13d
    aget-object v11, v28, v27

    .line 319
    .local v11, "iv":Landroid/widget/ImageView;
    invoke-virtual {v11}, Landroid/widget/ImageView;->getBaseline()I

    move-result v30

    move/from16 v0, v30

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 317
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_c0

    .line 323
    .end local v11    # "iv":Landroid/widget/ImageView;
    .restart local v15    # "maxTextHeight":I
    :cond_14d
    aget-object v11, v28, v27

    .line 325
    .restart local v11    # "iv":Landroid/widget/ImageView;
    invoke-virtual {v11}, Landroid/widget/ImageView;->getBaseline()I

    move-result v30

    sub-int v30, v14, v30

    invoke-virtual {v11}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v31

    add-int v30, v30, v31

    move/from16 v0, v30

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 323
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_d4

    .line 333
    .end local v11    # "iv":Landroid/widget/ImageView;
    .restart local v13    # "left":I
    .restart local v25    # "vgrav":I
    :cond_165
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    invoke-virtual/range {v27 .. v27}, Landroid/widget/ImageView;->getBaseline()I

    move-result v4

    .line 335
    .local v4, "baseline":I
    sparse-switch v25, :sswitch_data_2b4

    .line 339
    add-int v27, v20, v14

    sub-int v24, v27, v4

    .line 352
    .local v24, "top":I
    :goto_178
    aget v27, v26, v10

    add-int v21, v13, v27

    .line 353
    .local v21, "right":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v28, v0

    aget-object v28, v28, v10

    invoke-virtual/range {v28 .. v28}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v28

    add-int v28, v28, v24

    move-object/from16 v0, v27

    move/from16 v1, v24

    move/from16 v2, v21

    move/from16 v3, v28

    invoke-virtual {v0, v13, v1, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    .line 354
    aget v27, v26, v10

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    move/from16 v28, v0

    add-int v27, v27, v28

    add-int v13, v13, v27

    .line 356
    sget v27, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v28, 0xe

    move/from16 v0, v27

    move/from16 v1, v28

    if-lt v0, v1, :cond_1e6

    .line 358
    sub-int v27, v23, v21

    move/from16 v0, v27

    move/from16 v1, v19

    if-ge v0, v1, :cond_201

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    const/high16 v28, 0x3f800000    # 1.0f

    sub-int v29, v23, v21

    sub-int v29, v29, v19

    const/16 v30, 0x0

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(II)I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(I)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    aget v30, v26, v10

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v29, v29, v30

    sub-float v28, v28, v29

    invoke-virtual/range {v27 .. v28}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 331
    :cond_1e6
    :goto_1e6
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_f9

    .line 342
    .end local v21    # "right":I
    .end local v24    # "top":I
    :sswitch_1ea
    sub-int v27, v22, v20

    sub-int v16, v27, v17

    .line 343
    .local v16, "paddedHeight":I
    sub-int v27, v16, v15

    div-int/lit8 v6, v27, 0x2

    .line 344
    .local v6, "centeredTop":I
    add-int v27, v6, v14

    sub-int v24, v27, v4

    .line 345
    .restart local v24    # "top":I
    goto :goto_178

    .line 347
    .end local v6    # "centeredTop":I
    .end local v16    # "paddedHeight":I
    .end local v24    # "top":I
    :sswitch_1f7
    sub-int v27, v22, v17

    sub-int v5, v27, v15

    .line 348
    .local v5, "bottomGravTop":I
    add-int v27, v5, v14

    sub-int v24, v27, v4

    .restart local v24    # "top":I
    goto/16 :goto_178

    .line 364
    .end local v5    # "bottomGravTop":I
    .restart local v21    # "right":I
    :cond_201
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    const/high16 v28, 0x3f800000    # 1.0f

    invoke-virtual/range {v27 .. v28}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_1e6

    .line 372
    .end local v4    # "baseline":I
    .end local v21    # "right":I
    .end local v24    # "top":I
    :cond_20f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    invoke-virtual/range {v27 .. v27}, Landroid/widget/ImageView;->getBaseline()I

    move-result v4

    .line 374
    .restart local v4    # "baseline":I
    sparse-switch v25, :sswitch_data_2be

    .line 378
    add-int v27, v20, v14

    sub-int v24, v27, v4

    .line 390
    .restart local v24    # "top":I
    :goto_222
    aget v27, v26, v10

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mScaledTextSpacing:I

    move/from16 v28, v0

    add-int v27, v27, v28

    sub-int v13, v13, v27

    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    aget v28, v26, v10

    add-int v28, v28, v13

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v29, v0

    aget-object v29, v29, v10

    invoke-virtual/range {v29 .. v29}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v29

    add-int v29, v29, v24

    move-object/from16 v0, v27

    move/from16 v1, v24

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-virtual {v0, v13, v1, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    .line 394
    sget v27, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v28, 0xe

    move/from16 v0, v27

    move/from16 v1, v28

    if-lt v0, v1, :cond_28a

    .line 396
    move/from16 v0, v18

    if-ge v13, v0, :cond_2a5

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    const/high16 v28, 0x3f800000    # 1.0f

    sub-int v29, v13, v18

    const/16 v30, 0x0

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(II)I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(I)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    aget v30, v26, v10

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v29, v29, v30

    sub-float v28, v28, v29

    invoke-virtual/range {v27 .. v28}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 370
    :cond_28a
    :goto_28a
    add-int/lit8 v10, v10, -0x1

    goto/16 :goto_10b

    .line 381
    .end local v24    # "top":I
    :sswitch_28e
    sub-int v27, v22, v20

    sub-int v16, v27, v17

    .line 382
    .restart local v16    # "paddedHeight":I
    sub-int v27, v16, v15

    div-int/lit8 v6, v27, 0x2

    .line 383
    .restart local v6    # "centeredTop":I
    add-int v27, v6, v14

    sub-int v24, v27, v4

    .line 384
    .restart local v24    # "top":I
    goto :goto_222

    .line 386
    .end local v6    # "centeredTop":I
    .end local v16    # "paddedHeight":I
    .end local v24    # "top":I
    :sswitch_29b
    sub-int v27, v22, v17

    sub-int v5, v27, v15

    .line 387
    .restart local v5    # "bottomGravTop":I
    add-int v27, v5, v14

    sub-int v24, v27, v4

    .restart local v24    # "top":I
    goto/16 :goto_222

    .line 402
    .end local v5    # "bottomGravTop":I
    :cond_2a5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    move-object/from16 v27, v0

    aget-object v27, v27, v10

    const/high16 v28, 0x3f800000    # 1.0f

    invoke-virtual/range {v27 .. v28}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_28a

    .line 335
    nop

    :sswitch_data_2b4
    .sparse-switch
        0x10 -> :sswitch_1ea
        0x50 -> :sswitch_1f7
    .end sparse-switch

    .line 374
    :sswitch_data_2be
    .sparse-switch
        0x10 -> :sswitch_28e
        0x50 -> :sswitch_29b
    .end sparse-switch
.end method

.method updateImages(ILandroid/support/v4/view/PagerAdapter;)V
    .registers 16
    .param p1, "currentItem"    # I
    .param p2, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    .line 162
    iget-object v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    if-eqz v10, :cond_d

    iget-object v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v10, v10

    if-eqz v10, :cond_d

    instance-of v10, p2, Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;

    if-nez v10, :cond_e

    .line 197
    :cond_d
    :goto_d
    return-void

    :cond_e
    move-object v3, p2

    .line 167
    check-cast v3, Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;

    .line 169
    .local v3, "dAdapter":Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;
    if-eqz p2, :cond_6b

    invoke-virtual {p2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v6

    .line 170
    .local v6, "itemCount":I
    :goto_17
    const/4 v10, 0x1

    iput-boolean v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingDrawables:Z

    .line 171
    iget-object v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v10, v10

    div-int/lit8 v4, v10, 0x2

    .line 172
    .local v4, "half":I
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v8, v10

    .local v8, "l":I
    :goto_23
    if-lt v5, v8, :cond_6d

    .line 179
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getWidth()I

    move-result v10

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingLeft()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingRight()I

    move-result v11

    sub-int v9, v10, v11

    .line 180
    .local v9, "width":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getHeight()I

    move-result v10

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingTop()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p0}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->getPaddingBottom()I

    move-result v11

    sub-int v0, v10, v11

    .line 181
    .local v0, "childHeight":I
    int-to-float v10, v9

    const v11, 0x3f4ccccd    # 0.8f

    mul-float/2addr v10, v11

    float-to-int v10, v10

    const/high16 v11, -0x80000000

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 182
    .local v2, "childWidthSpec":I
    const/high16 v10, -0x80000000

    invoke-static {v0, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 184
    .local v1, "childHeightSpec":I
    iget-object v11, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    array-length v12, v11

    const/4 v10, 0x0

    :goto_59
    if-lt v10, v12, :cond_8c

    .line 189
    iput p1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownCurrentPage:I

    .line 191
    iget-boolean v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingPositions:Z

    if-nez v10, :cond_67

    .line 193
    iget v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F

    const/4 v11, 0x0

    invoke-virtual {p0, p1, v10, v11}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateDrawablePositions(IFZ)V

    .line 196
    :cond_67
    const/4 v10, 0x0

    iput-boolean v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mUpdatingDrawables:Z

    goto :goto_d

    .line 169
    .end local v0    # "childHeight":I
    .end local v1    # "childHeightSpec":I
    .end local v2    # "childWidthSpec":I
    .end local v4    # "half":I
    .end local v5    # "i":I
    .end local v6    # "itemCount":I
    .end local v8    # "l":I
    .end local v9    # "width":I
    :cond_6b
    const/4 v6, 0x0

    goto :goto_17

    .line 174
    .restart local v4    # "half":I
    .restart local v5    # "i":I
    .restart local v6    # "itemCount":I
    .restart local v8    # "l":I
    :cond_6d
    iget-object v10, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mImageViews:[Landroid/widget/ImageView;

    aget-object v11, v10, v5

    if-eqz p2, :cond_8a

    sub-int v10, v5, v4

    add-int/2addr v10, p1

    if-ltz v10, :cond_8a

    sub-int v10, v5, v4

    add-int/2addr v10, p1

    if-ge v10, v6, :cond_8a

    .line 175
    sub-int v10, v5, v4

    add-int/2addr v10, p1

    invoke-interface {v3, v10}, Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;->getDrawableTitle(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 174
    :goto_84
    invoke-virtual {v11, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 172
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 175
    :cond_8a
    const/4 v10, 0x0

    goto :goto_84

    .line 184
    .restart local v0    # "childHeight":I
    .restart local v1    # "childHeightSpec":I
    .restart local v2    # "childWidthSpec":I
    .restart local v9    # "width":I
    :cond_8c
    aget-object v7, v11, v10

    .line 186
    .local v7, "iv":Landroid/widget/ImageView;
    invoke-virtual {v7, v2, v1}, Landroid/widget/ImageView;->measure(II)V

    .line 184
    add-int/lit8 v10, v10, 0x1

    goto :goto_59
.end method
