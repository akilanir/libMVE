.class public Lcom/drew/metadata/xmp/XmpDirectory;
.super Lcom/drew/metadata/Directory;
.source "XmpDirectory.java"


# static fields
.field public static final TAG_APERTURE_VALUE:I = 0xb

.field public static final TAG_BASE_URL:I = 0x201

.field public static final TAG_CAMERA_SERIAL_NUMBER:I = 0x8

.field public static final TAG_CREATE_DATE:I = 0x202

.field public static final TAG_CREATOR_TOOL:I = 0x203

.field public static final TAG_DATETIME_DIGITIZED:I = 0xe

.field public static final TAG_DATETIME_ORIGINAL:I = 0xd

.field public static final TAG_EXPOSURE_PROGRAM:I = 0xc

.field public static final TAG_EXPOSURE_TIME:I = 0x3

.field public static final TAG_FIRMWARE:I = 0x9

.field public static final TAG_FOCAL_LENGTH:I = 0xa

.field public static final TAG_F_NUMBER:I = 0x5

.field public static final TAG_IDENTIFIER:I = 0x204

.field public static final TAG_LABEL:I = 0x2000

.field public static final TAG_LENS:I = 0x7

.field public static final TAG_LENS_INFO:I = 0x6

.field public static final TAG_MAKE:I = 0x1

.field public static final TAG_METADATA_DATE:I = 0x205

.field public static final TAG_MODEL:I = 0x2

.field public static final TAG_MODIFY_DATE:I = 0x206

.field public static final TAG_NICKNAME:I = 0x207

.field public static final TAG_RATING:I = 0x1001

.field public static final TAG_SHUTTER_SPEED:I = 0x4

.field public static TAG_SUBJECT:I = 0x0

.field public static final TAG_XMP_VALUE_COUNT:I = 0xffff

.field protected static final _tagNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final _tagPropNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final _tagSchemaMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final _propertyValueByPath:Ljava/util/Map;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _xmpMeta:Lcom/adobe/xmp/XMPMeta;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 88
    const/16 v0, 0x2001

    sput v0, Lcom/drew/metadata/xmp/XmpDirectory;->TAG_SUBJECT:I

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    .line 119
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xffff

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "XMP Value Count"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Make"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Shutter Speed Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "F-Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Information"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Firmware"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Aperture Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Program"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date/Time Original"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date/Time Digitized"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Base URL"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Create Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Creator Tool"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Metadata Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x206

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Modify Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Rating"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Label"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    sget v1, Lcom/drew/metadata/xmp/XmpDirectory;->TAG_SUBJECT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Subject"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "tiff:Make"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "tiff:Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:ExposureTime"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:ShutterSpeedValue"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:FNumber"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "aux:LensInfo"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "aux:Lens"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "aux:SerialNumber"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "aux:Firmware"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:FocalLength"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:ApertureValue"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:ExposureProgram"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:DateTimeOriginal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "exif:DateTimeDigitized"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:BaseURL"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:CreateDate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:CreatorTool"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:MetadataDate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x206

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:ModifyDate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:Nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:Rating"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "xmp:Label"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    sget v1, Lcom/drew/metadata/xmp/XmpDirectory;->TAG_SUBJECT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "dc:subject"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/tiff/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/tiff/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x206

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    const/16 v1, 0x2000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    sget v1, Lcom/drew/metadata/xmp/XmpDirectory;->TAG_SUBJECT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http://purl.org/dc/elements/1.1/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 270
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 115
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_propertyValueByPath:Ljava/util/Map;

    .line 271
    new-instance v0, Lcom/drew/metadata/xmp/XmpDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/xmp/XmpDescriptor;-><init>(Lcom/drew/metadata/xmp/XmpDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/xmp/XmpDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 272
    return-void
.end method


# virtual methods
.method addProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 290
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_propertyValueByPath:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    return-void
.end method

.method public deleteProperty(I)V
    .registers 6
    .param p1, "tagType"    # I

    .prologue
    .line 460
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v2

    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Lcom/adobe/xmp/XMPMeta;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 278
    const-string v0, "XMP"

    return-object v0
.end method

.method protected getTagNameMap()Ljava/util/HashMap;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 285
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public getXMPMeta()Lcom/adobe/xmp/XMPMeta;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_xmpMeta:Lcom/adobe/xmp/XMPMeta;

    if-nez v0, :cond_b

    .line 331
    new-instance v0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>()V

    iput-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_xmpMeta:Lcom/adobe/xmp/XMPMeta;

    .line 332
    :cond_b
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_xmpMeta:Lcom/adobe/xmp/XMPMeta;

    return-object v0
.end method

.method public getXmpProperties()Ljava/util/Map;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_propertyValueByPath:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public setXMPMeta(Lcom/adobe/xmp/XMPMeta;)V
    .registers 6
    .param p1, "xmpMeta"    # Lcom/adobe/xmp/XMPMeta;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 307
    iput-object p1, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_xmpMeta:Lcom/adobe/xmp/XMPMeta;

    .line 310
    const/4 v2, 0x0

    .line 311
    .local v2, "valueCount":I
    :try_start_3
    iget-object v3, p0, Lcom/drew/metadata/xmp/XmpDirectory;->_xmpMeta:Lcom/adobe/xmp/XMPMeta;

    invoke-interface {v3}, Lcom/adobe/xmp/XMPMeta;->iterator()Lcom/adobe/xmp/XMPIterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 312
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/properties/XMPPropertyInfo;

    .line 313
    .local v1, "prop":Lcom/adobe/xmp/properties/XMPPropertyInfo;
    invoke-interface {v1}, Lcom/adobe/xmp/properties/XMPPropertyInfo;->getPath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    .line 315
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 318
    .end local v1    # "prop":Lcom/adobe/xmp/properties/XMPPropertyInfo;
    :cond_1e
    const v3, 0xffff

    invoke-virtual {p0, v3, v2}, Lcom/drew/metadata/xmp/XmpDirectory;->setInt(II)V
    :try_end_24
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_24} :catch_25

    .line 321
    .end local v0    # "i":Ljava/util/Iterator;
    :goto_24
    return-void

    .line 319
    :catch_25
    move-exception v3

    goto :goto_24
.end method

.method public updateBoolean(IZ)V
    .registers 8
    .param p1, "tagType"    # I
    .param p2, "value"    # Z

    .prologue
    .line 487
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setBoolean(IZ)V

    .line 490
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v1, v2, p2}, Lcom/adobe/xmp/XMPMeta;->setPropertyBoolean(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_22
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_22} :catch_23

    .line 496
    :goto_22
    return-void

    .line 492
    :catch_23
    move-exception v0

    .line 494
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_22
.end method

.method public updateDate(ILjava/util/Date;)V
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/util/Date;

    .prologue
    .line 513
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/drew/metadata/xmp/XmpDirectory;->updateDate(ILjava/util/Date;Ljava/util/TimeZone;)V

    .line 514
    return-void
.end method

.method public updateDate(ILjava/util/Date;Ljava/util/TimeZone;)V
    .registers 10
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 518
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setDate(ILjava/util/Date;)V

    .line 519
    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p2, p3}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Date;Ljava/util/TimeZone;)V

    .line 522
    .local v0, "date":Lcom/adobe/xmp/XMPDateTime;
    :try_start_8
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v4

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4, v2, v3, v0}, Lcom/adobe/xmp/XMPMeta;->setPropertyDate(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/XMPDateTime;)V
    :try_end_27
    .catch Lcom/adobe/xmp/XMPException; {:try_start_8 .. :try_end_27} :catch_28

    .line 528
    :goto_27
    return-void

    .line 524
    :catch_28
    move-exception v1

    .line 526
    .local v1, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v1}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_27
.end method

.method public updateDouble(ID)V
    .registers 9
    .param p1, "tagType"    # I
    .param p2, "value"    # D

    .prologue
    .line 412
    invoke-super {p0, p1, p2, p3}, Lcom/drew/metadata/Directory;->setDouble(ID)V

    .line 415
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v1, v2, p2, p3}, Lcom/adobe/xmp/XMPMeta;->setPropertyDouble(Ljava/lang/String;Ljava/lang/String;D)V
    :try_end_22
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_22} :catch_23

    .line 421
    :goto_22
    return-void

    .line 417
    :catch_23
    move-exception v0

    .line 419
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_22
.end method

.method public updateDoubleArray(I[D)V
    .registers 15
    .param p1, "tagType"    # I
    .param p2, "doubles"    # [D

    .prologue
    .line 425
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setDoubleArray(I[D)V

    .line 428
    :try_start_3
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 429
    .local v1, "schemaNS":Ljava/lang/String;
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 431
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-interface {v0, v1, v2}, Lcom/adobe/xmp/XMPMeta;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    .line 434
    .local v3, "po":Lcom/adobe/xmp/options/PropertyOptions;
    move-object v6, p2

    .local v6, "arr$":[D
    array-length v11, v6

    .local v11, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_2f
    if-ge v8, v11, :cond_46

    aget-wide v9, v6, v8

    .line 436
    .local v9, "item":D
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/xmp/XMPMeta;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    :try_end_3f
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_3f} :catch_42

    .line 434
    add-int/lit8 v8, v8, 0x1

    goto :goto_2f

    .line 439
    .end local v1    # "schemaNS":Ljava/lang/String;
    .end local v2    # "propName":Ljava/lang/String;
    .end local v3    # "po":Lcom/adobe/xmp/options/PropertyOptions;
    .end local v6    # "arr$":[D
    .end local v8    # "i$":I
    .end local v9    # "item":D
    .end local v11    # "len$":I
    :catch_42
    move-exception v7

    .line 441
    .local v7, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v7}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    .line 443
    .end local v7    # "e":Lcom/adobe/xmp/XMPException;
    :cond_46
    return-void
.end method

.method public updateFloat(IF)V
    .registers 9
    .param p1, "tagType"    # I
    .param p2, "value"    # F

    .prologue
    .line 377
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setFloat(IF)V

    .line 380
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    float-to-double v4, p2

    invoke-interface {v3, v1, v2, v4, v5}, Lcom/adobe/xmp/XMPMeta;->setPropertyDouble(Ljava/lang/String;Ljava/lang/String;D)V
    :try_end_23
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_23} :catch_24

    .line 386
    :goto_23
    return-void

    .line 382
    :catch_24
    move-exception v0

    .line 384
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_23
.end method

.method public updateFloatArray(I[F)V
    .registers 14
    .param p1, "tagType"    # I
    .param p2, "floats"    # [F

    .prologue
    .line 390
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setFloatArray(I[F)V

    .line 393
    :try_start_3
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 394
    .local v1, "schemaNS":Ljava/lang/String;
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 396
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-interface {v0, v1, v2}, Lcom/adobe/xmp/XMPMeta;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    .line 399
    .local v3, "po":Lcom/adobe/xmp/options/PropertyOptions;
    move-object v6, p2

    .local v6, "arr$":[F
    array-length v10, v6

    .local v10, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_2f
    if-ge v8, v10, :cond_46

    aget v9, v6, v8

    .line 401
    .local v9, "item":F
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-static {v9}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/xmp/XMPMeta;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    :try_end_3f
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_3f} :catch_42

    .line 399
    add-int/lit8 v8, v8, 0x1

    goto :goto_2f

    .line 404
    .end local v1    # "schemaNS":Ljava/lang/String;
    .end local v2    # "propName":Ljava/lang/String;
    .end local v3    # "po":Lcom/adobe/xmp/options/PropertyOptions;
    .end local v6    # "arr$":[F
    .end local v8    # "i$":I
    .end local v9    # "item":F
    .end local v10    # "len$":I
    :catch_42
    move-exception v7

    .line 406
    .local v7, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v7}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    .line 408
    .end local v7    # "e":Lcom/adobe/xmp/XMPException;
    :cond_46
    return-void
.end method

.method public updateInt(II)V
    .registers 8
    .param p1, "tagType"    # I
    .param p2, "value"    # I

    .prologue
    .line 342
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 345
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v1, v2, p2}, Lcom/adobe/xmp/XMPMeta;->setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_22
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_22} :catch_23

    .line 351
    :goto_22
    return-void

    .line 347
    :catch_23
    move-exception v0

    .line 349
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_22
.end method

.method public updateIntArray(I[I)V
    .registers 14
    .param p1, "tagType"    # I
    .param p2, "ints"    # [I

    .prologue
    .line 355
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setIntArray(I[I)V

    .line 358
    :try_start_3
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 359
    .local v1, "schemaNS":Ljava/lang/String;
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 361
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-interface {v0, v1, v2}, Lcom/adobe/xmp/XMPMeta;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    .line 364
    .local v3, "po":Lcom/adobe/xmp/options/PropertyOptions;
    move-object v6, p2

    .local v6, "arr$":[I
    array-length v10, v6

    .local v10, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_2f
    if-ge v8, v10, :cond_46

    aget v9, v6, v8

    .line 366
    .local v9, "item":I
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/xmp/XMPMeta;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    :try_end_3f
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_3f} :catch_42

    .line 364
    add-int/lit8 v8, v8, 0x1

    goto :goto_2f

    .line 369
    .end local v1    # "schemaNS":Ljava/lang/String;
    .end local v2    # "propName":Ljava/lang/String;
    .end local v3    # "po":Lcom/adobe/xmp/options/PropertyOptions;
    .end local v6    # "arr$":[I
    .end local v8    # "i$":I
    .end local v9    # "item":I
    .end local v10    # "len$":I
    :catch_42
    move-exception v7

    .line 371
    .local v7, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v7}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    .line 373
    .end local v7    # "e":Lcom/adobe/xmp/XMPException;
    :cond_46
    return-void
.end method

.method public updateLong(IJ)V
    .registers 9
    .param p1, "tagType"    # I
    .param p2, "value"    # J

    .prologue
    .line 500
    invoke-super {p0, p1, p2, p3}, Lcom/drew/metadata/Directory;->setLong(IJ)V

    .line 503
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v1, v2, p2, p3}, Lcom/adobe/xmp/XMPMeta;->setPropertyLong(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_22
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_22} :catch_23

    .line 509
    :goto_22
    return-void

    .line 505
    :catch_23
    move-exception v0

    .line 507
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_22
.end method

.method public updateString(ILjava/lang/String;)V
    .registers 8
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 447
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    .line 450
    :try_start_3
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v3

    sget-object v1, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v1, v2, p2}, Lcom/adobe/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_22
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_22} :catch_23

    .line 456
    :goto_22
    return-void

    .line 452
    :catch_23
    move-exception v0

    .line 454
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    goto :goto_22
.end method

.method public updateStringArray(I[Ljava/lang/String;)V
    .registers 13
    .param p1, "tagType"    # I
    .param p2, "strings"    # [Ljava/lang/String;

    .prologue
    .line 465
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setStringArray(I[Ljava/lang/String;)V

    .line 468
    :try_start_3
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 469
    .local v1, "schemaNS":Ljava/lang/String;
    sget-object v0, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 471
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    invoke-interface {v0, v1, v2}, Lcom/adobe/xmp/XMPMeta;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    .line 474
    .local v3, "po":Lcom/adobe/xmp/options/PropertyOptions;
    move-object v6, p2

    .local v6, "arr$":[Ljava/lang/String;
    array-length v9, v6

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_2f
    if-ge v8, v9, :cond_42

    aget-object v4, v6, v8

    .line 476
    .local v4, "item":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDirectory;->getXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/xmp/XMPMeta;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    :try_end_3b
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_3b} :catch_3e

    .line 474
    add-int/lit8 v8, v8, 0x1

    goto :goto_2f

    .line 479
    .end local v1    # "schemaNS":Ljava/lang/String;
    .end local v2    # "propName":Ljava/lang/String;
    .end local v3    # "po":Lcom/adobe/xmp/options/PropertyOptions;
    .end local v4    # "item":Ljava/lang/String;
    .end local v6    # "arr$":[Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    :catch_3e
    move-exception v7

    .line 481
    .local v7, "e":Lcom/adobe/xmp/XMPException;
    invoke-virtual {v7}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    .line 483
    .end local v7    # "e":Lcom/adobe/xmp/XMPException;
    :cond_42
    return-void
.end method
