.class public Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;
.super Lcom/google/android/exoplayer/dash/mpd/Representation;
.source "Representation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/mpd/Representation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SingleSegmentRepresentation"
.end annotation


# instance fields
.field public final contentLength:J

.field private final indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

.field private final segmentIndex:Lcom/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex;

.field public final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;Ljava/lang/String;J)V
    .registers 17
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "revisionId"    # J
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "segmentBase"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    .param p6, "customCacheKey"    # Ljava/lang/String;
    .param p7, "contentLength"    # J

    .prologue
    .line 200
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/dash/mpd/Representation;-><init>(Ljava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/Representation$1;)V

    .line 201
    iget-object v0, p5, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->uri:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->uri:Landroid/net/Uri;

    .line 202
    invoke-virtual {p5}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->getIndex()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    .line 203
    iput-wide p7, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->contentLength:J

    .line 206
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    if-eqz v0, :cond_22

    const/4 v0, 0x0

    :goto_1f
    iput-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex;

    .line 208
    return-void

    .line 206
    :cond_22
    new-instance v7, Lcom/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex;

    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    iget-object v1, p5, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->uri:Ljava/lang/String;

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-wide v5, p7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    invoke-direct {v7, v0}, Lcom/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;)V

    move-object v0, v7

    goto :goto_1f
.end method

.method public static newInstance(Ljava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;JJJJLjava/lang/String;J)Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;
    .registers 28
    .param p0, "contentId"    # Ljava/lang/String;
    .param p1, "revisionId"    # J
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "uri"    # Ljava/lang/String;
    .param p5, "initializationStart"    # J
    .param p7, "initializationEnd"    # J
    .param p9, "indexStart"    # J
    .param p11, "indexEnd"    # J
    .param p13, "customCacheKey"    # Ljava/lang/String;
    .param p14, "contentLength"    # J

    .prologue
    .line 182
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    const/4 v2, 0x0

    sub-long v3, p7, p5

    const-wide/16 v5, 0x1

    add-long/2addr v5, v3

    move-object/from16 v1, p4

    move-wide/from16 v3, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 184
    .local v0, "rangedUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    const-wide/16 v3, 0x1

    const-wide/16 v5, 0x0

    sub-long v7, p11, p9

    const-wide/16 v9, 0x1

    add-long v10, v7, v9

    move-object v2, v0

    move-object/from16 v7, p4

    move-wide/from16 v8, p9

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJLjava/lang/String;JJ)V

    .line 186
    .local v1, "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    new-instance v2, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;

    move-object v3, p0

    move-wide v4, p1

    move-object v6, p3

    move-object v7, v1

    move-object/from16 v8, p13

    move-wide/from16 v9, p14

    invoke-direct/range {v2 .. v10}, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;-><init>(Ljava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;Ljava/lang/String;J)V

    return-object v2
.end method


# virtual methods
.method public getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex;

    return-object v0
.end method

.method public getIndexUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    return-object v0
.end method
