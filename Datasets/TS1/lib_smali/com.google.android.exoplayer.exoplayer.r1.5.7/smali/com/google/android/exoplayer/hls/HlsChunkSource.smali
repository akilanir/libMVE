.class public Lcom/google/android/exoplayer/hls/HlsChunkSource;
.super Ljava/lang/Object;
.source "HlsChunkSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/hls/HlsTrackSelector$Output;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;,
        Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;,
        Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;,
        Lcom/google/android/exoplayer/hls/HlsChunkSource$EventListener;
    }
.end annotation


# static fields
.field private static final AAC_FILE_EXTENSION:Ljava/lang/String; = ".aac"

.field public static final ADAPTIVE_MODE_ABRUPT:I = 0x3

.field public static final ADAPTIVE_MODE_NONE:I = 0x0

.field public static final ADAPTIVE_MODE_SPLICE:I = 0x1

.field private static final BANDWIDTH_FRACTION:F = 0.8f

.field public static final DEFAULT_MAX_BUFFER_TO_SWITCH_DOWN_MS:J = 0x4e20L

.field public static final DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS:J = 0x1388L

.field public static final DEFAULT_PLAYLIST_BLACKLIST_MS:J = 0xea60L

.field private static final MP3_FILE_EXTENSION:Ljava/lang/String; = ".mp3"

.field private static final TAG:Ljava/lang/String; = "HlsChunkSource"

.field private static final VTT_FILE_EXTENSION:Ljava/lang/String; = ".vtt"

.field private static final WEBVTT_FILE_EXTENSION:Ljava/lang/String; = ".webvtt"


# instance fields
.field private final adaptiveMode:I

.field private final bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

.field private final baseUri:Ljava/lang/String;

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private durationUs:J

.field private encryptionIv:[B

.field private encryptionIvString:Ljava/lang/String;

.field private encryptionKey:[B

.field private encryptionKeyUri:Landroid/net/Uri;

.field private fatalError:Ljava/io/IOException;

.field private final isMaster:Z

.field private live:Z

.field private final masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

.field private final maxBufferDurationToSwitchDownUs:J

.field private final minBufferDurationToSwitchUpUs:J

.field private final playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

.field private prepareCalled:Z

.field private scratchSpace:[B

.field private selectedTrackIndex:I

.field private selectedVariantIndex:I

.field private final timestampAdjusterProvider:Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;

.field private final trackSelector:Lcom/google/android/exoplayer/hls/HlsTrackSelector;

.field private final tracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;",
            ">;"
        }
    .end annotation
.end field

.field private variantBlacklistTimes:[J

.field private variantLastPlaylistLoadTimesMs:[J

.field private variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

.field private variants:[Lcom/google/android/exoplayer/hls/Variant;


# direct methods
.method public constructor <init>(ZLcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/hls/HlsTrackSelector;Lcom/google/android/exoplayer/upstream/BandwidthMeter;Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;I)V
    .registers 22
    .param p1, "isMaster"    # Z
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "playlistUrl"    # Ljava/lang/String;
    .param p4, "playlist"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .param p5, "trackSelector"    # Lcom/google/android/exoplayer/hls/HlsTrackSelector;
    .param p6, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p7, "timestampAdjusterProvider"    # Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;
    .param p8, "adaptiveMode"    # I

    .prologue
    .line 181
    const-wide/16 v9, 0x1388

    const-wide/16 v11, 0x4e20

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v12}, Lcom/google/android/exoplayer/hls/HlsChunkSource;-><init>(ZLcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/hls/HlsTrackSelector;Lcom/google/android/exoplayer/upstream/BandwidthMeter;Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;IJJ)V

    .line 184
    return-void
.end method

.method public constructor <init>(ZLcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/hls/HlsTrackSelector;Lcom/google/android/exoplayer/upstream/BandwidthMeter;Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;IJJ)V
    .registers 25
    .param p1, "isMaster"    # Z
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "playlistUrl"    # Ljava/lang/String;
    .param p4, "playlist"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .param p5, "trackSelector"    # Lcom/google/android/exoplayer/hls/HlsTrackSelector;
    .param p6, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p7, "timestampAdjusterProvider"    # Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;
    .param p8, "adaptiveMode"    # I
    .param p9, "minBufferDurationToSwitchUpMs"    # J
    .param p11, "maxBufferDurationToSwitchDownMs"    # J

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-boolean p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isMaster:Z

    .line 211
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 212
    move-object/from16 v0, p5

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->trackSelector:Lcom/google/android/exoplayer/hls/HlsTrackSelector;

    .line 213
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .line 214
    move-object/from16 v0, p7

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;

    .line 215
    move/from16 v0, p8

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    .line 216
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p9

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->minBufferDurationToSwitchUpUs:J

    .line 217
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p11

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxBufferDurationToSwitchDownUs:J

    .line 218
    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->baseUri:Ljava/lang/String;

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->baseUri:Ljava/lang/String;

    .line 219
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    invoke-direct {v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    .line 220
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    .line 222
    move-object/from16 v0, p4

    iget v2, v0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->type:I

    if-nez v2, :cond_44

    .line 223
    check-cast p4, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    .end local p4    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    .line 232
    :goto_43
    return-void

    .line 225
    .restart local p4    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    :cond_44
    new-instance v1, Lcom/google/android/exoplayer/chunk/Format;

    const-string v2, "0"

    const-string v3, "application/x-mpegURL"

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/high16 v6, -0x40800000    # -1.0f

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 227
    .local v1, "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v4, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v2, Lcom/google/android/exoplayer/hls/Variant;

    invoke-direct {v2, p3, v1}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p3

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    goto :goto_43
.end method

.method private allVariantsBlacklisted()Z
    .registers 6

    .prologue
    .line 776
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 777
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aget-wide v1, v1, v0

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_12

    .line 778
    const/4 v1, 0x0

    .line 781
    :goto_11
    return v1

    .line 776
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 781
    :cond_15
    const/4 v1, 0x1

    goto :goto_11
.end method

.method private clearEncryptionData()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 762
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 763
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKey:[B

    .line 764
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    .line 765
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIv:[B

    .line 766
    return-void
.end method

.method private clearStaleBlacklistedVariants()V
    .registers 10

    .prologue
    const-wide/16 v7, 0x0

    .line 785
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 786
    .local v0, "currentTime":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    array-length v3, v3

    if-ge v2, v3, :cond_28

    .line 787
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aget-wide v3, v3, v2

    cmp-long v3, v3, v7

    if-eqz v3, :cond_25

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aget-wide v3, v3, v2

    sub-long v3, v0, v3

    const-wide/32 v5, 0xea60

    cmp-long v3, v3, v5

    if-lez v3, :cond_25

    .line 789
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aput-wide v7, v3, v2

    .line 786
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 792
    :cond_28
    return-void
.end method

.method private getLiveStartChunkMediaSequence(I)I
    .registers 6
    .param p1, "variantIndex"    # I

    .prologue
    .line 723
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v1, v2, p1

    .line 724
    .local v1, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    iget-object v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_19

    iget-object v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x3

    .line 725
    .local v0, "chunkIndex":I
    :goto_15
    iget v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    add-int/2addr v2, v0

    return v2

    .line 724
    .end local v0    # "chunkIndex":I
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private getNextVariantIndex(Lcom/google/android/exoplayer/hls/TsChunk;J)I
    .registers 15
    .param p1, "previousTsChunk"    # Lcom/google/android/exoplayer/hls/TsChunk;
    .param p2, "playbackPositionUs"    # J

    .prologue
    const-wide/16 v9, 0x0

    .line 659
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->clearStaleBlacklistedVariants()V

    .line 660
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    invoke-interface {v7}, Lcom/google/android/exoplayer/upstream/BandwidthMeter;->getBitrateEstimate()J

    move-result-wide v0

    .line 661
    .local v0, "bitrateEstimate":J
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    aget-wide v7, v7, v8

    cmp-long v7, v7, v9

    if-eqz v7, :cond_1a

    .line 663
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getVariantIndexForBandwidth(J)I

    move-result v6

    .line 690
    :cond_19
    :goto_19
    return v6

    .line 665
    :cond_1a
    if-nez p1, :cond_1f

    .line 667
    iget v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    goto :goto_19

    .line 669
    :cond_1f
    const-wide/16 v7, -0x1

    cmp-long v7, v0, v7

    if-nez v7, :cond_28

    .line 671
    iget v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    goto :goto_19

    .line 673
    :cond_28
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getVariantIndexForBandwidth(J)I

    move-result v6

    .line 674
    .local v6, "idealIndex":I
    iget v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    if-ne v6, v7, :cond_33

    .line 676
    iget v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    goto :goto_19

    .line 680
    :cond_33
    iget v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_5d

    iget-wide v2, p1, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    .line 682
    .local v2, "bufferedPositionUs":J
    :goto_3a
    sub-long v4, v2, p2

    .line 683
    .local v4, "bufferedUs":J
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    iget v8, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    aget-wide v7, v7, v8

    cmp-long v7, v7, v9

    if-nez v7, :cond_19

    iget v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    if-le v6, v7, :cond_50

    iget-wide v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxBufferDurationToSwitchDownUs:J

    cmp-long v7, v4, v7

    if-ltz v7, :cond_19

    :cond_50
    iget v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    if-ge v6, v7, :cond_5a

    iget-wide v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->minBufferDurationToSwitchUpUs:J

    cmp-long v7, v4, v7

    if-gtz v7, :cond_19

    .line 690
    :cond_5a
    iget v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    goto :goto_19

    .line 680
    .end local v2    # "bufferedPositionUs":J
    .end local v4    # "bufferedUs":J
    :cond_5d
    iget-wide v2, p1, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    goto :goto_3a
.end method

.method private getVariantIndex(Lcom/google/android/exoplayer/chunk/Format;)I
    .registers 6
    .param p1, "format"    # Lcom/google/android/exoplayer/chunk/Format;

    .prologue
    .line 795
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v1, v1

    if-ge v0, v1, :cond_16

    .line 796
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 797
    return v0

    .line 795
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 801
    :cond_16
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getVariantIndexForBandwidth(J)I
    .registers 10
    .param p1, "bitrateEstimate"    # J

    .prologue
    .line 694
    const-wide/16 v3, -0x1

    cmp-long v3, p1, v3

    if-nez v3, :cond_8

    .line 696
    const-wide/16 p1, 0x0

    .line 698
    :cond_8
    long-to-float v3, p1

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v3, v4

    float-to-int v0, v3

    .line 699
    .local v0, "effectiveBitrate":I
    const/4 v2, -0x1

    .line 700
    .local v2, "lowestQualityEnabledVariantIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v3, v3

    if-ge v1, v3, :cond_2e

    .line 701
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aget-wide v3, v3, v1

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_2b

    .line 702
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v3, v3, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-gt v3, v0, :cond_2a

    .line 710
    .end local v1    # "i":I
    :goto_29
    return v1

    .line 705
    .restart local v1    # "i":I
    :cond_2a
    move v2, v1

    .line 700
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 709
    :cond_2e
    const/4 v3, -0x1

    if-eq v2, v3, :cond_37

    const/4 v3, 0x1

    :goto_32
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    move v1, v2

    .line 710
    goto :goto_29

    .line 709
    :cond_37
    const/4 v3, 0x0

    goto :goto_32
.end method

.method private newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;I)Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
    .registers 12
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;
    .param p3, "variantIndex"    # I

    .prologue
    .line 737
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;I)V

    .line 738
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    move-object v3, v0

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[BLjava/lang/String;I)V

    return-object v1
.end method

.method private newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .registers 11
    .param p1, "variantIndex"    # I

    .prologue
    .line 729
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->baseUri:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/google/android/exoplayer/hls/Variant;->url:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 730
    .local v1, "mediaPlaylistUri":Landroid/net/Uri;
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;I)V

    .line 732
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    iget-object v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    move-object v4, v0

    move v7, p1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[BLcom/google/android/exoplayer/hls/HlsPlaylistParser;ILjava/lang/String;)V

    return-object v2
.end method

.method private setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V
    .registers 11
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;
    .param p3, "secretKey"    # [B

    .prologue
    const/16 v6, 0x10

    .line 743
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "0x"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 744
    const/4 v4, 0x2

    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 749
    .local v3, "trimmedIv":Ljava/lang/String;
    :goto_17
    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, v3, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 750
    .local v0, "ivData":[B
    new-array v1, v6, [B

    .line 751
    .local v1, "ivDataWithPadding":[B
    array-length v4, v0

    if-le v4, v6, :cond_3c

    array-length v4, v0

    add-int/lit8 v2, v4, -0x10

    .line 752
    .local v2, "offset":I
    :goto_28
    array-length v4, v1

    array-length v5, v0

    sub-int/2addr v4, v5

    add-int/2addr v4, v2

    array-length v5, v0

    sub-int/2addr v5, v2

    invoke-static {v0, v2, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 755
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 756
    iput-object p3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKey:[B

    .line 757
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    .line 758
    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIv:[B

    .line 759
    return-void

    .line 746
    .end local v0    # "ivData":[B
    .end local v1    # "ivDataWithPadding":[B
    .end local v2    # "offset":I
    .end local v3    # "trimmedIv":Ljava/lang/String;
    :cond_3a
    move-object v3, p2

    .restart local v3    # "trimmedIv":Ljava/lang/String;
    goto :goto_17

    .line 751
    .restart local v0    # "ivData":[B
    .restart local v1    # "ivDataWithPadding":[B
    :cond_3c
    const/4 v2, 0x0

    goto :goto_28
.end method

.method private setMediaPlaylist(ILcom/google/android/exoplayer/hls/HlsMediaPlaylist;)V
    .registers 6
    .param p1, "variantIndex"    # I
    .param p2, "mediaPlaylist"    # Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .prologue
    .line 769
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantLastPlaylistLoadTimesMs:[J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    aput-wide v1, v0, p1

    .line 770
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aput-object p2, v0, p1

    .line 771
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    iget-boolean v1, p2, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->live:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    .line 772
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v0, :cond_1c

    const-wide/16 v0, -0x1

    :goto_19
    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->durationUs:J

    .line 773
    return-void

    .line 772
    :cond_1c
    iget-wide v0, p2, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->durationUs:J

    goto :goto_19
.end method

.method private shouldRerequestLiveMediaPlaylist(I)Z
    .registers 9
    .param p1, "nextVariantIndex"    # I

    .prologue
    .line 715
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v0, v3, p1

    .line 716
    .local v0, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantLastPlaylistLoadTimesMs:[J

    aget-wide v5, v5, p1

    sub-long v1, v3, v5

    .line 718
    .local v1, "timeSinceLastMediaPlaylistLoadMs":J
    iget v3, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->targetDurationSecs:I

    mul-int/lit16 v3, v3, 0x3e8

    div-int/lit8 v3, v3, 0x2

    int-to-long v3, v3

    cmp-long v3, v1, v3

    if-ltz v3, :cond_1b

    const/4 v3, 0x1

    :goto_1a
    return v3

    :cond_1b
    const/4 v3, 0x0

    goto :goto_1a
.end method


# virtual methods
.method public adaptiveTrack(Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;[Lcom/google/android/exoplayer/hls/Variant;)V
    .registers 12
    .param p1, "playlist"    # Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .param p2, "variants"    # [Lcom/google/android/exoplayer/hls/Variant;

    .prologue
    .line 620
    new-instance v7, Lcom/google/android/exoplayer/hls/HlsChunkSource$1;

    invoke-direct {v7, p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource$1;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;)V

    invoke-static {p2, v7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 629
    const/4 v0, 0x0

    .line 630
    .local v0, "defaultVariantIndex":I
    const/4 v3, -0x1

    .line 631
    .local v3, "maxWidth":I
    const/4 v2, -0x1

    .line 633
    .local v2, "maxHeight":I
    const v4, 0x7fffffff

    .line 634
    .local v4, "minOriginalVariantIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    array-length v7, p2

    if-ge v1, v7, :cond_31

    .line 635
    iget-object v7, p1, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->variants:Ljava/util/List;

    aget-object v8, p2, v1

    invoke-interface {v7, v8}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    .line 636
    .local v5, "originalVariantIndex":I
    if-ge v5, v4, :cond_1e

    .line 637
    move v4, v5

    .line 638
    move v0, v1

    .line 640
    :cond_1e
    aget-object v7, p2, v1

    iget-object v6, v7, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 641
    .local v6, "variantFormat":Lcom/google/android/exoplayer/chunk/Format;
    iget v7, v6, Lcom/google/android/exoplayer/chunk/Format;->width:I

    invoke-static {v7, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 642
    iget v7, v6, Lcom/google/android/exoplayer/chunk/Format;->height:I

    invoke-static {v7, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 634
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 646
    .end local v5    # "originalVariantIndex":I
    .end local v6    # "variantFormat":Lcom/google/android/exoplayer/chunk/Format;
    :cond_31
    if-lez v3, :cond_40

    .line 647
    :goto_33
    if-lez v2, :cond_43

    .line 648
    :goto_35
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    new-instance v8, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;

    invoke-direct {v8, p2, v0, v3, v2}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;-><init>([Lcom/google/android/exoplayer/hls/Variant;III)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    return-void

    .line 646
    :cond_40
    const/16 v3, 0x780

    goto :goto_33

    .line 647
    :cond_43
    const/16 v2, 0x438

    goto :goto_35
.end method

.method public fixedTrack(Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;Lcom/google/android/exoplayer/hls/Variant;)V
    .registers 5
    .param p1, "playlist"    # Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .param p2, "variant"    # Lcom/google/android/exoplayer/hls/Variant;

    .prologue
    .line 653
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    new-instance v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;

    invoke-direct {v1, p2}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;-><init>(Lcom/google/android/exoplayer/hls/Variant;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 654
    return-void
.end method

.method public getChunkOperation(Lcom/google/android/exoplayer/hls/TsChunk;JLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V
    .registers 40
    .param p1, "previousTsChunk"    # Lcom/google/android/exoplayer/hls/TsChunk;
    .param p2, "playbackPositionUs"    # J
    .param p4, "out"    # Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    .prologue
    .line 392
    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    if-nez v11, :cond_22

    .line 393
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    move/from16 v30, v0

    .line 394
    .local v30, "nextVariantIndex":I
    const/4 v10, 0x0

    .line 402
    .local v10, "switchingVariantSpliced":Z
    :goto_d
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v29, v11, v30

    .line 403
    .local v29, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    if-nez v29, :cond_45

    .line 405
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    move-result-object v11

    move-object/from16 v0, p4

    iput-object v11, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 544
    :cond_21
    :goto_21
    return-void

    .line 396
    .end local v10    # "switchingVariantSpliced":Z
    .end local v29    # "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    .end local v30    # "nextVariantIndex":I
    :cond_22
    invoke-direct/range {p0 .. p3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getNextVariantIndex(Lcom/google/android/exoplayer/hls/TsChunk;J)I

    move-result v30

    .line 397
    .restart local v30    # "nextVariantIndex":I
    if-eqz p1, :cond_43

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v11, v11, v30

    iget-object v11, v11, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/TsChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-virtual {v11, v12}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_43

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_43

    const/4 v10, 0x1

    .restart local v10    # "switchingVariantSpliced":Z
    :goto_42
    goto :goto_d

    .end local v10    # "switchingVariantSpliced":Z
    :cond_43
    const/4 v10, 0x0

    goto :goto_42

    .line 409
    .restart local v10    # "switchingVariantSpliced":Z
    .restart local v29    # "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :cond_45
    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    .line 410
    const/16 v20, 0x0

    .line 411
    .local v20, "chunkMediaSequence":I
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v11, :cond_9c

    .line 412
    if-nez p1, :cond_7b

    .line 413
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getLiveStartChunkMediaSequence(I)I

    move-result v20

    .line 433
    :cond_5d
    :goto_5d
    move-object/from16 v0, v29

    iget v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    sub-int v25, v20, v11

    .line 434
    .local v25, "chunkIndex":I
    move-object/from16 v0, v29

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    move/from16 v0, v25

    if-lt v0, v11, :cond_db

    .line 435
    move-object/from16 v0, v29

    iget-boolean v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->live:Z

    if-nez v11, :cond_c3

    .line 436
    const/4 v11, 0x1

    move-object/from16 v0, p4

    iput-boolean v11, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->endOfStream:Z

    goto :goto_21

    .line 415
    .end local v25    # "chunkIndex":I
    :cond_7b
    if-eqz v10, :cond_95

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    move/from16 v20, v0

    .line 417
    :goto_83
    move-object/from16 v0, v29

    iget v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    move/from16 v0, v20

    if-ge v0, v11, :cond_5d

    .line 418
    new-instance v11, Lcom/google/android/exoplayer/BehindLiveWindowException;

    invoke-direct {v11}, Lcom/google/android/exoplayer/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    goto :goto_21

    .line 415
    :cond_95
    move-object/from16 v0, p1

    iget v11, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    add-int/lit8 v20, v11, 0x1

    goto :goto_83

    .line 424
    :cond_9c
    if-nez p1, :cond_b3

    .line 425
    move-object/from16 v0, v29

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-static {v11, v12, v13, v14}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor(Ljava/util/List;Ljava/lang/Object;ZZ)I

    move-result v11

    move-object/from16 v0, v29

    iget v12, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    add-int v20, v11, v12

    goto :goto_5d

    .line 428
    :cond_b3
    if-eqz v10, :cond_bc

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    move/from16 v20, v0

    :goto_bb
    goto :goto_5d

    :cond_bc
    move-object/from16 v0, p1

    iget v11, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    add-int/lit8 v20, v11, 0x1

    goto :goto_bb

    .line 437
    .restart local v25    # "chunkIndex":I
    :cond_c3
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->shouldRerequestLiveMediaPlaylist(I)Z

    move-result v11

    if-eqz v11, :cond_21

    .line 438
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    move-result-object v11

    move-object/from16 v0, p4

    iput-object v11, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_21

    .line 443
    :cond_db
    move-object/from16 v0, v29

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    move/from16 v0, v25

    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;

    .line 444
    .local v31, "segment":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;
    move-object/from16 v0, v29

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->baseUri:Ljava/lang/String;

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->url:Ljava/lang/String;

    invoke-static {v11, v12}, Lcom/google/android/exoplayer/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 447
    .local v3, "chunkUri":Landroid/net/Uri;
    move-object/from16 v0, v31

    iget-boolean v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->isEncrypted:Z

    if-eqz v11, :cond_1b8

    .line 448
    move-object/from16 v0, v29

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->baseUri:Ljava/lang/String;

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionKeyUri:Ljava/lang/String;

    invoke-static {v11, v12}, Lcom/google/android/exoplayer/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v27

    .line 449
    .local v27, "keyUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_127

    .line 451
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v11, v12}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;I)Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    move-result-object v11

    move-object/from16 v0, p4

    iput-object v11, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_21

    .line 454
    :cond_127
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    invoke-static {v11, v12}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_144

    .line 455
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKey:[B

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v11, v12}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V

    .line 462
    .end local v27    # "keyUri":Landroid/net/Uri;
    :cond_144
    :goto_144
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, v31

    iget-wide v4, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->byterangeOffset:J

    move-object/from16 v0, v31

    iget-wide v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->byterangeLength:J

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 467
    .local v2, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v11, :cond_1c8

    .line 468
    if-nez p1, :cond_1bc

    .line 469
    const-wide/16 v7, 0x0

    .line 478
    .local v7, "startTimeUs":J
    :goto_15c
    move-object/from16 v0, v31

    iget-wide v11, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->durationSecs:D

    const-wide v13, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v11, v13

    double-to-long v11, v11

    add-long v18, v7, v11

    .line 479
    .local v18, "endTimeUs":J
    const/4 v5, 0x0

    .line 480
    .local v5, "trigger":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    aget-object v11, v11, v12

    iget-object v6, v11, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 484
    .local v6, "format":Lcom/google/android/exoplayer/chunk/Format;
    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v28

    .line 485
    .local v28, "lastPathSegment":Ljava/lang/String;
    const-string v11, ".aac"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1cd

    .line 489
    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/AdtsExtractor;

    invoke-direct {v9, v7, v8}, Lcom/google/android/exoplayer/extractor/ts/AdtsExtractor;-><init>(J)V

    .line 490
    .local v9, "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    new-instance v4, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-direct/range {v4 .. v12}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;-><init>(ILcom/google/android/exoplayer/chunk/Format;JLcom/google/android/exoplayer/extractor/Extractor;ZII)V

    .line 541
    .end local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    .local v4, "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    :goto_190
    new-instance v11, Lcom/google/android/exoplayer/hls/TsChunk;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, v31

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->discontinuitySequenceNumber:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKey:[B

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionIv:[B

    move-object/from16 v24, v0

    move-object v13, v2

    move v14, v5

    move-object v15, v6

    move-wide/from16 v16, v7

    move-object/from16 v22, v4

    invoke-direct/range {v11 .. v24}, Lcom/google/android/exoplayer/hls/TsChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIILcom/google/android/exoplayer/hls/HlsExtractorWrapper;[B[B)V

    move-object/from16 v0, p4

    iput-object v11, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_21

    .line 458
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .end local v5    # "trigger":I
    .end local v6    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v7    # "startTimeUs":J
    .end local v18    # "endTimeUs":J
    .end local v28    # "lastPathSegment":Ljava/lang/String;
    :cond_1b8
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->clearEncryptionData()V

    goto :goto_144

    .line 470
    .restart local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_1bc
    if-eqz v10, :cond_1c3

    .line 471
    move-object/from16 v0, p1

    iget-wide v7, v0, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    .restart local v7    # "startTimeUs":J
    goto :goto_15c

    .line 473
    .end local v7    # "startTimeUs":J
    :cond_1c3
    move-object/from16 v0, p1

    iget-wide v7, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    .restart local v7    # "startTimeUs":J
    goto :goto_15c

    .line 476
    .end local v7    # "startTimeUs":J
    :cond_1c8
    move-object/from16 v0, v31

    iget-wide v7, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->startTimeUs:J

    .restart local v7    # "startTimeUs":J
    goto :goto_15c

    .line 492
    .restart local v5    # "trigger":I
    .restart local v6    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .restart local v18    # "endTimeUs":J
    .restart local v28    # "lastPathSegment":Ljava/lang/String;
    :cond_1cd
    const-string v11, ".mp3"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1e4

    .line 493
    new-instance v9, Lcom/google/android/exoplayer/extractor/mp3/Mp3Extractor;

    invoke-direct {v9, v7, v8}, Lcom/google/android/exoplayer/extractor/mp3/Mp3Extractor;-><init>(J)V

    .line 494
    .restart local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    new-instance v4, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-direct/range {v4 .. v12}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;-><init>(ILcom/google/android/exoplayer/chunk/Format;JLcom/google/android/exoplayer/extractor/Extractor;ZII)V

    .line 496
    .restart local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    goto :goto_190

    .end local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .end local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    :cond_1e4
    const-string v11, ".webvtt"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_1f8

    const-string v11, ".vtt"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_21a

    .line 498
    :cond_1f8
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isMaster:Z

    move-object/from16 v0, v31

    iget v13, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->discontinuitySequenceNumber:I

    invoke-virtual {v11, v12, v13, v7, v8}, Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;->getAdjuster(ZIJ)Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

    move-result-object v33

    .line 500
    .local v33, "timestampAdjuster":Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;
    if-eqz v33, :cond_21

    .line 506
    new-instance v9, Lcom/google/android/exoplayer/hls/WebvttExtractor;

    move-object/from16 v0, v33

    invoke-direct {v9, v0}, Lcom/google/android/exoplayer/hls/WebvttExtractor;-><init>(Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;)V

    .line 507
    .restart local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    new-instance v4, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-direct/range {v4 .. v12}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;-><init>(ILcom/google/android/exoplayer/chunk/Format;JLcom/google/android/exoplayer/extractor/Extractor;ZII)V

    .line 509
    .restart local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    goto/16 :goto_190

    .end local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .end local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    .end local v33    # "timestampAdjuster":Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;
    :cond_21a
    if-eqz p1, :cond_230

    move-object/from16 v0, p1

    iget v11, v0, Lcom/google/android/exoplayer/hls/TsChunk;->discontinuitySequenceNumber:I

    move-object/from16 v0, v31

    iget v12, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->discontinuitySequenceNumber:I

    if-ne v11, v12, :cond_230

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/TsChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-virtual {v6, v11}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_288

    .line 513
    :cond_230
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isMaster:Z

    move-object/from16 v0, v31

    iget v13, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->discontinuitySequenceNumber:I

    invoke-virtual {v11, v12, v13, v7, v8}, Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;->getAdjuster(ZIJ)Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;

    move-result-object v33

    .line 515
    .restart local v33    # "timestampAdjuster":Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;
    if-eqz v33, :cond_21

    .line 519
    const/16 v34, 0x0

    .line 520
    .local v34, "workaroundFlags":I
    iget-object v0, v6, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 521
    .local v26, "codecs":Ljava/lang/String;
    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_262

    .line 525
    invoke-static/range {v26 .. v26}, Lcom/google/android/exoplayer/util/MimeTypes;->getAudioMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "audio/mp4a-latm"

    if-eq v11, v12, :cond_258

    .line 526
    or-int/lit8 v34, v34, 0x2

    .line 528
    :cond_258
    invoke-static/range {v26 .. v26}, Lcom/google/android/exoplayer/util/MimeTypes;->getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "video/avc"

    if-eq v11, v12, :cond_262

    .line 529
    or-int/lit8 v34, v34, 0x4

    .line 532
    :cond_262
    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    move-object/from16 v0, v33

    move/from16 v1, v34

    invoke-direct {v9, v0, v1}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;-><init>(Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;I)V

    .line 533
    .restart local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedTrackIndex:I

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;

    .line 534
    .local v32, "selectedTrack":Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;
    new-instance v4, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->adaptiveMaxWidth:I
    invoke-static/range {v32 .. v32}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->access$200(Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;)I

    move-result v11

    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->adaptiveMaxHeight:I
    invoke-static/range {v32 .. v32}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->access$300(Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;)I

    move-result v12

    invoke-direct/range {v4 .. v12}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;-><init>(ILcom/google/android/exoplayer/chunk/Format;JLcom/google/android/exoplayer/extractor/Extractor;ZII)V

    .line 536
    .restart local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    goto/16 :goto_190

    .line 538
    .end local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .end local v9    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    .end local v26    # "codecs":Ljava/lang/String;
    .end local v32    # "selectedTrack":Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;
    .end local v33    # "timestampAdjuster":Lcom/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster;
    .end local v34    # "workaroundFlags":I
    :cond_288
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/TsChunk;->extractorWrapper:Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .restart local v4    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    goto/16 :goto_190
.end method

.method public getDurationUs()J
    .registers 3

    .prologue
    .line 283
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->durationUs:J

    return-wide v0
.end method

.method public getFixedTrackVariant(I)Lcom/google/android/exoplayer/hls/Variant;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 307
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;

    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->variants:[Lcom/google/android/exoplayer/hls/Variant;
    invoke-static {v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/hls/Variant;

    move-result-object v0

    .line 308
    .local v0, "variants":[Lcom/google/android/exoplayer/hls/Variant;
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_14

    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_13
    return-object v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public getMuxedAudioLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 317
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->muxedAudioLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getMuxedCaptionLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->muxedCaptionLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectedTrackIndex()I
    .registers 2

    .prologue
    .line 337
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedTrackIndex:I

    return v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 294
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public isLive()Z
    .registers 2

    .prologue
    .line 272
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    return v0
.end method

.method public maybeThrowError()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_7

    .line 242
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    throw v0

    .line 244
    :cond_7
    return-void
.end method

.method public onChunkLoadCompleted(Lcom/google/android/exoplayer/chunk/Chunk;)V
    .registers 7
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;

    .prologue
    .line 553
    instance-of v2, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    if-eqz v2, :cond_17

    move-object v1, p1

    .line 554
    check-cast v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    .line 555
    .local v1, "mediaPlaylistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->getDataHolder()[B

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    .line 556
    iget v2, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->getResult()Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->setMediaPlaylist(ILcom/google/android/exoplayer/hls/HlsMediaPlaylist;)V

    .line 563
    .end local v1    # "mediaPlaylistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    :cond_16
    :goto_16
    return-void

    .line 557
    :cond_17
    instance-of v2, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    if-eqz v2, :cond_16

    move-object v0, p1

    .line 558
    check-cast v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    .line 559
    .local v0, "encryptionKeyChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->getDataHolder()[B

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->scratchSpace:[B

    .line 560
    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v2, v2, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->iv:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->getResult()[B

    move-result-object v4

    invoke-direct {p0, v2, v3, v4}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V

    goto :goto_16
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/io/IOException;)Z
    .registers 14
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 574
    invoke-virtual {p1}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-nez v7, :cond_df

    instance-of v7, p1, Lcom/google/android/exoplayer/hls/TsChunk;

    if-nez v7, :cond_16

    instance-of v7, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    if-nez v7, :cond_16

    instance-of v7, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    if-eqz v7, :cond_df

    :cond_16
    instance-of v7, p2, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;

    if-eqz v7, :cond_df

    move-object v4, p2

    .line 578
    check-cast v4, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 579
    .local v4, "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    iget v3, v4, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 580
    .local v3, "responseCode":I
    const/16 v7, 0x194

    if-eq v3, v7, :cond_27

    const/16 v7, 0x19a

    if-ne v3, v7, :cond_df

    .line 582
    :cond_27
    instance-of v7, p1, Lcom/google/android/exoplayer/hls/TsChunk;

    if-eqz v7, :cond_71

    move-object v5, p1

    .line 583
    check-cast v5, Lcom/google/android/exoplayer/hls/TsChunk;

    .line 584
    .local v5, "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    iget-object v7, v5, Lcom/google/android/exoplayer/hls/TsChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-direct {p0, v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getVariantIndex(Lcom/google/android/exoplayer/chunk/Format;)I

    move-result v6

    .line 592
    .end local v5    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    .local v6, "variantIndex":I
    :goto_34
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    aget-wide v7, v7, v6

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-eqz v7, :cond_81

    const/4 v0, 0x1

    .line 593
    .local v0, "alreadyBlacklisted":Z
    :goto_3f
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    aput-wide v8, v7, v6

    .line 594
    if-eqz v0, :cond_83

    .line 596
    const-string v7, "HlsChunkSource"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Already blacklisted variant ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v9, v9, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    const/4 v7, 0x0

    .line 613
    .end local v0    # "alreadyBlacklisted":Z
    .end local v3    # "responseCode":I
    .end local v4    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    .end local v6    # "variantIndex":I
    :goto_70
    return v7

    .line 585
    .restart local v3    # "responseCode":I
    .restart local v4    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    :cond_71
    instance-of v7, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    if-eqz v7, :cond_7b

    move-object v2, p1

    .line 586
    check-cast v2, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    .line 587
    .local v2, "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    iget v6, v2, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    .line 588
    .restart local v6    # "variantIndex":I
    goto :goto_34

    .end local v2    # "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .end local v6    # "variantIndex":I
    :cond_7b
    move-object v1, p1

    .line 589
    check-cast v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    .line 590
    .local v1, "encryptionChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
    iget v6, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;->variantIndex:I

    .restart local v6    # "variantIndex":I
    goto :goto_34

    .line 592
    .end local v1    # "encryptionChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
    :cond_81
    const/4 v0, 0x0

    goto :goto_3f

    .line 599
    .restart local v0    # "alreadyBlacklisted":Z
    :cond_83
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->allVariantsBlacklisted()Z

    move-result v7

    if-nez v7, :cond_b1

    .line 601
    const-string v7, "HlsChunkSource"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Blacklisted variant ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v9, v9, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    const/4 v7, 0x1

    goto :goto_70

    .line 606
    :cond_b1
    const-string v7, "HlsChunkSource"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Final variant not blacklisted ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v9, v9, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    const-wide/16 v8, 0x0

    aput-wide v8, v7, v6

    .line 609
    const/4 v7, 0x0

    goto :goto_70

    .line 613
    .end local v0    # "alreadyBlacklisted":Z
    .end local v3    # "responseCode":I
    .end local v4    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    .end local v6    # "variantIndex":I
    :cond_df
    const/4 v7, 0x0

    goto :goto_70
.end method

.method public prepare()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 252
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->prepareCalled:Z

    if-nez v3, :cond_13

    .line 253
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->prepareCalled:Z

    .line 255
    :try_start_8
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->trackSelector:Lcom/google/android/exoplayer/hls/HlsTrackSelector;

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->masterPlaylist:Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    invoke-interface {v3, v4, p0}, Lcom/google/android/exoplayer/hls/HlsTrackSelector;->selectTracks(Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;Lcom/google/android/exoplayer/hls/HlsTrackSelector$Output;)V

    .line 256
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectTrack(I)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_13} :catch_18

    .line 261
    :cond_13
    :goto_13
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    if-nez v3, :cond_1c

    :goto_17
    return v1

    .line 257
    :catch_18
    move-exception v0

    .line 258
    .local v0, "e":Ljava/io/IOException;
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    goto :goto_13

    .end local v0    # "e":Ljava/io/IOException;
    :cond_1c
    move v1, v2

    .line 261
    goto :goto_17
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 374
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    .line 375
    return-void
.end method

.method public seek()V
    .registers 2

    .prologue
    .line 363
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isMaster:Z

    if-eqz v0, :cond_9

    .line 364
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/PtsTimestampAdjusterProvider;->reset()V

    .line 366
    :cond_9
    return-void
.end method

.method public selectTrack(I)V
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 348
    iput p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedTrackIndex:I

    .line 349
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->tracks:Ljava/util/ArrayList;

    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedTrackIndex:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;

    .line 350
    .local v0, "selectedTrack":Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;
    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->defaultVariantIndex:I
    invoke-static {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->access$100(Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;)I

    move-result v1

    iput v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectedVariantIndex:I

    .line 351
    # getter for: Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->variants:[Lcom/google/android/exoplayer/hls/Variant;
    invoke-static {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/hls/HlsChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/hls/Variant;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    .line 352
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 353
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v1, v1

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantLastPlaylistLoadTimesMs:[J

    .line 354
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v1, v1

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantBlacklistTimes:[J

    .line 355
    return-void
.end method
