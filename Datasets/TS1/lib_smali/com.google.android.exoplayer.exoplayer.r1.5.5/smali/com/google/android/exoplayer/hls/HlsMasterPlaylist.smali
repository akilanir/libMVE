.class public final Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
.super Lcom/google/android/exoplayer/hls/HlsPlaylist;
.source "HlsMasterPlaylist.java"


# instance fields
.field public final subtitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;"
        }
    .end annotation
.end field

.field public final variants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/hls/Variant;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    .local p3, "subtitles":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/hls/HlsPlaylist;-><init>(Ljava/lang/String;I)V

    .line 31
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->variants:Ljava/util/List;

    .line 32
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->subtitles:Ljava/util/List;

    .line 33
    return-void
.end method
