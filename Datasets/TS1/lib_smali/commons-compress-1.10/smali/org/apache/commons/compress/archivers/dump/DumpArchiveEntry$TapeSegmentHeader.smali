.class Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
.super Ljava/lang/Object;
.source "DumpArchiveEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TapeSegmentHeader"
.end annotation


# instance fields
.field private final cdata:[B

.field private count:I

.field private holes:I

.field private ino:I

.field private type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

.field private volume:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 531
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->cdata:[B

    return-void
.end method

.method static synthetic access$002(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    .param p1, "x1"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    .prologue
    .line 525
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    return-object p1
.end method

.method static synthetic access$102(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    .param p1, "x1"    # I

    .prologue
    .line 525
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->volume:I

    return p1
.end method

.method static synthetic access$202(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    .param p1, "x1"    # I

    .prologue
    .line 525
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->ino:I

    return p1
.end method

.method static synthetic access$300(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .prologue
    .line 525
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I

    return v0
.end method

.method static synthetic access$302(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    .param p1, "x1"    # I

    .prologue
    .line 525
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I

    return p1
.end method

.method static synthetic access$402(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    .param p1, "x1"    # I

    .prologue
    .line 525
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I

    return p1
.end method

.method static synthetic access$408(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I
    .registers 3
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .prologue
    .line 525
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I

    return v0
.end method

.method static synthetic access$500(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)[B
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .prologue
    .line 525
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->cdata:[B

    return-object v0
.end method


# virtual methods
.method public getCdata(I)I
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 558
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->cdata:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 550
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I

    return v0
.end method

.method public getHoles()I
    .registers 2

    .prologue
    .line 554
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I

    return v0
.end method

.method public getIno()I
    .registers 2

    .prologue
    .line 542
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->ino:I

    return v0
.end method

.method public getType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;
    .registers 2

    .prologue
    .line 534
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    return-object v0
.end method

.method public getVolume()I
    .registers 2

    .prologue
    .line 538
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->volume:I

    return v0
.end method

.method setIno(I)V
    .registers 2
    .param p1, "ino"    # I

    .prologue
    .line 546
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->ino:I

    .line 547
    return-void
.end method
