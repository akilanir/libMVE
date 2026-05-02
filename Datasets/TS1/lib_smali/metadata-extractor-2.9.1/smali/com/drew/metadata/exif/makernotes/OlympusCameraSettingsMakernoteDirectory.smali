.class public Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "OlympusCameraSettingsMakernoteDirectory.java"


# static fields
.field public static final TagAeLock:I = 0x201

.field public static final TagAfAreas:I = 0x304

.field public static final TagAfFineTune:I = 0x306

.field public static final TagAfFineTuneAdj:I = 0x307

.field public static final TagAfPointSelected:I = 0x305

.field public static final TagAfSearch:I = 0x303

.field public static final TagArtFilter:I = 0x529

.field public static final TagArtFilterEffect:I = 0x52f

.field public static final TagCameraSettingsVersion:I = 0x0

.field public static final TagColorSpace:I = 0x507

.field public static final TagCompressionFactor:I = 0x50d

.field public static final TagContrastSetting:I = 0x505

.field public static final TagCustomSaturation:I = 0x503

.field public static final TagDateTimeUtc:I = 0x908

.field public static final TagDistortionCorrection:I = 0x50b

.field public static final TagDriveMode:I = 0x600

.field public static final TagExposureMode:I = 0x200

.field public static final TagExposureShift:I = 0x203

.field public static final TagExtendedWBDetect:I = 0x902

.field public static final TagFlashControlMode:I = 0x404

.field public static final TagFlashExposureComp:I = 0x401

.field public static final TagFlashIntensity:I = 0x405

.field public static final TagFlashMode:I = 0x400

.field public static final TagFlashRemoteControl:I = 0x403

.field public static final TagFocusMode:I = 0x301

.field public static final TagFocusProcess:I = 0x302

.field public static final TagGradation:I = 0x50f

.field public static final TagImageQuality2:I = 0x603

.field public static final TagImageStabilization:I = 0x604

.field public static final TagMacroMode:I = 0x300

.field public static final TagMagicFilter:I = 0x52c

.field public static final TagManometerPressure:I = 0x900

.field public static final TagManometerReading:I = 0x901

.field public static final TagManualFlashStrength:I = 0x406

.field public static final TagMeteringMode:I = 0x202

.field public static final TagModifiedSaturation:I = 0x504

.field public static final TagNdFilter:I = 0x204

.field public static final TagNoiseFilter:I = 0x527

.field public static final TagNoiseReduction:I = 0x50a

.field public static final TagPanoramaMode:I = 0x601

.field public static final TagPictureMode:I = 0x520

.field public static final TagPictureModeBWFilter:I = 0x525

.field public static final TagPictureModeContrast:I = 0x523

.field public static final TagPictureModeEffect:I = 0x52d

.field public static final TagPictureModeHue:I = 0x522

.field public static final TagPictureModeSaturation:I = 0x521

.field public static final TagPictureModeSharpness:I = 0x524

.field public static final TagPictureModeTone:I = 0x526

.field public static final TagPitchAngle:I = 0x904

.field public static final TagPreviewImageLength:I = 0x102

.field public static final TagPreviewImageStart:I = 0x101

.field public static final TagPreviewImageValid:I = 0x100

.field public static final TagRollAngle:I = 0x903

.field public static final TagSceneMode:I = 0x509

.field public static final TagShadingCompensation:I = 0x50c

.field public static final TagSharpnessSetting:I = 0x506

.field public static final TagStackedImage:I = 0x804

.field public static final TagToneLevel:I = 0x52e

.field public static final TagWhiteBalance2:I = 0x500

.field public static final TagWhiteBalanceBracket:I = 0x502

.field public static final TagWhiteBalanceTemperature:I = 0x501

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
    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 111
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Settings Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image Valid"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x101

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image Start"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview Image Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AE Lock"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Metering Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Exposure Shift"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ND Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x300

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Macro Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x301

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x302

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Process"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x303

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Search"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x304

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Areas"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x305

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Point Selected"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x306

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Fine Tune"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x307

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AF Fine Tune Adj"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x400

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x401

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Exposure Comp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x403

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Remote Control"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x404

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Control Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x405

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Intensity"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x406

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Manual Flash Strength"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x500

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x501

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x502

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Bracket"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x503

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Custom Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x504

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Modified Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x505

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x506

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness Setting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x507

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Space"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x509

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Scene Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Noise Reduction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Distortion Correction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Shading Compensation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Compression Factor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Gradation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x520

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x521

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x522

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Hue"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x523

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x524

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x525

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode BW Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x526

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Tone"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x527

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Noise Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x529

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Art Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x52c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Magic Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x52d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Picture Mode Effect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x52e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Tone Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x52f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Art Filter Effect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x600

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Drive Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x601

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Panorama Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x603

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Quality 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x604

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Stabilization"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x804

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Stacked Image"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x900

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Manometer Pressure"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x901

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Manometer Reading"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x902

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extended WB Detect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x903

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Roll Angle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x904

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pitch Angle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x908

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date Time UTC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 183
    new-instance v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 184
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 190
    const-string v0, "Olympus Camera Settings"

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
    .line 197
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
