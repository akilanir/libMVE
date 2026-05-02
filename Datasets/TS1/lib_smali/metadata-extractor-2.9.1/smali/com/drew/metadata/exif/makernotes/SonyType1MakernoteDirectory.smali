.class public Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "SonyType1MakernoteDirectory.java"


# static fields
.field public static final TAG_AF_ILLUMINATOR:I = 0xb044

.field public static final TAG_AF_MODE:I = 0xb043

.field public static final TAG_AF_POINT_SELECTED:I = 0x201e

.field public static final TAG_ANTI_BLUR:I = 0xb04b

.field public static final TAG_AUTO_PORTRAIT_FRAMED:I = 0x2016

.field public static final TAG_BRIGHTNESS:I = 0x2007

.field public static final TAG_CAMERA_INFO:I = 0x10

.field public static final TAG_CAMERA_SETTINGS:I = 0x114

.field public static final TAG_COLOR_COMPENSATION_FILTER:I = 0xb022

.field public static final TAG_COLOR_MODE:I = 0xb029

.field public static final TAG_COLOR_MODE_SETTING:I = 0xb020

.field public static final TAG_COLOR_TEMPERATURE:I = 0xb021

.field public static final TAG_CONTRAST:I = 0x2004

.field public static final TAG_DISTORTION_CORRECTION:I = 0x2013

.field public static final TAG_DYNAMIC_RANGE_OPTIMISER:I = 0xb025

.field public static final TAG_DYNAMIC_RANGE_OPTIMIZER:I = 0xb04f

.field public static final TAG_EXPOSURE_MODE:I = 0xb041

.field public static final TAG_EXTRA_INFO:I = 0x116

.field public static final TAG_FILE_FORMAT:I = 0xb000

.field public static final TAG_FLASH_EXPOSURE_COMP:I = 0x104

.field public static final TAG_FLASH_LEVEL:I = 0xb048

.field public static final TAG_FOCUS_INFO:I = 0x20

.field public static final TAG_FOCUS_MODE:I = 0x201b

.field public static final TAG_FOCUS_MODE_2:I = 0xb042

.field public static final TAG_FULL_IMAGE_SIZE:I = 0xb02b

.field public static final TAG_HDR:I = 0x200a

.field public static final TAG_HIGH_ISO_NOISE_REDUCTION:I = 0x2009

.field public static final TAG_HIGH_ISO_NOISE_REDUCTION_2:I = 0xb050

.field public static final TAG_IMAGE_QUALITY:I = 0x102

.field public static final TAG_IMAGE_STABILISATION:I = 0xb026

.field public static final TAG_INTELLIGENT_AUTO:I = 0xb052

.field public static final TAG_JPEG_QUALITY:I = 0xb047

.field public static final TAG_LATERAL_CHROMATIC_ABERRATION:I = 0x2012

.field public static final TAG_LENS_ID:I = 0xb027

.field public static final TAG_LENS_SPEC:I = 0xb02a

.field public static final TAG_LONG_EXPOSURE_NOISE_REDUCTION:I = 0x2008

.field public static final TAG_LONG_EXPOSURE_NOISE_REDUCTION_OR_FOCUS_MODE:I = 0xb04e

.field public static final TAG_MACRO:I = 0xb040

.field public static final TAG_MINOLTA_MAKERNOTE:I = 0xb028

.field public static final TAG_MULTI_BURST_IMAGE_HEIGHT:I = 0x1002

.field public static final TAG_MULTI_BURST_IMAGE_WIDTH:I = 0x1001

.field public static final TAG_MULTI_BURST_MODE:I = 0x1000

.field public static final TAG_MULTI_FRAME_NOISE_REDUCTION:I = 0x200b

.field public static final TAG_NO_PRINT:I = 0xffff

.field public static final TAG_PANORAMA:I = 0x1003

.field public static final TAG_PICTURE_EFFECT:I = 0x200e

.field public static final TAG_PREVIEW_IMAGE:I = 0x2001

.field public static final TAG_PREVIEW_IMAGE_SIZE:I = 0xb02c

.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_RATING:I = 0x2002

.field public static final TAG_RELEASE_MODE:I = 0xb049

.field public static final TAG_SATURATION:I = 0x2005

.field public static final TAG_SCENE_MODE:I = 0xb023

.field public static final TAG_SEQUENCE_NUMBER:I = 0xb04a

.field public static final TAG_SHARPNESS:I = 0x2006

.field public static final TAG_SHOT_INFO:I = 0x3000

.field public static final TAG_SOFT_SKIN_EFFECT:I = 0x200f

.field public static final TAG_SONY_MODEL_ID:I = 0xb001

.field public static final TAG_TELECONVERTER:I = 0x105

.field public static final TAG_VIGNETTING_CORRECTION:I = 0x2011

.field public static final TAG_WB_SHIFT_AMBER_MAGENTA:I = 0x2014

.field public static final TAG_WHITE_BALANCE:I = 0x115

.field public static final TAG_WHITE_BALANCE_2:I = 0xb054

.field public static final TAG_WHITE_BALANCE_FINE_TUNE:I = 0x112

.field public static final TAG_ZONE_MATCHING:I = 0xb024

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
    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 132
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x104

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Exposure Compensation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x105

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Teleconverter Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x112

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Fine Tune Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x114

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Settings"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x115

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x116

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extra Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Multi Burst Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Multi Burst Image Width"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Multi Burst Image Height"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Panorama"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Rating"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2004

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2007

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Brightness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2008

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Long Exposure Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2009

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "High ISO Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "HDR"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Multi Frame Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Effect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Soft Skin Effect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2011

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Vignetting Correction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lateral Chromatic Aberration"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2013

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Distortion Correction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2014

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "WB Shift Amber/Magenta"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2016

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Auto Portrait Framing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Point Selected"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Shot Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Format"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sony Model ID"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb020

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Mode Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb021

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb022

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Compensation Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb023

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Scene Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb024

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Zone Matching"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb025

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dynamic Range Optimizer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb026

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Stabilisation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb027

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens ID"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb028

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Minolta Makernote"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb029

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb02a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Spec"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb02b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Full Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb02c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb040

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb041

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb042

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb043

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb044

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Illuminator"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb047

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb048

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb049

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Release Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb04a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sequence Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb04b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Anti Blur"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb04e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Long Exposure Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb04f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dynamic Range Optimizer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb050

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "High ISO Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb052

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Intelligent Auto"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xb054

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0xffff

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "No Print"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 212
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 213
    new-instance v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 214
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 220
    const-string v0, "Sony Makernote"

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
    .line 227
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
