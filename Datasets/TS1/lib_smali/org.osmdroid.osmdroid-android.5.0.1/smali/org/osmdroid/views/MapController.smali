.class public Lorg/osmdroid/views/MapController;
.super Ljava/lang/Object;
.source "MapController.java"

# interfaces
.implements Lorg/osmdroid/api/IMapController;
.implements Lorg/osmdroid/views/util/constants/MapViewConstants;
.implements Lorg/osmdroid/views/MapView$OnFirstLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/MapController$1;,
        Lorg/osmdroid/views/MapController$ReplayController;,
        Lorg/osmdroid/views/MapController$ReplayType;,
        Lorg/osmdroid/views/MapController$MyZoomAnimationListener;,
        Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;,
        Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;
    }
.end annotation


# instance fields
.field isinverted:Z

.field private mCurrentAnimator:Landroid/animation/Animator;

.field protected final mMapView:Lorg/osmdroid/views/MapView;

.field private mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

.field private mZoomInAnimation:Landroid/animation/ValueAnimator;

.field private mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

.field private mZoomOutAnimation:Landroid/animation/ValueAnimator;

.field private mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapView;)V
    .registers 13
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    const-wide/16 v9, 0x1f4

    const/4 v5, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f000000    # 0.5f

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/MapController;->isinverted:Z

    .line 60
    iput-object p1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    .line 63
    new-instance v0, Lorg/osmdroid/views/MapController$ReplayController;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/osmdroid/views/MapController$ReplayController;-><init>(Lorg/osmdroid/views/MapController;Lorg/osmdroid/views/MapController$1;)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    .line 64
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_26

    .line 65
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p0}, Lorg/osmdroid/views/MapView;->addOnFirstLayoutListener(Lorg/osmdroid/views/MapView$OnFirstLayoutListener;)V

    .line 68
    :cond_26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_77

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_ae

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    .line 70
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 71
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 72
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 74
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_b6

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    .line 75
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 77
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 88
    :goto_76
    return-void

    .line 79
    :cond_77
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v3, v1

    move v4, v2

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 81
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v2, v6

    move v3, v1

    move v4, v6

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 83
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9, v10}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 84
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9, v10}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 85
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 86
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_76

    .line 69
    nop

    :array_ae
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data

    .line 74
    :array_b6
    .array-data 4
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
    .end array-data
.end method


# virtual methods
.method public animateTo(II)V
    .registers 10
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_e

    .line 151
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(II)V

    .line 166
    :cond_d
    :goto_d
    return-void

    .line 155
    :cond_e
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_d

    .line 156
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v3, 0x0

    iput-boolean v3, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 157
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, p1, p2, v3}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v6

    .line 159
    .local v6, "mercatorPoint":Landroid/graphics/Point;
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v0

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v3

    neg-int v3, v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v6, v0, v3}, Landroid/graphics/Point;->offset(II)V

    .line 160
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v1

    .line 161
    .local v1, "xStart":I
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v2

    .line 162
    .local v2, "yStart":I
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v0

    iget v3, v6, Landroid/graphics/Point;->x:I

    sub-int/2addr v3, v1

    iget v4, v6, Landroid/graphics/Point;->y:I

    sub-int/2addr v4, v2

    const/16 v5, 0x3e8

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 164
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    goto :goto_d
.end method

.method public animateTo(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 5
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 137
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_e

    .line 138
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 143
    :goto_d
    return-void

    .line 141
    :cond_e
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 142
    .local v0, "p":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, v1, v2}, Lorg/osmdroid/views/MapController;->animateTo(II)V

    goto :goto_d
.end method

.method public isInvertedTiles()Z
    .registers 2

    .prologue
    .line 436
    iget-boolean v0, p0, Lorg/osmdroid/views/MapController;->isinverted:Z

    return v0
.end method

.method protected onAnimationEnd()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 307
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 308
    .local v1, "screenRect":Landroid/graphics/Rect;
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/osmdroid/views/Projection;->unrotateAndScalePoint(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 310
    .local v0, "p":Landroid/graphics/Point;
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 312
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v3

    neg-int v3, v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Point;->offset(II)V

    .line 313
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 314
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    .line 315
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {p0, v2}, Lorg/osmdroid/views/MapController;->setZoom(I)I

    .line 316
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 317
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_6a

    .line 318
    iput-object v5, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 322
    :cond_6a
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_7f

    .line 323
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    .line 324
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 325
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 327
    :cond_7f
    return-void
.end method

.method protected onAnimationStart()V
    .registers 3

    .prologue
    .line 303
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v0, v0, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 304
    return-void
.end method

.method public onFirstLayout(Landroid/view/View;IIII)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController$ReplayController;->replayCalls()V

    .line 93
    return-void
.end method

.method public scrollBy(II)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapView;->scrollBy(II)V

    .line 171
    return-void
.end method

.method public setCenter(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 7
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    const/4 v4, 0x0

    .line 179
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v1, :cond_15

    .line 180
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    new-instance v2, Lorg/osmdroid/events/ScrollEvent;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-direct {v2, v3, v4, v4}, Lorg/osmdroid/events/ScrollEvent;-><init>(Lorg/osmdroid/views/MapView;II)V

    invoke-interface {v1, v2}, Lorg/osmdroid/events/MapListener;->onScroll(Lorg/osmdroid/events/ScrollEvent;)Z

    .line 182
    :cond_15
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_23

    .line 183
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 192
    :goto_22
    return-void

    .line 187
    :cond_23
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 188
    .local v0, "p":Landroid/graphics/Point;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 190
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Point;->offset(II)V

    .line 191
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    goto :goto_22
.end method

.method public setInvertedTiles(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 448
    iput-boolean p1, p0, Lorg/osmdroid/views/MapController;->isinverted:Z

    .line 449
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 450
    return-void
.end method

.method public setZoom(I)I
    .registers 3
    .param p1, "zoomlevel"    # I

    .prologue
    .line 233
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    move-result v0

    return v0
.end method

.method public stopAnimation(Z)V
    .registers 5
    .param p1, "jumpToTarget"    # Z

    .prologue
    .line 208
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 209
    if-eqz p1, :cond_32

    .line 210
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 211
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 219
    :cond_1c
    :goto_1c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_36

    .line 220
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 221
    .local v0, "currentAnimator":Landroid/animation/Animator;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 222
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 229
    .end local v0    # "currentAnimator":Landroid/animation/Animator;
    :cond_31
    :goto_31
    return-void

    .line 213
    :cond_32
    invoke-virtual {p0}, Lorg/osmdroid/views/MapController;->stopPanning()V

    goto :goto_1c

    .line 225
    :cond_36
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 226
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    goto :goto_31
.end method

.method public stopPanning()V
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 197
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 198
    return-void
.end method

.method public zoomIn()Z
    .registers 3

    .prologue
    .line 241
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapController;->zoomInFixing(II)Z

    move-result v0

    return v0
.end method

.method public zoomInFixing(II)Z
    .registers 9
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 246
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 247
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 248
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v2, :cond_2f

    .line 249
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    new-instance v3, Lorg/osmdroid/events/ZoomEvent;

    iget-object v4, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v5, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-direct {v3, v4, v5}, Lorg/osmdroid/events/ZoomEvent;-><init>(Lorg/osmdroid/views/MapView;I)V

    invoke-interface {v2, v3}, Lorg/osmdroid/events/MapListener;->onZoom(Lorg/osmdroid/events/ZoomEvent;)Z

    .line 251
    :cond_2f
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 265
    :cond_39
    :goto_39
    return v0

    .line 255
    :cond_3a
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 256
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_5a

    .line 257
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 258
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_58
    move v0, v1

    .line 262
    goto :goto_39

    .line 260
    :cond_5a
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_58
.end method

.method public zoomOut()Z
    .registers 3

    .prologue
    .line 274
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapController;->zoomOutFixing(II)Z

    move-result v0

    return v0
.end method

.method public zoomOutFixing(II)Z
    .registers 9
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 279
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 280
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 281
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v2, :cond_2f

    .line 282
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    new-instance v3, Lorg/osmdroid/events/ZoomEvent;

    iget-object v4, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v5, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-direct {v3, v4, v5}, Lorg/osmdroid/events/ZoomEvent;-><init>(Lorg/osmdroid/views/MapView;I)V

    invoke-interface {v2, v3}, Lorg/osmdroid/events/MapListener;->onZoom(Lorg/osmdroid/events/ZoomEvent;)Z

    .line 284
    :cond_2f
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 298
    :cond_39
    :goto_39
    return v0

    .line 288
    :cond_3a
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 289
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_5a

    .line 290
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 291
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_58
    move v0, v1

    .line 295
    goto :goto_39

    .line 293
    :cond_5a
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_58
.end method

.method public zoomToSpan(II)V
    .registers 15
    .param p1, "latSpanE6"    # I
    .param p2, "lonSpanE6"    # I

    .prologue
    const/high16 v11, 0x3f800000    # 1.0f

    .line 102
    if-lez p1, :cond_6

    if-gtz p2, :cond_7

    .line 129
    :cond_6
    :goto_6
    return-void

    .line 107
    :cond_7
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v7

    if-nez v7, :cond_15

    .line 108
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v7, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->zoomToSpan(II)V

    goto :goto_6

    .line 112
    :cond_15
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    .line 113
    .local v0, "bb":Lorg/osmdroid/util/BoundingBoxE6;
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    .line 115
    .local v3, "curZoomLevel":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v1

    .line 116
    .local v1, "curLatSpan":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v2

    .line 118
    .local v2, "curLonSpan":I
    int-to-float v7, p1

    int-to-float v8, v1

    div-float v5, v7, v8

    .line 119
    .local v5, "diffNeededLat":F
    int-to-float v7, p2

    int-to-float v8, v2

    div-float v6, v7, v8

    .line 121
    .local v6, "diffNeededLon":F
    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 123
    .local v4, "diffNeeded":F
    cmpl-float v7, v4, v11

    if-lez v7, :cond_4d

    .line 124
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-static {v4}, Lorg/osmdroid/views/util/MyMath;->getNextSquareNumberAbove(F)I

    move-result v8

    sub-int v8, v3, v8

    invoke-virtual {v7, v8}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    goto :goto_6

    .line 125
    :cond_4d
    float-to-double v7, v4

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    cmpg-double v7, v7, v9

    if-gez v7, :cond_6

    .line 126
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    div-float v8, v11, v4

    invoke-static {v8}, Lorg/osmdroid/views/util/MyMath;->getNextSquareNumberAbove(F)I

    move-result v8

    add-int/2addr v8, v3

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    goto :goto_6
.end method

.method public zoomToSpan(Lorg/osmdroid/util/BoundingBoxE6;)V
    .registers 4
    .param p1, "bb"    # Lorg/osmdroid/util/BoundingBoxE6;

    .prologue
    .line 96
    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v0

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapController;->zoomToSpan(II)V

    .line 97
    return-void
.end method
