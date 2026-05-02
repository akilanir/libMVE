.class public final Lcom/google/android/exoplayer/MediaCodecUtil;
.super Ljava/lang/Object;
.source "MediaCodecUtil.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecUtil$1;,
        Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;,
        Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;,
        Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecUtil"

.field private static final codecs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static avcLevelToMaxFrameSize(I)I
    .registers 5
    .param p0, "avcLevel"    # I

    .prologue
    const/high16 v3, 0x200000

    const v2, 0x65400

    const/16 v0, 0x6300

    const v1, 0x18c00

    .line 355
    sparse-switch p0, :sswitch_data_32

    .line 371
    const/4 v0, -0x1

    :goto_e
    :sswitch_e
    return v0

    :sswitch_f
    move v0, v1

    .line 358
    goto :goto_e

    :sswitch_11
    move v0, v1

    .line 359
    goto :goto_e

    :sswitch_13
    move v0, v1

    .line 360
    goto :goto_e

    .line 361
    :sswitch_15
    const v0, 0x31800

    goto :goto_e

    :sswitch_19
    move v0, v2

    .line 362
    goto :goto_e

    :sswitch_1b
    move v0, v2

    .line 363
    goto :goto_e

    .line 364
    :sswitch_1d
    const v0, 0xe1000

    goto :goto_e

    .line 365
    :sswitch_21
    const/high16 v0, 0x140000

    goto :goto_e

    :sswitch_24
    move v0, v3

    .line 366
    goto :goto_e

    :sswitch_26
    move v0, v3

    .line 367
    goto :goto_e

    .line 368
    :sswitch_28
    const/high16 v0, 0x220000

    goto :goto_e

    .line 369
    :sswitch_2b
    const v0, 0x564000

    goto :goto_e

    .line 370
    :sswitch_2f
    const/high16 v0, 0x900000

    goto :goto_e

    .line 355
    :sswitch_data_32
    .sparse-switch
        0x1 -> :sswitch_e
        0x2 -> :sswitch_e
        0x8 -> :sswitch_f
        0x10 -> :sswitch_11
        0x20 -> :sswitch_13
        0x40 -> :sswitch_15
        0x80 -> :sswitch_19
        0x100 -> :sswitch_1b
        0x200 -> :sswitch_1d
        0x400 -> :sswitch_21
        0x800 -> :sswitch_24
        0x1000 -> :sswitch_26
        0x2000 -> :sswitch_28
        0x4000 -> :sswitch_2b
        0x8000 -> :sswitch_2f
    .end sparse-switch
.end method

.method public static getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;
    .registers 6
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v0

    .line 71
    .local v0, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v0, :cond_8

    .line 72
    const/4 v1, 0x0

    .line 74
    :goto_7
    return-object v1

    :cond_8
    new-instance v3, Lcom/google/android/exoplayer/DecoderInfo;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Landroid/media/MediaCodecInfo$CodecCapabilities;

    invoke-static {v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->isAdaptive(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v2

    invoke-direct {v3, v1, v2}, Lcom/google/android/exoplayer/DecoderInfo;-><init>(Ljava/lang/String;Z)V

    move-object v1, v3

    goto :goto_7
.end method

.method private static getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    .registers 5
    .param p0, "key"    # Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    .param p1, "mediaCodecList"    # Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 131
    :try_start_0
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfoInternal(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 132
    :catch_5
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;-><init>(Ljava/lang/Throwable;Lcom/google/android/exoplayer/MediaCodecUtil$1;)V

    throw v1
.end method

.method public static declared-synchronized getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;
    .registers 9
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x15

    .line 106
    const-class v4, Lcom/google/android/exoplayer/MediaCodecUtil;

    monitor-enter v4

    :try_start_5
    new-instance v1, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    .line 107
    .local v1, "key":Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    sget-object v3, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 108
    sget-object v3, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_72

    .line 125
    :goto_1a
    monitor-exit v4

    return-object v3

    .line 110
    :cond_1c
    :try_start_1c
    sget v3, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-lt v3, v5, :cond_6b

    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;

    invoke-direct {v2, p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV21;-><init>(Z)V

    .line 112
    .local v2, "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    :goto_25
    invoke-static {v1, v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;

    move-result-object v0

    .line 113
    .local v0, "codecInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-eqz p1, :cond_69

    if-nez v0, :cond_69

    sget v3, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-gt v5, v3, :cond_69

    sget v3, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v5, 0x17

    if-gt v3, v5, :cond_69

    .line 118
    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;

    .end local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;-><init>(Lcom/google/android/exoplayer/MediaCodecUtil$1;)V

    .line 119
    .restart local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    invoke-static {v1, v2}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;

    move-result-object v0

    .line 120
    if-eqz v0, :cond_69

    .line 121
    const-string v5, "MediaCodecUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MediaCodecList API didn\'t list secure decoder for: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ". Assuming: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_69
    move-object v3, v0

    .line 125
    goto :goto_1a

    .line 110
    .end local v0    # "codecInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    .end local v2    # "mediaCodecList":Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    :cond_6b
    new-instance v2, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompatV16;-><init>(Lcom/google/android/exoplayer/MediaCodecUtil$1;)V
    :try_end_71
    .catchall {:try_start_1c .. :try_end_71} :catchall_72

    goto :goto_25

    .line 106
    .end local v1    # "key":Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    :catchall_72
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method private static getMediaCodecInfoInternal(Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;)Landroid/util/Pair;
    .registers 18
    .param p0, "key"    # Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;
    .param p1, "mediaCodecList"    # Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;",
            "Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo$CodecCapabilities;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->mimeType:Ljava/lang/String;

    .line 142
    .local v6, "mimeType":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->getCodecCount()I

    move-result v7

    .line 143
    .local v7, "numberOfCodecs":I
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->secureDecodersExplicit()Z

    move-result v9

    .line 145
    .local v9, "secureDecodersExplicit":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    if-ge v3, v7, :cond_b9

    .line 146
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v4

    .line 147
    .local v4, "info":Landroid/media/MediaCodecInfo;
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v2

    .line 148
    .local v2, "codecName":Ljava/lang/String;
    invoke-static {v4, v2, v9}, Lcom/google/android/exoplayer/MediaCodecUtil;->isCodecUsableDecoder(Landroid/media/MediaCodecInfo;Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_b5

    .line 149
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v11

    .line 150
    .local v11, "supportedTypes":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_24
    array-length v12, v11

    if-ge v5, v12, :cond_b5

    .line 151
    aget-object v10, v11, v5

    .line 152
    .local v10, "supportedType":Ljava/lang/String;
    invoke-virtual {v10, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_b1

    .line 153
    invoke-virtual {v4, v10}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v1

    .line 154
    .local v1, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v1}, Lcom/google/android/exoplayer/MediaCodecUtil$MediaCodecListCompat;->isSecurePlaybackSupported(Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v8

    .line 155
    .local v8, "secure":Z
    if-nez v9, :cond_99

    .line 157
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-eqz v12, :cond_8f

    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    const/4 v14, 0x0

    invoke-direct {v12, v6, v14}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    :goto_4d
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    if-eqz v8, :cond_7a

    .line 160
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-eqz v12, :cond_92

    move-object/from16 v12, p0

    :goto_60
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".secure"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_7a
    :goto_7a
    sget-object v12, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b1

    .line 170
    sget-object v12, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/util/Pair;

    .line 176
    .end local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v2    # "codecName":Ljava/lang/String;
    .end local v4    # "info":Landroid/media/MediaCodecInfo;
    .end local v5    # "j":I
    .end local v8    # "secure":Z
    .end local v10    # "supportedType":Ljava/lang/String;
    .end local v11    # "supportedTypes":[Ljava/lang/String;
    :goto_8e
    return-object v12

    .restart local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .restart local v2    # "codecName":Ljava/lang/String;
    .restart local v4    # "info":Landroid/media/MediaCodecInfo;
    .restart local v5    # "j":I
    .restart local v8    # "secure":Z
    .restart local v10    # "supportedType":Ljava/lang/String;
    .restart local v11    # "supportedTypes":[Ljava/lang/String;
    :cond_8f
    move-object/from16 v12, p0

    .line 157
    goto :goto_4d

    .line 160
    :cond_92
    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    const/4 v14, 0x1

    invoke-direct {v12, v6, v14}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    goto :goto_60

    .line 166
    :cond_99
    sget-object v13, Lcom/google/android/exoplayer/MediaCodecUtil;->codecs:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;->secure:Z

    if-ne v12, v8, :cond_ab

    move-object/from16 v12, p0

    :goto_a3
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v14

    invoke-virtual {v13, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7a

    :cond_ab
    new-instance v12, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;

    invoke-direct {v12, v6, v8}, Lcom/google/android/exoplayer/MediaCodecUtil$CodecKey;-><init>(Ljava/lang/String;Z)V

    goto :goto_a3

    .line 150
    .end local v1    # "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v8    # "secure":Z
    :cond_b1
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_24

    .line 145
    .end local v5    # "j":I
    .end local v10    # "supportedType":Ljava/lang/String;
    .end local v11    # "supportedTypes":[Ljava/lang/String;
    :cond_b5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_d

    .line 176
    .end local v2    # "codecName":Ljava/lang/String;
    .end local v4    # "info":Landroid/media/MediaCodecInfo;
    :cond_b9
    const/4 v12, 0x0

    goto :goto_8e
.end method

.method private static getVideoCapabilitiesV21(Ljava/lang/String;Z)Landroid/media/MediaCodecInfo$VideoCapabilities;
    .registers 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 340
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v0

    .line 341
    .local v0, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v0, :cond_8

    .line 342
    const/4 v1, 0x0

    .line 344
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/media/MediaCodecInfo$CodecCapabilities;

    invoke-virtual {v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v1

    goto :goto_7
.end method

.method private static isAdaptive(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z
    .registers 3
    .param p0, "capabilities"    # Landroid/media/MediaCodecInfo$CodecCapabilities;

    .prologue
    .line 238
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 239
    invoke-static {p0}, Lcom/google/android/exoplayer/MediaCodecUtil;->isAdaptiveV19(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    move-result v0

    .line 241
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static isAdaptiveV19(Landroid/media/MediaCodecInfo$CodecCapabilities;)Z
    .registers 2
    .param p0, "capabilities"    # Landroid/media/MediaCodecInfo$CodecCapabilities;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 247
    const-string v0, "adaptive-playback"

    invoke-virtual {p0, v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isCodecUsableDecoder(Landroid/media/MediaCodecInfo;Ljava/lang/String;Z)Z
    .registers 7
    .param p0, "info"    # Landroid/media/MediaCodecInfo;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "secureDecodersExplicit"    # Z

    .prologue
    const/16 v3, 0x10

    const/4 v0, 0x0

    .line 184
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v1

    if-nez v1, :cond_13

    if-nez p2, :cond_14

    const-string v1, ".secure"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 234
    :cond_13
    :goto_13
    return v0

    .line 189
    :cond_14
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_22

    const-string v1, "CIPAACDecoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    :cond_22
    const-string v1, "CIPMP3Decoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "CIPVorbisDecoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "AACDecoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "MP3Decoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 197
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-ne v1, v3, :cond_4e

    const-string v1, "OMX.SEC.MP3.Decoder"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 203
    :cond_4e
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-ne v1, v3, :cond_aa

    const-string v1, "OMX.qcom.audio.decoder.mp3"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_aa

    const-string v1, "dlxu"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "protou"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C6602"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C6603"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C6606"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C6616"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "L36h"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "SO-02E"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 217
    :cond_aa
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-ne v1, v3, :cond_de

    const-string v1, "OMX.qcom.audio.decoder.aac"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_de

    const-string v1, "C1504"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C1505"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C1604"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "C1605"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 228
    :cond_de
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x13

    if-gt v1, v2, :cond_10e

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    if-eqz v1, :cond_10e

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    const-string v2, "d2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_fc

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    const-string v2, "serrano"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10e

    :cond_fc
    const-string v1, "samsung"

    sget-object v2, Lcom/google/android/exoplayer/util/Util;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10e

    const-string v1, "OMX.SEC.vp8.dec"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 234
    :cond_10e
    const/4 v0, 0x1

    goto/16 :goto_13
.end method

.method public static isH264ProfileSupported(II)Z
    .registers 8
    .param p0, "profile"    # I
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 301
    const-string v5, "video/avc"

    invoke-static {v5, v4}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v2

    .line 302
    .local v2, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v2, :cond_a

    .line 314
    :cond_9
    :goto_9
    return v4

    .line 306
    :cond_a
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 307
    .local v0, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v5, v5

    if-ge v1, v5, :cond_9

    .line 308
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    aget-object v3, v5, v1

    .line 309
    .local v3, "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    iget v5, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-ne v5, p0, :cond_22

    iget v5, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    if-lt v5, p1, :cond_22

    .line 310
    const/4 v4, 0x1

    goto :goto_9

    .line 307
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method public static isSizeAndRateSupportedV21(Ljava/lang/String;ZIID)Z
    .registers 11
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "frameRate"    # D
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 288
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v1, v4, :cond_19

    move v1, v2

    :goto_9
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 289
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getVideoCapabilitiesV21(Ljava/lang/String;Z)Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v0

    .line 290
    .local v0, "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    if-eqz v0, :cond_1b

    invoke-virtual {v0, p2, p3, p4, p5}, Landroid/media/MediaCodecInfo$VideoCapabilities;->areSizeAndRateSupported(IID)Z

    move-result v1

    if-eqz v1, :cond_1b

    :goto_18
    return v2

    .end local v0    # "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    :cond_19
    move v1, v3

    .line 288
    goto :goto_9

    .restart local v0    # "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    :cond_1b
    move v2, v3

    .line 290
    goto :goto_18
.end method

.method public static isSizeSupportedV21(Ljava/lang/String;ZII)Z
    .registers 9
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z
    .param p2, "width"    # I
    .param p3, "height"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 266
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v1, v4, :cond_19

    move v1, v2

    :goto_9
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 267
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getVideoCapabilitiesV21(Ljava/lang/String;Z)Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v0

    .line 268
    .local v0, "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    if-eqz v0, :cond_1b

    invoke-virtual {v0, p2, p3}, Landroid/media/MediaCodecInfo$VideoCapabilities;->isSizeSupported(II)Z

    move-result v1

    if-eqz v1, :cond_1b

    :goto_18
    return v2

    .end local v0    # "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    :cond_19
    move v1, v3

    .line 266
    goto :goto_9

    .restart local v0    # "videoCapabilities":Landroid/media/MediaCodecInfo$VideoCapabilities;
    :cond_1b
    move v2, v3

    .line 268
    goto :goto_18
.end method

.method public static maxH264DecodableFrameSize()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 321
    const-string v5, "video/avc"

    invoke-static {v5, v3}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;

    move-result-object v2

    .line 322
    .local v2, "info":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;>;"
    if-nez v2, :cond_a

    .line 334
    :cond_9
    return v3

    .line 326
    :cond_a
    const/4 v3, 0x0

    .line 327
    .local v3, "maxH264DecodableFrameSize":I
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 328
    .local v0, "capabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v5, v5

    if-ge v1, v5, :cond_9

    .line 329
    iget-object v5, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    aget-object v4, v5, v1

    .line 330
    .local v4, "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    iget v5, v4, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-static {v5}, Lcom/google/android/exoplayer/MediaCodecUtil;->avcLevelToMaxFrameSize(I)I

    move-result v5

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_10
.end method

.method public static declared-synchronized warmCodec(Ljava/lang/String;Z)V
    .registers 6
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "secure"    # Z

    .prologue
    .line 88
    const-class v2, Lcom/google/android/exoplayer/MediaCodecUtil;

    monitor-enter v2

    :try_start_3
    invoke-static {p0, p1}, Lcom/google/android/exoplayer/MediaCodecUtil;->getMediaCodecInfo(Ljava/lang/String;Z)Landroid/util/Pair;
    :try_end_6
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_3 .. :try_end_6} :catch_8
    .catchall {:try_start_3 .. :try_end_6} :catchall_11

    .line 93
    :goto_6
    monitor-exit v2

    return-void

    .line 89
    :catch_8
    move-exception v0

    .line 91
    .local v0, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    :try_start_9
    const-string v1, "MediaCodecUtil"

    const-string v3, "Codec warming failed"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_11

    goto :goto_6

    .line 88
    .end local v0    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    :catchall_11
    move-exception v1

    monitor-exit v2

    throw v1
.end method
