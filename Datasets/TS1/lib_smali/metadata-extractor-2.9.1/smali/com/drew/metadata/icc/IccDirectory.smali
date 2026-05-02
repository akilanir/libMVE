.class public Lcom/drew/metadata/icc/IccDirectory;
.super Lcom/drew/metadata/Directory;
.source "IccDirectory.java"


# static fields
.field public static final TAG_APPLE_MULTI_LANGUAGE_PROFILE_NAME:I = 0x6473636d

.field public static final TAG_CMM_FLAGS:I = 0x2c

.field public static final TAG_CMM_TYPE:I = 0x4

.field public static final TAG_COLOR_SPACE:I = 0x10

.field public static final TAG_DEVICE_ATTR:I = 0x38

.field public static final TAG_DEVICE_MAKE:I = 0x30

.field public static final TAG_DEVICE_MODEL:I = 0x34

.field public static final TAG_PLATFORM:I = 0x28

.field public static final TAG_PROFILE_BYTE_COUNT:I = 0x0

.field public static final TAG_PROFILE_CLASS:I = 0xc

.field public static final TAG_PROFILE_CONNECTION_SPACE:I = 0x14

.field public static final TAG_PROFILE_CREATOR:I = 0x50

.field public static final TAG_PROFILE_DATETIME:I = 0x18

.field public static final TAG_PROFILE_VERSION:I = 0x8

.field public static final TAG_RENDERING_INTENT:I = 0x40

.field public static final TAG_SIGNATURE:I = 0x24

.field public static final TAG_TAG_A2B0:I = 0x41324230

.field public static final TAG_TAG_A2B1:I = 0x41324231

.field public static final TAG_TAG_A2B2:I = 0x41324232

.field public static final TAG_TAG_B2A0:I = 0x42324130

.field public static final TAG_TAG_B2A1:I = 0x42324131

.field public static final TAG_TAG_B2A2:I = 0x42324132

.field public static final TAG_TAG_COUNT:I = 0x80

.field public static final TAG_TAG_bTRC:I = 0x62545243

.field public static final TAG_TAG_bXYZ:I = 0x6258595a

.field public static final TAG_TAG_bfd:I = 0x62666420

.field public static final TAG_TAG_bkpt:I = 0x626b7074

.field public static final TAG_TAG_calt:I = 0x63616c74

.field public static final TAG_TAG_chad:I = 0x63686164

.field public static final TAG_TAG_chrm:I = 0x6368726d

.field public static final TAG_TAG_cprt:I = 0x63707274

.field public static final TAG_TAG_crdi:I = 0x63726469

.field public static final TAG_TAG_desc:I = 0x64657363

.field public static final TAG_TAG_devs:I = 0x64657673

.field public static final TAG_TAG_dmdd:I = 0x646d6464

.field public static final TAG_TAG_dmnd:I = 0x646d6e64

.field public static final TAG_TAG_gTRC:I = 0x67545243

.field public static final TAG_TAG_gXYZ:I = 0x6758595a

.field public static final TAG_TAG_gamt:I = 0x67616d74

.field public static final TAG_TAG_kTRC:I = 0x6b545243

.field public static final TAG_TAG_lumi:I = 0x6c756d69

.field public static final TAG_TAG_meas:I = 0x6d656173

.field public static final TAG_TAG_ncl2:I = 0x6e636c32

.field public static final TAG_TAG_ncol:I = 0x6e636f6c

.field public static final TAG_TAG_pre0:I = 0x70726530

.field public static final TAG_TAG_pre1:I = 0x70726531

.field public static final TAG_TAG_pre2:I = 0x70726532

.field public static final TAG_TAG_ps2i:I = 0x70733269

.field public static final TAG_TAG_ps2s:I = 0x70733273

.field public static final TAG_TAG_psd0:I = 0x70736430

.field public static final TAG_TAG_psd1:I = 0x70736431

.field public static final TAG_TAG_psd2:I = 0x70736432

.field public static final TAG_TAG_psd3:I = 0x70736433

.field public static final TAG_TAG_pseq:I = 0x70736571

.field public static final TAG_TAG_rTRC:I = 0x72545243

.field public static final TAG_TAG_rXYZ:I = 0x7258595a

.field public static final TAG_TAG_resp:I = 0x72657370

.field public static final TAG_TAG_scrd:I = 0x73637264

.field public static final TAG_TAG_scrn:I = 0x7363726e

.field public static final TAG_TAG_targ:I = 0x74617267

.field public static final TAG_TAG_tech:I = 0x74656368

.field public static final TAG_TAG_view:I = 0x76696577

.field public static final TAG_TAG_vued:I = 0x76756564

.field public static final TAG_TAG_wtpt:I = 0x77747074

.field public static final TAG_XYZ_VALUES:I = 0x44

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

    sput-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 111
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CMM Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Class"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color space"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Connection Space"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Date/Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Signature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Primary Platform"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CMM Flags"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x30

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device manufacturer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device model"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x38

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device attributes"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Rendering Intent"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x44

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "XYZ values"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x50

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Creator"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x80

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Tag Count"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x41324230

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AToB 0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x41324231

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AToB 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x41324232

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AToB 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6258595a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Blue Colorant"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x62545243

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Blue TRC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x42324130

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BToA 0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x42324131

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BToA 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x42324132

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BToA 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x63616c74

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Calibration Date/Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x74617267

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Char Target"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x63686164

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Chromatic Adaptation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6368726d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Chromaticity"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x63707274

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Copyright"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x63726469

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CrdInfo"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x646d6e64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device Mfg Description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x646d6464

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device Model Description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x64657673

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Device Settings"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x67616d74

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Gamut"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6b545243

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Gray TRC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6758595a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Green Colorant"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x67545243

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Green TRC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6c756d69

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Luminance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6d656173

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Measurement"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x626b7074

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Media Black Point"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x77747074

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Media White Point"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6e636f6c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Named Color"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6e636c32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Named Color 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x72657370

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Output Response"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70726530    # 3.000708E29f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview 0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70726531    # 3.0007082E29f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70726532    # 3.0007084E29f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Preview 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x64657363

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70736571

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Profile Sequence Description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70736430

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 CRD 0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70736431

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 CRD 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70736432

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 CRD 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70736433

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 CRD 3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70733273

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 CSA"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x70733269

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ps2 Rendering Intent"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x7258595a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Red Colorant"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x72545243

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Red TRC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x73637264

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Screening Desc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x7363726e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Screening"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x74656368

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Technology"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x62666420

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ucrbg"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x76756564

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Viewing Conditions Description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x76696577

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Viewing Conditions"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    const v1, 0x6473636d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Apple Multi-language Profile Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 179
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 180
    new-instance v0, Lcom/drew/metadata/icc/IccDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/icc/IccDescriptor;-><init>(Lcom/drew/metadata/icc/IccDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/icc/IccDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 181
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 187
    const-string v0, "ICC Profile"

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
    .line 194
    sget-object v0, Lcom/drew/metadata/icc/IccDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
