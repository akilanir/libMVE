.class public Lorg/osmdroid/views/MapController;
.super Ljava/lang/Object;
.source "MapController.java"

# interfaces
.implements Lorg/osmdroid/api/IMapController;
.implements Lorg/osmdroid/views/MapView$OnFirstLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/MapController$1;,
        Lorg/osmdroid/views/MapController$ReplayController;,
        Lorg/osmdroid/views/MapController$ReplayType;,
        Lorg/osmdroid/views/MapController$ZoomAnimationListener;,
        Lorg/osmdroid/views/MapController$ZoomAnimatorListener;
    }
.end annotation


# instance fields
.field private mCurrentAnimator:Landroid/animation/Animator;

.field protected final mMapView:Lorg/osmdroid/views/MapView;

.field private mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

.field private mZoomInAnimation:Landroid/animation/ValueAnimator;

.field private mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

.field private mZoomOutAnimation:Landroid/animation/ValueAnimator;

.field private mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapView;)V
    .registers 15
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    const-wide/16 v11, 0x1f4

    const/4 v5, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f000000    # 0.5f

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    .line 64
    new-instance v0, Lorg/osmdroid/views/MapController$ReplayController;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/osmdroid/views/MapController$ReplayController;-><init>(Lorg/osmdroid/views/MapController;Lorg/osmdroid/views/MapController$1;)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    .line 65
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_23

    .line 66
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p0}, Lorg/osmdroid/views/MapView;->addOnFirstLayoutListener(Lorg/osmdroid/views/MapView$OnFirstLayoutListener;)V

    .line 70
    :cond_23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_65

    .line 71
    new-instance v10, Lorg/osmdroid/views/MapController$ZoomAnimatorListener;

    invoke-direct {v10, p0}, Lorg/osmdroid/views/MapController$ZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    .line 72
    .local v10, "zoomAnimatorListener":Lorg/osmdroid/views/MapController$ZoomAnimatorListener;
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_96

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    .line 73
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v10}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v10}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 75
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v11, v12}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_9e

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    .line 78
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v10}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 79
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v10}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 80
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v11, v12}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 92
    .end local v10    # "zoomAnimatorListener":Lorg/osmdroid/views/MapController$ZoomAnimatorListener;
    :goto_64
    return-void

    .line 82
    :cond_65
    new-instance v9, Lorg/osmdroid/views/MapController$ZoomAnimationListener;

    invoke-direct {v9, p0}, Lorg/osmdroid/views/MapController$ZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    .line 83
    .local v9, "zoomAnimationListener":Lorg/osmdroid/views/MapController$ZoomAnimationListener;
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v3, v1

    move v4, v2

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 85
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v2, v6

    move v3, v1

    move v4, v6

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 87
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v11, v12}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 88
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v11, v12}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 89
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 90
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_64

    .line 72
    :array_96
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data

    .line 77
    :array_9e
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
    .line 154
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_e

    .line 155
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(II)V

    .line 170
    :cond_d
    :goto_d
    return-void

    .line 159
    :cond_e
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_d

    .line 160
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v3, 0x0

    iput-boolean v3, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 161
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, p1, p2, v3}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v6

    .line 163
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

    .line 164
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v1

    .line 165
    .local v1, "xStart":I
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v2

    .line 166
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

    .line 168
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    goto :goto_d
.end method

.method public animateTo(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 5
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 141
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_e

    .line 142
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 147
    :goto_d
    return-void

    .line 145
    :cond_e
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 146
    .local v0, "p":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, v1, v2}, Lorg/osmdroid/views/MapController;->animateTo(II)V

    goto :goto_d
.end method

.method protected onAnimationEnd()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 377
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 378
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

    .line 380
    .local v0, "p":Landroid/graphics/Point;
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 382
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

    .line 383
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 384
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    .line 385
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {p0, v2}, Lorg/osmdroid/views/MapController;->setZoom(I)I

    .line 386
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 387
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_6a

    .line 388
    iput-object v5, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 392
    :cond_6a
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_7f

    .line 393
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    .line 394
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 395
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 397
    :cond_7f
    return-void
.end method

.method protected onAnimationStart()V
    .registers 3

    .prologue
    .line 373
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v0, v0, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 374
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
    .line 96
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController$ReplayController;->replayCalls()V

    .line 97
    return-void
.end method

.method public scrollBy(II)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapView;->scrollBy(II)V

    .line 175
    return-void
.end method

.method public setCenter(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 7
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    const/4 v4, 0x0

    .line 183
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v1, :cond_15

    .line 184
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    new-instance v2, Lorg/osmdroid/events/ScrollEvent;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-direct {v2, v3, v4, v4}, Lorg/osmdroid/events/ScrollEvent;-><init>(Lorg/osmdroid/views/MapView;II)V

    invoke-interface {v1, v2}, Lorg/osmdroid/events/MapListener;->onScroll(Lorg/osmdroid/events/ScrollEvent;)Z

    .line 186
    :cond_15
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_23

    .line 187
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 196
    :goto_22
    return-void

    .line 191
    :cond_23
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 192
    .local v0, "p":Landroid/graphics/Point;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 194
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

    .line 195
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    goto :goto_22
.end method

.method public setZoom(I)I
    .registers 3
    .param p1, "zoomlevel"    # I

    .prologue
    .line 237
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    move-result v0

    return v0
.end method

.method public stopAnimation(Z)V
    .registers 5
    .param p1, "jumpToTarget"    # Z

    .prologue
    .line 212
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 213
    if-eqz p1, :cond_32

    .line 214
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 215
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 223
    :cond_1c
    :goto_1c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_36

    .line 224
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 225
    .local v0, "currentAnimator":Landroid/animation/Animator;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 226
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 233
    .end local v0    # "currentAnimator":Landroid/animation/Animator;
    :cond_31
    :goto_31
    return-void

    .line 217
    :cond_32
    invoke-virtual {p0}, Lorg/osmdroid/views/MapController;->stopPanning()V

    goto :goto_1c

    .line 229
    :cond_36
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 230
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    goto :goto_31
.end method

.method public stopPanning()V
    .registers 3

    .prologue
    .line 200
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 201
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 202
    return-void
.end method

.method public zoomIn()Z
    .registers 3

    .prologue
    .line 245
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapController;->zoomTo(I)Z

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

    .line 250
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 251
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 252
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v2, :cond_2f

    .line 253
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

    .line 255
    :cond_2f
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 269
    :cond_39
    :goto_39
    return v0

    .line 259
    :cond_3a
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 260
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_5a

    .line 261
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 262
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_58
    move v0, v1

    .line 266
    goto :goto_39

    .line 264
    :cond_5a
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_58
.end method

.method public zoomOut()Z
    .registers 3

    .prologue
    .line 278
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapController;->zoomTo(I)Z

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

    .line 283
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 284
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 285
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v2, :cond_2f

    .line 286
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

    .line 288
    :cond_2f
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 302
    :cond_39
    :goto_39
    return v0

    .line 292
    :cond_3a
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 293
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_5a

    .line 294
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 295
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_58
    move v0, v1

    .line 299
    goto :goto_39

    .line 297
    :cond_5a
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_58
.end method

.method public zoomTo(I)Z
    .registers 4
    .param p1, "zoomLevel"    # I

    .prologue
    .line 308
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lorg/osmdroid/views/MapController;->zoomToFixing(III)Z

    move-result v0

    return v0
.end method

.method public zoomToFixing(III)Z
    .registers 19
    .param p1, "zoomLevel"    # I
    .param p2, "xPixel"    # I
    .param p3, "yPixel"    # I

    .prologue
    .line 313
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v2

    move/from16 v0, p1

    if-le v0, v2, :cond_10

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result p1

    .line 314
    :cond_10
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMinZoomLevel()I

    move-result v2

    move/from16 v0, p1

    if-ge v0, v2, :cond_20

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMinZoomLevel()I

    move-result p1

    .line 316
    :cond_20
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v11

    .line 317
    .local v11, "currentZoomLevel":I
    move/from16 v0, p1

    if-ge v0, v11, :cond_32

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v2

    if-nez v2, :cond_3e

    :cond_32
    move/from16 v0, p1

    if-le v0, v11, :cond_71

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v2

    if-eqz v2, :cond_71

    :cond_3e
    const/4 v10, 0x1

    .line 320
    .local v10, "canZoom":Z
    :goto_3f
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    move/from16 v0, p2

    int-to-float v4, v0

    move/from16 v0, p3

    int-to-float v5, v0

    invoke-virtual {v2, v4, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 321
    if-eqz v10, :cond_100

    .line 322
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v2, :cond_64

    .line 323
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    new-instance v4, Lorg/osmdroid/events/ZoomEvent;

    iget-object v5, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    move/from16 v0, p1

    invoke-direct {v4, v5, v0}, Lorg/osmdroid/events/ZoomEvent;-><init>(Lorg/osmdroid/views/MapView;I)V

    invoke-interface {v2, v4}, Lorg/osmdroid/events/MapListener;->onZoom(Lorg/osmdroid/events/ZoomEvent;)Z

    .line 325
    :cond_64
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_73

    .line 327
    const/4 v2, 0x0

    .line 367
    :goto_70
    return v2

    .line 317
    .end local v10    # "canZoom":Z
    :cond_71
    const/4 v10, 0x0

    goto :goto_3f

    .line 329
    .restart local v10    # "canZoom":Z
    :cond_73
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 331
    move/from16 v0, p1

    if-ge v0, v11, :cond_cb

    sub-int v2, v11, p1

    int-to-float v12, v2

    .line 335
    .local v12, "difference":F
    :goto_83
    move/from16 v0, p1

    if-ge v0, v11, :cond_cf

    const/high16 v2, 0x3f800000    # 1.0f

    float-to-double v4, v12

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v4, v4

    div-float v3, v2, v4

    .line 339
    .local v3, "end":F
    :goto_93
    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, v12, v2

    if-nez v2, :cond_9f

    move/from16 v0, p1

    if-ge v0, v11, :cond_d8

    const/high16 v3, 0x3f000000    # 0.5f

    .line 342
    :cond_9f
    :goto_9f
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v2, v4, :cond_db

    .line 343
    new-instance v13, Lorg/osmdroid/views/MapController$ZoomAnimatorListener;

    invoke-direct {v13, p0}, Lorg/osmdroid/views/MapController$ZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    .line 344
    .local v13, "zoomAnimatorListener":Lorg/osmdroid/views/MapController$ZoomAnimatorListener;
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    aput v5, v2, v4

    const/4 v4, 0x1

    aput v3, v2, v4

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v14

    .line 345
    .local v14, "zoomToAnimator":Landroid/animation/ValueAnimator;
    invoke-virtual {v14, v13}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 346
    invoke-virtual {v14, v13}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 347
    const-wide/16 v4, 0x1f4

    invoke-virtual {v14, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 349
    iput-object v14, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 350
    invoke-virtual {v14}, Landroid/animation/ValueAnimator;->start()V

    .line 364
    .end local v13    # "zoomAnimatorListener":Lorg/osmdroid/views/MapController$ZoomAnimatorListener;
    .end local v14    # "zoomToAnimator":Landroid/animation/ValueAnimator;
    :goto_c9
    const/4 v2, 0x1

    goto :goto_70

    .line 331
    .end local v3    # "end":F
    .end local v12    # "difference":F
    :cond_cb
    sub-int v2, p1, v11

    int-to-float v12, v2

    goto :goto_83

    .line 335
    .restart local v12    # "difference":F
    :cond_cf
    float-to-double v4, v12

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v3, v4

    goto :goto_93

    .line 339
    .restart local v3    # "end":F
    :cond_d8
    const/high16 v3, 0x40000000    # 2.0f

    goto :goto_9f

    .line 352
    :cond_db
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v4, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2, v4}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 355
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x1

    const/high16 v7, 0x3f000000    # 0.5f

    const/4 v8, 0x1

    const/high16 v9, 0x3f000000    # 0.5f

    move v5, v3

    invoke-direct/range {v1 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 360
    .local v1, "scaleAnimation":Landroid/view/animation/ScaleAnimation;
    const-wide/16 v4, 0x1f4

    invoke-virtual {v1, v4, v5}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 361
    new-instance v2, Lorg/osmdroid/views/MapController$ZoomAnimationListener;

    invoke-direct {v2, p0}, Lorg/osmdroid/views/MapController$ZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v1, v2}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_c9

    .line 367
    .end local v1    # "scaleAnimation":Landroid/view/animation/ScaleAnimation;
    .end local v3    # "end":F
    .end local v12    # "difference":F
    :cond_100
    const/4 v2, 0x0

    goto/16 :goto_70
.end method

.method public zoomToSpan(II)V
    .registers 15
    .param p1, "latSpanE6"    # I
    .param p2, "lonSpanE6"    # I

    .prologue
    const/high16 v11, 0x3f800000    # 1.0f

    .line 106
    if-lez p1, :cond_6

    if-gtz p2, :cond_7

    .line 133
    :cond_6
    :goto_6
    return-void

    .line 111
    :cond_7
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v7

    if-nez v7, :cond_15

    .line 112
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v7, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->zoomToSpan(II)V

    goto :goto_6

    .line 116
    :cond_15
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    .line 117
    .local v0, "bb":Lorg/osmdroid/util/BoundingBoxE6;
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    .line 119
    .local v3, "curZoomLevel":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v1

    .line 120
    .local v1, "curLatSpan":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v2

    .line 122
    .local v2, "curLonSpan":I
    int-to-float v7, p1

    int-to-float v8, v1

    div-float v5, v7, v8

    .line 123
    .local v5, "diffNeededLat":F
    int-to-float v7, p2

    int-to-float v8, v2

    div-float v6, v7, v8

    .line 125
    .local v6, "diffNeededLon":F
    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 127
    .local v4, "diffNeeded":F
    cmpl-float v7, v4, v11

    if-lez v7, :cond_4d

    .line 128
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-static {v4}, Lorg/osmdroid/views/util/MyMath;->getNextSquareNumberAbove(F)I

    move-result v8

    sub-int v8, v3, v8

    invoke-virtual {v7, v8}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    goto :goto_6

    .line 129
    :cond_4d
    float-to-double v7, v4

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    cmpg-double v7, v7, v9

    if-gez v7, :cond_6

    .line 130
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
    .line 100
    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v0

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapController;->zoomToSpan(II)V

    .line 101
    return-void
.end method
