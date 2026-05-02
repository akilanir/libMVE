.class public final Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;
.super Ljava/lang/Object;
.source "FormatEvaluator.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/FormatEvaluator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/chunk/FormatEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AdaptiveEvaluator"
.end annotation


# static fields
.field public static final DEFAULT_BANDWIDTH_FRACTION:F = 0.75f

.field public static final DEFAULT_MAX_DURATION_FOR_QUALITY_DECREASE_MS:I = 0x61a8

.field public static final DEFAULT_MAX_INITIAL_BITRATE:I = 0xc3500

.field public static final DEFAULT_MIN_DURATION_FOR_QUALITY_INCREASE_MS:I = 0x2710

.field public static final DEFAULT_MIN_DURATION_TO_RETAIN_AFTER_DISCARD_MS:I = 0x61a8


# instance fields
.field private final bandwidthFraction:F

.field private final bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

.field private final maxDurationForQualityDecreaseUs:J

.field private final maxInitialBitrate:I

.field private final minDurationForQualityIncreaseUs:J

.field private final minDurationToRetainAfterDiscardUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;)V
    .registers 9
    .param p1, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .prologue
    const/16 v4, 0x61a8

    .line 176
    const v2, 0xc3500

    const/16 v3, 0x2710

    const/high16 v6, 0x3f400000    # 0.75f

    move-object v0, p0

    move-object v1, p1

    move v5, v4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;-><init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;IIIIF)V

    .line 180
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;IIIIF)V
    .registers 11
    .param p1, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p2, "maxInitialBitrate"    # I
    .param p3, "minDurationForQualityIncreaseMs"    # I
    .param p4, "maxDurationForQualityDecreaseMs"    # I
    .param p5, "minDurationToRetainAfterDiscardMs"    # I
    .param p6, "bandwidthFraction"    # F

    .prologue
    const-wide/16 v2, 0x3e8

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .line 205
    iput p2, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxInitialBitrate:I

    .line 206
    int-to-long v0, p3

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationForQualityIncreaseUs:J

    .line 207
    int-to-long v0, p4

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxDurationForQualityDecreaseUs:J

    .line 208
    int-to-long v0, p5

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    .line 209
    iput p6, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthFraction:F

    .line 210
    return-void
.end method

.method private determineIdealFormat([Lcom/google/android/exoplayer/chunk/Format;J)Lcom/google/android/exoplayer/chunk/Format;
    .registers 10
    .param p1, "formats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p2, "bitrateEstimate"    # J

    .prologue
    .line 270
    const-wide/16 v4, -0x1

    cmp-long v4, p2, v4

    if-nez v4, :cond_17

    iget v4, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxInitialBitrate:I

    int-to-long v0, v4

    .line 272
    .local v0, "effectiveBitrate":J
    :goto_9
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    array-length v4, p1

    if-ge v3, v4, :cond_20

    .line 273
    aget-object v2, p1, v3

    .line 274
    .local v2, "format":Lcom/google/android/exoplayer/chunk/Format;
    iget v4, v2, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    int-to-long v4, v4

    cmp-long v4, v4, v0

    if-gtz v4, :cond_1d

    .line 279
    .end local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :goto_16
    return-object v2

    .line 270
    .end local v0    # "effectiveBitrate":J
    .end local v3    # "i":I
    :cond_17
    long-to-float v4, p2

    iget v5, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthFraction:F

    mul-float/2addr v4, v5

    float-to-long v0, v4

    goto :goto_9

    .line 272
    .restart local v0    # "effectiveBitrate":J
    .restart local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .restart local v3    # "i":I
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 279
    .end local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_20
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    aget-object v2, p1, v4

    goto :goto_16
.end method


# virtual methods
.method public disable()V
    .registers 1

    .prologue
    .line 220
    return-void
.end method

.method public enable()V
    .registers 1

    .prologue
    .line 215
    return-void
.end method

.method public evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V
    .registers 19
    .param p2, "playbackPositionUs"    # J
    .param p4, "formats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "evaluation"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;J[",
            "Lcom/google/android/exoplayer/chunk/Format;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_45

    const-wide/16 v1, 0x0

    .line 227
    .local v1, "bufferedDurationUs":J
    :goto_8
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 228
    .local v3, "current":Lcom/google/android/exoplayer/chunk/Format;
    iget-object v11, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    invoke-interface {v11}, Lcom/google/android/exoplayer/upstream/BandwidthMeter;->getBitrateEstimate()J

    move-result-wide v11

    move-object/from16 v0, p4

    invoke-direct {p0, v0, v11, v12}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->determineIdealFormat([Lcom/google/android/exoplayer/chunk/Format;J)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v7

    .line 229
    .local v7, "ideal":Lcom/google/android/exoplayer/chunk/Format;
    if-eqz v7, :cond_56

    if-eqz v3, :cond_56

    iget v11, v7, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v12, v3, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-le v11, v12, :cond_56

    const/4 v8, 0x1

    .line 230
    .local v8, "isHigher":Z
    :goto_23
    if-eqz v7, :cond_58

    if-eqz v3, :cond_58

    iget v11, v7, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v12, v3, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-ge v11, v12, :cond_58

    const/4 v9, 0x1

    .line 231
    .local v9, "isLower":Z
    :goto_2e
    if-eqz v8, :cond_9f

    .line 232
    iget-wide v11, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationForQualityIncreaseUs:J

    cmp-long v11, v1, v11

    if-gez v11, :cond_5a

    .line 235
    move-object v7, v3

    .line 260
    :cond_37
    :goto_37
    if-eqz v3, :cond_40

    if-eq v7, v3, :cond_40

    .line 261
    const/4 v11, 0x3

    move-object/from16 v0, p5

    iput v11, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    .line 263
    :cond_40
    move-object/from16 v0, p5

    iput-object v7, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 264
    return-void

    .line 225
    .end local v1    # "bufferedDurationUs":J
    .end local v3    # "current":Lcom/google/android/exoplayer/chunk/Format;
    .end local v7    # "ideal":Lcom/google/android/exoplayer/chunk/Format;
    .end local v8    # "isHigher":Z
    .end local v9    # "isLower":Z
    :cond_45
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-interface {p1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget-wide v11, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    sub-long v1, v11, p2

    goto :goto_8

    .line 229
    .restart local v1    # "bufferedDurationUs":J
    .restart local v3    # "current":Lcom/google/android/exoplayer/chunk/Format;
    .restart local v7    # "ideal":Lcom/google/android/exoplayer/chunk/Format;
    :cond_56
    const/4 v8, 0x0

    goto :goto_23

    .line 230
    .restart local v8    # "isHigher":Z
    :cond_58
    const/4 v9, 0x0

    goto :goto_2e

    .line 236
    .restart local v9    # "isLower":Z
    :cond_5a
    iget-wide v11, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    cmp-long v11, v1, v11

    if-ltz v11, :cond_37

    .line 240
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_61
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_37

    .line 241
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 242
    .local v10, "thisChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    iget-wide v11, v10, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    sub-long v4, v11, p2

    .line 243
    .local v4, "durationBeforeThisSegmentUs":J
    iget-wide v11, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    cmp-long v11, v4, v11

    if-ltz v11, :cond_9c

    iget-object v11, v10, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v11, v11, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v12, v7, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-ge v11, v12, :cond_9c

    iget-object v11, v10, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v11, v11, Lcom/google/android/exoplayer/chunk/Format;->height:I

    iget v12, v7, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-ge v11, v12, :cond_9c

    iget-object v11, v10, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v11, v11, Lcom/google/android/exoplayer/chunk/Format;->height:I

    const/16 v12, 0x2d0

    if-ge v11, v12, :cond_9c

    iget-object v11, v10, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v11, v11, Lcom/google/android/exoplayer/chunk/Format;->width:I

    const/16 v12, 0x500

    if-ge v11, v12, :cond_9c

    .line 249
    move-object/from16 v0, p5

    iput v6, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    goto :goto_37

    .line 240
    :cond_9c
    add-int/lit8 v6, v6, 0x1

    goto :goto_61

    .line 254
    .end local v4    # "durationBeforeThisSegmentUs":J
    .end local v6    # "i":I
    .end local v10    # "thisChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_9f
    if-eqz v9, :cond_37

    if-eqz v3, :cond_37

    iget-wide v11, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxDurationForQualityDecreaseUs:J

    cmp-long v11, v1, v11

    if-ltz v11, :cond_37

    .line 258
    move-object v7, v3

    goto :goto_37
.end method
