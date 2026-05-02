.class public final Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
.super Ljava/lang/Object;
.source "DashChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/DashChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "PeriodHolder"
.end annotation


# instance fields
.field private availableEndTimeUs:J

.field private availableStartTimeUs:J

.field private drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private indexIsExplicit:Z

.field private indexIsUnbounded:Z

.field public final localIndex:I

.field public final representationHolders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final representationIndices:[I

.field public final startTimeUs:J


# direct methods
.method public constructor <init>(ILcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V
    .registers 18
    .param p1, "localIndex"    # I
    .param p2, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p3, "manifestIndex"    # I
    .param p4, "selectedTrack"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .prologue
    .line 979
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 980
    iput p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    .line 982
    invoke-virtual/range {p2 .. p3}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v9

    .line 983
    .local v9, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    invoke-static/range {p2 .. p3}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J

    move-result-wide v3

    .line 984
    .local v3, "periodDurationUs":J
    iget-object v1, v9, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptationSetIndex:I
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$500(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)I

    move-result v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 985
    .local v6, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    iget-object v10, v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    .line 987
    .local v10, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    iget-wide v1, v9, Lcom/google/android/exoplayer/dash/mpd/Period;->startMs:J

    const-wide/16 v11, 0x3e8

    mul-long/2addr v1, v11

    iput-wide v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    .line 988
    invoke-static {v6}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getDrmInitData(Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;)Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 990
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->isAdaptive()Z

    move-result v1

    if-nez v1, :cond_6a

    .line 991
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->fixedFormat:Lcom/google/android/exoplayer/chunk/Format;
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$100(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v11

    iget-object v11, v11, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I

    move-result v11

    aput v11, v1, v2

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    .line 1001
    :cond_40
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    .line 1002
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_48
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    array-length v1, v1

    if-ge v7, v1, :cond_8e

    .line 1003
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    aget v1, v1, v7

    invoke-interface {v10, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 1004
    .local v5, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    new-instance v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    iget-wide v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;-><init>(JJLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 1006
    .local v0, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    iget-object v2, v5, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v2, v2, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    add-int/lit8 v7, v7, 0x1

    goto :goto_48

    .line 994
    .end local v0    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .end local v5    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    .end local v7    # "i":I
    :cond_6a
    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    .line 995
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_74
    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v1

    array-length v1, v1

    if-ge v8, v1, :cond_40

    .line 996
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v2

    aget-object v2, v2, v8

    iget-object v2, v2, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-static {v10, v2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    aput v2, v1, v8

    .line 995
    add-int/lit8 v8, v8, 0x1

    goto :goto_74

    .line 1008
    .end local v8    # "j":I
    .restart local v7    # "i":I
    :cond_8e
    iget-object v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-interface {v10, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/mpd/Representation;

    invoke-direct {p0, v3, v4, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 1010
    return-void
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .prologue
    .line 963
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;Lcom/google/android/exoplayer/drm/DrmInitData;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .param p1, "x1"    # Lcom/google/android/exoplayer/drm/DrmInitData;

    .prologue
    .line 963
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object p1
.end method

.method private static getDrmInitData(Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 6
    .param p0, "adaptationSet"    # Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .prologue
    .line 1086
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1087
    const/4 v1, 0x0

    .line 1099
    :cond_9
    return-object v1

    .line 1089
    :cond_a
    const/4 v1, 0x0

    .line 1090
    .local v1, "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_9

    .line 1091
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    .line 1092
    .local v0, "contentProtection":Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    if-eqz v3, :cond_32

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    if-eqz v3, :cond_32

    .line 1093
    if-nez v1, :cond_2b

    .line 1094
    new-instance v1, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;

    .end local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    invoke-direct {v1}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;-><init>()V

    .line 1096
    .restart local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    :cond_2b
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    invoke-virtual {v1, v3, v4}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;->put(Ljava/util/UUID;Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    .line 1090
    :cond_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method private static getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J
    .registers 7
    .param p0, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p1, "index"    # I

    .prologue
    const-wide/16 v2, -0x1

    .line 1104
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriodDuration(I)J

    move-result-wide v0

    .line 1105
    .local v0, "durationMs":J
    cmp-long v4, v0, v2

    if-nez v4, :cond_b

    .line 1108
    :goto_a
    return-wide v2

    :cond_b
    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, v0

    goto :goto_a
.end method

.method private static getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I
    .registers 7
    .param p1, "formatId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1076
    .local p0, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1b

    .line 1077
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 1078
    .local v1, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    iget-object v2, v1, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v2, v2, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 1079
    return v0

    .line 1076
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1082
    .end local v1    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_1b
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Missing format id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V
    .registers 11
    .param p1, "periodDurationUs"    # J
    .param p3, "arbitaryRepresentation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1055
    invoke-virtual {p3}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v2

    .line 1056
    .local v2, "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    if-eqz v2, :cond_39

    .line 1057
    invoke-interface {v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v0

    .line 1058
    .local v0, "firstSegmentNum":I
    invoke-interface {v2, p1, p2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum(J)I

    move-result v1

    .line 1059
    .local v1, "lastSegmentNum":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_37

    :goto_13
    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    .line 1060
    invoke-interface {v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->isExplicit()Z

    move-result v3

    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    .line 1061
    iget-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    .line 1062
    iget-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    if-nez v3, :cond_36

    .line 1063
    iget-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-interface {v2, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-interface {v2, v1, p1, p2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(IJ)J

    move-result-wide v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    .line 1072
    .end local v0    # "firstSegmentNum":I
    .end local v1    # "lastSegmentNum":I
    :cond_36
    :goto_36
    return-void

    .restart local v0    # "firstSegmentNum":I
    .restart local v1    # "lastSegmentNum":I
    :cond_37
    move v3, v4

    .line 1059
    goto :goto_13

    .line 1067
    .end local v0    # "firstSegmentNum":I
    .end local v1    # "lastSegmentNum":I
    :cond_39
    iput-boolean v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    .line 1068
    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    .line 1069
    iget-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    iput-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    .line 1070
    iget-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    add-long/2addr v3, p1

    iput-wide v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    goto :goto_36
.end method


# virtual methods
.method public getAvailableEndTimeUs()J
    .registers 3

    .prologue
    .line 1033
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->isIndexUnbounded()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1034
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Period has unbounded index"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1036
    :cond_e
    iget-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    return-wide v0
.end method

.method public getAvailableStartTimeUs()J
    .registers 3

    .prologue
    .line 1029
    iget-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    return-wide v0
.end method

.method public getDrmInitData()Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 2

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object v0
.end method

.method public isIndexExplicit()Z
    .registers 2

    .prologue
    .line 1044
    iget-boolean v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    return v0
.end method

.method public isIndexUnbounded()Z
    .registers 2

    .prologue
    .line 1040
    iget-boolean v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    return v0
.end method

.method public updatePeriod(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V
    .registers 12
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "manifestIndex"    # I
    .param p3, "selectedTrack"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/BehindLiveWindowException;
        }
    .end annotation

    .prologue
    .line 1014
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v1

    .line 1015
    .local v1, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    invoke-static {p1, p2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J

    move-result-wide v2

    .line 1016
    .local v2, "periodDurationUs":J
    iget-object v6, v1, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    # getter for: Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptationSetIndex:I
    invoke-static {p3}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$500(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    iget-object v5, v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    .line 1019
    .local v5, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_17
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    array-length v6, v6

    if-ge v0, v6, :cond_38

    .line 1020
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    aget v6, v6, v0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 1021
    .local v4, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    iget-object v7, v4, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    invoke-virtual {v6, v2, v3, v4}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->updateRepresentation(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 1019
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 1024
    .end local v4    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_38
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/Representation;

    invoke-direct {p0, v2, v3, v6}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 1026
    return-void
.end method
