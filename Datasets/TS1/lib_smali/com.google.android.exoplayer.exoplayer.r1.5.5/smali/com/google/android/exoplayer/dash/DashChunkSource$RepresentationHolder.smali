.class public final Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
.super Ljava/lang/Object;
.source "DashChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/DashChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "RepresentationHolder"
.end annotation


# instance fields
.field public final extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

.field public mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field public final mimeTypeIsRawText:Z

.field private periodDurationUs:J

.field private final periodStartTimeUs:J

.field public representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

.field public segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

.field private segmentNumShift:I


# direct methods
.method public constructor <init>(JJLcom/google/android/exoplayer/dash/mpd/Representation;)V
    .registers 9
    .param p1, "periodStartTimeUs"    # J
    .param p3, "periodDurationUs"    # J
    .param p5, "representation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;

    .prologue
    .line 880
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 881
    iput-wide p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodStartTimeUs:J

    .line 882
    iput-wide p3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    .line 883
    iput-object p5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 884
    iget-object v1, p5, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v0, v1, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    .line 885
    .local v0, "mimeType":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->mimeTypeIsRawText:Z

    .line 886
    iget-boolean v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->mimeTypeIsRawText:Z

    if-eqz v1, :cond_21

    const/4 v1, 0x0

    :goto_18
    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    .line 888
    invoke-virtual {p5}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 889
    return-void

    .line 886
    :cond_21
    new-instance v2, Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    invoke-static {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->mimeTypeIsWebm(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_33

    new-instance v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;

    invoke-direct {v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;-><init>()V

    :goto_2e
    invoke-direct {v2, v1}, Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;-><init>(Lcom/google/android/exoplayer/extractor/Extractor;)V

    move-object v1, v2

    goto :goto_18

    :cond_33
    new-instance v1, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;

    invoke-direct {v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;-><init>()V

    goto :goto_2e
.end method


# virtual methods
.method public getFirstAvailableSegmentNum()I
    .registers 3

    .prologue
    .line 954
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    invoke-interface {v0}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v0

    iget v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getLastSegmentNum()I
    .registers 4

    .prologue
    .line 944
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    iget-wide v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum(J)I

    move-result v0

    return v0
.end method

.method public getSegmentEndTimeUs(I)J
    .registers 8
    .param p1, "segmentNum"    # I

    .prologue
    .line 939
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getSegmentStartTimeUs(I)J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    iget v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    sub-int v3, p1, v3

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v2, v3, v4, v5}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(IJ)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getSegmentNum(J)I
    .registers 8
    .param p1, "positionUs"    # J

    .prologue
    .line 930
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    iget-wide v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodStartTimeUs:J

    sub-long v1, p1, v1

    iget-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(JJ)I

    move-result v0

    iget v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getSegmentStartTimeUs(I)J
    .registers 6
    .param p1, "segmentNum"    # I

    .prologue
    .line 935
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    iget v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodStartTimeUs:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getSegmentUrl(I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .registers 4
    .param p1, "segmentNum"    # I

    .prologue
    .line 958
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    iget v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentUrl(I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method public isBeyondLastSegment(I)Z
    .registers 5
    .param p1, "segmentNum"    # I

    .prologue
    const/4 v1, 0x0

    .line 948
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getLastSegmentNum()I

    move-result v0

    .line 949
    .local v0, "lastSegmentNum":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_9

    :cond_8
    :goto_8
    return v1

    :cond_9
    iget v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    add-int/2addr v2, v0

    if-le p1, v2, :cond_8

    const/4 v1, 0x1

    goto :goto_8
.end method

.method public updateRepresentation(JLcom/google/android/exoplayer/dash/mpd/Representation;)V
    .registers 16
    .param p1, "newPeriodDurationUs"    # J
    .param p3, "newRepresentation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/BehindLiveWindowException;
        }
    .end annotation

    .prologue
    .line 893
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v4

    .line 894
    .local v4, "oldIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    invoke-virtual {p3}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v0

    .line 896
    .local v0, "newIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    iput-wide p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    .line 897
    iput-object p3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 898
    if-nez v4, :cond_11

    .line 927
    :cond_10
    :goto_10
    return-void

    .line 903
    :cond_11
    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 904
    invoke-interface {v4}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->isExplicit()Z

    move-result v8

    if-eqz v8, :cond_10

    .line 909
    iget-wide v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v4, v8, v9}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum(J)I

    move-result v7

    .line 910
    .local v7, "oldIndexLastSegmentNum":I
    invoke-interface {v4, v7}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v8

    iget-wide v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v4, v7, v10, v11}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(IJ)J

    move-result-wide v10

    add-long v5, v8, v10

    .line 912
    .local v5, "oldIndexEndTimeUs":J
    invoke-interface {v0}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v1

    .line 913
    .local v1, "newIndexFirstSegmentNum":I
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v2

    .line 914
    .local v2, "newIndexStartTimeUs":J
    cmp-long v8, v5, v2

    if-nez v8, :cond_46

    .line 916
    iget v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    iget-wide v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v4, v9, v10}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum(J)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    sub-int/2addr v9, v1

    add-int/2addr v8, v9

    iput v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    goto :goto_10

    .line 918
    :cond_46
    cmp-long v8, v5, v2

    if-gez v8, :cond_50

    .line 921
    new-instance v8, Lcom/google/android/exoplayer/BehindLiveWindowException;

    invoke-direct {v8}, Lcom/google/android/exoplayer/BehindLiveWindowException;-><init>()V

    throw v8

    .line 924
    :cond_50
    iget v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    iget-wide v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->periodDurationUs:J

    invoke-interface {v4, v2, v3, v9, v10}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(JJ)I

    move-result v9

    sub-int/2addr v9, v1

    add-int/2addr v8, v9

    iput v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    goto :goto_10
.end method
