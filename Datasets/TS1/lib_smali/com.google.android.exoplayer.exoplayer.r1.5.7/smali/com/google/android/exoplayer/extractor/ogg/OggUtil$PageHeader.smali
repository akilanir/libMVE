.class public final Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
.super Ljava/lang/Object;
.source "OggUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ogg/OggUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PageHeader"
.end annotation


# instance fields
.field public bodySize:I

.field public granulePosition:J

.field public headerSize:I

.field public final laces:[I

.field public pageChecksum:J

.field public pageSegmentCount:I

.field public pageSequenceNumber:J

.field public revision:I

.field public streamSerialNumber:J

.field public type:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    const/16 v0, 0xff

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->laces:[I

    return-void
.end method


# virtual methods
.method public reset()V
    .registers 4

    .prologue
    const-wide/16 v1, 0x0

    const/4 v0, 0x0

    .line 188
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->revision:I

    .line 189
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->type:I

    .line 190
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->granulePosition:J

    .line 191
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->streamSerialNumber:J

    .line 192
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSequenceNumber:J

    .line 193
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageChecksum:J

    .line 194
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    .line 195
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->headerSize:I

    .line 196
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->bodySize:I

    .line 197
    return-void
.end method
