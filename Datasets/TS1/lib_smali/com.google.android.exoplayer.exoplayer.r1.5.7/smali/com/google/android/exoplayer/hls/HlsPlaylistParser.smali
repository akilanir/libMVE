.class public final Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
.super Ljava/lang/Object;
.source "HlsPlaylistParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/UriLoadable$Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer/upstream/UriLoadable$Parser",
        "<",
        "Lcom/google/android/exoplayer/hls/HlsPlaylist;",
        ">;"
    }
.end annotation


# static fields
.field private static final AUDIO_TYPE:Ljava/lang/String; = "AUDIO"

.field private static final BANDWIDTH_ATTR:Ljava/lang/String; = "BANDWIDTH"

.field private static final BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final BYTERANGE_REGEX:Ljava/util/regex/Pattern;

.field private static final BYTERANGE_TAG:Ljava/lang/String; = "#EXT-X-BYTERANGE"

.field private static final CLOSED_CAPTIONS_TYPE:Ljava/lang/String; = "CLOSED-CAPTIONS"

.field private static final CODECS_ATTR:Ljava/lang/String; = "CODECS"

.field private static final CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final DISCONTINUITY_SEQUENCE_TAG:Ljava/lang/String; = "#EXT-X-DISCONTINUITY-SEQUENCE"

.field private static final DISCONTINUITY_TAG:Ljava/lang/String; = "#EXT-X-DISCONTINUITY"

.field private static final ENDLIST_TAG:Ljava/lang/String; = "#EXT-X-ENDLIST"

.field private static final INSTREAM_ID_ATTR:Ljava/lang/String; = "INSTREAM-ID"

.field private static final INSTREAM_ID_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final IV_ATTR:Ljava/lang/String; = "IV"

.field private static final IV_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final KEY_TAG:Ljava/lang/String; = "#EXT-X-KEY"

.field private static final LANGUAGE_ATTR:Ljava/lang/String; = "LANGUAGE"

.field private static final LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

.field private static final MEDIA_DURATION_TAG:Ljava/lang/String; = "#EXTINF"

.field private static final MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

.field private static final MEDIA_SEQUENCE_TAG:Ljava/lang/String; = "#EXT-X-MEDIA-SEQUENCE"

.field private static final MEDIA_TAG:Ljava/lang/String; = "#EXT-X-MEDIA"

.field private static final METHOD_AES128:Ljava/lang/String; = "AES-128"

.field private static final METHOD_ATTR:Ljava/lang/String; = "METHOD"

.field private static final METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final METHOD_NONE:Ljava/lang/String; = "NONE"

.field private static final NAME_ATTR:Ljava/lang/String; = "NAME"

.field private static final NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final RESOLUTION_ATTR:Ljava/lang/String; = "RESOLUTION"

.field private static final RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final STREAM_INF_TAG:Ljava/lang/String; = "#EXT-X-STREAM-INF"

.field private static final SUBTITLES_TYPE:Ljava/lang/String; = "SUBTITLES"

.field private static final TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

.field private static final TARGET_DURATION_TAG:Ljava/lang/String; = "#EXT-X-TARGETDURATION"

.field private static final TYPE_ATTR:Ljava/lang/String; = "TYPE"

.field private static final TYPE_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final URI_ATTR:Ljava/lang/String; = "URI"

.field private static final URI_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final VERSION_REGEX:Ljava/util/regex/Pattern;

.field private static final VERSION_TAG:Ljava/lang/String; = "#EXT-X-VERSION"

.field private static final VIDEO_TYPE:Ljava/lang/String; = "VIDEO"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    const-string v0, "BANDWIDTH=(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 74
    const-string v0, "CODECS=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 76
    const-string v0, "RESOLUTION=(\\d+x\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 78
    const-string v0, "#EXTINF:([\\d.]+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 80
    const-string v0, "#EXT-X-MEDIA-SEQUENCE:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    .line 82
    const-string v0, "#EXT-X-TARGETDURATION:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 84
    const-string v0, "#EXT-X-VERSION:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    .line 86
    const-string v0, "#EXT-X-BYTERANGE:(\\d+(?:@\\d+)?)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    .line 89
    const-string v0, "METHOD=(NONE|AES-128)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 91
    const-string v0, "URI=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 93
    const-string v0, "IV=([^,.*]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 95
    const-string v0, "TYPE=(AUDIO|VIDEO|SUBTITLES|CLOSED-CAPTIONS)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TYPE_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 98
    const-string v0, "LANGUAGE=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 100
    const-string v0, "NAME=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 102
    const-string v0, "INSTREAM-ID=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->INSTREAM_ID_ATTR_REGEX:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    return-void
.end method

.method private static parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .registers 43
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    new-instance v38, Ljava/util/ArrayList;

    invoke-direct/range {v38 .. v38}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v38, "variants":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v25, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v35, Ljava/util/ArrayList;

    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v35, "subtitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/16 v26, 0x0

    .line 149
    .local v26, "bitrate":I
    const/4 v11, 0x0

    .line 150
    .local v11, "codecs":Ljava/lang/String;
    const/16 v39, -0x1

    .line 151
    .local v39, "width":I
    const/16 v28, -0x1

    .line 152
    .local v28, "height":I
    const/4 v15, 0x0

    .line 153
    .local v15, "name":Ljava/lang/String;
    const/16 v31, 0x0

    .line 154
    .local v31, "muxedAudioLanguage":Ljava/lang/String;
    const/16 v32, 0x0

    .line 156
    .local v32, "muxedCaptionLanguage":Ljava/lang/String;
    const/16 v27, 0x0

    .local v27, "expectingStreamInfUrl":Z
    move-object/from16 v33, v15

    .line 158
    .end local v15    # "name":Ljava/lang/String;
    .local v33, "name":Ljava/lang/String;
    :cond_1f
    :goto_1f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_194

    .line 159
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v30

    .line 160
    .local v30, "line":Ljava/lang/String;
    const-string v3, "#EXT-X-MEDIA"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f5

    .line 161
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TYPE_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "TYPE"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 162
    .local v36, "type":Ljava/lang/String;
    const-string v3, "CLOSED-CAPTIONS"

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 163
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->INSTREAM_ID_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "INSTREAM-ID"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 165
    .local v29, "instreamId":Ljava/lang/String;
    const-string v3, "CC1"

    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 166
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v32

    goto :goto_1f

    .line 168
    .end local v29    # "instreamId":Ljava/lang/String;
    :cond_64
    const-string v3, "SUBTITLES"

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a6

    .line 170
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "NAME"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 171
    .local v2, "subtitleName":Ljava/lang/String;
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "URI"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 172
    .local v37, "uri":Ljava/lang/String;
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v10

    .line 173
    .local v10, "language":Ljava/lang/String;
    new-instance v1, Lcom/google/android/exoplayer/chunk/Format;

    const-string v3, "application/x-mpegURL"

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/high16 v6, -0x40800000    # -1.0f

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 175
    .local v1, "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v3, Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, v37

    invoke-direct {v3, v0, v1}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1f

    .line 176
    .end local v1    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v2    # "subtitleName":Ljava/lang/String;
    .end local v10    # "language":Ljava/lang/String;
    .end local v37    # "uri":Ljava/lang/String;
    :cond_a6
    const-string v3, "AUDIO"

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 178
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v10

    .line 179
    .restart local v10    # "language":Ljava/lang/String;
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v37

    .line 180
    .restart local v37    # "uri":Ljava/lang/String;
    if-eqz v37, :cond_f1

    .line 181
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "NAME"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 182
    .local v13, "audioName":Ljava/lang/String;
    new-instance v1, Lcom/google/android/exoplayer/chunk/Format;

    const-string v14, "application/x-mpegURL"

    const/4 v15, -0x1

    const/16 v16, -0x1

    const/high16 v17, -0x40800000    # -1.0f

    const/16 v18, -0x1

    const/16 v19, -0x1

    const/16 v20, -0x1

    move-object v12, v1

    move-object/from16 v21, v10

    move-object/from16 v22, v11

    invoke-direct/range {v12 .. v22}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 184
    .restart local v1    # "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v3, Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, v37

    invoke-direct {v3, v0, v1}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1f

    .line 186
    .end local v1    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v13    # "audioName":Ljava/lang/String;
    :cond_f1
    move-object/from16 v31, v10

    goto/16 :goto_1f

    .line 189
    .end local v10    # "language":Ljava/lang/String;
    .end local v36    # "type":Ljava/lang/String;
    .end local v37    # "uri":Ljava/lang/String;
    :cond_f5
    const-string v3, "#EXT-X-STREAM-INF"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14c

    .line 190
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v4, "BANDWIDTH"

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v26

    .line 191
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v11

    .line 192
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v15

    .line 193
    .end local v33    # "name":Ljava/lang/String;
    .restart local v15    # "name":Ljava/lang/String;
    sget-object v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v30

    invoke-static {v0, v3}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v34

    .line 195
    .local v34, "resolutionString":Ljava/lang/String;
    if-eqz v34, :cond_147

    .line 196
    const-string v3, "x"

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v40

    .line 197
    .local v40, "widthAndHeight":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v40, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v39

    .line 198
    if-gtz v39, :cond_136

    .line 200
    const/16 v39, -0x1

    .line 202
    :cond_136
    const/4 v3, 0x1

    aget-object v3, v40, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v28

    .line 203
    if-gtz v28, :cond_141

    .line 205
    const/16 v28, -0x1

    .line 211
    .end local v40    # "widthAndHeight":[Ljava/lang/String;
    :cond_141
    :goto_141
    const/16 v27, 0x1

    move-object/from16 v33, v15

    .line 212
    .end local v15    # "name":Ljava/lang/String;
    .restart local v33    # "name":Ljava/lang/String;
    goto/16 :goto_1f

    .line 208
    .end local v33    # "name":Ljava/lang/String;
    .restart local v15    # "name":Ljava/lang/String;
    :cond_147
    const/16 v39, -0x1

    .line 209
    const/16 v28, -0x1

    goto :goto_141

    .line 212
    .end local v15    # "name":Ljava/lang/String;
    .end local v34    # "resolutionString":Ljava/lang/String;
    .restart local v33    # "name":Ljava/lang/String;
    :cond_14c
    const-string v3, "#"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1f

    if-eqz v27, :cond_1f

    .line 213
    if-nez v33, :cond_1a6

    .line 214
    invoke-virtual/range {v38 .. v38}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v15

    .line 216
    .end local v33    # "name":Ljava/lang/String;
    .restart local v15    # "name":Ljava/lang/String;
    :goto_162
    new-instance v1, Lcom/google/android/exoplayer/chunk/Format;

    const-string v16, "application/x-mpegURL"

    const/high16 v19, -0x40800000    # -1.0f

    const/16 v20, -0x1

    const/16 v21, -0x1

    const/16 v23, 0x0

    move-object v14, v1

    move/from16 v17, v39

    move/from16 v18, v28

    move/from16 v22, v26

    move-object/from16 v24, v11

    invoke-direct/range {v14 .. v24}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 218
    .restart local v1    # "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v3, Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, v30

    invoke-direct {v3, v0, v1}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    const/16 v26, 0x0

    .line 220
    const/4 v11, 0x0

    .line 221
    const/4 v15, 0x0

    .line 222
    const/16 v39, -0x1

    .line 223
    const/16 v28, -0x1

    .line 224
    const/16 v27, 0x0

    move-object/from16 v33, v15

    .line 225
    .end local v15    # "name":Ljava/lang/String;
    .restart local v33    # "name":Ljava/lang/String;
    goto/16 :goto_1f

    .line 227
    .end local v1    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v30    # "line":Ljava/lang/String;
    :cond_194
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    move-object/from16 v4, p1

    move-object/from16 v5, v38

    move-object/from16 v6, v25

    move-object/from16 v7, v35

    move-object/from16 v8, v31

    move-object/from16 v9, v32

    invoke-direct/range {v3 .. v9}, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .restart local v30    # "line":Ljava/lang/String;
    :cond_1a6
    move-object/from16 v15, v33

    .end local v33    # "name":Ljava/lang/String;
    .restart local v15    # "name":Ljava/lang/String;
    goto :goto_162
.end method

.method private static parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    .registers 30
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    const/16 v17, 0x0

    .line 234
    .local v17, "mediaSequence":I
    const/16 v18, 0x0

    .line 235
    .local v18, "targetDurationSecs":I
    const/16 v19, 0x1

    .line 236
    .local v19, "version":I
    const/16 v20, 0x1

    .line 237
    .local v20, "live":Z
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .local v26, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;>;"
    const-wide/16 v3, 0x0

    .line 240
    .local v3, "segmentDurationSecs":D
    const/4 v5, 0x0

    .line 241
    .local v5, "discontinuitySequenceNumber":I
    const-wide/16 v6, 0x0

    .line 242
    .local v6, "segmentStartTimeUs":J
    const-wide/16 v11, 0x0

    .line 243
    .local v11, "segmentByterangeOffset":J
    const-wide/16 v13, -0x1

    .line 244
    .local v13, "segmentByterangeLength":J
    const/16 v25, 0x0

    .line 246
    .local v25, "segmentMediaSequence":I
    const/4 v8, 0x0

    .line 247
    .local v8, "isEncrypted":Z
    const/4 v9, 0x0

    .line 248
    .local v9, "encryptionKeyUri":Ljava/lang/String;
    const/16 v23, 0x0

    .line 251
    .local v23, "encryptionIV":Ljava/lang/String;
    :cond_1c
    :goto_1c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_135

    .line 252
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "line":Ljava/lang/String;
    const-string v1, "#EXT-X-TARGETDURATION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 254
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "#EXT-X-TARGETDURATION"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v18

    goto :goto_1c

    .line 256
    :cond_37
    const-string v1, "#EXT-X-MEDIA-SEQUENCE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 257
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "#EXT-X-MEDIA-SEQUENCE"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v17

    .line 258
    move/from16 v25, v17

    goto :goto_1c

    .line 259
    :cond_4a
    const-string v1, "#EXT-X-VERSION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 260
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "#EXT-X-VERSION"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v19

    goto :goto_1c

    .line 261
    :cond_5b
    const-string v1, "#EXTINF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6c

    .line 262
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "#EXTINF"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseDoubleAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)D

    move-result-wide v3

    goto :goto_1c

    .line 264
    :cond_6c
    const-string v1, "#EXT-X-KEY"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_99

    .line 265
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "METHOD"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 266
    .local v24, "method":Ljava/lang/String;
    const-string v1, "AES-128"

    move-object/from16 v0, v24

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 267
    if-eqz v8, :cond_95

    .line 268
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "URI"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 269
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    invoke-static {v2, v1}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v23

    goto :goto_1c

    .line 271
    :cond_95
    const/4 v9, 0x0

    .line 272
    const/16 v23, 0x0

    goto :goto_1c

    .line 274
    .end local v24    # "method":Ljava/lang/String;
    :cond_99
    const-string v1, "#EXT-X-BYTERANGE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c7

    .line 275
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    const-string v15, "#EXT-X-BYTERANGE"

    invoke-static {v2, v1, v15}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 276
    .local v22, "byteRange":Ljava/lang/String;
    const-string v1, "@"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v27

    .line 277
    .local v27, "splitByteRange":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v27, v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    .line 278
    move-object/from16 v0, v27

    array-length v1, v0

    const/4 v15, 0x1

    if-le v1, v15, :cond_1c

    .line 279
    const/4 v1, 0x1

    aget-object v1, v27, v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    goto/16 :goto_1c

    .line 281
    .end local v22    # "byteRange":Ljava/lang/String;
    .end local v27    # "splitByteRange":[Ljava/lang/String;
    :cond_c7
    const-string v1, "#EXT-X-DISCONTINUITY-SEQUENCE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e1

    .line 282
    const/16 v1, 0x3a

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_1c

    .line 283
    :cond_e1
    const-string v1, "#EXT-X-DISCONTINUITY"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ed

    .line 284
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1c

    .line 285
    :cond_ed
    const-string v1, "#"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12b

    .line 287
    if-nez v8, :cond_121

    .line 288
    const/4 v10, 0x0

    .line 294
    .local v10, "segmentEncryptionIV":Ljava/lang/String;
    :goto_f8
    add-int/lit8 v25, v25, 0x1

    .line 295
    const-wide/16 v15, -0x1

    cmp-long v1, v13, v15

    if-nez v1, :cond_102

    .line 296
    const-wide/16 v11, 0x0

    .line 298
    :cond_102
    new-instance v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;

    invoke-direct/range {v1 .. v14}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;-><init>(Ljava/lang/String;DIJZLjava/lang/String;Ljava/lang/String;JJ)V

    move-object/from16 v0, v26

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    const-wide v15, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v15, v3

    double-to-long v15, v15

    add-long/2addr v6, v15

    .line 302
    const-wide/16 v3, 0x0

    .line 303
    const-wide/16 v15, -0x1

    cmp-long v1, v13, v15

    if-eqz v1, :cond_11d

    .line 304
    add-long/2addr v11, v13

    .line 306
    :cond_11d
    const-wide/16 v13, -0x1

    .line 307
    goto/16 :goto_1c

    .line 289
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_121
    if-eqz v23, :cond_126

    .line 290
    move-object/from16 v10, v23

    .restart local v10    # "segmentEncryptionIV":Ljava/lang/String;
    goto :goto_f8

    .line 292
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_126
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "segmentEncryptionIV":Ljava/lang/String;
    goto :goto_f8

    .line 307
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_12b
    const-string v1, "#EXT-X-ENDLIST"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 308
    const/16 v20, 0x0

    .line 312
    .end local v2    # "line":Ljava/lang/String;
    :cond_135
    new-instance v15, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    invoke-static/range {v26 .. v26}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v21

    move-object/from16 v16, p1

    invoke-direct/range {v15 .. v21}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;-><init>(Ljava/lang/String;IIIZLjava/util/List;)V

    return-object v15
.end method


# virtual methods
.method public parse(Ljava/lang/String;Ljava/io/InputStream;)Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .registers 8
    .param p1, "connectionUrl"    # Ljava/lang/String;
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 112
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 113
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 116
    .local v0, "extraLines":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/String;>;"
    :cond_f
    :goto_f
    :try_start_f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_90

    .line 117
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_f

    .line 120
    const-string v3, "#EXT-X-STREAM-INF"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 121
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 122
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p1}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    :try_end_32
    .catchall {:try_start_f .. :try_end_32} :catchall_8b

    move-result-object v3

    .line 138
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    :goto_36
    return-object v3

    .line 123
    :cond_37
    :try_start_37
    const-string v3, "#EXT-X-TARGETDURATION"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-MEDIA-SEQUENCE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXTINF"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-KEY"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-BYTERANGE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-DISCONTINUITY"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-DISCONTINUITY-SEQUENCE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "#EXT-X-ENDLIST"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_87

    .line 131
    :cond_77
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 132
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p1}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :try_end_82
    .catchall {:try_start_37 .. :try_end_82} :catchall_8b

    move-result-object v3

    .line 138
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    goto :goto_36

    .line 134
    :cond_87
    :try_start_87
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_8a
    .catchall {:try_start_87 .. :try_end_8a} :catchall_8b

    goto :goto_f

    .line 138
    .end local v1    # "line":Ljava/lang/String;
    :catchall_8b
    move-exception v3

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v3

    .restart local v1    # "line":Ljava/lang/String;
    :cond_90
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 140
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    const-string v4, "Failed to parse the playlist, could not identify any tags."

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public bridge synthetic parse(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parse(Ljava/lang/String;Ljava/io/InputStream;)Lcom/google/android/exoplayer/hls/HlsPlaylist;

    move-result-object v0

    return-object v0
.end method
