.class public final Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;
.super Ljava/lang/Object;
.source "WebmExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$1;,
        Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;,
        Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$InnerEbmlReaderOutput;
    }
.end annotation


# static fields
.field private static final BLOCK_STATE_DATA:I = 0x2

.field private static final BLOCK_STATE_HEADER:I = 0x1

.field private static final BLOCK_STATE_START:I = 0x0

.field private static final CODEC_ID_AAC:Ljava/lang/String; = "A_AAC"

.field private static final CODEC_ID_AC3:Ljava/lang/String; = "A_AC3"

.field private static final CODEC_ID_ACM:Ljava/lang/String; = "A_MS/ACM"

.field private static final CODEC_ID_DTS:Ljava/lang/String; = "A_DTS"

.field private static final CODEC_ID_DTS_EXPRESS:Ljava/lang/String; = "A_DTS/EXPRESS"

.field private static final CODEC_ID_DTS_LOSSLESS:Ljava/lang/String; = "A_DTS/LOSSLESS"

.field private static final CODEC_ID_E_AC3:Ljava/lang/String; = "A_EAC3"

.field private static final CODEC_ID_FLAC:Ljava/lang/String; = "A_FLAC"

.field private static final CODEC_ID_FOURCC:Ljava/lang/String; = "V_MS/VFW/FOURCC"

.field private static final CODEC_ID_H264:Ljava/lang/String; = "V_MPEG4/ISO/AVC"

.field private static final CODEC_ID_H265:Ljava/lang/String; = "V_MPEGH/ISO/HEVC"

.field private static final CODEC_ID_MP3:Ljava/lang/String; = "A_MPEG/L3"

.field private static final CODEC_ID_MPEG2:Ljava/lang/String; = "V_MPEG2"

.field private static final CODEC_ID_MPEG4_AP:Ljava/lang/String; = "V_MPEG4/ISO/AP"

.field private static final CODEC_ID_MPEG4_ASP:Ljava/lang/String; = "V_MPEG4/ISO/ASP"

.field private static final CODEC_ID_MPEG4_SP:Ljava/lang/String; = "V_MPEG4/ISO/SP"

.field private static final CODEC_ID_OPUS:Ljava/lang/String; = "A_OPUS"

.field private static final CODEC_ID_PCM_INT_LIT:Ljava/lang/String; = "A_PCM/INT/LIT"

.field private static final CODEC_ID_PGS:Ljava/lang/String; = "S_HDMV/PGS"

.field private static final CODEC_ID_SUBRIP:Ljava/lang/String; = "S_TEXT/UTF8"

.field private static final CODEC_ID_TRUEHD:Ljava/lang/String; = "A_TRUEHD"

.field private static final CODEC_ID_VOBSUB:Ljava/lang/String; = "S_VOBSUB"

.field private static final CODEC_ID_VORBIS:Ljava/lang/String; = "A_VORBIS"

.field private static final CODEC_ID_VP8:Ljava/lang/String; = "V_VP8"

.field private static final CODEC_ID_VP9:Ljava/lang/String; = "V_VP9"

.field private static final DOC_TYPE_MATROSKA:Ljava/lang/String; = "matroska"

.field private static final DOC_TYPE_WEBM:Ljava/lang/String; = "webm"

.field private static final ENCRYPTION_IV_SIZE:I = 0x8

.field private static final FOURCC_COMPRESSION_VC1:I = 0x31435657

.field private static final ID_AUDIO:I = 0xe1

.field private static final ID_AUDIO_BIT_DEPTH:I = 0x6264

.field private static final ID_BLOCK:I = 0xa1

.field private static final ID_BLOCK_DURATION:I = 0x9b

.field private static final ID_BLOCK_GROUP:I = 0xa0

.field private static final ID_CHANNELS:I = 0x9f

.field private static final ID_CLUSTER:I = 0x1f43b675

.field private static final ID_CODEC_DELAY:I = 0x56aa

.field private static final ID_CODEC_ID:I = 0x86

.field private static final ID_CODEC_PRIVATE:I = 0x63a2

.field private static final ID_CONTENT_COMPRESSION:I = 0x5034

.field private static final ID_CONTENT_COMPRESSION_ALGORITHM:I = 0x4254

.field private static final ID_CONTENT_COMPRESSION_SETTINGS:I = 0x4255

.field private static final ID_CONTENT_ENCODING:I = 0x6240

.field private static final ID_CONTENT_ENCODINGS:I = 0x6d80

.field private static final ID_CONTENT_ENCODING_ORDER:I = 0x5031

.field private static final ID_CONTENT_ENCODING_SCOPE:I = 0x5032

.field private static final ID_CONTENT_ENCRYPTION:I = 0x5035

.field private static final ID_CONTENT_ENCRYPTION_AES_SETTINGS:I = 0x47e7

.field private static final ID_CONTENT_ENCRYPTION_AES_SETTINGS_CIPHER_MODE:I = 0x47e8

.field private static final ID_CONTENT_ENCRYPTION_ALGORITHM:I = 0x47e1

.field private static final ID_CONTENT_ENCRYPTION_KEY_ID:I = 0x47e2

.field private static final ID_CUES:I = 0x1c53bb6b

.field private static final ID_CUE_CLUSTER_POSITION:I = 0xf1

.field private static final ID_CUE_POINT:I = 0xbb

.field private static final ID_CUE_TIME:I = 0xb3

.field private static final ID_CUE_TRACK_POSITIONS:I = 0xb7

.field private static final ID_DEFAULT_DURATION:I = 0x23e383

.field private static final ID_DISPLAY_HEIGHT:I = 0x54ba

.field private static final ID_DISPLAY_UNIT:I = 0x54b2

.field private static final ID_DISPLAY_WIDTH:I = 0x54b0

.field private static final ID_DOC_TYPE:I = 0x4282

.field private static final ID_DOC_TYPE_READ_VERSION:I = 0x4285

.field private static final ID_DURATION:I = 0x4489

.field private static final ID_EBML:I = 0x1a45dfa3

.field private static final ID_EBML_READ_VERSION:I = 0x42f7

.field private static final ID_INFO:I = 0x1549a966

.field private static final ID_LANGUAGE:I = 0x22b59c

.field private static final ID_PIXEL_HEIGHT:I = 0xba

.field private static final ID_PIXEL_WIDTH:I = 0xb0

.field private static final ID_REFERENCE_BLOCK:I = 0xfb

.field private static final ID_SAMPLING_FREQUENCY:I = 0xb5

.field private static final ID_SEEK:I = 0x4dbb

.field private static final ID_SEEK_HEAD:I = 0x114d9b74

.field private static final ID_SEEK_ID:I = 0x53ab

.field private static final ID_SEEK_POSITION:I = 0x53ac

.field private static final ID_SEEK_PRE_ROLL:I = 0x56bb

.field private static final ID_SEGMENT:I = 0x18538067

.field private static final ID_SEGMENT_INFO:I = 0x1549a966

.field private static final ID_SIMPLE_BLOCK:I = 0xa3

.field private static final ID_TIMECODE_SCALE:I = 0x2ad7b1

.field private static final ID_TIME_CODE:I = 0xe7

.field private static final ID_TRACKS:I = 0x1654ae6b

.field private static final ID_TRACK_ENTRY:I = 0xae

.field private static final ID_TRACK_NUMBER:I = 0xd7

.field private static final ID_TRACK_TYPE:I = 0x83

.field private static final ID_VIDEO:I = 0xe0

.field private static final LACING_EBML:I = 0x3

.field private static final LACING_FIXED_SIZE:I = 0x2

.field private static final LACING_NONE:I = 0x0

.field private static final LACING_XIPH:I = 0x1

.field private static final MP3_MAX_INPUT_SIZE:I = 0x1000

.field private static final OPUS_MAX_INPUT_SIZE:I = 0x1680

.field private static final SUBRIP_PREFIX:[B

.field private static final SUBRIP_PREFIX_END_TIMECODE_OFFSET:I = 0x13

.field private static final SUBRIP_TIMECODE_EMPTY:[B

.field private static final SUBRIP_TIMECODE_LENGTH:I = 0xc

.field private static final TRACK_TYPE_AUDIO:I = 0x2

.field private static final UNKNOWN:I = -0x1

.field private static final VORBIS_MAX_INPUT_SIZE:I = 0x2000

.field private static final WAVE_FORMAT_EXTENSIBLE:I = 0xfffe

.field private static final WAVE_FORMAT_PCM:I = 0x1

.field private static final WAVE_FORMAT_SIZE:I = 0x12

.field private static final WAVE_SUBFORMAT_PCM:Ljava/util/UUID;


# instance fields
.field private blockDurationUs:J

.field private blockFlags:I

.field private blockLacingSampleCount:I

.field private blockLacingSampleIndex:I

.field private blockLacingSampleSizes:[I

.field private blockState:I

.field private blockTimeUs:J

.field private blockTrackNumber:I

.field private blockTrackNumberLength:I

.field private clusterTimecodeUs:J

.field private cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

.field private cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

.field private cuesContentPosition:J

.field private currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

.field private durationTimecode:J

.field private durationUs:J

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private final nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final reader:Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

.field private sampleBytesRead:I

.field private sampleBytesWritten:I

.field private sampleCurrentNalBytesRemaining:I

.field private sampleEncodingHandled:Z

.field private sampleRead:Z

.field private sampleSeenReferenceBlock:Z

.field private final sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private seekEntryId:I

.field private final seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private seekEntryPosition:J

.field private seekForCues:Z

.field private seekPositionAfterBuildingCues:J

.field private seenClusterPositionForCurrentCuePoint:Z

.field private segmentContentPosition:J

.field private segmentContentSize:J

.field private sentDrmInitData:Z

.field private sentSeekMap:Z

.field private final subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private timecodeScale:J

.field private final tracks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;",
            ">;"
        }
    .end annotation
.end field

.field private final varintReader:Lcom/google/android/exoplayer/extractor/webm/VarintReader;

.field private final vorbisNumPageSamples:Lcom/google/android/exoplayer/util/ParsableByteArray;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 171
    const/16 v0, 0x20

    new-array v0, v0, [B

    fill-array-data v0, :array_24

    sput-object v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_PREFIX:[B

    .line 179
    const/16 v0, 0xc

    new-array v0, v0, [B

    fill-array-data v0, :array_38

    sput-object v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_TIMECODE_EMPTY:[B

    .line 205
    new-instance v0, Ljava/util/UUID;

    const-wide v1, 0x100000000001000L

    const-wide v3, -0x7fffff55ffc7648fL    # -3.607411173533E-312

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/util/UUID;-><init>(JJ)V

    sput-object v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->WAVE_SUBFORMAT_PCM:Ljava/util/UUID;

    return-void

    .line 171
    :array_24
    .array-data 1
        0x31t
        0xat
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
        0x30t
        0x30t
        0x30t
        0x20t
        0x2dt
        0x2dt
        0x3et
        0x20t
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
        0x30t
        0x30t
        0x30t
        0xat
    .end array-data

    .line 179
    :array_38
    .array-data 1
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
        0x20t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 269
    new-instance v0, Lcom/google/android/exoplayer/extractor/webm/DefaultEbmlReader;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/webm/DefaultEbmlReader;-><init>()V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;-><init>(Lcom/google/android/exoplayer/extractor/webm/EbmlReader;)V

    .line 270
    return-void
.end method

.method constructor <init>(Lcom/google/android/exoplayer/extractor/webm/EbmlReader;)V
    .registers 6
    .param p1, "reader"    # Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

    .prologue
    const/4 v3, 0x4

    const-wide/16 v0, -0x1

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    .line 221
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentSize:J

    .line 222
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    .line 223
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationTimecode:J

    .line 224
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationUs:J

    .line 239
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cuesContentPosition:J

    .line 240
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekPositionAfterBuildingCues:J

    .line 241
    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->clusterTimecodeUs:J

    .line 273
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->reader:Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

    .line 274
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->reader:Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

    new-instance v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$InnerEbmlReaderOutput;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$InnerEbmlReaderOutput;-><init>(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$1;)V

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/webm/EbmlReader;->init(Lcom/google/android/exoplayer/extractor/webm/EbmlReaderOutput;)V

    .line 275
    new-instance v0, Lcom/google/android/exoplayer/extractor/webm/VarintReader;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/webm/VarintReader;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->varintReader:Lcom/google/android/exoplayer/extractor/webm/VarintReader;

    .line 276
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    .line 277
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 278
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->vorbisNumPageSamples:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 279
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 280
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 281
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 282
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 283
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 284
    return-void
.end method

.method static synthetic access$300()Ljava/util/UUID;
    .registers 1

    .prologue
    .line 58
    sget-object v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->WAVE_SUBFORMAT_PCM:Ljava/util/UUID;

    return-object v0
.end method

.method private buildSeekMap()Lcom/google/android/exoplayer/extractor/SeekMap;
    .registers 13

    .prologue
    const-wide/16 v8, -0x1

    const/4 v11, 0x0

    .line 1024
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_2d

    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationUs:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_2d

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    if-eqz v6, :cond_2d

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/LongArray;->size()I

    move-result v6

    if-eqz v6, :cond_2d

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    if-eqz v6, :cond_2d

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/LongArray;->size()I

    move-result v6

    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/LongArray;->size()I

    move-result v7

    if-eq v6, v7, :cond_34

    .line 1028
    :cond_2d
    iput-object v11, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    .line 1029
    iput-object v11, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    .line 1030
    sget-object v6, Lcom/google/android/exoplayer/extractor/SeekMap;->UNSEEKABLE:Lcom/google/android/exoplayer/extractor/SeekMap;

    .line 1050
    :goto_33
    return-object v6

    .line 1032
    :cond_34
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/LongArray;->size()I

    move-result v0

    .line 1033
    .local v0, "cuePointsSize":I
    new-array v4, v0, [I

    .line 1034
    .local v4, "sizes":[I
    new-array v3, v0, [J

    .line 1035
    .local v3, "offsets":[J
    new-array v1, v0, [J

    .line 1036
    .local v1, "durationsUs":[J
    new-array v5, v0, [J

    .line 1037
    .local v5, "timesUs":[J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_43
    if-ge v2, v0, :cond_5b

    .line 1038
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v6, v2}, Lcom/google/android/exoplayer/util/LongArray;->get(I)J

    move-result-wide v6

    aput-wide v6, v5, v2

    .line 1039
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v8, v2}, Lcom/google/android/exoplayer/util/LongArray;->get(I)J

    move-result-wide v8

    add-long/2addr v6, v8

    aput-wide v6, v3, v2

    .line 1037
    add-int/lit8 v2, v2, 0x1

    goto :goto_43

    .line 1041
    :cond_5b
    const/4 v2, 0x0

    :goto_5c
    add-int/lit8 v6, v0, -0x1

    if-ge v2, v6, :cond_76

    .line 1042
    add-int/lit8 v6, v2, 0x1

    aget-wide v6, v3, v6

    aget-wide v8, v3, v2

    sub-long/2addr v6, v8

    long-to-int v6, v6

    aput v6, v4, v2

    .line 1043
    add-int/lit8 v6, v2, 0x1

    aget-wide v6, v5, v6

    aget-wide v8, v5, v2

    sub-long/2addr v6, v8

    aput-wide v6, v1, v2

    .line 1041
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c

    .line 1045
    :cond_76
    add-int/lit8 v6, v0, -0x1

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentSize:J

    add-long/2addr v7, v9

    add-int/lit8 v9, v0, -0x1

    aget-wide v9, v3, v9

    sub-long/2addr v7, v9

    long-to-int v7, v7

    aput v7, v4, v6

    .line 1047
    add-int/lit8 v6, v0, -0x1

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationUs:J

    add-int/lit8 v9, v0, -0x1

    aget-wide v9, v5, v9

    sub-long/2addr v7, v9

    aput-wide v7, v1, v6

    .line 1048
    iput-object v11, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    .line 1049
    iput-object v11, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    .line 1050
    new-instance v6, Lcom/google/android/exoplayer/extractor/ChunkIndex;

    invoke-direct {v6, v4, v3, v1, v5}, Lcom/google/android/exoplayer/extractor/ChunkIndex;-><init>([I[J[J[J)V

    goto :goto_33
.end method

.method private commitSampleToOutput(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;J)V
    .registers 11
    .param p1, "track"    # Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;
    .param p2, "timeUs"    # J

    .prologue
    .line 831
    const-string v0, "S_TEXT/UTF8"

    iget-object v1, p1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 832
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->writeSubripSample(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;)V

    .line 834
    :cond_d
    iget-object v0, p1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget v3, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    iget v4, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    const/4 v5, 0x0

    iget-object v6, p1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->encryptionKeyId:[B

    move-wide v1, p2

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 835
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleRead:Z

    .line 836
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->resetSample()V

    .line 837
    return-void
.end method

.method private static ensureArrayCapacity([II)[I
    .registers 3
    .param p0, "array"    # [I
    .param p1, "length"    # I

    .prologue
    .line 1119
    if-nez p0, :cond_5

    .line 1120
    new-array p0, p1, [I

    .line 1125
    .end local p0    # "array":[I
    :cond_4
    :goto_4
    return-object p0

    .line 1121
    .restart local p0    # "array":[I
    :cond_5
    array-length v0, p0

    if-ge v0, p1, :cond_4

    .line 1125
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array p0, v0, [I

    goto :goto_4
.end method

.method private static isCodecSupported(Ljava/lang/String;)Z
    .registers 2
    .param p0, "codecId"    # Ljava/lang/String;

    .prologue
    .line 1087
    const-string v0, "V_VP8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_VP9"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEG2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEG4/ISO/SP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEG4/ISO/ASP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEG4/ISO/AP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEG4/ISO/AVC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MPEGH/ISO/HEVC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "V_MS/VFW/FOURCC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_OPUS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_VORBIS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_AAC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_MPEG/L3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_AC3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_EAC3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_TRUEHD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_DTS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_DTS/EXPRESS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_DTS/LOSSLESS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_FLAC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_MS/ACM"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "A_PCM/INT/LIT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "S_TEXT/UTF8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "S_VOBSUB"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "S_HDMV/PGS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ca

    :cond_c8
    const/4 v0, 0x1

    :goto_c9
    return v0

    :cond_ca
    const/4 v0, 0x0

    goto :goto_c9
.end method

.method private maybeSeekForCues(Lcom/google/android/exoplayer/extractor/PositionHolder;J)Z
    .registers 10
    .param p1, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .param p2, "currentPosition"    # J

    .prologue
    const-wide/16 v4, -0x1

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1063
    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekForCues:Z

    if-eqz v2, :cond_11

    .line 1064
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekPositionAfterBuildingCues:J

    .line 1065
    iget-wide v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cuesContentPosition:J

    iput-wide v2, p1, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 1066
    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekForCues:Z

    .line 1076
    :goto_10
    return v0

    .line 1071
    :cond_11
    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentSeekMap:Z

    if-eqz v2, :cond_22

    iget-wide v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekPositionAfterBuildingCues:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_22

    .line 1072
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekPositionAfterBuildingCues:J

    iput-wide v1, p1, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 1073
    iput-wide v4, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekPositionAfterBuildingCues:J

    goto :goto_10

    :cond_22
    move v0, v1

    .line 1076
    goto :goto_10
.end method

.method private readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V
    .registers 6
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "requiredLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 853
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v0

    if-lt v0, p2, :cond_9

    .line 862
    :goto_8
    return-void

    .line 856
    :cond_9
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->capacity()I

    move-result v0

    if-ge v0, p2, :cond_2f

    .line 857
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 860
    :cond_2f
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    sub-int v2, p2, v2

    invoke-interface {p1, v0, v1, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 861
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    goto :goto_8
.end method

.method private readToOutput(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/TrackOutput;I)I
    .registers 7
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1005
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    .line 1006
    .local v1, "strippedBytesLeft":I
    if-lez v1, :cond_1c

    .line 1007
    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1008
    .local v0, "bytesRead":I
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-interface {p2, v2, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 1012
    :goto_11
    iget v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    .line 1013
    iget v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    .line 1014
    return v0

    .line 1010
    .end local v0    # "bytesRead":I
    :cond_1c
    const/4 v2, 0x0

    invoke-interface {p2, p1, p3, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v0

    .restart local v0    # "bytesRead":I
    goto :goto_11
.end method

.method private readToTarget(Lcom/google/android/exoplayer/extractor/ExtractorInput;[BII)V
    .registers 8
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "target"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 990
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    invoke-static {p4, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 991
    .local v0, "pendingStrippedBytes":I
    add-int v1, p3, v0

    sub-int v2, p4, v0

    invoke-interface {p1, p2, v1, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 992
    if-lez v0, :cond_18

    .line 993
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1, p2, p3, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 995
    :cond_18
    iget v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    add-int/2addr v1, p4

    iput v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    .line 996
    return-void
.end method

.method private resetSample()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 840
    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    .line 841
    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    .line 842
    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    .line 843
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleEncodingHandled:Z

    .line 844
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 845
    return-void
.end method

.method private scaleTimecodeToUs(J)J
    .registers 9
    .param p1, "unscaledTimecode"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 1080
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    .line 1081
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Can\'t scale timecode prior to timecodeScale being set."

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1083
    :cond_10
    iget-wide v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    const-wide/16 v4, 0x3e8

    move-wide v0, p1

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static setSubripSampleEndTimecode([BJ)V
    .registers 14
    .param p0, "subripSampleData"    # [B
    .param p1, "timeUs"    # J

    .prologue
    const-wide v7, 0xd693a400L

    const/4 v10, 0x0

    .line 967
    const-wide/16 v5, -0x1

    cmp-long v5, p1, v5

    if-nez v5, :cond_16

    .line 968
    sget-object v4, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_TIMECODE_EMPTY:[B

    .line 980
    .local v4, "timeCodeData":[B
    :goto_e
    const/16 v5, 0x13

    const/16 v6, 0xc

    invoke-static {v4, v10, p0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 982
    return-void

    .line 970
    .end local v4    # "timeCodeData":[B
    :cond_16
    div-long v5, p1, v7

    long-to-int v0, v5

    .line 971
    .local v0, "hours":I
    int-to-long v5, v0

    mul-long/2addr v5, v7

    sub-long/2addr p1, v5

    .line 972
    const-wide/32 v5, 0x3938700

    div-long v5, p1, v5

    long-to-int v2, v5

    .line 973
    .local v2, "minutes":I
    const v5, 0x3938700

    mul-int/2addr v5, v2

    int-to-long v5, v5

    sub-long/2addr p1, v5

    .line 974
    const-wide/32 v5, 0xf4240

    div-long v5, p1, v5

    long-to-int v3, v5

    .line 975
    .local v3, "seconds":I
    const v5, 0xf4240

    mul-int/2addr v5, v3

    int-to-long v5, v5

    sub-long/2addr p1, v5

    .line 976
    const-wide/16 v5, 0x3e8

    div-long v5, p1, v5

    long-to-int v1, v5

    .line 977
    .local v1, "milliseconds":I
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%02d:%02d:%02d,%03d"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    const/4 v8, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    .restart local v4    # "timeCodeData":[B
    goto :goto_e
.end method

.method private writeSampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;I)V
    .registers 15
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "track"    # Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 866
    const-string v5, "S_TEXT/UTF8"

    iget-object v6, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 867
    sget-object v5, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_PREFIX:[B

    array-length v5, v5

    add-int v4, v5, p3

    .line 868
    .local v4, "sizeWithPrefix":I
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->capacity()I

    move-result v5

    if-ge v5, v4, :cond_26

    .line 871
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v6, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_PREFIX:[B

    add-int v7, v4, p3

    invoke-static {v6, v7}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v6

    iput-object v6, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 873
    :cond_26
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    sget-object v6, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->SUBRIP_PREFIX:[B

    array-length v6, v6

    invoke-interface {p1, v5, v6, p3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 874
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 875
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 955
    .end local v4    # "sizeWithPrefix":I
    :cond_3a
    :goto_3a
    return-void

    .line 881
    :cond_3b
    iget-object v3, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 882
    .local v3, "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    iget-boolean v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleEncodingHandled:Z

    if-nez v5, :cond_96

    .line 883
    iget-boolean v5, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->hasContentEncryption:Z

    if-eqz v5, :cond_eb

    .line 886
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    and-int/lit8 v5, v5, -0x3

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    .line 887
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v5, v8, v9}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 888
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    .line 889
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    aget-byte v5, v5, v8

    and-int/lit16 v5, v5, 0x80

    const/16 v6, 0x80

    if-ne v5, v6, :cond_6c

    .line 890
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Extension bit is set in signal byte"

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 892
    :cond_6c
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    aget-byte v5, v5, v8

    and-int/lit8 v5, v5, 0x1

    if-ne v5, v9, :cond_94

    .line 893
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v6, 0x8

    aput-byte v6, v5, v8

    .line 894
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 895
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-interface {v3, v5, v9}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 896
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    .line 897
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    .line 903
    :cond_94
    :goto_94
    iput-boolean v9, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleEncodingHandled:Z

    .line 905
    :cond_96
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v5

    add-int/2addr p3, v5

    .line 907
    const-string v5, "V_MPEG4/ISO/AVC"

    iget-object v6, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b1

    const-string v5, "V_MPEGH/ISO/HEVC"

    iget-object v6, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_106

    .line 912
    :cond_b1
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v0, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 913
    .local v0, "nalLengthData":[B
    aput-byte v8, v0, v8

    .line 914
    aput-byte v8, v0, v9

    .line 915
    const/4 v5, 0x2

    aput-byte v8, v0, v5

    .line 916
    iget v1, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->nalUnitLengthFieldLength:I

    .line 917
    .local v1, "nalUnitLengthFieldLength":I
    iget v5, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v2, v5, 0x4

    .line 921
    .local v2, "nalUnitLengthFieldLengthDiff":I
    :goto_c2
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    if-ge v5, p3, :cond_112

    .line 922
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    if-nez v5, :cond_fa

    .line 924
    invoke-direct {p0, p1, v0, v2, v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readToTarget(Lcom/google/android/exoplayer/extractor/ExtractorInput;[BII)V

    .line 926
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 927
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    .line 929
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 930
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-interface {v3, v5, v10}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 931
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    add-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    goto :goto_c2

    .line 899
    .end local v0    # "nalLengthData":[B
    .end local v1    # "nalUnitLengthFieldLength":I
    .end local v2    # "nalUnitLengthFieldLengthDiff":I
    :cond_eb
    iget-object v5, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    if-eqz v5, :cond_94

    .line 901
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleStrippedBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    iget-object v7, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    array-length v7, v7

    invoke-virtual {v5, v6, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    goto :goto_94

    .line 934
    .restart local v0    # "nalLengthData":[B
    .restart local v1    # "nalUnitLengthFieldLength":I
    .restart local v2    # "nalUnitLengthFieldLengthDiff":I
    :cond_fa
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    iget v6, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    invoke-direct {p0, p1, v3, v6}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readToOutput(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/TrackOutput;I)I

    move-result v6

    sub-int/2addr v5, v6

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_c2

    .line 939
    .end local v0    # "nalLengthData":[B
    .end local v1    # "nalUnitLengthFieldLength":I
    .end local v2    # "nalUnitLengthFieldLengthDiff":I
    :cond_106
    :goto_106
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    if-ge v5, p3, :cond_112

    .line 940
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesRead:I

    sub-int v5, p3, v5

    invoke-direct {p0, p1, v3, v5}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readToOutput(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/TrackOutput;I)I

    goto :goto_106

    .line 944
    :cond_112
    const-string v5, "A_VORBIS"

    iget-object v6, p2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3a

    .line 951
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->vorbisNumPageSamples:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 952
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->vorbisNumPageSamples:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-interface {v3, v5, v10}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 953
    iget v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    add-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    goto/16 :goto_3a
.end method

.method private writeSubripSample(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;)V
    .registers 5
    .param p1, "track"    # Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    .prologue
    .line 958
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockDurationUs:J

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->setSubripSampleEndTimecode([BJ)V

    .line 961
    iget-object v0, p1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 962
    iget v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->subripSample:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleBytesWritten:I

    .line 963
    return-void
.end method


# virtual methods
.method binaryElement(IILcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 32
    .param p1, "id"    # I
    .param p2, "contentSize"    # I
    .param p3, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 672
    sparse-switch p1, :sswitch_data_564

    .line 826
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Unexpected id: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 674
    :sswitch_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static/range {v24 .. v25}, Ljava/util/Arrays;->fill([BB)V

    .line 675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    rsub-int/lit8 v25, p2, 0x4

    move-object/from16 v0, p3

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryIdBytes:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryId:I

    .line 824
    :goto_6a
    return-void

    .line 680
    :sswitch_6b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move/from16 v0, p2

    new-array v0, v0, [B

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    .line 681
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    goto :goto_6a

    .line 685
    :sswitch_97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move/from16 v0, p2

    new-array v0, v0, [B

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    .line 686
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    goto :goto_6a

    .line 689
    :sswitch_c3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move/from16 v0, p2

    new-array v0, v0, [B

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->encryptionKeyId:[B

    .line 690
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->encryptionKeyId:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    goto/16 :goto_6a

    .line 699
    :sswitch_f0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    move/from16 v24, v0

    if-nez v24, :cond_146

    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->varintReader:Lcom/google/android/exoplayer/extractor/webm/VarintReader;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x1

    const/16 v27, 0x8

    move-object/from16 v0, v24

    move-object/from16 v1, p3

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/extractor/webm/VarintReader;->readUnsignedVarint(Lcom/google/android/exoplayer/extractor/ExtractorInput;ZZI)J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumber:I

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->varintReader:Lcom/google/android/exoplayer/extractor/webm/VarintReader;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/extractor/webm/VarintReader;->getLastLength()I

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    .line 702
    const-wide/16 v24, -0x1

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockDurationUs:J

    .line 703
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    .line 704
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 707
    :cond_146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumber:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    .line 710
    .local v23, "track":Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;
    if-nez v23, :cond_173

    .line 711
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    move/from16 v24, v0

    sub-int v24, p2, v24

    move-object/from16 v0, p3

    move/from16 v1, v24

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 712
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    goto/16 :goto_6a

    .line 716
    :cond_173
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    move/from16 v24, v0

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_287

    .line 718
    const/16 v24, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V

    .line 719
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x2

    aget-byte v24, v24, v25

    and-int/lit8 v24, v24, 0x6

    shr-int/lit8 v12, v24, 0x1

    .line 720
    .local v12, "lacing":I
    if-nez v12, :cond_2f3

    .line 721
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    .line 722
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x1

    invoke-static/range {v24 .. v25}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->ensureArrayCapacity([II)[I

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    .line 723
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    move/from16 v26, v0

    sub-int v26, p2, v26

    add-int/lit8 v26, v26, -0x3

    aput v26, v24, v25

    .line 797
    :goto_1d0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget-byte v24, v24, v25

    shl-int/lit8 v24, v24, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v25, v0

    const/16 v26, 0x1

    aget-byte v25, v25, v26

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    or-int v21, v24, v25

    .line 798
    .local v21, "timecode":I
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->clusterTimecodeUs:J

    move-wide/from16 v24, v0

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v26

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scaleTimecodeToUs(J)J

    move-result-wide v26

    add-long v24, v24, v26

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTimeUs:J

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x2

    aget-byte v24, v24, v25

    and-int/lit8 v24, v24, 0x8

    const/16 v25, 0x8

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_532

    const/4 v10, 0x1

    .line 800
    .local v10, "isInvisible":Z
    :goto_230
    move-object/from16 v0, v23

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->type:I

    move/from16 v24, v0

    const/16 v25, 0x2

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_264

    const/16 v24, 0xa3

    move/from16 v0, p1

    move/from16 v1, v24

    if-ne v0, v1, :cond_535

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x2

    aget-byte v24, v24, v25

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0x80

    move/from16 v24, v0

    const/16 v25, 0x80

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_535

    :cond_264
    const/4 v11, 0x1

    .line 802
    .local v11, "isKeyframe":Z
    :goto_265
    if-eqz v11, :cond_538

    const/16 v24, 0x1

    move/from16 v25, v24

    :goto_26b
    if-eqz v10, :cond_53e

    const/high16 v24, 0x8000000

    :goto_26f
    or-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    .line 804
    const/16 v24, 0x2

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    .line 805
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    .line 808
    .end local v10    # "isInvisible":Z
    .end local v11    # "isKeyframe":Z
    .end local v12    # "lacing":I
    .end local v21    # "timecode":I
    :cond_287
    const/16 v24, 0xa3

    move/from16 v0, p1

    move/from16 v1, v24

    if-ne v0, v1, :cond_54c

    .line 810
    :goto_28f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_542

    .line 811
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    move/from16 v25, v0

    aget v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->writeSampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;I)V

    .line 812
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTimeUs:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    move/from16 v26, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->defaultSampleDurationNs:I

    move/from16 v27, v0

    mul-int v26, v26, v27

    move/from16 v0, v26

    div-int/lit16 v0, v0, 0x3e8

    move/from16 v26, v0

    move/from16 v0, v26

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v19, v24, v26

    .line 814
    .local v19, "sampleTimeUs":J
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-wide/from16 v2, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->commitSampleToOutput(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;J)V

    .line 815
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleIndex:I

    goto :goto_28f

    .line 725
    .end local v19    # "sampleTimeUs":J
    .restart local v12    # "lacing":I
    :cond_2f3
    const/16 v24, 0xa3

    move/from16 v0, p1

    move/from16 v1, v24

    if-eq v0, v1, :cond_303

    .line 726
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "Lacing only supported in SimpleBlocks."

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 730
    :cond_303
    const/16 v24, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V

    .line 731
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    const/16 v25, 0x3

    aget-byte v24, v24, v25

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v24, v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    .line 732
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v25, v0

    invoke-static/range {v24 .. v25}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->ensureArrayCapacity([II)[I

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    .line 734
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ne v12, v0, :cond_373

    .line 735
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    move/from16 v24, v0

    sub-int v24, p2, v24

    add-int/lit8 v24, v24, -0x4

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v25, v0

    div-int v5, v24, v25

    .line 737
    .local v5, "blockLacingSampleSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v26, v0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-static {v0, v1, v2, v5}, Ljava/util/Arrays;->fill([IIII)V

    goto/16 :goto_1d0

    .line 738
    .end local v5    # "blockLacingSampleSize":I
    :cond_373
    const/16 v24, 0x1

    move/from16 v0, v24

    if-ne v12, v0, :cond_3f0

    .line 739
    const/16 v22, 0x0

    .line 740
    .local v22, "totalSamplesSize":I
    const/4 v7, 0x4

    .line 741
    .local v7, "headerSize":I
    const/16 v18, 0x0

    .local v18, "sampleIndex":I
    :goto_37e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    move/from16 v0, v18

    move/from16 v1, v24

    if-ge v0, v1, :cond_3d2

    .line 742
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput v25, v24, v18

    .line 745
    :cond_396
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v7}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V

    .line 746
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    add-int/lit8 v25, v7, -0x1

    aget-byte v24, v24, v25

    move/from16 v0, v24

    and-int/lit16 v6, v0, 0xff

    .line 747
    .local v6, "byteValue":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    aget v25, v24, v18

    add-int v25, v25, v6

    aput v25, v24, v18

    .line 748
    const/16 v24, 0xff

    move/from16 v0, v24

    if-eq v6, v0, :cond_396

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    aget v24, v24, v18

    add-int v22, v22, v24

    .line 741
    add-int/lit8 v18, v18, 0x1

    goto :goto_37e

    .line 751
    .end local v6    # "byteValue":I
    :cond_3d2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v25, v0

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    move/from16 v26, v0

    sub-int v26, p2, v26

    sub-int v26, v26, v7

    sub-int v26, v26, v22

    aput v26, v24, v25

    goto/16 :goto_1d0

    .line 753
    .end local v7    # "headerSize":I
    .end local v18    # "sampleIndex":I
    .end local v22    # "totalSamplesSize":I
    :cond_3f0
    const/16 v24, 0x3

    move/from16 v0, v24

    if-ne v12, v0, :cond_517

    .line 754
    const/16 v22, 0x0

    .line 755
    .restart local v22    # "totalSamplesSize":I
    const/4 v7, 0x4

    .line 756
    .restart local v7    # "headerSize":I
    const/16 v18, 0x0

    .restart local v18    # "sampleIndex":I
    :goto_3fb
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    move/from16 v0, v18

    move/from16 v1, v24

    if-ge v0, v1, :cond_4f9

    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput v25, v24, v18

    .line 758
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v7}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V

    .line 759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    add-int/lit8 v25, v7, -0x1

    aget-byte v24, v24, v25

    if-nez v24, :cond_436

    .line 760
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "No valid varint length mask found"

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 762
    :cond_436
    const-wide/16 v16, 0x0

    .line 763
    .local v16, "readValue":J
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_439
    const/16 v24, 0x8

    move/from16 v0, v24

    if-ge v8, v0, :cond_4b7

    .line 764
    const/16 v24, 0x1

    rsub-int/lit8 v25, v8, 0x7

    shl-int v13, v24, v25

    .line 765
    .local v13, "lengthMask":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    add-int/lit8 v25, v7, -0x1

    aget-byte v24, v24, v25

    and-int v24, v24, v13

    if-eqz v24, :cond_4cd

    .line 766
    add-int/lit8 v14, v7, -0x1

    .line 767
    .local v14, "readPosition":I
    add-int/2addr v7, v8

    .line 768
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v7}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->readScratch(Lcom/google/android/exoplayer/extractor/ExtractorInput;I)V

    .line 769
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "readPosition":I
    .local v15, "readPosition":I
    aget-byte v24, v24, v14

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    xor-int/lit8 v25, v13, -0x1

    and-int v24, v24, v25

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .line 770
    :goto_482
    if-ge v15, v7, :cond_4a7

    .line 771
    const/16 v24, 0x8

    shl-long v16, v16, v24

    .line 772
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v24, v0

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "readPosition":I
    .restart local v14    # "readPosition":I
    aget-byte v24, v24, v15

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    or-long v16, v16, v24

    move v15, v14

    .end local v14    # "readPosition":I
    .restart local v15    # "readPosition":I
    goto :goto_482

    .line 775
    :cond_4a7
    if-lez v18, :cond_4b7

    .line 776
    const-wide/16 v24, 0x1

    mul-int/lit8 v26, v8, 0x7

    add-int/lit8 v26, v26, 0x6

    shl-long v24, v24, v26

    const-wide/16 v26, 0x1

    sub-long v24, v24, v26

    sub-long v16, v16, v24

    .line 781
    .end local v13    # "lengthMask":I
    .end local v15    # "readPosition":I
    :cond_4b7
    const-wide/32 v24, -0x80000000

    cmp-long v24, v16, v24

    if-ltz v24, :cond_4c5

    const-wide/32 v24, 0x7fffffff

    cmp-long v24, v16, v24

    if-lez v24, :cond_4d1

    .line 782
    :cond_4c5
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "EBML lacing sample size out of range."

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 763
    .restart local v13    # "lengthMask":I
    :cond_4cd
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_439

    .line 784
    .end local v13    # "lengthMask":I
    :cond_4d1
    move-wide/from16 v0, v16

    long-to-int v9, v0

    .line 785
    .local v9, "intReadValue":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    if-nez v18, :cond_4ec

    .end local v9    # "intReadValue":I
    :goto_4dc
    aput v9, v24, v18

    .line 787
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    aget v24, v24, v18

    add-int v22, v22, v24

    .line 756
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_3fb

    .line 785
    .restart local v9    # "intReadValue":I
    :cond_4ec
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v25, v0

    add-int/lit8 v26, v18, -0x1

    aget v25, v25, v26

    add-int v9, v9, v25

    goto :goto_4dc

    .line 789
    .end local v8    # "i":I
    .end local v9    # "intReadValue":I
    .end local v16    # "readValue":J
    :cond_4f9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleCount:I

    move/from16 v25, v0

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumberLength:I

    move/from16 v26, v0

    sub-int v26, p2, v26

    sub-int v26, v26, v7

    sub-int v26, v26, v22

    aput v26, v24, v25

    goto/16 :goto_1d0

    .line 793
    .end local v7    # "headerSize":I
    .end local v18    # "sampleIndex":I
    .end local v22    # "totalSamplesSize":I
    :cond_517
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Unexpected lacing value: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 799
    .restart local v21    # "timecode":I
    :cond_532
    const/4 v10, 0x0

    goto/16 :goto_230

    .line 800
    .restart local v10    # "isInvisible":Z
    :cond_535
    const/4 v11, 0x0

    goto/16 :goto_265

    .line 802
    .restart local v11    # "isKeyframe":Z
    :cond_538
    const/16 v24, 0x0

    move/from16 v25, v24

    goto/16 :goto_26b

    :cond_53e
    const/16 v24, 0x0

    goto/16 :goto_26f

    .line 817
    .end local v10    # "isInvisible":Z
    .end local v11    # "isKeyframe":Z
    .end local v12    # "lacing":I
    .end local v21    # "timecode":I
    :cond_542
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    goto/16 :goto_6a

    .line 821
    :cond_54c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockLacingSampleSizes:[I

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->writeSampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;I)V

    goto/16 :goto_6a

    .line 672
    nop

    :sswitch_data_564
    .sparse-switch
        0xa1 -> :sswitch_f0
        0xa3 -> :sswitch_f0
        0x4255 -> :sswitch_97
        0x47e2 -> :sswitch_c3
        0x53ab -> :sswitch_20
        0x63a2 -> :sswitch_6b
    .end sparse-switch
.end method

.method endMasterElement(I)V
    .registers 8
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const-wide/16 v2, -0x1

    .line 449
    sparse-switch p1, :sswitch_data_102

    .line 520
    :cond_6
    :goto_6
    return-void

    .line 451
    :sswitch_7
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_12

    .line 453
    const-wide/32 v0, 0xf4240

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    .line 455
    :cond_12
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationTimecode:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6

    .line 456
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationTimecode:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scaleTimecodeToUs(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationUs:J

    goto :goto_6

    .line 460
    :sswitch_21
    iget v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2c

    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryPosition:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_34

    .line 461
    :cond_2c
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Mandatory element SeekID or SeekPosition not found"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 463
    :cond_34
    iget v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryId:I

    const v1, 0x1c53bb6b

    if-ne v0, v1, :cond_6

    .line 464
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryPosition:J

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cuesContentPosition:J

    goto :goto_6

    .line 468
    :sswitch_40
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentSeekMap:Z

    if-nez v0, :cond_6

    .line 469
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->buildSeekMap()Lcom/google/android/exoplayer/extractor/SeekMap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 470
    iput-boolean v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentSeekMap:Z

    goto :goto_6

    .line 476
    :sswitch_50
    iget v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    .line 481
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleSeenReferenceBlock:Z

    if-nez v0, :cond_5f

    .line 482
    iget v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockFlags:I

    .line 484
    :cond_5f
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    iget v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTrackNumber:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockTimeUs:J

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->commitSampleToOutput(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;J)V

    .line 485
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    goto :goto_6

    .line 488
    :sswitch_72
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-boolean v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->hasContentEncryption:Z

    if-eqz v0, :cond_6

    .line 489
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->encryptionKeyId:[B

    if-nez v0, :cond_86

    .line 490
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Encrypted Track found but ContentEncKeyID was not found"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 492
    :cond_86
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentDrmInitData:Z

    if-nez v0, :cond_6

    .line 493
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    new-instance v1, Lcom/google/android/exoplayer/drm/DrmInitData$Universal;

    new-instance v2, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    const-string v3, "video/webm"

    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-object v4, v4, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->encryptionKeyId:[B

    invoke-direct {v2, v3, v4}, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;-><init>(Ljava/lang/String;[B)V

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/drm/DrmInitData$Universal;-><init>(Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->drmInitData(Lcom/google/android/exoplayer/drm/DrmInitData;)V

    .line 495
    iput-boolean v5, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentDrmInitData:Z

    goto/16 :goto_6

    .line 500
    :sswitch_a3
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-boolean v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->hasContentEncryption:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleStrippedBytes:[B

    if-eqz v0, :cond_6

    .line 501
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Combining encryption and compression is not supported"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 505
    :sswitch_b7
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget v1, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->number:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_e5

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->isCodecSupported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e5

    .line 506
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->number:I

    iget-wide v3, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationUs:J

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->initializeOutput(Lcom/google/android/exoplayer/extractor/ExtractorOutput;IJ)V

    .line 507
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iget v1, v1, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->number:I

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 511
    :cond_e5
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    goto/16 :goto_6

    .line 514
    :sswitch_ea
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->tracks:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_fa

    .line 515
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "No valid tracks were found"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 517
    :cond_fa
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    goto/16 :goto_6

    .line 449
    nop

    :sswitch_data_102
    .sparse-switch
        0xa0 -> :sswitch_50
        0xae -> :sswitch_b7
        0x4dbb -> :sswitch_21
        0x6240 -> :sswitch_72
        0x6d80 -> :sswitch_a3
        0x1549a966 -> :sswitch_7
        0x1654ae6b -> :sswitch_ea
        0x1c53bb6b -> :sswitch_40
    .end sparse-switch
.end method

.method floatElement(ID)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "value"    # D

    .prologue
    .line 639
    sparse-switch p1, :sswitch_data_e

    .line 647
    :goto_3
    return-void

    .line 641
    :sswitch_4
    double-to-long v0, p2

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->durationTimecode:J

    goto :goto_3

    .line 644
    :sswitch_8
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    double-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleRate:I

    goto :goto_3

    .line 639
    :sswitch_data_e
    .sparse-switch
        0xb5 -> :sswitch_8
        0x4489 -> :sswitch_4
    .end sparse-switch
.end method

.method getElementType(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 325
    sparse-switch p1, :sswitch_data_10

    .line 388
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 345
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 372
    :sswitch_7
    const/4 v0, 0x2

    goto :goto_4

    .line 376
    :sswitch_9
    const/4 v0, 0x3

    goto :goto_4

    .line 383
    :sswitch_b
    const/4 v0, 0x4

    goto :goto_4

    .line 386
    :sswitch_d
    const/4 v0, 0x5

    goto :goto_4

    .line 325
    nop

    :sswitch_data_10
    .sparse-switch
        0x83 -> :sswitch_7
        0x86 -> :sswitch_9
        0x9b -> :sswitch_7
        0x9f -> :sswitch_7
        0xa0 -> :sswitch_5
        0xa1 -> :sswitch_b
        0xa3 -> :sswitch_b
        0xae -> :sswitch_5
        0xb0 -> :sswitch_7
        0xb3 -> :sswitch_7
        0xb5 -> :sswitch_d
        0xb7 -> :sswitch_5
        0xba -> :sswitch_7
        0xbb -> :sswitch_5
        0xd7 -> :sswitch_7
        0xe0 -> :sswitch_5
        0xe1 -> :sswitch_5
        0xe7 -> :sswitch_7
        0xf1 -> :sswitch_7
        0xfb -> :sswitch_7
        0x4254 -> :sswitch_7
        0x4255 -> :sswitch_b
        0x4282 -> :sswitch_9
        0x4285 -> :sswitch_7
        0x42f7 -> :sswitch_7
        0x4489 -> :sswitch_d
        0x47e1 -> :sswitch_7
        0x47e2 -> :sswitch_b
        0x47e7 -> :sswitch_5
        0x47e8 -> :sswitch_7
        0x4dbb -> :sswitch_5
        0x5031 -> :sswitch_7
        0x5032 -> :sswitch_7
        0x5034 -> :sswitch_5
        0x5035 -> :sswitch_5
        0x53ab -> :sswitch_b
        0x53ac -> :sswitch_7
        0x54b0 -> :sswitch_7
        0x54b2 -> :sswitch_7
        0x54ba -> :sswitch_7
        0x56aa -> :sswitch_7
        0x56bb -> :sswitch_7
        0x6240 -> :sswitch_5
        0x6264 -> :sswitch_7
        0x63a2 -> :sswitch_b
        0x6d80 -> :sswitch_5
        0x22b59c -> :sswitch_9
        0x23e383 -> :sswitch_7
        0x2ad7b1 -> :sswitch_7
        0x114d9b74 -> :sswitch_5
        0x1549a966 -> :sswitch_5
        0x1654ae6b -> :sswitch_5
        0x18538067 -> :sswitch_5
        0x1a45dfa3 -> :sswitch_5
        0x1c53bb6b -> :sswitch_5
        0x1f43b675 -> :sswitch_5
    .end sparse-switch
.end method

.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 2
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 293
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 294
    return-void
.end method

.method integerElement(IJ)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const-wide/16 v0, 0x1

    .line 525
    sparse-switch p1, :sswitch_data_188

    .line 634
    :cond_6
    :goto_6
    return-void

    .line 528
    :sswitch_7
    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 529
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EBMLReadVersion "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 534
    :sswitch_2a
    cmp-long v0, p2, v0

    if-ltz v0, :cond_34

    const-wide/16 v0, 0x2

    cmp-long v0, p2, v0

    if-lez v0, :cond_6

    .line 535
    :cond_34
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DocTypeReadVersion "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :sswitch_53
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryPosition:J

    goto :goto_6

    .line 544
    :sswitch_59
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->timecodeScale:J

    goto :goto_6

    .line 547
    :sswitch_5c
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->width:I

    goto :goto_6

    .line 550
    :sswitch_62
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->height:I

    goto :goto_6

    .line 553
    :sswitch_68
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->displayWidth:I

    goto :goto_6

    .line 556
    :sswitch_6e
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->displayHeight:I

    goto :goto_6

    .line 559
    :sswitch_74
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->displayUnit:I

    goto :goto_6

    .line 562
    :sswitch_7a
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->number:I

    goto :goto_6

    .line 565
    :sswitch_80
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->type:I

    goto :goto_6

    .line 568
    :sswitch_86
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->defaultSampleDurationNs:I

    goto/16 :goto_6

    .line 571
    :sswitch_8d
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iput-wide p2, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecDelayNs:J

    goto/16 :goto_6

    .line 574
    :sswitch_93
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iput-wide p2, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->seekPreRollNs:J

    goto/16 :goto_6

    .line 577
    :sswitch_99
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->channelCount:I

    goto/16 :goto_6

    .line 580
    :sswitch_a0
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    long-to-int v1, p2

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->audioBitDepth:I

    goto/16 :goto_6

    .line 583
    :sswitch_a7
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleSeenReferenceBlock:Z

    goto/16 :goto_6

    .line 587
    :sswitch_ab
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 588
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ContentEncodingOrder "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 593
    :sswitch_d0
    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 594
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ContentEncodingScope "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 599
    :sswitch_f3
    const-wide/16 v0, 0x3

    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 600
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ContentCompAlgo "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 605
    :sswitch_118
    const-wide/16 v0, 0x5

    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 606
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ContentEncAlgo "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 611
    :sswitch_13d
    cmp-long v0, p2, v0

    if-eqz v0, :cond_6

    .line 612
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AESSettingsCipherMode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 616
    :sswitch_160
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scaleTimecodeToUs(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/util/LongArray;->add(J)V

    goto/16 :goto_6

    .line 619
    :sswitch_16b
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seenClusterPositionForCurrentCuePoint:Z

    if-nez v0, :cond_6

    .line 623
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    invoke-virtual {v0, p2, p3}, Lcom/google/android/exoplayer/util/LongArray;->add(J)V

    .line 624
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seenClusterPositionForCurrentCuePoint:Z

    goto/16 :goto_6

    .line 628
    :sswitch_178
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scaleTimecodeToUs(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->clusterTimecodeUs:J

    goto/16 :goto_6

    .line 631
    :sswitch_180
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->scaleTimecodeToUs(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockDurationUs:J

    goto/16 :goto_6

    .line 525
    :sswitch_data_188
    .sparse-switch
        0x83 -> :sswitch_80
        0x9b -> :sswitch_180
        0x9f -> :sswitch_99
        0xb0 -> :sswitch_5c
        0xb3 -> :sswitch_160
        0xba -> :sswitch_62
        0xd7 -> :sswitch_7a
        0xe7 -> :sswitch_178
        0xf1 -> :sswitch_16b
        0xfb -> :sswitch_a7
        0x4254 -> :sswitch_f3
        0x4285 -> :sswitch_2a
        0x42f7 -> :sswitch_7
        0x47e1 -> :sswitch_118
        0x47e8 -> :sswitch_13d
        0x5031 -> :sswitch_ab
        0x5032 -> :sswitch_d0
        0x53ac -> :sswitch_53
        0x54b0 -> :sswitch_68
        0x54b2 -> :sswitch_74
        0x54ba -> :sswitch_6e
        0x56aa -> :sswitch_8d
        0x56bb -> :sswitch_93
        0x6264 -> :sswitch_a0
        0x23e383 -> :sswitch_86
        0x2ad7b1 -> :sswitch_59
    .end sparse-switch
.end method

.method isLevel1Element(I)Z
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 393
    const v0, 0x1549a966

    if-eq p1, v0, :cond_14

    const v0, 0x1f43b675

    if-eq p1, v0, :cond_14

    const v0, 0x1c53bb6b

    if-eq p1, v0, :cond_14

    const v0, 0x1654ae6b

    if-ne p1, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 7
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 313
    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleRead:Z

    .line 314
    const/4 v0, 0x1

    .line 315
    .local v0, "continueReading":Z
    :cond_4
    if-eqz v0, :cond_1e

    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleRead:Z

    if-nez v2, :cond_1e

    .line 316
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->reader:Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

    invoke-interface {v2, p1}, Lcom/google/android/exoplayer/extractor/webm/EbmlReader;->read(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    .line 317
    if-eqz v0, :cond_4

    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    invoke-direct {p0, p2, v2, v3}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->maybeSeekForCues(Lcom/google/android/exoplayer/extractor/PositionHolder;J)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 318
    const/4 v1, 0x1

    .line 321
    :cond_1d
    :goto_1d
    return v1

    :cond_1e
    if-nez v0, :cond_1d

    const/4 v1, -0x1

    goto :goto_1d
.end method

.method public release()V
    .registers 1

    .prologue
    .line 308
    return-void
.end method

.method public seek()V
    .registers 3

    .prologue
    .line 298
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->clusterTimecodeUs:J

    .line 299
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->blockState:I

    .line 300
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->reader:Lcom/google/android/exoplayer/extractor/webm/EbmlReader;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/webm/EbmlReader;->reset()V

    .line 301
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->varintReader:Lcom/google/android/exoplayer/extractor/webm/VarintReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/webm/VarintReader;->reset()V

    .line 302
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->resetSample()V

    .line 303
    return-void
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
    .line 288
    new-instance v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/webm/Sniffer;-><init>()V

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method

.method startMasterElement(IJJ)V
    .registers 11
    .param p1, "id"    # I
    .param p2, "contentPosition"    # J
    .param p4, "contentSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const-wide/16 v3, -0x1

    const/4 v2, 0x1

    .line 398
    sparse-switch p1, :sswitch_data_62

    .line 444
    :cond_7
    :goto_7
    :sswitch_7
    return-void

    .line 400
    :sswitch_8
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    cmp-long v0, v0, v3

    if-eqz v0, :cond_1c

    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    cmp-long v0, v0, p2

    if-eqz v0, :cond_1c

    .line 401
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Multiple Segment elements not supported"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 403
    :cond_1c
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentPosition:J

    .line 404
    iput-wide p4, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->segmentContentSize:J

    goto :goto_7

    .line 407
    :sswitch_21
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryId:I

    .line 408
    iput-wide v3, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekEntryPosition:J

    goto :goto_7

    .line 411
    :sswitch_27
    new-instance v0, Lcom/google/android/exoplayer/util/LongArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/LongArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueTimesUs:Lcom/google/android/exoplayer/util/LongArray;

    .line 412
    new-instance v0, Lcom/google/android/exoplayer/util/LongArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/LongArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cueClusterPositions:Lcom/google/android/exoplayer/util/LongArray;

    goto :goto_7

    .line 415
    :sswitch_36
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seenClusterPositionForCurrentCuePoint:Z

    goto :goto_7

    .line 418
    :sswitch_39
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentSeekMap:Z

    if-nez v0, :cond_7

    .line 420
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->cuesContentPosition:J

    cmp-long v0, v0, v3

    if-eqz v0, :cond_46

    .line 422
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->seekForCues:Z

    goto :goto_7

    .line 426
    :cond_46
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    sget-object v1, Lcom/google/android/exoplayer/extractor/SeekMap;->UNSEEKABLE:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 427
    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sentSeekMap:Z

    goto :goto_7

    .line 432
    :sswitch_50
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->sampleSeenReferenceBlock:Z

    goto :goto_7

    .line 438
    :sswitch_53
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iput-boolean v2, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->hasContentEncryption:Z

    goto :goto_7

    .line 441
    :sswitch_58
    new-instance v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;-><init>(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    goto :goto_7

    .line 398
    nop

    :sswitch_data_62
    .sparse-switch
        0xa0 -> :sswitch_50
        0xae -> :sswitch_58
        0xbb -> :sswitch_36
        0x4dbb -> :sswitch_21
        0x5035 -> :sswitch_53
        0x6240 -> :sswitch_7
        0x18538067 -> :sswitch_8
        0x1c53bb6b -> :sswitch_27
        0x1f43b675 -> :sswitch_39
    .end sparse-switch
.end method

.method stringElement(ILjava/lang/String;)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 652
    sparse-switch p1, :sswitch_data_3e

    .line 666
    :cond_3
    :goto_3
    return-void

    .line 655
    :sswitch_4
    const-string v0, "webm"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "matroska"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 656
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DocType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 660
    :sswitch_33
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    iput-object p2, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    goto :goto_3

    .line 663
    :sswitch_38
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;->currentTrack:Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;

    # setter for: Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->language:Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->access$202(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 652
    :sswitch_data_3e
    .sparse-switch
        0x86 -> :sswitch_33
        0x4282 -> :sswitch_4
        0x22b59c -> :sswitch_38
    .end sparse-switch
.end method
