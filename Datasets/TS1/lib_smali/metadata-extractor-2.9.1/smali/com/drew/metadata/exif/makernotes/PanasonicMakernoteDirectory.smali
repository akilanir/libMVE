.class public Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "PanasonicMakernoteDirectory.java"


# static fields
.field public static final TAG_ACCESSORY_TYPE:I = 0x53

.field public static final TAG_ADVANCED_SCENE_MODE:I = 0x3d

.field public static final TAG_AF_AREA_MODE:I = 0xf

.field public static final TAG_AF_ASSIST_LAMP:I = 0x31

.field public static final TAG_AF_POINT_POSITION:I = 0x4d

.field public static final TAG_AUDIO:I = 0x20

.field public static final TAG_BABY_AGE:I = 0x33

.field public static final TAG_BABY_AGE_1:I = 0x8010

.field public static final TAG_BABY_NAME:I = 0x66

.field public static final TAG_BURST_MODE:I = 0x2a

.field public static final TAG_CITY:I = 0x6d

.field public static final TAG_COLOR_EFFECT:I = 0x28

.field public static final TAG_COLOR_MODE:I = 0x32

.field public static final TAG_CONTRAST:I = 0x39

.field public static final TAG_CONTRAST_MODE:I = 0x2c

.field public static final TAG_CONVERSION_LENS:I = 0x35

.field public static final TAG_COUNTRY:I = 0x69

.field public static final TAG_EASY_MODE:I = 0x22

.field public static final TAG_EXIF_VERSION:I = 0x26

.field public static final TAG_FACES_DETECTED:I = 0x3f

.field public static final TAG_FACE_DETECTION_INFO:I = 0x4e

.field public static final TAG_FACE_RECOGNITION_INFO:I = 0x61

.field public static final TAG_FILM_MODE:I = 0x42

.field public static final TAG_FIRMWARE_VERSION:I = 0x2

.field public static final TAG_FLASH_BIAS:I = 0x24

.field public static final TAG_FLASH_FIRED:I = 0x8007

.field public static final TAG_FLASH_WARNING:I = 0x62

.field public static final TAG_FOCUS_MODE:I = 0x7

.field public static final TAG_IMAGE_STABILIZATION:I = 0x1a

.field public static final TAG_INTELLIGENT_EXPOSURE:I = 0x5d

.field public static final TAG_INTELLIGENT_RESOLUTION:I = 0x70

.field public static final TAG_INTERNAL_SERIAL_NUMBER:I = 0x25

.field public static final TAG_LANDMARK:I = 0x6f

.field public static final TAG_LENS_SERIAL_NUMBER:I = 0x52

.field public static final TAG_LENS_TYPE:I = 0x51

.field public static final TAG_LOCATION:I = 0x67

.field public static final TAG_MACRO_MODE:I = 0x1c

.field public static final TAG_MAKERNOTE_VERSION:I = 0x8000

.field public static final TAG_NOISE_REDUCTION:I = 0x2d

.field public static final TAG_OPTICAL_ZOOM_MODE:I = 0x34

.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_PROGRAM_ISO:I = 0x3c

.field public static final TAG_QUALITY_MODE:I = 0x1

.field public static final TAG_RECOGNIZED_FACE_FLAGS:I = 0x63

.field public static final TAG_RECORD_MODE:I = 0x1f

.field public static final TAG_ROTATION:I = 0x30

.field public static final TAG_SATURATION:I = 0x40

.field public static final TAG_SCENE_MODE:I = 0x8001

.field public static final TAG_SELF_TIMER:I = 0x2e

.field public static final TAG_SEQUENCE_NUMBER:I = 0x2b

.field public static final TAG_SHARPNESS:I = 0x41

.field public static final TAG_STATE:I = 0x6b

.field public static final TAG_TEXT_STAMP:I = 0x3b

.field public static final TAG_TEXT_STAMP_1:I = 0x3e

.field public static final TAG_TEXT_STAMP_2:I = 0x8008

.field public static final TAG_TEXT_STAMP_3:I = 0x8009

.field public static final TAG_TITLE:I = 0x65

.field public static final TAG_TRANSFORM:I = 0x59

.field public static final TAG_TRANSFORM_1:I = 0x8012

.field public static final TAG_TRAVEL_DAY:I = 0x36

.field public static final TAG_UNKNOWN_DATA_DUMP:I = 0x21

.field public static final TAG_UPTIME:I = 0x29

.field public static final TAG_WB_ADJUST_AB:I = 0x46

.field public static final TAG_WB_ADJUST_GM:I = 0x47

.field public static final TAG_WB_BLUE_LEVEL:I = 0x8006

.field public static final TAG_WB_GREEN_LEVEL:I = 0x8005

.field public static final TAG_WB_RED_LEVEL:I = 0x8004

.field public static final TAG_WHITE_BALANCE:I = 0x3

.field public static final TAG_WHITE_BALANCE_BIAS:I = 0x23

.field public static final TAG_WORLD_TIME_LOCATION:I = 0x3a

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
    .line 472
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 476
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Area Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Stabilization"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Record Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x25

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Internal Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Unknown Data Dump"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Easy Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x23

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exif Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Effect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x29

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Uptime"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Burst Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sequence Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Self Timer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x30

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Rotation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x31

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Assist Lamp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x33

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Baby Age"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Optical Zoom Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x35

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Conversion Lens"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x36

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Travel Day"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x39

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 506
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "World Time Location"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Text Stamp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Program ISO"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Advanced Scene Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching (PIM) Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Number of Detected Faces"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x41

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x42

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Film Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x46

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Adjust (AB)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x47

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Adjust (GM)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x4d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Af Point Position"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x4e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Face Detection Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x51

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x52

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x53

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Accessory Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x59

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Transform"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x5d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Intelligent Exposure"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x61

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Face Recognition Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x62

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Warning"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x63

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Recognized Face Flags"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x65

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Title"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x66

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Baby Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x67

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Location"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x69

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Country"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x6b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "State"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x6d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "City"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x6f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Landmark"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x70

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Intelligent Resolution"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Scene Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8004

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance (Red)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance (Green)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance (Blue)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8007

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Fired"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Text Stamp 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8008

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Text Stamp 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8009

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Text Stamp 3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8010

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Baby Age 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x8012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Transform 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 549
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 550
    new-instance v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 551
    return-void
.end method


# virtual methods
.method public getAge(I)Lcom/drew/metadata/Age;
    .registers 4
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 640
    invoke-virtual {p0, p1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 641
    .local v0, "ageString":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 642
    const/4 v1, 0x0

    .line 643
    :goto_7
    return-object v1

    :cond_8
    invoke-static {v0}, Lcom/drew/metadata/Age;->fromPanasonicString(Ljava/lang/String;)Lcom/drew/metadata/Age;

    move-result-object v1

    goto :goto_7
.end method

.method public getDetectedFaces()[Lcom/drew/metadata/Face;
    .registers 16
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v14, 0x0

    .line 570
    const/16 v0, 0x4e

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getByteArray(I)[B

    move-result-object v7

    .line 571
    .local v7, "bytes":[B
    if-nez v7, :cond_c

    move-object v10, v14

    .line 594
    :cond_b
    :goto_b
    return-object v10

    .line 574
    :cond_c
    new-instance v13, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v13, v7}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 575
    .local v13, "reader":Lcom/drew/lang/RandomAccessReader;
    invoke-virtual {v13, v1}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 578
    const/4 v0, 0x0

    :try_start_15
    invoke-virtual {v13, v0}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v9

    .line 579
    .local v9, "faceCount":I
    if-nez v9, :cond_1d

    move-object v10, v14

    .line 580
    goto :goto_b

    .line 581
    :cond_1d
    new-array v10, v9, [Lcom/drew/metadata/Face;

    .line 583
    .local v10, "faces":[Lcom/drew/metadata/Face;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_20
    if-ge v11, v9, :cond_b

    .line 584
    mul-int/lit8 v0, v11, 0x8

    add-int/lit8 v12, v0, 0x2

    .line 585
    .local v12, "offset":I
    new-instance v0, Lcom/drew/metadata/Face;

    invoke-virtual {v13, v12}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v1

    add-int/lit8 v2, v12, 0x2

    invoke-virtual {v13, v2}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    add-int/lit8 v3, v12, 0x4

    invoke-virtual {v13, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    add-int/lit8 v4, v12, 0x6

    invoke-virtual {v13, v4}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/drew/metadata/Face;-><init>(IIIILjava/lang/String;Lcom/drew/metadata/Age;)V

    aput-object v0, v10, v11
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_45} :catch_48

    .line 583
    add-int/lit8 v11, v11, 0x1

    goto :goto_20

    .line 593
    .end local v9    # "faceCount":I
    .end local v10    # "faces":[Lcom/drew/metadata/Face;
    .end local v11    # "i":I
    .end local v12    # "offset":I
    :catch_48
    move-exception v8

    .local v8, "e":Ljava/io/IOException;
    move-object v10, v14

    .line 594
    goto :goto_b
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 557
    const-string v0, "Panasonic Makernote"

    return-object v0
.end method

.method public getRecognizedFaces()[Lcom/drew/metadata/Face;
    .registers 16
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 601
    const/16 v0, 0x61

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getByteArray(I)[B

    move-result-object v8

    .line 602
    .local v8, "bytes":[B
    if-nez v8, :cond_a

    .line 603
    const/4 v11, 0x0

    .line 628
    :cond_9
    :goto_9
    return-object v11

    .line 605
    :cond_a
    new-instance v14, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v14, v8}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 606
    .local v14, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Lcom/drew/lang/RandomAccessReader;->setMotorolaByteOrder(Z)V

    .line 609
    const/4 v0, 0x0

    :try_start_14
    invoke-virtual {v14, v0}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v10

    .line 610
    .local v10, "faceCount":I
    if-nez v10, :cond_1c

    .line 611
    const/4 v11, 0x0

    goto :goto_9

    .line 612
    :cond_1c
    new-array v11, v10, [Lcom/drew/metadata/Face;

    .line 614
    .local v11, "faces":[Lcom/drew/metadata/Face;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1f
    if-ge v12, v10, :cond_9

    .line 615
    mul-int/lit8 v0, v12, 0x2c

    add-int/lit8 v13, v0, 0x4

    .line 616
    .local v13, "offset":I
    const/16 v0, 0x14

    const-string v1, "ASCII"

    invoke-virtual {v14, v13, v0, v1}, Lcom/drew/lang/RandomAccessReader;->getString(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 617
    .local v5, "name":Ljava/lang/String;
    add-int/lit8 v0, v13, 0x1c

    const/16 v1, 0x14

    const-string v2, "ASCII"

    invoke-virtual {v14, v0, v1, v2}, Lcom/drew/lang/RandomAccessReader;->getString(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 618
    .local v7, "age":Ljava/lang/String;
    new-instance v0, Lcom/drew/metadata/Face;

    add-int/lit8 v1, v13, 0x14

    invoke-virtual {v14, v1}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v1

    add-int/lit8 v2, v13, 0x16

    invoke-virtual {v14, v2}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    add-int/lit8 v3, v13, 0x18

    invoke-virtual {v14, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    add-int/lit8 v4, v13, 0x1a

    invoke-virtual {v14, v4}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v4

    invoke-static {v7}, Lcom/drew/metadata/Age;->fromPanasonicString(Ljava/lang/String;)Lcom/drew/metadata/Age;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/drew/metadata/Face;-><init>(IIIILjava/lang/String;Lcom/drew/metadata/Age;)V

    aput-object v0, v11, v12
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_62} :catch_65

    .line 614
    add-int/lit8 v12, v12, 0x1

    goto :goto_1f

    .line 627
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "age":Ljava/lang/String;
    .end local v10    # "faceCount":I
    .end local v11    # "faces":[Lcom/drew/metadata/Face;
    .end local v12    # "i":I
    .end local v13    # "offset":I
    :catch_65
    move-exception v9

    .line 628
    .local v9, "e":Ljava/io/IOException;
    const/4 v11, 0x0

    goto :goto_9
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
    .line 564
    sget-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
