.class public abstract Lcom/google/android/exoplayer/chunk/MediaChunk;
.super Lcom/google/android/exoplayer/chunk/Chunk;
.source "MediaChunk.java"


# instance fields
.field public final chunkIndex:I

.field public final endTimeUs:J

.field public final startTimeUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJI)V
    .registers 21
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "trigger"    # I
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I

    .prologue
    .line 42
    const/4 v10, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/chunk/MediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJII)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJII)V
    .registers 19
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "trigger"    # I
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I
    .param p10, "parentId"    # I

    .prologue
    .line 62
    const/4 v4, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    move-object v6, p4

    move/from16 v7, p10

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/chunk/Chunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;IILcom/google/android/exoplayer/chunk/Format;I)V

    .line 63
    invoke-static {p4}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    iput-wide p5, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    .line 65
    iput-wide p7, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    .line 66
    move/from16 v0, p9

    iput v0, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->chunkIndex:I

    .line 67
    return-void
.end method


# virtual methods
.method public getNextChunkIndex()I
    .registers 2

    .prologue
    .line 47
    iget v0, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->chunkIndex:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method
