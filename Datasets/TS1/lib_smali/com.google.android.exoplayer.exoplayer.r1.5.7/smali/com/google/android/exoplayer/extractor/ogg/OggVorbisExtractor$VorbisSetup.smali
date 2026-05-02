.class final Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;
.super Ljava/lang/Object;
.source "OggVorbisExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "VorbisSetup"
.end annotation


# instance fields
.field public final commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

.field public final iLogModes:I

.field public final idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

.field public final modes:[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;

.field public final setupHeaderData:[B


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;[B[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;I)V
    .registers 6
    .param p1, "idHeader"    # Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;
    .param p2, "commentHeader"    # Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;
    .param p3, "setupHeaderData"    # [B
    .param p4, "modes"    # [Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;
    .param p5, "iLogModes"    # I

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    .line 271
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

    .line 272
    iput-object p3, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->setupHeaderData:[B

    .line 273
    iput-object p4, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->modes:[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;

    .line 274
    iput p5, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->iLogModes:I

    .line 275
    return-void
.end method
