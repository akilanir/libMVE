.class public Lorg/dmfs/android/view/ViewPager;
.super Landroid/view/ViewGroup;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/view/ViewPager$Decor;,
        Lorg/dmfs/android/view/ViewPager$ItemInfo;,
        Lorg/dmfs/android/view/ViewPager$LayoutParams;,
        Lorg/dmfs/android/view/ViewPager$MyAccessibilityDelegate;,
        Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;,
        Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;,
        Lorg/dmfs/android/view/ViewPager$PageTransformer;,
        Lorg/dmfs/android/view/ViewPager$PagerObserver;,
        Lorg/dmfs/android/view/ViewPager$SavedState;,
        Lorg/dmfs/android/view/ViewPager$SimpleOnPageChangeListener;,
        Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;
    }
.end annotation


# static fields
.field private static final CLOSE_ENOUGH:I = 0x2

.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/dmfs/android/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_GUTTER_SIZE:I = 0x10

.field private static final DEFAULT_OFFSCREEN_PAGES:I = 0x1

.field private static final DRAW_ORDER_DEFAULT:I = 0x0

.field private static final DRAW_ORDER_FORWARD:I = 0x1

.field private static final DRAW_ORDER_REVERSE:I = 0x2

.field private static final INVALID_POINTER:I = -0x1

.field private static final LAYOUT_ATTRS:[I

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field private static final MIN_DISTANCE_FOR_FLING:I = 0x19

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ViewPager"

.field private static final USE_CACHE:Z

.field private static final sInterpolator:Landroid/view/animation/Interpolator;

.field private static final sPositionComparator:Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;


# instance fields
.field private mActivePointerId:I

.field private mAdapter:Landroid/support/v4/view/PagerAdapter;

.field private mAdapterChangeListener:Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;

.field private mBottomPageBounds:I

.field private mCalledSuper:Z

.field private mChildHeightMeasureSpec:I

.field private mChildWidthMeasureSpec:I

.field private mCloseEnough:I

.field private mCurItem:I

.field private mDecorChildCount:I

.field private mDefaultGutterSize:I

.field private mDrawingOrder:I

.field private mDrawingOrderedChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mEndScrollRunnable:Ljava/lang/Runnable;

.field private mExpectedAdapterCount:I

.field private mFakeDragBeginTime:J

.field private mFakeDragging:Z

.field private mFirstLayout:Z

.field private mFirstOffset:F

.field private mFlingDistance:I

.field private mGutterSize:I

.field private mIgnoreGutter:Z

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

.field private mIsBeingDragged:Z

.field private mIsUnableToDrag:Z

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/dmfs/android/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLastOffset:F

.field private mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mMarginDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mNeedCalculatePageOffsets:Z

.field private mObserver:Lorg/dmfs/android/view/ViewPager$PagerObserver;

.field private mOffscreenPageLimit:I

.field private mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

.field private mPageMargin:I

.field private mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

.field private mPopulatePending:Z

.field private mRestoredAdapterState:Landroid/os/Parcelable;

.field private mRestoredClassLoader:Ljava/lang/ClassLoader;

.field private mRestoredCurItem:I

.field private mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mScrollState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mScrollingCacheEnabled:Z

.field private mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

.field private final mTempItem:Lorg/dmfs/android/view/ViewPager$ItemInfo;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTopPageBounds:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 105
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 106
    const v2, 0x10100b3

    aput v2, v0, v1

    .line 105
    sput-object v0, Lorg/dmfs/android/view/ViewPager;->LAYOUT_ATTRS:[I

    .line 123
    new-instance v0, Lorg/dmfs/android/view/ViewPager$1;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$1;-><init>()V

    sput-object v0, Lorg/dmfs/android/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    .line 130
    new-instance v0, Lorg/dmfs/android/view/ViewPager$2;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$2;-><init>()V

    sput-object v0, Lorg/dmfs/android/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    .line 230
    new-instance v0, Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;-><init>()V

    sput-object v0, Lorg/dmfs/android/view/ViewPager;->sPositionComparator:Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;

    .line 246
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 351
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 138
    new-instance v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mTempItem:Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 140
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 144
    iput v1, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    .line 145
    iput-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 146
    iput-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 158
    const v0, -0x800001

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    .line 159
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    .line 168
    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    .line 187
    iput v1, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 214
    iput-boolean v3, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 215
    iput-boolean v2, p0, Lorg/dmfs/android/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 248
    new-instance v0, Lorg/dmfs/android/view/ViewPager$3;

    invoke-direct {v0, p0}, Lorg/dmfs/android/view/ViewPager$3;-><init>(Lorg/dmfs/android/view/ViewPager;)V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 255
    iput v2, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    .line 352
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->initViewPager()V

    .line 353
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 356
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 138
    new-instance v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mTempItem:Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 140
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 144
    iput v1, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    .line 145
    iput-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 146
    iput-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 158
    const v0, -0x800001

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    .line 159
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    .line 168
    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    .line 187
    iput v1, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 214
    iput-boolean v3, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 215
    iput-boolean v2, p0, Lorg/dmfs/android/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 248
    new-instance v0, Lorg/dmfs/android/view/ViewPager$3;

    invoke-direct {v0, p0}, Lorg/dmfs/android/view/ViewPager$3;-><init>(Lorg/dmfs/android/view/ViewPager;)V

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 255
    iput v2, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    .line 357
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->initViewPager()V

    .line 358
    return-void
.end method

.method static synthetic access$0(Lorg/dmfs/android/view/ViewPager;I)V
    .registers 2

    .prologue
    .line 394
    invoke-direct {p0, p1}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    return-void
.end method

.method static synthetic access$1(Lorg/dmfs/android/view/ViewPager;)Landroid/support/v4/view/PagerAdapter;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method static synthetic access$2(Lorg/dmfs/android/view/ViewPager;)I
    .registers 2

    .prologue
    .line 143
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    return v0
.end method

.method static synthetic access$3()[I
    .registers 1

    .prologue
    .line 105
    sget-object v0, Lorg/dmfs/android/view/ViewPager;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method private calculatePageOffsets(Lorg/dmfs/android/view/ViewPager$ItemInfo;ILorg/dmfs/android/view/ViewPager$ItemInfo;)V
    .registers 18
    .param p1, "curItem"    # Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .param p2, "curIndex"    # I
    .param p3, "oldCurInfo"    # Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .prologue
    .line 1129
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 1130
    .local v1, "N":I
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v11

    .line 1131
    .local v11, "width":I
    if-lez v11, :cond_72

    iget v12, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v12, v12

    int-to-float v13, v11

    div-float v6, v12, v13

    .line 1133
    .local v6, "marginOffset":F
    :goto_12
    if-eqz p3, :cond_37

    .line 1134
    move-object/from16 v0, p3

    iget v8, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 1136
    .local v8, "oldCurPosition":I
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-ge v8, v12, :cond_ad

    .line 1137
    const/4 v5, 0x0

    .line 1138
    .local v5, "itemIndex":I
    const/4 v3, 0x0

    .line 1139
    .local v3, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    move-object/from16 v0, p3

    iget v12, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    move-object/from16 v0, p3

    iget v13, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    add-float v7, v12, v6

    .line 1140
    .local v7, "offset":F
    add-int/lit8 v9, v8, 0x1

    .line 1141
    .local v9, "pos":I
    :goto_2b
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-gt v9, v12, :cond_37

    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 1140
    if-lt v5, v12, :cond_74

    .line 1180
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v5    # "itemIndex":I
    .end local v7    # "offset":F
    .end local v8    # "oldCurPosition":I
    .end local v9    # "pos":I
    :cond_37
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 1181
    .local v4, "itemCount":I
    iget v7, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1182
    .restart local v7    # "offset":F
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v9, v12, -0x1

    .line 1183
    .restart local v9    # "pos":I
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-nez v12, :cond_f7

    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    :goto_49
    iput v12, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    .line 1184
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v13, v1, -0x1

    if-ne v12, v13, :cond_fc

    .line 1185
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v13, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v12, v13

    .line 1184
    :goto_59
    iput v12, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    .line 1187
    add-int/lit8 v2, p2, -0x1

    .local v2, "i":I
    :goto_5d
    if-gez v2, :cond_101

    .line 1196
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v13, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    add-float v7, v12, v6

    .line 1197
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v9, v12, 0x1

    .line 1199
    add-int/lit8 v2, p2, 0x1

    :goto_6c
    if-lt v2, v4, :cond_12b

    .line 1211
    const/4 v12, 0x0

    iput-boolean v12, p0, Lorg/dmfs/android/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 1212
    return-void

    .line 1131
    .end local v2    # "i":I
    .end local v4    # "itemCount":I
    .end local v6    # "marginOffset":F
    .end local v7    # "offset":F
    .end local v9    # "pos":I
    :cond_72
    const/4 v6, 0x0

    goto :goto_12

    .line 1142
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .restart local v5    # "itemIndex":I
    .restart local v6    # "marginOffset":F
    .restart local v7    # "offset":F
    .restart local v8    # "oldCurPosition":I
    .restart local v9    # "pos":I
    :cond_74
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1143
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_7c
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-le v9, v12, :cond_8a

    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-lt v5, v12, :cond_97

    .line 1147
    :cond_8a
    :goto_8a
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-lt v9, v12, :cond_a2

    .line 1153
    iput v7, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1154
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v6

    add-float/2addr v7, v12

    .line 1141
    add-int/lit8 v9, v9, 0x1

    goto :goto_2b

    .line 1144
    :cond_97
    add-int/lit8 v5, v5, 0x1

    .line 1145
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    goto :goto_7c

    .line 1150
    :cond_a2
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12, v9}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v12

    add-float/2addr v12, v6

    add-float/2addr v7, v12

    .line 1151
    add-int/lit8 v9, v9, 0x1

    goto :goto_8a

    .line 1156
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v5    # "itemIndex":I
    .end local v7    # "offset":F
    .end local v9    # "pos":I
    :cond_ad
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-le v8, v12, :cond_37

    .line 1157
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    add-int/lit8 v5, v12, -0x1

    .line 1158
    .restart local v5    # "itemIndex":I
    const/4 v3, 0x0

    .line 1159
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    move-object/from16 v0, p3

    iget v7, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1160
    .restart local v7    # "offset":F
    add-int/lit8 v9, v8, -0x1

    .line 1161
    .restart local v9    # "pos":I
    :goto_c0
    iget v12, p1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-lt v9, v12, :cond_37

    .line 1160
    if-ltz v5, :cond_37

    .line 1162
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1163
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_ce
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-ge v9, v12, :cond_d4

    if-gtz v5, :cond_e1

    .line 1167
    :cond_d4
    :goto_d4
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-gt v9, v12, :cond_ec

    .line 1173
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v6

    sub-float/2addr v7, v12

    .line 1174
    iput v7, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1161
    add-int/lit8 v9, v9, -0x1

    goto :goto_c0

    .line 1164
    :cond_e1
    add-int/lit8 v5, v5, -0x1

    .line 1165
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    goto :goto_ce

    .line 1170
    :cond_ec
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12, v9}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v12

    add-float/2addr v12, v6

    sub-float/2addr v7, v12

    .line 1171
    add-int/lit8 v9, v9, -0x1

    goto :goto_d4

    .line 1183
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v5    # "itemIndex":I
    .end local v8    # "oldCurPosition":I
    .restart local v4    # "itemCount":I
    :cond_f7
    const v12, -0x800001

    goto/16 :goto_49

    .line 1185
    :cond_fc
    const v12, 0x7f7fffff    # Float.MAX_VALUE

    goto/16 :goto_59

    .line 1188
    .restart local v2    # "i":I
    :cond_101
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1189
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_109
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-gt v9, v12, :cond_11f

    .line 1192
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v6

    sub-float/2addr v7, v12

    .line 1193
    iput v7, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1194
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-nez v12, :cond_119

    iput v7, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    .line 1187
    :cond_119
    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_5d

    .line 1190
    :cond_11f
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v9, -0x1

    .end local v9    # "pos":I
    .local v10, "pos":I
    invoke-virtual {v12, v9}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v12

    add-float/2addr v12, v6

    sub-float/2addr v7, v12

    move v9, v10

    .end local v10    # "pos":I
    .restart local v9    # "pos":I
    goto :goto_109

    .line 1200
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_12b
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1201
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_133
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-lt v9, v12, :cond_151

    .line 1204
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v13, v1, -0x1

    if-ne v12, v13, :cond_145

    .line 1205
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v7

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v12, v13

    iput v12, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    .line 1207
    :cond_145
    iput v7, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 1208
    iget v12, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v6

    add-float/2addr v7, v12

    .line 1199
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6c

    .line 1202
    :cond_151
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v9, 0x1

    .end local v9    # "pos":I
    .restart local v10    # "pos":I
    invoke-virtual {v12, v9}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v12

    add-float/2addr v12, v6

    add-float/2addr v7, v12

    move v9, v10

    .end local v10    # "pos":I
    .restart local v9    # "pos":I
    goto :goto_133
.end method

.method private completeScroll(Z)V
    .registers 12
    .param p1, "postEvents"    # Z

    .prologue
    const/4 v7, 0x0

    .line 1743
    iget v8, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_41

    const/4 v2, 0x1

    .line 1744
    .local v2, "needPopulate":Z
    :goto_7
    if-eqz v2, :cond_2c

    .line 1746
    invoke-direct {p0, v7}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1747
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1748
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v3

    .line 1749
    .local v3, "oldX":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v4

    .line 1750
    .local v4, "oldY":I
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrX()I

    move-result v5

    .line 1751
    .local v5, "x":I
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrY()I

    move-result v6

    .line 1752
    .local v6, "y":I
    if-ne v3, v5, :cond_29

    if-eq v4, v6, :cond_2c

    .line 1753
    :cond_29
    invoke-virtual {p0, v5, v6}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 1756
    .end local v3    # "oldX":I
    .end local v4    # "oldY":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :cond_2c
    iput-boolean v7, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 1757
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2f
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v0, v8, :cond_43

    .line 1764
    if-eqz v2, :cond_40

    .line 1765
    if-eqz p1, :cond_55

    .line 1766
    iget-object v7, p0, Lorg/dmfs/android/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-static {p0, v7}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1771
    :cond_40
    :goto_40
    return-void

    .end local v0    # "i":I
    .end local v2    # "needPopulate":Z
    :cond_41
    move v2, v7

    .line 1743
    goto :goto_7

    .line 1758
    .restart local v0    # "i":I
    .restart local v2    # "needPopulate":Z
    :cond_43
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1759
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-boolean v8, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->scrolling:Z

    if-eqz v8, :cond_52

    .line 1760
    const/4 v2, 0x1

    .line 1761
    iput-boolean v7, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->scrolling:Z

    .line 1757
    :cond_52
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 1768
    .end local v1    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_55
    iget-object v7, p0, Lorg/dmfs/android/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-interface {v7}, Ljava/lang/Runnable;->run()V

    goto :goto_40
.end method

.method private determineTargetPage(IFII)I
    .registers 11
    .param p1, "currentPage"    # I
    .param p2, "pageOffset"    # F
    .param p3, "velocity"    # I
    .param p4, "deltaX"    # I

    .prologue
    .line 2158
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v5, p0, Lorg/dmfs/android/view/ViewPager;->mFlingDistance:I

    if-le v4, v5, :cond_44

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v5, p0, Lorg/dmfs/android/view/ViewPager;->mMinimumVelocity:I

    if-le v4, v5, :cond_44

    .line 2159
    if-lez p3, :cond_41

    move v2, p1

    .line 2165
    .local v2, "targetPage":I
    :goto_13
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_40

    .line 2166
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2167
    .local v0, "firstItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2170
    .local v1, "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v4, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v5, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 2173
    .end local v0    # "firstItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v1    # "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_40
    return v2

    .line 2159
    .end local v2    # "targetPage":I
    :cond_41
    add-int/lit8 v2, p1, 0x1

    goto :goto_13

    .line 2161
    :cond_44
    iget v4, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-lt p1, v4, :cond_50

    const v3, 0x3ecccccd    # 0.4f

    .line 2162
    .local v3, "truncator":F
    :goto_4b
    int-to-float v4, p1

    add-float/2addr v4, p2

    add-float/2addr v4, v3

    float-to-int v2, v4

    .restart local v2    # "targetPage":I
    goto :goto_13

    .line 2161
    .end local v2    # "targetPage":I
    .end local v3    # "truncator":F
    :cond_50
    const v3, 0x3f19999a    # 0.6f

    goto :goto_4b
.end method

.method private enableLayers(Z)V
    .registers 7
    .param p1, "enable"    # Z

    .prologue
    .line 1778
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1779
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-lt v1, v0, :cond_8

    .line 1784
    return-void

    .line 1780
    :cond_8
    if-eqz p1, :cond_16

    .line 1781
    const/4 v2, 0x2

    .line 1782
    .local v2, "layerType":I
    :goto_b
    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    .line 1779
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1781
    .end local v2    # "layerType":I
    :cond_16
    const/4 v2, 0x0

    goto :goto_b
.end method

.method private endDrag()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 2406
    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    .line 2407
    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    .line 2409
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_11

    .line 2410
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 2411
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2413
    :cond_11
    return-void
.end method

.method private getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "child"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 2587
    if-nez p1, :cond_8

    .line 2588
    new-instance p1, Landroid/graphics/Rect;

    .end local p1    # "outRect":Landroid/graphics/Rect;
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 2590
    .restart local p1    # "outRect":Landroid/graphics/Rect;
    :cond_8
    if-nez p2, :cond_e

    .line 2591
    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 2609
    :cond_d
    return-object p1

    .line 2594
    :cond_e
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v2

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 2595
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v2

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 2596
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 2597
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v2

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 2599
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 2600
    .local v1, "parent":Landroid/view/ViewParent;
    :goto_2a
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_d

    if-eq v1, p0, :cond_d

    move-object v0, v1

    .line 2601
    check-cast v0, Landroid/view/ViewGroup;

    .line 2602
    .local v0, "group":Landroid/view/ViewGroup;
    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 2603
    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 2604
    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 2605
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getBottom()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 2607
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_2a
.end method

.method private getClientWidth()I
    .registers 3

    .prologue
    .line 485
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private infoForCurrentScrollPosition()Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .registers 16

    .prologue
    const/4 v8, 0x0

    .line 2115
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v12

    .line 2116
    .local v12, "width":I
    if-lez v12, :cond_26

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v13

    int-to-float v13, v13

    int-to-float v14, v12

    div-float v11, v13, v14

    .line 2117
    .local v11, "scrollOffset":F
    :goto_f
    if-lez v12, :cond_17

    iget v13, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v13, v13

    int-to-float v14, v12

    div-float v8, v13, v14

    .line 2118
    .local v8, "marginOffset":F
    :cond_17
    const/4 v5, -0x1

    .line 2119
    .local v5, "lastPos":I
    const/4 v4, 0x0

    .line 2120
    .local v4, "lastOffset":F
    const/4 v6, 0x0

    .line 2121
    .local v6, "lastWidth":F
    const/4 v0, 0x1

    .line 2123
    .local v0, "first":Z
    const/4 v3, 0x0

    .line 2124
    .local v3, "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    iget-object v13, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lt v1, v13, :cond_28

    .line 2153
    .end local v3    # "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_25
    :goto_25
    return-object v3

    .end local v0    # "first":Z
    .end local v1    # "i":I
    .end local v4    # "lastOffset":F
    .end local v5    # "lastPos":I
    .end local v6    # "lastWidth":F
    .end local v8    # "marginOffset":F
    .end local v11    # "scrollOffset":F
    :cond_26
    move v11, v8

    .line 2116
    goto :goto_f

    .line 2125
    .restart local v0    # "first":Z
    .restart local v1    # "i":I
    .restart local v3    # "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .restart local v4    # "lastOffset":F
    .restart local v5    # "lastPos":I
    .restart local v6    # "lastWidth":F
    .restart local v8    # "marginOffset":F
    .restart local v11    # "scrollOffset":F
    :cond_28
    iget-object v13, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2127
    .local v2, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-nez v0, :cond_4f

    iget v13, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v14, v5, 0x1

    if-eq v13, v14, :cond_4f

    .line 2129
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mTempItem:Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2130
    add-float v13, v4, v6

    add-float/2addr v13, v8

    iput v13, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 2131
    add-int/lit8 v13, v5, 0x1

    iput v13, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2132
    iget-object v13, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v14, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    invoke-virtual {v13, v14}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v13

    iput v13, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2133
    add-int/lit8 v1, v1, -0x1

    .line 2135
    :cond_4f
    iget v9, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 2137
    .local v9, "offset":F
    move v7, v9

    .line 2138
    .local v7, "leftBound":F
    iget v13, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v9

    add-float v10, v13, v8

    .line 2139
    .local v10, "rightBound":F
    if-nez v0, :cond_5d

    cmpl-float v13, v11, v7

    if-ltz v13, :cond_25

    .line 2140
    :cond_5d
    cmpg-float v13, v11, v10

    if-ltz v13, :cond_6b

    iget-object v13, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ne v1, v13, :cond_6d

    :cond_6b
    move-object v3, v2

    .line 2141
    goto :goto_25

    .line 2146
    :cond_6d
    const/4 v0, 0x0

    .line 2147
    iget v5, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2148
    move v4, v9

    .line 2149
    iget v6, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2150
    move-object v3, v2

    .line 2124
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d
.end method

.method private isGutterDrag(FF)Z
    .registers 6
    .param p1, "x"    # F
    .param p2, "dx"    # F

    .prologue
    const/4 v2, 0x0

    .line 1774
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mGutterSize:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_c

    cmpl-float v0, p2, v2

    if-gtz v0, :cond_1e

    :cond_c
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v0

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mGutterSize:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1c

    cmpg-float v0, p2, v2

    if-ltz v0, :cond_1e

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x1

    goto :goto_1d
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 2391
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v2

    .line 2392
    .local v2, "pointerIndex":I
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 2393
    .local v1, "pointerId":I
    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    if-ne v1, v3, :cond_24

    .line 2396
    if-nez v2, :cond_25

    const/4 v0, 0x1

    .line 2397
    .local v0, "newPointerIndex":I
    :goto_f
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2398
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 2399
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_24

    .line 2400
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 2403
    .end local v0    # "newPointerIndex":I
    :cond_24
    return-void

    .line 2396
    :cond_25
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private pageScrolled(I)Z
    .registers 12
    .param p1, "xpos"    # I

    .prologue
    const/4 v7, 0x0

    .line 1638
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-nez v8, :cond_1b

    .line 1639
    iput-boolean v7, p0, Lorg/dmfs/android/view/ViewPager;->mCalledSuper:Z

    .line 1640
    const/4 v8, 0x0

    invoke-virtual {p0, v7, v8, v7}, Lorg/dmfs/android/view/ViewPager;->onPageScrolled(IFI)V

    .line 1641
    iget-boolean v8, p0, Lorg/dmfs/android/view/ViewPager;->mCalledSuper:Z

    if-nez v8, :cond_4f

    .line 1642
    new-instance v7, Ljava/lang/IllegalStateException;

    .line 1643
    const-string v8, "onPageScrolled did not call superclass implementation"

    .line 1642
    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1647
    :cond_1b
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->infoForCurrentScrollPosition()Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v1

    .line 1648
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v5

    .line 1649
    .local v5, "width":I
    iget v8, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    add-int v6, v5, v8

    .line 1650
    .local v6, "widthWithMargin":I
    iget v8, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v8, v8

    int-to-float v9, v5

    div-float v2, v8, v9

    .line 1651
    .local v2, "marginOffset":F
    iget v0, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 1652
    .local v0, "currentPage":I
    int-to-float v8, p1

    int-to-float v9, v5

    div-float/2addr v8, v9

    iget v9, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v8, v9

    .line 1653
    iget v9, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    .line 1652
    div-float v4, v8, v9

    .line 1654
    .local v4, "pageOffset":F
    int-to-float v8, v6

    mul-float/2addr v8, v4

    float-to-int v3, v8

    .line 1656
    .local v3, "offsetPixels":I
    iput-boolean v7, p0, Lorg/dmfs/android/view/ViewPager;->mCalledSuper:Z

    .line 1657
    invoke-virtual {p0, v0, v4, v3}, Lorg/dmfs/android/view/ViewPager;->onPageScrolled(IFI)V

    .line 1658
    iget-boolean v7, p0, Lorg/dmfs/android/view/ViewPager;->mCalledSuper:Z

    if-nez v7, :cond_4e

    .line 1659
    new-instance v7, Ljava/lang/IllegalStateException;

    .line 1660
    const-string v8, "onPageScrolled did not call superclass implementation"

    .line 1659
    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1662
    :cond_4e
    const/4 v7, 0x1

    .end local v0    # "currentPage":I
    .end local v1    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v2    # "marginOffset":F
    .end local v3    # "offsetPixels":I
    .end local v4    # "pageOffset":F
    .end local v5    # "width":I
    .end local v6    # "widthWithMargin":I
    :cond_4f
    return v7
.end method

.method private performDrag(F)Z
    .registers 19
    .param p1, "x"    # F

    .prologue
    .line 2064
    const/4 v7, 0x0

    .line 2066
    .local v7, "needsInvalidate":Z
    move-object/from16 v0, p0

    iget v14, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    sub-float v2, v14, p1

    .line 2067
    .local v2, "deltaX":F
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2069
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v14

    int-to-float v8, v14

    .line 2070
    .local v8, "oldScrollX":F
    add-float v12, v8, v2

    .line 2071
    .local v12, "scrollX":F
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v13

    .line 2073
    .local v13, "width":I
    int-to-float v14, v13

    move-object/from16 v0, p0

    iget v15, v0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    mul-float v6, v14, v15

    .line 2074
    .local v6, "leftBound":F
    int-to-float v14, v13

    move-object/from16 v0, p0

    iget v15, v0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    mul-float v11, v14, v15

    .line 2075
    .local v11, "rightBound":F
    const/4 v5, 0x1

    .line 2076
    .local v5, "leftAbsolute":Z
    const/4 v10, 0x1

    .line 2078
    .local v10, "rightAbsolute":Z
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2079
    .local v3, "firstItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2080
    .local v4, "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v14, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-eqz v14, :cond_51

    .line 2081
    const/4 v5, 0x0

    .line 2082
    iget v14, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    int-to-float v15, v13

    mul-float v6, v14, v15

    .line 2084
    :cond_51
    iget v14, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v15}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    if-eq v14, v15, :cond_65

    .line 2085
    const/4 v10, 0x0

    .line 2086
    iget v14, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    int-to-float v15, v13

    mul-float v11, v14, v15

    .line 2089
    :cond_65
    cmpg-float v14, v12, v6

    if-gez v14, :cond_9d

    .line 2090
    if-eqz v5, :cond_7e

    .line 2091
    sub-float v9, v6, v12

    .line 2092
    .local v9, "over":F
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v15

    int-to-float v0, v13

    move/from16 v16, v0

    div-float v15, v15, v16

    invoke-virtual {v14, v15}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v7

    .line 2094
    .end local v9    # "over":F
    :cond_7e
    move v12, v6

    .line 2103
    :cond_7f
    :goto_7f
    move-object/from16 v0, p0

    iget v14, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    float-to-int v15, v12

    int-to-float v15, v15

    sub-float v15, v12, v15

    add-float/2addr v14, v15

    move-object/from16 v0, p0

    iput v14, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2104
    float-to-int v14, v12

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 2105
    float-to-int v14, v12

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/dmfs/android/view/ViewPager;->pageScrolled(I)Z

    .line 2107
    return v7

    .line 2095
    :cond_9d
    cmpl-float v14, v12, v11

    if-lez v14, :cond_7f

    .line 2096
    if-eqz v10, :cond_b6

    .line 2097
    sub-float v9, v12, v11

    .line 2098
    .restart local v9    # "over":F
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v15

    int-to-float v0, v13

    move/from16 v16, v0

    div-float v15, v15, v16

    invoke-virtual {v14, v15}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v7

    .line 2100
    .end local v9    # "over":F
    :cond_b6
    move v12, v11

    goto :goto_7f
.end method

.method private recomputeScrollPosition(IIII)V
    .registers 19
    .param p1, "width"    # I
    .param p2, "oldWidth"    # I
    .param p3, "margin"    # I
    .param p4, "oldMargin"    # I

    .prologue
    .line 1475
    if-lez p2, :cond_5f

    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5f

    .line 1476
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    add-int v12, v0, p3

    .line 1477
    .local v12, "widthWithMargin":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v0

    sub-int v0, p2, v0

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    add-int v7, v0, p4

    .line 1479
    .local v7, "oldWidthWithMargin":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v13

    .line 1480
    .local v13, "xpos":I
    int-to-float v0, v13

    int-to-float v2, v7

    div-float v8, v0, v2

    .line 1481
    .local v8, "pageOffset":F
    int-to-float v0, v12

    mul-float/2addr v0, v8

    float-to-int v1, v0

    .line 1483
    .local v1, "newOffsetPixels":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 1484
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_5e

    .line 1486
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getDuration()I

    move-result v0

    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->timePassed()I

    move-result v2

    sub-int v5, v0, v2

    .line 1487
    .local v5, "newDuration":I
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForPosition(I)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v11

    .line 1488
    .local v11, "targetInfo":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    const/4 v2, 0x0

    .line 1489
    iget v3, v11, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    int-to-float v4, p1

    mul-float/2addr v3, v4

    float-to-int v3, v3

    const/4 v4, 0x0

    .line 1488
    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1501
    .end local v1    # "newOffsetPixels":I
    .end local v5    # "newDuration":I
    .end local v7    # "oldWidthWithMargin":I
    .end local v8    # "pageOffset":F
    .end local v11    # "targetInfo":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v12    # "widthWithMargin":I
    .end local v13    # "xpos":I
    :cond_5e
    :goto_5e
    return-void

    .line 1492
    :cond_5f
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForPosition(I)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v6

    .line 1493
    .local v6, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v6, :cond_8f

    iget v0, v6, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v2, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 1495
    .local v9, "scrollOffset":F
    :goto_6f
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    .line 1494
    mul-float/2addr v0, v9

    float-to-int v10, v0

    .line 1496
    .local v10, "scrollPos":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v0

    if-eq v10, v0, :cond_5e

    .line 1497
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->completeScroll(Z)V

    .line 1498
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v0

    invoke-virtual {p0, v10, v0}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    goto :goto_5e

    .line 1493
    .end local v9    # "scrollOffset":F
    .end local v10    # "scrollPos":I
    :cond_8f
    const/4 v9, 0x0

    goto :goto_6f
.end method

.method private removeNonDecorViews()V
    .registers 5

    .prologue
    .line 461
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v3

    if-lt v1, v3, :cond_8

    .line 469
    return-void

    .line 462
    :cond_8
    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 463
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 464
    .local v2, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v3, v2, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v3, :cond_1b

    .line 465
    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->removeViewAt(I)V

    .line 466
    add-int/lit8 v1, v1, -0x1

    .line 461
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private requestParentDisallowInterceptTouchEvent(Z)V
    .registers 3
    .param p1, "disallowIntercept"    # Z

    .prologue
    .line 2057
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2058
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_9

    .line 2059
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 2061
    :cond_9
    return-void
.end method

.method private scrollToItem(IZIZ)V
    .registers 13
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "velocity"    # I
    .param p4, "dispatchSelected"    # Z

    .prologue
    const/4 v7, 0x0

    .line 564
    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager;->infoForPosition(I)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 565
    .local v0, "curInfo":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    const/4 v1, 0x0

    .line 566
    .local v1, "destX":I
    if-eqz v0, :cond_1d

    .line 567
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 568
    .local v2, "width":I
    int-to-float v3, v2

    iget v4, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    .line 569
    iget v5, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v6, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 568
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    mul-float/2addr v3, v4

    float-to-int v1, v3

    .line 571
    .end local v2    # "width":I
    :cond_1d
    if-eqz p2, :cond_39

    .line 572
    invoke-virtual {p0, v1, v7, p3}, Lorg/dmfs/android/view/ViewPager;->smoothScrollTo(III)V

    .line 573
    if-eqz p4, :cond_2d

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_2d

    .line 574
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 576
    :cond_2d
    if-eqz p4, :cond_38

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_38

    .line 577
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 590
    :cond_38
    :goto_38
    return-void

    .line 580
    :cond_39
    if-eqz p4, :cond_44

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_44

    .line 581
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 583
    :cond_44
    if-eqz p4, :cond_4f

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_4f

    .line 584
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 586
    :cond_4f
    invoke-direct {p0, v7}, Lorg/dmfs/android/view/ViewPager;->completeScroll(Z)V

    .line 587
    invoke-virtual {p0, v1, v7}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 588
    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->pageScrolled(I)Z

    goto :goto_38
.end method

.method private setScrollState(I)V
    .registers 3
    .param p1, "newState"    # I

    .prologue
    .line 395
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    if-ne v0, p1, :cond_5

    .line 407
    :cond_4
    :goto_4
    return-void

    .line 399
    :cond_5
    iput p1, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    .line 400
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

    if-eqz v0, :cond_11

    .line 402
    if-eqz p1, :cond_1b

    const/4 v0, 0x1

    :goto_e
    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->enableLayers(Z)V

    .line 404
    :cond_11
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_4

    .line 405
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    goto :goto_4

    .line 402
    :cond_1b
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private setScrollingCacheEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 2416
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mScrollingCacheEnabled:Z

    if-eq v0, p1, :cond_6

    .line 2417
    iput-boolean p1, p0, Lorg/dmfs/android/view/ViewPager;->mScrollingCacheEnabled:Z

    .line 2428
    :cond_6
    return-void
.end method

.method private sortChildDrawingOrder()V
    .registers 6

    .prologue
    .line 1113
    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrder:I

    if-eqz v3, :cond_1d

    .line 1114
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    if-nez v3, :cond_1e

    .line 1115
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    .line 1119
    :goto_f
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v1

    .line 1120
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-lt v2, v1, :cond_24

    .line 1124
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    sget-object v4, Lorg/dmfs/android/view/ViewPager;->sPositionComparator:Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1126
    .end local v1    # "childCount":I
    .end local v2    # "i":I
    :cond_1d
    return-void

    .line 1117
    :cond_1e
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    goto :goto_f

    .line 1121
    .restart local v1    # "childCount":I
    .restart local v2    # "i":I
    :cond_24
    invoke-virtual {p0, v2}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1122
    .local v0, "child":Landroid/view/View;
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1120
    add-int/lit8 v2, v2, 0x1

    goto :goto_14
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 11
    .param p2, "direction"    # I
    .param p3, "focusableMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 2633
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 2635
    .local v2, "focusableCount":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getDescendantFocusability()I

    move-result v1

    .line 2637
    .local v1, "descendantFocusability":I
    const/high16 v5, 0x60000

    if-eq v1, v5, :cond_13

    .line 2638
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v5

    if-lt v3, v5, :cond_24

    .line 2654
    .end local v3    # "i":I
    :cond_13
    const/high16 v5, 0x40000

    if-ne v1, v5, :cond_1d

    .line 2656
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v2, v5, :cond_23

    .line 2659
    :cond_1d
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->isFocusable()Z

    move-result v5

    if-nez v5, :cond_40

    .line 2670
    :cond_23
    :goto_23
    return-void

    .line 2639
    .restart local v3    # "i":I
    :cond_24
    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2640
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_3d

    .line 2641
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v4

    .line 2642
    .local v4, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v4, :cond_3d

    iget v5, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_3d

    .line 2643
    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 2638
    .end local v4    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 2662
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "i":I
    :cond_40
    and-int/lit8 v5, p3, 0x1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_51

    .line 2663
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->isInTouchMode()Z

    move-result v5

    if-eqz v5, :cond_51

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->isFocusableInTouchMode()Z

    move-result v5

    if-eqz v5, :cond_23

    .line 2666
    :cond_51
    if-eqz p1, :cond_23

    .line 2667
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23
.end method

.method addNewItem(II)Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .registers 5
    .param p1, "position"    # I
    .param p2, "index"    # I

    .prologue
    .line 837
    new-instance v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$ItemInfo;-><init>()V

    .line 838
    .local v0, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iput p1, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 839
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0, p1}, Landroid/support/v4/view/PagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    .line 840
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v1

    iput v1, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    .line 841
    if-ltz p2, :cond_21

    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_27

    .line 842
    :cond_21
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 846
    :goto_26
    return-object v0

    .line 844
    :cond_27
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_26
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2680
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v3

    if-lt v1, v3, :cond_8

    .line 2689
    return-void

    .line 2681
    :cond_8
    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2682
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_21

    .line 2683
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v2

    .line 2684
    .local v2, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v2, :cond_21

    iget v3, v2, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v4, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v3, v4, :cond_21

    .line 2685
    invoke-virtual {v0, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    .line 2680
    .end local v2    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1299
    invoke-virtual {p0, p3}, Lorg/dmfs/android/view/ViewPager;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 1300
    invoke-virtual {p0, p3}, Lorg/dmfs/android/view/ViewPager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    :cond_a
    move-object v0, p3

    .line 1302
    check-cast v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1303
    .local v0, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v1, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    instance-of v2, p1, Lorg/dmfs/android/view/ViewPager$Decor;

    or-int/2addr v1, v2

    iput-boolean v1, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    .line 1304
    iget-boolean v1, p0, Lorg/dmfs/android/view/ViewPager;->mInLayout:Z

    if-eqz v1, :cond_2d

    .line 1305
    if-eqz v0, :cond_26

    iget-boolean v1, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v1, :cond_26

    .line 1306
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add pager decor view during layout"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1308
    :cond_26
    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1309
    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/view/ViewPager;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 1321
    :goto_2c
    return-void

    .line 1311
    :cond_2d
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2c
.end method

.method public arrowScroll(I)Z
    .registers 15
    .param p1, "direction"    # I

    .prologue
    const/16 v12, 0x42

    const/16 v11, 0x11

    .line 2521
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v1

    .line 2522
    .local v1, "currentFocused":Landroid/view/View;
    if-ne v1, p0, :cond_3c

    .line 2523
    const/4 v1, 0x0

    .line 2547
    :cond_b
    :goto_b
    const/4 v2, 0x0

    .line 2549
    .local v2, "handled":Z
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v8

    invoke-virtual {v8, p0, v1, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 2551
    .local v4, "nextFocused":Landroid/view/View;
    if-eqz v4, :cond_c1

    if-eq v4, v1, :cond_c1

    .line 2552
    if-ne p1, v11, :cond_9f

    .line 2555
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v8, v4}, Lorg/dmfs/android/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v8

    iget v5, v8, Landroid/graphics/Rect;->left:I

    .line 2556
    .local v5, "nextLeft":I
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v8, v1}, Lorg/dmfs/android/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v8

    iget v0, v8, Landroid/graphics/Rect;->left:I

    .line 2557
    .local v0, "currLeft":I
    if-eqz v1, :cond_9a

    if-lt v5, v0, :cond_9a

    .line 2558
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->pageLeft()Z

    move-result v2

    .line 2580
    .end local v0    # "currLeft":I
    .end local v5    # "nextLeft":I
    :cond_32
    :goto_32
    if-eqz v2, :cond_3b

    .line 2581
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v8

    invoke-virtual {p0, v8}, Lorg/dmfs/android/view/ViewPager;->playSoundEffect(I)V

    .line 2583
    :cond_3b
    return v2

    .line 2524
    .end local v2    # "handled":Z
    .end local v4    # "nextFocused":Landroid/view/View;
    :cond_3c
    if-eqz v1, :cond_b

    .line 2525
    const/4 v3, 0x0

    .line 2526
    .local v3, "isChild":Z
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    .local v6, "parent":Landroid/view/ViewParent;
    :goto_43
    instance-of v8, v6, Landroid/view/ViewGroup;

    if-nez v8, :cond_7b

    .line 2533
    :goto_47
    if-nez v3, :cond_b

    .line 2535
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 2536
    .local v7, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2537
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    :goto_5d
    instance-of v8, v6, Landroid/view/ViewGroup;

    if-nez v8, :cond_84

    .line 2541
    const-string v8, "ViewPager"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "arrowScroll tried to find focus based on non-child current focused view "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2542
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2541
    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2543
    const/4 v1, 0x0

    goto :goto_b

    .line 2528
    .end local v7    # "sb":Ljava/lang/StringBuilder;
    :cond_7b
    if-ne v6, p0, :cond_7f

    .line 2529
    const/4 v3, 0x1

    .line 2530
    goto :goto_47

    .line 2527
    :cond_7f
    invoke-interface {v6}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    goto :goto_43

    .line 2539
    .restart local v7    # "sb":Ljava/lang/StringBuilder;
    :cond_84
    const-string v8, " => "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2538
    invoke-interface {v6}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    goto :goto_5d

    .line 2560
    .end local v3    # "isChild":Z
    .end local v6    # "parent":Landroid/view/ViewParent;
    .end local v7    # "sb":Ljava/lang/StringBuilder;
    .restart local v0    # "currLeft":I
    .restart local v2    # "handled":Z
    .restart local v4    # "nextFocused":Landroid/view/View;
    .restart local v5    # "nextLeft":I
    :cond_9a
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    move-result v2

    .line 2562
    goto :goto_32

    .end local v0    # "currLeft":I
    .end local v5    # "nextLeft":I
    :cond_9f
    if-ne p1, v12, :cond_32

    .line 2565
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v8, v4}, Lorg/dmfs/android/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v8

    iget v5, v8, Landroid/graphics/Rect;->left:I

    .line 2566
    .restart local v5    # "nextLeft":I
    iget-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v8, v1}, Lorg/dmfs/android/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v8

    iget v0, v8, Landroid/graphics/Rect;->left:I

    .line 2567
    .restart local v0    # "currLeft":I
    if-eqz v1, :cond_bb

    if-gt v5, v0, :cond_bb

    .line 2568
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->pageRight()Z

    move-result v2

    .line 2569
    goto/16 :goto_32

    .line 2570
    :cond_bb
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    move-result v2

    .line 2573
    goto/16 :goto_32

    .end local v0    # "currLeft":I
    .end local v5    # "nextLeft":I
    :cond_c1
    if-eq p1, v11, :cond_c6

    const/4 v8, 0x1

    if-ne p1, v8, :cond_cc

    .line 2575
    :cond_c6
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->pageLeft()Z

    move-result v2

    .line 2576
    goto/16 :goto_32

    :cond_cc
    if-eq p1, v12, :cond_d1

    const/4 v8, 0x2

    if-ne p1, v8, :cond_32

    .line 2578
    :cond_d1
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->pageRight()Z

    move-result v2

    goto/16 :goto_32
.end method

.method public beginFakeDrag()Z
    .registers 11

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 2280
    iget-boolean v2, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v2, :cond_8

    .line 2296
    :goto_7
    return v4

    .line 2283
    :cond_8
    iput-boolean v9, p0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    .line 2284
    invoke-direct {p0, v9}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    .line 2285
    iput v5, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    iput v5, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    .line 2286
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_32

    .line 2287
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2291
    :goto_1b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .local v0, "time":J
    move-wide v2, v0

    move v6, v5

    move v7, v4

    .line 2292
    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 2293
    .local v8, "ev":Landroid/view/MotionEvent;
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v8}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2294
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    .line 2295
    iput-wide v0, p0, Lorg/dmfs/android/view/ViewPager;->mFakeDragBeginTime:J

    move v4, v9

    .line 2296
    goto :goto_7

    .line 2289
    .end local v0    # "time":J
    .end local v8    # "ev":Landroid/view/MotionEvent;
    :cond_32
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_1b
.end method

.method protected canScroll(Landroid/view/View;ZIII)Z
    .registers 17
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I

    .prologue
    .line 2458
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_17

    move-object v7, p1

    .line 2459
    check-cast v7, Landroid/view/ViewGroup;

    .line 2460
    .local v7, "group":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v9

    .line 2461
    .local v9, "scrollX":I
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v10

    .line 2462
    .local v10, "scrollY":I
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    .line 2464
    .local v6, "count":I
    add-int/lit8 v8, v6, -0x1

    .local v8, "i":I
    :goto_15
    if-gez v8, :cond_22

    .line 2477
    .end local v6    # "count":I
    .end local v7    # "group":Landroid/view/ViewGroup;
    .end local v8    # "i":I
    .end local v9    # "scrollX":I
    .end local v10    # "scrollY":I
    :cond_17
    if-eqz p2, :cond_64

    neg-int v0, p3

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_64

    const/4 v0, 0x1

    :goto_21
    return v0

    .line 2467
    .restart local v6    # "count":I
    .restart local v7    # "group":Landroid/view/ViewGroup;
    .restart local v8    # "i":I
    .restart local v9    # "scrollX":I
    .restart local v10    # "scrollY":I
    :cond_22
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2468
    .local v1, "child":Landroid/view/View;
    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v2

    if-lt v0, v2, :cond_61

    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v2

    if-ge v0, v2, :cond_61

    .line 2469
    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    if-lt v0, v2, :cond_61

    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v2

    if-ge v0, v2, :cond_61

    .line 2470
    const/4 v2, 0x1

    add-int v0, p4, v9

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int v4, v0, v3

    .line 2471
    add-int v0, p5, v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v5, v0, v3

    move-object v0, p0

    move v3, p3

    .line 2470
    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    .line 2471
    if-eqz v0, :cond_61

    .line 2472
    const/4 v0, 0x1

    goto :goto_21

    .line 2464
    :cond_61
    add-int/lit8 v8, v8, -0x1

    goto :goto_15

    .line 2477
    .end local v1    # "child":Landroid/view/View;
    .end local v6    # "count":I
    .end local v7    # "group":Landroid/view/ViewGroup;
    .end local v8    # "i":I
    .end local v9    # "scrollX":I
    .end local v10    # "scrollY":I
    :cond_64
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public canScrollHorizontally(I)Z
    .registers 8
    .param p1, "direction"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2431
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-nez v4, :cond_7

    .line 2442
    :cond_6
    :goto_6
    return v2

    .line 2435
    :cond_7
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v1

    .line 2436
    .local v1, "width":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v0

    .line 2437
    .local v0, "scrollX":I
    if-gez p1, :cond_1a

    .line 2438
    int-to-float v4, v1

    iget v5, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-le v0, v4, :cond_6

    move v2, v3

    goto :goto_6

    .line 2439
    :cond_1a
    if-lez p1, :cond_6

    .line 2440
    int-to-float v4, v1

    iget v5, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-ge v0, v4, :cond_6

    move v2, v3

    goto :goto_6
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 2759
    instance-of v0, p1, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public computeScroll()V
    .registers 6

    .prologue
    .line 1614
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->isFinished()Z

    move-result v4

    if-nez v4, :cond_3e

    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 1615
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v0

    .line 1616
    .local v0, "oldX":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v1

    .line 1617
    .local v1, "oldY":I
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    .line 1618
    .local v2, "x":I
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    .line 1620
    .local v3, "y":I
    if-ne v0, v2, :cond_28

    if-eq v1, v3, :cond_3a

    .line 1621
    :cond_28
    invoke-virtual {p0, v2, v3}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 1622
    invoke-direct {p0, v2}, Lorg/dmfs/android/view/ViewPager;->pageScrolled(I)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 1623
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1624
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 1629
    :cond_3a
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1635
    .end local v0    # "oldX":I
    .end local v1    # "oldY":I
    .end local v2    # "x":I
    .end local v3    # "y":I
    :goto_3d
    return-void

    .line 1634
    :cond_3e
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lorg/dmfs/android/view/ViewPager;->completeScroll(Z)V

    goto :goto_3d
.end method

.method dataSetChanged()V
    .registers 16

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 852
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 853
    .local v0, "adapterCount":I
    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mExpectedAdapterCount:I

    .line 854
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    iget v13, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    mul-int/lit8 v13, v13, 0x2

    add-int/lit8 v13, v13, 0x1

    if-ge v12, v13, :cond_4b

    .line 855
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 854
    if-ge v12, v0, :cond_4b

    move v7, v10

    .line 856
    .local v7, "needPopulate":Z
    :goto_21
    iget v8, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    .line 858
    .local v8, "newCurrItem":I
    const/4 v5, 0x0

    .line 859
    .local v5, "isUpdating":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_25
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v3, v12, :cond_4d

    .line 898
    if-eqz v5, :cond_34

    .line 899
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 902
    :cond_34
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    sget-object v13, Lorg/dmfs/android/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v12, v13}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 904
    if-eqz v7, :cond_4a

    .line 906
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v2

    .line 907
    .local v2, "childCount":I
    const/4 v3, 0x0

    :goto_42
    if-lt v3, v2, :cond_a2

    .line 915
    invoke-virtual {p0, v8, v11, v10}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 916
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->requestLayout()V

    .line 918
    .end local v2    # "childCount":I
    :cond_4a
    return-void

    .end local v3    # "i":I
    .end local v5    # "isUpdating":Z
    .end local v7    # "needPopulate":Z
    .end local v8    # "newCurrItem":I
    :cond_4b
    move v7, v11

    .line 854
    goto :goto_21

    .line 860
    .restart local v3    # "i":I
    .restart local v5    # "isUpdating":Z
    .restart local v7    # "needPopulate":Z
    .restart local v8    # "newCurrItem":I
    :cond_4d
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 861
    .local v4, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v13, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v12, v13}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v9

    .line 863
    .local v9, "newPos":I
    const/4 v12, -0x1

    if-ne v9, v12, :cond_63

    .line 859
    :cond_60
    :goto_60
    add-int/lit8 v3, v3, 0x1

    goto :goto_25

    .line 867
    :cond_63
    const/4 v12, -0x2

    if-ne v9, v12, :cond_93

    .line 868
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 869
    add-int/lit8 v3, v3, -0x1

    .line 871
    if-nez v5, :cond_75

    .line 872
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v12, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 873
    const/4 v5, 0x1

    .line 876
    :cond_75
    iget-object v12, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v13, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget-object v14, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v12, p0, v13, v14}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 877
    const/4 v7, 0x1

    .line 879
    iget v12, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    iget v13, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-ne v12, v13, :cond_60

    .line 881
    iget v12, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    add-int/lit8 v13, v0, -0x1

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 882
    const/4 v7, 0x1

    .line 884
    goto :goto_60

    .line 887
    :cond_93
    iget v12, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-eq v12, v9, :cond_60

    .line 888
    iget v12, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v13, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v12, v13, :cond_9e

    .line 890
    move v8, v9

    .line 893
    :cond_9e
    iput v9, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 894
    const/4 v7, 0x1

    goto :goto_60

    .line 908
    .end local v4    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v9    # "newPos":I
    .restart local v2    # "childCount":I
    :cond_a2
    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 909
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 910
    .local v6, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v12, v6, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v12, :cond_b3

    .line 911
    const/4 v12, 0x0

    iput v12, v6, Lorg/dmfs/android/view/ViewPager$LayoutParams;->widthFactor:F

    .line 907
    :cond_b3
    add-int/lit8 v3, v3, 0x1

    goto :goto_42
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2483
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x0

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x1

    goto :goto_d
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 2727
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v4

    const/16 v5, 0x1000

    if-ne v4, v5, :cond_d

    .line 2728
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v4

    .line 2744
    :goto_c
    return v4

    .line 2732
    :cond_d
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v1

    .line 2733
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    if-lt v2, v1, :cond_16

    .line 2744
    const/4 v4, 0x0

    goto :goto_c

    .line 2734
    :cond_16
    invoke-virtual {p0, v2}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2735
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_34

    .line 2736
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v3

    .line 2737
    .local v3, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v3, :cond_34

    iget v4, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v5, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v4, v5, :cond_34

    .line 2738
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 2739
    const/4 v4, 0x1

    goto :goto_c

    .line 2733
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method distanceInfluenceForSnapDuration(F)F
    .registers 6
    .param p1, "f"    # F

    .prologue
    .line 773
    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    .line 774
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 775
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x1

    .line 2178
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2179
    const/4 v1, 0x0

    .line 2181
    .local v1, "needsInvalidate":Z
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v2

    .line 2182
    .local v2, "overScrollMode":I
    if-eqz v2, :cond_19

    .line 2183
    if-ne v2, v6, :cond_a4

    .line 2184
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v5, :cond_a4

    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v5}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v5

    if-le v5, v6, :cond_a4

    .line 2185
    :cond_19
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v5

    if-nez v5, :cond_5a

    .line 2186
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 2187
    .local v3, "restoreCount":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingBottom()I

    move-result v6

    sub-int v0, v5, v6

    .line 2188
    .local v0, "height":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v4

    .line 2190
    .local v4, "width":I
    const/high16 v5, 0x43870000    # 270.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2191
    neg-int v5, v0

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    int-to-float v7, v4

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2192
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v0, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2193
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v1, v5

    .line 2194
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2196
    .end local v0    # "height":I
    .end local v3    # "restoreCount":I
    .end local v4    # "width":I
    :cond_5a
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v5

    if-nez v5, :cond_9e

    .line 2197
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 2198
    .restart local v3    # "restoreCount":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v4

    .line 2199
    .restart local v4    # "width":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingBottom()I

    move-result v6

    sub-int v0, v5, v6

    .line 2201
    .restart local v0    # "height":I
    const/high16 v5, 0x42b40000    # 90.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2202
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    const/high16 v7, 0x3f800000    # 1.0f

    add-float/2addr v6, v7

    neg-float v6, v6

    int-to-float v7, v4

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2203
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v0, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2204
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v1, v5

    .line 2205
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2212
    .end local v0    # "height":I
    .end local v3    # "restoreCount":I
    .end local v4    # "width":I
    :cond_9e
    :goto_9e
    if-eqz v1, :cond_a3

    .line 2214
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2216
    :cond_a3
    return-void

    .line 2208
    :cond_a4
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    .line 2209
    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    goto :goto_9e
.end method

.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 761
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 762
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 763
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 764
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 766
    :cond_14
    return-void
.end method

.method public endFakeDrag()V
    .registers 13

    .prologue
    const/4 v11, 0x1

    .line 2306
    iget-boolean v9, p0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    if-nez v9, :cond_d

    .line 2307
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 2310
    :cond_d
    iget-object v7, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2311
    .local v7, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v9, 0x3e8

    iget v10, p0, Lorg/dmfs/android/view/ViewPager;->mMaximumVelocity:I

    int-to-float v10, v10

    invoke-virtual {v7, v9, v10}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2313
    iget v9, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 2312
    invoke-static {v7, v9}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v9

    float-to-int v2, v9

    .line 2314
    .local v2, "initialVelocity":I
    iput-boolean v11, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 2315
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v8

    .line 2316
    .local v8, "width":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v5

    .line 2317
    .local v5, "scrollX":I
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->infoForCurrentScrollPosition()Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v1

    .line 2318
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v0, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2319
    .local v0, "currentPage":I
    int-to-float v9, v5

    int-to-float v10, v8

    div-float/2addr v9, v10

    iget v10, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v9, v10

    iget v10, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    div-float v4, v9, v10

    .line 2320
    .local v4, "pageOffset":F
    iget v9, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    iget v10, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    sub-float/2addr v9, v10

    float-to-int v6, v9

    .line 2321
    .local v6, "totalDelta":I
    invoke-direct {p0, v0, v4, v2, v6}, Lorg/dmfs/android/view/ViewPager;->determineTargetPage(IFII)I

    move-result v3

    .line 2323
    .local v3, "nextPage":I
    invoke-virtual {p0, v3, v11, v11, v2}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2324
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->endDrag()V

    .line 2326
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    .line 2327
    return-void
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x1

    .line 2495
    const/4 v0, 0x0

    .line 2496
    .local v0, "handled":Z
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_f

    .line 2497
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_3c

    .line 2517
    :cond_f
    :goto_f
    return v0

    .line 2499
    :sswitch_10
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2500
    goto :goto_f

    .line 2502
    :sswitch_17
    const/16 v1, 0x42

    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2503
    goto :goto_f

    .line 2505
    :sswitch_1e
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_f

    .line 2508
    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompat;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 2509
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/dmfs/android/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2510
    goto :goto_f

    :cond_30
    invoke-static {p1, v3}, Landroid/support/v4/view/KeyEventCompat;->hasModifiers(Landroid/view/KeyEvent;I)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 2511
    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_f

    .line 2497
    nop

    :sswitch_data_3c
    .sparse-switch
        0x15 -> :sswitch_10
        0x16 -> :sswitch_17
        0x3d -> :sswitch_1e
    .end sparse-switch
.end method

.method public fakeDragBy(F)V
    .registers 19
    .param p1, "xOffset"    # F

    .prologue
    .line 2337
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    if-nez v1, :cond_e

    .line 2338
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2341
    :cond_e
    move-object/from16 v0, p0

    iget v1, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    add-float v1, v1, p1

    move-object/from16 v0, p0

    iput v1, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2343
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v1

    int-to-float v13, v1

    .line 2344
    .local v13, "oldScrollX":F
    sub-float v15, v13, p1

    .line 2345
    .local v15, "scrollX":F
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v16

    .line 2347
    .local v16, "width":I
    move/from16 v0, v16

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget v2, v0, Lorg/dmfs/android/view/ViewPager;->mFirstOffset:F

    mul-float v12, v1, v2

    .line 2348
    .local v12, "leftBound":F
    move/from16 v0, v16

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget v2, v0, Lorg/dmfs/android/view/ViewPager;->mLastOffset:F

    mul-float v14, v1, v2

    .line 2350
    .local v14, "rightBound":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2351
    .local v10, "firstItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2352
    .local v11, "lastItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v1, v10, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-eqz v1, :cond_5f

    .line 2353
    iget v1, v10, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    move/from16 v0, v16

    int-to-float v2, v0

    mul-float v12, v1, v2

    .line 2355
    :cond_5f
    iget v1, v11, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_74

    .line 2356
    iget v1, v11, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    move/from16 v0, v16

    int-to-float v2, v0

    mul-float v14, v1, v2

    .line 2359
    :cond_74
    cmpg-float v1, v15, v12

    if-gez v1, :cond_b4

    .line 2360
    move v15, v12

    .line 2365
    :cond_79
    :goto_79
    move-object/from16 v0, p0

    iget v1, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    float-to-int v2, v15

    int-to-float v2, v2

    sub-float v2, v15, v2

    add-float/2addr v1, v2

    move-object/from16 v0, p0

    iput v1, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2366
    float-to-int v1, v15

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 2367
    float-to-int v1, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager;->pageScrolled(I)Z

    .line 2370
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 2371
    .local v3, "time":J
    move-object/from16 v0, p0

    iget-wide v1, v0, Lorg/dmfs/android/view/ViewPager;->mFakeDragBeginTime:J

    const/4 v5, 0x2

    .line 2372
    move-object/from16 v0, p0

    iget v6, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 2371
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .line 2373
    .local v9, "ev":Landroid/view/MotionEvent;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, v9}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2374
    invoke-virtual {v9}, Landroid/view/MotionEvent;->recycle()V

    .line 2375
    return-void

    .line 2361
    .end local v3    # "time":J
    .end local v9    # "ev":Landroid/view/MotionEvent;
    :cond_b4
    cmpl-float v1, v15, v14

    if-lez v1, :cond_79

    .line 2362
    move v15, v14

    goto :goto_79
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 2749
    new-instance v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    invoke-direct {v0}, Lorg/dmfs/android/view/ViewPager$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 2764
    new-instance v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/dmfs/android/view/ViewPager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 2754
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/support/v4/view/PagerAdapter;
    .registers 2

    .prologue
    .line 477
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method protected getChildDrawingOrder(II)I
    .registers 7
    .param p1, "childCount"    # I
    .param p2, "i"    # I

    .prologue
    .line 649
    iget v2, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrder:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1a

    add-int/lit8 v2, p1, -0x1

    sub-int v0, v2, p2

    .line 650
    .local v0, "index":I
    :goto_9
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    iget v1, v2, Lorg/dmfs/android/view/ViewPager$LayoutParams;->childIndex:I

    .line 651
    .local v1, "result":I
    return v1

    .end local v0    # "index":I
    .end local v1    # "result":I
    :cond_1a
    move v0, p2

    .line 649
    goto :goto_9
.end method

.method public getCurrentItem()I
    .registers 2

    .prologue
    .line 512
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .registers 2

    .prologue
    .line 674
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    return v0
.end method

.method public getPageMargin()I
    .registers 2

    .prologue
    .line 730
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    return v0
.end method

.method infoForAnyChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1344
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .local v0, "parent":Landroid/view/ViewParent;
    if-ne v0, p0, :cond_b

    .line 1350
    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v1

    :goto_a
    return-object v1

    .line 1345
    :cond_b
    if-eqz v0, :cond_11

    instance-of v1, v0, Landroid/view/View;

    if-nez v1, :cond_13

    .line 1346
    :cond_11
    const/4 v1, 0x0

    goto :goto_a

    :cond_13
    move-object p1, v0

    .line 1348
    check-cast p1, Landroid/view/View;

    goto :goto_0
.end method

.method infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .registers 6
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1333
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_b

    .line 1339
    const/4 v1, 0x0

    :cond_a
    return-object v1

    .line 1334
    :cond_b
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1335
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/view/PagerAdapter;->isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 1333
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method infoForPosition(I)Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 1354
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_b

    .line 1360
    const/4 v1, 0x0

    :cond_a
    return-object v1

    .line 1355
    :cond_b
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 1356
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v2, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-eq v2, p1, :cond_a

    .line 1354
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method initViewPager()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 361
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->setWillNotDraw(Z)V

    .line 362
    const/high16 v3, 0x40000

    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->setDescendantFocusability(I)V

    .line 363
    invoke-virtual {p0, v5}, Lorg/dmfs/android/view/ViewPager;->setFocusable(Z)V

    .line 364
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 365
    .local v1, "context":Landroid/content/Context;
    new-instance v3, Landroid/widget/Scroller;

    sget-object v4, Lorg/dmfs/android/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v3, v1, v4}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    .line 366
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 367
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v2, v3, Landroid/util/DisplayMetrics;->density:F

    .line 369
    .local v2, "density":F
    invoke-static {v0}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    .line 370
    const/high16 v3, 0x43c80000    # 400.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mMinimumVelocity:I

    .line 371
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mMaximumVelocity:I

    .line 372
    new-instance v3, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v3, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 373
    new-instance v3, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v3, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 375
    const/high16 v3, 0x41c80000    # 25.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mFlingDistance:I

    .line 376
    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mCloseEnough:I

    .line 377
    const/high16 v3, 0x41800000    # 16.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mDefaultGutterSize:I

    .line 379
    new-instance v3, Lorg/dmfs/android/view/ViewPager$MyAccessibilityDelegate;

    invoke-direct {v3, p0}, Lorg/dmfs/android/view/ViewPager$MyAccessibilityDelegate;-><init>(Lorg/dmfs/android/view/ViewPager;)V

    invoke-static {p0, v3}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 381
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v3

    if-nez v3, :cond_6b

    .line 383
    invoke-static {p0, v5}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 386
    :cond_6b
    return-void
.end method

.method public isFakeDragging()Z
    .registers 2

    .prologue
    .line 2387
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 1365
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 1366
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 1367
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 391
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 392
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 2220
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2223
    move-object/from16 v0, p0

    iget v13, v0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    if-lez v13, :cond_58

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v13, :cond_58

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_58

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v13, :cond_58

    .line 2224
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v10

    .line 2225
    .local v10, "scrollX":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v11

    .line 2227
    .local v11, "width":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v13, v13

    int-to-float v14, v11

    div-float v7, v13, v14

    .line 2228
    .local v7, "marginOffset":F
    const/4 v5, 0x0

    .line 2229
    .local v5, "itemIndex":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2230
    .local v3, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v8, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    .line 2231
    .local v8, "offset":F
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 2232
    .local v4, "itemCount":I
    iget v2, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2233
    .local v2, "firstPos":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v14, v4, -0x1

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    iget v6, v13, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2234
    .local v6, "lastPos":I
    move v9, v2

    .local v9, "pos":I
    :goto_56
    if-lt v9, v6, :cond_65

    .line 2260
    .end local v2    # "firstPos":I
    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v4    # "itemCount":I
    .end local v5    # "itemIndex":I
    .end local v6    # "lastPos":I
    .end local v7    # "marginOffset":F
    .end local v8    # "offset":F
    .end local v9    # "pos":I
    .end local v10    # "scrollX":I
    .end local v11    # "width":I
    :cond_58
    return-void

    .line 2236
    .restart local v2    # "firstPos":I
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .restart local v4    # "itemCount":I
    .restart local v5    # "itemIndex":I
    .restart local v6    # "lastPos":I
    .restart local v7    # "marginOffset":F
    .restart local v8    # "offset":F
    .restart local v9    # "pos":I
    .restart local v10    # "scrollX":I
    .restart local v11    # "width":I
    :cond_59
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 2235
    .restart local v3    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_65
    iget v13, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-le v9, v13, :cond_6b

    if-lt v5, v4, :cond_59

    .line 2240
    :cond_6b
    iget v13, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v13, :cond_c4

    .line 2241
    iget v13, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v14, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v14

    int-to-float v14, v11

    mul-float v1, v13, v14

    .line 2242
    .local v1, "drawAt":F
    iget v13, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    iget v14, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v14

    add-float v8, v13, v7

    .line 2249
    :goto_7e
    move-object/from16 v0, p0

    iget v13, v0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v13, v13

    add-float/2addr v13, v1

    int-to-float v14, v10

    cmpl-float v13, v13, v14

    if-lez v13, :cond_ba

    .line 2250
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    float-to-int v14, v1

    move-object/from16 v0, p0

    iget v15, v0, Lorg/dmfs/android/view/ViewPager;->mTopPageBounds:I

    .line 2251
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    add-float v16, v16, v1

    const/high16 v17, 0x3f000000    # 0.5f

    add-float v16, v16, v17

    move/from16 v0, v16

    float-to-int v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mBottomPageBounds:I

    move/from16 v17, v0

    .line 2250
    invoke-virtual/range {v13 .. v17}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2252
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 2255
    :cond_ba
    add-int v13, v10, v11

    int-to-float v13, v13

    cmpl-float v13, v1, v13

    if-gtz v13, :cond_58

    .line 2234
    add-int/lit8 v9, v9, 0x1

    goto :goto_56

    .line 2244
    .end local v1    # "drawAt":F
    :cond_c4
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v13, v9}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v12

    .line 2245
    .local v12, "widthFactor":F
    add-float v13, v8, v12

    int-to-float v14, v11

    mul-float v1, v13, v14

    .line 2246
    .restart local v1    # "drawAt":F
    add-float v13, v12, v7

    add-float/2addr v8, v13

    goto :goto_7e
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 16
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1794
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v6, v0, 0xff

    .line 1797
    .local v6, "action":I
    const/4 v0, 0x3

    if-eq v6, v0, :cond_c

    const/4 v0, 0x1

    if-ne v6, v0, :cond_23

    .line 1800
    :cond_c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    .line 1801
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    .line 1802
    const/4 v0, -0x1

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 1803
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_21

    .line 1804
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1805
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1807
    :cond_21
    const/4 v0, 0x0

    .line 1927
    :goto_22
    return v0

    .line 1812
    :cond_23
    if-eqz v6, :cond_31

    .line 1813
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_2b

    .line 1815
    const/4 v0, 0x1

    goto :goto_22

    .line 1817
    :cond_2b
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    if-eqz v0, :cond_31

    .line 1819
    const/4 v0, 0x0

    goto :goto_22

    .line 1823
    :cond_31
    sparse-switch v6, :sswitch_data_136

    .line 1918
    :cond_34
    :goto_34
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_3e

    .line 1919
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1921
    :cond_3e
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1927
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    goto :goto_22

    .line 1834
    :sswitch_46
    iget v7, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 1835
    .local v7, "activePointerId":I
    const/4 v0, -0x1

    if-eq v7, v0, :cond_34

    .line 1840
    invoke-static {p1, v7}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v9

    .line 1841
    .local v9, "pointerIndex":I
    invoke-static {p1, v9}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v10

    .line 1842
    .local v10, "x":F
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    sub-float v8, v10, v0

    .line 1843
    .local v8, "dx":F
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v11

    .line 1844
    .local v11, "xDiff":F
    invoke-static {p1, v9}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v12

    .line 1845
    .local v12, "y":F
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionY:F

    sub-float v0, v12, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v13

    .line 1848
    .local v13, "yDiff":F
    const/4 v0, 0x0

    cmpl-float v0, v8, v0

    if-eqz v0, :cond_89

    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    invoke-direct {p0, v0, v8}, Lorg/dmfs/android/view/ViewPager;->isGutterDrag(FF)Z

    move-result v0

    if-nez v0, :cond_89

    .line 1849
    const/4 v2, 0x0

    float-to-int v3, v8

    float-to-int v4, v10

    float-to-int v5, v12

    move-object v0, p0

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_89

    .line 1851
    iput v10, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 1852
    iput v12, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    .line 1853
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    .line 1854
    const/4 v0, 0x0

    goto :goto_22

    .line 1856
    :cond_89
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v11, v0

    if-lez v0, :cond_cb

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, v11

    cmpl-float v0, v0, v13

    if-lez v0, :cond_cb

    .line 1858
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    .line 1859
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1860
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    .line 1861
    const/4 v0, 0x0

    cmpl-float v0, v8, v0

    if-lez v0, :cond_c4

    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    :goto_ad
    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 1863
    iput v12, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    .line 1864
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1873
    :cond_b5
    :goto_b5
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_34

    .line 1875
    invoke-direct {p0, v10}, Lorg/dmfs/android/view/ViewPager;->performDrag(F)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 1876
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto/16 :goto_34

    .line 1862
    :cond_c4
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    goto :goto_ad

    .line 1865
    :cond_cb
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v13, v0

    if-lez v0, :cond_b5

    .line 1871
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    goto :goto_b5

    .line 1887
    .end local v7    # "activePointerId":I
    .end local v8    # "dx":F
    .end local v9    # "pointerIndex":I
    .end local v10    # "x":F
    .end local v11    # "xDiff":F
    .end local v12    # "y":F
    .end local v13    # "yDiff":F
    :sswitch_d6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 1888
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionY:F

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    .line 1889
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v0

    iput v0, p0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 1890
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsUnableToDrag:Z

    .line 1892
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 1893
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mScrollState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_127

    .line 1894
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mCloseEnough:I

    if-le v0, v1, :cond_127

    .line 1896
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1897
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 1898
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 1899
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    .line 1900
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1901
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    goto/16 :goto_34

    .line 1903
    :cond_127
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/android/view/ViewPager;->completeScroll(Z)V

    .line 1904
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    goto/16 :goto_34

    .line 1914
    :sswitch_130
    invoke-direct {p0, p1}, Lorg/dmfs/android/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_34

    .line 1823
    nop

    :sswitch_data_136
    .sparse-switch
        0x0 -> :sswitch_d6
        0x2 -> :sswitch_46
        0x6 -> :sswitch_130
    .end sparse-switch
.end method

.method protected onLayout(ZIIII)V
    .registers 36
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 1505
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v9

    .line 1506
    .local v9, "count":I
    sub-int v24, p4, p2

    .line 1507
    .local v24, "width":I
    sub-int v11, p5, p3

    .line 1508
    .local v11, "height":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v19

    .line 1509
    .local v19, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v21

    .line 1510
    .local v21, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v20

    .line 1511
    .local v20, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingBottom()I

    move-result v18

    .line 1512
    .local v18, "paddingBottom":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v22

    .line 1514
    .local v22, "scrollX":I
    const/4 v10, 0x0

    .line 1518
    .local v10, "decorCount":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1e
    if-lt v14, v9, :cond_63

    .line 1570
    sub-int v26, v24, v19

    sub-int v8, v26, v20

    .line 1572
    .local v8, "childWidth":I
    const/4 v14, 0x0

    :goto_25
    if-lt v14, v9, :cond_10c

    .line 1602
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mTopPageBounds:I

    .line 1603
    sub-int v26, v11, v18

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mBottomPageBounds:I

    .line 1604
    move-object/from16 v0, p0

    iput v10, v0, Lorg/dmfs/android/view/ViewPager;->mDecorChildCount:I

    .line 1606
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    move/from16 v26, v0

    if-eqz v26, :cond_5a

    .line 1607
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/dmfs/android/view/ViewPager;->scrollToItem(IZIZ)V

    .line 1609
    :cond_5a
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 1610
    return-void

    .line 1519
    .end local v8    # "childWidth":I
    :cond_63
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1520
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v26

    const/16 v27, 0x8

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_b6

    .line 1521
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1522
    .local v17, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    const/4 v6, 0x0

    .line 1523
    .local v6, "childLeft":I
    const/4 v7, 0x0

    .line 1524
    .local v7, "childTop":I
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    move/from16 v26, v0

    if-eqz v26, :cond_b6

    .line 1525
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->gravity:I

    move/from16 v26, v0

    and-int/lit8 v13, v26, 0x7

    .line 1526
    .local v13, "hgrav":I
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->gravity:I

    move/from16 v26, v0

    and-int/lit8 v23, v26, 0x70

    .line 1527
    .local v23, "vgrav":I
    packed-switch v13, :pswitch_data_192

    .line 1529
    :pswitch_98
    move/from16 v6, v19

    .line 1544
    :goto_9a
    sparse-switch v23, :sswitch_data_1a0

    .line 1546
    move/from16 v7, v21

    .line 1561
    :goto_9f
    add-int v6, v6, v22

    .line 1563
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    add-int v26, v26, v6

    .line 1564
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v27

    add-int v27, v27, v7

    .line 1562
    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v5, v6, v7, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 1565
    add-int/lit8 v10, v10, 0x1

    .line 1518
    .end local v6    # "childLeft":I
    .end local v7    # "childTop":I
    .end local v13    # "hgrav":I
    .end local v17    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v23    # "vgrav":I
    :cond_b6
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1e

    .line 1532
    .restart local v6    # "childLeft":I
    .restart local v7    # "childTop":I
    .restart local v13    # "hgrav":I
    .restart local v17    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .restart local v23    # "vgrav":I
    :pswitch_ba
    move/from16 v6, v19

    .line 1533
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    add-int v19, v19, v26

    .line 1534
    goto :goto_9a

    .line 1536
    :pswitch_c3
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    sub-int v26, v24, v26

    div-int/lit8 v26, v26, 0x2

    move/from16 v0, v26

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1538
    goto :goto_9a

    .line 1540
    :pswitch_d4
    sub-int v26, v24, v20

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v27

    sub-int v6, v26, v27

    .line 1541
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    add-int v20, v20, v26

    goto :goto_9a

    .line 1549
    :sswitch_e3
    move/from16 v7, v21

    .line 1550
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v26

    add-int v21, v21, v26

    .line 1551
    goto :goto_9f

    .line 1553
    :sswitch_ec
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v26

    sub-int v26, v11, v26

    div-int/lit8 v26, v26, 0x2

    move/from16 v0, v26

    move/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 1555
    goto :goto_9f

    .line 1557
    :sswitch_fd
    sub-int v26, v11, v18

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v27

    sub-int v7, v26, v27

    .line 1558
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v26

    add-int v18, v18, v26

    goto :goto_9f

    .line 1573
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childLeft":I
    .end local v7    # "childTop":I
    .end local v13    # "hgrav":I
    .end local v17    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v23    # "vgrav":I
    .restart local v8    # "childWidth":I
    :cond_10c
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1574
    .restart local v5    # "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v26

    const/16 v27, 0x8

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_18e

    .line 1575
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1577
    .restart local v17    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    move/from16 v26, v0

    if-nez v26, :cond_18e

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v15

    .local v15, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v15, :cond_18e

    .line 1578
    int-to-float v0, v8

    move/from16 v26, v0

    iget v0, v15, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    .line 1579
    .local v16, "loff":I
    add-int v6, v19, v16

    .line 1580
    .restart local v6    # "childLeft":I
    move/from16 v7, v21

    .line 1581
    .restart local v7    # "childTop":I
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->needsMeasure:Z

    move/from16 v26, v0

    if-eqz v26, :cond_17b

    .line 1584
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, v17

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1586
    int-to-float v0, v8

    move/from16 v26, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->widthFactor:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    .line 1587
    const/high16 v27, 0x40000000    # 2.0f

    .line 1585
    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v25

    .line 1589
    .local v25, "widthSpec":I
    sub-int v26, v11, v21

    sub-int v26, v26, v18

    .line 1590
    const/high16 v27, 0x40000000    # 2.0f

    .line 1588
    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 1591
    .local v12, "heightSpec":I
    move/from16 v0, v25

    invoke-virtual {v5, v0, v12}, Landroid/view/View;->measure(II)V

    .line 1597
    .end local v12    # "heightSpec":I
    .end local v25    # "widthSpec":I
    :cond_17b
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    add-int v26, v26, v6

    .line 1598
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v27

    add-int v27, v27, v7

    .line 1596
    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v5, v6, v7, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 1572
    .end local v6    # "childLeft":I
    .end local v7    # "childTop":I
    .end local v15    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v16    # "loff":I
    .end local v17    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    :cond_18e
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_25

    .line 1527
    :pswitch_data_192
    .packed-switch 0x1
        :pswitch_c3
        :pswitch_98
        :pswitch_ba
        :pswitch_98
        :pswitch_d4
    .end packed-switch

    .line 1544
    :sswitch_data_1a0
    .sparse-switch
        0x10 -> :sswitch_ec
        0x30 -> :sswitch_e3
        0x50 -> :sswitch_fd
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .registers 26
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1376
    const/16 v21, 0x0

    move/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lorg/dmfs/android/view/ViewPager;->getDefaultSize(II)I

    move-result v21

    .line 1377
    const/16 v22, 0x0

    move/from16 v0, v22

    move/from16 v1, p2

    invoke-static {v0, v1}, Lorg/dmfs/android/view/ViewPager;->getDefaultSize(II)I

    move-result v22

    .line 1376
    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/view/ViewPager;->setMeasuredDimension(II)V

    .line 1379
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getMeasuredWidth()I

    move-result v15

    .line 1380
    .local v15, "measuredWidth":I
    div-int/lit8 v14, v15, 0xa

    .line 1381
    .local v14, "maxGutterSize":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mDefaultGutterSize:I

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-static {v14, v0}, Ljava/lang/Math;->min(II)I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mGutterSize:I

    .line 1384
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v21

    sub-int v21, v15, v21

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v22

    sub-int v5, v21, v22

    .line 1385
    .local v5, "childWidthSize":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getMeasuredHeight()I

    move-result v21

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingTop()I

    move-result v22

    sub-int v21, v21, v22

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingBottom()I

    move-result v22

    sub-int v4, v21, v22

    .line 1392
    .local v4, "childHeightSize":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v16

    .line 1393
    .local v16, "size":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_56
    move/from16 v0, v16

    if-lt v12, v0, :cond_93

    .line 1438
    const/high16 v21, 0x40000000    # 2.0f

    move/from16 v0, v21

    invoke-static {v5, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mChildWidthMeasureSpec:I

    .line 1439
    const/high16 v21, 0x40000000    # 2.0f

    move/from16 v0, v21

    invoke-static {v4, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mChildHeightMeasureSpec:I

    .line 1442
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mInLayout:Z

    .line 1443
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 1444
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mInLayout:Z

    .line 1447
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v16

    .line 1448
    const/4 v12, 0x0

    :goto_8e
    move/from16 v0, v16

    if-lt v12, v0, :cond_151

    .line 1462
    return-void

    .line 1394
    :cond_93
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1395
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v21

    const/16 v22, 0x8

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_13b

    .line 1396
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1397
    .local v13, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    if-eqz v13, :cond_13b

    iget-boolean v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    move/from16 v21, v0

    if-eqz v21, :cond_13b

    .line 1398
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->gravity:I

    move/from16 v21, v0

    and-int/lit8 v11, v21, 0x7

    .line 1399
    .local v11, "hgrav":I
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->gravity:I

    move/from16 v21, v0

    and-int/lit8 v17, v21, 0x70

    .line 1400
    .local v17, "vgrav":I
    const/high16 v18, -0x80000000

    .line 1401
    .local v18, "widthMode":I
    const/high16 v8, -0x80000000

    .line 1402
    .local v8, "heightMode":I
    const/16 v21, 0x30

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_13f

    const/16 v21, 0x50

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_13f

    const/4 v7, 0x0

    .line 1403
    .local v7, "consumeVertical":Z
    :goto_d4
    const/16 v21, 0x3

    move/from16 v0, v21

    if-eq v11, v0, :cond_141

    const/16 v21, 0x5

    move/from16 v0, v21

    if-eq v11, v0, :cond_141

    const/4 v6, 0x0

    .line 1405
    .local v6, "consumeHorizontal":Z
    :goto_e1
    if-eqz v7, :cond_143

    .line 1406
    const/high16 v18, 0x40000000    # 2.0f

    .line 1411
    :cond_e5
    :goto_e5
    move/from16 v19, v5

    .line 1412
    .local v19, "widthSize":I
    move v9, v4

    .line 1413
    .local v9, "heightSize":I
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->width:I

    move/from16 v21, v0

    const/16 v22, -0x2

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_106

    .line 1414
    const/high16 v18, 0x40000000    # 2.0f

    .line 1415
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->width:I

    move/from16 v21, v0

    const/16 v22, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_106

    .line 1416
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->width:I

    move/from16 v19, v0

    .line 1419
    :cond_106
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->height:I

    move/from16 v21, v0

    const/16 v22, -0x2

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_122

    .line 1420
    const/high16 v8, 0x40000000    # 2.0f

    .line 1421
    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->height:I

    move/from16 v21, v0

    const/16 v22, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_122

    .line 1422
    iget v9, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->height:I

    .line 1425
    :cond_122
    move/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v20

    .line 1426
    .local v20, "widthSpec":I
    invoke-static {v9, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 1427
    .local v10, "heightSpec":I
    move/from16 v0, v20

    invoke-virtual {v3, v0, v10}, Landroid/view/View;->measure(II)V

    .line 1429
    if-eqz v7, :cond_148

    .line 1430
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v21

    sub-int v4, v4, v21

    .line 1393
    .end local v6    # "consumeHorizontal":Z
    .end local v7    # "consumeVertical":Z
    .end local v8    # "heightMode":I
    .end local v9    # "heightSize":I
    .end local v10    # "heightSpec":I
    .end local v11    # "hgrav":I
    .end local v13    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v17    # "vgrav":I
    .end local v18    # "widthMode":I
    .end local v19    # "widthSize":I
    .end local v20    # "widthSpec":I
    :cond_13b
    :goto_13b
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_56

    .line 1402
    .restart local v8    # "heightMode":I
    .restart local v11    # "hgrav":I
    .restart local v13    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .restart local v17    # "vgrav":I
    .restart local v18    # "widthMode":I
    :cond_13f
    const/4 v7, 0x1

    goto :goto_d4

    .line 1403
    .restart local v7    # "consumeVertical":Z
    :cond_141
    const/4 v6, 0x1

    goto :goto_e1

    .line 1407
    .restart local v6    # "consumeHorizontal":Z
    :cond_143
    if-eqz v6, :cond_e5

    .line 1408
    const/high16 v8, 0x40000000    # 2.0f

    goto :goto_e5

    .line 1431
    .restart local v9    # "heightSize":I
    .restart local v10    # "heightSpec":I
    .restart local v19    # "widthSize":I
    .restart local v20    # "widthSpec":I
    :cond_148
    if-eqz v6, :cond_13b

    .line 1432
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v21

    sub-int v5, v5, v21

    goto :goto_13b

    .line 1449
    .end local v3    # "child":Landroid/view/View;
    .end local v6    # "consumeHorizontal":Z
    .end local v7    # "consumeVertical":Z
    .end local v8    # "heightMode":I
    .end local v9    # "heightSize":I
    .end local v10    # "heightSpec":I
    .end local v11    # "hgrav":I
    .end local v13    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v17    # "vgrav":I
    .end local v18    # "widthMode":I
    .end local v19    # "widthSize":I
    .end local v20    # "widthSpec":I
    :cond_151
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1450
    .restart local v3    # "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v21

    const/16 v22, 0x8

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_192

    .line 1454
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1455
    .restart local v13    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    if-eqz v13, :cond_171

    iget-boolean v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    move/from16 v21, v0

    if-nez v21, :cond_192

    .line 1457
    :cond_171
    int-to-float v0, v5

    move/from16 v21, v0

    iget v0, v13, Lorg/dmfs/android/view/ViewPager$LayoutParams;->widthFactor:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    const/high16 v22, 0x40000000    # 2.0f

    .line 1456
    invoke-static/range {v21 .. v22}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v20

    .line 1458
    .restart local v20    # "widthSpec":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mChildHeightMeasureSpec:I

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/view/View;->measure(II)V

    .line 1448
    .end local v13    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v20    # "widthSpec":I
    :cond_192
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_8e
.end method

.method protected onPageScrolled(IFI)V
    .registers 21
    .param p1, "position"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPixels"    # I

    .prologue
    .line 1679
    move-object/from16 v0, p0

    iget v15, v0, Lorg/dmfs/android/view/ViewPager;->mDecorChildCount:I

    if-lez v15, :cond_1d

    .line 1680
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v12

    .line 1681
    .local v12, "scrollX":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v10

    .line 1682
    .local v10, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v11

    .line 1683
    .local v11, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v14

    .line 1684
    .local v14, "width":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v4

    .line 1685
    .local v4, "childCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1b
    if-lt v8, v4, :cond_5a

    .line 1718
    .end local v4    # "childCount":I
    .end local v8    # "i":I
    .end local v10    # "paddingLeft":I
    .end local v11    # "paddingRight":I
    .end local v12    # "scrollX":I
    .end local v14    # "width":I
    :cond_1d
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v15, :cond_30

    .line 1719
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-interface {v15, v0, v1, v2}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1721
    :cond_30
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v15, :cond_43

    .line 1722
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-interface {v15, v0, v1, v2}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1725
    :cond_43
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

    if-eqz v15, :cond_54

    .line 1726
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v12

    .line 1727
    .restart local v12    # "scrollX":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v4

    .line 1728
    .restart local v4    # "childCount":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_52
    if-lt v8, v4, :cond_a5

    .line 1739
    .end local v4    # "childCount":I
    .end local v8    # "i":I
    .end local v12    # "scrollX":I
    :cond_54
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lorg/dmfs/android/view/ViewPager;->mCalledSuper:Z

    .line 1740
    return-void

    .line 1686
    .restart local v4    # "childCount":I
    .restart local v8    # "i":I
    .restart local v10    # "paddingLeft":I
    .restart local v11    # "paddingRight":I
    .restart local v12    # "scrollX":I
    .restart local v14    # "width":I
    :cond_5a
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1687
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1688
    .local v9, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v15, v9, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v15, :cond_6d

    .line 1685
    :cond_6a
    :goto_6a
    add-int/lit8 v8, v8, 0x1

    goto :goto_1b

    .line 1690
    :cond_6d
    iget v15, v9, Lorg/dmfs/android/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v7, v15, 0x7

    .line 1691
    .local v7, "hgrav":I
    const/4 v5, 0x0

    .line 1692
    .local v5, "childLeft":I
    packed-switch v7, :pswitch_data_d2

    .line 1694
    :pswitch_75
    move v5, v10

    .line 1709
    :goto_76
    add-int/2addr v5, v12

    .line 1711
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v15

    sub-int v6, v5, v15

    .line 1712
    .local v6, "childOffset":I
    if-eqz v6, :cond_6a

    .line 1713
    invoke-virtual {v3, v6}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_6a

    .line 1697
    .end local v6    # "childOffset":I
    :pswitch_83
    move v5, v10

    .line 1698
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v15

    add-int/2addr v10, v15

    .line 1699
    goto :goto_76

    .line 1701
    :pswitch_8a
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    sub-int v15, v14, v15

    div-int/lit8 v15, v15, 0x2

    invoke-static {v15, v10}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1703
    goto :goto_76

    .line 1705
    :pswitch_97
    sub-int v15, v14, v11

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    sub-int v5, v15, v16

    .line 1706
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v11, v15

    goto :goto_76

    .line 1729
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "childLeft":I
    .end local v7    # "hgrav":I
    .end local v9    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .end local v10    # "paddingLeft":I
    .end local v11    # "paddingRight":I
    .end local v14    # "width":I
    :cond_a5
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1730
    .restart local v3    # "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1732
    .restart local v9    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v15, v9, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v15, :cond_b8

    .line 1728
    :goto_b5
    add-int/lit8 v8, v8, 0x1

    goto :goto_52

    .line 1734
    :cond_b8
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v15

    sub-int/2addr v15, v12

    int-to-float v15, v15

    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    div-float v13, v15, v16

    .line 1735
    .local v13, "transformPos":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/view/ViewPager;->mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

    invoke-interface {v15, v3, v13}, Lorg/dmfs/android/view/ViewPager$PageTransformer;->transformPage(Landroid/view/View;F)V

    goto :goto_b5

    .line 1692
    nop

    :pswitch_data_d2
    .packed-switch 0x1
        :pswitch_8a
        :pswitch_75
        :pswitch_83
        :pswitch_75
        :pswitch_97
    .end packed-switch
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .registers 12
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 2700
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v1

    .line 2701
    .local v1, "count":I
    and-int/lit8 v7, p1, 0x2

    if-eqz v7, :cond_10

    .line 2702
    const/4 v6, 0x0

    .line 2703
    .local v6, "index":I
    const/4 v5, 0x1

    .line 2704
    .local v5, "increment":I
    move v2, v1

    .line 2710
    .local v2, "end":I
    :goto_b
    move v3, v6

    .local v3, "i":I
    :goto_c
    if-ne v3, v2, :cond_15

    .line 2721
    const/4 v7, 0x0

    :goto_f
    return v7

    .line 2706
    .end local v2    # "end":I
    .end local v3    # "i":I
    .end local v5    # "increment":I
    .end local v6    # "index":I
    :cond_10
    add-int/lit8 v6, v1, -0x1

    .line 2707
    .restart local v6    # "index":I
    const/4 v5, -0x1

    .line 2708
    .restart local v5    # "increment":I
    const/4 v2, -0x1

    .restart local v2    # "end":I
    goto :goto_b

    .line 2711
    .restart local v3    # "i":I
    :cond_15
    invoke-virtual {p0, v3}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2712
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_33

    .line 2713
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v4

    .line 2714
    .local v4, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v4, :cond_33

    iget v7, v4, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget v8, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v7, v8, :cond_33

    .line 2715
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 2716
    const/4 v7, 0x1

    goto :goto_f

    .line 2710
    .end local v4    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_33
    add-int/2addr v3, v5

    goto :goto_c
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1279
    instance-of v1, p1, Lorg/dmfs/android/view/ViewPager$SavedState;

    if-nez v1, :cond_8

    .line 1280
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1295
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 1284
    check-cast v0, Lorg/dmfs/android/view/ViewPager$SavedState;

    .line 1285
    .local v0, "ss":Lorg/dmfs/android/view/ViewPager$SavedState;
    invoke-virtual {v0}, Lorg/dmfs/android/view/ViewPager$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1287
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_27

    .line 1288
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iget-object v3, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 1289
    iget v1, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->position:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_7

    .line 1291
    :cond_27
    iget v1, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->position:I

    iput v1, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    .line 1292
    iget-object v1, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 1293
    iget-object v1, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    iput-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    goto :goto_7
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 1268
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 1269
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lorg/dmfs/android/view/ViewPager$SavedState;

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1270
    .local v0, "ss":Lorg/dmfs/android/view/ViewPager$SavedState;
    iget v2, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    iput v2, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->position:I

    .line 1271
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_19

    .line 1272
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->saveState()Landroid/os/Parcelable;

    move-result-object v2

    iput-object v2, v0, Lorg/dmfs/android/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    .line 1274
    :cond_19
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 1466
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1469
    if-eq p1, p3, :cond_c

    .line 1470
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    invoke-direct {p0, p1, p3, v0, v1}, Lorg/dmfs/android/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 1472
    :cond_c
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 30
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1932
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mFakeDragging:Z

    move/from16 v24, v0

    if-eqz v24, :cond_b

    .line 1936
    const/16 v24, 0x1

    .line 2053
    :goto_a
    return v24

    .line 1939
    :cond_b
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v24

    if-nez v24, :cond_1a

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v24

    if-eqz v24, :cond_1a

    .line 1942
    const/16 v24, 0x0

    goto :goto_a

    .line 1945
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v24, v0

    if-eqz v24, :cond_2e

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v24

    if-nez v24, :cond_31

    .line 1947
    :cond_2e
    const/16 v24, 0x0

    goto :goto_a

    .line 1950
    :cond_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v24, v0

    if-nez v24, :cond_43

    .line 1951
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1953
    :cond_43
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1955
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    .line 1956
    .local v5, "action":I
    const/4 v11, 0x0

    .line 1958
    .local v11, "needsInvalidate":Z
    and-int/lit16 v0, v5, 0xff

    move/from16 v24, v0

    packed-switch v24, :pswitch_data_2ce

    .line 2050
    :cond_5c
    :goto_5c
    :pswitch_5c
    if-eqz v11, :cond_61

    .line 2051
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2053
    :cond_61
    const/16 v24, 0x1

    goto :goto_a

    .line 1960
    :pswitch_64
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1961
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 1962
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 1965
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 1966
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mInitialMotionY:F

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    .line 1967
    const/16 v24, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    goto :goto_5c

    .line 1971
    :pswitch_a9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    move/from16 v24, v0

    if-nez v24, :cond_153

    .line 1972
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v15

    .line 1973
    .local v15, "pointerIndex":I
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v20

    .line 1974
    .local v20, "x":F
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    move/from16 v24, v0

    sub-float v24, v20, v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Math;->abs(F)F

    move-result v21

    .line 1975
    .local v21, "xDiff":F
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v22

    .line 1976
    .local v22, "y":F
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    move/from16 v24, v0

    sub-float v24, v22, v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Math;->abs(F)F

    move-result v23

    .line 1978
    .local v23, "yDiff":F
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    cmpl-float v24, v21, v24

    if-lez v24, :cond_153

    cmpl-float v24, v21, v23

    if-lez v24, :cond_153

    .line 1980
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    .line 1981
    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1982
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    move/from16 v24, v0

    sub-float v24, v20, v24

    const/16 v25, 0x0

    cmpl-float v24, v24, v25

    if-lez v24, :cond_17b

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v24, v24, v25

    :goto_128
    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 1984
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionY:F

    .line 1985
    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    .line 1986
    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1989
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v14

    .line 1990
    .local v14, "parent":Landroid/view/ViewParent;
    if-eqz v14, :cond_153

    .line 1991
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-interface {v14, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1996
    .end local v14    # "parent":Landroid/view/ViewParent;
    .end local v15    # "pointerIndex":I
    .end local v20    # "x":F
    .end local v21    # "xDiff":F
    .end local v22    # "y":F
    .end local v23    # "yDiff":F
    :cond_153
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    move/from16 v24, v0

    if-eqz v24, :cond_5c

    .line 1999
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    move/from16 v24, v0

    .line 1998
    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v6

    .line 2000
    .local v6, "activePointerIndex":I
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v20

    .line 2001
    .restart local v20    # "x":F
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/dmfs/android/view/ViewPager;->performDrag(F)Z

    move-result v24

    or-int v11, v11, v24

    .line 2003
    goto/16 :goto_5c

    .line 1983
    .end local v6    # "activePointerIndex":I
    .restart local v15    # "pointerIndex":I
    .restart local v21    # "xDiff":F
    .restart local v22    # "y":F
    .restart local v23    # "yDiff":F
    :cond_17b
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mTouchSlop:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    sub-float v24, v24, v25

    goto :goto_128

    .line 2005
    .end local v15    # "pointerIndex":I
    .end local v20    # "x":F
    .end local v21    # "xDiff":F
    .end local v22    # "y":F
    .end local v23    # "yDiff":F
    :pswitch_18f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    move/from16 v24, v0

    if-eqz v24, :cond_5c

    .line 2006
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v18, v0

    .line 2007
    .local v18, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v24, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mMaximumVelocity:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2009
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    move/from16 v24, v0

    .line 2008
    move-object/from16 v0, v18

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v24

    move/from16 v0, v24

    float-to-int v10, v0

    .line 2010
    .local v10, "initialVelocity":I
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 2011
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v19

    .line 2012
    .local v19, "width":I
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v16

    .line 2013
    .local v16, "scrollX":I
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->infoForCurrentScrollPosition()Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v8

    .line 2014
    .local v8, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget v7, v8, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    .line 2015
    .local v7, "currentPage":I
    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v24, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v25, v0

    div-float v24, v24, v25

    iget v0, v8, Lorg/dmfs/android/view/ViewPager$ItemInfo;->offset:F

    move/from16 v25, v0

    sub-float v24, v24, v25

    iget v0, v8, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v25, v0

    div-float v13, v24, v25

    .line 2017
    .local v13, "pageOffset":F
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v6

    .line 2018
    .restart local v6    # "activePointerIndex":I
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v20

    .line 2019
    .restart local v20    # "x":F
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mInitialMotionX:F

    move/from16 v24, v0

    sub-float v24, v20, v24

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v17, v0

    .line 2020
    .local v17, "totalDelta":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v7, v13, v10, v1}, Lorg/dmfs/android/view/ViewPager;->determineTargetPage(IFII)I

    move-result v12

    .line 2022
    .local v12, "nextPage":I
    const/16 v24, 0x1

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v12, v1, v2, v10}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2024
    const/16 v24, -0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 2025
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->endDrag()V

    .line 2026
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v25

    or-int v11, v24, v25

    .line 2028
    goto/16 :goto_5c

    .line 2030
    .end local v6    # "activePointerIndex":I
    .end local v7    # "currentPage":I
    .end local v8    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v10    # "initialVelocity":I
    .end local v12    # "nextPage":I
    .end local v13    # "pageOffset":F
    .end local v16    # "scrollX":I
    .end local v17    # "totalDelta":I
    .end local v18    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v19    # "width":I
    .end local v20    # "x":F
    :pswitch_24b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mIsBeingDragged:Z

    move/from16 v24, v0

    if-eqz v24, :cond_5c

    .line 2031
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v24, v0

    const/16 v25, 0x1

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/dmfs/android/view/ViewPager;->scrollToItem(IZIZ)V

    .line 2032
    const/16 v24, -0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    .line 2033
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->endDrag()V

    .line 2034
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v25

    or-int v11, v24, v25

    .line 2036
    goto/16 :goto_5c

    .line 2038
    :pswitch_28f
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v9

    .line 2039
    .local v9, "index":I
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v20

    .line 2040
    .restart local v20    # "x":F
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    .line 2041
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    goto/16 :goto_5c

    .line 2045
    .end local v9    # "index":I
    .end local v20    # "x":F
    :pswitch_2ad
    invoke-direct/range {p0 .. p1}, Lorg/dmfs/android/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 2047
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mActivePointerId:I

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v24

    .line 2046
    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mLastMotionX:F

    goto/16 :goto_5c

    .line 1958
    :pswitch_data_2ce
    .packed-switch 0x0
        :pswitch_64
        :pswitch_18f
        :pswitch_a9
        :pswitch_24b
        :pswitch_5c
        :pswitch_28f
        :pswitch_2ad
    .end packed-switch
.end method

.method pageLeft()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 2613
    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-lez v1, :cond_d

    .line 2614
    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/android/view/ViewPager;->setCurrentItem(IZ)V

    .line 2617
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method pageRight()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 2621
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_19

    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_19

    .line 2622
    iget v1, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/android/view/ViewPager;->setCurrentItem(IZ)V

    .line 2625
    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method populate()V
    .registers 2

    .prologue
    .line 921
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->populate(I)V

    .line 922
    return-void
.end method

.method populate(I)V
    .registers 32
    .param p1, "newCurrentItem"    # I

    .prologue
    .line 925
    const/16 v21, 0x0

    .line 926
    .local v21, "oldCurInfo":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    const/4 v15, 0x2

    .line 927
    .local v15, "focusDirection":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, p1

    if-eq v0, v1, :cond_31

    .line 928
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, p1

    if-ge v0, v1, :cond_3d

    const/16 v15, 0x42

    .line 929
    :goto_1d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->infoForPosition(I)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v21

    .line 930
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    .line 933
    :cond_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    if-nez v27, :cond_40

    .line 934
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->sortChildDrawingOrder()V

    .line 1110
    :cond_3c
    :goto_3c
    return-void

    .line 928
    :cond_3d
    const/16 v15, 0x11

    goto :goto_1d

    .line 942
    :cond_40
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    move/from16 v27, v0

    if-eqz v27, :cond_4c

    .line 944
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->sortChildDrawingOrder()V

    goto :goto_3c

    .line 951
    :cond_4c
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getWindowToken()Landroid/os/IBinder;

    move-result-object v27

    if-eqz v27, :cond_3c

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 957
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    move/from16 v22, v0

    .line 958
    .local v22, "pageLimit":I
    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    sub-int v28, v28, v22

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->max(II)I

    move-result v26

    .line 959
    .local v26, "startPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    .line 960
    .local v4, "N":I
    add-int/lit8 v27, v4, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    add-int v28, v28, v22

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 962
    .local v12, "endPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mExpectedAdapterCount:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-eq v4, v0, :cond_102

    .line 965
    :try_start_95
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getId()I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;
    :try_end_a0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_95 .. :try_end_a0} :catch_f8

    move-result-object v24

    .line 969
    .local v24, "resName":Ljava/lang/String;
    :goto_a1
    new-instance v27, Ljava/lang/IllegalStateException;

    new-instance v28, Ljava/lang/StringBuilder;

    const-string v29, "The application\'s PagerAdapter changed the adapter\'s contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: "

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 971
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mExpectedAdapterCount:I

    move/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, ", found: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    .line 972
    const-string v29, " Pager id: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    .line 973
    const-string v29, " Pager class: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    .line 974
    const-string v29, " Problematic adapter: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 969
    invoke-direct/range {v27 .. v28}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 966
    .end local v24    # "resName":Ljava/lang/String;
    :catch_f8
    move-exception v11

    .line 967
    .local v11, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getId()I

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v24

    .restart local v24    # "resName":Ljava/lang/String;
    goto :goto_a1

    .line 978
    .end local v11    # "e":Landroid/content/res/Resources$NotFoundException;
    .end local v24    # "resName":Ljava/lang/String;
    :cond_102
    const/4 v8, -0x1

    .line 979
    .local v8, "curIndex":I
    const/4 v9, 0x0

    .line 980
    .local v9, "curItem":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    const/4 v8, 0x0

    :goto_105
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v27

    move/from16 v0, v27

    if-lt v8, v0, :cond_227

    .line 988
    :cond_113
    :goto_113
    if-nez v9, :cond_125

    if-lez v4, :cond_125

    .line 989
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1, v8}, Lorg/dmfs/android/view/ViewPager;->addNewItem(II)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v9

    .line 995
    :cond_125
    if-eqz v9, :cond_193

    .line 996
    const/4 v13, 0x0

    .line 997
    .local v13, "extraWidthLeft":F
    add-int/lit8 v18, v8, -0x1

    .line 998
    .local v18, "itemIndex":I
    if-ltz v18, :cond_261

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 999
    .local v17, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_13e
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v7

    .line 1000
    .local v7, "clientWidth":I
    if-gtz v7, :cond_265

    const/16 v19, 0x0

    .line 1002
    .local v19, "leftWidthNeeded":F
    :goto_146
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    add-int/lit8 v23, v27, -0x1

    .local v23, "pos":I
    :goto_14e
    if-gez v23, :cond_27f

    .line 1030
    :cond_150
    iget v14, v9, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    .line 1031
    .local v14, "extraWidthRight":F
    add-int/lit8 v18, v8, 0x1

    .line 1032
    const/high16 v27, 0x40000000    # 2.0f

    cmpg-float v27, v14, v27

    if-gez v27, :cond_18c

    .line 1033
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v27

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_340

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 1034
    :goto_17c
    if-gtz v7, :cond_344

    const/16 v25, 0x0

    .line 1036
    .local v25, "rightWidthNeeded":F
    :goto_180
    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v27, v0

    add-int/lit8 v23, v27, 0x1

    :goto_188
    move/from16 v0, v23

    if-lt v0, v4, :cond_358

    .line 1063
    .end local v25    # "rightWidthNeeded":F
    :cond_18c
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v9, v8, v1}, Lorg/dmfs/android/view/ViewPager;->calculatePageOffsets(Lorg/dmfs/android/view/ViewPager$ItemInfo;ILorg/dmfs/android/view/ViewPager$ItemInfo;)V

    .line 1073
    .end local v7    # "clientWidth":I
    .end local v13    # "extraWidthLeft":F
    .end local v14    # "extraWidthRight":F
    .end local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v18    # "itemIndex":I
    .end local v19    # "leftWidthNeeded":F
    .end local v23    # "pos":I
    :cond_193
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v29, v0

    if-eqz v9, :cond_43b

    iget-object v0, v9, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    move-object/from16 v27, v0

    :goto_1a5
    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move/from16 v2, v29

    move-object/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1075
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 1079
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v6

    .line 1080
    .local v6, "childCount":I
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_1c3
    move/from16 v0, v16

    if-lt v0, v6, :cond_43f

    .line 1093
    invoke-direct/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->sortChildDrawingOrder()V

    .line 1095
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->hasFocus()Z

    move-result v27

    if-eqz v27, :cond_3c

    .line 1096
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v10

    .line 1097
    .local v10, "currentFocused":Landroid/view/View;
    if-eqz v10, :cond_48b

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/dmfs/android/view/ViewPager;->infoForAnyChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v17

    .line 1098
    .restart local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :goto_1dc
    if-eqz v17, :cond_1f0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-eq v0, v1, :cond_3c

    .line 1099
    :cond_1f0
    const/16 v16, 0x0

    :goto_1f2
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v27

    move/from16 v0, v16

    move/from16 v1, v27

    if-ge v0, v1, :cond_3c

    .line 1100
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1101
    .local v5, "child":Landroid/view/View;
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v17

    .line 1102
    if-eqz v17, :cond_224

    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_224

    .line 1103
    invoke-virtual {v5, v15}, Landroid/view/View;->requestFocus(I)Z

    move-result v27

    if-nez v27, :cond_3c

    .line 1099
    :cond_224
    add-int/lit8 v16, v16, 0x1

    goto :goto_1f2

    .line 981
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childCount":I
    .end local v10    # "currentFocused":Landroid/view/View;
    .end local v16    # "i":I
    .end local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_227
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 982
    .restart local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-lt v0, v1, :cond_25d

    .line 983
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_113

    move-object/from16 v9, v17

    .line 984
    goto/16 :goto_113

    .line 980
    :cond_25d
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_105

    .line 998
    .end local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .restart local v13    # "extraWidthLeft":F
    .restart local v18    # "itemIndex":I
    :cond_261
    const/16 v17, 0x0

    goto/16 :goto_13e

    .line 1001
    .restart local v7    # "clientWidth":I
    .restart local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_265
    const/high16 v27, 0x40000000    # 2.0f

    iget v0, v9, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v28, v0

    sub-float v27, v27, v28

    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingLeft()I

    move-result v28

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    int-to-float v0, v7

    move/from16 v29, v0

    div-float v28, v28, v29

    add-float v19, v27, v28

    goto/16 :goto_146

    .line 1003
    .restart local v19    # "leftWidthNeeded":F
    .restart local v23    # "pos":I
    :cond_27f
    cmpl-float v27, v13, v19

    if-ltz v27, :cond_2e2

    move/from16 v0, v23

    move/from16 v1, v26

    if-ge v0, v1, :cond_2e2

    .line 1004
    if-eqz v17, :cond_150

    .line 1007
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move/from16 v0, v23

    move/from16 v1, v27

    if-ne v0, v1, :cond_2db

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->scrolling:Z

    move/from16 v27, v0

    if-nez v27, :cond_2db

    .line 1008
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1009
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move/from16 v2, v23

    move-object/from16 v3, v28

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1014
    add-int/lit8 v18, v18, -0x1

    .line 1015
    add-int/lit8 v8, v8, -0x1

    .line 1016
    if-ltz v18, :cond_2df

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 1002
    :cond_2db
    :goto_2db
    add-int/lit8 v23, v23, -0x1

    goto/16 :goto_14e

    .line 1016
    :cond_2df
    const/16 v17, 0x0

    goto :goto_2db

    .line 1018
    :cond_2e2
    if-eqz v17, :cond_312

    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move/from16 v0, v23

    move/from16 v1, v27

    if-ne v0, v1, :cond_312

    .line 1019
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v27, v0

    add-float v13, v13, v27

    .line 1020
    add-int/lit8 v18, v18, -0x1

    .line 1021
    if-ltz v18, :cond_30f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 1022
    :goto_30e
    goto :goto_2db

    .line 1021
    :cond_30f
    const/16 v17, 0x0

    goto :goto_30e

    .line 1023
    :cond_312
    add-int/lit8 v27, v18, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/view/ViewPager;->addNewItem(II)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v17

    .line 1024
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v27, v0

    add-float v13, v13, v27

    .line 1025
    add-int/lit8 v8, v8, 0x1

    .line 1026
    if-ltz v18, :cond_33d

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    :goto_33c
    goto :goto_2db

    :cond_33d
    const/16 v17, 0x0

    goto :goto_33c

    .line 1033
    .restart local v14    # "extraWidthRight":F
    :cond_340
    const/16 v17, 0x0

    goto/16 :goto_17c

    .line 1035
    :cond_344
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/android/view/ViewPager;->getPaddingRight()I

    move-result v27

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    int-to-float v0, v7

    move/from16 v28, v0

    div-float v27, v27, v28

    const/high16 v28, 0x40000000    # 2.0f

    add-float v25, v27, v28

    goto/16 :goto_180

    .line 1037
    .restart local v25    # "rightWidthNeeded":F
    :cond_358
    cmpl-float v27, v14, v25

    if-ltz v27, :cond_3c3

    move/from16 v0, v23

    if-le v0, v12, :cond_3c3

    .line 1038
    if-eqz v17, :cond_18c

    .line 1041
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move/from16 v0, v23

    move/from16 v1, v27

    if-ne v0, v1, :cond_3bc

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->scrolling:Z

    move/from16 v27, v0

    if-nez v27, :cond_3bc

    .line 1042
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1043
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move-object/from16 v27, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move/from16 v2, v23

    move-object/from16 v3, v28

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1048
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v27

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_3c0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 1036
    :cond_3bc
    :goto_3bc
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_188

    .line 1048
    :cond_3c0
    const/16 v17, 0x0

    goto :goto_3bc

    .line 1050
    :cond_3c3
    if-eqz v17, :cond_401

    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move/from16 v0, v23

    move/from16 v1, v27

    if-ne v0, v1, :cond_401

    .line 1051
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v27, v0

    add-float v14, v14, v27

    .line 1052
    add-int/lit8 v18, v18, 0x1

    .line 1053
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v27

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_3fe

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    .line 1054
    :goto_3fd
    goto :goto_3bc

    .line 1053
    :cond_3fe
    const/16 v17, 0x0

    goto :goto_3fd

    .line 1055
    :cond_401
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/view/ViewPager;->addNewItem(II)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v17

    .line 1056
    add-int/lit8 v18, v18, 0x1

    .line 1057
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v27, v0

    add-float v14, v14, v27

    .line 1058
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v27

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_438

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-object/from16 v17, v27

    :goto_437
    goto :goto_3bc

    :cond_438
    const/16 v17, 0x0

    goto :goto_437

    .line 1073
    .end local v7    # "clientWidth":I
    .end local v13    # "extraWidthLeft":F
    .end local v14    # "extraWidthRight":F
    .end local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .end local v18    # "itemIndex":I
    .end local v19    # "leftWidthNeeded":F
    .end local v23    # "pos":I
    .end local v25    # "rightWidthNeeded":F
    :cond_43b
    const/16 v27, 0x0

    goto/16 :goto_1a5

    .line 1081
    .restart local v6    # "childCount":I
    .restart local v16    # "i":I
    :cond_43f
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1082
    .restart local v5    # "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 1083
    .local v20, "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    move/from16 v0, v16

    move-object/from16 v1, v20

    iput v0, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->childIndex:I

    .line 1084
    move-object/from16 v0, v20

    iget-boolean v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    move/from16 v27, v0

    if-nez v27, :cond_487

    move-object/from16 v0, v20

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->widthFactor:F

    move/from16 v27, v0

    const/16 v28, 0x0

    cmpl-float v27, v27, v28

    if-nez v27, :cond_487

    .line 1086
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/dmfs/android/view/ViewPager;->infoForChild(Landroid/view/View;)Lorg/dmfs/android/view/ViewPager$ItemInfo;

    move-result-object v17

    .line 1087
    .restart local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    if-eqz v17, :cond_487

    .line 1088
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->widthFactor:F

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v20

    iput v0, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->widthFactor:F

    .line 1089
    move-object/from16 v0, v17

    iget v0, v0, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v20

    iput v0, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->position:I

    .line 1080
    .end local v17    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    :cond_487
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_1c3

    .line 1097
    .end local v5    # "child":Landroid/view/View;
    .end local v20    # "lp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    .restart local v10    # "currentFocused":Landroid/view/View;
    :cond_48b
    const/16 v17, 0x0

    goto/16 :goto_1dc
.end method

.method public removeView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1325
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mInLayout:Z

    if-eqz v0, :cond_8

    .line 1326
    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager;->removeViewInLayout(Landroid/view/View;)V

    .line 1330
    :goto_7
    return-void

    .line 1328
    :cond_8
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_7
.end method

.method public setAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .registers 12
    .param p1, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 415
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v4, :cond_2e

    .line 416
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mObserver:Lorg/dmfs/android/view/ViewPager$PagerObserver;

    invoke-virtual {v4, v5}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 417
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 418
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v0, v4, :cond_7d

    .line 422
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 423
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 424
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->removeNonDecorViews()V

    .line 425
    iput v7, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    .line 426
    invoke-virtual {p0, v7, v7}, Lorg/dmfs/android/view/ViewPager;->scrollTo(II)V

    .line 429
    .end local v0    # "i":I
    :cond_2e
    iget-object v2, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 430
    .local v2, "oldAdapter":Landroid/support/v4/view/PagerAdapter;
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 431
    iput v7, p0, Lorg/dmfs/android/view/ViewPager;->mExpectedAdapterCount:I

    .line 433
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v4, :cond_71

    .line 434
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mObserver:Lorg/dmfs/android/view/ViewPager$PagerObserver;

    if-nez v4, :cond_43

    .line 435
    new-instance v4, Lorg/dmfs/android/view/ViewPager$PagerObserver;

    invoke-direct {v4, p0, v8}, Lorg/dmfs/android/view/ViewPager$PagerObserver;-><init>(Lorg/dmfs/android/view/ViewPager;Lorg/dmfs/android/view/ViewPager$PagerObserver;)V

    iput-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mObserver:Lorg/dmfs/android/view/ViewPager$PagerObserver;

    .line 437
    :cond_43
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mObserver:Lorg/dmfs/android/view/ViewPager$PagerObserver;

    invoke-virtual {v4, v5}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 438
    iput-boolean v7, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 439
    iget-boolean v3, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 440
    .local v3, "wasFirstLayout":Z
    iput-boolean v9, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    .line 441
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    iput v4, p0, Lorg/dmfs/android/view/ViewPager;->mExpectedAdapterCount:I

    .line 442
    iget v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    if-ltz v4, :cond_91

    .line 443
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v5, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v6, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 444
    iget v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    invoke-virtual {p0, v4, v7, v9}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 445
    const/4 v4, -0x1

    iput v4, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredCurItem:I

    .line 446
    iput-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 447
    iput-object v8, p0, Lorg/dmfs/android/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 455
    .end local v3    # "wasFirstLayout":Z
    :cond_71
    :goto_71
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapterChangeListener:Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;

    if-eqz v4, :cond_7c

    if-eq v2, p1, :cond_7c

    .line 456
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapterChangeListener:Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;

    invoke-interface {v4, v2, p1}, Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;->onAdapterChanged(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 458
    :cond_7c
    return-void

    .line 419
    .end local v2    # "oldAdapter":Landroid/support/v4/view/PagerAdapter;
    .restart local v0    # "i":I
    :cond_7d
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    .line 420
    .local v1, "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v5, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->position:I

    iget-object v6, v1, Lorg/dmfs/android/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v4, p0, v5, v6}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 418
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 448
    .end local v0    # "i":I
    .end local v1    # "ii":Lorg/dmfs/android/view/ViewPager$ItemInfo;
    .restart local v2    # "oldAdapter":Landroid/support/v4/view/PagerAdapter;
    .restart local v3    # "wasFirstLayout":Z
    :cond_91
    if-nez v3, :cond_97

    .line 449
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    goto :goto_71

    .line 451
    :cond_97
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->requestLayout()V

    goto :goto_71
.end method

.method setChildrenDrawingOrderEnabledCompat(Z)V
    .registers 8
    .param p1, "enable"    # Z

    .prologue
    .line 630
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x7

    if-lt v1, v2, :cond_2a

    .line 631
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    if-nez v1, :cond_1b

    .line 633
    :try_start_9
    const-class v1, Landroid/view/ViewGroup;

    .line 634
    const-string v2, "setChildrenDrawingOrderEnabled"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    .line 633
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;
    :try_end_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_9 .. :try_end_1b} :catch_2b

    .line 640
    :cond_1b
    :goto_1b
    :try_start_1b
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2a} :catch_34

    .line 645
    :cond_2a
    :goto_2a
    return-void

    .line 635
    :catch_2b
    move-exception v0

    .line 636
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "ViewPager"

    const-string v2, "Can\'t find setChildrenDrawingOrderEnabled"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1b

    .line 641
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_34
    move-exception v0

    .line 642
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ViewPager"

    const-string v2, "Error changing children drawing order"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2a
.end method

.method public setCurrentItem(I)V
    .registers 4
    .param p1, "item"    # I

    .prologue
    const/4 v1, 0x0

    .line 496
    iput-boolean v1, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 497
    iget-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    if-eqz v0, :cond_c

    move v0, v1

    :goto_8
    invoke-virtual {p0, p1, v0, v1}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 498
    return-void

    .line 497
    :cond_c
    const/4 v0, 0x1

    goto :goto_8
.end method

.method public setCurrentItem(IZ)V
    .registers 4
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z

    .prologue
    const/4 v0, 0x0

    .line 507
    iput-boolean v0, p0, Lorg/dmfs/android/view/ViewPager;->mPopulatePending:Z

    .line 508
    invoke-virtual {p0, p1, p2, v0}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 509
    return-void
.end method

.method setCurrentItemInternal(IZZ)V
    .registers 5
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z

    .prologue
    .line 516
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/dmfs/android/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 517
    return-void
.end method

.method setCurrentItemInternal(IZZI)V
    .registers 10
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z
    .param p4, "velocity"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 520
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    if-gtz v3, :cond_12

    .line 521
    :cond_e
    invoke-direct {p0, v4}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 560
    :goto_11
    return-void

    .line 524
    :cond_12
    if-nez p3, :cond_24

    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-ne v3, p1, :cond_24

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eqz v3, :cond_24

    .line 525
    invoke-direct {p0, v4}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_11

    .line 529
    :cond_24
    if-gez p1, :cond_60

    .line 530
    const/4 p1, 0x0

    .line 534
    :cond_27
    :goto_27
    iget v2, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    .line 535
    .local v2, "pageLimit":I
    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    add-int/2addr v3, v2

    if-gt p1, v3, :cond_33

    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    sub-int/2addr v3, v2

    if-ge p1, v3, :cond_3c

    .line 539
    :cond_33
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_34
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_71

    .line 543
    .end local v1    # "i":I
    :cond_3c
    iget v3, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    if-eq v3, p1, :cond_7e

    .line 545
    .local v0, "dispatchSelected":Z
    :goto_40
    iget-boolean v3, p0, Lorg/dmfs/android/view/ViewPager;->mFirstLayout:Z

    if-eqz v3, :cond_80

    .line 548
    iput p1, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    .line 549
    if-eqz v0, :cond_51

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_51

    .line 550
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 552
    :cond_51
    if-eqz v0, :cond_5c

    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_5c

    .line 553
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 555
    :cond_5c
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->requestLayout()V

    goto :goto_11

    .line 531
    .end local v0    # "dispatchSelected":Z
    .end local v2    # "pageLimit":I
    :cond_60
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    if-lt p1, v3, :cond_27

    .line 532
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    add-int/lit8 p1, v3, -0x1

    goto :goto_27

    .line 540
    .restart local v1    # "i":I
    .restart local v2    # "pageLimit":I
    :cond_71
    iget-object v3, p0, Lorg/dmfs/android/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;

    iput-boolean v0, v3, Lorg/dmfs/android/view/ViewPager$ItemInfo;->scrolling:Z

    .line 539
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .end local v1    # "i":I
    :cond_7e
    move v0, v4

    .line 543
    goto :goto_40

    .line 557
    .restart local v0    # "dispatchSelected":Z
    :cond_80
    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager;->populate(I)V

    .line 558
    invoke-direct {p0, p1, p2, p4, v0}, Lorg/dmfs/android/view/ViewPager;->scrollToItem(IZIZ)V

    goto :goto_11
.end method

.method setInternalPageChangeListener(Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;)Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;
    .registers 3
    .param p1, "listener"    # Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 661
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .line 662
    .local v0, "oldListener":Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager;->mInternalPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .line 663
    return-object v0
.end method

.method public setOffscreenPageLimit(I)V
    .registers 6
    .param p1, "limit"    # I

    .prologue
    const/4 v3, 0x1

    .line 695
    if-ge p1, v3, :cond_22

    .line 696
    const-string v0, "ViewPager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requested offscreen page limit "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " too small; defaulting to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 697
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 696
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 698
    const/4 p1, 0x1

    .line 700
    :cond_22
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    if-eq p1, v0, :cond_2b

    .line 701
    iput p1, p0, Lorg/dmfs/android/view/ViewPager;->mOffscreenPageLimit:I

    .line 702
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 704
    :cond_2b
    return-void
.end method

.method setOnAdapterChangeListener(Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;

    .prologue
    .line 481
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager;->mAdapterChangeListener:Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;

    .line 482
    return-void
.end method

.method public setOnPageChangeListener(Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 599
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager;->mOnPageChangeListener:Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;

    .line 600
    return-void
.end method

.method public setPageMargin(I)V
    .registers 4
    .param p1, "marginPixels"    # I

    .prologue
    .line 715
    iget v0, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    .line 716
    .local v0, "oldMargin":I
    iput p1, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    .line 718
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getWidth()I

    move-result v1

    .line 719
    .local v1, "width":I
    invoke-direct {p0, v1, v1, p1, v0}, Lorg/dmfs/android/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 721
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->requestLayout()V

    .line 722
    return-void
.end method

.method public setPageMarginDrawable(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 751
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 752
    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 739
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 740
    if-eqz p1, :cond_7

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->refreshDrawableState()V

    .line 741
    :cond_7
    if-nez p1, :cond_11

    const/4 v0, 0x1

    :goto_a
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setWillNotDraw(Z)V

    .line 742
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->invalidate()V

    .line 743
    return-void

    .line 741
    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setPageTransformer(ZLorg/dmfs/android/view/ViewPager$PageTransformer;)V
    .registers 9
    .param p1, "reverseDrawingOrder"    # Z
    .param p2, "transformer"    # Lorg/dmfs/android/view/ViewPager$PageTransformer;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 615
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_23

    .line 616
    if-eqz p2, :cond_24

    move v0, v2

    .line 617
    .local v0, "hasTransformer":Z
    :goto_b
    iget-object v4, p0, Lorg/dmfs/android/view/ViewPager;->mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

    if-eqz v4, :cond_26

    move v4, v2

    :goto_10
    xor-int v1, v0, v4

    .line 618
    .local v1, "needsPopulate":Z
    iput-object p2, p0, Lorg/dmfs/android/view/ViewPager;->mPageTransformer:Lorg/dmfs/android/view/ViewPager$PageTransformer;

    .line 619
    invoke-virtual {p0, v0}, Lorg/dmfs/android/view/ViewPager;->setChildrenDrawingOrderEnabledCompat(Z)V

    .line 620
    if-eqz v0, :cond_28

    .line 621
    if-eqz p1, :cond_1c

    const/4 v2, 0x2

    :cond_1c
    iput v2, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrder:I

    .line 625
    :goto_1e
    if-eqz v1, :cond_23

    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 627
    .end local v0    # "hasTransformer":Z
    .end local v1    # "needsPopulate":Z
    :cond_23
    return-void

    :cond_24
    move v0, v3

    .line 616
    goto :goto_b

    .restart local v0    # "hasTransformer":Z
    :cond_26
    move v4, v3

    .line 617
    goto :goto_10

    .line 623
    .restart local v1    # "needsPopulate":Z
    :cond_28
    iput v3, p0, Lorg/dmfs/android/view/ViewPager;->mDrawingOrder:I

    goto :goto_1e
.end method

.method smoothScrollTo(II)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 785
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/dmfs/android/view/ViewPager;->smoothScrollTo(III)V

    .line 786
    return-void
.end method

.method smoothScrollTo(III)V
    .registers 19
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "velocity"    # I

    .prologue
    .line 796
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getChildCount()I

    move-result v1

    if-nez v1, :cond_b

    .line 798
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 834
    :goto_a
    return-void

    .line 801
    :cond_b
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollX()I

    move-result v2

    .line 802
    .local v2, "sx":I
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->getScrollY()I

    move-result v3

    .line 803
    .local v3, "sy":I
    sub-int v4, p1, v2

    .line 804
    .local v4, "dx":I
    sub-int v5, p2, v3

    .line 805
    .local v5, "dy":I
    if-nez v4, :cond_27

    if-nez v5, :cond_27

    .line 806
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->completeScroll(Z)V

    .line 807
    invoke-virtual {p0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 808
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    goto :goto_a

    .line 812
    :cond_27
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 813
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V

    .line 815
    invoke-direct {p0}, Lorg/dmfs/android/view/ViewPager;->getClientWidth()I

    move-result v12

    .line 816
    .local v12, "width":I
    div-int/lit8 v9, v12, 0x2

    .line 817
    .local v9, "halfWidth":I
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-float v14, v14

    mul-float/2addr v13, v14

    int-to-float v14, v12

    div-float/2addr v13, v14

    invoke-static {v1, v13}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 818
    .local v8, "distanceRatio":F
    int-to-float v1, v9

    int-to-float v13, v9

    .line 819
    invoke-virtual {p0, v8}, Lorg/dmfs/android/view/ViewPager;->distanceInfluenceForSnapDuration(F)F

    move-result v14

    mul-float/2addr v13, v14

    .line 818
    add-float v7, v1, v13

    .line 821
    .local v7, "distance":F
    const/4 v6, 0x0

    .line 822
    .local v6, "duration":I
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    .line 823
    if-lez p3, :cond_76

    .line 824
    const/high16 v1, 0x447a0000    # 1000.0f

    move/from16 v0, p3

    int-to-float v13, v0

    div-float v13, v7, v13

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    mul-float/2addr v1, v13

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    mul-int/lit8 v6, v1, 0x4

    .line 830
    :goto_67
    const/16 v1, 0x258

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 832
    iget-object v1, p0, Lorg/dmfs/android/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 833
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_a

    .line 826
    :cond_76
    int-to-float v1, v12

    iget-object v13, p0, Lorg/dmfs/android/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v14, p0, Lorg/dmfs/android/view/ViewPager;->mCurItem:I

    invoke-virtual {v13, v14}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v13

    mul-float v11, v1, v13

    .line 827
    .local v11, "pageWidth":F
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget v13, p0, Lorg/dmfs/android/view/ViewPager;->mPageMargin:I

    int-to-float v13, v13

    add-float/2addr v13, v11

    div-float v10, v1, v13

    .line 828
    .local v10, "pageDelta":F
    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v1, v10

    const/high16 v13, 0x42c80000    # 100.0f

    mul-float/2addr v1, v13

    float-to-int v6, v1

    goto :goto_67
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 756
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_c

    const/4 v0, 0x0

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x1

    goto :goto_b
.end method
