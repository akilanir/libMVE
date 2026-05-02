.class public Luk/co/senab/photoview/PhotoViewAttacher;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Luk/co/senab/photoview/IPhotoView;
.implements Landroid/view/View$OnTouchListener;
.implements Luk/co/senab/photoview/gestures/OnGestureListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field static final EDGE_BOTH:I = 0x2

.field static final EDGE_LEFT:I = 0x0

.field static final EDGE_NONE:I = -0x1

.field static final EDGE_RIGHT:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "PhotoViewAttacher"

.field static SINGLE_TOUCH:I

.field static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field ZOOM_DURATION:I

.field private mAllowParentInterceptOnEdge:Z

.field private final mBaseMatrix:Landroid/graphics/Matrix;

.field private mBaseRotation:F

.field private mBlockParentIntercept:Z

.field private mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

.field private final mDisplayRect:Landroid/graphics/RectF;

.field private final mDrawMatrix:Landroid/graphics/Matrix;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mImageView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mIvBottom:I

.field private mIvLeft:I

.field private mIvRight:I

.field private mIvTop:I

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

.field private mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

.field private mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScrollEdge:I

.field private mSingleFlingListener:Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

.field private mZoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 57
    const-string v0, "PhotoViewAttacher"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    .line 59
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->sInterpolator:Landroid/view/animation/Interpolator;

    .line 67
    const/4 v0, 0x1

    sput v0, Luk/co/senab/photoview/PhotoViewAttacher;->SINGLE_TOUCH:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 3
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 157
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;Z)V

    .line 158
    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Z)V
    .registers 7
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "zoomable"    # Z

    .prologue
    const/4 v2, 0x1

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/16 v1, 0xc8

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 69
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 70
    const/high16 v1, 0x3fe00000    # 1.75f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 71
    const/high16 v1, 0x40400000    # 3.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 73
    iput-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 74
    const/4 v1, 0x0

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBlockParentIntercept:Z

    .line 134
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 135
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 136
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 137
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 138
    const/16 v1, 0x9

    new-array v1, v1, [F

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    .line 150
    const/4 v1, 0x2

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 154
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 161
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 163
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setDrawingCacheEnabled(Z)V

    .line 164
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 166
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 167
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_58

    .line 168
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 171
    :cond_58
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 173
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 215
    :goto_61
    return-void

    .line 178
    :cond_62
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 177
    invoke-static {v1, p0}, Luk/co/senab/photoview/gestures/VersionedGestureDetector;->newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    .line 180
    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Luk/co/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v3, p0}, Luk/co/senab/photoview/PhotoViewAttacher$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 210
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v2, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v2, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v1, v2}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 211
    const/4 v1, 0x0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseRotation:F

    .line 214
    invoke-virtual {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    goto :goto_61
.end method

.method static synthetic access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 49
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$100(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 49
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSingleFlingListener:Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;

    return-object v0
.end method

.method static synthetic access$200()Z
    .registers 1

    .prologue
    .line 49
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    return v0
.end method

.method static synthetic access$300(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 49
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;
    .param p1, "x1"    # Landroid/graphics/Matrix;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private cancelFling()V
    .registers 2

    .prologue
    .line 734
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_c

    .line 735
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    .line 736
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 738
    :cond_c
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .registers 2

    .prologue
    .line 744
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 745
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 747
    :cond_d
    return-void
.end method

.method private checkImageViewScaleType()V
    .registers 4

    .prologue
    .line 750
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 756
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1e

    instance-of v1, v0, Luk/co/senab/photoview/IPhotoView;

    if-nez v1, :cond_1e

    .line 757
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 758
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 762
    :cond_1e
    return-void
.end method

.method private checkMatrixBounds()Z
    .registers 15

    .prologue
    const/4 v9, 0x1

    const/high16 v13, 0x40000000    # 2.0f

    const/4 v12, 0x0

    const/4 v8, 0x0

    .line 765
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 766
    .local v3, "imageView":Landroid/widget/ImageView;
    if-nez v3, :cond_c

    .line 823
    :cond_b
    :goto_b
    return v8

    .line 770
    :cond_c
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    invoke-direct {p0, v10}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 771
    .local v4, "rect":Landroid/graphics/RectF;
    if-eqz v4, :cond_b

    .line 775
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v2

    .local v2, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 776
    .local v7, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 778
    .local v1, "deltaY":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v5

    .line 779
    .local v5, "viewHeight":I
    int-to-float v10, v5

    cmpg-float v10, v2, v10

    if-gtz v10, :cond_6f

    .line 780
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_b0

    .line 788
    int-to-float v10, v5

    sub-float/2addr v10, v2

    div-float/2addr v10, v13

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 797
    :cond_3d
    :goto_3d
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v6

    .line 798
    .local v6, "viewWidth":I
    int-to-float v10, v6

    cmpg-float v10, v7, v10

    if-gtz v10, :cond_91

    .line 799
    sget-object v8, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v10

    aget v8, v8, v10

    packed-switch v8, :pswitch_data_b8

    .line 807
    int-to-float v8, v6

    sub-float/2addr v8, v7

    div-float/2addr v8, v13

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 810
    :goto_5a
    const/4 v8, 0x2

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 822
    :goto_5d
    iget-object v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    move v8, v9

    .line 823
    goto :goto_b

    .line 782
    .end local v6    # "viewWidth":I
    :pswitch_64
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    .line 783
    goto :goto_3d

    .line 785
    :pswitch_68
    int-to-float v10, v5

    sub-float/2addr v10, v2

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 786
    goto :goto_3d

    .line 791
    :cond_6f
    iget v10, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_79

    .line 792
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    goto :goto_3d

    .line 793
    :cond_79
    iget v10, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v11, v5

    cmpg-float v10, v10, v11

    if-gez v10, :cond_3d

    .line 794
    int-to-float v10, v5

    iget v11, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v10, v11

    goto :goto_3d

    .line 801
    .restart local v6    # "viewWidth":I
    :pswitch_86
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 802
    goto :goto_5a

    .line 804
    :pswitch_8a
    int-to-float v8, v6

    sub-float/2addr v8, v7

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 805
    goto :goto_5a

    .line 811
    :cond_91
    iget v10, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_9d

    .line 812
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 813
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    goto :goto_5d

    .line 814
    :cond_9d
    iget v8, v4, Landroid/graphics/RectF;->right:F

    int-to-float v10, v6

    cmpg-float v8, v8, v10

    if-gez v8, :cond_ac

    .line 815
    int-to-float v8, v6

    iget v10, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v8, v10

    .line 816
    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 818
    :cond_ac
    const/4 v8, -0x1

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 780
    :pswitch_data_b0
    .packed-switch 0x2
        :pswitch_64
        :pswitch_68
    .end packed-switch

    .line 799
    :pswitch_data_b8
    .packed-switch 0x2
        :pswitch_86
        :pswitch_8a
    .end packed-switch
.end method

.method private static checkZoomLevels(FFF)V
    .registers 5
    .param p0, "minZoom"    # F
    .param p1, "midZoom"    # F
    .param p2, "maxZoom"    # F

    .prologue
    .line 78
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_c

    .line 79
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MinZoom has to be less than MidZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_c
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_18

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MidZoom has to be less than MaxZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_18
    return-void
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 8
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v5, 0x0

    .line 833
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 835
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_24

    .line 836
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 837
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_24

    .line 838
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    .line 839
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    .line 838
    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 840
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 841
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 844
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :goto_23
    return-object v2

    :cond_24
    const/4 v2, 0x0

    goto :goto_23
.end method

.method private getImageViewHeight(Landroid/widget/ImageView;)I
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 981
    if-nez p1, :cond_4

    .line 982
    const/4 v0, 0x0

    .line 983
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_3
.end method

.method private getImageViewWidth(Landroid/widget/ImageView;)I
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 975
    if-nez p1, :cond_4

    .line 976
    const/4 v0, 0x0

    .line 977
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_3
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 872
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 873
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 91
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z
    .registers 4
    .param p0, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 98
    if-nez p0, :cond_4

    .line 99
    const/4 v0, 0x0

    .line 108
    :goto_3
    return v0

    .line 102
    :cond_4
    sget-object v0, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    .line 108
    const/4 v0, 0x1

    goto :goto_3

    .line 104
    :pswitch_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not supported in PhotoView"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method

.method private resetMatrix()V
    .registers 2

    .prologue
    .line 880
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 881
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseRotation:F

    invoke-virtual {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationBy(F)V

    .line 882
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 883
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 884
    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 887
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 888
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_1b

    .line 890
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    .line 891
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 894
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    if-eqz v2, :cond_1b

    .line 895
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    .line 896
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_1b

    .line 897
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    .line 901
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    :cond_1b
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .registers 3
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 120
    if-eqz p0, :cond_17

    instance-of v0, p0, Luk/co/senab/photoview/IPhotoView;

    if-nez v0, :cond_17

    .line 121
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 122
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 125
    :cond_17
    return-void
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V
    .registers 16
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/high16 v13, 0x40000000    # 2.0f

    const/4 v12, 0x0

    .line 909
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 910
    .local v3, "imageView":Landroid/widget/ImageView;
    if-eqz v3, :cond_b

    if-nez p1, :cond_c

    .line 972
    :cond_b
    :goto_b
    return-void

    .line 914
    :cond_c
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v8, v10

    .line 915
    .local v8, "viewWidth":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v7, v10

    .line 916
    .local v7, "viewHeight":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 917
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 919
    .local v0, "drawableHeight":I
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 921
    int-to-float v10, v1

    div-float v9, v8, v10

    .line 922
    .local v9, "widthScale":F
    int-to-float v10, v0

    div-float v2, v7, v10

    .line 924
    .local v2, "heightScale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_40

    .line 925
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 971
    :goto_3c
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_b

    .line 928
    :cond_40
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_5f

    .line 929
    invoke-static {v9, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 930
    .local v6, "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 931
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 934
    .end local v6    # "scale":F
    :cond_5f
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_84

    .line 935
    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 936
    .restart local v6    # "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 937
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 941
    .end local v6    # "scale":F
    :cond_84
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v10, v1

    int-to-float v11, v0

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 942
    .local v5, "mTempSrc":Landroid/graphics/RectF;
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v12, v12, v8, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 944
    .local v4, "mTempDst":Landroid/graphics/RectF;
    iget v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseRotation:F

    float-to-int v10, v10

    rem-int/lit16 v10, v10, 0xb4

    if-eqz v10, :cond_9e

    .line 945
    new-instance v5, Landroid/graphics/RectF;

    .end local v5    # "mTempSrc":Landroid/graphics/RectF;
    int-to-float v10, v0

    int-to-float v11, v1

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 948
    .restart local v5    # "mTempSrc":Landroid/graphics/RectF;
    :cond_9e
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_ce

    goto :goto_3c

    .line 955
    :pswitch_ac
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 950
    :pswitch_b4
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 951
    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 959
    :pswitch_bc
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 963
    :pswitch_c5
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 948
    :pswitch_data_ce
    .packed-switch 0x2
        :pswitch_ac
        :pswitch_bc
        :pswitch_b4
        :pswitch_c5
    .end packed-switch
.end method


# virtual methods
.method public canZoom()Z
    .registers 2

    .prologue
    .line 238
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    return v0
.end method

.method public cleanup()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 249
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_6

    .line 280
    :goto_5
    return-void

    .line 253
    :cond_6
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 255
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_25

    .line 257
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 258
    .local v1, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v1, :cond_1f

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 259
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 263
    :cond_1f
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 266
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    .line 269
    .end local v1    # "observer":Landroid/view/ViewTreeObserver;
    :cond_25
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v2, :cond_2e

    .line 270
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v3}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 274
    :cond_2e
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 275
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 276
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 279
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    goto :goto_5
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 719
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getDisplayMatrix(Landroid/graphics/Matrix;)V
    .registers 3
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 724
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 725
    return-void
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 284
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 285
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDrawMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 728
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 729
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 730
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getIPhotoViewImplementation()Luk/co/senab/photoview/IPhotoView;
    .registers 1

    .prologue
    .line 861
    return-object p0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .registers 5

    .prologue
    .line 336
    const/4 v0, 0x0

    .line 338
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_d

    .line 339
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "imageView":Landroid/widget/ImageView;
    check-cast v0, Landroid/widget/ImageView;

    .line 343
    .restart local v0    # "imageView":Landroid/widget/ImageView;
    :cond_d
    if-nez v0, :cond_1d

    .line 344
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 345
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    const-string v2, "PhotoViewAttacher"

    const-string v3, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    :cond_1d
    return-object v0
.end method

.method public getMaxScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 377
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMaximumScale()F
    .registers 2

    .prologue
    .line 382
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .registers 2

    .prologue
    .line 371
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMidScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 366
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 355
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .registers 2

    .prologue
    .line 360
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .registers 2

    .prologue
    .line 629
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .registers 2

    .prologue
    .line 639
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    return-object v0
.end method

.method public getScale()F
    .registers 6

    .prologue
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 387
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v2, 0x3

    invoke-direct {p0, v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    .line 848
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 849
    .local v0, "imageView":Landroid/widget/ImageView;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_7
.end method

.method public onDrag(FF)V
    .registers 13
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 397
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 432
    :cond_b
    :goto_b
    return-void

    .line 401
    :cond_c
    sget-boolean v2, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v2, :cond_2d

    .line 402
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "PhotoViewAttacher"

    const-string v4, "onDrag: dx: %.2f. dy: %.2f"

    new-array v5, v9, [Ljava/lang/Object;

    .line 403
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 402
    invoke-interface {v2, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    :cond_2d
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 407
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 408
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 419
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 420
    .local v1, "parent":Landroid/view/ViewParent;
    iget-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v2, :cond_6b

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_6b

    iget-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBlockParentIntercept:Z

    if-nez v2, :cond_6b

    .line 421
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-eq v2, v9, :cond_65

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-nez v2, :cond_5b

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v2

    if-gez v2, :cond_65

    :cond_5b
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-ne v2, v7, :cond_b

    const/high16 v2, -0x40800000    # -1.0f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_b

    .line 424
    :cond_65
    if-eqz v1, :cond_b

    .line 425
    invoke-interface {v1, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_b

    .line 428
    :cond_6b
    if-eqz v1, :cond_b

    .line 429
    invoke-interface {v1, v7}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_b
.end method

.method public onFling(FFFF)V
    .registers 11
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 437
    sget-boolean v1, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_3e

    .line 438
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    const-string v2, "PhotoViewAttacher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onFling. sX: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " sY: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Vx: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Vy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    :cond_3e
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 444
    .local v0, "imageView":Landroid/widget/ImageView;
    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 445
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    .line 446
    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    .line 445
    invoke-virtual {v1, v2, v3, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    .line 447
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 448
    return-void
.end method

.method public onGlobalLayout()V
    .registers 7

    .prologue
    .line 452
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 454
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    .line 455
    iget-boolean v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v5, :cond_3a

    .line 456
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTop()I

    move-result v4

    .line 457
    .local v4, "top":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getRight()I

    move-result v3

    .line 458
    .local v3, "right":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    .line 459
    .local v0, "bottom":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLeft()I

    move-result v2

    .line 468
    .local v2, "left":I
    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v4, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v2, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v3, v5, :cond_39

    .line 471
    :cond_2a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 474
    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    .line 475
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    .line 476
    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    .line 477
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    .line 483
    .end local v0    # "bottom":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    .end local v4    # "top":I
    :cond_39
    :goto_39
    return-void

    .line 480
    :cond_3a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    goto :goto_39
.end method

.method public onScale(FFF)V
    .registers 11
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    const/high16 v6, 0x3f800000    # 1.0f

    .line 487
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_2d

    .line 488
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "onScale: scale: %.2f. fX: %.2f. fY: %.2f"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 491
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v4

    .line 490
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 488
    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    :cond_2d
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_3b

    cmpg-float v0, p1, v6

    if-gez v0, :cond_5a

    :cond_3b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_49

    cmpl-float v0, p1, v6

    if-lez v0, :cond_5a

    .line 495
    :cond_49
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    if-eqz v0, :cond_52

    .line 496
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    invoke-interface {v0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;->onScaleChange(FFF)V

    .line 498
    :cond_52
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 499
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 501
    :cond_5a
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 16
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .prologue
    .line 506
    const/4 v8, 0x0

    .line 508
    .local v8, "handled":Z
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_59

    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 509
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    .line 510
    .local v9, "parent":Landroid/view/ViewParent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_a0

    .line 541
    :cond_19
    :goto_19
    :pswitch_19
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_4c

    .line 542
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v12

    .line 543
    .local v12, "wasScaling":Z
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isDragging()Z

    move-result v11

    .line 545
    .local v11, "wasDragging":Z
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0, p2}, Luk/co/senab/photoview/gestures/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    .line 547
    if-nez v12, :cond_99

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v0

    if-nez v0, :cond_99

    const/4 v7, 0x1

    .line 548
    .local v7, "didntScale":Z
    :goto_3a
    if-nez v11, :cond_9b

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isDragging()Z

    move-result v0

    if-nez v0, :cond_9b

    const/4 v6, 0x1

    .line 550
    .local v6, "didntDrag":Z
    :goto_45
    if-eqz v7, :cond_9d

    if-eqz v6, :cond_9d

    const/4 v0, 0x1

    :goto_4a
    iput-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBlockParentIntercept:Z

    .line 554
    .end local v6    # "didntDrag":Z
    .end local v7    # "didntScale":Z
    .end local v11    # "wasDragging":Z
    .end local v12    # "wasScaling":Z
    :cond_4c
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_59

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 555
    const/4 v8, 0x1

    .line 560
    .end local v9    # "parent":Landroid/view/ViewParent;
    :cond_59
    return v8

    .line 514
    .restart local v9    # "parent":Landroid/view/ViewParent;
    :pswitch_5a
    if-eqz v9, :cond_64

    .line 515
    const/4 v0, 0x1

    invoke-interface {v9, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 522
    :goto_60
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    goto :goto_19

    .line 517
    :cond_64
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "onTouch getParent() returned null"

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_60

    .line 529
    :pswitch_70
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_19

    .line 530
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v10

    .line 531
    .local v10, "rect":Landroid/graphics/RectF;
    if-eqz v10, :cond_19

    .line 532
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 533
    invoke-virtual {v10}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {v10}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    .line 532
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 534
    const/4 v8, 0x1

    goto :goto_19

    .line 547
    .end local v10    # "rect":Landroid/graphics/RectF;
    .restart local v11    # "wasDragging":Z
    .restart local v12    # "wasScaling":Z
    :cond_99
    const/4 v7, 0x0

    goto :goto_3a

    .line 548
    .restart local v7    # "didntScale":Z
    :cond_9b
    const/4 v6, 0x0

    goto :goto_45

    .line 550
    .restart local v6    # "didntDrag":Z
    :cond_9d
    const/4 v0, 0x0

    goto :goto_4a

    .line 510
    nop

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_5a
        :pswitch_70
        :pswitch_19
        :pswitch_70
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 565
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 566
    return-void
.end method

.method public setBaseRotation(F)V
    .registers 3
    .param p1, "degrees"    # F

    .prologue
    .line 308
    const/high16 v0, 0x43b40000    # 360.0f

    rem-float v0, p1, v0

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseRotation:F

    .line 309
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 310
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseRotation:F

    invoke-virtual {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationBy(F)V

    .line 311
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 312
    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .registers 5
    .param p1, "finalMatrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v1, 0x0

    .line 290
    if-nez p1, :cond_b

    .line 291
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Matrix cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 294
    .local v0, "imageView":Landroid/widget/ImageView;
    if-nez v0, :cond_12

    .line 304
    :cond_11
    :goto_11
    return v1

    .line 297
    :cond_12
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_11

    .line 300
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 301
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 302
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 304
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 595
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMaximumScale(F)V

    .line 596
    return-void
.end method

.method public setMaximumScale(F)V
    .registers 4
    .param p1, "maximumScale"    # F

    .prologue
    .line 600
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 601
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 602
    return-void
.end method

.method public setMediumScale(F)V
    .registers 4
    .param p1, "mediumScale"    # F

    .prologue
    .line 588
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 589
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 590
    return-void
.end method

.method public setMidScale(F)V
    .registers 2
    .param p1, "midScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 583
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMediumScale(F)V

    .line 584
    return-void
.end method

.method public setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 571
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMinimumScale(F)V

    .line 572
    return-void
.end method

.method public setMinimumScale(F)V
    .registers 4
    .param p1, "minimumScale"    # F

    .prologue
    .line 576
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 577
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 578
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .registers 4
    .param p1, "newOnDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 219
    if-eqz p1, :cond_8

    .line 220
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 224
    :goto_7
    return-void

    .line 222
    :cond_8
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v1, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v1, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    goto :goto_7
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 614
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 615
    return-void
.end method

.method public setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 619
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 620
    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 624
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 625
    return-void
.end method

.method public setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V
    .registers 2
    .param p1, "onScaleChangeListener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    .prologue
    .line 228
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    .line 229
    return-void
.end method

.method public setOnSingleFlingListener(Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;)V
    .registers 2
    .param p1, "onSingleFlingListener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;

    .prologue
    .line 233
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSingleFlingListener:Luk/co/senab/photoview/PhotoViewAttacher$OnSingleFlingListener;

    .line 234
    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 634
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 635
    return-void
.end method

.method public setPhotoViewRotation(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 319
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 320
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 321
    return-void
.end method

.method public setRotationBy(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 331
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 332
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 333
    return-void
.end method

.method public setRotationTo(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 325
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 326
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 327
    return-void
.end method

.method public setScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .prologue
    .line 644
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    .line 645
    return-void
.end method

.method public setScale(FFFZ)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 662
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    .line 664
    .local v6, "imageView":Landroid/widget/ImageView;
    if-eqz v6, :cond_1d

    .line 666
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_12

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1e

    .line 668
    :cond_12
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "Scale must be within the range of minScale and maxScale"

    .line 669
    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    :cond_1d
    :goto_1d
    return-void

    .line 674
    :cond_1e
    if-eqz p4, :cond_31

    .line 675
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1d

    .line 678
    :cond_31
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 679
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    goto :goto_1d
.end method

.method public setScale(FZ)V
    .registers 6
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 649
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 651
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_17

    .line 653
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 654
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    .line 652
    invoke-virtual {p0, p1, v1, v2, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 657
    :cond_17
    return-void
.end method

.method public setScaleLevels(FFF)V
    .registers 4
    .param p1, "minimumScale"    # F
    .param p2, "mediumScale"    # F
    .param p3, "maximumScale"    # F

    .prologue
    .line 606
    invoke-static {p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 607
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 608
    iput p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 609
    iput p3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 610
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 686
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_f

    .line 687
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 690
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 692
    :cond_f
    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .registers 2
    .param p1, "milliseconds"    # I

    .prologue
    .line 854
    if-gez p1, :cond_4

    .line 855
    const/16 p1, 0xc8

    .line 856
    :cond_4
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 857
    return-void
.end method

.method public setZoomable(Z)V
    .registers 2
    .param p1, "zoomable"    # Z

    .prologue
    .line 696
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    .line 697
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 698
    return-void
.end method

.method public update()V
    .registers 3

    .prologue
    .line 701
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 703
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_14

    .line 704
    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_15

    .line 706
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 709
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 715
    :cond_14
    :goto_14
    return-void

    .line 712
    :cond_15
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_14
.end method
