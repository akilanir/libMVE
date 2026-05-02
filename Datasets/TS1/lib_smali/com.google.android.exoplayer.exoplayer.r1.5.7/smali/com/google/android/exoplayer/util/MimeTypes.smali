.class public final Lcom/google/android/exoplayer/util/MimeTypes;
.super Ljava/lang/Object;
.source "MimeTypes.java"


# static fields
.field public static final APPLICATION_EIA608:Ljava/lang/String; = "application/eia-608"

.field public static final APPLICATION_ID3:Ljava/lang/String; = "application/id3"

.field public static final APPLICATION_M3U8:Ljava/lang/String; = "application/x-mpegURL"

.field public static final APPLICATION_MP4:Ljava/lang/String; = "application/mp4"

.field public static final APPLICATION_MP4VTT:Ljava/lang/String; = "application/x-mp4vtt"

.field public static final APPLICATION_PGS:Ljava/lang/String; = "application/pgs"

.field public static final APPLICATION_SUBRIP:Ljava/lang/String; = "application/x-subrip"

.field public static final APPLICATION_TTML:Ljava/lang/String; = "application/ttml+xml"

.field public static final APPLICATION_TX3G:Ljava/lang/String; = "application/x-quicktime-tx3g"

.field public static final APPLICATION_VOBSUB:Ljava/lang/String; = "application/vobsub"

.field public static final APPLICATION_WEBM:Ljava/lang/String; = "application/webm"

.field public static final AUDIO_AAC:Ljava/lang/String; = "audio/mp4a-latm"

.field public static final AUDIO_AC3:Ljava/lang/String; = "audio/ac3"

.field public static final AUDIO_AMR_NB:Ljava/lang/String; = "audio/3gpp"

.field public static final AUDIO_AMR_WB:Ljava/lang/String; = "audio/amr-wb"

.field public static final AUDIO_DTS:Ljava/lang/String; = "audio/vnd.dts"

.field public static final AUDIO_DTS_EXPRESS:Ljava/lang/String; = "audio/vnd.dts.hd;profile=lbr"

.field public static final AUDIO_DTS_HD:Ljava/lang/String; = "audio/vnd.dts.hd"

.field public static final AUDIO_E_AC3:Ljava/lang/String; = "audio/eac3"

.field public static final AUDIO_FLAC:Ljava/lang/String; = "audio/x-flac"

.field public static final AUDIO_MP4:Ljava/lang/String; = "audio/mp4"

.field public static final AUDIO_MPEG:Ljava/lang/String; = "audio/mpeg"

.field public static final AUDIO_MPEG_L1:Ljava/lang/String; = "audio/mpeg-L1"

.field public static final AUDIO_MPEG_L2:Ljava/lang/String; = "audio/mpeg-L2"

.field public static final AUDIO_OPUS:Ljava/lang/String; = "audio/opus"

.field public static final AUDIO_RAW:Ljava/lang/String; = "audio/raw"

.field public static final AUDIO_TRUEHD:Ljava/lang/String; = "audio/true-hd"

.field public static final AUDIO_UNKNOWN:Ljava/lang/String; = "audio/x-unknown"

.field public static final AUDIO_VORBIS:Ljava/lang/String; = "audio/vorbis"

.field public static final AUDIO_WEBM:Ljava/lang/String; = "audio/webm"

.field public static final BASE_TYPE_APPLICATION:Ljava/lang/String; = "application"

.field public static final BASE_TYPE_AUDIO:Ljava/lang/String; = "audio"

.field public static final BASE_TYPE_TEXT:Ljava/lang/String; = "text"

.field public static final BASE_TYPE_VIDEO:Ljava/lang/String; = "video"

.field public static final TEXT_UNKNOWN:Ljava/lang/String; = "text/x-unknown"

.field public static final TEXT_VTT:Ljava/lang/String; = "text/vtt"

.field public static final VIDEO_H263:Ljava/lang/String; = "video/3gpp"

.field public static final VIDEO_H264:Ljava/lang/String; = "video/avc"

.field public static final VIDEO_H265:Ljava/lang/String; = "video/hevc"

.field public static final VIDEO_MP4:Ljava/lang/String; = "video/mp4"

.field public static final VIDEO_MP4V:Ljava/lang/String; = "video/mp4v-es"

.field public static final VIDEO_MPEG2:Ljava/lang/String; = "video/mpeg2"

.field public static final VIDEO_UNKNOWN:Ljava/lang/String; = "video/x-unknown"

.field public static final VIDEO_VC1:Ljava/lang/String; = "video/wvc1"

.field public static final VIDEO_VP8:Ljava/lang/String; = "video/x-vnd.on2.vp8"

.field public static final VIDEO_VP9:Ljava/lang/String; = "video/x-vnd.on2.vp9"

.field public static final VIDEO_WEBM:Ljava/lang/String; = "video/webm"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAudioMediaMimeType(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "codecs"    # Ljava/lang/String;

    .prologue
    .line 164
    if-nez p0, :cond_5

    .line 165
    const-string v5, "audio/x-unknown"

    .line 188
    :goto_4
    return-object v5

    .line 167
    :cond_5
    const-string v5, ","

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, "codecList":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_8a

    aget-object v1, v0, v3

    .line 169
    .local v1, "codec":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 170
    const-string v5, "mp4a"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 171
    const-string v5, "audio/mp4a-latm"

    goto :goto_4

    .line 172
    :cond_21
    const-string v5, "ac-3"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_31

    const-string v5, "dac3"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 173
    :cond_31
    const-string v5, "audio/ac3"

    goto :goto_4

    .line 174
    :cond_34
    const-string v5, "ec-3"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_44

    const-string v5, "dec3"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 175
    :cond_44
    const-string v5, "audio/eac3"

    goto :goto_4

    .line 176
    :cond_47
    const-string v5, "dtsc"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_52

    .line 177
    const-string v5, "audio/vnd.dts"

    goto :goto_4

    .line 178
    :cond_52
    const-string v5, "dtsh"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_62

    const-string v5, "dtsl"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_65

    .line 179
    :cond_62
    const-string v5, "audio/vnd.dts.hd"

    goto :goto_4

    .line 180
    :cond_65
    const-string v5, "dtse"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_70

    .line 181
    const-string v5, "audio/vnd.dts.hd;profile=lbr"

    goto :goto_4

    .line 182
    :cond_70
    const-string v5, "opus"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7b

    .line 183
    const-string v5, "audio/opus"

    goto :goto_4

    .line 184
    :cond_7b
    const-string v5, "vorbis"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_87

    .line 185
    const-string v5, "audio/vorbis"

    goto/16 :goto_4

    .line 168
    :cond_87
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 188
    .end local v1    # "codec":Ljava/lang/String;
    :cond_8a
    const-string v5, "audio/x-unknown"

    goto/16 :goto_4
.end method

.method private static getTopLevelType(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 124
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 125
    .local v0, "indexOfSlash":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_22

    .line 126
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid mime type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_22
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "codecs"    # Ljava/lang/String;

    .prologue
    .line 138
    if-nez p0, :cond_5

    .line 139
    const-string v5, "video/x-unknown"

    .line 154
    :goto_4
    return-object v5

    .line 141
    :cond_5
    const-string v5, ","

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 142
    .local v2, "codecList":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_55

    aget-object v1, v0, v3

    .line 143
    .local v1, "codec":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 144
    const-string v5, "avc1"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_26

    const-string v5, "avc3"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 145
    :cond_26
    const-string v5, "video/avc"

    goto :goto_4

    .line 146
    :cond_29
    const-string v5, "hev1"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_39

    const-string v5, "hvc1"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 147
    :cond_39
    const-string v5, "video/hevc"

    goto :goto_4

    .line 148
    :cond_3c
    const-string v5, "vp9"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 149
    const-string v5, "video/x-vnd.on2.vp9"

    goto :goto_4

    .line 150
    :cond_47
    const-string v5, "vp8"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_52

    .line 151
    const-string v5, "video/x-vnd.on2.vp8"

    goto :goto_4

    .line 142
    :cond_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 154
    .end local v1    # "codec":Ljava/lang/String;
    :cond_55
    const-string v5, "video/x-unknown"

    goto :goto_4
.end method

.method public static isApplication(Ljava/lang/String;)Z
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 114
    invoke-static {p0}, Lcom/google/android/exoplayer/util/MimeTypes;->getTopLevelType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "application"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isAudio(Ljava/lang/String;)Z
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-static {p0}, Lcom/google/android/exoplayer/util/MimeTypes;->getTopLevelType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isText(Ljava/lang/String;)Z
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 104
    invoke-static {p0}, Lcom/google/android/exoplayer/util/MimeTypes;->getTopLevelType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isVideo(Ljava/lang/String;)Z
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-static {p0}, Lcom/google/android/exoplayer/util/MimeTypes;->getTopLevelType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "video"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
