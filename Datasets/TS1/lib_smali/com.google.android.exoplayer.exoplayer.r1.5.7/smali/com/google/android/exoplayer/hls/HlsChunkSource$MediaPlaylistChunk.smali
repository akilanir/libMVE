.class final Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
.super Lcom/google/android/exoplayer/chunk/DataChunk;
.source "HlsChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/HlsChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MediaPlaylistChunk"
.end annotation


# instance fields
.field private final playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

.field private final playlistUrl:Ljava/lang/String;

.field private result:Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

.field public final variantIndex:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[BLcom/google/android/exoplayer/hls/HlsPlaylistParser;ILjava/lang/String;)V
    .registers 15
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "scratchSpace"    # [B
    .param p4, "playlistParser"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
    .param p5, "variantIndex"    # I
    .param p6, "playlistUrl"    # Ljava/lang/String;

    .prologue
    .line 842
    const/4 v3, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/chunk/DataChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;IILcom/google/android/exoplayer/chunk/Format;I[B)V

    .line 844
    iput p5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    .line 845
    iput-object p4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    .line 846
    iput-object p6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistUrl:Ljava/lang/String;

    .line 847
    return-void
.end method


# virtual methods
.method protected consume([BI)V
    .registers 7
    .param p1, "data"    # [B
    .param p2, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 851
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->playlistUrl:Ljava/lang/String;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3, p2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parse(Ljava/lang/String;Ljava/io/InputStream;)Lcom/google/android/exoplayer/hls/HlsPlaylist;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->result:Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 853
    return-void
.end method

.method public getResult()Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    .registers 2

    .prologue
    .line 856
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->result:Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    return-object v0
.end method
