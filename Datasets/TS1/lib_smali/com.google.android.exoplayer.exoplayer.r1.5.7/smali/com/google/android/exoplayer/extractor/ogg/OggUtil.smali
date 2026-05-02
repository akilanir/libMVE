.class final Lcom/google/android/exoplayer/extractor/ogg/OggUtil;
.super Ljava/lang/Object;
.source "OggUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;,
        Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    }
.end annotation


# static fields
.field private static final TYPE_OGGS:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "OggS"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil;->TYPE_OGGS:I

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    return-void
.end method

.method public static calculatePacketSize(Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;ILcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;)V
    .registers 7
    .param p0, "header"    # Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    .param p1, "startSegmentIndex"    # I
    .param p2, "holder"    # Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;

    .prologue
    const/4 v1, 0x0

    .line 155
    iput v1, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->segmentCount:I

    .line 156
    iput v1, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->size:I

    .line 157
    :cond_5
    iget v1, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->segmentCount:I

    add-int/2addr v1, p1

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    if-ge v1, v2, :cond_20

    .line 158
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->laces:[I

    iget v2, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->segmentCount:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->segmentCount:I

    add-int/2addr v2, p1

    aget v0, v1, v2

    .line 159
    .local v0, "segmentLength":I
    iget v1, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->size:I

    add-int/2addr v1, v0

    iput v1, p2, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder;->size:I

    .line 160
    const/16 v1, 0xff

    if-eq v0, v1, :cond_5

    .line 165
    .end local v0    # "segmentLength":I
    :cond_20
    return-void
.end method

.method public static populatePageHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;Lcom/google/android/exoplayer/util/ParsableByteArray;Z)Z
    .registers 12
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p1, "header"    # Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    .param p2, "scratch"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p3, "quite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 100
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 101
    invoke-virtual {p1}, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->reset()V

    .line 102
    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_21

    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v4

    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPeekPosition()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x1b

    cmp-long v4, v4, v6

    if-ltz v4, :cond_31

    :cond_21
    move v0, v3

    .line 104
    .local v0, "hasEnoughBytes":Z
    :goto_22
    if-eqz v0, :cond_2e

    iget-object v4, p2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v5, 0x1b

    invoke-interface {p0, v4, v2, v5, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BIIZ)Z

    move-result v4

    if-nez v4, :cond_39

    .line 105
    :cond_2e
    if-eqz p3, :cond_33

    .line 143
    :cond_30
    :goto_30
    return v2

    .end local v0    # "hasEnoughBytes":Z
    :cond_31
    move v0, v2

    .line 102
    goto :goto_22

    .line 108
    .restart local v0    # "hasEnoughBytes":Z
    :cond_33
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 111
    :cond_39
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    sget v6, Lcom/google/android/exoplayer/extractor/ogg/OggUtil;->TYPE_OGGS:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_4e

    .line 112
    if-nez p3, :cond_30

    .line 115
    new-instance v2, Lcom/google/android/exoplayer/ParserException;

    const-string v3, "expected OggS capture pattern at begin of page"

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 119
    :cond_4e
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    iput v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->revision:I

    .line 120
    iget v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->revision:I

    if-eqz v4, :cond_62

    .line 121
    if-nez p3, :cond_30

    .line 124
    new-instance v2, Lcom/google/android/exoplayer/ParserException;

    const-string v3, "unsupported bit stream revision"

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 127
    :cond_62
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    iput v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->type:I

    .line 129
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianLong()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->granulePosition:J

    .line 130
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedInt()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->streamSerialNumber:J

    .line 131
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedInt()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSequenceNumber:J

    .line 132
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedInt()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageChecksum:J

    .line 133
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    iput v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    .line 135
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 137
    iget v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    add-int/lit8 v4, v4, 0x1b

    iput v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->headerSize:I

    .line 138
    iget-object v4, p2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v5, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    invoke-interface {p0, v4, v2, v5}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 139
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_97
    iget v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->pageSegmentCount:I

    if-ge v1, v2, :cond_af

    .line 140
    iget-object v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->laces:[I

    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    aput v4, v2, v1

    .line 141
    iget v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->bodySize:I

    iget-object v4, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->laces:[I

    aget v4, v4, v1

    add-int/2addr v2, v4

    iput v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->bodySize:I

    .line 139
    add-int/lit8 v1, v1, 0x1

    goto :goto_97

    :cond_af
    move v2, v3

    .line 143
    goto :goto_30
.end method

.method public static readBits(BII)I
    .registers 6
    .param p0, "src"    # B
    .param p1, "length"    # I
    .param p2, "leastSignificantBitIndex"    # I

    .prologue
    .line 44
    shr-int v0, p0, p2

    const/16 v1, 0xff

    rsub-int/lit8 v2, p1, 0x8

    ushr-int/2addr v1, v2

    and-int/2addr v0, v1

    return v0
.end method

.method public static skipToNextPage(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 10
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x67

    const/4 v7, 0x0

    .line 57
    const/16 v3, 0x800

    new-array v0, v3, [B

    .line 58
    .local v0, "buffer":[B
    array-length v2, v0

    .line 60
    .local v2, "peekLength":I
    :goto_8
    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v3

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-eqz v3, :cond_33

    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v3

    int-to-long v5, v2

    add-long/2addr v3, v5

    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_33

    .line 63
    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v3

    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    sub-long/2addr v3, v5

    long-to-int v2, v3

    .line 64
    const/4 v3, 0x4

    if-ge v2, v3, :cond_33

    .line 66
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 69
    :cond_33
    invoke-interface {p0, v0, v7, v2, v7}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BIIZ)Z

    .line 70
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_37
    add-int/lit8 v3, v2, -0x3

    if-ge v1, v3, :cond_5c

    .line 71
    aget-byte v3, v0, v1

    const/16 v4, 0x4f

    if-ne v3, v4, :cond_59

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, v0, v3

    if-ne v3, v8, :cond_59

    add-int/lit8 v3, v1, 0x2

    aget-byte v3, v0, v3

    if-ne v3, v8, :cond_59

    add-int/lit8 v3, v1, 0x3

    aget-byte v3, v0, v3

    const/16 v4, 0x53

    if-ne v3, v4, :cond_59

    .line 74
    invoke-interface {p0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 75
    return-void

    .line 70
    :cond_59
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 79
    :cond_5c
    add-int/lit8 v3, v2, -0x3

    invoke-interface {p0, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_8
.end method
