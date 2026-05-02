.class public Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "OlympusEquipmentMakernoteDirectory.java"


# static fields
.field public static final TAG_BODY_FIRMWARE_VERSION:I = 0x104

.field public static final TAG_CAMERA_TYPE_2:I = 0x100

.field public static final TAG_CONVERSION_LENS:I = 0x403

.field public static final TAG_EQUIPMENT_VERSION:I = 0x0

.field public static final TAG_EXTENDER:I = 0x301

.field public static final TAG_EXTENDER_FIRMWARE_VERSION:I = 0x304

.field public static final TAG_EXTENDER_MODEL:I = 0x303

.field public static final TAG_EXTENDER_SERIAL_NUMBER:I = 0x302

.field public static final TAG_FLASH_FIRMWARE_VERSION:I = 0x1002

.field public static final TAG_FLASH_MODEL:I = 0x1001

.field public static final TAG_FLASH_SERIAL_NUMBER:I = 0x1003

.field public static final TAG_FLASH_TYPE:I = 0x1000

.field public static final TAG_FOCAL_PLANE_DIAGONAL:I = 0x103

.field public static final TAG_INTERNAL_SERIAL_NUMBER:I = 0x102

.field public static final TAG_LENS_FIRMWARE_VERSION:I = 0x204

.field public static final TAG_LENS_MODEL:I = 0x203

.field public static final TAG_LENS_PROPERTIES:I = 0x20b

.field public static final TAG_LENS_SERIAL_NUMBER:I = 0x202

.field public static final TAG_LENS_TYPE:I = 0x201

.field public static final TAG_MAX_APERTURE:I = 0x20a

.field public static final TAG_MAX_APERTURE_AT_MAX_FOCAL:I = 0x206

.field public static final TAG_MAX_APERTURE_AT_MIN_FOCAL:I = 0x205

.field public static final TAG_MAX_FOCAL_LENGTH:I = 0x208

.field public static final TAG_MIN_FOCAL_LENGTH:I = 0x207

.field public static final TAG_SERIAL_NUMBER:I = 0x101

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

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 73
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Equipment Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Camera Type 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x101

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x102

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Internal Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x103

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focal Plane Diagonal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x104

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Body Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Max Aperture At Min Focal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x206

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Max Aperture At Max Focal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Min Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x208

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Max Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Max Aperture"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Lens Properties"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x301

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extender"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x302

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extender Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x303

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extender Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x304

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Extender Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x403

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Conversion Lens"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Firmware Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Serial Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 101
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 102
    new-instance v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 103
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 109
    const-string v0, "Olympus Equipment"

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
    .line 116
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
