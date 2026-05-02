.class Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;
.super Ljava/lang/Object;
.source "CropImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/view/CropImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WrapCropBoundsRunnable"
.end annotation


# instance fields
.field private final mCenterDiffX:F

.field private final mCenterDiffY:F

.field private final mCropImageView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/yalantis/ucrop/view/CropImageView;",
            ">;"
        }
    .end annotation
.end field

.field private final mDeltaScale:F

.field private final mDurationMs:J

.field private final mOldScale:F

.field private final mOldX:F

.field private final mOldY:F

.field private final mStartTime:J

.field private final mWillBeImageInBoundsAfterTranslate:Z


# direct methods
.method public constructor <init>(Lcom/yalantis/ucrop/view/CropImageView;JFFFFFFZ)V
    .registers 13
    .param p1, "cropImageView"    # Lcom/yalantis/ucrop/view/CropImageView;
    .param p2, "durationMs"    # J
    .param p4, "oldX"    # F
    .param p5, "oldY"    # F
    .param p6, "centerDiffX"    # F
    .param p7, "centerDiffY"    # F
    .param p8, "oldScale"    # F
    .param p9, "deltaScale"    # F
    .param p10, "willBeImageInBoundsAfterTranslate"    # Z

    .prologue
    .line 526
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 528
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCropImageView:Ljava/lang/ref/WeakReference;

    .line 530
    iput-wide p2, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    .line 531
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mStartTime:J

    .line 532
    iput p4, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldX:F

    .line 533
    iput p5, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldY:F

    .line 534
    iput p6, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCenterDiffX:F

    .line 535
    iput p7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCenterDiffY:F

    .line 536
    iput p8, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldScale:F

    .line 537
    iput p9, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDeltaScale:F

    .line 538
    iput-boolean p10, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mWillBeImageInBoundsAfterTranslate:Z

    .line 539
    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 543
    iget-object v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCropImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/CropImageView;

    .line 544
    .local v0, "cropImageView":Lcom/yalantis/ucrop/view/CropImageView;
    if-nez v0, :cond_c

    .line 564
    :cond_b
    :goto_b
    return-void

    .line 548
    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 549
    .local v5, "now":J
    iget-wide v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    iget-wide v9, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mStartTime:J

    sub-long v9, v5, v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-float v1, v7

    .line 551
    .local v1, "currentMs":F
    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCenterDiffX:F

    iget-wide v8, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    long-to-float v8, v8

    invoke-static {v1, v11, v7, v8}, Lcom/yalantis/ucrop/util/CubicEasing;->easeOut(FFFF)F

    move-result v3

    .line 552
    .local v3, "newX":F
    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mCenterDiffY:F

    iget-wide v8, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    long-to-float v8, v8

    invoke-static {v1, v11, v7, v8}, Lcom/yalantis/ucrop/util/CubicEasing;->easeOut(FFFF)F

    move-result v4

    .line 553
    .local v4, "newY":F
    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDeltaScale:F

    iget-wide v8, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    long-to-float v8, v8

    invoke-static {v1, v11, v7, v8}, Lcom/yalantis/ucrop/util/CubicEasing;->easeInOut(FFFF)F

    move-result v2

    .line 555
    .local v2, "newScale":F
    iget-wide v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mDurationMs:J

    long-to-float v7, v7

    cmpg-float v7, v1, v7

    if-gez v7, :cond_b

    .line 556
    iget-object v7, v0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCenter:[F

    const/4 v8, 0x0

    aget v7, v7, v8

    iget v8, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldX:F

    sub-float/2addr v7, v8

    sub-float v7, v3, v7

    iget-object v8, v0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCenter:[F

    const/4 v9, 0x1

    aget v8, v8, v9

    iget v9, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldY:F

    sub-float/2addr v8, v9

    sub-float v8, v4, v8

    invoke-virtual {v0, v7, v8}, Lcom/yalantis/ucrop/view/CropImageView;->postTranslate(FF)V

    .line 557
    iget-boolean v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mWillBeImageInBoundsAfterTranslate:Z

    if-nez v7, :cond_6e

    .line 558
    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;->mOldScale:F

    add-float/2addr v7, v2

    # getter for: Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;
    invoke-static {v0}, Lcom/yalantis/ucrop/view/CropImageView;->access$000(Lcom/yalantis/ucrop/view/CropImageView;)Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    # getter for: Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;
    invoke-static {v0}, Lcom/yalantis/ucrop/view/CropImageView;->access$000(Lcom/yalantis/ucrop/view/CropImageView;)Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    invoke-virtual {v0, v7, v8, v9}, Lcom/yalantis/ucrop/view/CropImageView;->zoomInImage(FFF)V

    .line 560
    :cond_6e
    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/CropImageView;->isImageWrapCropBounds()Z

    move-result v7

    if-nez v7, :cond_b

    .line 561
    invoke-virtual {v0, p0}, Lcom/yalantis/ucrop/view/CropImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_b
.end method
