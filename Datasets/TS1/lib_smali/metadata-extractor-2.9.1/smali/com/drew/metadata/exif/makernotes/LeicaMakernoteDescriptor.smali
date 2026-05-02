.class public Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "LeicaMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 42
    return-void
.end method

.method private getApproximateFNumberDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 83
    const/16 v0, 0x313

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getSimpleRational(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getCameraTemperatureDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 77
    const/16 v0, 0x320

    const-string v1, "%d C"

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getFormattedInt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getExternalSensorBrightnessValueDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 95
    const/16 v0, 0x311

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getSimpleRational(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getMeasuredLvDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 89
    const/16 v0, 0x312

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getSimpleRational(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 126
    const/16 v0, 0x300

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Fine"

    aput-object v3, v1, v2

    const-string v2, "Basic"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUserProfileDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 115
    const/16 v0, 0x300

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "User Profile 1"

    aput-object v3, v1, v2

    const-string v2, "User Profile 2"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "User Profile 3"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "User Profile 0 (Dynamic)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getWhiteBalanceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 101
    const/16 v0, 0x304

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto or Manual"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Daylight"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Fluorescent"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Tungsten"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Flash"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Cloudy"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Shadow"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 48
    sparse-switch p1, :sswitch_data_30

    .line 70
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 50
    :sswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :sswitch_d
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getUserProfileDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :sswitch_12
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_17
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getExternalSensorBrightnessValueDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_1c
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getMeasuredLvDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_21
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getApproximateFNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_26
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getCameraTemperatureDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_2b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor;->getSimpleRational(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 48
    :sswitch_data_30
    .sparse-switch
        0x300 -> :sswitch_8
        0x302 -> :sswitch_d
        0x304 -> :sswitch_12
        0x311 -> :sswitch_17
        0x312 -> :sswitch_1c
        0x313 -> :sswitch_21
        0x320 -> :sswitch_26
        0x322 -> :sswitch_2b
        0x323 -> :sswitch_2b
        0x324 -> :sswitch_2b
    .end sparse-switch
.end method
