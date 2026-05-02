.class public Luk/co/senab/photoview/PhotoViewAttacher;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Luk/co/senab/photoview/IPhotoView;
.implements Landroid/view/View$OnTouchListener;
.implements Luk/co/senab/photoview/gestures/OnGestureListener;
.implements Landroid/view/GestureDetector$OnDoubleTapListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/PhotoViewAttacher$2;,
        Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field public static final DEFAULT_MAX_SCALE:F = 3.0f

.field public static final DEFAULT_MID_SCALE:F = 1.75f

.field public static final DEFAULT_MIN_SCALE:F = 1.0f

.field static final EDGE_BOTH:I = 0x2

.field static final EDGE_LEFT:I = 0x0

.field static final EDGE_NONE:I = -0x1

.field static final EDGE_RIGHT:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "PhotoViewAttacher"

.field static final ZOOM_DURATION:I = 0xc8

.field static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mAllowParentInterceptOnEdge:Z

.field private final mBaseMatrix:Landroid/graphics/Matrix;

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

.field private mLastRotation:F

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

.field private mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScrollEdge:I

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

.field private mZoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 56
    const-string v0, "PhotoViewAttacher"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    .line 58
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->sInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 7
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    const/4 v4, 0x1

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 71
    const/high16 v1, 0x3fe00000    # 1.75f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 72
    const/high16 v1, 0x40400000    # 3.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 74
    iput-boolean v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

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

    .line 148
    const/4 v1, 0x2

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 151
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 262
    const/4 v1, 0x0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastRotation:F

    .line 154
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 156
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 158
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 159
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_51

    .line 160
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 163
    :cond_51
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 165
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 188
    :goto_5a
    return-void

    .line 169
    :cond_5b
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p0}, Luk/co/senab/photoview/gestures/VersionedGestureDetector;->newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    .line 172
    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Luk/co/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v3, p0}, Luk/co/senab/photoview/PhotoViewAttacher$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 184
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p0}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 187
    invoke-virtual {p0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    goto :goto_5a
.end method

.method static synthetic access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 47
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$100(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 47
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$200(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 1
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 47
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method static synthetic access$300()Z
    .registers 1

    .prologue
    .line 47
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;
    .param p1, "x1"    # Landroid/graphics/Matrix;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private cancelFling()V
    .registers 2

    .prologue
    .line 683
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_c

    .line 684
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    .line 685
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 687
    :cond_c
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .registers 2

    .prologue
    .line 693
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 694
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 696
    :cond_d
    return-void
.end method

.method private checkImageViewScaleType()V
    .registers 4

    .prologue
    .line 699
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 705
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1e

    instance-of v1, v0, Luk/co/senab/photoview/PhotoView;

    if-nez v1, :cond_1e

    .line 706
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 707
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 711
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

    .line 714
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 715
    .local v3, "imageView":Landroid/widget/ImageView;
    if-nez v3, :cond_c

    .line 772
    :cond_b
    :goto_b
    return v8

    .line 719
    :cond_c
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    invoke-direct {p0, v10}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 720
    .local v4, "rect":Landroid/graphics/RectF;
    if-eqz v4, :cond_b

    .line 724
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v2

    .local v2, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 725
    .local v7, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 727
    .local v1, "deltaY":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v5

    .line 728
    .local v5, "viewHeight":I
    int-to-float v10, v5

    cmpg-float v10, v2, v10

    if-gtz v10, :cond_6f

    .line 729
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_b0

    .line 737
    int-to-float v10, v5

    sub-float/2addr v10, v2

    div-float/2addr v10, v13

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 746
    :cond_3d
    :goto_3d
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v6

    .line 747
    .local v6, "viewWidth":I
    int-to-float v10, v6

    cmpg-float v10, v7, v10

    if-gtz v10, :cond_91

    .line 748
    sget-object v8, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v10

    aget v8, v8, v10

    packed-switch v8, :pswitch_data_b8

    .line 756
    int-to-float v8, v6

    sub-float/2addr v8, v7

    div-float/2addr v8, v13

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 759
    :goto_5a
    const/4 v8, 0x2

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 771
    :goto_5d
    iget-object v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    move v8, v9

    .line 772
    goto :goto_b

    .line 731
    .end local v6    # "viewWidth":I
    :pswitch_64
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    .line 732
    goto :goto_3d

    .line 734
    :pswitch_68
    int-to-float v10, v5

    sub-float/2addr v10, v2

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 735
    goto :goto_3d

    .line 740
    :cond_6f
    iget v10, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_79

    .line 741
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    goto :goto_3d

    .line 742
    :cond_79
    iget v10, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v11, v5

    cmpg-float v10, v10, v11

    if-gez v10, :cond_3d

    .line 743
    int-to-float v10, v5

    iget v11, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v10, v11

    goto :goto_3d

    .line 750
    .restart local v6    # "viewWidth":I
    :pswitch_86
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 751
    goto :goto_5a

    .line 753
    :pswitch_8a
    int-to-float v8, v6

    sub-float/2addr v8, v7

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 754
    goto :goto_5a

    .line 760
    :cond_91
    iget v10, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_9d

    .line 761
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 762
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    goto :goto_5d

    .line 763
    :cond_9d
    iget v8, v4, Landroid/graphics/RectF;->right:F

    int-to-float v10, v6

    cmpg-float v8, v8, v10

    if-gez v8, :cond_ac

    .line 764
    int-to-float v8, v6

    iget v10, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v8, v10

    .line 765
    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 767
    :cond_ac
    const/4 v8, -0x1

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 729
    :pswitch_data_b0
    .packed-switch 0x2
        :pswitch_64
        :pswitch_68
    .end packed-switch

    .line 748
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

    .line 782
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 784
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_24

    .line 785
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 786
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_24

    .line 787
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 789
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 790
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 793
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
    .line 908
    if-nez p1, :cond_4

    .line 909
    const/4 v0, 0x0

    .line 910
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
    .line 902
    if-nez p1, :cond_4

    .line 903
    const/4 v0, 0x0

    .line 904
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
    .line 804
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 805
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
    .line 812
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 813
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 814
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 815
    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 818
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 819
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_1b

    .line 821
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    .line 822
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 825
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    if-eqz v2, :cond_1b

    .line 826
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    .line 827
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_1b

    .line 828
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    .line 832
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

    instance-of v0, p0, Luk/co/senab/photoview/PhotoView;

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
    const/4 v12, 0x0

    const/high16 v13, 0x40000000    # 2.0f

    .line 840
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 841
    .local v3, "imageView":Landroid/widget/ImageView;
    if-eqz v3, :cond_b

    if-nez p1, :cond_c

    .line 899
    :cond_b
    :goto_b
    return-void

    .line 845
    :cond_c
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v8, v10

    .line 846
    .local v8, "viewWidth":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v7, v10

    .line 847
    .local v7, "viewHeight":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 848
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 850
    .local v0, "drawableHeight":I
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 852
    int-to-float v10, v1

    div-float v9, v8, v10

    .line 853
    .local v9, "widthScale":F
    int-to-float v10, v0

    div-float v2, v7, v10

    .line 855
    .local v2, "heightScale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_40

    .line 856
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 898
    :goto_3c
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_b

    .line 859
    :cond_40
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_5f

    .line 860
    invoke-static {v9, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 861
    .local v6, "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 862
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

    .line 865
    .end local v6    # "scale":F
    :cond_5f
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_84

    .line 866
    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 867
    .restart local v6    # "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 868
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

    .line 872
    .end local v6    # "scale":F
    :cond_84
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v10, v1

    int-to-float v11, v0

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 873
    .local v5, "mTempSrc":Landroid/graphics/RectF;
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v12, v12, v8, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 875
    .local v4, "mTempDst":Landroid/graphics/RectF;
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_c0

    goto :goto_3c

    .line 882
    :pswitch_9e
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 877
    :pswitch_a6
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 886
    :pswitch_ae
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 890
    :pswitch_b6
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 875
    nop

    :pswitch_data_c0
    .packed-switch 0x2
        :pswitch_9e
        :pswitch_ae
        :pswitch_a6
        :pswitch_b6
    .end packed-switch
.end method


# virtual methods
.method public final canZoom()Z
    .registers 2

    .prologue
    .line 192
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    return v0
.end method

.method public final cleanup()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 204
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_6

    .line 235
    :goto_5
    return-void

    .line 208
    :cond_6
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 210
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_25

    .line 212
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 213
    .local v1, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v1, :cond_1f

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 214
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 218
    :cond_1f
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 221
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    .line 224
    .end local v1    # "observer":Landroid/view/ViewTreeObserver;
    :cond_25
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v2, :cond_2e

    .line 225
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v3}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 229
    :cond_2e
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 230
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 231
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 234
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    goto :goto_5
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 673
    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public final getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 239
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 240
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected getDrawMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 677
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 678
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 679
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public final getImageView()Landroid/widget/ImageView;
    .registers 4

    .prologue
    .line 273
    const/4 v0, 0x0

    .line 275
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_d

    .line 276
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "imageView":Landroid/widget/ImageView;
    check-cast v0, Landroid/widget/ImageView;

    .line 280
    .restart local v0    # "imageView":Landroid/widget/ImageView;
    :cond_d
    if-nez v0, :cond_19

    .line 281
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 282
    const-string v1, "PhotoViewAttacher"

    const-string v2, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    :cond_19
    return-object v0
.end method

.method public getMaxScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 314
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMaximumScale()F
    .registers 2

    .prologue
    .line 319
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .registers 2

    .prologue
    .line 308
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMidScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 303
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 292
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .registers 2

    .prologue
    .line 297
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public final getScale()F
    .registers 6

    .prologue
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 324
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

    invoke-static {v0}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v0

    return v0
.end method

.method public final getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 329
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public final onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    .line 335
    :try_start_1
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    .line 336
    .local v0, "scale":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 337
    .local v1, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 339
    .local v2, "y":F
    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpg-float v3, v0, v3

    if-gez v3, :cond_1a

    .line 340
    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v1, v2, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 350
    .end local v0    # "scale":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :goto_19
    return v5

    .line 341
    .restart local v0    # "scale":F
    .restart local v1    # "x":F
    .restart local v2    # "y":F
    :cond_1a
    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_2f

    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v3, v0, v3

    if-gez v3, :cond_2f

    .line 342
    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v1, v2, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    goto :goto_19

    .line 346
    .end local v0    # "scale":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :catch_2d
    move-exception v3

    goto :goto_19

    .line 344
    .restart local v0    # "scale":F
    .restart local v1    # "x":F
    .restart local v2    # "y":F
    :cond_2f
    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v1, v2, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V
    :try_end_35
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_35} :catch_2d

    goto :goto_19
.end method

.method public final onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 356
    const/4 v0, 0x0

    return v0
.end method

.method public final onDrag(FF)V
    .registers 13
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 361
    sget-boolean v2, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v2, :cond_24

    .line 362
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "PhotoViewAttacher"

    const-string v4, "onDrag: dx: %.2f. dy: %.2f"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    :cond_24
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 367
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 368
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 379
    iget-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v2, :cond_5d

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_5d

    .line 380
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-eq v2, v9, :cond_54

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-nez v2, :cond_4a

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v2

    if-gez v2, :cond_54

    :cond_4a
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-ne v2, v8, :cond_5d

    const/high16 v2, -0x40800000    # -1.0f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_5d

    .line 383
    :cond_54
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 384
    .local v1, "parent":Landroid/view/ViewParent;
    if-eqz v1, :cond_5d

    .line 385
    invoke-interface {v1, v7}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 388
    .end local v1    # "parent":Landroid/view/ViewParent;
    :cond_5d
    return-void
.end method

.method public final onFling(FFFF)V
    .registers 11
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 393
    sget-boolean v1, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_3e

    .line 394
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

    .line 399
    :cond_3e
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 400
    .local v0, "imageView":Landroid/widget/ImageView;
    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 401
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    invoke-virtual {v1, v2, v3, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    .line 403
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 404
    return-void
.end method

.method public final onGlobalLayout()V
    .registers 7

    .prologue
    .line 408
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 410
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    iget-boolean v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v5, :cond_39

    .line 411
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTop()I

    move-result v4

    .line 412
    .local v4, "top":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getRight()I

    move-result v3

    .line 413
    .local v3, "right":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    .line 414
    .local v0, "bottom":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLeft()I

    move-result v2

    .line 423
    .local v2, "left":I
    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v4, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v2, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v3, v5, :cond_39

    .line 426
    :cond_2a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 429
    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    .line 430
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    .line 431
    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    .line 432
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    .line 435
    .end local v0    # "bottom":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    .end local v4    # "top":I
    :cond_39
    return-void
.end method

.method public final onScale(FFF)V
    .registers 10
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 438
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_2b

    .line 439
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "onScale: scale: %.2f. fX: %.2f. fY: %.2f"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

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

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    :cond_2b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_3b

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_43

    .line 446
    :cond_3b
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 447
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 449
    :cond_43
    return-void
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 453
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 455
    .local v1, "imageView":Landroid/widget/ImageView;
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    if-eqz v6, :cond_37

    .line 456
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 458
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_37

    .line 459
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 462
    .local v4, "y":F
    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 464
    iget v6, v0, Landroid/graphics/RectF;->left:F

    sub-float v6, v2, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v3, v6, v7

    .line 466
    .local v3, "xResult":F
    iget v6, v0, Landroid/graphics/RectF;->top:F

    sub-float v6, v4, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v5, v6, v7

    .line 469
    .local v5, "yResult":F
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    invoke-interface {v6, v1, v3, v5}, Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    .line 470
    const/4 v6, 0x1

    .line 478
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    .end local v2    # "x":F
    .end local v3    # "xResult":F
    .end local v4    # "y":F
    .end local v5    # "yResult":F
    :goto_36
    return v6

    .line 474
    :cond_37
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    if-eqz v6, :cond_48

    .line 475
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-interface {v6, v1, v7, v8}, Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    .line 478
    :cond_48
    const/4 v6, 0x0

    goto :goto_36
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 483
    const/4 v6, 0x0

    .line 485
    .local v6, "handled":Z
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_3b

    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 486
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    .line 487
    .local v7, "parent":Landroid/view/ViewParent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_78

    .line 517
    :cond_19
    :goto_19
    :pswitch_19
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_26

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 518
    const/4 v6, 0x1

    .line 521
    :cond_26
    if-nez v6, :cond_2e

    if-eqz v7, :cond_2e

    .line 522
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 526
    :cond_2e
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_3b

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0, p2}, Luk/co/senab/photoview/gestures/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 528
    const/4 v6, 0x1

    .line 532
    .end local v7    # "parent":Landroid/view/ViewParent;
    :cond_3b
    return v6

    .line 491
    .restart local v7    # "parent":Landroid/view/ViewParent;
    :pswitch_3c
    if-eqz v7, :cond_46

    .line 492
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 498
    :goto_42
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    goto :goto_19

    .line 494
    :cond_46
    const-string v0, "PhotoViewAttacher"

    const-string v1, "onTouch getParent() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_42

    .line 505
    :pswitch_4e
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_19

    .line 506
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v8

    .line 507
    .local v8, "rect":Landroid/graphics/RectF;
    if-eqz v8, :cond_19

    .line 508
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 510
    const/4 v6, 0x1

    goto :goto_19

    .line 487
    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_4e
        :pswitch_19
        :pswitch_4e
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 537
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 538
    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .registers 5
    .param p1, "finalMatrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v1, 0x0

    .line 245
    if-nez p1, :cond_b

    .line 246
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Matrix cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 249
    .local v0, "imageView":Landroid/widget/ImageView;
    if-nez v0, :cond_12

    .line 259
    :cond_11
    :goto_11
    return v1

    .line 252
    :cond_12
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_11

    .line 255
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 256
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 257
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 259
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 567
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMaximumScale(F)V

    .line 568
    return-void
.end method

.method public setMaximumScale(F)V
    .registers 4
    .param p1, "maximumScale"    # F

    .prologue
    .line 572
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 573
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 574
    return-void
.end method

.method public setMediumScale(F)V
    .registers 4
    .param p1, "mediumScale"    # F

    .prologue
    .line 560
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 561
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 562
    return-void
.end method

.method public setMidScale(F)V
    .registers 2
    .param p1, "midScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 555
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMediumScale(F)V

    .line 556
    return-void
.end method

.method public setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 543
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMinimumScale(F)V

    .line 544
    return-void
.end method

.method public setMinimumScale(F)V
    .registers 4
    .param p1, "minimumScale"    # F

    .prologue
    .line 548
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 549
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 550
    return-void
.end method

.method public final setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 578
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 579
    return-void
.end method

.method public final setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 583
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 584
    return-void
.end method

.method public final setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 588
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 589
    return-void
.end method

.method public final setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 593
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 594
    return-void
.end method

.method public setPhotoViewRotation(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 266
    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    .line 267
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastRotation:F

    sub-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 268
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastRotation:F

    .line 269
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 270
    return-void
.end method

.method public setScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .prologue
    .line 598
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    .line 599
    return-void
.end method

.method public setScale(FFFZ)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 616
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    .line 618
    .local v6, "imageView":Landroid/widget/ImageView;
    if-eqz v6, :cond_1d

    .line 620
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_12

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1e

    .line 621
    :cond_12
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "Scale must be within the range of minScale and maxScale"

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    :cond_1d
    :goto_1d
    return-void

    .line 628
    :cond_1e
    if-eqz p4, :cond_31

    .line 629
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

    .line 632
    :cond_31
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 633
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    goto :goto_1d
.end method

.method public setScale(FZ)V
    .registers 6
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 603
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 605
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_17

    .line 606
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p0, p1, v1, v2, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 611
    :cond_17
    return-void
.end method

.method public final setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 640
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_f

    .line 641
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 644
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 646
    :cond_f
    return-void
.end method

.method public final setZoomable(Z)V
    .registers 2
    .param p1, "zoomable"    # Z

    .prologue
    .line 650
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    .line 651
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 652
    return-void
.end method

.method public final update()V
    .registers 3

    .prologue
    .line 655
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 657
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_14

    .line 658
    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_15

    .line 660
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 663
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 669
    :cond_14
    :goto_14
    return-void

    .line 666
    :cond_15
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_14
.end method
