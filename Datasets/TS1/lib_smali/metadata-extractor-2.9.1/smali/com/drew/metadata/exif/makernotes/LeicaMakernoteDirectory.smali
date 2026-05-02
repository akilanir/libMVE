.class public Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "LeicaMakernoteDirectory.java"


# static fields
.field public static final TAG_APPROXIMATE_F_NUMBER:I = 0x313

.field public static final TAG_CAMERA_TEMPERATURE:I = 0x320

.field public static final TAG_CCD_BOARD_VERSION:I = 0x331

.field public static final TAG_CCD_VERSION:I = 0x330

.field public static final TAG_COLOR_TEMPERATURE:I = 0x321

.field public static final TAG_CONTROLLER_BOARD_VERSION:I = 0x332

.field public static final TAG_EXTERNAL_SENSOR_BRIGHTNESS_VALUE:I = 0x311

.field public static final TAG_IMAGE_ID_NUMBER:I = 0x340

.field public static final TAG_LENS_TYPE:I = 0x310

.field public static final TAG_M16_C_VERSION:I = 0x333

.field public static final TAG_MEASURED_LV:I = 0x312

.field public static final TAG_QUALITY:I = 0x300

.field public static final TAG_SERIAL_NUMBER:I = 0x303

.field public static final TAG_USER_PROFILE:I = 0x302

.field public static final TAG_WB_BLUE_LEVEL:I = 0x324

.field public static final TAG_WB_GREEN_LEVEL:I = 0x323

.field public static final TAG_WB_RED_LEVEL:I = 0x322

.field public static final TAG_WHITE_BALANCE:I = 0x304

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
    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 66
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x300

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x302

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "User Profile"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x303

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x304

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x310

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x311

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "External Sensor Brightness Value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x312

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Measured LV"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x313

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Approximate F Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x320

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x321

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Temperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x322

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "WB Red Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x323

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "WB Green Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x324

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "WB Blue Level"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x330

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CCD Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x331

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CCD Board Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x332

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Controller Board Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x333

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "M16 C Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x340

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image ID Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 92
    new-instance v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 93
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 99
    const-string v0, "Leica Makernote"

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
    .line 106
    sget-object v0, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
