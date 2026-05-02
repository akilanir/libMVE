.class public Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
.super Ljava/lang/Object;
.source "SmoothStreamingManifest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;
    }
.end annotation


# instance fields
.field public final durationUs:J

.field public final dvrWindowLengthUs:J

.field public final isLive:Z

.field public final lookAheadCount:I

.field public final majorVersion:I

.field public final minorVersion:I

.field public final protectionElement:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;

.field public final streamElements:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;


# direct methods
.method public constructor <init>(IIJJJIZLcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;)V
    .registers 20
    .param p1, "majorVersion"    # I
    .param p2, "minorVersion"    # I
    .param p3, "timescale"    # J
    .param p5, "duration"    # J
    .param p7, "dvrWindowLength"    # J
    .param p9, "lookAheadCount"    # I
    .param p10, "isLive"    # Z
    .param p11, "protectionElement"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;
    .param p12, "streamElements"    # [Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput p1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->majorVersion:I

    .line 100
    iput p2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->minorVersion:I

    .line 101
    move/from16 v0, p9

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->lookAheadCount:I

    .line 102
    move/from16 v0, p10

    iput-boolean v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->isLive:Z

    .line 103
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->protectionElement:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;

    .line 104
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->streamElements:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    .line 105
    const-wide/16 v1, 0x0

    cmp-long v1, p7, v1

    if-nez v1, :cond_2c

    const-wide/16 v1, -0x1

    :goto_1f
    iput-wide v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->dvrWindowLengthUs:J

    .line 107
    const-wide/16 v1, 0x0

    cmp-long v1, p5, v1

    if-nez v1, :cond_36

    const-wide/16 v1, -0x1

    :goto_29
    iput-wide v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->durationUs:J

    .line 109
    return-void

    .line 105
    :cond_2c
    const-wide/32 v3, 0xf4240

    move-wide v1, p7

    move-wide v5, p3

    invoke-static/range {v1 .. v6}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v1

    goto :goto_1f

    .line 107
    :cond_36
    const-wide/32 v3, 0xf4240

    move-wide v1, p5

    move-wide v5, p3

    invoke-static/range {v1 .. v6}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v1

    goto :goto_29
.end method
