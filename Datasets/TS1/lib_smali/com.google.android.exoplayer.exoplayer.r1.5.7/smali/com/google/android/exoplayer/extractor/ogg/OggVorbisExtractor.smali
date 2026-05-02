.class public final Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;
.super Ljava/lang/Object;
.source "OggVorbisExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;
.implements Lcom/google/android/exoplayer/extractor/SeekMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;
    }
.end annotation


# instance fields
.field private audioStartPosition:J

.field private commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

.field private duration:J

.field private elapsedSamples:J

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private inputLength:J

.field private final oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

.field private final oggSeeker:Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

.field private previousPacketBlockSize:I

.field private final scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private seenFirstAudioPacket:Z

.field private targetGranule:J

.field private totalSamples:J

.field private trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

.field private vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const v1, 0xfe01

    new-array v1, v1, [B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([BI)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 42
    new-instance v0, Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    .line 50
    new-instance v0, Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggSeeker:Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

    .line 51
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    .line 260
    return-void
.end method

.method static appendNumberOfSamples(Lcom/google/android/exoplayer/util/ParsableByteArray;J)V
    .registers 9
    .param p0, "buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "packetSampleCount"    # J

    .prologue
    const-wide/16 v4, 0xff

    .line 220
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 223
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    and-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 224
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    const/16 v2, 0x8

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 225
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    const/16 v2, 0x10

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 226
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/16 v2, 0x18

    ushr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 227
    return-void
.end method

.method private static decodeBlockSize(BLcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;)I
    .registers 6
    .param p0, "firstByteOfAudioPacket"    # B
    .param p1, "vorbisSetup"    # Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    .prologue
    .line 231
    iget v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->iLogModes:I

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/google/android/exoplayer/extractor/ogg/OggUtil;->readBits(BII)I

    move-result v1

    .line 233
    .local v1, "modeNumber":I
    iget-object v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->modes:[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;

    aget-object v2, v2, v1

    iget-boolean v2, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;->blockFlag:Z

    if-nez v2, :cond_14

    .line 234
    iget-object v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v0, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->blockSize0:I

    .line 238
    .local v0, "currentBlockSize":I
    :goto_13
    return v0

    .line 236
    .end local v0    # "currentBlockSize":I
    :cond_14
    iget-object v2, p1, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v0, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->blockSize1:I

    .restart local v0    # "currentBlockSize":I
    goto :goto_13
.end method


# virtual methods
.method public getPosition(J)J
    .registers 9
    .param p1, "timeUs"    # J

    .prologue
    .line 248
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_d

    .line 249
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    .line 250
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    .line 253
    :goto_c
    return-wide v0

    .line 252
    :cond_d
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->sampleRate:J

    mul-long/2addr v0, p1

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    .line 253
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    sub-long/2addr v2, v4

    mul-long/2addr v2, p1

    iget-wide v4, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->duration:J

    div-long/2addr v2, v4

    const-wide/16 v4, 0xfa0

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_c
.end method

.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 3
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 83
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 84
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 85
    return-void
.end method

.method public isSeekable()Z
    .registers 5

    .prologue
    .line 243
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    if-eqz v0, :cond_e

    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 22
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 106
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->totalSamples:J

    const-wide/16 v7, 0x0

    cmp-long v2, v5, v7

    if-nez v2, :cond_108

    .line 107
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    if-nez v2, :cond_50

    .line 108
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v5

    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    .line 109
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->readSetupHeaders(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    .line 110
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    .line 111
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v0, p0

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 112
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-eqz v2, :cond_50

    .line 114
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v5

    const-wide/16 v7, 0x1f40

    sub-long/2addr v5, v7

    move-object/from16 v0, p2

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 115
    const/4 v2, 0x1

    .line 183
    :goto_4f
    return v2

    .line 118
    :cond_50
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-nez v2, :cond_e9

    const-wide/16 v5, -0x1

    :goto_5c
    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->totalSamples:J

    .line 121
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v10, "codecInitialisationData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->data:[B

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->setupHeaderData:[B

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-nez v2, :cond_f5

    const-wide/16 v5, -0x1

    :goto_85
    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->duration:J

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v16, v0

    const/4 v2, 0x0

    const-string v3, "audio/vorbis"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v4, v5, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->bitrateNominal:I

    const v5, 0xfe01

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->duration:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v8, v8, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->channels:I

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v9, v9, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-wide v0, v9, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->sampleRate:J

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    long-to-int v9, v0

    const/4 v11, 0x0

    invoke-static/range {v2 .. v11}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 132
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-eqz v2, :cond_108

    .line 133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggSeeker:Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->inputLength:J

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    sub-long/2addr v5, v7

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->totalSamples:J

    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;->setup(JJ)V

    .line 135
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->audioStartPosition:J

    move-object/from16 v0, p2

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 136
    const/4 v2, 0x1

    goto/16 :goto_4f

    .line 118
    .end local v10    # "codecInitialisationData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    :cond_e9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->readGranuleOfLastPage(Lcom/google/android/exoplayer/extractor/ExtractorInput;)J

    move-result-wide v5

    goto/16 :goto_5c

    .line 125
    .restart local v10    # "codecInitialisationData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    :cond_f5
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->totalSamples:J

    const-wide/32 v7, 0xf4240

    mul-long/2addr v5, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-wide v7, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->sampleRate:J

    div-long/2addr v5, v7

    goto/16 :goto_85

    .line 141
    .end local v10    # "codecInitialisationData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    :cond_108
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->seenFirstAudioPacket:Z

    if-nez v2, :cond_15e

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-lez v2, :cond_15e

    .line 142
    invoke-static/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ogg/OggUtil;->skipToNextPage(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    .line 143
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggSeeker:Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    move-object/from16 v0, p1

    invoke-virtual {v2, v5, v6, v0}, Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;->getNextSeekPosition(JLcom/google/android/exoplayer/extractor/ExtractorInput;)J

    move-result-wide v13

    .line 144
    .local v13, "position":J
    const-wide/16 v5, -0x1

    cmp-long v2, v13, v5

    if-eqz v2, :cond_136

    .line 145
    move-object/from16 v0, p2

    iput-wide v13, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 146
    const/4 v2, 0x1

    goto/16 :goto_4f

    .line 148
    :cond_136
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v5, v6}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->skipToPageOfGranule(Lcom/google/android/exoplayer/extractor/ExtractorInput;J)J

    move-result-wide v5

    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    .line 149
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->blockSize0:I

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->previousPacketBlockSize:I

    .line 151
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->seenFirstAudioPacket:Z

    .line 152
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggSeeker:Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/extractor/ogg/OggSeeker;->reset()V

    .line 157
    .end local v13    # "position":J
    :cond_15e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v5}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->readPacket(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    move-result v2

    if-eqz v2, :cond_20c

    .line 159
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v5, 0x0

    aget-byte v2, v2, v5

    and-int/lit8 v2, v2, 0x1

    const/4 v5, 0x1

    if-eq v2, v5, :cond_200

    .line 161
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v5, 0x0

    aget-byte v2, v2, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    invoke-static {v2, v5}, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->decodeBlockSize(BLcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;)I

    move-result v12

    .line 164
    .local v12, "packetBlockSize":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->seenFirstAudioPacket:Z

    if-eqz v2, :cond_20a

    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->previousPacketBlockSize:I

    add-int/2addr v2, v12

    div-int/lit8 v15, v2, 0x4

    .line 166
    .local v15, "samplesInPacket":I
    :goto_19a
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    int-to-long v7, v15

    add-long/2addr v5, v7

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    cmp-long v2, v5, v7

    if-ltz v2, :cond_1ed

    .line 168
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    int-to-long v5, v15

    invoke-static {v2, v5, v6}, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->appendNumberOfSamples(Lcom/google/android/exoplayer/util/ParsableByteArray;J)V

    .line 170
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    const-wide/32 v7, 0xf4240

    mul-long/2addr v5, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisSetup:Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;->idHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-wide v7, v2, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->sampleRate:J

    div-long v3, v5, v7

    .line 171
    .local v3, "timeUs":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v6

    invoke-interface {v2, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-interface/range {v2 .. v8}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 173
    const-wide/16 v5, -0x1

    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->targetGranule:J

    .line 176
    .end local v3    # "timeUs":J
    :cond_1ed
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->seenFirstAudioPacket:Z

    .line 177
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    int-to-long v7, v15

    add-long/2addr v5, v7

    move-object/from16 v0, p0

    iput-wide v5, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    .line 178
    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->previousPacketBlockSize:I

    .line 180
    .end local v12    # "packetBlockSize":I
    .end local v15    # "samplesInPacket":I
    :cond_200
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 181
    const/4 v2, 0x0

    goto/16 :goto_4f

    .line 164
    .restart local v12    # "packetBlockSize":I
    :cond_20a
    const/4 v15, 0x0

    goto :goto_19a

    .line 183
    .end local v12    # "packetBlockSize":I
    :cond_20c
    const/4 v2, -0x1

    goto/16 :goto_4f
.end method

.method readSetupHeaders(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;
    .registers 9
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "scratch"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 190
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    if-nez v0, :cond_13

    .line 191
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->readPacket(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    .line 192
    invoke-static {p2}, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil;->readVorbisIdentificationHeader(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    .line 193
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 196
    :cond_13
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

    if-nez v0, :cond_25

    .line 197
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->readPacket(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    .line 198
    invoke-static {p2}, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil;->readVorbisCommentHeader(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

    .line 199
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 202
    :cond_25
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->readPacket(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    .line 204
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v0

    new-array v3, v0, [B

    .line 206
    .local v3, "setupHeaderData":[B
    iget-object v0, p2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    invoke-static {v0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget v0, v0, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;->channels:I

    invoke-static {p2, v0}, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil;->readVorbisModes(Lcom/google/android/exoplayer/util/ParsableByteArray;I)[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;

    move-result-object v4

    .line 210
    .local v4, "modes":[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;
    array-length v0, v4

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil;->iLog(I)I

    move-result v5

    .line 211
    .local v5, "iLogModes":I
    invoke-virtual {p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 213
    new-instance v0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->vorbisIdHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->commentHeader:Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup;-><init>(Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$VorbisIdHeader;Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$CommentHeader;[B[Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil$Mode;I)V

    return-object v0
.end method

.method public release()V
    .registers 1

    .prologue
    .line 99
    return-void
.end method

.method public seek()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 89
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->oggReader:Lcom/google/android/exoplayer/extractor/ogg/OggReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ogg/OggReader;->reset()V

    .line 90
    iput v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->previousPacketBlockSize:I

    .line 91
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->elapsedSamples:J

    .line 92
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->seenFirstAudioPacket:Z

    .line 93
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 94
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 7
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x7

    const/4 v1, 0x0

    .line 64
    :try_start_2
    new-instance v0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;-><init>()V

    .line 65
    .local v0, "header":Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x1

    invoke-static {p1, v0, v2, v3}, Lcom/google/android/exoplayer/extractor/ogg/OggUtil;->populatePageHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;Lcom/google/android/exoplayer/util/ParsableByteArray;Z)Z

    move-result v2

    if-eqz v2, :cond_1b

    iget v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->type:I

    and-int/lit8 v2, v2, 0x2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1b

    iget v2, v0, Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;->bodySize:I
    :try_end_19
    .catch Lcom/google/android/exoplayer/ParserException; {:try_start_2 .. :try_end_19} :catch_3d
    .catchall {:try_start_2 .. :try_end_19} :catchall_44

    if-ge v2, v4, :cond_21

    .line 75
    :cond_1b
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 77
    .end local v0    # "header":Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    :goto_20
    return v1

    .line 69
    .restart local v0    # "header":Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    :cond_21
    :try_start_21
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 70
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v3, 0x0

    const/4 v4, 0x7

    invoke-interface {p1, v2, v3, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 71
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/google/android/exoplayer/extractor/ogg/VorbisUtil;->verifyVorbisHeaderCapturePattern(ILcom/google/android/exoplayer/util/ParsableByteArray;Z)Z
    :try_end_36
    .catch Lcom/google/android/exoplayer/ParserException; {:try_start_21 .. :try_end_36} :catch_3d
    .catchall {:try_start_21 .. :try_end_36} :catchall_44

    move-result v1

    .line 75
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    goto :goto_20

    .line 72
    .end local v0    # "header":Lcom/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader;
    :catch_3d
    move-exception v2

    .line 75
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    goto :goto_20

    :catchall_44
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ogg/OggVorbisExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    throw v1
.end method
