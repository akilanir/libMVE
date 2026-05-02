.class final Lcom/google/android/exoplayer/MediaCodecSelector$1;
.super Ljava/lang/Object;
.source "MediaCodecSelector.java"

# interfaces
.implements Lcom/google/android/exoplayer/MediaCodecSelector;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/MediaCodecSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# static fields
.field private static final RAW_DECODER_NAME:Ljava/lang/String; = "OMX.google.raw.decoder"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDecoderInfo(Lcom/google/android/exoplayer/MediaFormat;Z)Lcom/google/android/exoplayer/DecoderInfo;
    .registers 4
    .param p1, "format"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p2, "requiresSecureDecoder"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-static {v0, p2}, Lcom/google/android/exoplayer/MediaCodecUtil;->getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPassthroughDecoderName()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 46
    const-string v0, "OMX.google.raw.decoder"

    return-object v0
.end method
