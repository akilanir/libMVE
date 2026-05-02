.class public final Lcom/google/android/exoplayer/MediaFormat;
.super Ljava/lang/Object;
.source "MediaFormat.java"


# static fields
.field public static final NO_VALUE:I = -0x1

.field public static final OFFSET_SAMPLE_RELATIVE:J = 0x7fffffffffffffffL


# instance fields
.field public final adaptive:Z

.field public final bitrate:I

.field public final channelCount:I

.field public final durationUs:J

.field private frameworkMediaFormat:Landroid/media/MediaFormat;

.field private hashCode:I

.field public final height:I

.field public final initializationData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field public final language:Ljava/lang/String;

.field public final maxHeight:I

.field public final maxInputSize:I

.field public final maxWidth:I

.field public final mimeType:Ljava/lang/String;

.field public final pixelWidthHeightRatio:F

.field public final rotationDegrees:I

.field public final sampleRate:I

.field public final subsampleOffsetUs:J

.field public final trackId:Ljava/lang/String;

.field public final width:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V
    .registers 23
    .param p1, "trackId"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "bitrate"    # I
    .param p4, "maxInputSize"    # I
    .param p5, "durationUs"    # J
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "rotationDegrees"    # I
    .param p10, "pixelWidthHeightRatio"    # F
    .param p11, "channelCount"    # I
    .param p12, "sampleRate"    # I
    .param p13, "language"    # Ljava/lang/String;
    .param p14, "subsampleOffsetUs"    # J
    .param p17, "adaptive"    # Z
    .param p18, "maxWidth"    # I
    .param p19, "maxHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIJIIIFII",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List",
            "<[B>;ZII)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p16, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    .line 194
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 195
    iput p3, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    .line 196
    iput p4, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    .line 197
    iput-wide p5, p0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    .line 198
    iput p7, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    .line 199
    iput p8, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    .line 200
    iput p9, p0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    .line 201
    iput p10, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    .line 202
    iput p11, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    .line 203
    iput p12, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    .line 204
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    .line 205
    move-wide/from16 v0, p14

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    .line 206
    if-nez p16, :cond_2b

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p16

    .end local p16    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_2b
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    .line 208
    move/from16 v0, p17

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    .line 209
    move/from16 v0, p18

    iput v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    .line 210
    move/from16 v0, p19

    iput v0, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    .line 211
    return-void
.end method

.method public static createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 30
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "maxInputSize"    # I
    .param p4, "durationUs"    # J
    .param p6, "channelCount"    # I
    .param p7, "sampleRate"    # I
    .param p9, "language"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIJII",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .line 159
    .local p8, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/high16 v10, -0x40800000    # -1.0f

    const-wide v14, 0x7fffffffffffffffL

    const/16 v17, 0x0

    const/16 v18, -0x1

    const/16 v19, -0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move-wide/from16 v5, p4

    move/from16 v11, p6

    move/from16 v12, p7

    move-object/from16 v13, p9

    move-object/from16 v16, p8

    invoke-direct/range {v0 .. v19}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v0
.end method

.method public static createFormatForMimeType(Ljava/lang/String;Ljava/lang/String;IJ)Lcom/google/android/exoplayer/MediaFormat;
    .registers 25
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "durationUs"    # J

    .prologue
    .line 179
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/4 v4, -0x1

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/high16 v10, -0x40800000    # -1.0f

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    const-wide v14, 0x7fffffffffffffffL

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, -0x1

    const/16 v19, -0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-wide/from16 v5, p3

    invoke-direct/range {v0 .. v19}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v0
.end method

.method public static createId3Format()Lcom/google/android/exoplayer/MediaFormat;
    .registers 5

    .prologue
    .line 185
    const/4 v0, 0x0

    const-string v1, "application/id3"

    const/4 v2, -0x1

    const-wide/16 v3, -0x1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/MediaFormat;->createFormatForMimeType(Ljava/lang/String;Ljava/lang/String;IJ)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 14
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "durationUs"    # J
    .param p5, "language"    # Ljava/lang/String;

    .prologue
    .line 166
    const-wide v6, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-static/range {v0 .. v7}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;
    .registers 28
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "durationUs"    # J
    .param p5, "language"    # Ljava/lang/String;
    .param p6, "subsampleOffsetUs"    # J

    .prologue
    .line 172
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/4 v4, -0x1

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/high16 v10, -0x40800000    # -1.0f

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, -0x1

    const/16 v19, -0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-wide/from16 v5, p3

    move-object/from16 v13, p5

    move-wide/from16 v14, p6

    invoke-direct/range {v0 .. v19}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v0
.end method

.method public static createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 20
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "maxInputSize"    # I
    .param p4, "durationUs"    # J
    .param p6, "width"    # I
    .param p7, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIJII",
            "Ljava/util/List",
            "<[B>;)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .line 144
    .local p8, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v9, -0x1

    const/high16 v10, -0x40800000    # -1.0f

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    invoke-static/range {v0 .. v10}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;IF)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public static createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;IF)Lcom/google/android/exoplayer/MediaFormat;
    .registers 31
    .param p0, "trackId"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "maxInputSize"    # I
    .param p4, "durationUs"    # J
    .param p6, "width"    # I
    .param p7, "height"    # I
    .param p9, "rotationDegrees"    # I
    .param p10, "pixelWidthHeightRatio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIJII",
            "Ljava/util/List",
            "<[B>;IF)",
            "Lcom/google/android/exoplayer/MediaFormat;"
        }
    .end annotation

    .prologue
    .line 151
    .local p8, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    new-instance v0, Lcom/google/android/exoplayer/MediaFormat;

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    const-wide v14, 0x7fffffffffffffffL

    const/16 v17, 0x0

    const/16 v18, -0x1

    const/16 v19, -0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move-wide/from16 v5, p4

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p9

    move/from16 v10, p10

    move-object/from16 v16, p8

    invoke-direct/range {v0 .. v19}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v0
.end method

.method private static final maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V
    .registers 4
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 365
    const/4 v0, -0x1

    if-eq p2, v0, :cond_6

    .line 366
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 368
    :cond_6
    return-void
.end method

.method private static final maybeSetStringV16(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 357
    if-eqz p2, :cond_5

    .line 358
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    :cond_5
    return-void
.end method


# virtual methods
.method public copyAsAdaptive(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 23
    .param p1, "trackId"    # Ljava/lang/String;

    .prologue
    .line 245
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    const/4 v4, -0x1

    const/4 v5, -0x1

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/4 v10, -0x1

    const/high16 v11, -0x40800000    # -1.0f

    const/4 v12, -0x1

    const/4 v13, -0x1

    const/4 v14, 0x0

    const-wide v15, 0x7fffffffffffffffL

    const/16 v17, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    move/from16 v20, v0

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public copyWithDurationUs(J)Lcom/google/android/exoplayer/MediaFormat;
    .registers 24
    .param p1, "durationUs"    # J

    .prologue
    .line 232
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    move/from16 v20, v0

    move-wide/from16 v6, p1

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public copyWithFixedTrackInfo(Ljava/lang/String;IIILjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 27
    .param p1, "trackId"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "language"    # Ljava/lang/String;

    .prologue
    .line 239
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    move/from16 v18, v0

    const/16 v19, -0x1

    const/16 v20, -0x1

    move-object/from16 v2, p1

    move/from16 v4, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v14, p5

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public copyWithMaxInputSize(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 23
    .param p1, "maxInputSize"    # I

    .prologue
    .line 214
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    move/from16 v20, v0

    move/from16 v5, p1

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public copyWithMaxVideoDimensions(II)Lcom/google/android/exoplayer/MediaFormat;
    .registers 24
    .param p1, "maxWidth"    # I
    .param p2, "maxHeight"    # I

    .prologue
    .line 220
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    move/from16 v18, v0

    move/from16 v19, p1

    move/from16 v20, p2

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public copyWithSubsampleOffsetUs(J)Lcom/google/android/exoplayer/MediaFormat;
    .registers 24
    .param p1, "subsampleOffsetUs"    # J

    .prologue
    .line 226
    new-instance v1, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    move/from16 v20, v0

    move-wide/from16 v15, p1

    invoke-direct/range {v1 .. v20}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 328
    if-ne p0, p1, :cond_6

    move v2, v4

    .line 351
    :goto_5
    return v2

    .line 331
    :cond_6
    if-eqz p1, :cond_12

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_14

    :cond_12
    move v2, v5

    .line 332
    goto :goto_5

    :cond_14
    move-object v1, p1

    .line 334
    check-cast v1, Lcom/google/android/exoplayer/MediaFormat;

    .line 335
    .local v1, "other":Lcom/google/android/exoplayer/MediaFormat;
    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    iget-boolean v3, v1, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->width:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->height:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    if-ne v2, v3, :cond_87

    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    iget v3, v1, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    if-ne v2, v3, :cond_87

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    iget-object v3, v1, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_87

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    iget-object v3, v1, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_87

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    iget-object v3, v1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_87

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, v1, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eq v2, v3, :cond_8a

    :cond_87
    move v2, v5

    .line 344
    goto/16 :goto_5

    .line 346
    :cond_8a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8b
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_af

    .line 347
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iget-object v3, v1, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_ac

    move v2, v5

    .line 348
    goto/16 :goto_5

    .line 346
    :cond_ac
    add-int/lit8 v0, v0, 0x1

    goto :goto_8b

    :cond_af
    move v2, v4

    .line 351
    goto/16 :goto_5
.end method

.method public final getFrameworkMediaFormatV16()Landroid/media/MediaFormat;
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 256
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    if-nez v2, :cond_8e

    .line 257
    new-instance v0, Landroid/media/MediaFormat;

    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 258
    .local v0, "format":Landroid/media/MediaFormat;
    const-string v2, "mime"

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    const-string v2, "language"

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetStringV16(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-string v2, "max-input-size"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 261
    const-string v2, "width"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 262
    const-string v2, "height"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 263
    const-string v2, "rotation-degrees"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 264
    const-string v2, "max-width"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 265
    const-string v2, "max-height"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 266
    const-string v2, "channel-count"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 267
    const-string v2, "sample-rate"

    iget v3, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    invoke-static {v0, v2, v3}, Lcom/google/android/exoplayer/MediaFormat;->maybeSetIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 268
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_50
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_7d

    .line 269
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "csd-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 268
    add-int/lit8 v1, v1, 0x1

    goto :goto_50

    .line 271
    :cond_7d
    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_8c

    .line 272
    const-string v2, "durationUs"

    iget-wide v3, p0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/media/MediaFormat;->setLong(Ljava/lang/String;J)V

    .line 274
    :cond_8c
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    .line 276
    .end local v0    # "format":Landroid/media/MediaFormat;
    .end local v1    # "i":I
    :cond_8e
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    return-object v2
.end method

.method public hashCode()I
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 301
    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    if-nez v2, :cond_a8

    .line 302
    const/16 v1, 0x11

    .line 303
    .local v1, "result":I
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    if-nez v2, :cond_8c

    move v2, v3

    :goto_c
    add-int/lit16 v1, v2, 0x20f

    .line 304
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    if-nez v2, :cond_94

    move v2, v3

    :goto_15
    add-int v1, v4, v2

    .line 305
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    add-int v1, v2, v4

    .line 306
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    add-int v1, v2, v4

    .line 307
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    add-int v1, v2, v4

    .line 308
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    add-int v1, v2, v4

    .line 309
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    add-int v1, v2, v4

    .line 310
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    invoke-static {v4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v4

    add-int v1, v2, v4

    .line 311
    mul-int/lit8 v2, v1, 0x1f

    iget-wide v4, p0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    long-to-int v4, v4

    add-int v1, v2, v4

    .line 312
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    if-eqz v2, :cond_9c

    const/16 v2, 0x4cf

    :goto_4e
    add-int v1, v4, v2

    .line 313
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    add-int v1, v2, v4

    .line 314
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    add-int v1, v2, v4

    .line 315
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    add-int v1, v2, v4

    .line 316
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    add-int v1, v2, v4

    .line 317
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    if-nez v4, :cond_9f

    :goto_6e
    add-int v1, v2, v3

    .line 318
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_71
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_a6

    .line 319
    mul-int/lit8 v3, v1, 0x1f

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int v1, v3, v2

    .line 318
    add-int/lit8 v0, v0, 0x1

    goto :goto_71

    .line 303
    .end local v0    # "i":I
    :cond_8c
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto/16 :goto_c

    .line 304
    :cond_94
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto/16 :goto_15

    .line 312
    :cond_9c
    const/16 v2, 0x4d5

    goto :goto_4e

    .line 317
    :cond_9f
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_6e

    .line 321
    .restart local v0    # "i":I
    :cond_a6
    iput v1, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    .line 323
    .end local v0    # "i":I
    .end local v1    # "result":I
    :cond_a8
    iget v2, p0, Lcom/google/android/exoplayer/MediaFormat;->hashCode:I

    return v2
.end method

.method final setFrameworkFormatV16(Landroid/media/MediaFormat;)V
    .registers 2
    .param p1, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 288
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaFormat;->frameworkMediaFormat:Landroid/media/MediaFormat;

    .line 289
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaFormat("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->trackId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxInputSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->pixelWidthHeightRatio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaFormat;->language:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaFormat;->adaptive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/MediaFormat;->maxHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
