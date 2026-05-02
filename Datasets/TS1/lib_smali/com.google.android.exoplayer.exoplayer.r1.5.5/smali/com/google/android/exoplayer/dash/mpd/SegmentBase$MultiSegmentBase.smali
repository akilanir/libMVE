.class public abstract Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;
.super Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
.source "SegmentBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "MultiSegmentBase"
.end annotation


# instance fields
.field final duration:J

.field final segmentTimeline:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;"
        }
    .end annotation
.end field

.field final startNumber:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJIJLjava/util/List;)V
    .registers 10
    .param p1, "initialization"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "startNumber"    # I
    .param p7, "duration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            "JJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p9, "segmentTimeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJ)V

    .line 136
    iput p6, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    .line 137
    iput-wide p7, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    .line 138
    iput-object p9, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    .line 139
    return-void
.end method


# virtual methods
.method public getFirstSegmentNum()I
    .registers 2

    .prologue
    .line 213
    iget v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    return v0
.end method

.method public abstract getLastSegmentNum(J)I
.end method

.method public final getSegmentDurationUs(IJ)J
    .registers 10
    .param p1, "sequenceNumber"    # I
    .param p2, "periodDurationUs"    # J

    .prologue
    const-wide/32 v4, 0xf4240

    .line 177
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v2, :cond_1b

    .line 178
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    iget v3, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v3, p1, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    iget-wide v0, v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;->duration:J

    .line 179
    .local v0, "duration":J
    mul-long v2, v0, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long/2addr v2, v4

    .line 181
    .end local v0    # "duration":J
    :goto_1a
    return-wide v2

    :cond_1b
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getLastSegmentNum(J)I

    move-result v2

    if-ne p1, v2, :cond_28

    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getSegmentTimeUs(I)J

    move-result-wide v2

    sub-long v2, p2, v2

    goto :goto_1a

    :cond_28
    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    mul-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long/2addr v2, v4

    goto :goto_1a
.end method

.method public getSegmentNum(JJ)I
    .registers 20
    .param p1, "timeUs"    # J
    .param p3, "periodDurationUs"    # J

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getFirstSegmentNum()I

    move-result v4

    .line 146
    .local v4, "firstSegmentNum":I
    move v6, v4

    .line 147
    .local v6, "lowIndex":I
    move-wide/from16 v0, p3

    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getLastSegmentNum(J)I

    move-result v5

    .line 148
    .local v5, "highIndex":I
    iget-object v11, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-nez v11, :cond_2b

    .line 150
    iget-wide v11, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    const-wide/32 v13, 0xf4240

    mul-long/2addr v11, v13

    iget-wide v13, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long v2, v11, v13

    .line 151
    .local v2, "durationUs":J
    iget v11, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    div-long v12, p1, v2

    long-to-int v12, v12

    add-int v10, v11, v12

    .line 153
    .local v10, "segmentNum":I
    if-ge v10, v6, :cond_24

    move v10, v6

    .line 169
    .end local v2    # "durationUs":J
    .end local v10    # "segmentNum":I
    :cond_23
    :goto_23
    return v10

    .line 153
    .restart local v2    # "durationUs":J
    .restart local v10    # "segmentNum":I
    :cond_24
    const/4 v11, -0x1

    if-eq v5, v11, :cond_23

    if-le v10, v5, :cond_23

    move v10, v5

    goto :goto_23

    .line 158
    .end local v2    # "durationUs":J
    .end local v10    # "segmentNum":I
    :cond_2b
    :goto_2b
    if-gt v6, v5, :cond_45

    .line 159
    add-int v11, v6, v5

    div-int/lit8 v7, v11, 0x2

    .line 160
    .local v7, "midIndex":I
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getSegmentTimeUs(I)J

    move-result-wide v8

    .line 161
    .local v8, "midTimeUs":J
    cmp-long v11, v8, p1

    if-gez v11, :cond_3c

    .line 162
    add-int/lit8 v6, v7, 0x1

    goto :goto_2b

    .line 163
    :cond_3c
    cmp-long v11, v8, p1

    if-lez v11, :cond_43

    .line 164
    add-int/lit8 v5, v7, -0x1

    goto :goto_2b

    :cond_43
    move v10, v7

    .line 166
    goto :goto_23

    .line 169
    .end local v7    # "midIndex":I
    .end local v8    # "midTimeUs":J
    :cond_45
    if-ne v6, v4, :cond_4a

    move v11, v6

    :goto_48
    move v10, v11

    goto :goto_23

    :cond_4a
    move v11, v5

    goto :goto_48
.end method

.method public final getSegmentTimeUs(I)J
    .registers 8
    .param p1, "sequenceNumber"    # I

    .prologue
    .line 192
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v2, :cond_20

    .line 193
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    iget v3, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v3, p1, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    iget-wide v2, v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;->startTime:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->presentationTimeOffset:J

    sub-long v0, v2, v4

    .line 198
    .local v0, "unscaledSegmentTime":J
    :goto_16
    const-wide/32 v2, 0xf4240

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v2

    return-wide v2

    .line 196
    .end local v0    # "unscaledSegmentTime":J
    :cond_20
    iget v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v2, p1, v2

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    mul-long v0, v2, v4

    .restart local v0    # "unscaledSegmentTime":J
    goto :goto_16
.end method

.method public abstract getSegmentUrl(Lcom/google/android/exoplayer/dash/mpd/Representation;I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
.end method

.method public isExplicit()Z
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
