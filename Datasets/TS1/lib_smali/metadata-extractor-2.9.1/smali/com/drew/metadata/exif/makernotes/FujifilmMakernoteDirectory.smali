.class public Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "FujifilmMakernoteDirectory.java"


# static fields
.field public static final TAG_AUTO_BRACKETING:I = 0x1100

.field public static final TAG_AUTO_DYNAMIC_RANGE:I = 0x140b

.field public static final TAG_AUTO_EXPOSURE_WARNING:I = 0x1302

.field public static final TAG_BLUR_WARNING:I = 0x1300

.field public static final TAG_COLOR_SATURATION:I = 0x1003

.field public static final TAG_COLOR_TEMPERATURE:I = 0x1005

.field public static final TAG_CONTRAST:I = 0x1006

.field public static final TAG_DEVELOPMENT_DYNAMIC_RANGE:I = 0x1403

.field public static final TAG_DYNAMIC_RANGE:I = 0x1400

.field public static final TAG_DYNAMIC_RANGE_SETTING:I = 0x1402

.field public static final TAG_EXR_AUTO:I = 0x1033

.field public static final TAG_EXR_MODE:I = 0x1034

.field public static final TAG_FACES_DETECTED:I = 0x4100

.field public static final TAG_FACE_POSITIONS:I = 0x4103

.field public static final TAG_FACE_REC_INFO:I = 0x4282

.field public static final TAG_FILE_SOURCE:I = 0x8000

.field public static final TAG_FILM_MODE:I = 0x1401

.field public static final TAG_FINE_PIX_COLOR:I = 0x1210

.field public static final TAG_FLASH_EV:I = 0x1011

.field public static final TAG_FLASH_MODE:I = 0x1010

.field public static final TAG_FOCUS_MODE:I = 0x1021

.field public static final TAG_FOCUS_PIXEL:I = 0x1023

.field public static final TAG_FOCUS_WARNING:I = 0x1301

.field public static final TAG_FRAME_NUMBER:I = 0x8003

.field public static final TAG_GE_IMAGE_SIZE:I = 0x1304

.field public static final TAG_HIGH_ISO_NOISE_REDUCTION:I = 0x100e

.field public static final TAG_MACRO:I = 0x1020

.field public static final TAG_MAKERNOTE_VERSION:I = 0x0

.field public static final TAG_MAX_APERTURE_AT_MAX_FOCAL:I = 0x1407

.field public static final TAG_MAX_APERTURE_AT_MIN_FOCAL:I = 0x1406

.field public static final TAG_MAX_FOCAL_LENGTH:I = 0x1405

.field public static final TAG_MIN_FOCAL_LENGTH:I = 0x1404

.field public static final TAG_NOISE_REDUCTION:I = 0x100b

.field public static final TAG_ORDER_NUMBER:I = 0x8002

.field public static final TAG_PARALLAX:I = 0xb211

.field public static final TAG_PICTURE_MODE:I = 0x1031

.field public static final TAG_QUALITY:I = 0x1000

.field public static final TAG_SEQUENCE_NUMBER:I = 0x1101

.field public static final TAG_SERIAL_NUMBER:I = 0x10

.field public static final TAG_SHARPNESS:I = 0x1001

.field public static final TAG_SLOW_SYNC:I = 0x1030

.field public static final TAG_TONE:I = 0x1004

.field public static final TAG_WHITE_BALANCE:I = 0x1002

.field public static final TAG_WHITE_BALANCE_FINE_TUNE:I = 0x100a

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
    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 102
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1004

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Tone (Contrast)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Fine Tune"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "High ISO Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1010

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1011

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Strength"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1020

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1021

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1023

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Pixel"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1030

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Slow Sync"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1031

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1033

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "EXR Auto"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1034

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "EXR Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Auto Bracketing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1101

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sequence Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1210

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FinePix Color Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1300

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Blur Warning"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1301

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Warning"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1302

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AE Warning"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1304

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GE Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1400

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dynamic Range"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1401

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Film Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1402

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dynamic Range Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1403

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Development Dynamic Range"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1404

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Minimum Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1405

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Maximum Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1406

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Maximum Aperture at Minimum Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1407

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Maximum Aperture at Maximum Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x140b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Auto Dynamic Range"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x4100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Faces Detected"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x4103

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Face Positions"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x4282

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Face Detection Data"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Source"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Order Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Frame Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb211

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Parallax"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 163
    new-instance v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 164
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 170
    const-string v0, "Fujifilm Makernote"

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
    .line 177
    sget-object v0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
