.class public Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;
.super Lcom/google/android/exoplayer/MediaCodecTrackRenderer;
.source "MediaCodecVideoTrackRenderer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;
    }
.end annotation


# static fields
.field private static final KEY_CROP_BOTTOM:Ljava/lang/String; = "crop-bottom"

.field private static final KEY_CROP_LEFT:Ljava/lang/String; = "crop-left"

.field private static final KEY_CROP_RIGHT:Ljava/lang/String; = "crop-right"

.field private static final KEY_CROP_TOP:Ljava/lang/String; = "crop-top"

.field public static final MSG_SET_SURFACE:I = 0x1


# instance fields
.field private final allowedJoiningTimeUs:J

.field private consecutiveDroppedFrameCount:I

.field private currentHeight:I

.field private currentPixelWidthHeightRatio:F

.field private currentUnappliedRotationDegrees:I

.field private currentWidth:I

.field private droppedFrameAccumulationStartTimeMs:J

.field private droppedFrameCount:I

.field private final eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

.field private final frameReleaseTimeHelper:Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

.field private joiningDeadlineUs:J

.field private lastReportedHeight:I

.field private lastReportedPixelWidthHeightRatio:F

.field private lastReportedUnappliedRotationDegrees:I

.field private lastReportedWidth:I

.field private final maxDroppedFrameCountToNotify:I

.field private pendingPixelWidthHeightRatio:F

.field private pendingRotationDegrees:I

.field private renderedFirstFrame:Z

.field private reportedDrawnToSurface:Z

.field private surface:Landroid/view/Surface;

.field private final videoScalingMode:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;I)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p3, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p4, "videoScalingMode"    # I

    .prologue
    .line 138
    const-wide/16 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJ)V

    .line 139
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJ)V
    .registers 17
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p3, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p4, "videoScalingMode"    # I
    .param p5, "allowedJoiningTimeMs"    # J

    .prologue
    .line 152
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-wide v5, p5

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;I)V

    .line 154
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;I)V
    .registers 22
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p3, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p4, "videoScalingMode"    # I
    .param p5, "allowedJoiningTimeMs"    # J
    .param p7, "eventHandler"    # Landroid/os/Handler;
    .param p8, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;
    .param p9, "maxDroppedFrameCountToNotify"    # I

    .prologue
    .line 173
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move/from16 v11, p9

    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJLcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;I)V

    .line 175
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;IJLcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;I)V
    .registers 20
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p3, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p4, "videoScalingMode"    # I
    .param p5, "allowedJoiningTimeMs"    # J
    .param p7, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p8, "playClearSamplesWithoutKeys"    # Z
    .param p9, "eventHandler"    # Landroid/os/Handler;
    .param p10, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;
    .param p11, "maxDroppedFrameCountToNotify"    # I

    .prologue
    .line 202
    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p7

    move/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V

    .line 204
    new-instance v1, Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

    invoke-direct {v1, p1}, Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

    .line 205
    iput p4, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->videoScalingMode:I

    .line 206
    const-wide/16 v1, 0x3e8

    mul-long/2addr v1, p5

    iput-wide v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->allowedJoiningTimeUs:J

    .line 207
    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    .line 208
    move/from16 v0, p11

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maxDroppedFrameCountToNotify:I

    .line 209
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    .line 210
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 211
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    .line 212
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    .line 213
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingPixelWidthHeightRatio:F

    .line 214
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedWidth:I

    .line 215
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedHeight:I

    .line 216
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedPixelWidthHeightRatio:F

    .line 217
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;)Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    return-object v0
.end method

.method private maybeNotifyDrawnToSurface()V
    .registers 4

    .prologue
    .line 570
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    if-eqz v1, :cond_c

    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->reportedDrawnToSurface:Z

    if-eqz v1, :cond_d

    .line 583
    :cond_c
    :goto_c
    return-void

    .line 574
    :cond_d
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    .line 575
    .local v0, "surface":Landroid/view/Surface;
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$2;-><init>(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Landroid/view/Surface;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 582
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->reportedDrawnToSurface:Z

    goto :goto_c
.end method

.method private maybeNotifyDroppedFrameCount()V
    .registers 8

    .prologue
    .line 586
    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v5, :cond_c

    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    if-eqz v5, :cond_c

    iget v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    if-nez v5, :cond_d

    .line 602
    :cond_c
    :goto_c
    return-void

    .line 589
    :cond_d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    .line 591
    .local v3, "now":J
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    .line 592
    .local v0, "countToNotify":I
    iget-wide v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameAccumulationStartTimeMs:J

    sub-long v1, v3, v5

    .line 593
    .local v1, "elapsedToNotify":J
    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v6, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$3;

    invoke-direct {v6, p0, v0, v1, v2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$3;-><init>(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;IJ)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 600
    const/4 v5, 0x0

    iput v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    .line 601
    iput-wide v3, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameAccumulationStartTimeMs:J

    goto :goto_c
.end method

.method private maybeNotifyVideoSizeChanged()V
    .registers 8

    .prologue
    .line 544
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    if-eqz v0, :cond_22

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedWidth:I

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    if-ne v0, v1, :cond_23

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedHeight:I

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    if-ne v0, v1, :cond_23

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedUnappliedRotationDegrees:I

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentUnappliedRotationDegrees:I

    if-ne v0, v1, :cond_23

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedPixelWidthHeightRatio:F

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_23

    .line 567
    :cond_22
    :goto_22
    return-void

    .line 551
    :cond_23
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 552
    .local v2, "currentWidth":I
    iget v3, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    .line 553
    .local v3, "currentHeight":I
    iget v4, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentUnappliedRotationDegrees:I

    .line 554
    .local v4, "currentUnappliedRotationDegrees":I
    iget v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    .line 555
    .local v5, "currentPixelWidthHeightRatio":F
    iget-object v6, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$1;-><init>(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;IIIF)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 563
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedWidth:I

    .line 564
    iput v3, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedHeight:I

    .line 565
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedUnappliedRotationDegrees:I

    .line 566
    iput v5, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedPixelWidthHeightRatio:F

    goto :goto_22
.end method

.method private maybeSetMaxInputSize(Landroid/media/MediaFormat;Z)V
    .registers 11
    .param p1, "format"    # Landroid/media/MediaFormat;
    .param p2, "codecIsAdaptive"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 500
    const-string v5, "max-input-size"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 541
    :cond_8
    :goto_8
    return-void

    .line 504
    :cond_9
    const-string v5, "height"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 505
    .local v0, "maxHeight":I
    if-eqz p2, :cond_23

    const-string v5, "max-height"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 506
    const-string v5, "max-height"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 508
    :cond_23
    const-string v5, "width"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    .line 509
    .local v3, "maxWidth":I
    if-eqz p2, :cond_3d

    const-string v5, "max-width"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 510
    const-string v5, "max-width"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 514
    :cond_3d
    const-string v5, "mime"

    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v5, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_9a

    :cond_4b
    :goto_4b
    packed-switch v5, :pswitch_data_a8

    goto :goto_8

    .line 516
    :pswitch_4f
    const-string v5, "BRAVIA 4K 2015"

    sget-object v6, Lcom/google/android/exoplayer/util/Util;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 522
    add-int/lit8 v5, v3, 0xf

    div-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v0, 0xf

    div-int/lit8 v6, v6, 0x10

    mul-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x10

    mul-int/lit8 v2, v5, 0x10

    .line 523
    .local v2, "maxPixels":I
    const/4 v4, 0x2

    .line 539
    .local v4, "minCompressionRatio":I
    :goto_67
    mul-int/lit8 v5, v2, 0x3

    mul-int/lit8 v6, v4, 0x2

    div-int v1, v5, v6

    .line 540
    .local v1, "maxInputSize":I
    const-string v5, "max-input-size"

    invoke-virtual {p1, v5, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_8

    .line 514
    .end local v1    # "maxInputSize":I
    .end local v2    # "maxPixels":I
    .end local v4    # "minCompressionRatio":I
    :sswitch_73
    const-string v7, "video/avc"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    const/4 v5, 0x0

    goto :goto_4b

    :sswitch_7d
    const-string v7, "video/x-vnd.on2.vp8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    const/4 v5, 0x1

    goto :goto_4b

    :sswitch_87
    const-string v7, "video/x-vnd.on2.vp9"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    const/4 v5, 0x2

    goto :goto_4b

    .line 527
    :pswitch_91
    mul-int v2, v3, v0

    .line 528
    .restart local v2    # "maxPixels":I
    const/4 v4, 0x2

    .line 529
    .restart local v4    # "minCompressionRatio":I
    goto :goto_67

    .line 531
    .end local v2    # "maxPixels":I
    .end local v4    # "minCompressionRatio":I
    :pswitch_95
    mul-int v2, v3, v0

    .line 532
    .restart local v2    # "maxPixels":I
    const/4 v4, 0x4

    .line 533
    .restart local v4    # "minCompressionRatio":I
    goto :goto_67

    .line 514
    nop

    :sswitch_data_9a
    .sparse-switch
        0x4f62373a -> :sswitch_73
        0x5f50bed8 -> :sswitch_7d
        0x5f50bed9 -> :sswitch_87
    .end sparse-switch

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_91
        :pswitch_95
    .end packed-switch
.end method

.method private setSurface(Landroid/view/Surface;)V
    .registers 4
    .param p1, "surface"    # Landroid/view/Surface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    if-ne v1, p1, :cond_5

    .line 316
    :cond_4
    :goto_4
    return-void

    .line 309
    :cond_5
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    .line 310
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->reportedDrawnToSurface:Z

    .line 311
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->getState()I

    move-result v0

    .line 312
    .local v0, "state":I
    const/4 v1, 0x2

    if-eq v0, v1, :cond_14

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 313
    :cond_14
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->releaseCodec()V

    .line 314
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeInitCodec()V

    goto :goto_4
.end method


# virtual methods
.method protected canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 7
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "codecIsAdaptive"    # Z
    .param p3, "oldFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p4, "newFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 379
    iget-object v0, p4, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    iget-object v1, p3, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    if-nez p2, :cond_18

    iget v0, p3, Lcom/google/android/exoplayer/MediaFormat;->width:I

    iget v1, p4, Lcom/google/android/exoplayer/MediaFormat;->width:I

    if-ne v0, v1, :cond_1a

    iget v0, p3, Lcom/google/android/exoplayer/MediaFormat;->height:I

    iget v1, p4, Lcom/google/android/exoplayer/MediaFormat;->height:I

    if-ne v0, v1, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method protected configureCodec(Landroid/media/MediaCodec;ZLandroid/media/MediaFormat;Landroid/media/MediaCrypto;)V
    .registers 7
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "codecIsAdaptive"    # Z
    .param p3, "format"    # Landroid/media/MediaFormat;
    .param p4, "crypto"    # Landroid/media/MediaCrypto;

    .prologue
    .line 327
    invoke-direct {p0, p3, p2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeSetMaxInputSize(Landroid/media/MediaFormat;Z)V

    .line 328
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    const/4 v1, 0x0

    invoke-virtual {p1, p3, v0, p4, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 329
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->videoScalingMode:I

    invoke-virtual {p1, v0}, Landroid/media/MediaCodec;->setVideoScalingMode(I)V

    .line 330
    return-void
.end method

.method protected dropOutputBuffer(Landroid/media/MediaCodec;I)V
    .registers 6
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    .line 464
    const-string v0, "dropVideoBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 465
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 466
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 467
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->droppedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->droppedOutputBufferCount:I

    .line 468
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    .line 469
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 470
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v2, v2, Lcom/google/android/exoplayer/CodecCounters;->maxConsecutiveDroppedOutputBufferCount:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->maxConsecutiveDroppedOutputBufferCount:I

    .line 472
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maxDroppedFrameCountToNotify:I

    if-ne v0, v1, :cond_37

    .line 473
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyDroppedFrameCount()V

    .line 475
    :cond_37
    return-void
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .registers 4
    .param p1, "messageType"    # I
    .param p2, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 294
    const/4 v0, 0x1

    if-ne p1, v0, :cond_9

    .line 295
    check-cast p2, Landroid/view/Surface;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->setSurface(Landroid/view/Surface;)V

    .line 299
    :goto_8
    return-void

    .line 297
    .restart local p2    # "message":Ljava/lang/Object;
    :cond_9
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handleMessage(ILjava/lang/Object;)V

    goto :goto_8
.end method

.method protected handlesTrack(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 6
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p2, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 222
    iget-object v0, p2, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 223
    .local v0, "mimeType":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/android/exoplayer/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    const-string v2, "video/x-unknown"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    invoke-interface {p1, p2, v1}, Lcom/google/android/exoplayer/MediaCodecSelector;->getDecoderInfo(Lcom/google/android/exoplayer/MediaFormat;Z)Lcom/google/android/exoplayer/DecoderInfo;

    move-result-object v2

    if-eqz v2, :cond_18

    :cond_17
    const/4 v1, 0x1

    :cond_18
    return v1
.end method

.method protected final haveRenderedFirstFrame()Z
    .registers 2

    .prologue
    .line 345
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    return v0
.end method

.method protected isReady()Z
    .registers 9

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide/16 v6, -0x1

    .line 247
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->isReady()Z

    move-result v2

    if-eqz v2, :cond_1e

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    if-nez v2, :cond_1b

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecInitialized()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->getSourceState()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1e

    .line 250
    :cond_1b
    iput-wide v6, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    .line 261
    :cond_1d
    :goto_1d
    return v0

    .line 252
    :cond_1e
    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_26

    move v0, v1

    .line 254
    goto :goto_1d

    .line 255
    :cond_26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1d

    .line 260
    iput-wide v6, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    move v0, v1

    .line 261
    goto :goto_1d
.end method

.method protected onDisabled()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    const/4 v0, -0x1

    .line 281
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 282
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    .line 283
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    .line 284
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingPixelWidthHeightRatio:F

    .line 285
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedWidth:I

    .line 286
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedHeight:I

    .line 287
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->lastReportedPixelWidthHeightRatio:F

    .line 288
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;->disable()V

    .line 289
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onDisabled()V

    .line 290
    return-void
.end method

.method protected onDiscontinuity(J)V
    .registers 5
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 239
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onDiscontinuity(J)V

    .line 240
    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    .line 241
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 242
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    .line 243
    return-void
.end method

.method protected onEnabled(IJZ)V
    .registers 9
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 230
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onEnabled(IJZ)V

    .line 231
    if-eqz p4, :cond_19

    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->allowedJoiningTimeUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_19

    .line 232
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->allowedJoiningTimeUs:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    .line 234
    :cond_19
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;->enable()V

    .line 235
    return-void
.end method

.method protected onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V
    .registers 4
    .param p1, "holder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 334
    invoke-super {p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 335
    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1c

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_f
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingPixelWidthHeightRatio:F

    .line 337
    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_21

    const/4 v0, 0x0

    :goto_19
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingRotationDegrees:I

    .line 339
    return-void

    .line 335
    :cond_1c
    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    goto :goto_f

    .line 337
    :cond_21
    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    goto :goto_19
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaFormat;)V
    .registers 6
    .param p1, "outputFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 350
    const-string v2, "crop-right"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6d

    const-string v2, "crop-left"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6d

    const-string v2, "crop-bottom"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6d

    const-string v2, "crop-top"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6d

    const/4 v0, 0x1

    .line 353
    .local v0, "hasCrop":Z
    :goto_21
    if-eqz v0, :cond_6f

    const-string v2, "crop-right"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    const-string v3, "crop-left"

    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    :goto_32
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 356
    if-eqz v0, :cond_76

    const-string v2, "crop-bottom"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    const-string v3, "crop-top"

    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    :goto_45
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    .line 359
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingPixelWidthHeightRatio:F

    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    .line 360
    sget v2, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_7d

    .line 364
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingRotationDegrees:I

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_5d

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingRotationDegrees:I

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_6c

    .line 365
    :cond_5d
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 366
    .local v1, "rotatedHeight":I
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentWidth:I

    .line 367
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentHeight:I

    .line 368
    const/high16 v2, 0x3f800000    # 1.0f

    iget v3, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    div-float/2addr v2, v3

    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentPixelWidthHeightRatio:F

    .line 374
    .end local v1    # "rotatedHeight":I
    :cond_6c
    :goto_6c
    return-void

    .line 350
    .end local v0    # "hasCrop":Z
    :cond_6d
    const/4 v0, 0x0

    goto :goto_21

    .line 353
    .restart local v0    # "hasCrop":Z
    :cond_6f
    const-string v2, "width"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    goto :goto_32

    .line 356
    :cond_76
    const-string v2, "height"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    goto :goto_45

    .line 372
    :cond_7d
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->pendingRotationDegrees:I

    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->currentUnappliedRotationDegrees:I

    goto :goto_6c
.end method

.method protected onStarted()V
    .registers 3

    .prologue
    .line 267
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onStarted()V

    .line 268
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameCount:I

    .line 269
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->droppedFrameAccumulationStartTimeMs:J

    .line 270
    return-void
.end method

.method protected onStopped()V
    .registers 3

    .prologue
    .line 274
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->joiningDeadlineUs:J

    .line 275
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyDroppedFrameCount()V

    .line 276
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onStopped()V

    .line 277
    return-void
.end method

.method protected processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z
    .registers 28
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "codec"    # Landroid/media/MediaCodec;
    .param p6, "buffer"    # Ljava/nio/ByteBuffer;
    .param p7, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;
    .param p8, "bufferIndex"    # I
    .param p9, "shouldSkip"    # Z

    .prologue
    .line 387
    if-eqz p9, :cond_12

    .line 388
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->skipOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 389
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 390
    const/4 v14, 0x1

    .line 453
    :goto_11
    return v14

    .line 393
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    if-nez v14, :cond_3c

    .line 394
    sget v14, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v15, 0x15

    if-lt v14, v15, :cond_32

    .line 395
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2, v14, v15}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V

    .line 399
    :goto_2b
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 400
    const/4 v14, 0x1

    goto :goto_11

    .line 397
    :cond_32
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderOutputBuffer(Landroid/media/MediaCodec;I)V

    goto :goto_2b

    .line 403
    :cond_3c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->getState()I

    move-result v14

    const/4 v15, 0x3

    if-eq v14, v15, :cond_45

    .line 404
    const/4 v14, 0x0

    goto :goto_11

    .line 408
    :cond_45
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    sub-long v8, v14, p3

    .line 409
    .local v8, "elapsedSinceStartOfLoopUs":J
    move-object/from16 v0, p7

    iget-wide v14, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long v14, v14, p1

    sub-long v6, v14, v8

    .line 412
    .local v6, "earlyUs":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 413
    .local v10, "systemTimeNs":J
    const-wide/16 v14, 0x3e8

    mul-long/2addr v14, v6

    add-long v12, v10, v14

    .line 416
    .local v12, "unadjustedFrameReleaseTimeNs":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;

    move-object/from16 v0, p7

    iget-wide v15, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-wide v0, v15

    invoke-virtual {v14, v0, v1, v12, v13}, Lcom/google/android/exoplayer/VideoFrameReleaseTimeHelper;->adjustReleaseTime(JJ)J

    move-result-wide v3

    .line 418
    .local v3, "adjustedReleaseTimeNs":J
    sub-long v14, v3, v10

    const-wide/16 v16, 0x3e8

    div-long v6, v14, v16

    .line 420
    const-wide/16 v14, -0x7530

    cmp-long v14, v6, v14

    if-gez v14, :cond_84

    .line 422
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->dropOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 423
    const/4 v14, 0x1

    goto :goto_11

    .line 426
    :cond_84
    sget v14, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v15, 0x15

    if-lt v14, v15, :cond_a2

    .line 428
    const-wide/32 v14, 0xc350

    cmp-long v14, v6, v14

    if-gez v14, :cond_d3

    .line 429
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V

    .line 430
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 431
    const/4 v14, 0x1

    goto/16 :goto_11

    .line 435
    :cond_a2
    const-wide/16 v14, 0x7530

    cmp-long v14, v6, v14

    if-gez v14, :cond_d3

    .line 436
    const-wide/16 v14, 0x2af8

    cmp-long v14, v6, v14

    if-lez v14, :cond_b9

    .line 441
    const-wide/16 v14, 0x2710

    sub-long v14, v6, v14

    const-wide/16 v16, 0x3e8

    :try_start_b4
    div-long v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_b9
    .catch Ljava/lang/InterruptedException; {:try_start_b4 .. :try_end_b9} :catch_ca

    .line 446
    :cond_b9
    :goto_b9
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 447
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->consecutiveDroppedFrameCount:I

    .line 448
    const/4 v14, 0x1

    goto/16 :goto_11

    .line 442
    :catch_ca
    move-exception v5

    .line 443
    .local v5, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->interrupt()V

    goto :goto_b9

    .line 453
    .end local v5    # "e":Ljava/lang/InterruptedException;
    :cond_d3
    const/4 v14, 0x0

    goto/16 :goto_11
.end method

.method protected renderOutputBuffer(Landroid/media/MediaCodec;I)V
    .registers 6
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    const/4 v2, 0x1

    .line 478
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyVideoSizeChanged()V

    .line 479
    const-string v0, "releaseOutputBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 480
    invoke-virtual {p1, p2, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 481
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 482
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    .line 483
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    .line 484
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyDrawnToSurface()V

    .line 485
    return-void
.end method

.method protected renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V
    .registers 7
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I
    .param p3, "releaseTimeNs"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 489
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyVideoSizeChanged()V

    .line 490
    const-string v0, "releaseOutputBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 491
    invoke-virtual {p1, p2, p3, p4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IJ)V

    .line 492
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 493
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    .line 494
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->renderedFirstFrame:Z

    .line 495
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->maybeNotifyDrawnToSurface()V

    .line 496
    return-void
.end method

.method protected shouldInitCodec()Z
    .registers 2

    .prologue
    .line 320
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldInitCodec()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method protected skipOutputBuffer(Landroid/media/MediaCodec;I)V
    .registers 5
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    .line 457
    const-string v0, "skipVideoBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 458
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 459
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 460
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->skippedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->skippedOutputBufferCount:I

    .line 461
    return-void
.end method
