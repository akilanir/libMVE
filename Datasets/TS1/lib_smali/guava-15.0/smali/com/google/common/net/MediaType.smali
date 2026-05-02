.class public final Lcom/google/common/net/MediaType;
.super Ljava/lang/Object;
.source "MediaType.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/net/MediaType$Tokenizer;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# static fields
.field public static final ANY_APPLICATION_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_AUDIO_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_IMAGE_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_TEXT_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_TYPE:Lcom/google/common/net/MediaType;

.field public static final ANY_VIDEO_TYPE:Lcom/google/common/net/MediaType;

.field public static final APPLICATION_BINARY:Lcom/google/common/net/MediaType;

.field private static final APPLICATION_TYPE:Ljava/lang/String; = "application"

.field public static final APPLICATION_XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final ATOM_UTF_8:Lcom/google/common/net/MediaType;

.field private static final AUDIO_TYPE:Ljava/lang/String; = "audio"

.field public static final BMP:Lcom/google/common/net/MediaType;

.field public static final BZIP2:Lcom/google/common/net/MediaType;

.field public static final CACHE_MANIFEST_UTF_8:Lcom/google/common/net/MediaType;

.field private static final CHARSET_ATTRIBUTE:Ljava/lang/String; = "charset"

.field public static final CRW:Lcom/google/common/net/MediaType;

.field public static final CSS_UTF_8:Lcom/google/common/net/MediaType;

.field public static final CSV_UTF_8:Lcom/google/common/net/MediaType;

.field public static final EPUB:Lcom/google/common/net/MediaType;

.field public static final FORM_DATA:Lcom/google/common/net/MediaType;

.field public static final GIF:Lcom/google/common/net/MediaType;

.field public static final GZIP:Lcom/google/common/net/MediaType;

.field public static final HTML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final ICO:Lcom/google/common/net/MediaType;

.field private static final IMAGE_TYPE:Ljava/lang/String; = "image"

.field public static final I_CALENDAR_UTF_8:Lcom/google/common/net/MediaType;

.field public static final JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

.field public static final JPEG:Lcom/google/common/net/MediaType;

.field public static final JSON_UTF_8:Lcom/google/common/net/MediaType;

.field public static final KEY_ARCHIVE:Lcom/google/common/net/MediaType;

.field public static final KML:Lcom/google/common/net/MediaType;

.field public static final KMZ:Lcom/google/common/net/MediaType;

.field private static final KNOWN_TYPES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/common/net/MediaType;",
            "Lcom/google/common/net/MediaType;",
            ">;"
        }
    .end annotation
.end field

.field private static final LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

.field public static final MBOX:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_EXCEL:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_POWERPOINT:Lcom/google/common/net/MediaType;

.field public static final MICROSOFT_WORD:Lcom/google/common/net/MediaType;

.field public static final MP4_AUDIO:Lcom/google/common/net/MediaType;

.field public static final MP4_VIDEO:Lcom/google/common/net/MediaType;

.field public static final MPEG_AUDIO:Lcom/google/common/net/MediaType;

.field public static final MPEG_VIDEO:Lcom/google/common/net/MediaType;

.field public static final OCTET_STREAM:Lcom/google/common/net/MediaType;

.field public static final OGG_AUDIO:Lcom/google/common/net/MediaType;

.field public static final OGG_CONTAINER:Lcom/google/common/net/MediaType;

.field public static final OGG_VIDEO:Lcom/google/common/net/MediaType;

.field public static final OOXML_DOCUMENT:Lcom/google/common/net/MediaType;

.field public static final OOXML_PRESENTATION:Lcom/google/common/net/MediaType;

.field public static final OOXML_SHEET:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_GRAPHICS:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_PRESENTATION:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_SPREADSHEET:Lcom/google/common/net/MediaType;

.field public static final OPENDOCUMENT_TEXT:Lcom/google/common/net/MediaType;

.field private static final PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

.field public static final PDF:Lcom/google/common/net/MediaType;

.field public static final PLAIN_TEXT_UTF_8:Lcom/google/common/net/MediaType;

.field public static final PNG:Lcom/google/common/net/MediaType;

.field public static final POSTSCRIPT:Lcom/google/common/net/MediaType;

.field public static final PROTOBUF:Lcom/google/common/net/MediaType;

.field public static final PSD:Lcom/google/common/net/MediaType;

.field public static final QUICKTIME:Lcom/google/common/net/MediaType;

.field private static final QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

.field public static final RDF_XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final RTF_UTF_8:Lcom/google/common/net/MediaType;

.field public static final SHOCKWAVE_FLASH:Lcom/google/common/net/MediaType;

.field public static final SKETCHUP:Lcom/google/common/net/MediaType;

.field public static final SVG_UTF_8:Lcom/google/common/net/MediaType;

.field public static final TAR:Lcom/google/common/net/MediaType;

.field public static final TEXT_JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

.field private static final TEXT_TYPE:Ljava/lang/String; = "text"

.field public static final TIFF:Lcom/google/common/net/MediaType;

.field private static final TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

.field public static final TSV_UTF_8:Lcom/google/common/net/MediaType;

.field private static final UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final VCARD_UTF_8:Lcom/google/common/net/MediaType;

.field private static final VIDEO_TYPE:Ljava/lang/String; = "video"

.field public static final WEBM_AUDIO:Lcom/google/common/net/MediaType;

.field public static final WEBM_VIDEO:Lcom/google/common/net/MediaType;

.field public static final WEBP:Lcom/google/common/net/MediaType;

.field private static final WILDCARD:Ljava/lang/String; = "*"

.field public static final WML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final WMV:Lcom/google/common/net/MediaType;

.field public static final XHTML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final XML_UTF_8:Lcom/google/common/net/MediaType;

.field public static final XRD_UTF_8:Lcom/google/common/net/MediaType;

.field public static final ZIP:Lcom/google/common/net/MediaType;


# instance fields
.field private final parameters:Lcom/google/common/collect/ImmutableListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final subtype:Ljava/lang/String;

.field private final type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 84
    const-string v0, "charset"

    sget-object v1, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/ImmutableListMultimap;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;

    .line 88
    sget-object v0, Lcom/google/common/base/CharMatcher;->ASCII:Lcom/google/common/base/CharMatcher;

    sget-object v1, Lcom/google/common/base/CharMatcher;->JAVA_ISO_CONTROL:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v1}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    const/16 v1, 0x20

    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->isNot(C)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    const-string v1, "()<>@,;:\\\"/[]?="

    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->noneOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 91
    sget-object v0, Lcom/google/common/base/CharMatcher;->ASCII:Lcom/google/common/base/CharMatcher;

    const-string v1, "\"\\\r"

    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->noneOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/CharMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 97
    const-string v0, " \t\r\n"

    invoke-static {v0}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

    .line 108
    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KNOWN_TYPES:Ljava/util/Map;

    .line 133
    const-string v0, "*"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_TYPE:Lcom/google/common/net/MediaType;

    .line 134
    const-string v0, "text"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_TEXT_TYPE:Lcom/google/common/net/MediaType;

    .line 135
    const-string v0, "image"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_IMAGE_TYPE:Lcom/google/common/net/MediaType;

    .line 136
    const-string v0, "audio"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_AUDIO_TYPE:Lcom/google/common/net/MediaType;

    .line 137
    const-string v0, "video"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_VIDEO_TYPE:Lcom/google/common/net/MediaType;

    .line 138
    const-string v0, "application"

    const-string v1, "*"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ANY_APPLICATION_TYPE:Lcom/google/common/net/MediaType;

    .line 141
    const-string v0, "text"

    const-string v1, "cache-manifest"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CACHE_MANIFEST_UTF_8:Lcom/google/common/net/MediaType;

    .line 143
    const-string v0, "text"

    const-string v1, "css"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CSS_UTF_8:Lcom/google/common/net/MediaType;

    .line 144
    const-string v0, "text"

    const-string v1, "csv"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CSV_UTF_8:Lcom/google/common/net/MediaType;

    .line 145
    const-string v0, "text"

    const-string v1, "html"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->HTML_UTF_8:Lcom/google/common/net/MediaType;

    .line 146
    const-string v0, "text"

    const-string v1, "calendar"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->I_CALENDAR_UTF_8:Lcom/google/common/net/MediaType;

    .line 147
    const-string v0, "text"

    const-string v1, "plain"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PLAIN_TEXT_UTF_8:Lcom/google/common/net/MediaType;

    .line 153
    const-string v0, "text"

    const-string v1, "javascript"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TEXT_JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

    .line 160
    const-string v0, "text"

    const-string v1, "tab-separated-values"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TSV_UTF_8:Lcom/google/common/net/MediaType;

    .line 161
    const-string v0, "text"

    const-string v1, "vcard"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->VCARD_UTF_8:Lcom/google/common/net/MediaType;

    .line 162
    const-string v0, "text"

    const-string v1, "vnd.wap.wml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WML_UTF_8:Lcom/google/common/net/MediaType;

    .line 168
    const-string v0, "text"

    const-string v1, "xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 171
    const-string v0, "image"

    const-string v1, "bmp"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->BMP:Lcom/google/common/net/MediaType;

    .line 181
    const-string v0, "image"

    const-string v1, "x-canon-crw"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->CRW:Lcom/google/common/net/MediaType;

    .line 182
    const-string v0, "image"

    const-string v1, "gif"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->GIF:Lcom/google/common/net/MediaType;

    .line 183
    const-string v0, "image"

    const-string v1, "vnd.microsoft.icon"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ICO:Lcom/google/common/net/MediaType;

    .line 184
    const-string v0, "image"

    const-string v1, "jpeg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JPEG:Lcom/google/common/net/MediaType;

    .line 185
    const-string v0, "image"

    const-string v1, "png"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PNG:Lcom/google/common/net/MediaType;

    .line 202
    const-string v0, "image"

    const-string v1, "vnd.adobe.photoshop"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PSD:Lcom/google/common/net/MediaType;

    .line 203
    const-string v0, "image"

    const-string v1, "svg+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SVG_UTF_8:Lcom/google/common/net/MediaType;

    .line 204
    const-string v0, "image"

    const-string v1, "tiff"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TIFF:Lcom/google/common/net/MediaType;

    .line 205
    const-string v0, "image"

    const-string v1, "webp"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WEBP:Lcom/google/common/net/MediaType;

    .line 208
    const-string v0, "audio"

    const-string v1, "mp4"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MP4_AUDIO:Lcom/google/common/net/MediaType;

    .line 209
    const-string v0, "audio"

    const-string v1, "mpeg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MPEG_AUDIO:Lcom/google/common/net/MediaType;

    .line 210
    const-string v0, "audio"

    const-string v1, "ogg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OGG_AUDIO:Lcom/google/common/net/MediaType;

    .line 211
    const-string v0, "audio"

    const-string v1, "webm"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WEBM_AUDIO:Lcom/google/common/net/MediaType;

    .line 214
    const-string v0, "video"

    const-string v1, "mp4"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MP4_VIDEO:Lcom/google/common/net/MediaType;

    .line 215
    const-string v0, "video"

    const-string v1, "mpeg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MPEG_VIDEO:Lcom/google/common/net/MediaType;

    .line 216
    const-string v0, "video"

    const-string v1, "ogg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OGG_VIDEO:Lcom/google/common/net/MediaType;

    .line 217
    const-string v0, "video"

    const-string v1, "quicktime"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->QUICKTIME:Lcom/google/common/net/MediaType;

    .line 218
    const-string v0, "video"

    const-string v1, "webm"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WEBM_VIDEO:Lcom/google/common/net/MediaType;

    .line 219
    const-string v0, "video"

    const-string v1, "x-ms-wmv"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->WMV:Lcom/google/common/net/MediaType;

    .line 227
    const-string v0, "application"

    const-string v1, "xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->APPLICATION_XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 228
    const-string v0, "application"

    const-string v1, "atom+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ATOM_UTF_8:Lcom/google/common/net/MediaType;

    .line 229
    const-string v0, "application"

    const-string v1, "x-bzip2"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->BZIP2:Lcom/google/common/net/MediaType;

    .line 239
    const-string v0, "application"

    const-string v1, "epub+zip"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->EPUB:Lcom/google/common/net/MediaType;

    .line 240
    const-string v0, "application"

    const-string v1, "x-www-form-urlencoded"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->FORM_DATA:Lcom/google/common/net/MediaType;

    .line 249
    const-string v0, "application"

    const-string v1, "pkcs12"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KEY_ARCHIVE:Lcom/google/common/net/MediaType;

    .line 261
    const-string v0, "application"

    const-string v1, "binary"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->APPLICATION_BINARY:Lcom/google/common/net/MediaType;

    .line 262
    const-string v0, "application"

    const-string v1, "x-gzip"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->GZIP:Lcom/google/common/net/MediaType;

    .line 268
    const-string v0, "application"

    const-string v1, "javascript"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JAVASCRIPT_UTF_8:Lcom/google/common/net/MediaType;

    .line 270
    const-string v0, "application"

    const-string v1, "json"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->JSON_UTF_8:Lcom/google/common/net/MediaType;

    .line 271
    const-string v0, "application"

    const-string v1, "vnd.google-earth.kml+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KML:Lcom/google/common/net/MediaType;

    .line 272
    const-string v0, "application"

    const-string v1, "vnd.google-earth.kmz"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->KMZ:Lcom/google/common/net/MediaType;

    .line 273
    const-string v0, "application"

    const-string v1, "mbox"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MBOX:Lcom/google/common/net/MediaType;

    .line 274
    const-string v0, "application"

    const-string v1, "vnd.ms-excel"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_EXCEL:Lcom/google/common/net/MediaType;

    .line 275
    const-string v0, "application"

    const-string v1, "vnd.ms-powerpoint"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_POWERPOINT:Lcom/google/common/net/MediaType;

    .line 277
    const-string v0, "application"

    const-string v1, "msword"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->MICROSOFT_WORD:Lcom/google/common/net/MediaType;

    .line 278
    const-string v0, "application"

    const-string v1, "octet-stream"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OCTET_STREAM:Lcom/google/common/net/MediaType;

    .line 279
    const-string v0, "application"

    const-string v1, "ogg"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OGG_CONTAINER:Lcom/google/common/net/MediaType;

    .line 280
    const-string v0, "application"

    const-string v1, "vnd.openxmlformats-officedocument.wordprocessingml.document"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_DOCUMENT:Lcom/google/common/net/MediaType;

    .line 282
    const-string v0, "application"

    const-string v1, "vnd.openxmlformats-officedocument.presentationml.presentation"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_PRESENTATION:Lcom/google/common/net/MediaType;

    .line 284
    const-string v0, "application"

    const-string v1, "vnd.openxmlformats-officedocument.spreadsheetml.sheet"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OOXML_SHEET:Lcom/google/common/net/MediaType;

    .line 286
    const-string v0, "application"

    const-string v1, "vnd.oasis.opendocument.graphics"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_GRAPHICS:Lcom/google/common/net/MediaType;

    .line 288
    const-string v0, "application"

    const-string v1, "vnd.oasis.opendocument.presentation"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_PRESENTATION:Lcom/google/common/net/MediaType;

    .line 290
    const-string v0, "application"

    const-string v1, "vnd.oasis.opendocument.spreadsheet"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_SPREADSHEET:Lcom/google/common/net/MediaType;

    .line 292
    const-string v0, "application"

    const-string v1, "vnd.oasis.opendocument.text"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->OPENDOCUMENT_TEXT:Lcom/google/common/net/MediaType;

    .line 294
    const-string v0, "application"

    const-string v1, "pdf"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PDF:Lcom/google/common/net/MediaType;

    .line 295
    const-string v0, "application"

    const-string v1, "postscript"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->POSTSCRIPT:Lcom/google/common/net/MediaType;

    .line 301
    const-string v0, "application"

    const-string v1, "protobuf"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PROTOBUF:Lcom/google/common/net/MediaType;

    .line 302
    const-string v0, "application"

    const-string v1, "rdf+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->RDF_XML_UTF_8:Lcom/google/common/net/MediaType;

    .line 303
    const-string v0, "application"

    const-string v1, "rtf"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->RTF_UTF_8:Lcom/google/common/net/MediaType;

    .line 304
    const-string v0, "application"

    const-string v1, "x-shockwave-flash"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SHOCKWAVE_FLASH:Lcom/google/common/net/MediaType;

    .line 306
    const-string v0, "application"

    const-string v1, "vnd.sketchup.skp"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->SKETCHUP:Lcom/google/common/net/MediaType;

    .line 307
    const-string v0, "application"

    const-string v1, "x-tar"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->TAR:Lcom/google/common/net/MediaType;

    .line 308
    const-string v0, "application"

    const-string v1, "xhtml+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->XHTML_UTF_8:Lcom/google/common/net/MediaType;

    .line 316
    const-string v0, "application"

    const-string v1, "xrd+xml"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->XRD_UTF_8:Lcom/google/common/net/MediaType;

    .line 317
    const-string v0, "application"

    const-string v1, "zip"

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->ZIP:Lcom/google/common/net/MediaType;

    .line 658
    const-string v0, "; "

    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Lcom/google/common/base/Joiner;->withKeyValueSeparator(Ljava/lang/String;)Lcom/google/common/base/Joiner$MapJoiner;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/MediaType;->PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 324
    .local p3, "parameters":Lcom/google/common/collect/ImmutableListMultimap;, "Lcom/google/common/collect/ImmutableListMultimap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    iput-object p1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    .line 326
    iput-object p2, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    .line 327
    iput-object p3, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    .line 328
    return-void
.end method

.method static synthetic access$000()Lcom/google/common/base/CharMatcher;
    .registers 1

    .prologue
    .line 82
    sget-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-static {p0}, Lcom/google/common/net/MediaType;->escapeAndQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "mediaType"    # Lcom/google/common/net/MediaType;

    .prologue
    .line 119
    sget-object v0, Lcom/google/common/net/MediaType;->KNOWN_TYPES:Ljava/util/Map;

    invoke-interface {v0, p0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    return-object p0
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 3
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "subtype"    # Ljava/lang/String;

    .prologue
    .line 474
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->of()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method private static create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;
    .registers 12
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/net/MediaType;"
        }
    .end annotation

    .prologue
    .line 524
    .local p2, "parameters":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    invoke-static {p0}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 528
    .local v6, "normalizedType":Ljava/lang/String;
    invoke-static {p1}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 529
    .local v5, "normalizedSubtype":Ljava/lang/String;
    const-string v7, "*"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_21

    const-string v7, "*"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_57

    :cond_21
    const/4 v7, 0x1

    :goto_22
    const-string v8, "A wildcard type cannot be used with a non-wildcard subtype"

    invoke-static {v7, v8}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 531
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v1

    .line 532
    .local v1, "builder":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p2}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_33
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_59

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 533
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 534
    .local v0, "attribute":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v0, v7}, Lcom/google/common/net/MediaType;->normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v0, v7}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_33

    .line 529
    .end local v0    # "attribute":Ljava/lang/String;
    .end local v1    # "builder":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_57
    const/4 v7, 0x0

    goto :goto_22

    .line 536
    .restart local v1    # "builder":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_59
    new-instance v4, Lcom/google/common/net/MediaType;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v7

    invoke-direct {v4, v6, v5, v7}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    .line 538
    .local v4, "mediaType":Lcom/google/common/net/MediaType;
    sget-object v7, Lcom/google/common/net/MediaType;->KNOWN_TYPES:Ljava/util/Map;

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7, v4}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/net/MediaType;

    return-object v7
.end method

.method static createApplicationType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "subtype"    # Ljava/lang/String;

    .prologue
    .line 483
    const-string v0, "application"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method static createAudioType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "subtype"    # Ljava/lang/String;

    .prologue
    .line 492
    const-string v0, "audio"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method private static createConstant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 4
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "subtype"    # Ljava/lang/String;

    .prologue
    .line 111
    new-instance v0, Lcom/google/common/net/MediaType;

    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->of()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    invoke-static {v0}, Lcom/google/common/net/MediaType;->addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method private static createConstantUtf8(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 4
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "subtype"    # Ljava/lang/String;

    .prologue
    .line 115
    new-instance v0, Lcom/google/common/net/MediaType;

    sget-object v1, Lcom/google/common/net/MediaType;->UTF_8_CONSTANT_PARAMETERS:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    invoke-static {v0}, Lcom/google/common/net/MediaType;->addKnownType(Lcom/google/common/net/MediaType;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method static createImageType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "subtype"    # Ljava/lang/String;

    .prologue
    .line 501
    const-string v0, "image"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method static createTextType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "subtype"    # Ljava/lang/String;

    .prologue
    .line 510
    const-string v0, "text"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method static createVideoType(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 2
    .param p0, "subtype"    # Ljava/lang/String;

    .prologue
    .line 519
    const-string v0, "video"

    invoke-static {v0, p0}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method private static escapeAndQuote(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x22

    .line 680
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x10

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 681
    .local v2, "escaped":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, "arr$":[C
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_19
    if-ge v3, v4, :cond_2e

    aget-char v1, v0, v3

    .line 682
    .local v1, "ch":C
    const/16 v5, 0xd

    if-eq v1, v5, :cond_25

    if-eq v1, v8, :cond_25

    if-ne v1, v7, :cond_28

    .line 683
    :cond_25
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 685
    :cond_28
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 681
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 687
    .end local v1    # "ch":C
    :cond_2e
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private static normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "attribute"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 547
    const-string v0, "charset"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {p1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "value":Ljava/lang/String;
    :cond_c
    return-object p1
.end method

.method private static normalizeToken(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "token"    # Ljava/lang/String;

    .prologue
    .line 542
    sget-object v0, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->matchesAllOf(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 543
    invoke-static {p0}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parametersAsMap()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/common/collect/ImmutableMultiset",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 346
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap;->asMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    new-instance v1, Lcom/google/common/net/MediaType$1;

    invoke-direct {v1, p0}, Lcom/google/common/net/MediaType$1;-><init>(Lcom/google/common/net/MediaType;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Maps;->transformValues(Ljava/util/Map;Lcom/google/common/base/Function;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 12
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x5c

    const/16 v9, 0x22

    .line 556
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    new-instance v4, Lcom/google/common/net/MediaType$Tokenizer;

    invoke-direct {v4, p0}, Lcom/google/common/net/MediaType$Tokenizer;-><init>(Ljava/lang/String;)V

    .line 559
    .local v4, "tokenizer":Lcom/google/common/net/MediaType$Tokenizer;
    :try_start_c
    sget-object v8, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v5

    .line 560
    .local v5, "type":Ljava/lang/String;
    const/16 v8, 0x2f

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 561
    sget-object v8, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v3

    .line 562
    .local v3, "subtype":Ljava/lang/String;
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v2

    .line 563
    .local v2, "parameters":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_21
    invoke-virtual {v4}, Lcom/google/common/net/MediaType$Tokenizer;->hasMore()Z

    move-result v8

    if-eqz v8, :cond_8c

    .line 564
    const/16 v8, 0x3b

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 565
    sget-object v8, Lcom/google/common/net/MediaType;->LINEAR_WHITE_SPACE:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeTokenIfPresent(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    .line 566
    sget-object v8, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v0

    .line 567
    .local v0, "attribute":Ljava/lang/String;
    const/16 v8, 0x3d

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 569
    invoke-virtual {v4}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v8

    if-ne v9, v8, :cond_85

    .line 570
    const/16 v8, 0x22

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 571
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 572
    .local v7, "valueBuilder":Ljava/lang/StringBuilder;
    :goto_4c
    invoke-virtual {v4}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v8

    if-eq v9, v8, :cond_78

    .line 573
    invoke-virtual {v4}, Lcom/google/common/net/MediaType$Tokenizer;->previewChar()C

    move-result v8

    if-ne v10, v8, :cond_6e

    .line 574
    const/16 v8, 0x5c

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 575
    sget-object v8, Lcom/google/common/base/CharMatcher;->ASCII:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(Lcom/google/common/base/CharMatcher;)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_66
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_66} :catch_67

    goto :goto_4c

    .line 588
    .end local v0    # "attribute":Ljava/lang/String;
    .end local v2    # "parameters":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "subtype":Ljava/lang/String;
    .end local v5    # "type":Ljava/lang/String;
    .end local v7    # "valueBuilder":Ljava/lang/StringBuilder;
    :catch_67
    move-exception v1

    .line 589
    .local v1, "e":Ljava/lang/IllegalStateException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-direct {v8, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 577
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    .restart local v0    # "attribute":Ljava/lang/String;
    .restart local v2    # "parameters":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "subtype":Ljava/lang/String;
    .restart local v5    # "type":Ljava/lang/String;
    .restart local v7    # "valueBuilder":Ljava/lang/StringBuilder;
    :cond_6e
    :try_start_6e
    sget-object v8, Lcom/google/common/net/MediaType;->QUOTED_TEXT_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4c

    .line 580
    :cond_78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 581
    .local v6, "value":Ljava/lang/String;
    const/16 v8, 0x22

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeCharacter(C)C

    .line 585
    .end local v7    # "valueBuilder":Ljava/lang/StringBuilder;
    :goto_81
    invoke-virtual {v2, v0, v6}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_21

    .line 583
    .end local v6    # "value":Ljava/lang/String;
    :cond_85
    sget-object v8, Lcom/google/common/net/MediaType;->TOKEN_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v4, v8}, Lcom/google/common/net/MediaType$Tokenizer;->consumeToken(Lcom/google/common/base/CharMatcher;)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "value":Ljava/lang/String;
    goto :goto_81

    .line 587
    .end local v0    # "attribute":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_8c
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v8

    invoke-static {v5, v3, v8}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;
    :try_end_93
    .catch Ljava/lang/IllegalStateException; {:try_start_6e .. :try_end_93} :catch_67

    move-result-object v8

    return-object v8
.end method


# virtual methods
.method public charset()Lcom/google/common/base/Optional;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/nio/charset/Charset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 363
    iget-object v1, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    const-string v2, "charset"

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableListMultimap;->get(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    .line 364
    .local v0, "charsetValues":Lcom/google/common/collect/ImmutableSet;, "Lcom/google/common/collect/ImmutableSet<Ljava/lang/String;>;"
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v1

    packed-switch v1, :pswitch_data_40

    .line 370
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Multiple charset values defined: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 366
    :pswitch_2c
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v1

    .line 368
    :goto_30
    return-object v1

    :pswitch_31
    invoke-static {v0}, Lcom/google/common/collect/Iterables;->getOnlyElement(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v1

    goto :goto_30

    .line 364
    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_31
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 641
    if-ne p1, p0, :cond_5

    .line 650
    :cond_4
    :goto_4
    return v1

    .line 643
    :cond_5
    instance-of v3, p1, Lcom/google/common/net/MediaType;

    if-eqz v3, :cond_30

    move-object v0, p1

    .line 644
    check-cast v0, Lcom/google/common/net/MediaType;

    .line 645
    .local v0, "that":Lcom/google/common/net/MediaType;
    iget-object v3, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    iget-object v3, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-direct {p0}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object v3

    invoke-direct {v0}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2e
    move v1, v2

    goto :goto_4

    .end local v0    # "that":Lcom/google/common/net/MediaType;
    :cond_30
    move v1, v2

    .line 650
    goto :goto_4
.end method

.method public hasWildcard()Z
    .registers 3

    .prologue
    .line 432
    const-string v0, "*"

    iget-object v1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    const-string v0, "*"

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 655
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-direct {p0}, Lcom/google/common/net/MediaType;->parametersAsMap()Ljava/util/Map;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public is(Lcom/google/common/net/MediaType;)Z
    .registers 4
    .param p1, "mediaTypeRange"    # Lcom/google/common/net/MediaType;

    .prologue
    .line 462
    iget-object v0, p1, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p1, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    :cond_14
    iget-object v0, p1, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p1, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    :cond_28
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    iget-object v1, p1, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableCollection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_3c

    const/4 v0, 0x1

    :goto_3b
    return v0

    :cond_3c
    const/4 v0, 0x0

    goto :goto_3b
.end method

.method public parameters()Lcom/google/common/collect/ImmutableListMultimap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 342
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    return-object v0
.end method

.method public subtype()Ljava/lang/String;
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 665
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 666
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableListMultimap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_38

    .line 667
    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 668
    iget-object v2, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    new-instance v3, Lcom/google/common/net/MediaType$2;

    invoke-direct {v3, p0}, Lcom/google/common/net/MediaType$2;-><init>(Lcom/google/common/net/MediaType;)V

    invoke-static {v2, v3}, Lcom/google/common/collect/Multimaps;->transformValues(Lcom/google/common/collect/ListMultimap;Lcom/google/common/base/Function;)Lcom/google/common/collect/ListMultimap;

    move-result-object v1

    .line 674
    .local v1, "quotedParameters":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v2, Lcom/google/common/net/MediaType;->PARAMETER_JOINER:Lcom/google/common/base/Joiner$MapJoiner;

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/google/common/base/Joiner$MapJoiner;->appendTo(Ljava/lang/StringBuilder;Ljava/lang/Iterable;)Ljava/lang/StringBuilder;

    .line 676
    .end local v1    # "quotedParameters":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public type()Ljava/lang/String;
    .registers 2

    .prologue
    .line 332
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    return-object v0
.end method

.method public withCharset(Ljava/nio/charset/Charset;)Lcom/google/common/net/MediaType;
    .registers 4
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 426
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    const-string v0, "charset"

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/common/net/MediaType;->withParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public withParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;
    .registers 12
    .param p1, "attribute"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 400
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    invoke-static {p1}, Lcom/google/common/net/MediaType;->normalizeToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 403
    .local v5, "normalizedAttribute":Ljava/lang/String;
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v0

    .line 404
    .local v0, "builder":Lcom/google/common/collect/ImmutableListMultimap$Builder;, "Lcom/google/common/collect/ImmutableListMultimap$Builder<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableListMultimap;->entries()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_38

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 405
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 406
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    .line 407
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v3, v6}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_18

    .line 410
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "key":Ljava/lang/String;
    :cond_38
    invoke-static {v5, p2}, Lcom/google/common/net/MediaType;->normalizeParameterValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    .line 411
    new-instance v4, Lcom/google/common/net/MediaType;

    iget-object v6, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v8

    invoke-direct {v4, v6, v7, v8}, Lcom/google/common/net/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/ImmutableListMultimap;)V

    .line 413
    .local v4, "mediaType":Lcom/google/common/net/MediaType;
    sget-object v6, Lcom/google/common/net/MediaType;->KNOWN_TYPES:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, v4}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/common/net/MediaType;

    return-object v6
.end method

.method public withParameters(Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/net/MediaType;"
        }
    .end annotation

    .prologue
    .line 388
    .local p1, "parameters":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;Lcom/google/common/collect/Multimap;)Lcom/google/common/net/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public withoutParameters()Lcom/google/common/net/MediaType;
    .registers 3

    .prologue
    .line 379
    iget-object v0, p0, Lcom/google/common/net/MediaType;->parameters:Lcom/google/common/collect/ImmutableListMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .end local p0    # "this":Lcom/google/common/net/MediaType;
    :goto_8
    return-object p0

    .restart local p0    # "this":Lcom/google/common/net/MediaType;
    :cond_9
    iget-object v0, p0, Lcom/google/common/net/MediaType;->type:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/common/net/MediaType;->subtype:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/net/MediaType;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/common/net/MediaType;

    move-result-object p0

    goto :goto_8
.end method
