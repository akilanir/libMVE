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

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    .line 61
    new-instance v0, Lorg/osmdroid/views/MapController$ReplayController;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/osmdroid/views/MapController$ReplayController;-><init>(Lorg/osmdroid/views/MapController;Lorg/osmdroid/views/MapController$1;)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    .line 62
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_23

    .line 63
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p0}, Lorg/osmdroid/views/MapView;->addOnFirstLayoutListener(Lorg/osmdroid/views/MapView$OnFirstLayoutListener;)V

    .line 66
    :cond_23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_74

    .line 67
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_aa

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    .line 68
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 69
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 70
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 72
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_b2

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    .line 73
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimatorUpdateListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 75
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 86
    :goto_73
    return-void

    .line 77
    :cond_74
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v3, v1

    move v4, v2

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 79
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v2, v6

    move v3, v1

    move v4, v6

    move v7, v5

    move v8, v6

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    .line 81
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9, v10}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 82
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v9, v10}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 83
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 84
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    new-instance v1, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;-><init>(Lorg/osmdroid/views/MapController;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_73

    .line 67
    :array_aa
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data

    .line 72
    :array_b2
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
    .line 148
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_e

    .line 149
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(II)V

    .line 164
    :cond_d
    :goto_d
    return-void

    .line 153
    :cond_e
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_d

    .line 154
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v3, 0x0

    iput-boolean v3, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 155
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, p1, p2, v3}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v6

    .line 157
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

    .line 158
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v1

    .line 159
    .local v1, "xStart":I
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v2

    .line 160
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

    .line 162
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    goto :goto_d
.end method

.method public animateTo(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 5
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 135
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_e

    .line 136
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 141
    :goto_d
    return-void

    .line 139
    :cond_e
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 140
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

    .line 296
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 297
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

    .line 299
    .local v0, "p":Landroid/graphics/Point;
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 301
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

    .line 302
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 303
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    .line 304
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {p0, v2}, Lorg/osmdroid/views/MapController;->setZoom(I)I

    .line 305
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 306
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_6a

    .line 307
    iput-object v5, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 311
    :cond_6a
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_7f

    .line 312
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    .line 313
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 314
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v2}, Landroid/view/animation/ScaleAnimation;->reset()V

    .line 316
    :cond_7f
    return-void
.end method

.method protected onAnimationStart()V
    .registers 3

    .prologue
    .line 292
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v0, v0, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 293
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
    .line 90
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController$ReplayController;->replayCalls()V

    .line 91
    return-void
.end method

.method public scrollBy(II)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/views/MapView;->scrollBy(II)V

    .line 169
    return-void
.end method

.method public setCenter(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 6
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 177
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v1

    if-nez v1, :cond_e

    .line 178
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v1, p1}, Lorg/osmdroid/views/MapController$ReplayController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 187
    :goto_d
    return-void

    .line 182
    :cond_e
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 183
    .local v0, "p":Landroid/graphics/Point;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3, v0}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 185
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

    .line 186
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2, v3}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    goto :goto_d
.end method

.method public setZoom(I)I
    .registers 3
    .param p1, "zoomlevel"    # I

    .prologue
    .line 228
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    move-result v0

    return v0
.end method

.method public stopAnimation(Z)V
    .registers 5
    .param p1, "jumpToTarget"    # Z

    .prologue
    .line 203
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 204
    if-eqz p1, :cond_32

    .line 205
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 206
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 214
    :cond_1c
    :goto_1c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_36

    .line 215
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 216
    .local v0, "currentAnimator":Landroid/animation/Animator;
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 217
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 224
    .end local v0    # "currentAnimator":Landroid/animation/Animator;
    :cond_31
    :goto_31
    return-void

    .line 208
    :cond_32
    invoke-virtual {p0}, Lorg/osmdroid/views/MapController;->stopPanning()V

    goto :goto_1c

    .line 220
    :cond_36
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, v1, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 221
    iget-object v1, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->clearAnimation()V

    goto :goto_31
.end method

.method public stopPanning()V
    .registers 3

    .prologue
    .line 191
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 192
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getScroller()Landroid/widget/Scroller;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 193
    return-void
.end method

.method public zoomIn()Z
    .registers 3

    .prologue
    .line 236
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
    .registers 8
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 241
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 242
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 243
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 257
    :cond_1d
    :goto_1d
    return v0

    .line 247
    :cond_1e
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 248
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_3e

    .line 249
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 250
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_3c
    move v0, v1

    .line 254
    goto :goto_1d

    .line 252
    :cond_3e
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomInAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_3c
.end method

.method public zoomOut()Z
    .registers 3

    .prologue
    .line 266
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
    .registers 8
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 271
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 272
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 273
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 287
    :cond_1d
    :goto_1d
    return v0

    .line 277
    :cond_1e
    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, v2, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 278
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_3e

    .line 279
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lorg/osmdroid/views/MapController;->mCurrentAnimator:Landroid/animation/Animator;

    .line 280
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_3c
    move v0, v1

    .line 284
    goto :goto_1d

    .line 282
    :cond_3e
    iget-object v0, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/MapController;->mZoomOutAnimationOld:Landroid/view/animation/ScaleAnimation;

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_3c
.end method

.method public zoomToSpan(II)V
    .registers 15
    .param p1, "latSpanE6"    # I
    .param p2, "lonSpanE6"    # I

    .prologue
    const/high16 v11, 0x3f800000    # 1.0f

    .line 100
    if-lez p1, :cond_6

    if-gtz p2, :cond_7

    .line 127
    :cond_6
    :goto_6
    return-void

    .line 105
    :cond_7
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v7

    if-nez v7, :cond_15

    .line 106
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mReplayController:Lorg/osmdroid/views/MapController$ReplayController;

    invoke-virtual {v7, p1, p2}, Lorg/osmdroid/views/MapController$ReplayController;->zoomToSpan(II)V

    goto :goto_6

    .line 110
    :cond_15
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    .line 111
    .local v0, "bb":Lorg/osmdroid/util/BoundingBoxE6;
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    .line 113
    .local v3, "curZoomLevel":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v1

    .line 114
    .local v1, "curLatSpan":I
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v2

    .line 116
    .local v2, "curLonSpan":I
    int-to-float v7, p1

    int-to-float v8, v1

    div-float v5, v7, v8

    .line 117
    .local v5, "diffNeededLat":F
    int-to-float v7, p2

    int-to-float v8, v2

    div-float v6, v7, v8

    .line 119
    .local v6, "diffNeededLon":F
    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 121
    .local v4, "diffNeeded":F
    cmpl-float v7, v4, v11

    if-lez v7, :cond_4d

    .line 122
    iget-object v7, p0, Lorg/osmdroid/views/MapController;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-static {v4}, Lorg/osmdroid/views/util/MyMath;->getNextSquareNumberAbove(F)I

    move-result v8

    sub-int v8, v3, v8

    invoke-virtual {v7, v8}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    goto :goto_6

    .line 123
    :cond_4d
    float-to-double v7, v4

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    cmpg-double v7, v7, v9

    if-gez v7, :cond_6

    .line 124
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
    .line 94
    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v0

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapController;->zoomToSpan(II)V

    .line 95
    return-void
.end method
