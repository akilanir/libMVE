.class public final Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;
.super Ljava/lang/Object;
.source "ExtractorSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
.implements Lcom/google/android/exoplayer/extractor/ExtractorOutput;
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;,
        Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;,
        Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;,
        Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException;,
        Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/exoplayer/extractor/Extractor;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT_LIVE:I = 0x6

.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT_ON_DEMAND:I = 0x3

.field private static final MIN_RETRY_COUNT_DEFAULT_FOR_MEDIA:I = -0x1

.field private static final NO_RESET_PENDING:J = -0x8000000000000000L


# instance fields
.field private final allocator:Lcom/google/android/exoplayer/upstream/Allocator;

.field private currentLoadableException:Ljava/io/IOException;

.field private currentLoadableExceptionCount:I

.field private currentLoadableExceptionTimestamp:J

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private downstreamPositionUs:J

.field private volatile drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private enabledTrackCount:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;

.field private final eventSourceId:I

.field private extractedSampleCount:I

.field private extractedSampleCountAtStartOfLoad:I

.field private final extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

.field private havePendingNextSampleUs:Z

.field private lastSeekPositionUs:J

.field private loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private loadingFinished:Z

.field private maxTrackDurationUs:J

.field private mediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

.field private final minLoadableRetryCount:I

.field private pendingDiscontinuities:[Z

.field private pendingMediaFormat:[Z

.field private pendingNextSampleUs:J

.field private pendingResetPositionUs:J

.field private prepared:Z

.field private remainingReleaseCount:I

.field private final requestedBufferSize:I

.field private final sampleQueues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;",
            ">;"
        }
    .end annotation
.end field

.field private sampleTimeOffsetUs:J

.field private volatile seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

.field private trackEnabledStates:[Z

.field private volatile tracksBuilt:Z

.field private final uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    .line 125
    :try_start_7
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.webm.WebmExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_18
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_18} :catch_da

    .line 132
    :goto_18
    :try_start_18
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.mp4.FragmentedMp4Extractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/lang/ClassNotFoundException; {:try_start_18 .. :try_end_29} :catch_d7

    .line 139
    :goto_29
    :try_start_29
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.mp4.Mp4Extractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_29 .. :try_end_3a} :catch_d4

    .line 146
    :goto_3a
    :try_start_3a
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.mp3.Mp3Extractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3a .. :try_end_4b} :catch_d1

    .line 153
    :goto_4b
    :try_start_4b
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.ts.AdtsExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4b .. :try_end_5c} :catch_cf

    .line 160
    :goto_5c
    :try_start_5c
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.ts.TsExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5c .. :try_end_6d} :catch_cd

    .line 167
    :goto_6d
    :try_start_6d
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.flv.FlvExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6d .. :try_end_7e} :catch_cb

    .line 174
    :goto_7e
    :try_start_7e
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.ogg.OggVorbisExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_8f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7e .. :try_end_8f} :catch_c9

    .line 181
    :goto_8f
    :try_start_8f
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.ts.PsExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8f .. :try_end_a0} :catch_c7

    .line 188
    :goto_a0
    :try_start_a0
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.extractor.wav.WavExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_b1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a0 .. :try_end_b1} :catch_c5

    .line 195
    :goto_b1
    :try_start_b1
    sget-object v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.ext.flac.FlacExtractor"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_c2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_b1 .. :try_end_c2} :catch_c3

    .line 201
    :goto_c2
    return-void

    .line 198
    :catch_c3
    move-exception v0

    goto :goto_c2

    .line 191
    :catch_c5
    move-exception v0

    goto :goto_b1

    .line 184
    :catch_c7
    move-exception v0

    goto :goto_a0

    .line 177
    :catch_c9
    move-exception v0

    goto :goto_8f

    .line 170
    :catch_cb
    move-exception v0

    goto :goto_7e

    .line 163
    :catch_cd
    move-exception v0

    goto :goto_6d

    .line 156
    :catch_cf
    move-exception v0

    goto :goto_5c

    .line 149
    :catch_d1
    move-exception v0

    goto/16 :goto_4b

    .line 142
    :catch_d4
    move-exception v0

    goto/16 :goto_3a

    .line 135
    :catch_d7
    move-exception v0

    goto/16 :goto_29

    .line 128
    :catch_da
    move-exception v0

    goto/16 :goto_18
.end method

.method public varargs constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;IILandroid/os/Handler;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;I[Lcom/google/android/exoplayer/extractor/Extractor;)V
    .registers 14
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p4, "requestedBufferSize"    # I
    .param p5, "minLoadableRetryCount"    # I
    .param p6, "eventHandler"    # Landroid/os/Handler;
    .param p7, "eventListener"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;
    .param p8, "eventSourceId"    # I
    .param p9, "extractors"    # [Lcom/google/android/exoplayer/extractor/Extractor;

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->uri:Landroid/net/Uri;

    .line 317
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 318
    iput-object p7, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventListener:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;

    .line 319
    iput-object p6, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventHandler:Landroid/os/Handler;

    .line 320
    iput p8, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventSourceId:I

    .line 321
    iput-object p3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    .line 322
    iput p4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->requestedBufferSize:I

    .line 323
    iput p5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->minLoadableRetryCount:I

    .line 324
    if-eqz p9, :cond_18

    array-length v2, p9

    if-nez v2, :cond_49

    .line 325
    :cond_18
    sget-object v2, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array p9, v2, [Lcom/google/android/exoplayer/extractor/Extractor;

    .line 326
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_21
    array-length v2, p9

    if-ge v1, v2, :cond_49

    .line 328
    :try_start_24
    sget-object v2, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->DEFAULT_EXTRACTOR_CLASSES:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/extractor/Extractor;

    aput-object v2, p9, v1
    :try_end_34
    .catch Ljava/lang/InstantiationException; {:try_start_24 .. :try_end_34} :catch_37
    .catch Ljava/lang/IllegalAccessException; {:try_start_24 .. :try_end_34} :catch_40

    .line 326
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 329
    :catch_37
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unexpected error creating default extractor"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 331
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_40
    move-exception v0

    .line 332
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unexpected error creating default extractor"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 336
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "i":I
    :cond_49
    new-instance v2, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    invoke-direct {v2, p9, p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;-><init>([Lcom/google/android/exoplayer/extractor/Extractor;Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V

    iput-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    .line 337
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    .line 338
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    .line 339
    return-void
.end method

.method public varargs constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;II[Lcom/google/android/exoplayer/extractor/Extractor;)V
    .registers 17
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p4, "requestedBufferSize"    # I
    .param p5, "minLoadableRetryCount"    # I
    .param p6, "extractors"    # [Lcom/google/android/exoplayer/extractor/Extractor;

    .prologue
    .line 294
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;IILandroid/os/Handler;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;I[Lcom/google/android/exoplayer/extractor/Extractor;)V

    .line 296
    return-void
.end method

.method public varargs constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;ILandroid/os/Handler;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;I[Lcom/google/android/exoplayer/extractor/Extractor;)V
    .registers 19
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p4, "requestedBufferSize"    # I
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;
    .param p7, "eventSourceId"    # I
    .param p8, "extractors"    # [Lcom/google/android/exoplayer/extractor/Extractor;

    .prologue
    .line 277
    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;IILandroid/os/Handler;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;I[Lcom/google/android/exoplayer/extractor/Extractor;)V

    .line 279
    return-void
.end method

.method public varargs constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;I[Lcom/google/android/exoplayer/extractor/Extractor;)V
    .registers 13
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p4, "requestedBufferSize"    # I
    .param p5, "extractors"    # [Lcom/google/android/exoplayer/extractor/Extractor;

    .prologue
    .line 257
    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/Allocator;II[Lcom/google/android/exoplayer/extractor/Extractor;)V

    .line 259
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;

    .prologue
    .line 71
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventSourceId:I

    return v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;)Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventListener:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;

    return-object v0
.end method

.method static synthetic access$308(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;)I
    .registers 3
    .param p0, "x0"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;

    .prologue
    .line 71
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCount:I

    return v0
.end method

.method private clearState()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 730
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 731
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->clear()V

    .line 730
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 733
    :cond_18
    iput-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    .line 734
    iput-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 735
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionCount:I

    .line 736
    return-void
.end method

.method private createLoadableFromPositionUs(J)Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;
    .registers 11
    .param p1, "positionUs"    # J

    .prologue
    .line 708
    new-instance v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->uri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    iget v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->requestedBufferSize:I

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v6, p1, p2}, Lcom/google/android/exoplayer/extractor/SeekMap;->getPosition(J)J

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;Lcom/google/android/exoplayer/upstream/Allocator;IJ)V

    return-object v0
.end method

.method private createLoadableFromStart()Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;
    .registers 9

    .prologue
    .line 703
    new-instance v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->uri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    iget v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->requestedBufferSize:I

    const-wide/16 v6, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;Lcom/google/android/exoplayer/upstream/Allocator;IJ)V

    return-object v0
.end method

.method private discardSamplesForDisabledTracks(J)V
    .registers 5
    .param p1, "timeUs"    # J

    .prologue
    .line 722
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_1a

    .line 723
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_17

    .line 724
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v1, p1, p2}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->discardUntil(J)V

    .line 722
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 727
    :cond_1a
    return-void
.end method

.method private getRetryDelayMillis(J)J
    .registers 7
    .param p1, "errorCount"    # J

    .prologue
    .line 747
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private haveFormatsForAllTracks()Z
    .registers 3

    .prologue
    .line 713
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1c

    .line 714
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->hasFormat()Z

    move-result v1

    if-nez v1, :cond_19

    .line 715
    const/4 v1, 0x0

    .line 718
    :goto_18
    return v1

    .line 713
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 718
    :cond_1c
    const/4 v1, 0x1

    goto :goto_18
.end method

.method private isCurrentLoadableExceptionFatal()Z
    .registers 2

    .prologue
    .line 743
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    instance-of v0, v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException;

    return v0
.end method

.method private isPendingReset()Z
    .registers 5

    .prologue
    .line 739
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private maybeStartLoading()V
    .registers 14

    .prologue
    const-wide/16 v11, -0x1

    const-wide/high16 v9, -0x8000000000000000L

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 637
    iget-boolean v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    if-nez v5, :cond_12

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v5

    if-eqz v5, :cond_13

    .line 700
    :cond_12
    :goto_12
    return-void

    .line 641
    :cond_13
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v5, :cond_9a

    .line 642
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isCurrentLoadableExceptionFatal()Z

    move-result v5

    if-nez v5, :cond_12

    .line 645
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    if-eqz v5, :cond_22

    move v3, v4

    :cond_22
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 646
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionTimestamp:J

    sub-long v0, v5, v7

    .line 647
    .local v0, "elapsedMillis":J
    iget v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionCount:I

    int-to-long v5, v3

    invoke-direct {p0, v5, v6}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->getRetryDelayMillis(J)J

    move-result-wide v5

    cmp-long v3, v0, v5

    if-ltz v3, :cond_12

    .line 648
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 649
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    if-nez v3, :cond_68

    .line 653
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_40
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_56

    .line 654
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->clear()V

    .line 653
    add-int/lit8 v2, v2, 0x1

    goto :goto_40

    .line 656
    :cond_56
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->createLoadableFromStart()Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    .line 674
    .end local v2    # "i":I
    :cond_5c
    :goto_5c
    iget v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCount:I

    iput v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCountAtStartOfLoad:I

    .line 675
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    invoke-virtual {v3, v4, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_12

    .line 657
    :cond_68
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v3}, Lcom/google/android/exoplayer/extractor/SeekMap;->isSeekable()Z

    move-result v3

    if-nez v3, :cond_5c

    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    cmp-long v3, v5, v11

    if-nez v3, :cond_5c

    .line 662
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_77
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_8d

    .line 663
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->clear()V

    .line 662
    add-int/lit8 v2, v2, 0x1

    goto :goto_77

    .line 665
    :cond_8d
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->createLoadableFromStart()Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    .line 668
    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    iput-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingNextSampleUs:J

    .line 669
    iput-boolean v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->havePendingNextSampleUs:Z

    goto :goto_5c

    .line 683
    .end local v0    # "elapsedMillis":J
    .end local v2    # "i":I
    :cond_9a
    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleTimeOffsetUs:J

    .line 684
    iput-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->havePendingNextSampleUs:Z

    .line 686
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    if-nez v3, :cond_b7

    .line 687
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->createLoadableFromStart()Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    .line 698
    :goto_aa
    iget v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCount:I

    iput v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCountAtStartOfLoad:I

    .line 699
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    invoke-virtual {v3, v4, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto/16 :goto_12

    .line 689
    :cond_b7
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v3

    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 690
    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    cmp-long v3, v5, v11

    if-eqz v3, :cond_d2

    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    cmp-long v3, v5, v7

    if-ltz v3, :cond_d2

    .line 691
    iput-boolean v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    .line 692
    iput-wide v9, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    goto/16 :goto_12

    .line 695
    :cond_d2
    iget-wide v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    invoke-direct {p0, v3, v4}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->createLoadableFromPositionUs(J)Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadable:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;

    .line 696
    iput-wide v9, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    goto :goto_aa
.end method

.method private notifyLoadError(Ljava/io/IOException;)V
    .registers 4
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 751
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventListener:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener;

    if-eqz v0, :cond_12

    .line 752
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$1;-><init>(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 759
    :cond_12
    return-void
.end method

.method private restartFrom(J)V
    .registers 4
    .param p1, "positionUs"    # J

    .prologue
    .line 626
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    .line 627
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    .line 628
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 629
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 634
    :goto_12
    return-void

    .line 631
    :cond_13
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->clearState()V

    .line 632
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maybeStartLoading()V

    goto :goto_12
.end method


# virtual methods
.method public continueBuffering(IJ)Z
    .registers 9
    .param p1, "track"    # I
    .param p2, "playbackPositionUs"    # J

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 426
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 427
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aget-boolean v0, v0, p1

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 428
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    .line 429
    iget-wide v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    invoke-direct {p0, v3, v4}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->discardSamplesForDisabledTracks(J)V

    .line 430
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    if-eqz v0, :cond_1a

    .line 437
    :goto_19
    return v1

    .line 433
    :cond_1a
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maybeStartLoading()V

    .line 434
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_25

    move v1, v2

    .line 435
    goto :goto_19

    .line 437
    :cond_25
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_36

    move v0, v1

    :goto_34
    move v1, v0

    goto :goto_19

    :cond_36
    move v0, v2

    goto :goto_34
.end method

.method public disable(I)V
    .registers 5
    .param p1, "track"    # I

    .prologue
    const/4 v2, 0x0

    .line 409
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 410
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aget-boolean v0, v0, p1

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 411
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    .line 412
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aput-boolean v2, v0, p1

    .line 413
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    if-nez v0, :cond_2c

    .line 414
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    .line 415
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 416
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 422
    :cond_2c
    :goto_2c
    return-void

    .line 418
    :cond_2d
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->clearState()V

    .line 419
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    invoke-interface {v0, v2}, Lcom/google/android/exoplayer/upstream/Allocator;->trim(I)V

    goto :goto_2c
.end method

.method public drmInitData(Lcom/google/android/exoplayer/drm/DrmInitData;)V
    .registers 2
    .param p1, "drmInitData"    # Lcom/google/android/exoplayer/drm/DrmInitData;

    .prologue
    .line 620
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 621
    return-void
.end method

.method public enable(IJ)V
    .registers 7
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 392
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 393
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_39

    move v0, v1

    :goto_e
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 394
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    .line 395
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    aput-boolean v1, v0, p1

    .line 396
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingMediaFormat:[Z

    aput-boolean v1, v0, p1

    .line 397
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v2, v0, p1

    .line 398
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    if-ne v0, v1, :cond_38

    .line 400
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/SeekMap;->isSeekable()Z

    move-result v0

    if-nez v0, :cond_31

    const-wide/16 p2, 0x0

    .line 401
    :cond_31
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    .line 402
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->lastSeekPositionUs:J

    .line 403
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->restartFrom(J)V

    .line 405
    :cond_38
    return-void

    :cond_39
    move v0, v2

    .line 393
    goto :goto_e
.end method

.method public endTracks()V
    .registers 2

    .prologue
    .line 610
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->tracksBuilt:Z

    .line 611
    return-void
.end method

.method public getBufferedPositionUs()J
    .registers 6

    .prologue
    .line 539
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    if-eqz v3, :cond_7

    .line 540
    const-wide/16 v1, -0x3

    .line 549
    :cond_6
    :goto_6
    return-wide v1

    .line 541
    :cond_7
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 542
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    goto :goto_6

    .line 544
    :cond_10
    const-wide/high16 v1, -0x8000000000000000L

    .line 545
    .local v1, "largestParsedTimestampUs":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_2e

    .line 546
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->getLargestParsedTimestampUs()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 545
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 549
    :cond_2e
    const-wide/high16 v3, -0x8000000000000000L

    cmp-long v3, v1, v3

    if-nez v3, :cond_6

    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    goto :goto_6
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 387
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->mediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 381
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    return v0
.end method

.method public maybeThrowError()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-nez v1, :cond_5

    .line 504
    :cond_4
    return-void

    .line 490
    :cond_5
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isCurrentLoadableExceptionFatal()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 491
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v1

    .line 494
    :cond_e
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->minLoadableRetryCount:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1c

    .line 495
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->minLoadableRetryCount:I

    .line 501
    .local v0, "minLoadableRetryCountForMedia":I
    :goto_15
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionCount:I

    if-le v1, v0, :cond_4

    .line 502
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v1

    .line 497
    .end local v0    # "minLoadableRetryCountForMedia":I
    :cond_1c
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v1}, Lcom/google/android/exoplayer/extractor/SeekMap;->isSeekable()Z

    move-result v1

    if-nez v1, :cond_2a

    const/4 v0, 0x6

    .restart local v0    # "minLoadableRetryCountForMedia":I
    :goto_29
    goto :goto_15

    .end local v0    # "minLoadableRetryCountForMedia":I
    :cond_2a
    const/4 v0, 0x3

    goto :goto_29
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 578
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    if-lez v0, :cond_a

    .line 579
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->restartFrom(J)V

    .line 584
    :goto_9
    return-void

    .line 581
    :cond_a
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->clearState()V

    .line 582
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/upstream/Allocator;->trim(I)V

    goto :goto_9
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 3
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 573
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    .line 574
    return-void
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .registers 5
    .param p1, "ignored"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 588
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 589
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCount:I

    iget v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractedSampleCountAtStartOfLoad:I

    if-le v0, v1, :cond_18

    const/4 v0, 0x1

    :goto_9
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionCount:I

    .line 591
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionTimestamp:J

    .line 592
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->notifyLoadError(Ljava/io/IOException;)V

    .line 593
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maybeStartLoading()V

    .line 594
    return-void

    .line 589
    :cond_18
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method public prepare(J)Z
    .registers 14
    .param p1, "positionUs"    # J

    .prologue
    const-wide/16 v9, -0x1

    const/4 v4, 0x1

    .line 349
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    if-eqz v3, :cond_9

    move v3, v4

    .line 376
    :goto_8
    return v3

    .line 352
    :cond_9
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-nez v3, :cond_16

    .line 353
    new-instance v3, Lcom/google/android/exoplayer/upstream/Loader;

    const-string v5, "Loader:ExtractorSampleSource"

    invoke-direct {v3, v5}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 356
    :cond_16
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maybeStartLoading()V

    .line 358
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    if-eqz v3, :cond_6b

    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->tracksBuilt:Z

    if-eqz v3, :cond_6b

    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->haveFormatsForAllTracks()Z

    move-result v3

    if-eqz v3, :cond_6b

    .line 359
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 360
    .local v2, "trackCount":I
    new-array v3, v2, [Z

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->trackEnabledStates:[Z

    .line 361
    new-array v3, v2, [Z

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    .line 362
    new-array v3, v2, [Z

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingMediaFormat:[Z

    .line 363
    new-array v3, v2, [Lcom/google/android/exoplayer/MediaFormat;

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->mediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    .line 364
    iput-wide v9, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    .line 365
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_40
    if-ge v1, v2, :cond_67

    .line 366
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->getFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    .line 367
    .local v0, "format":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->mediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aput-object v0, v3, v1

    .line 368
    iget-wide v5, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    cmp-long v3, v5, v9

    if-eqz v3, :cond_64

    iget-wide v5, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    cmp-long v3, v5, v7

    if-lez v3, :cond_64

    .line 369
    iget-wide v5, v0, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    iput-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->maxTrackDurationUs:J

    .line 365
    :cond_64
    add-int/lit8 v1, v1, 0x1

    goto :goto_40

    .line 372
    .end local v0    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_67
    iput-boolean v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    move v3, v4

    .line 373
    goto :goto_8

    .line 376
    .end local v1    # "i":I
    .end local v2    # "trackCount":I
    :cond_6b
    const/4 v3, 0x0

    goto :goto_8
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I
    .registers 13
    .param p1, "track"    # I
    .param p2, "playbackPositionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v3, -0x2

    const/4 v2, 0x0

    .line 452
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    .line 454
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v4, v4, p1

    if-nez v4, :cond_10

    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v4

    if-eqz v4, :cond_12

    :cond_10
    move v2, v3

    .line 482
    :goto_11
    return v2

    .line 458
    :cond_12
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    .line 459
    .local v1, "sampleQueue":Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingMediaFormat:[Z

    aget-boolean v4, v4, p1

    if-eqz v4, :cond_30

    .line 460
    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->getFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    iput-object v3, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 461
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    iput-object v3, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 462
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingMediaFormat:[Z

    aput-boolean v2, v3, p1

    .line 463
    const/4 v2, -0x4

    goto :goto_11

    .line 466
    :cond_30
    invoke-virtual {v1, p5}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->getSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v4

    if-eqz v4, :cond_62

    .line 467
    iget-wide v3, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->lastSeekPositionUs:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_5e

    const/4 v0, 0x1

    .line 468
    .local v0, "decodeOnly":Z
    :goto_3f
    iget v4, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    if-eqz v0, :cond_60

    const/high16 v3, 0x8000000

    :goto_45
    or-int/2addr v3, v4

    iput v3, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 469
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->havePendingNextSampleUs:Z

    if-eqz v3, :cond_55

    .line 471
    iget-wide v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingNextSampleUs:J

    iget-wide v5, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleTimeOffsetUs:J

    .line 472
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->havePendingNextSampleUs:Z

    .line 474
    :cond_55
    iget-wide v2, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleTimeOffsetUs:J

    add-long/2addr v2, v4

    iput-wide v2, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 475
    const/4 v2, -0x3

    goto :goto_11

    .end local v0    # "decodeOnly":Z
    :cond_5e
    move v0, v2

    .line 467
    goto :goto_3f

    .restart local v0    # "decodeOnly":Z
    :cond_60
    move v3, v2

    .line 468
    goto :goto_45

    .line 478
    .end local v0    # "decodeOnly":Z
    :cond_62
    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loadingFinished:Z

    if-eqz v2, :cond_68

    .line 479
    const/4 v2, -0x1

    goto :goto_11

    :cond_68
    move v2, v3

    .line 482
    goto :goto_11
.end method

.method public readDiscontinuity(I)J
    .registers 4
    .param p1, "track"    # I

    .prologue
    .line 442
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_e

    .line 443
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 444
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->lastSeekPositionUs:J

    .line 446
    :goto_d
    return-wide v0

    :cond_e
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_d
.end method

.method public register()Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .registers 2

    .prologue
    .line 343
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->remainingReleaseCount:I

    .line 344
    return-object p0
.end method

.method public release()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 556
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->remainingReleaseCount:I

    if-lez v0, :cond_33

    const/4 v0, 0x1

    :goto_6
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 557
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->remainingReleaseCount:I

    if-nez v0, :cond_32

    .line 558
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_1c

    .line 559
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 560
    iput-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 562
    :cond_1c
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    # getter for: Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->access$000(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;)Lcom/google/android/exoplayer/extractor/Extractor;

    move-result-object v0

    if-eqz v0, :cond_32

    .line 563
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    # getter for: Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->access$000(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;)Lcom/google/android/exoplayer/extractor/Extractor;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/Extractor;->release()V

    .line 564
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    # setter for: Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;
    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->access$002(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;Lcom/google/android/exoplayer/extractor/Extractor;)Lcom/google/android/exoplayer/extractor/Extractor;

    .line 567
    :cond_32
    return-void

    .line 556
    :cond_33
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V
    .registers 2
    .param p1, "seekMap"    # Lcom/google/android/exoplayer/extractor/SeekMap;

    .prologue
    .line 615
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    .line 616
    return-void
.end method

.method public seekToUs(J)V
    .registers 10
    .param p1, "positionUs"    # J

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 508
    iget-boolean v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->prepared:Z

    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 509
    iget v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->enabledTrackCount:I

    if-lez v4, :cond_2a

    move v4, v5

    :goto_c
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 511
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->seekMap:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v4}, Lcom/google/android/exoplayer/extractor/SeekMap;->isSeekable()Z

    move-result v4

    if-nez v4, :cond_19

    const-wide/16 p1, 0x0

    .line 513
    :cond_19
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v4

    if-eqz v4, :cond_2c

    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingResetPositionUs:J

    .line 514
    .local v0, "currentPositionUs":J
    :goto_21
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    .line 515
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->lastSeekPositionUs:J

    .line 516
    cmp-long v4, v0, p1

    if-nez v4, :cond_2f

    .line 535
    :cond_29
    return-void

    .end local v0    # "currentPositionUs":J
    :cond_2a
    move v4, v6

    .line 509
    goto :goto_c

    .line 513
    :cond_2c
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->downstreamPositionUs:J

    goto :goto_21

    .line 521
    .restart local v0    # "currentPositionUs":J
    :cond_2f
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->isPendingReset()Z

    move-result v4

    if-nez v4, :cond_51

    move v3, v5

    .line 522
    .local v3, "seekInsideBuffer":Z
    :goto_36
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_37
    if-eqz v3, :cond_53

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v2, v4, :cond_53

    .line 523
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    invoke-virtual {v4, p1, p2}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;->skipToKeyframeBefore(J)Z

    move-result v4

    and-int/2addr v3, v4

    .line 522
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .end local v2    # "i":I
    .end local v3    # "seekInsideBuffer":Z
    :cond_51
    move v3, v6

    .line 521
    goto :goto_36

    .line 527
    .restart local v2    # "i":I
    .restart local v3    # "seekInsideBuffer":Z
    :cond_53
    if-nez v3, :cond_58

    .line 528
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->restartFrom(J)V

    .line 532
    :cond_58
    const/4 v2, 0x0

    :goto_59
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    array-length v4, v4

    if-ge v2, v4, :cond_29

    .line 533
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v5, v4, v2

    .line 532
    add-int/lit8 v2, v2, 0x1

    goto :goto_59
.end method

.method public track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 600
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    .line 601
    .local v0, "sampleQueue":Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;
    if-nez v0, :cond_16

    .line 602
    new-instance v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;

    .end local v0    # "sampleQueue":Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;-><init>(Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;Lcom/google/android/exoplayer/upstream/Allocator;)V

    .line 603
    .restart local v0    # "sampleQueue":Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput;
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 605
    :cond_16
    return-object v0
.end method
