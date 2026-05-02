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

.field static final EDGE_BOTH:I = 0x2

.field static final EDGE_LEFT:I = 0x0

.field static final EDGE_NONE:I = -0x1

.field static final EDGE_RIGHT:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "PhotoViewAttacher"

.field static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field ZOOM_DURATION:I

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

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/16 v1, 0xc8

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 66
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 67
    const/high16 v1, 0x3fe00000    # 1.75f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 68
    const/high16 v1, 0x40400000    # 3.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 70
    iput-boolean v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 130
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 131
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 132
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 133
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 134
    const/16 v1, 0x9

    new-array v1, v1, [F

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    .line 144
    const/4 v1, 0x2

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 147
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 150
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 152
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setDrawingCacheEnabled(Z)V

    .line 153
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 155
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 156
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_55

    .line 157
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 160
    :cond_55
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 162
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_5f

    .line 185
    :goto_5e
    return-void

    .line 166
    :cond_5f
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p0}, Luk/co/senab/photoview/gestures/VersionedGestureDetector;->newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    .line 169
    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Luk/co/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v3, p0}, Luk/co/senab/photoview/PhotoViewAttacher$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 181
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v2, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v2, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v1, v2}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 184
    invoke-virtual {p0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    goto :goto_5e
.end method

.method static synthetic access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 48
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$100(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 48
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$200(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 1
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 48
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method static synthetic access$300()Z
    .registers 1

    .prologue
    .line 48
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .registers 2
    .param p0, "x0"    # Luk/co/senab/photoview/PhotoViewAttacher;
    .param p1, "x1"    # Landroid/graphics/Matrix;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private cancelFling()V
    .registers 2

    .prologue
    .line 660
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_c

    .line 661
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    .line 662
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 664
    :cond_c
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .registers 2

    .prologue
    .line 670
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 671
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 673
    :cond_d
    return-void
.end method

.method private checkImageViewScaleType()V
    .registers 4

    .prologue
    .line 676
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 682
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1e

    instance-of v1, v0, Luk/co/senab/photoview/IPhotoView;

    if-nez v1, :cond_1e

    .line 683
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 684
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 688
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

    .line 691
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 692
    .local v3, "imageView":Landroid/widget/ImageView;
    if-nez v3, :cond_c

    .line 749
    :cond_b
    :goto_b
    return v8

    .line 696
    :cond_c
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    invoke-direct {p0, v10}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 697
    .local v4, "rect":Landroid/graphics/RectF;
    if-eqz v4, :cond_b

    .line 701
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v2

    .local v2, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 702
    .local v7, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 704
    .local v1, "deltaY":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v5

    .line 705
    .local v5, "viewHeight":I
    int-to-float v10, v5

    cmpg-float v10, v2, v10

    if-gtz v10, :cond_6f

    .line 706
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_b0

    .line 714
    int-to-float v10, v5

    sub-float/2addr v10, v2

    div-float/2addr v10, v13

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 723
    :cond_3d
    :goto_3d
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v6

    .line 724
    .local v6, "viewWidth":I
    int-to-float v10, v6

    cmpg-float v10, v7, v10

    if-gtz v10, :cond_91

    .line 725
    sget-object v8, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v10

    aget v8, v8, v10

    packed-switch v8, :pswitch_data_b8

    .line 733
    int-to-float v8, v6

    sub-float/2addr v8, v7

    div-float/2addr v8, v13

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 736
    :goto_5a
    const/4 v8, 0x2

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 748
    :goto_5d
    iget-object v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    move v8, v9

    .line 749
    goto :goto_b

    .line 708
    .end local v6    # "viewWidth":I
    :pswitch_64
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    .line 709
    goto :goto_3d

    .line 711
    :pswitch_68
    int-to-float v10, v5

    sub-float/2addr v10, v2

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 712
    goto :goto_3d

    .line 717
    :cond_6f
    iget v10, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_79

    .line 718
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    goto :goto_3d

    .line 719
    :cond_79
    iget v10, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v11, v5

    cmpg-float v10, v10, v11

    if-gez v10, :cond_3d

    .line 720
    int-to-float v10, v5

    iget v11, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v10, v11

    goto :goto_3d

    .line 727
    .restart local v6    # "viewWidth":I
    :pswitch_86
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 728
    goto :goto_5a

    .line 730
    :pswitch_8a
    int-to-float v8, v6

    sub-float/2addr v8, v7

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 731
    goto :goto_5a

    .line 737
    :cond_91
    iget v10, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_9d

    .line 738
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 739
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    goto :goto_5d

    .line 740
    :cond_9d
    iget v8, v4, Landroid/graphics/RectF;->right:F

    int-to-float v10, v6

    cmpg-float v8, v8, v10

    if-gez v8, :cond_ac

    .line 741
    int-to-float v8, v6

    iget v10, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v8, v10

    .line 742
    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 744
    :cond_ac
    const/4 v8, -0x1

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5d

    .line 706
    :pswitch_data_b0
    .packed-switch 0x2
        :pswitch_64
        :pswitch_68
    .end packed-switch

    .line 725
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
    .line 74
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_c

    .line 75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MinZoom has to be less than MidZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_c
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_18

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MidZoom has to be less than MaxZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_18
    return-void
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 8
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v5, 0x0

    .line 759
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 761
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_24

    .line 762
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 763
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_24

    .line 764
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 766
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 767
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 770
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
    .line 902
    if-nez p1, :cond_4

    .line 903
    const/4 v0, 0x0

    .line 904
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
    .line 896
    if-nez p1, :cond_4

    .line 897
    const/4 v0, 0x0

    .line 898
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
    .line 798
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 799
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 87
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
    .line 94
    if-nez p0, :cond_4

    .line 95
    const/4 v0, 0x0

    .line 104
    :goto_3
    return v0

    .line 98
    :cond_4
    sget-object v0, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    .line 104
    const/4 v0, 0x1

    goto :goto_3

    .line 100
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

    .line 98
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method

.method private resetMatrix()V
    .registers 2

    .prologue
    .line 806
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 807
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 808
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 809
    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 812
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 813
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_1b

    .line 815
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    .line 816
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 819
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    if-eqz v2, :cond_1b

    .line 820
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    .line 821
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_1b

    .line 822
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    .line 826
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    :cond_1b
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .registers 3
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 116
    if-eqz p0, :cond_17

    instance-of v0, p0, Luk/co/senab/photoview/IPhotoView;

    if-nez v0, :cond_17

    .line 117
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 118
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 121
    :cond_17
    return-void
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V
    .registers 16
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v12, 0x0

    const/high16 v13, 0x40000000    # 2.0f

    .line 834
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 835
    .local v3, "imageView":Landroid/widget/ImageView;
    if-eqz v3, :cond_b

    if-nez p1, :cond_c

    .line 893
    :cond_b
    :goto_b
    return-void

    .line 839
    :cond_c
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v8, v10

    .line 840
    .local v8, "viewWidth":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v7, v10

    .line 841
    .local v7, "viewHeight":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 842
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 844
    .local v0, "drawableHeight":I
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 846
    int-to-float v10, v1

    div-float v9, v8, v10

    .line 847
    .local v9, "widthScale":F
    int-to-float v10, v0

    div-float v2, v7, v10

    .line 849
    .local v2, "heightScale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_40

    .line 850
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 892
    :goto_3c
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_b

    .line 853
    :cond_40
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_5f

    .line 854
    invoke-static {v9, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 855
    .local v6, "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 856
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

    .line 859
    .end local v6    # "scale":F
    :cond_5f
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_84

    .line 860
    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 861
    .restart local v6    # "scale":F
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

    .line 866
    .end local v6    # "scale":F
    :cond_84
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v10, v1

    int-to-float v11, v0

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 867
    .local v5, "mTempSrc":Landroid/graphics/RectF;
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v12, v12, v8, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 869
    .local v4, "mTempDst":Landroid/graphics/RectF;
    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_c0

    goto :goto_3c

    .line 876
    :pswitch_9e
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 871
    :pswitch_a6
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 880
    :pswitch_ae
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 884
    :pswitch_b6
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 869
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
.method public canZoom()Z
    .registers 2

    .prologue
    .line 197
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    return v0
.end method

.method public cleanup()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 208
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_6

    .line 239
    :goto_5
    return-void

    .line 212
    :cond_6
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 214
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_25

    .line 216
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 217
    .local v1, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v1, :cond_1f

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 218
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 222
    :cond_1f
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 225
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    .line 228
    .end local v1    # "observer":Landroid/view/ViewTreeObserver;
    :cond_25
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v2, :cond_2e

    .line 229
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v3}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 233
    :cond_2e
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 234
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 235
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 238
    iput-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    goto :goto_5
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 650
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 243
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 244
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDrawMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 654
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 655
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 656
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getIPhotoViewImplementation()Luk/co/senab/photoview/IPhotoView;
    .registers 1

    .prologue
    .line 787
    return-object p0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .registers 4

    .prologue
    .line 288
    const/4 v0, 0x0

    .line 290
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_d

    .line 291
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "imageView":Landroid/widget/ImageView;
    check-cast v0, Landroid/widget/ImageView;

    .line 295
    .restart local v0    # "imageView":Landroid/widget/ImageView;
    :cond_d
    if-nez v0, :cond_19

    .line 296
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 297
    const-string v1, "PhotoViewAttacher"

    const-string v2, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    :cond_19
    return-object v0
.end method

.method public getMaxScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 329
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMaximumScale()F
    .registers 2

    .prologue
    .line 334
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .registers 2

    .prologue
    .line 323
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMidScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 318
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 307
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .registers 2

    .prologue
    .line 312
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .registers 2

    .prologue
    .line 560
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .registers 2

    .prologue
    .line 570
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    return-object v0
.end method

.method public getScale()F
    .registers 6

    .prologue
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 339
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

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    .line 774
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 775
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

    .line 349
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 384
    :cond_b
    :goto_b
    return-void

    .line 353
    :cond_c
    sget-boolean v2, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v2, :cond_2d

    .line 354
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "PhotoViewAttacher"

    const-string v4, "onDrag: dx: %.2f. dy: %.2f"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    :cond_2d
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 359
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 360
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 371
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 372
    .local v1, "parent":Landroid/view/ViewParent;
    iget-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v2, :cond_67

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_67

    .line 373
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-eq v2, v9, :cond_61

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-nez v2, :cond_57

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v2

    if-gez v2, :cond_61

    :cond_57
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-ne v2, v7, :cond_b

    const/high16 v2, -0x40800000    # -1.0f

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_b

    .line 376
    :cond_61
    if-eqz v1, :cond_b

    .line 377
    invoke-interface {v1, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_b

    .line 380
    :cond_67
    if-eqz v1, :cond_b

    .line 381
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
    .line 389
    sget-boolean v1, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_3e

    .line 390
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

    .line 395
    :cond_3e
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 396
    .local v0, "imageView":Landroid/widget/ImageView;
    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 397
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    invoke-virtual {v1, v2, v3, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    .line 399
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 400
    return-void
.end method

.method public onGlobalLayout()V
    .registers 7

    .prologue
    .line 404
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 406
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    .line 407
    iget-boolean v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v5, :cond_3a

    .line 408
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTop()I

    move-result v4

    .line 409
    .local v4, "top":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getRight()I

    move-result v3

    .line 410
    .local v3, "right":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    .line 411
    .local v0, "bottom":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLeft()I

    move-result v2

    .line 420
    .local v2, "left":I
    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v4, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v2, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v3, v5, :cond_39

    .line 423
    :cond_2a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 426
    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    .line 427
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    .line 428
    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    .line 429
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    .line 435
    .end local v0    # "bottom":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    .end local v4    # "top":I
    :cond_39
    :goto_39
    return-void

    .line 432
    :cond_3a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    goto :goto_39
.end method

.method public onScale(FFF)V
    .registers 10
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 439
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_2b

    .line 440
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

    .line 446
    :cond_2b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_3b

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_43

    .line 447
    :cond_3b
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 448
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 450
    :cond_43
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 454
    const/4 v6, 0x0

    .line 456
    .local v6, "handled":Z
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_33

    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 457
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    .line 458
    .local v7, "parent":Landroid/view/ViewParent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_70

    .line 488
    :cond_19
    :goto_19
    :pswitch_19
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_26

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0, p2}, Luk/co/senab/photoview/gestures/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 490
    const/4 v6, 0x1

    .line 494
    :cond_26
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_33

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 495
    const/4 v6, 0x1

    .line 499
    .end local v7    # "parent":Landroid/view/ViewParent;
    :cond_33
    return v6

    .line 462
    .restart local v7    # "parent":Landroid/view/ViewParent;
    :pswitch_34
    if-eqz v7, :cond_3e

    .line 463
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 469
    :goto_3a
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    goto :goto_19

    .line 465
    :cond_3e
    const-string v0, "PhotoViewAttacher"

    const-string v1, "onTouch getParent() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3a

    .line 476
    :pswitch_46
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_19

    .line 477
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v8

    .line 478
    .local v8, "rect":Landroid/graphics/RectF;
    if-eqz v8, :cond_19

    .line 479
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

    .line 481
    const/4 v6, 0x1

    goto :goto_19

    .line 458
    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_34
        :pswitch_46
        :pswitch_19
        :pswitch_46
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 504
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 505
    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .registers 5
    .param p1, "finalMatrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v1, 0x0

    .line 249
    if-nez p1, :cond_b

    .line 250
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Matrix cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    :cond_b
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 253
    .local v0, "imageView":Landroid/widget/ImageView;
    if-nez v0, :cond_12

    .line 263
    :cond_11
    :goto_11
    return v1

    .line 256
    :cond_12
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_11

    .line 259
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 260
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 261
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 263
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 534
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMaximumScale(F)V

    .line 535
    return-void
.end method

.method public setMaximumScale(F)V
    .registers 4
    .param p1, "maximumScale"    # F

    .prologue
    .line 539
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 540
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 541
    return-void
.end method

.method public setMediumScale(F)V
    .registers 4
    .param p1, "mediumScale"    # F

    .prologue
    .line 527
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 528
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 529
    return-void
.end method

.method public setMidScale(F)V
    .registers 2
    .param p1, "midScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 522
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMediumScale(F)V

    .line 523
    return-void
.end method

.method public setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 510
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMinimumScale(F)V

    .line 511
    return-void
.end method

.method public setMinimumScale(F)V
    .registers 4
    .param p1, "minimumScale"    # F

    .prologue
    .line 515
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 516
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 517
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .registers 4
    .param p1, "newOnDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 189
    if-eqz p1, :cond_8

    .line 190
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 193
    :goto_7
    return-void

    .line 192
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
    .line 545
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 546
    return-void
.end method

.method public setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 550
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 551
    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 555
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 556
    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 565
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 566
    return-void
.end method

.method public setPhotoViewRotation(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 271
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 272
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 273
    return-void
.end method

.method public setRotationBy(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 283
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 284
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 285
    return-void
.end method

.method public setRotationTo(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 277
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 278
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 279
    return-void
.end method

.method public setScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .prologue
    .line 575
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    .line 576
    return-void
.end method

.method public setScale(FFFZ)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 593
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    .line 595
    .local v6, "imageView":Landroid/widget/ImageView;
    if-eqz v6, :cond_1d

    .line 597
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_12

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1e

    .line 598
    :cond_12
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "Scale must be within the range of minScale and maxScale"

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    :cond_1d
    :goto_1d
    return-void

    .line 605
    :cond_1e
    if-eqz p4, :cond_31

    .line 606
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

    .line 609
    :cond_31
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 610
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    goto :goto_1d
.end method

.method public setScale(FZ)V
    .registers 6
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 580
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 582
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_17

    .line 583
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p0, p1, v1, v2, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 588
    :cond_17
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 617
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_f

    .line 618
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 621
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 623
    :cond_f
    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .registers 2
    .param p1, "milliseconds"    # I

    .prologue
    .line 780
    if-gez p1, :cond_4

    .line 781
    const/16 p1, 0xc8

    .line 782
    :cond_4
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 783
    return-void
.end method

.method public setZoomable(Z)V
    .registers 2
    .param p1, "zoomable"    # Z

    .prologue
    .line 627
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    .line 628
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 629
    return-void
.end method

.method public update()V
    .registers 3

    .prologue
    .line 632
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 634
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_14

    .line 635
    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_15

    .line 637
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 640
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 646
    :cond_14
    :goto_14
    return-void

    .line 643
    :cond_15
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_14
.end method
