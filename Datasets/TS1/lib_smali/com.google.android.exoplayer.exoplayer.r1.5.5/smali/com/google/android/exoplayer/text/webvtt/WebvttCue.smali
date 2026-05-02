.class final Lcom/google/android/exoplayer/text/webvtt/WebvttCue;
.super Lcom/google/android/exoplayer/text/Cue;
.source "WebvttCue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/text/webvtt/WebvttCue$1;,
        Lcom/google/android/exoplayer/text/webvtt/WebvttCue$Builder;
    }
.end annotation


# instance fields
.field public final endTime:J

.field public final startTime:J


# direct methods
.method public constructor <init>(JJLjava/lang/CharSequence;)V
    .registers 19
    .param p1, "startTime"    # J
    .param p3, "endTime"    # J
    .param p5, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 36
    const/4 v6, 0x0

    const/4 v7, 0x1

    const/high16 v8, -0x80000000

    const/high16 v9, -0x80000000

    const/4 v10, 0x1

    const/high16 v11, -0x80000000

    const/4 v12, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-wide/from16 v3, p3

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v12}, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;-><init>(JJLjava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V

    .line 38
    return-void
.end method

.method public constructor <init>(JJLjava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V
    .registers 22
    .param p1, "startTime"    # J
    .param p3, "endTime"    # J
    .param p5, "text"    # Ljava/lang/CharSequence;
    .param p6, "textAlignment"    # Landroid/text/Layout$Alignment;
    .param p7, "line"    # F
    .param p8, "lineType"    # I
    .param p9, "lineAnchor"    # I
    .param p10, "position"    # F
    .param p11, "positionAnchor"    # I
    .param p12, "width"    # F

    .prologue
    .line 42
    move-object v0, p0

    move-object v1, p5

    move-object v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p11

    move/from16 v8, p12

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer/text/Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V

    .line 43
    iput-wide p1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;->startTime:J

    .line 44
    iput-wide p3, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;->endTime:J

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .registers 8
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const-wide/16 v1, 0x0

    .line 32
    move-object v0, p0

    move-wide v3, v1

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;-><init>(JJLjava/lang/CharSequence;)V

    .line 33
    return-void
.end method


# virtual methods
.method public isNormalCue()Z
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 54
    iget v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;->line:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_f

    iget v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttCue;->position:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method
