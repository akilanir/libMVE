.class final Lcom/google/android/exoplayer/hls/WebvttExtractor;
.super Ljava/lang/Object;
.source "WebvttExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;


# static fields
.field private static final LOCAL_TIMESTAMP:Ljava/util/regex/Pattern;

.field private static final MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;


# instance fields
.field private output:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private final ptsTimestampAdjuster:Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

.field private sampleData:[B

.field private final sampleDataWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private sampleSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    const-string v0, "LOCAL:([^,]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->LOCAL_TIMESTAMP:Ljava/util/regex/Pattern;

    .line 51
    const-string v0, "MPEGTS:(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;)V
    .registers 3
    .param p1, "ptsTimestampAdjuster"    # Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->ptsTimestampAdjuster:Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

    .line 63
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleDataWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 64
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    .line 65
    return-void
.end method

.method private buildTrackOutput(J)Lcom/google/android/exoplayer/extractor/TrackOutput;
    .registers 12
    .param p1, "subsampleOffsetUs"    # J

    .prologue
    .line 161
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->output:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    .line 162
    .local v8, "trackOutput":Lcom/google/android/exoplayer/extractor/TrackOutput;
    const-string v0, "id"

    const-string v1, "text/vtt"

    const/4 v2, -0x1

    const-wide/16 v3, -0x1

    const-string v5, "en"

    move-wide v6, p1

    invoke-static/range {v0 .. v7}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-interface {v8, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 164
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->output:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 165
    return-object v8
.end method

.method private processSample()V
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 113
    new-instance v20, Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    move-object/from16 v0, v20

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    .line 116
    .local v20, "webvttData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    invoke-static/range {v20 .. v20}, Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;->validateWebvttHeaderLine(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 119
    const-wide/16 v18, 0x0

    .line 120
    .local v18, "vttTimestampUs":J
    const-wide/16 v16, 0x0

    .line 124
    .local v16, "tsTimestampUs":J
    :cond_12
    :goto_12
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLine()Ljava/lang/String;

    move-result-object v11

    .local v11, "line":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_85

    .line 125
    const-string v4, "X-TIMESTAMP-MAP"

    invoke-virtual {v11, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 126
    sget-object v4, Lcom/google/android/exoplayer/hls/WebvttExtractor;->LOCAL_TIMESTAMP:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    .line 127
    .local v12, "localTimestampMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-nez v4, :cond_49

    .line 128
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "X-TIMESTAMP-MAP doesn\'t contain local timestamp: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 130
    :cond_49
    sget-object v4, Lcom/google/android/exoplayer/hls/WebvttExtractor;->MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    .line 131
    .local v13, "mediaTimestampMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-nez v4, :cond_6e

    .line 132
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "X-TIMESTAMP-MAP doesn\'t contain media timestamp: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 134
    :cond_6e
    const/4 v4, 0x1

    invoke-virtual {v12, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;->parseTimestampUs(Ljava/lang/String;)J

    move-result-wide v18

    .line 135
    const/4 v4, 0x1

    invoke-virtual {v13, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;->ptsToUs(J)J

    move-result-wide v16

    .line 137
    goto :goto_12

    .line 141
    .end local v12    # "localTimestampMatcher":Ljava/util/regex/Matcher;
    .end local v13    # "mediaTimestampMatcher":Ljava/util/regex/Matcher;
    :cond_85
    invoke-static/range {v20 .. v20}, Lcom/google/android/exoplayer/text/webvtt/WebvttCueParser;->findNextCueHeader(Lcom/google/android/exoplayer/util/ParsableByteArray;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 142
    .local v8, "cueHeaderMatcher":Ljava/util/regex/Matcher;
    if-nez v8, :cond_93

    .line 144
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/google/android/exoplayer/hls/WebvttExtractor;->buildTrackOutput(J)Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 158
    :goto_92
    return-void

    .line 148
    :cond_93
    const/4 v4, 0x1

    invoke-virtual {v8, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;->parseTimestampUs(Ljava/lang/String;)J

    move-result-wide v9

    .line 149
    .local v9, "firstCueTimeUs":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->ptsTimestampAdjuster:Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

    add-long v5, v9, v16

    sub-long v5, v5, v18

    invoke-static {v5, v6}, Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;->usToPts(J)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;->adjustTimestamp(J)J

    move-result-wide v2

    .line 151
    .local v2, "sampleTimeUs":J
    sub-long v14, v2, v9

    .line 153
    .local v14, "subsampleOffsetUs":J
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/google/android/exoplayer/hls/WebvttExtractor;->buildTrackOutput(J)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v1

    .line 155
    .local v1, "trackOutput":Lcom/google/android/exoplayer/extractor/TrackOutput;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleDataWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    invoke-virtual {v4, v5, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 156
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleDataWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    invoke-interface {v1, v4, v5}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 157
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    goto :goto_92
.end method


# virtual methods
.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 3
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->output:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 78
    sget-object v0, Lcom/google/android/exoplayer/extractor/SeekMap;->UNSEEKABLE:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 79
    return-void
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 10
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 90
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v4

    long-to-int v1, v4

    .line 93
    .local v1, "currentFileSize":I
    iget v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    array-length v4, v4

    if-ne v2, v4, :cond_1c

    .line 94
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    if-eq v1, v3, :cond_39

    move v2, v1

    :goto_12
    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    invoke-static {v4, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    .line 99
    :cond_1c
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    iget v4, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    array-length v5, v5

    iget v6, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    sub-int/2addr v5, v6

    invoke-interface {p1, v2, v4, v5}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->read([BII)I

    move-result v0

    .line 100
    .local v0, "bytesRead":I
    if-eq v0, v3, :cond_3d

    .line 101
    iget v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    .line 102
    if-eq v1, v3, :cond_37

    iget v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleSize:I

    if-eq v2, v1, :cond_3d

    .line 103
    :cond_37
    const/4 v2, 0x0

    .line 109
    :goto_38
    return v2

    .line 94
    .end local v0    # "bytesRead":I
    :cond_39
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/WebvttExtractor;->sampleData:[B

    array-length v2, v2

    goto :goto_12

    .line 108
    .restart local v0    # "bytesRead":I
    :cond_3d
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/WebvttExtractor;->processSample()V

    move v2, v3

    .line 109
    goto :goto_38
.end method

.method public seek()V
    .registers 2

    .prologue
    .line 84
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 3
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
