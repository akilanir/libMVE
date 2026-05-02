.class public Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "OlympusMakernoteDirectory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory$CameraSettings;
    }
.end annotation


# static fields
.field public static final TAG_APERTURE_VALUE:I = 0x1002

.field public static final TAG_BLACK_LEVEL:I = 0x1012

.field public static final TAG_BLUE_BIAS:I = 0x1018

.field public static final TAG_BODY_FIRMWARE_VERSION:I = 0x104

.field public static final TAG_BRACKET:I = 0x1006

.field public static final TAG_BRIGHTNESS_VALUE:I = 0x1003

.field public static final TAG_BW_MODE:I = 0x203

.field public static final TAG_CAMERA_ID:I = 0x209

.field public static final TAG_CAMERA_SETTINGS:I = 0x2020

.field public static final TAG_CAMERA_SETTINGS_1:I = 0x1

.field public static final TAG_CAMERA_SETTINGS_2:I = 0x3

.field public static final TAG_CCD_SCAN_MODE:I = 0x1039

.field public static final TAG_COLOR_MATRIX_NUMBER:I = 0x1019

.field public static final TAG_COLOUR_CONTROL:I = 0x102b

.field public static final TAG_COLOUR_MATRIX:I = 0x1011

.field public static final TAG_COLOUR_MODE:I = 0x101

.field public static final TAG_COMPRESSED_IMAGE_SIZE:I = 0x40

.field public static final TAG_COMPRESSION_RATIO:I = 0x1034

.field public static final TAG_CONTRAST:I = 0x1029

.field public static final TAG_CORING_FILTER:I = 0x102d

.field public static final TAG_DATA_DUMP_1:I = 0xf00

.field public static final TAG_DATA_DUMP_2:I = 0xf01

.field public static final TAG_DIGI_ZOOM_RATIO:I = 0x204

.field public static final TAG_EQUIPMENT:I = 0x2010

.field public static final TAG_EXTERNAL_FLASH_BOUNCE:I = 0x1026

.field public static final TAG_EXTERNAL_FLASH_MODE:I = 0x1028

.field public static final TAG_EXTERNAL_FLASH_ZOOM:I = 0x1027

.field public static final TAG_FINAL_HEIGHT:I = 0x102f

.field public static final TAG_FINAL_WIDTH:I = 0x102e

.field public static final TAG_FIRMWARE:I = 0x404

.field public static final TAG_FIRMWARE_VERSION:I = 0x207

.field public static final TAG_FLASH_BIAS:I = 0x1023

.field public static final TAG_FLASH_CHARGE_LEVEL:I = 0x1010

.field public static final TAG_FLASH_DEVICE:I = 0x1005

.field public static final TAG_FLASH_MODE:I = 0x1004

.field public static final TAG_FOCAL_PLANE_DIAGONAL:I = 0x205

.field public static final TAG_FOCUS_DISTANCE:I = 0x100c

.field public static final TAG_FOCUS_INFO:I = 0x2050

.field public static final TAG_FOCUS_MODE:I = 0x100b

.field public static final TAG_FOCUS_RANGE:I = 0x100a

.field public static final TAG_IMAGE_HEIGHT:I = 0x20c

.field public static final TAG_IMAGE_PROCESSING:I = 0x2040

.field public static final TAG_IMAGE_QUALITY_1:I = 0x102

.field public static final TAG_IMAGE_QUALITY_2:I = 0x103

.field public static final TAG_IMAGE_WIDTH:I = 0x20b

.field public static final TAG_INFINITY_LENS_STEP:I = 0x103b

.field public static final TAG_ISO_VALUE:I = 0x1001

.field public static final TAG_JPEG_QUALITY:I = 0x201

.field public static final TAG_LENS_DISTORTION_PARAMETERS:I = 0x206

.field public static final TAG_LENS_TEMPERATURE:I = 0x1008

.field public static final TAG_LIGHT_CONDITION:I = 0x1009

.field public static final TAG_MACRO_FOCUS:I = 0x100e

.field public static final TAG_MACRO_MODE:I = 0x202

.field public static final TAG_MAKERNOTE_VERSION:I = 0x0

.field public static final TAG_MINOLTA_THUMBNAIL_LENGTH:I = 0x89

.field public static final TAG_MINOLTA_THUMBNAIL_OFFSET_1:I = 0x81

.field public static final TAG_MINOLTA_THUMBNAIL_OFFSET_2:I = 0x88

.field public static final TAG_NEAR_LENS_STEP:I = 0x103c

.field public static final TAG_NOISE_REDUCTION:I = 0x103a

.field public static final TAG_ONE_TOUCH_WB:I = 0x302

.field public static final TAG_ORIGINAL_MANUFACTURER_MODEL:I = 0x20d

.field public static final TAG_PICT_INFO:I = 0x208

.field public static final TAG_PREVIEW_IMAGE:I = 0x280

.field public static final TAG_PRE_CAPTURE_FRAMES:I = 0x300

.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_RAW_DEVELOPMENT:I = 0x2030

.field public static final TAG_RAW_DEVELOPMENT_2:I = 0x2031

.field public static final TAG_RAW_INFO:I = 0x3000

.field public static final TAG_RED_BIAS:I = 0x1017

.field public static final TAG_SCENE_MODE:I = 0x403

.field public static final TAG_SENSOR_TEMPERATURE:I = 0x1007

.field public static final TAG_SERIAL_NUMBER:I = 0x101a

.field public static final TAG_SHARPNESS:I = 0x100f

.field public static final TAG_SHARPNESS_FACTOR:I = 0x102a

.field public static final TAG_SHUTTER_SPEED_VALUE:I = 0x1000

.field public static final TAG_SPECIAL_MODE:I = 0x200

.field public static final TAG_THUMBNAIL:I = 0x1035

.field public static final TAG_THUMBNAIL_IMAGE:I = 0x100

.field public static final TAG_THUMBNAIL_LENGTH:I = 0x1037

.field public static final TAG_THUMBNAIL_OFFSET:I = 0x1036

.field public static final TAG_VALID_BITS:I = 0x102c

.field public static final TAG_WHITE_BALANCE:I = 0x1015

.field public static final TAG_WHITE_BALANCE_BIAS:I = 0x304

.field public static final TAG_WHITE_BALANCE_BRACKET:I = 0x303

.field public static final TAG_WHITE_BOARD:I = 0x301

.field public static final TAG_ZOOM:I = 0x100d

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
    .line 286
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 289
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Settings"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Settings"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Compressed Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x81

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x88

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x89

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Image"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x101

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Colour Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x103

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x104

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Body Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Special Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "JPEG Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BW Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DigiZoom Ratio"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focal Plane Diagonal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x206

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Distortion Parameters"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x208

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pict Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x209

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Width"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Height"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Original Manufacturer Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x280

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x300

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pre Capture Frames"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x301

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Board"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x302

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "One Touch WB"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x303

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Bracket"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x304

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x403

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Scene Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x404

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Firmware"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching (PIM) Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xf00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Data Dump"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xf01

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Data Dump 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Shutter Speed Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ISO Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Aperture Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Brightness Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1004

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Device"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Bracket"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1007

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sensor Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1008

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1009

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Light Condition"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Range"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Distance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Zoom"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro Focus"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1010

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Charge Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1011

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Colour Matrix"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Black Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1015

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1017

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Red Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1018

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Blue Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1019

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Matrix Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x101a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1023

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1026

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "External Flash Bounce"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1027

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "External Flash Zoom"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1028

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "External Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1029

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness Factor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Colour Control"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Valid Bits"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Coring Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Final Width"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Final Height"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1034

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Compression Ratio"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1035

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1036

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1037

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1039

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CCD Scan Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x103a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x103b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Infinity Lens Step"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x103c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Near Lens Step"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2010

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Equipment"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2020

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Settings"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2030

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Raw Development"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2031

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Raw Development 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2040

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Processing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2050

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Raw Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf004

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf007

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Shooting Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf008

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Metering Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf009

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Apex Film Speed Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Apex Shutter Speed Time Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Apex Aperture Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Digital Zoom"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Compensation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf00f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Bracket Step"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf011

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Interval Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Interval Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf013

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf014

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Distance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf015

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Fired"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf016

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf017

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf018

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Max Aperture at Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf01b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Number Memory"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf01c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Last File Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf01d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Red"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf01e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Green"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf01f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Blue"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf020

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf021

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf022

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf023

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Subject Program"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf024

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Compensation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf025

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ISO Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf026

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf027

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Interval Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf028

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Folder Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf029

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Black and White Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Internal Flash"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Apex Brightness Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Spot Focus Point X Coordinate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf02f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Spot Focus Point Y Coordinate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf030

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Wide Focus Zone"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf031

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf032

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Area"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xf033

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DEC Switch Position"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 428
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 429
    new-instance v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 430
    return-void
.end method

.method private processCameraSettings([B)V
    .registers 8
    .param p1, "bytes"    # [B

    .prologue
    .line 451
    new-instance v3, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v3, p1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 452
    .local v3, "reader":Lcom/drew/lang/SequentialByteArrayReader;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/drew/lang/SequentialByteArrayReader;->setMotorolaByteOrder(Z)V

    .line 454
    array-length v5, p1

    div-int/lit8 v0, v5, 0x4

    .line 457
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, v0, :cond_21

    .line 458
    :try_start_f
    invoke-virtual {v3}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v4

    .line 459
    .local v4, "value":I
    const v5, 0xf000

    add-int/2addr v5, v2

    invoke-virtual {p0, v5, v4}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->setInt(II)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_1a} :catch_1d

    .line 457
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 461
    .end local v4    # "value":I
    :catch_1d
    move-exception v1

    .line 463
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 465
    .end local v1    # "e":Ljava/io/IOException;
    :cond_21
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 436
    const-string v0, "Olympus Makernote"

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
    .line 477
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public isIntervalMode()Z
    .registers 6

    .prologue
    .line 469
    const v1, 0xf007

    invoke-virtual {p0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 470
    .local v0, "value":Ljava/lang/Long;
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x5

    cmp-long v1, v1, v3

    if-nez v1, :cond_15

    const/4 v1, 0x1

    :goto_14
    return v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public setByteArray(I[B)V
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 442
    const/4 v0, 0x1

    if-eq p1, v0, :cond_6

    const/4 v0, 0x3

    if-ne p1, v0, :cond_a

    .line 443
    :cond_6
    invoke-direct {p0, p2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->processCameraSettings([B)V

    .line 447
    :goto_9
    return-void

    .line 445
    :cond_a
    invoke-super {p0, p1, p2}, Lcom/drew/metadata/Directory;->setByteArray(I[B)V

    goto :goto_9
.end method
