.class public final Lcom/google/android/exoplayer/FrameworkSampleSource;
.super Ljava/lang/Object;
.source "FrameworkSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final ALLOWED_FLAGS_MASK:I = 0x3

.field private static final TRACK_STATE_DISABLED:I = 0x0

.field private static final TRACK_STATE_ENABLED:I = 0x1

.field private static final TRACK_STATE_FORMAT_SENT:I = 0x2


# instance fields
.field private final context:Landroid/content/Context;

.field private extractor:Landroid/media/MediaExtractor;

.field private final fileDescriptor:Ljava/io/FileDescriptor;

.field private final fileDescriptorLength:J

.field private final fileDescriptorOffset:J

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastSeekPositionUs:J

.field private pendingDiscontinuities:[Z

.field private pendingSeekPositionUs:J

.field private preparationError:Ljava/io/IOException;

.field private prepared:Z

.field private remainingReleaseCount:I

.field private trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

.field private trackStates:[I

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v2, 0x0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_29

    const/4 v0, 0x1

    :goto_c
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 95
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->context:Landroid/content/Context;

    .line 96
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->uri:Landroid/net/Uri;

    .line 97
    iput-object p3, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->headers:Ljava/util/Map;

    .line 98
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptor:Ljava/io/FileDescriptor;

    .line 99
    iput-wide v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorOffset:J

    .line 100
    iput-wide v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorLength:J

    .line 101
    return-void

    .line 94
    :cond_29
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public constructor <init>(Ljava/io/FileDescriptor;JJ)V
    .registers 9
    .param p1, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .param p2, "fileDescriptorOffset"    # J
    .param p4, "fileDescriptorLength"    # J

    .prologue
    const/4 v2, 0x0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_21

    const/4 v0, 0x1

    :goto_b
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 114
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/FileDescriptor;

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptor:Ljava/io/FileDescriptor;

    .line 115
    iput-wide p2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorOffset:J

    .line 116
    iput-wide p4, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorLength:J

    .line 117
    iput-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->context:Landroid/content/Context;

    .line 118
    iput-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->uri:Landroid/net/Uri;

    .line 119
    iput-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->headers:Ljava/util/Map;

    .line 120
    return-void

    .line 113
    :cond_21
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static createMediaFormat(Landroid/media/MediaFormat;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 26
    .param p0, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 308
    const-string v3, "mime"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 309
    .local v4, "mimeType":Ljava/lang/String;
    const-string v3, "language"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalStringV16(Landroid/media/MediaFormat;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 310
    .local v15, "language":Ljava/lang/String;
    const-string v3, "max-input-size"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v6

    .line 311
    .local v6, "maxInputSize":I
    const-string v3, "width"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v9

    .line 312
    .local v9, "width":I
    const-string v3, "height"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v10

    .line 313
    .local v10, "height":I
    const-string v3, "rotation-degrees"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v11

    .line 314
    .local v11, "rotationDegrees":I
    const-string v3, "channel-count"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v13

    .line 315
    .local v13, "channelCount":I
    const-string v3, "sample-rate"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I

    move-result v14

    .line 316
    .local v14, "sampleRate":I
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .local v18, "initializationData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_47
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "csd-"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_97

    .line 318
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "csd-"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v22

    .line 319
    .local v22, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual/range {v22 .. v22}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    new-array v0, v3, [B

    move-object/from16 v23, v0

    .line 320
    .local v23, "data":[B
    invoke-virtual/range {v22 .. v23}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 321
    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    invoke-virtual/range {v22 .. v22}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 317
    add-int/lit8 v24, v24, 0x1

    goto :goto_47

    .line 324
    .end local v22    # "buffer":Ljava/nio/ByteBuffer;
    .end local v23    # "data":[B
    :cond_97
    const-string v3, "durationUs"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c3

    const-string v3, "durationUs"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    move-result-wide v7

    .line 326
    .local v7, "durationUs":J
    :goto_a9
    new-instance v2, Lcom/google/android/exoplayer/MediaFormat;

    const/4 v3, 0x0

    const/4 v5, -0x1

    const/high16 v12, -0x40800000    # -1.0f

    const-wide v16, 0x7fffffffffffffffL

    const/16 v19, 0x0

    const/16 v20, -0x1

    const/16 v21, -0x1

    invoke-direct/range {v2 .. v21}, Lcom/google/android/exoplayer/MediaFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIJIIIFIILjava/lang/String;JLjava/util/List;ZII)V

    .line 330
    .local v2, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer/MediaFormat;->setFrameworkFormatV16(Landroid/media/MediaFormat;)V

    .line 331
    return-object v2

    .line 324
    .end local v2    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v7    # "durationUs":J
    :cond_c3
    const-wide/16 v7, -0x1

    goto :goto_a9
.end method

.method private getDrmInitDataV18()Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 279
    iget-object v5, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v5}, Landroid/media/MediaExtractor;->getPsshInfo()Ljava/util/Map;

    move-result-object v3

    .line 280
    .local v3, "psshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    if-eqz v3, :cond_e

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 281
    :cond_e
    const/4 v0, 0x0

    .line 288
    :cond_f
    return-object v0

    .line 283
    :cond_10
    new-instance v0, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;

    invoke-direct {v0}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;-><init>()V

    .line 284
    .local v0, "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/UUID;

    .line 285
    .local v4, "uuid":Ljava/util/UUID;
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v4, v5}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->buildPsshAtom(Ljava/util/UUID;[B)[B

    move-result-object v2

    .line 286
    .local v2, "psshAtom":[B
    new-instance v5, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    const-string v6, "video/mp4"

    invoke-direct {v5, v6, v2}, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v0, v4, v5}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;->put(Ljava/util/UUID;Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    goto :goto_1d
.end method

.method private static final getOptionalIntegerV16(Landroid/media/MediaFormat;Ljava/lang/String;)I
    .registers 3
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 341
    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method private static final getOptionalStringV16(Landroid/media/MediaFormat;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "format"    # Landroid/media/MediaFormat;
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 336
    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, p1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private seekToUsInternal(JZ)V
    .registers 7
    .param p1, "positionUs"    # J
    .param p3, "force"    # Z

    .prologue
    .line 294
    if-nez p3, :cond_8

    iget-wide v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingSeekPositionUs:J

    cmp-long v1, v1, p1

    if-eqz v1, :cond_26

    .line 295
    :cond_8
    iput-wide p1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->lastSeekPositionUs:J

    .line 296
    iput-wide p1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingSeekPositionUs:J

    .line 297
    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 298
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    array-length v1, v1

    if-ge v0, v1, :cond_26

    .line 299
    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aget v1, v1, v0

    if-eqz v1, :cond_23

    .line 300
    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0

    .line 298
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 304
    .end local v0    # "i":I
    :cond_26
    return-void
.end method


# virtual methods
.method public continueBuffering(IJ)Z
    .registers 5
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    .line 185
    const/4 v0, 0x1

    return v0
.end method

.method public disable(I)V
    .registers 4
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x0

    .line 235
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 236
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    :goto_d
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 237
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    .line 238
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v1, v0, p1

    .line 239
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aput v1, v0, p1

    .line 240
    return-void

    :cond_1e
    move v0, v1

    .line 236
    goto :goto_d
.end method

.method public enable(IJ)V
    .registers 9
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 172
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 173
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aget v0, v0, p1

    if-nez v0, :cond_24

    move v0, v1

    :goto_e
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 174
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aput v1, v0, p1

    .line 175
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 176
    const-wide/16 v3, 0x0

    cmp-long v0, p2, v3

    if-eqz v0, :cond_26

    :goto_20
    invoke-direct {p0, p2, p3, v1}, Lcom/google/android/exoplayer/FrameworkSampleSource;->seekToUsInternal(JZ)V

    .line 177
    return-void

    :cond_24
    move v0, v2

    .line 173
    goto :goto_e

    :cond_26
    move v1, v2

    .line 176
    goto :goto_20
.end method

.method public getBufferedPositionUs()J
    .registers 8

    .prologue
    const-wide/16 v4, -0x1

    .line 257
    iget-boolean v6, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v6}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 258
    iget-object v6, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->getCachedDuration()J

    move-result-wide v0

    .line 259
    .local v0, "bufferedDurationUs":J
    cmp-long v6, v0, v4

    if-nez v6, :cond_12

    .line 263
    :goto_11
    return-wide v4

    .line 262
    :cond_12
    iget-object v6, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v2

    .line 263
    .local v2, "sampleTime":J
    cmp-long v4, v2, v4

    if-nez v4, :cond_1f

    const-wide/16 v4, -0x3

    goto :goto_11

    :cond_1f
    add-long v4, v2, v0

    goto :goto_11
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 167
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 161
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    array-length v0, v0

    return v0
.end method

.method public maybeThrowError()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->preparationError:Ljava/io/IOException;

    if-eqz v0, :cond_7

    .line 245
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->preparationError:Ljava/io/IOException;

    throw v0

    .line 247
    :cond_7
    return-void
.end method

.method public prepare(J)Z
    .registers 13
    .param p1, "positionUs"    # J

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 130
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    if-nez v0, :cond_64

    .line 131
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->preparationError:Ljava/io/IOException;

    if-eqz v0, :cond_c

    move v0, v8

    .line 155
    :goto_b
    return v0

    .line 135
    :cond_c
    new-instance v0, Landroid/media/MediaExtractor;

    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    .line 137
    :try_start_13
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->context:Landroid/content/Context;

    if-eqz v0, :cond_51

    .line 138
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->uri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->headers:Ljava/util/Map;

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/MediaExtractor;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_22} :catch_5d

    .line 147
    :goto_22
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    .line 148
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    array-length v0, v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    .line 149
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    array-length v0, v0

    new-array v0, v0, [Lcom/google/android/exoplayer/MediaFormat;

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    .line 150
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3b
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    array-length v0, v0

    if-ge v7, v0, :cond_62

    .line 151
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v1, v7}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/exoplayer/FrameworkSampleSource;->createMediaFormat(Landroid/media/MediaFormat;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    aput-object v1, v0, v7

    .line 150
    add-int/lit8 v7, v7, 0x1

    goto :goto_3b

    .line 140
    .end local v7    # "i":I
    :cond_51
    :try_start_51
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    iget-object v1, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptor:Ljava/io/FileDescriptor;

    iget-wide v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorOffset:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->fileDescriptorLength:J

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaExtractor;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_5c} :catch_5d

    goto :goto_22

    .line 142
    :catch_5d
    move-exception v6

    .line 143
    .local v6, "e":Ljava/io/IOException;
    iput-object v6, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->preparationError:Ljava/io/IOException;

    move v0, v8

    .line 144
    goto :goto_b

    .line 153
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v7    # "i":I
    :cond_62
    iput-boolean v9, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    .end local v7    # "i":I
    :cond_64
    move v0, v9

    .line 155
    goto :goto_b
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I
    .registers 12
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v5, 0x2

    const/4 v3, 0x0

    const/4 v4, -0x2

    .line 200
    iget-boolean v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 201
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aget v2, v2, p1

    if-eqz v2, :cond_19

    const/4 v2, 0x1

    :goto_f
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 202
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v2, v2, p1

    if-eqz v2, :cond_1b

    .line 229
    :goto_18
    return v4

    :cond_19
    move v2, v3

    .line 201
    goto :goto_f

    .line 205
    :cond_1b
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aget v2, v2, p1

    if-eq v2, v5, :cond_3b

    .line 206
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v2, v2, p1

    iput-object v2, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 207
    sget v2, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v2, v3, :cond_39

    invoke-direct {p0}, Lcom/google/android/exoplayer/FrameworkSampleSource;->getDrmInitDataV18()Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v2

    :goto_31
    iput-object v2, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 208
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->trackStates:[I

    aput v5, v2, p1

    .line 209
    const/4 v4, -0x4

    goto :goto_18

    .line 207
    :cond_39
    const/4 v2, 0x0

    goto :goto_31

    .line 211
    :cond_3b
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v0

    .line 212
    .local v0, "extractorTrackIndex":I
    if-ne v0, p1, :cond_8c

    .line 213
    iget-object v2, p5, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_89

    .line 214
    iget-object v2, p5, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 215
    .local v1, "offset":I
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    iget-object v3, p5, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3, v1}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v2

    iput v2, p5, Lcom/google/android/exoplayer/SampleHolder;->size:I

    .line 216
    iget-object v2, p5, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    iget v3, p5, Lcom/google/android/exoplayer/SampleHolder;->size:I

    add-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 220
    .end local v1    # "offset":I
    :goto_5f
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v2

    iput-wide v2, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 221
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleFlags()I

    move-result v2

    and-int/lit8 v2, v2, 0x3

    iput v2, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 222
    invoke-virtual {p5}, Lcom/google/android/exoplayer/SampleHolder;->isEncrypted()Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 223
    iget-object v2, p5, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    iget-object v3, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/CryptoInfo;->setFromExtractorV16(Landroid/media/MediaExtractor;)V

    .line 225
    :cond_7e
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingSeekPositionUs:J

    .line 226
    iget-object v2, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->advance()Z

    .line 227
    const/4 v4, -0x3

    goto :goto_18

    .line 218
    :cond_89
    iput v3, p5, Lcom/google/android/exoplayer/SampleHolder;->size:I

    goto :goto_5f

    .line 229
    :cond_8c
    if-gez v0, :cond_91

    const/4 v2, -0x1

    :goto_8f
    move v4, v2

    goto :goto_18

    :cond_91
    move v2, v4

    goto :goto_8f
.end method

.method public readDiscontinuity(I)J
    .registers 4
    .param p1, "track"    # I

    .prologue
    .line 190
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_e

    .line 191
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->pendingDiscontinuities:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 192
    iget-wide v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->lastSeekPositionUs:J

    .line 194
    :goto_d
    return-wide v0

    :cond_e
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_d
.end method

.method public register()Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->remainingReleaseCount:I

    .line 125
    return-object p0
.end method

.method public release()V
    .registers 2

    .prologue
    .line 269
    iget v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->remainingReleaseCount:I

    if-lez v0, :cond_1d

    const/4 v0, 0x1

    :goto_5
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 270
    iget v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->remainingReleaseCount:I

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_1c

    .line 271
    iget-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 272
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->extractor:Landroid/media/MediaExtractor;

    .line 274
    :cond_1c
    return-void

    .line 269
    :cond_1d
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public seekToUs(J)V
    .registers 4
    .param p1, "positionUs"    # J

    .prologue
    .line 251
    iget-boolean v0, p0, Lcom/google/android/exoplayer/FrameworkSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 252
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/FrameworkSampleSource;->seekToUsInternal(JZ)V

    .line 253
    return-void
.end method
