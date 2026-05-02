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
    .line 71
    const-string v0, "BANDWIDTH=(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 73
    const-string v0, "CODECS=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 75
    const-string v0, "RESOLUTION=(\\d+x\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 77
    const-string v0, "#EXTINF:([\\d.]+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 79
    const-string v0, "#EXT-X-MEDIA-SEQUENCE:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    .line 81
    const-string v0, "#EXT-X-TARGETDURATION:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 83
    const-string v0, "#EXT-X-VERSION:(\\d+)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    .line 85
    const-string v0, "#EXT-X-BYTERANGE:(\\d+(?:@\\d+)?)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    .line 88
    const-string v0, "METHOD=(NONE|AES-128)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 90
    const-string v0, "URI=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 92
    const-string v0, "IV=([^,.*]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 94
    const-string v0, "TYPE=(AUDIO|VIDEO|SUBTITLES|CLOSED-CAPTIONS)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TYPE_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 97
    const-string v0, "LANGUAGE=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 99
    const-string v0, "NAME=\"(.+?)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 293
    return-void
.end method

.method private static parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .registers 35
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .local v31, "variants":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .local v28, "subtitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/16 v22, 0x0

    .line 145
    .local v22, "bitrate":I
    const/4 v13, 0x0

    .line 146
    .local v13, "codecs":Ljava/lang/String;
    const/16 v17, -0x1

    .line 147
    .local v17, "width":I
    const/16 v18, -0x1

    .line 148
    .local v18, "height":I
    const/4 v15, 0x0

    .line 150
    .local v15, "name":Ljava/lang/String;
    const/16 v25, 0x0

    .line 152
    .local v25, "expectingStreamInfUrl":Z
    :cond_14
    :goto_14
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_108

    .line 153
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v26

    .line 154
    .local v26, "line":Ljava/lang/String;
    const-string v5, "#EXT-X-MEDIA"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_73

    .line 155
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TYPE_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v6, "TYPE"

    move-object/from16 v0, v26

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 156
    .local v29, "type":Ljava/lang/String;
    const-string v5, "SUBTITLES"

    move-object/from16 v0, v29

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 158
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v6, "NAME"

    move-object/from16 v0, v26

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 159
    .local v4, "subtitleName":Ljava/lang/String;
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v6, "URI"

    move-object/from16 v0, v26

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 160
    .local v30, "uri":Ljava/lang/String;
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->LANGUAGE_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v26

    invoke-static {v0, v5}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v12

    .line 161
    .local v12, "language":Ljava/lang/String;
    new-instance v3, Lcom/google/android/exoplayer/chunk/Format;

    const-string v5, "application/x-mpegURL"

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/high16 v8, -0x40800000    # -1.0f

    const/4 v9, -0x1

    const/4 v10, -0x1

    const/4 v11, -0x1

    invoke-direct/range {v3 .. v13}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 163
    .local v3, "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v5, Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, v30

    invoke-direct {v5, v0, v3}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 167
    .end local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v4    # "subtitleName":Ljava/lang/String;
    .end local v12    # "language":Ljava/lang/String;
    .end local v29    # "type":Ljava/lang/String;
    .end local v30    # "uri":Ljava/lang/String;
    :cond_73
    const-string v5, "#EXT-X-STREAM-INF"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c8

    .line 168
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v6, "BANDWIDTH"

    move-object/from16 v0, v26

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v22

    .line 169
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v26

    invoke-static {v0, v5}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v13

    .line 170
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->NAME_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v26

    invoke-static {v0, v5}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v15

    .line 171
    sget-object v5, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    move-object/from16 v0, v26

    invoke-static {v0, v5}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v27

    .line 173
    .local v27, "resolutionString":Ljava/lang/String;
    if-eqz v27, :cond_c3

    .line 174
    const-string v5, "x"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v32

    .line 175
    .local v32, "widthAndHeight":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v32, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    .line 176
    if-gtz v17, :cond_b4

    .line 178
    const/16 v17, -0x1

    .line 180
    :cond_b4
    const/4 v5, 0x1

    aget-object v5, v32, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    .line 181
    if-gtz v18, :cond_bf

    .line 183
    const/16 v18, -0x1

    .line 189
    .end local v32    # "widthAndHeight":[Ljava/lang/String;
    :cond_bf
    :goto_bf
    const/16 v25, 0x1

    .line 190
    goto/16 :goto_14

    .line 186
    :cond_c3
    const/16 v17, -0x1

    .line 187
    const/16 v18, -0x1

    goto :goto_bf

    .line 190
    .end local v27    # "resolutionString":Ljava/lang/String;
    :cond_c8
    const-string v5, "#"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_14

    if-eqz v25, :cond_14

    .line 191
    if-nez v15, :cond_de

    .line 192
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v15

    .line 194
    :cond_de
    new-instance v3, Lcom/google/android/exoplayer/chunk/Format;

    const-string v16, "application/x-mpegURL"

    const/high16 v19, -0x40800000    # -1.0f

    const/16 v20, -0x1

    const/16 v21, -0x1

    const/16 v23, 0x0

    move-object v14, v3

    move-object/from16 v24, v13

    invoke-direct/range {v14 .. v24}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/lang/String;)V

    .line 196
    .restart local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    new-instance v5, Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, v26

    invoke-direct {v5, v0, v3}, Lcom/google/android/exoplayer/hls/Variant;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/chunk/Format;)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    const/16 v22, 0x0

    .line 198
    const/4 v13, 0x0

    .line 199
    const/4 v15, 0x0

    .line 200
    const/16 v17, -0x1

    .line 201
    const/16 v18, -0x1

    .line 202
    const/16 v25, 0x0

    .line 203
    goto/16 :goto_14

    .line 205
    .end local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .end local v26    # "line":Ljava/lang/String;
    :cond_108
    new-instance v5, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    move-object/from16 v2, v28

    invoke-direct {v5, v0, v1, v2}, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v5
.end method

.method private static parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    .registers 28
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v15, 0x0

    .line 211
    .local v15, "mediaSequence":I
    const/16 v16, 0x0

    .line 212
    .local v16, "targetDurationSecs":I
    const/16 v17, 0x1

    .line 213
    .local v17, "version":I
    const/16 v18, 0x1

    .line 214
    .local v18, "live":Z
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v24, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;>;"
    const-wide/16 v3, 0x0

    .line 217
    .local v3, "segmentDurationSecs":D
    const/4 v5, 0x0

    .line 218
    .local v5, "discontinuitySequenceNumber":I
    const-wide/16 v6, 0x0

    .line 219
    .local v6, "segmentStartTimeUs":J
    const/4 v11, 0x0

    .line 220
    .local v11, "segmentByterangeOffset":I
    const/4 v12, -0x1

    .line 221
    .local v12, "segmentByterangeLength":I
    const/16 v23, 0x0

    .line 223
    .local v23, "segmentMediaSequence":I
    const/4 v8, 0x0

    .line 224
    .local v8, "isEncrypted":Z
    const/4 v9, 0x0

    .line 225
    .local v9, "encryptionKeyUri":Ljava/lang/String;
    const/16 v21, 0x0

    .line 228
    .local v21, "encryptionIV":Ljava/lang/String;
    :cond_19
    :goto_19
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_12a

    .line 229
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v2

    .line 230
    .local v2, "line":Ljava/lang/String;
    const-string v1, "#EXT-X-TARGETDURATION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 231
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "#EXT-X-TARGETDURATION"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v16

    goto :goto_19

    .line 233
    :cond_34
    const-string v1, "#EXT-X-MEDIA-SEQUENCE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 234
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "#EXT-X-MEDIA-SEQUENCE"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v15

    .line 235
    move/from16 v23, v15

    goto :goto_19

    .line 236
    :cond_47
    const-string v1, "#EXT-X-VERSION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 237
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "#EXT-X-VERSION"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v17

    goto :goto_19

    .line 238
    :cond_58
    const-string v1, "#EXTINF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_69

    .line 239
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "#EXTINF"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseDoubleAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)D

    move-result-wide v3

    goto :goto_19

    .line 241
    :cond_69
    const-string v1, "#EXT-X-KEY"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_96

    .line 242
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "METHOD"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 243
    .local v22, "method":Ljava/lang/String;
    const-string v1, "AES-128"

    move-object/from16 v0, v22

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 244
    if-eqz v8, :cond_92

    .line 245
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "URI"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 246
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    invoke-static {v2, v1}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v21

    goto :goto_19

    .line 248
    :cond_92
    const/4 v9, 0x0

    .line 249
    const/16 v21, 0x0

    goto :goto_19

    .line 251
    .end local v22    # "method":Ljava/lang/String;
    :cond_96
    const-string v1, "#EXT-X-BYTERANGE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c4

    .line 252
    sget-object v1, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    const-string v13, "#EXT-X-BYTERANGE"

    invoke-static {v2, v1, v13}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 253
    .local v20, "byteRange":Ljava/lang/String;
    const-string v1, "@"

    move-object/from16 v0, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    .line 254
    .local v25, "splitByteRange":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v25, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 255
    move-object/from16 v0, v25

    array-length v1, v0

    const/4 v13, 0x1

    if-le v1, v13, :cond_19

    .line 256
    const/4 v1, 0x1

    aget-object v1, v25, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    goto/16 :goto_19

    .line 258
    .end local v20    # "byteRange":Ljava/lang/String;
    .end local v25    # "splitByteRange":[Ljava/lang/String;
    :cond_c4
    const-string v1, "#EXT-X-DISCONTINUITY-SEQUENCE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_de

    .line 259
    const/16 v1, 0x3a

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_19

    .line 260
    :cond_de
    const-string v1, "#EXT-X-DISCONTINUITY"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ea

    .line 261
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_19

    .line 262
    :cond_ea
    const-string v1, "#"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_120

    .line 264
    if-nez v8, :cond_116

    .line 265
    const/4 v10, 0x0

    .line 271
    .local v10, "segmentEncryptionIV":Ljava/lang/String;
    :goto_f5
    add-int/lit8 v23, v23, 0x1

    .line 272
    const/4 v1, -0x1

    if-ne v12, v1, :cond_fb

    .line 273
    const/4 v11, 0x0

    .line 275
    :cond_fb
    new-instance v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;

    invoke-direct/range {v1 .. v12}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;-><init>(Ljava/lang/String;DIJZLjava/lang/String;Ljava/lang/String;II)V

    move-object/from16 v0, v24

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    const-wide v13, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v13, v3

    double-to-long v13, v13

    add-long/2addr v6, v13

    .line 279
    const-wide/16 v3, 0x0

    .line 280
    const/4 v1, -0x1

    if-eq v12, v1, :cond_113

    .line 281
    add-int/2addr v11, v12

    .line 283
    :cond_113
    const/4 v12, -0x1

    .line 284
    goto/16 :goto_19

    .line 266
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_116
    if-eqz v21, :cond_11b

    .line 267
    move-object/from16 v10, v21

    .restart local v10    # "segmentEncryptionIV":Ljava/lang/String;
    goto :goto_f5

    .line 269
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_11b
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "segmentEncryptionIV":Ljava/lang/String;
    goto :goto_f5

    .line 284
    .end local v10    # "segmentEncryptionIV":Ljava/lang/String;
    :cond_120
    const-string v1, "#EXT-X-ENDLIST"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 285
    const/16 v18, 0x0

    .line 289
    .end local v2    # "line":Ljava/lang/String;
    :cond_12a
    new-instance v13, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    invoke-static/range {v24 .. v24}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v19

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v19}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;-><init>(Ljava/lang/String;IIIZLjava/util/List;)V

    return-object v13
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
    .line 109
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 110
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 113
    .local v0, "extraLines":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/String;>;"
    :cond_f
    :goto_f
    :try_start_f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_90

    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 115
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_f

    .line 117
    const-string v3, "#EXT-X-STREAM-INF"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 118
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 119
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p1}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    :try_end_32
    .catchall {:try_start_f .. :try_end_32} :catchall_8b

    move-result-object v3

    .line 135
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    :goto_36
    return-object v3

    .line 120
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

    .line 128
    :cond_77
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p1}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :try_end_82
    .catchall {:try_start_37 .. :try_end_82} :catchall_8b

    move-result-object v3

    .line 135
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    goto :goto_36

    .line 131
    :cond_87
    :try_start_87
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_8a
    .catchall {:try_start_87 .. :try_end_8a} :catchall_8b

    goto :goto_f

    .line 135
    .end local v1    # "line":Ljava/lang/String;
    :catchall_8b
    move-exception v3

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v3

    .restart local v1    # "line":Ljava/lang/String;
    :cond_90
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 137
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
