.class Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;
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
    name = "ZoomImageToPosition"
.end annotation


# instance fields
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

.field private final mDestX:F

.field private final mDestY:F

.field private final mDurationMs:J

.field private final mOldScale:F

.field private final mStartTime:J


# direct methods
.method public constructor <init>(Lcom/yalantis/ucrop/view/CropImageView;JFFFF)V
    .registers 10
    .param p1, "cropImageView"    # Lcom/yalantis/ucrop/view/CropImageView;
    .param p2, "durationMs"    # J
    .param p4, "oldScale"    # F
    .param p5, "deltaScale"    # F
    .param p6, "destX"    # F
    .param p7, "destY"    # F

    .prologue
    .line 586
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 588
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mCropImageView:Ljava/lang/ref/WeakReference;

    .line 590
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mStartTime:J

    .line 591
    iput-wide p2, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDurationMs:J

    .line 592
    iput p4, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mOldScale:F

    .line 593
    iput p5, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDeltaScale:F

    .line 594
    iput p6, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDestX:F

    .line 595
    iput p7, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDestY:F

    .line 596
    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 600
    iget-object v5, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mCropImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/CropImageView;

    .line 601
    .local v0, "cropImageView":Lcom/yalantis/ucrop/view/CropImageView;
    if-nez v0, :cond_b

    .line 615
    :goto_a
    return-void

    .line 605
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 606
    .local v3, "now":J
    iget-wide v5, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDurationMs:J

    iget-wide v7, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mStartTime:J

    sub-long v7, v3, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-float v1, v5

    .line 607
    .local v1, "currentMs":F
    const/4 v5, 0x0

    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDeltaScale:F

    iget-wide v7, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDurationMs:J

    long-to-float v7, v7

    invoke-static {v1, v5, v6, v7}, Lcom/yalantis/ucrop/util/CubicEasing;->easeInOut(FFFF)F

    move-result v2

    .line 609
    .local v2, "newScale":F
    iget-wide v5, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDurationMs:J

    long-to-float v5, v5

    cmpg-float v5, v1, v5

    if-gez v5, :cond_39

    .line 610
    iget v5, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mOldScale:F

    add-float/2addr v5, v2

    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDestX:F

    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;->mDestY:F

    invoke-virtual {v0, v5, v6, v7}, Lcom/yalantis/ucrop/view/CropImageView;->zoomInImage(FFF)V

    .line 611
    invoke-virtual {v0, p0}, Lcom/yalantis/ucrop/view/CropImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_a

    .line 613
    :cond_39
    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/CropImageView;->setImageToWrapCropBounds()V

    goto :goto_a
.end method
