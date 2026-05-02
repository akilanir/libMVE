.class public Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "SanyoMakernoteDirectory.java"


# static fields
.field public static final TAG_CAMERA_ID:I = 0x209

.field public static final TAG_COLOR_ADJUSTMENT_MODE:I = 0x210

.field public static final TAG_DATA_DUMP:I = 0xf00

.field public static final TAG_DIGITAL_ZOOM:I = 0x204

.field public static final TAG_DIGITAL_ZOOM_ON:I = 0x21b

.field public static final TAG_FLASH_MODE:I = 0x225

.field public static final TAG_FLICKER_REDUCE:I = 0x218

.field public static final TAG_LIGHT_SOURCE_SPECIAL:I = 0x21d

.field public static final TAG_MACRO:I = 0x202

.field public static final TAG_MAKERNOTE_OFFSET:I = 0xff

.field public static final TAG_MANUAL_FOCUS_DISTANCE_OR_FACE_INFO:I = 0x223

.field public static final TAG_OPTICAL_ZOOM_ON:I = 0x219

.field public static final TAG_PICT_INFO:I = 0x208

.field public static final TAG_PRINT_IM:I = 0xe00

.field public static final TAG_QUICK_SHOT:I = 0x213

.field public static final TAG_RECORD_SHUTTER_RELEASE:I = 0x217

.field public static final TAG_RESAVED:I = 0x21e

.field public static final TAG_SANYO_QUALITY:I = 0x201

.field public static final TAG_SANYO_THUMBNAIL:I = 0x100

.field public static final TAG_SCENE_SELECT:I = 0x21f

.field public static final TAG_SELF_TIMER:I = 0x214

.field public static final TAG_SEQUENCE_SHOT_INTERVAL:I = 0x224

.field public static final TAG_SEQUENTIAL_SHOT:I = 0x20e

.field public static final TAG_SOFTWARE_VERSION:I = 0x207

.field public static final TAG_SPECIAL_MODE:I = 0x200

.field public static final TAG_VOICE_MEMO:I = 0x216

.field public static final TAG_WIDE_RANGE:I = 0x20f

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


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 74
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xff

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sanyo Thumbnail"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Special Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sanyo Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Digital Zoom"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Software Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x208

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pict Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x209

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera ID"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sequential Shot"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Wide Range"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x210

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Adjustment Node"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x213

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quick Shot"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x214

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Self Timer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x216

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Voice Memo"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x217

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Record Shutter Release"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x218

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flicker Reduce"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x219

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Optical Zoom On"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Digital Zoom On"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Light Source Special"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Resaved"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Scene Select"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x223

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Manual Focus Distance or Face Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x224

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sequence Shot Interval"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x225

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print IM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xf00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Data Dump"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 109
    new-instance v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 110
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 116
    const-string v0, "Sanyo Makernote"

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
    .line 123
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
