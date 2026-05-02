.class public Lcom/google/android/exoplayer/dash/DashChunkSource;
.super Ljava/lang/Object;
.source "DashChunkSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/ChunkSource;
.implements Lcom/google/android/exoplayer/dash/DashTrackSelector$Output;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$NoAdaptationSetException;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DashChunkSource"


# instance fields
.field private final adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

.field private availableRange:Lcom/google/android/exoplayer/TimeRange;

.field private final availableRangeValues:[J

.field private currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final elapsedRealtimeOffsetUs:J

.field private enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

.field private final evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;

.field private final eventSourceId:I

.field private fatalError:Ljava/io/IOException;

.field private lastChunkWasInitialization:Z

.field private final live:Z

.field private final liveEdgeLatencyUs:J

.field private final manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;"
        }
    .end annotation
.end field

.field private nextPeriodHolderIndex:I

.field private final periodHolders:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;",
            ">;"
        }
    .end annotation
.end field

.field private prepareCalled:Z

.field private processedManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

.field private startAtLiveEdge:Z

.field private final systemClock:Lcom/google/android/exoplayer/util/Clock;

.field private final trackSelector:Lcom/google/android/exoplayer/dash/DashTrackSelector;

.field private final tracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;JILjava/util/List;)V
    .registers 9
    .param p1, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p4, "durationMs"    # J
    .param p6, "adaptationSetType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/DashTrackSelector;",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "JI",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p7, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    invoke-static {p4, p5, p6, p7}, Lcom/google/android/exoplayer/dash/DashChunkSource;->buildManifest(JILjava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V

    .line 171
    return-void
.end method

.method public varargs constructor <init>(Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;JI[Lcom/google/android/exoplayer/dash/mpd/Representation;)V
    .registers 16
    .param p1, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p4, "durationMs"    # J
    .param p6, "adaptationSetType"    # I
    .param p7, "representations"    # [Lcom/google/android/exoplayer/dash/mpd/Representation;

    .prologue
    .line 150
    invoke-static {p7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;JILjava/util/List;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V
    .registers 20
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .prologue
    .line 183
    const/4 v1, 0x0

    new-instance v6, Lcom/google/android/exoplayer/util/SystemClock;

    invoke-direct {v6}, Lcom/google/android/exoplayer/util/SystemClock;-><init>()V

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    invoke-direct/range {v0 .. v14}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;Lcom/google/android/exoplayer/util/Clock;JJZLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V

    .line 185
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;JJLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V
    .registers 27
    .param p2, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p5, "liveEdgeLatencyMs"    # J
    .param p7, "elapsedRealtimeOffsetMs"    # J
    .param p9, "eventHandler"    # Landroid/os/Handler;
    .param p10, "eventListener"    # Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;
    .param p11, "eventSourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;",
            "Lcom/google/android/exoplayer/dash/DashTrackSelector;",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "JJ",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 215
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    new-instance v6, Lcom/google/android/exoplayer/util/SystemClock;

    invoke-direct {v6}, Lcom/google/android/exoplayer/util/SystemClock;-><init>()V

    const-wide/16 v0, 0x3e8

    mul-long v7, p5, v0

    const-wide/16 v0, 0x3e8

    mul-long v9, p7, v0

    const/4 v11, 0x1

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v12, p9

    move-object/from16 v13, p10

    move/from16 v14, p11

    invoke-direct/range {v0 .. v14}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;Lcom/google/android/exoplayer/util/Clock;JJZLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V

    .line 218
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;JJZLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V
    .registers 28
    .param p2, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p5, "liveEdgeLatencyMs"    # J
    .param p7, "elapsedRealtimeOffsetMs"    # J
    .param p9, "startAtLiveEdge"    # Z
    .param p10, "eventHandler"    # Landroid/os/Handler;
    .param p11, "eventListener"    # Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;
    .param p12, "eventSourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;",
            "Lcom/google/android/exoplayer/dash/DashTrackSelector;",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "JJZ",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 248
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    new-instance v6, Lcom/google/android/exoplayer/util/SystemClock;

    invoke-direct {v6}, Lcom/google/android/exoplayer/util/SystemClock;-><init>()V

    const-wide/16 v0, 0x3e8

    mul-long v7, p5, v0

    const-wide/16 v0, 0x3e8

    mul-long v9, p7, v0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move/from16 v14, p12

    invoke-direct/range {v0 .. v14}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;Lcom/google/android/exoplayer/util/Clock;JJZLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V

    .line 252
    return-void
.end method

.method constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;Lcom/google/android/exoplayer/dash/DashTrackSelector;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;Lcom/google/android/exoplayer/util/Clock;JJZLandroid/os/Handler;Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;I)V
    .registers 16
    .param p2, "initialManifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p3, "trackSelector"    # Lcom/google/android/exoplayer/dash/DashTrackSelector;
    .param p4, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p5, "adaptiveFormatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p6, "systemClock"    # Lcom/google/android/exoplayer/util/Clock;
    .param p7, "liveEdgeLatencyUs"    # J
    .param p9, "elapsedRealtimeOffsetUs"    # J
    .param p11, "startAtLiveEdge"    # Z
    .param p12, "eventHandler"    # Landroid/os/Handler;
    .param p13, "eventListener"    # Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;
    .param p14, "eventSourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            "Lcom/google/android/exoplayer/dash/DashTrackSelector;",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "Lcom/google/android/exoplayer/util/Clock;",
            "JJZ",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 259
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 261
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 262
    iput-object p3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->trackSelector:Lcom/google/android/exoplayer/dash/DashTrackSelector;

    .line 263
    iput-object p4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 264
    iput-object p5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .line 265
    iput-object p6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->systemClock:Lcom/google/android/exoplayer/util/Clock;

    .line 266
    iput-wide p7, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->liveEdgeLatencyUs:J

    .line 267
    iput-wide p9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->elapsedRealtimeOffsetUs:J

    .line 268
    iput-boolean p11, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->startAtLiveEdge:Z

    .line 269
    iput-object p12, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventHandler:Landroid/os/Handler;

    .line 270
    iput-object p13, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventListener:Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;

    .line 271
    iput p14, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventSourceId:I

    .line 272
    new-instance v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-direct {v0}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    .line 273
    const/4 v0, 0x2

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    .line 274
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    .line 275
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    .line 276
    iget-boolean v0, p2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    iput-boolean v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->live:Z

    .line 277
    return-void
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer/dash/DashChunkSource;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource;

    .prologue
    .line 78
    iget v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventSourceId:I

    return v0
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer/dash/DashChunkSource;)Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventListener:Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;

    return-object v0
.end method

.method private static buildManifest(JILjava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .registers 24
    .param p0, "durationMs"    # J
    .param p2, "adaptationSetType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;"
        }
    .end annotation

    .prologue
    .line 623
    .local p3, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    new-instance v18, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    const/4 v3, 0x0

    move-object/from16 v0, v18

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0, v3, v1, v2}, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;-><init>(IILjava/util/List;)V

    .line 624
    .local v18, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    new-instance v19, Lcom/google/android/exoplayer/dash/mpd/Period;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    invoke-static/range {v18 .. v18}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-direct {v0, v3, v4, v5, v6}, Lcom/google/android/exoplayer/dash/mpd/Period;-><init>(Ljava/lang/String;JLjava/util/List;)V

    .line 625
    .local v19, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    new-instance v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    const-wide/16 v4, -0x1

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const-wide/16 v11, -0x1

    const-wide/16 v13, -0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v19 .. v19}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    move-wide/from16 v6, p0

    invoke-direct/range {v3 .. v17}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;-><init>(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/lang/String;Ljava/util/List;)V

    return-object v3
.end method

.method private findPeriodHolder(J)Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .registers 8
    .param p1, "positionUs"    # J

    .prologue
    const/4 v4, 0x0

    .line 730
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableStartTimeUs()J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-gez v2, :cond_1a

    .line 731
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 742
    :goto_19
    return-object v2

    .line 734
    :cond_1a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_3a

    .line 735
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 736
    .local v1, "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    invoke-virtual {v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableEndTimeUs()J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-gez v2, :cond_37

    move-object v2, v1

    .line 737
    goto :goto_19

    .line 734
    :cond_37
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 742
    .end local v1    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    :cond_3a
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    goto :goto_19
.end method

.method private getAvailableRange(J)Lcom/google/android/exoplayer/TimeRange;
    .registers 23
    .param p1, "nowUnixTimeUs"    # J

    .prologue
    .line 796
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 797
    .local v12, "firstPeriod":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v11}, Landroid/util/SparseArray;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 799
    .local v13, "lastPeriod":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v2, v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v2, :cond_2d

    invoke-virtual {v13}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->isIndexExplicit()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 800
    :cond_2d
    new-instance v2, Lcom/google/android/exoplayer/TimeRange$StaticTimeRange;

    invoke-virtual {v12}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableStartTimeUs()J

    move-result-wide v14

    invoke-virtual {v13}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableEndTimeUs()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-direct {v2, v14, v15, v0, v1}, Lcom/google/android/exoplayer/TimeRange$StaticTimeRange;-><init>(JJ)V

    .line 811
    :goto_3c
    return-object v2

    .line 804
    :cond_3d
    invoke-virtual {v12}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableStartTimeUs()J

    move-result-wide v3

    .line 805
    .local v3, "minStartPositionUs":J
    invoke-virtual {v13}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->isIndexUnbounded()Z

    move-result v2

    if-eqz v2, :cond_80

    const-wide v5, 0x7fffffffffffffffL

    .line 807
    .local v5, "maxEndPositionUs":J
    :goto_4c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->systemClock:Lcom/google/android/exoplayer/util/Clock;

    invoke-interface {v2}, Lcom/google/android/exoplayer/util/Clock;->elapsedRealtime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->availabilityStartTime:J

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x3e8

    mul-long v16, v16, v18

    sub-long v16, p1, v16

    sub-long v7, v14, v16

    .line 809
    .local v7, "elapsedRealtimeAtZeroUs":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v14, v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->timeShiftBufferDepth:J

    const-wide/16 v16, -0x1

    cmp-long v2, v14, v16

    if-nez v2, :cond_85

    const-wide/16 v9, -0x1

    .line 811
    .local v9, "timeShiftBufferDepthUs":J
    :goto_76
    new-instance v2, Lcom/google/android/exoplayer/TimeRange$DynamicTimeRange;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->systemClock:Lcom/google/android/exoplayer/util/Clock;

    invoke-direct/range {v2 .. v11}, Lcom/google/android/exoplayer/TimeRange$DynamicTimeRange;-><init>(JJJJLcom/google/android/exoplayer/util/Clock;)V

    goto :goto_3c

    .line 805
    .end local v5    # "maxEndPositionUs":J
    .end local v7    # "elapsedRealtimeAtZeroUs":J
    .end local v9    # "timeShiftBufferDepthUs":J
    :cond_80
    invoke-virtual {v13}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getAvailableEndTimeUs()J

    move-result-wide v5

    goto :goto_4c

    .line 809
    .restart local v5    # "maxEndPositionUs":J
    .restart local v7    # "elapsedRealtimeAtZeroUs":J
    :cond_85
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v14, v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->timeShiftBufferDepth:J

    const-wide/16 v16, 0x3e8

    mul-long v9, v14, v16

    goto :goto_76
.end method

.method private static getMediaMimeType(Lcom/google/android/exoplayer/chunk/Format;)Ljava/lang/String;
    .registers 4
    .param p0, "format"    # Lcom/google/android/exoplayer/chunk/Format;

    .prologue
    .line 648
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    .line 649
    .local v0, "formatMimeType":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 650
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/exoplayer/util/MimeTypes;->getAudioMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 663
    .end local v0    # "formatMimeType":Ljava/lang/String;
    :cond_e
    :goto_e
    return-object v0

    .line 651
    .restart local v0    # "formatMimeType":Ljava/lang/String;
    :cond_f
    invoke-static {v0}, Lcom/google/android/exoplayer/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 652
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/exoplayer/util/MimeTypes;->getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 653
    :cond_1c
    invoke-static {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 655
    const-string v1, "application/mp4"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 656
    const-string v1, "stpp"

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 657
    const-string v0, "application/ttml+xml"

    goto :goto_e

    .line 659
    :cond_37
    const-string v1, "wvtt"

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 660
    const-string v0, "application/x-mp4vtt"

    goto :goto_e

    .line 663
    :cond_44
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private getNowUnixTimeUs()J
    .registers 7

    .prologue
    const-wide/16 v4, 0x3e8

    .line 721
    iget-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->elapsedRealtimeOffsetUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_15

    .line 722
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->systemClock:Lcom/google/android/exoplayer/util/Clock;

    invoke-interface {v0}, Lcom/google/android/exoplayer/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    mul-long/2addr v0, v4

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->elapsedRealtimeOffsetUs:J

    add-long/2addr v0, v2

    .line 724
    :goto_14
    return-wide v0

    :cond_15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    mul-long/2addr v0, v4

    goto :goto_14
.end method

.method private static getTrackFormat(ILcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;
    .registers 15
    .param p0, "adaptationSetType"    # I
    .param p1, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p2, "mediaMimeType"    # Ljava/lang/String;
    .param p3, "durationUs"    # J

    .prologue
    const/4 v3, -0x1

    const/4 v8, 0x0

    .line 631
    packed-switch p0, :pswitch_data_34

    .line 643
    :goto_5
    return-object v8

    .line 633
    :pswitch_6
    iget-object v0, p1, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, p1, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v6, p1, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v7, p1, Lcom/google/android/exoplayer/chunk/Format;->height:I

    move-object v1, p2

    move-wide v4, p3

    invoke-static/range {v0 .. v8}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v8

    goto :goto_5

    .line 636
    :pswitch_15
    iget-object v0, p1, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, p1, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v6, p1, Lcom/google/android/exoplayer/chunk/Format;->audioChannels:I

    iget v7, p1, Lcom/google/android/exoplayer/chunk/Format;->audioSamplingRate:I

    iget-object v9, p1, Lcom/google/android/exoplayer/chunk/Format;->language:Ljava/lang/String;

    move-object v1, p2

    move-wide v4, p3

    invoke-static/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v8

    goto :goto_5

    .line 640
    :pswitch_26
    iget-object v0, p1, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, p1, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget-object v5, p1, Lcom/google/android/exoplayer/chunk/Format;->language:Ljava/lang/String;

    move-object v1, p2

    move-wide v3, p3

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v8

    goto :goto_5

    .line 631
    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_6
        :pswitch_15
        :pswitch_26
    .end packed-switch
.end method

.method static mimeTypeIsRawText(Ljava/lang/String;)Z
    .registers 2
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 672
    const-string v0, "text/vtt"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "application/ttml+xml"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method static mimeTypeIsWebm(Ljava/lang/String;)Z
    .registers 2
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 667
    const-string v0, "video/webm"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "audio/webm"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "application/webm"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private newInitializationChunk(Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;Lcom/google/android/exoplayer/upstream/DataSource;II)Lcom/google/android/exoplayer/chunk/Chunk;
    .registers 17
    .param p1, "initializationUri"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "indexUri"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p3, "representation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;
    .param p4, "extractor"    # Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;
    .param p5, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p6, "manifestIndex"    # I
    .param p7, "trigger"    # I

    .prologue
    .line 679
    if-eqz p1, :cond_28

    .line 682
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->attemptMerge(Lcom/google/android/exoplayer/dash/mpd/RangedUri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v8

    .line 683
    .local v8, "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    if-nez v8, :cond_9

    .line 684
    move-object v8, p1

    .line 689
    :cond_9
    :goto_9
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v1

    iget-wide v2, v8, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v4, v8, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    invoke-virtual {p3}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 691
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v1, Lcom/google/android/exoplayer/chunk/InitializationChunk;

    iget-object v5, p3, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object v2, p5

    move-object v3, v0

    move/from16 v4, p7

    move-object v6, p4

    move v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/chunk/InitializationChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;I)V

    return-object v1

    .line 687
    .end local v0    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v8    # "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    :cond_28
    move-object v8, p2

    .restart local v8    # "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    goto :goto_9
.end method

.method private notifyAvailableRangeChanged(Lcom/google/android/exoplayer/TimeRange;)V
    .registers 4
    .param p1, "seekRange"    # Lcom/google/android/exoplayer/TimeRange;

    .prologue
    .line 816
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventListener:Lcom/google/android/exoplayer/dash/DashChunkSource$EventListener;

    if-eqz v0, :cond_12

    .line 817
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/dash/DashChunkSource$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/dash/DashChunkSource$1;-><init>(Lcom/google/android/exoplayer/dash/DashChunkSource;Lcom/google/android/exoplayer/TimeRange;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 824
    :cond_12
    return-void
.end method

.method private processManifest(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;)V
    .registers 16
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .prologue
    .line 747
    const/4 v8, 0x0

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v1

    .line 749
    .local v1, "firstPeriod":Lcom/google/android/exoplayer/dash/mpd/Period;
    :goto_5
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v8

    if-lez v8, :cond_32

    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    iget-wide v8, v8, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    iget-wide v10, v1, Lcom/google/android/exoplayer/dash/mpd/Period;->startMs:J

    const-wide/16 v12, 0x3e8

    mul-long/2addr v10, v12

    cmp-long v8, v8, v10

    if-gez v8, :cond_32

    .line 750
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 752
    .local v6, "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    iget v9, v6, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_5

    .line 759
    .end local v6    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    :cond_32
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v8

    invoke-virtual {p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriodCount()I

    move-result v9

    if-le v8, v9, :cond_3f

    .line 793
    :goto_3e
    return-void

    .line 765
    :cond_3f
    :try_start_3f
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v7

    .line 766
    .local v7, "periodHolderCount":I
    if-lez v7, :cond_68

    .line 767
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-virtual {v8, p1, v9, v10}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updatePeriod(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V

    .line 768
    const/4 v8, 0x1

    if-le v7, v8, :cond_68

    .line 769
    add-int/lit8 v4, v7, -0x1

    .line 770
    .local v4, "lastIndex":I
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-virtual {v8, p1, v4, v9}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updatePeriod(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V
    :try_end_68
    .catch Lcom/google/android/exoplayer/BehindLiveWindowException; {:try_start_3f .. :try_end_68} :catch_8d

    .line 779
    .end local v4    # "lastIndex":I
    :cond_68
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v3

    .local v3, "i":I
    :goto_6e
    invoke-virtual {p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriodCount()I

    move-result v8

    if-ge v3, v8, :cond_91

    .line 780
    new-instance v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    iget v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->nextPeriodHolderIndex:I

    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-direct {v2, v8, p1, v3, v9}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;-><init>(ILcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V

    .line 781
    .local v2, "holder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    iget v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->nextPeriodHolderIndex:I

    invoke-virtual {v8, v9, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 782
    iget v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->nextPeriodHolderIndex:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->nextPeriodHolderIndex:I

    .line 779
    add-int/lit8 v3, v3, 0x1

    goto :goto_6e

    .line 773
    .end local v2    # "holder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .end local v3    # "i":I
    .end local v7    # "periodHolderCount":I
    :catch_8d
    move-exception v0

    .line 774
    .local v0, "e":Lcom/google/android/exoplayer/BehindLiveWindowException;
    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    goto :goto_3e

    .line 786
    .end local v0    # "e":Lcom/google/android/exoplayer/BehindLiveWindowException;
    .restart local v3    # "i":I
    .restart local v7    # "periodHolderCount":I
    :cond_91
    invoke-direct {p0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getNowUnixTimeUs()J

    move-result-wide v8

    invoke-direct {p0, v8, v9}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getAvailableRange(J)Lcom/google/android/exoplayer/TimeRange;

    move-result-object v5

    .line 787
    .local v5, "newAvailableRange":Lcom/google/android/exoplayer/TimeRange;
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    if-eqz v8, :cond_a5

    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    invoke-virtual {v8, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_ac

    .line 788
    :cond_a5
    iput-object v5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    .line 789
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    invoke-direct {p0, v8}, Lcom/google/android/exoplayer/dash/DashChunkSource;->notifyAvailableRangeChanged(Lcom/google/android/exoplayer/TimeRange;)V

    .line 792
    :cond_ac
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    goto :goto_3e
.end method


# virtual methods
.method public adaptiveTrack(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;II[I)V
    .registers 22
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "periodIndex"    # I
    .param p3, "adaptationSetIndex"    # I
    .param p4, "representationIndices"    # [I

    .prologue
    .line 558
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    if-nez v1, :cond_e

    .line 559
    const-string v1, "DashChunkSource"

    const-string v2, "Skipping adaptive track (missing format evaluator)"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    :goto_d
    return-void

    .line 562
    :cond_e
    invoke-virtual/range {p1 .. p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    move/from16 v0, p3

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 564
    .local v7, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    const/4 v5, 0x0

    .line 565
    .local v5, "maxWidth":I
    const/4 v6, 0x0

    .line 566
    .local v6, "maxHeight":I
    const/4 v10, 0x0

    .line 567
    .local v10, "maxHeightRepresentationFormat":Lcom/google/android/exoplayer/chunk/Format;
    move-object/from16 v0, p4

    array-length v1, v0

    new-array v4, v1, [Lcom/google/android/exoplayer/chunk/Format;

    .line 568
    .local v4, "representationFormats":[Lcom/google/android/exoplayer/chunk/Format;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_25
    array-length v1, v4

    if-ge v9, v1, :cond_4c

    .line 569
    iget-object v1, v7, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    aget v2, p4, v9

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/mpd/Representation;

    iget-object v8, v1, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 570
    .local v8, "format":Lcom/google/android/exoplayer/chunk/Format;
    if-eqz v10, :cond_3a

    iget v1, v8, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-le v1, v6, :cond_3b

    .line 571
    :cond_3a
    move-object v10, v8

    .line 573
    :cond_3b
    iget v1, v8, Lcom/google/android/exoplayer/chunk/Format;->width:I

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 574
    iget v1, v8, Lcom/google/android/exoplayer/chunk/Format;->height:I

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 575
    aput-object v8, v4, v9

    .line 568
    add-int/lit8 v9, v9, 0x1

    goto :goto_25

    .line 577
    .end local v8    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_4c
    new-instance v1, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;

    invoke-direct {v1}, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;-><init>()V

    invoke-static {v4, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 578
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->live:Z

    if-eqz v1, :cond_6a

    const-wide/16 v12, -0x1

    .line 579
    .local v12, "trackDurationUs":J
    :goto_5c
    invoke-static {v10}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getMediaMimeType(Lcom/google/android/exoplayer/chunk/Format;)Ljava/lang/String;

    move-result-object v11

    .line 580
    .local v11, "mediaMimeType":Ljava/lang/String;
    if-nez v11, :cond_73

    .line 581
    const-string v1, "DashChunkSource"

    const-string v2, "Skipped adaptive track (unknown media mime type)"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 578
    .end local v11    # "mediaMimeType":Ljava/lang/String;
    .end local v12    # "trackDurationUs":J
    :cond_6a
    move-object/from16 v0, p1

    iget-wide v1, v0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->duration:J

    const-wide/16 v15, 0x3e8

    mul-long v12, v1, v15

    goto :goto_5c

    .line 584
    .restart local v11    # "mediaMimeType":Ljava/lang/String;
    .restart local v12    # "trackDurationUs":J
    :cond_73
    iget v1, v7, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->type:I

    invoke-static {v1, v10, v11, v12, v13}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getTrackFormat(ILcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v14

    .line 586
    .local v14, "trackFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-nez v14, :cond_83

    .line 587
    const-string v1, "DashChunkSource"

    const-string v2, "Skipped adaptive track (unknown media format)"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 590
    :cond_83
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    new-instance v1, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    const/4 v2, 0x0

    invoke-virtual {v14, v2}, Lcom/google/android/exoplayer/MediaFormat;->copyAsAdaptive(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v2

    move/from16 v3, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;-><init>(Lcom/google/android/exoplayer/MediaFormat;I[Lcom/google/android/exoplayer/chunk/Format;II)V

    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d
.end method

.method public continueBuffering(J)V
    .registers 10
    .param p1, "playbackPositionUs"    # J

    .prologue
    .line 329
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v3, v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v3, :cond_f

    .line 354
    :cond_e
    :goto_e
    return-void

    .line 333
    :cond_f
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 334
    .local v2, "newManifest":Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    if-eqz v2, :cond_22

    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->processedManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    if-eq v2, v3, :cond_22

    .line 335
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/dash/DashChunkSource;->processManifest(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;)V

    .line 338
    iput-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->processedManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 345
    :cond_22
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->minUpdatePeriod:J

    .line 346
    .local v0, "minUpdatePeriod":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-nez v3, :cond_2e

    .line 347
    const-wide/16 v0, 0x1388

    .line 350
    :cond_2e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifestLoadStartTimestamp()J

    move-result-wide v5

    add-long/2addr v5, v0

    cmp-long v3, v3, v5

    if-lez v3, :cond_e

    .line 352
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->requestRefresh()V

    goto :goto_e
.end method

.method public disable(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    const/4 v1, 0x0

    .line 540
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->isAdaptive()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 541
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->disable()V

    .line 543
    :cond_e
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_17

    .line 544
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->disable()V

    .line 546
    :cond_17
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 547
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iput-object v1, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 548
    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    .line 549
    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    .line 550
    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .line 551
    return-void
.end method

.method public enable(I)V
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 315
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .line 316
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->isAdaptive()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 317
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->enable()V

    .line 319
    :cond_17
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_2c

    .line 320
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->enable()V

    .line 321
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->processManifest(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;)V

    .line 325
    :goto_2b
    return-void

    .line 323
    :cond_2c
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->processManifest(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;)V

    goto :goto_2b
.end method

.method public fixedTrack(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;III)V
    .registers 15
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "periodIndex"    # I
    .param p3, "adaptationSetIndex"    # I
    .param p4, "representationIndex"    # I

    .prologue
    .line 597
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v5

    iget-object v1, v5, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    .line 598
    .local v1, "adaptationSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;>;"
    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 599
    .local v0, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    iget-object v5, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    invoke-interface {v5, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/dash/mpd/Representation;

    iget-object v3, v5, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 600
    .local v3, "representationFormat":Lcom/google/android/exoplayer/chunk/Format;
    invoke-static {v3}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getMediaMimeType(Lcom/google/android/exoplayer/chunk/Format;)Ljava/lang/String;

    move-result-object v2

    .line 601
    .local v2, "mediaMimeType":Ljava/lang/String;
    if-nez v2, :cond_3d

    .line 602
    const-string v5, "DashChunkSource"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Skipped track "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (unknown media mime type)"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    :goto_3c
    return-void

    .line 605
    :cond_3d
    iget v7, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->type:I

    iget-boolean v5, p1, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v5, :cond_6c

    const-wide/16 v5, -0x1

    :goto_45
    invoke-static {v7, v3, v2, v5, v6}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getTrackFormat(ILcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    .line 607
    .local v4, "trackFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-nez v4, :cond_72

    .line 608
    const-string v5, "DashChunkSource"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Skipped track "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (unknown media format)"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3c

    .line 605
    .end local v4    # "trackFormat":Lcom/google/android/exoplayer/MediaFormat;
    :cond_6c
    iget-wide v5, p1, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->duration:J

    const-wide/16 v8, 0x3e8

    mul-long/2addr v5, v8

    goto :goto_45

    .line 611
    .restart local v4    # "trackFormat":Lcom/google/android/exoplayer/MediaFormat;
    :cond_72
    iget-object v5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    new-instance v6, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-direct {v6, v4, p3, v3}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;-><init>(Lcom/google/android/exoplayer/MediaFormat;ILcom/google/android/exoplayer/chunk/Format;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3c
.end method

.method getAvailableRange()Lcom/google/android/exoplayer/TimeRange;
    .registers 2

    .prologue
    .line 618
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    return-object v0
.end method

.method public final getChunkOperation(Ljava/util/List;JLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V
    .registers 33
    .param p2, "playbackPositionUs"    # J
    .param p4, "out"    # Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;J",
            "Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 359
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v3, :cond_c

    .line 360
    const/4 v3, 0x0

    move-object/from16 v0, p4

    iput-object v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 500
    :cond_b
    :goto_b
    return-void

    .line 364
    :cond_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    iput v7, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    .line 365
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v3, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v3, :cond_24

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    if-nez v3, :cond_45

    .line 366
    :cond_24
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->isAdaptive()Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 367
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptiveFormatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;
    invoke-static {v7}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    move-object/from16 v4, p1

    move-wide/from16 v5, p2

    invoke-interface/range {v3 .. v8}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V

    .line 375
    :cond_45
    :goto_45
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v0, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v22, v0

    .line 376
    .local v22, "selectedFormat":Lcom/google/android/exoplayer/chunk/Format;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v3, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    move-object/from16 v0, p4

    iput v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 378
    if-nez v22, :cond_75

    .line 379
    const/4 v3, 0x0

    move-object/from16 v0, p4

    iput-object v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto :goto_b

    .line 370
    .end local v22    # "selectedFormat":Lcom/google/android/exoplayer/chunk/Format;
    :cond_5f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->fixedFormat:Lcom/google/android/exoplayer/chunk/Format;
    invoke-static {v7}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$100(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v7

    iput-object v7, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 371
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    const/4 v7, 0x2

    iput v7, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    goto :goto_45

    .line 381
    .restart local v22    # "selectedFormat":Lcom/google/android/exoplayer/chunk/Format;
    :cond_75
    move-object/from16 v0, p4

    iget v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v3, v7, :cond_93

    move-object/from16 v0, p4

    iget-object v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-eqz v3, :cond_93

    move-object/from16 v0, p4

    iget-object v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v3, v3, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 389
    :cond_93
    const/4 v3, 0x0

    move-object/from16 v0, p4

    iput-object v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 394
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRange:Lcom/google/android/exoplayer/TimeRange;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    invoke-interface {v3, v7}, Lcom/google/android/exoplayer/TimeRange;->getCurrentBoundsUs([J)[J

    .line 395
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_141

    .line 396
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->live:Z

    if-eqz v3, :cond_d1

    .line 397
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->startAtLiveEdge:Z

    if-eqz v3, :cond_122

    .line 400
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v7, 0x0

    aget-wide v7, v3, v7

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v10, 0x1

    aget-wide v24, v3, v10

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->liveEdgeLatencyUs:J

    move-wide/from16 v26, v0

    sub-long v24, v24, v26

    move-wide/from16 v0, v24

    invoke-static {v7, v8, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    .line 409
    :cond_d1
    :goto_d1
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/dash/DashChunkSource;->findPeriodHolder(J)Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    move-result-object v20

    .line 410
    .local v20, "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    const/16 v23, 0x1

    .line 468
    .local v23, "startingNewPeriod":Z
    :cond_db
    :goto_db
    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    move-object/from16 v0, v22

    iget-object v7, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 470
    .local v9, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    iget-object v6, v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 472
    .local v6, "selectedRepresentation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    const/4 v4, 0x0

    .line 473
    .local v4, "pendingInitializationUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    const/4 v5, 0x0

    .line 475
    .local v5, "pendingIndexUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    iget-object v11, v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 476
    .local v11, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-nez v11, :cond_f5

    .line 477
    invoke-virtual {v6}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getInitializationUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v4

    .line 479
    :cond_f5
    iget-object v3, v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    if-nez v3, :cond_fd

    .line 480
    invoke-virtual {v6}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndexUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v5

    .line 483
    :cond_fd
    if-nez v4, :cond_101

    if-eqz v5, :cond_22b

    .line 485
    :cond_101
    iget-object v7, v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, v20

    iget v9, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    .end local v9    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v10, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v10}, Lcom/google/android/exoplayer/dash/DashChunkSource;->newInitializationChunk(Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;Lcom/google/android/exoplayer/upstream/DataSource;II)Lcom/google/android/exoplayer/chunk/Chunk;

    move-result-object v15

    .line 488
    .local v15, "initializationChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    .line 489
    move-object/from16 v0, p4

    iput-object v15, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_b

    .line 404
    .end local v4    # "pendingInitializationUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .end local v5    # "pendingIndexUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .end local v6    # "selectedRepresentation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    .end local v11    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v15    # "initializationChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    .end local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .end local v23    # "startingNewPeriod":Z
    :cond_122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v7, 0x1

    aget-wide v7, v3, v7

    const-wide/16 v24, 0x1

    sub-long v7, v7, v24

    move-wide/from16 v0, p2

    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    .line 405
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v7, 0x0

    aget-wide v7, v3, v7

    move-wide/from16 v0, p2

    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    goto :goto_d1

    .line 412
    :cond_141
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->startAtLiveEdge:Z

    if-eqz v3, :cond_14c

    .line 415
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->startAtLiveEdge:Z

    .line 418
    :cond_14c
    move-object/from16 v0, p4

    iget v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 419
    .local v21, "previous":Lcom/google/android/exoplayer/chunk/MediaChunk;
    move-object/from16 v0, v21

    iget-wide v0, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    move-wide/from16 v18, v0

    .line 420
    .local v18, "nextSegmentStartTimeUs":J
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->live:Z

    if-eqz v3, :cond_17c

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v7, 0x0

    aget-wide v7, v3, v7

    cmp-long v3, v18, v7

    if-gez v3, :cond_17c

    .line 422
    new-instance v3, Lcom/google/android/exoplayer/BehindLiveWindowException;

    invoke-direct {v3}, Lcom/google/android/exoplayer/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    goto/16 :goto_b

    .line 424
    :cond_17c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v3, v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v3, :cond_18f

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->availableRangeValues:[J

    const/4 v7, 0x1

    aget-wide v7, v3, v7

    cmp-long v3, v18, v7

    if-gez v3, :cond_b

    .line 434
    :cond_18f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 435
    .local v16, "lastPeriodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    move-object/from16 v0, v21

    iget v3, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->parentId:I

    move-object/from16 v0, v16

    iget v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    if-ne v3, v7, :cond_1d6

    .line 436
    move-object/from16 v0, v16

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    move-object/from16 v0, v21

    iget-object v7, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 438
    .restart local v9    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    invoke-virtual/range {v21 .. v21}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getNextChunkIndex()I

    move-result v3

    invoke-virtual {v9, v3}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->isBeyondLastSegment(I)Z

    move-result v3

    if-eqz v3, :cond_1d6

    .line 439
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v3, v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-nez v3, :cond_b

    .line 441
    const/4 v3, 0x1

    move-object/from16 v0, p4

    iput-boolean v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->endOfStream:Z

    goto/16 :goto_b

    .line 448
    .end local v9    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    :cond_1d6
    const/16 v23, 0x0

    .line 449
    .restart local v23    # "startingNewPeriod":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    move-object/from16 v0, v21

    iget v7, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->parentId:I

    invoke-virtual {v3, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 450
    .restart local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    if-nez v20, :cond_1f7

    .line 455
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    check-cast v20, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 456
    .restart local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    const/16 v23, 0x1

    goto/16 :goto_db

    .line 457
    :cond_1f7
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->isIndexUnbounded()Z

    move-result v3

    if-nez v3, :cond_db

    .line 458
    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    move-object/from16 v0, v21

    iget-object v7, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 460
    .restart local v9    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    invoke-virtual/range {v21 .. v21}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getNextChunkIndex()I

    move-result v3

    invoke-virtual {v9, v3}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->isBeyondLastSegment(I)Z

    move-result v3

    if-eqz v3, :cond_db

    .line 462
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    move-object/from16 v0, v21

    iget v7, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->parentId:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v3, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    check-cast v20, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 463
    .restart local v20    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    const/16 v23, 0x1

    goto/16 :goto_db

    .line 493
    .end local v16    # "lastPeriodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .end local v18    # "nextSegmentStartTimeUs":J
    .end local v21    # "previous":Lcom/google/android/exoplayer/chunk/MediaChunk;
    .restart local v4    # "pendingInitializationUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .restart local v5    # "pendingIndexUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .restart local v6    # "selectedRepresentation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    .restart local v11    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    :cond_22b
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_25a

    move-wide/from16 v0, p2

    invoke-virtual {v9, v0, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getSegmentNum(J)I

    move-result v13

    .line 496
    .local v13, "segmentNum":I
    :goto_237
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->enabledTrack:Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v14, v3, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    move-object/from16 v7, p0

    move-object/from16 v8, v20

    invoke-virtual/range {v7 .. v14}, Lcom/google/android/exoplayer/dash/DashChunkSource;->newMediaChunk(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;II)Lcom/google/android/exoplayer/chunk/Chunk;

    move-result-object v17

    .line 498
    .local v17, "nextMediaChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    .line 499
    move-object/from16 v0, v17

    move-object/from16 v1, p4

    iput-object v0, v1, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_b

    .line 493
    .end local v13    # "segmentNum":I
    .end local v17    # "nextMediaChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    :cond_25a
    if-eqz v23, :cond_261

    invoke-virtual {v9}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getFirstAvailableSegmentNum()I

    move-result v13

    goto :goto_237

    :cond_261
    move-object/from16 v0, p4

    iget v3, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/chunk/MediaChunk;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getNextChunkIndex()I

    move-result v13

    goto :goto_237
.end method

.method public final getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 310
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->trackFormat:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 305
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->tracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

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
    .line 283
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_7

    .line 284
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    throw v0

    .line 285
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_10

    .line 286
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->maybeThrowError()V

    .line 288
    :cond_10
    return-void
.end method

.method protected newMediaChunk(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;II)Lcom/google/android/exoplayer/chunk/Chunk;
    .registers 35
    .param p1, "periodHolder"    # Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .param p2, "representationHolder"    # Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p5, "enabledTrack"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;
    .param p6, "segmentNum"    # I
    .param p7, "trigger"    # I

    .prologue
    .line 698
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-object/from16 v23, v0

    .line 699
    .local v23, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v22, v0

    .line 700
    .local v22, "format":Lcom/google/android/exoplayer/chunk/Format;
    move-object/from16 v0, p2

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getSegmentStartTimeUs(I)J

    move-result-wide v25

    .line 701
    .local v25, "startTimeUs":J
    move-object/from16 v0, p2

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getSegmentEndTimeUs(I)J

    move-result-wide v10

    .line 702
    .local v10, "endTimeUs":J
    move-object/from16 v0, p2

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->getSegmentUrl(I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v24

    .line 703
    .local v24, "segmentUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, v24

    iget-wide v4, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    move-object/from16 v0, v24

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    invoke-virtual/range {v23 .. v23}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 706
    .local v2, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p1

    iget-wide v3, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    move-object/from16 v0, v23

    iget-wide v5, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->presentationTimeOffsetUs:J

    sub-long v13, v3, v5

    .line 707
    .local v13, "sampleOffsetUs":J
    move-object/from16 v0, v22

    iget-object v3, v0, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/exoplayer/dash/DashChunkSource;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 708
    new-instance v3, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;

    const/4 v6, 0x1

    move-object/from16 v0, p5

    iget-object v13, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->trackFormat:Lcom/google/android/exoplayer/MediaFormat;

    .end local v13    # "sampleOffsetUs":J
    const/4 v14, 0x0

    move-object/from16 v0, p1

    iget v15, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    move-object/from16 v4, p3

    move-object v5, v2

    move-object/from16 v7, v22

    move-wide/from16 v8, v25

    move/from16 v12, p6

    invoke-direct/range {v3 .. v15}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJILcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/drm/DrmInitData;I)V

    .line 713
    :goto_65
    return-object v3

    .line 712
    .restart local v13    # "sampleOffsetUs":J
    :cond_66
    if-eqz p4, :cond_97

    const/16 v20, 0x1

    .line 713
    .local v20, "isMediaFormatFinal":Z
    :goto_6a
    new-instance v3, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;

    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    move-object/from16 v0, p5

    iget v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxWidth:I

    move/from16 v17, v0

    move-object/from16 v0, p5

    iget v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxHeight:I

    move/from16 v18, v0

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;
    invoke-static/range {p1 .. p1}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->access$200(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;)Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v19

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    move/from16 v21, v0

    move-object/from16 v4, p3

    move-object v5, v2

    move/from16 v6, p7

    move-object/from16 v7, v22

    move-wide/from16 v8, v25

    move/from16 v12, p6

    move-object/from16 v16, p4

    invoke-direct/range {v3 .. v21}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIJLcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;Lcom/google/android/exoplayer/MediaFormat;IILcom/google/android/exoplayer/drm/DrmInitData;ZI)V

    goto :goto_65

    .line 712
    .end local v20    # "isMediaFormatFinal":Z
    :cond_97
    const/16 v20, 0x0

    goto :goto_6a
.end method

.method public onChunkLoadCompleted(Lcom/google/android/exoplayer/chunk/Chunk;)V
    .registers 9
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;

    .prologue
    .line 504
    instance-of v4, p1, Lcom/google/android/exoplayer/chunk/InitializationChunk;

    if-eqz v4, :cond_17

    move-object v1, p1

    .line 505
    check-cast v1, Lcom/google/android/exoplayer/chunk/InitializationChunk;

    .line 506
    .local v1, "initializationChunk":Lcom/google/android/exoplayer/chunk/InitializationChunk;
    iget-object v4, v1, Lcom/google/android/exoplayer/chunk/InitializationChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v0, v4, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    .line 507
    .local v0, "formatId":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->periodHolders:Landroid/util/SparseArray;

    iget v5, v1, Lcom/google/android/exoplayer/chunk/InitializationChunk;->parentId:I

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .line 508
    .local v2, "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    if-nez v2, :cond_18

    .line 531
    .end local v0    # "formatId":Ljava/lang/String;
    .end local v1    # "initializationChunk":Lcom/google/android/exoplayer/chunk/InitializationChunk;
    .end local v2    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    :cond_17
    :goto_17
    return-void

    .line 513
    .restart local v0    # "formatId":Ljava/lang/String;
    .restart local v1    # "initializationChunk":Lcom/google/android/exoplayer/chunk/InitializationChunk;
    .restart local v2    # "periodHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    :cond_18
    iget-object v4, v2, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 514
    .local v3, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->hasFormat()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 515
    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->getFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    iput-object v4, v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 520
    :cond_2c
    iget-object v4, v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    if-nez v4, :cond_4b

    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->hasSeekMap()Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 521
    new-instance v5, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->getSeekMap()Lcom/google/android/exoplayer/extractor/SeekMap;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/extractor/ChunkIndex;

    iget-object v6, v1, Lcom/google/android/exoplayer/chunk/InitializationChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v6, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;-><init>(Lcom/google/android/exoplayer/extractor/ChunkIndex;Ljava/lang/String;)V

    iput-object v5, v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 527
    :cond_4b
    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;
    invoke-static {v2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->access$200(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;)Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v4

    if-nez v4, :cond_17

    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->hasDrmInitData()Z

    move-result v4

    if-eqz v4, :cond_17

    .line 528
    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/InitializationChunk;->getDrmInitData()Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v4

    # setter for: Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;
    invoke-static {v2, v4}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->access$202(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;Lcom/google/android/exoplayer/drm/DrmInitData;)Lcom/google/android/exoplayer/drm/DrmInitData;

    goto :goto_17
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 536
    return-void
.end method

.method public prepare()Z
    .registers 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 292
    iget-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->prepareCalled:Z

    if-nez v3, :cond_10

    .line 293
    iput-boolean v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->prepareCalled:Z

    .line 295
    :try_start_8
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->trackSelector:Lcom/google/android/exoplayer/dash/DashTrackSelector;

    iget-object v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5, p0}, Lcom/google/android/exoplayer/dash/DashTrackSelector;->selectTracks(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashTrackSelector$Output;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_10} :catch_15

    .line 300
    :cond_10
    :goto_10
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-nez v3, :cond_19

    :goto_14
    return v1

    .line 296
    :catch_15
    move-exception v0

    .line 297
    .local v0, "e":Ljava/io/IOException;
    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    goto :goto_10

    .end local v0    # "e":Ljava/io/IOException;
    :cond_19
    move v1, v2

    .line 300
    goto :goto_14
.end method
