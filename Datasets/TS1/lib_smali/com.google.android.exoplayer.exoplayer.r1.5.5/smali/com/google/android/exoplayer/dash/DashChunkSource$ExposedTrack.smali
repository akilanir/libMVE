.class public final Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;
.super Ljava/lang/Object;
.source "DashChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/DashChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "ExposedTrack"
.end annotation


# instance fields
.field private final adaptationSetIndex:I

.field private final adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;

.field public final adaptiveMaxHeight:I

.field public final adaptiveMaxWidth:I

.field private final fixedFormat:Lcom/google/android/exoplayer/chunk/Format;

.field public final trackFormat:Lcom/google/android/exoplayer/MediaFormat;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/MediaFormat;ILcom/google/android/exoplayer/chunk/Format;)V
    .registers 6
    .param p1, "trackFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p2, "adaptationSetIndex"    # I
    .param p3, "fixedFormat"    # Lcom/google/android/exoplayer/chunk/Format;

    .prologue
    const/4 v1, -0x1

    .line 840
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 841
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->trackFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 842
    iput p2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptationSetIndex:I

    .line 843
    iput-object p3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->fixedFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 844
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;

    .line 845
    iput v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxWidth:I

    .line 846
    iput v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxHeight:I

    .line 847
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/MediaFormat;I[Lcom/google/android/exoplayer/chunk/Format;II)V
    .registers 7
    .param p1, "trackFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p2, "adaptationSetIndex"    # I
    .param p3, "adaptiveFormats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "maxWidth"    # I
    .param p5, "maxHeight"    # I

    .prologue
    .line 850
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 851
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->trackFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 852
    iput p2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptationSetIndex:I

    .line 853
    iput-object p3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;

    .line 854
    iput p4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxWidth:I

    .line 855
    iput p5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveMaxHeight:I

    .line 856
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->fixedFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 857
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .prologue
    .line 826
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)Lcom/google/android/exoplayer/chunk/Format;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .prologue
    .line 826
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->fixedFormat:Lcom/google/android/exoplayer/chunk/Format;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .prologue
    .line 826
    iget v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptationSetIndex:I

    return v0
.end method


# virtual methods
.method public isAdaptive()Z
    .registers 2

    .prologue
    .line 860
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->adaptiveFormats:[Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
