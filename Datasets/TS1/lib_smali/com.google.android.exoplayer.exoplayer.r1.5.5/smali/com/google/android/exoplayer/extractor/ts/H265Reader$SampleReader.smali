.class final Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;
.super Ljava/lang/Object;
.source "H265Reader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ts/H265Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SampleReader"
.end annotation


# static fields
.field private static final FIRST_SLICE_FLAG_OFFSET:I = 0x2


# instance fields
.field private firstSliceFlag:Z

.field private lookingForFirstSliceFlag:Z

.field private nalUnitBytesRead:I

.field private nalUnitHasKeyframeData:Z

.field private nalUnitStartPosition:J

.field private nalUnitTimeUs:J

.field private final output:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private readingSample:Z

.field private sampleIsKeyframe:Z

.field private samplePosition:J

.field private sampleTimeUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V
    .registers 2
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;

    .prologue
    .line 398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 399
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 400
    return-void
.end method

.method private outputSample(I)V
    .registers 9
    .param p1, "offset"    # I

    .prologue
    .line 450
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->sampleIsKeyframe:Z

    if-eqz v0, :cond_15

    const/4 v3, 0x1

    .line 451
    .local v3, "flags":I
    :goto_5
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitStartPosition:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->samplePosition:J

    sub-long/2addr v0, v5

    long-to-int v4, v0

    .line 452
    .local v4, "size":I
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->sampleTimeUs:J

    const/4 v6, 0x0

    move v5, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 453
    return-void

    .line 450
    .end local v3    # "flags":I
    .end local v4    # "size":I
    :cond_15
    const/4 v3, 0x0

    goto :goto_5
.end method


# virtual methods
.method public endNalUnit(JI)V
    .registers 7
    .param p1, "position"    # J
    .param p3, "offset"    # I

    .prologue
    .line 436
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->firstSliceFlag:Z

    if-eqz v1, :cond_21

    .line 438
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->readingSample:Z

    if-eqz v1, :cond_12

    .line 439
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitStartPosition:J

    sub-long v1, p1, v1

    long-to-int v0, v1

    .line 440
    .local v0, "nalUnitLength":I
    add-int v1, p3, v0

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->outputSample(I)V

    .line 442
    .end local v0    # "nalUnitLength":I
    :cond_12
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitStartPosition:J

    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->samplePosition:J

    .line 443
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitTimeUs:J

    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->sampleTimeUs:J

    .line 444
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->readingSample:Z

    .line 445
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitHasKeyframeData:Z

    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->sampleIsKeyframe:Z

    .line 447
    :cond_21
    return-void
.end method

.method public readNalUnitData([BII)V
    .registers 8
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    const/4 v2, 0x0

    .line 424
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->lookingForFirstSliceFlag:Z

    if-eqz v1, :cond_18

    .line 425
    add-int/lit8 v1, p2, 0x2

    iget v3, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitBytesRead:I

    sub-int v0, v1, v3

    .line 426
    .local v0, "headerOffset":I
    if-ge v0, p3, :cond_1b

    .line 427
    aget-byte v1, p1, v0

    and-int/lit16 v1, v1, 0x80

    if-eqz v1, :cond_19

    const/4 v1, 0x1

    :goto_14
    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->firstSliceFlag:Z

    .line 428
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->lookingForFirstSliceFlag:Z

    .line 433
    .end local v0    # "headerOffset":I
    :cond_18
    :goto_18
    return-void

    .restart local v0    # "headerOffset":I
    :cond_19
    move v1, v2

    .line 427
    goto :goto_14

    .line 430
    :cond_1b
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitBytesRead:I

    sub-int v2, p3, p2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitBytesRead:I

    goto :goto_18
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 403
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->lookingForFirstSliceFlag:Z

    .line 404
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->firstSliceFlag:Z

    .line 405
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->readingSample:Z

    .line 406
    return-void
.end method

.method public startNalUnit(JIIJ)V
    .registers 10
    .param p1, "position"    # J
    .param p3, "offset"    # I
    .param p4, "nalUnitType"    # I
    .param p5, "pesTimeUs"    # J

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 409
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->firstSliceFlag:Z

    .line 410
    iput-wide p5, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitTimeUs:J

    .line 411
    iput v2, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitBytesRead:I

    .line 412
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitStartPosition:J

    .line 414
    const/16 v0, 0x20

    if-lt p4, v0, :cond_17

    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->readingSample:Z

    if-eqz v0, :cond_17

    .line 415
    invoke-direct {p0, p3}, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->outputSample(I)V

    .line 416
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->readingSample:Z

    .line 419
    :cond_17
    const/16 v0, 0x10

    if-lt p4, v0, :cond_2e

    const/16 v0, 0x15

    if-gt p4, v0, :cond_2e

    move v0, v1

    :goto_20
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitHasKeyframeData:Z

    .line 420
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->nalUnitHasKeyframeData:Z

    if-nez v0, :cond_2a

    const/16 v0, 0x9

    if-gt p4, v0, :cond_2b

    :cond_2a
    move v2, v1

    :cond_2b
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H265Reader$SampleReader;->lookingForFirstSliceFlag:Z

    .line 421
    return-void

    :cond_2e
    move v0, v2

    .line 419
    goto :goto_20
.end method
