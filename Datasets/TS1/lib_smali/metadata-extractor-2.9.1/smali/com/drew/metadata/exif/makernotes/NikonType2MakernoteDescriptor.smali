.class public Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "NikonType2MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 45
    return-void
.end method

.method private getEVDescription(I)Ljava/lang/String;
    .registers 10
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x2

    .line 308
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    invoke-virtual {v4, p1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getIntArray(I)[I

    move-result-object v3

    .line 309
    .local v3, "values":[I
    if-eqz v3, :cond_f

    array-length v4, v3

    if-ge v4, v7, :cond_11

    :cond_f
    move-object v4, v5

    .line 315
    :goto_10
    return-object v4

    .line 311
    :cond_11
    array-length v4, v3

    const/4 v6, 0x3

    if-lt v4, v6, :cond_19

    aget v4, v3, v7

    if-nez v4, :cond_1b

    :cond_19
    move-object v4, v5

    .line 312
    goto :goto_10

    .line 313
    :cond_1b
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "0.##"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 314
    .local v0, "decimalFormat":Ljava/text/DecimalFormat;
    const/4 v4, 0x0

    aget v4, v3, v4

    const/4 v5, 0x1

    aget v5, v3, v5

    mul-int/2addr v4, v5

    int-to-double v4, v4

    aget v6, v3, v7

    int-to-double v6, v6

    div-double v1, v4, v6

    .line 315
    .local v1, "ev":D
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " EV"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_10
.end method


# virtual methods
.method public getActiveDLightingDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 198
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 199
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 200
    const/4 v1, 0x0

    .line 208
    :goto_d
    return-object v1

    .line 201
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_42

    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 202
    :sswitch_2f
    const-string v1, "Off"

    goto :goto_d

    .line 203
    :sswitch_32
    const-string v1, "Light"

    goto :goto_d

    .line 204
    :sswitch_35
    const-string v1, "Normal"

    goto :goto_d

    .line 205
    :sswitch_38
    const-string v1, "High"

    goto :goto_d

    .line 206
    :sswitch_3b
    const-string v1, "Extra High"

    goto :goto_d

    .line 207
    :sswitch_3e
    const-string v1, "Auto"

    goto :goto_d

    .line 201
    nop

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x3 -> :sswitch_35
        0x5 -> :sswitch_38
        0x7 -> :sswitch_3b
        0xffff -> :sswitch_3e
    .end sparse-switch
.end method

.method public getAutoFlashCompensationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 278
    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAutoFocusPositionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/16 v4, 0x88

    const/4 v3, 0x1

    .line 230
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    invoke-virtual {v1, v4}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getIntArray(I)[I

    move-result-object v0

    .line 231
    .local v0, "values":[I
    if-nez v0, :cond_f

    .line 232
    const/4 v1, 0x0

    .line 248
    :goto_e
    return-object v1

    .line 233
    :cond_f
    array-length v1, v0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_22

    const/4 v1, 0x0

    aget v1, v0, v1

    if-nez v1, :cond_22

    const/4 v1, 0x2

    aget v1, v0, v1

    if-nez v1, :cond_22

    const/4 v1, 0x3

    aget v1, v0, v1

    if-eqz v1, :cond_44

    .line 234
    :cond_22
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    invoke-virtual {v1, v4}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 236
    :cond_44
    aget v1, v0, v3

    packed-switch v1, :pswitch_data_74

    .line 248
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 238
    :pswitch_65
    const-string v1, "Centre"

    goto :goto_e

    .line 240
    :pswitch_68
    const-string v1, "Top"

    goto :goto_e

    .line 242
    :pswitch_6b
    const-string v1, "Bottom"

    goto :goto_e

    .line 244
    :pswitch_6e
    const-string v1, "Left"

    goto :goto_e

    .line 246
    :pswitch_71
    const-string v1, "Right"

    goto :goto_e

    .line 236
    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_65
        :pswitch_68
        :pswitch_6b
        :pswitch_6e
        :pswitch_71
    .end packed-switch
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 344
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    const/16 v2, 0x8d

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 345
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_e

    const/4 v0, 0x0

    .end local v0    # "value":Ljava/lang/String;
    :cond_d
    :goto_d
    return-object v0

    .restart local v0    # "value":Ljava/lang/String;
    :cond_e
    const-string v1, "MODE1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v0, "Mode I (sRGB)"

    goto :goto_d
.end method

.method public getColorSpaceDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 188
    const/16 v0, 0x1e

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "sRGB"

    aput-object v3, v1, v2

    const-string v2, "Adobe RGB"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 51
    sparse-switch p1, :sswitch_data_7c

    .line 100
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 54
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getProgramShiftDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getExposureDifferenceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getLensDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getHueAdjustmentDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getAutoFlashCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getFlashExposureCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getFlashBracketCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getExposureTuningDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getLensStopsDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getColorSpaceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 76
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getActiveDLightingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 78
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getVignetteControlDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 80
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getIsoSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 82
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 84
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getFlashUsedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 86
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getAutoFocusPositionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 88
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getFirmwareVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 90
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getLensTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 92
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getShootingModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 94
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getNEFCompressionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 96
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getHighISONoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 98
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getPowerUpTimeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    nop

    :sswitch_data_7c
    .sparse-switch
        0x1 -> :sswitch_5d
        0x2 -> :sswitch_49
        0xd -> :sswitch_8
        0xe -> :sswitch_d
        0x12 -> :sswitch_21
        0x17 -> :sswitch_26
        0x18 -> :sswitch_2b
        0x1c -> :sswitch_30
        0x1e -> :sswitch_3a
        0x22 -> :sswitch_3f
        0x2a -> :sswitch_44
        0x83 -> :sswitch_62
        0x84 -> :sswitch_12
        0x86 -> :sswitch_4e
        0x87 -> :sswitch_53
        0x88 -> :sswitch_58
        0x89 -> :sswitch_67
        0x8b -> :sswitch_35
        0x8d -> :sswitch_1c
        0x92 -> :sswitch_17
        0x93 -> :sswitch_6c
        0xb1 -> :sswitch_71
        0xb6 -> :sswitch_76
    .end sparse-switch
.end method

.method public getDigitalZoomDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 255
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    const/16 v2, 0x86

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 256
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_f

    .line 257
    const/4 v1, 0x0

    .line 258
    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->intValue()I

    move-result v1

    if-ne v1, v3, :cond_18

    const-string v1, "No digital zoom"

    goto :goto_e

    :cond_18
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x digital zoom"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getExposureDifferenceDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 272
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureTuningDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 296
    const/16 v0, 0x1c

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirmwareVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 351
    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashBracketCompensationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 290
    const/16 v0, 0x18

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashExposureCompensationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 284
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashUsedDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 127
    const/16 v0, 0x87

    const/16 v1, 0xa

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Flash Not Used"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual Flash"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v4, v1, v2

    const/4 v2, 0x3

    const-string v3, "Flash Not Ready"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    aput-object v4, v1, v2

    const/4 v2, 0x6

    aput-object v4, v1, v2

    const/4 v2, 0x7

    const-string v3, "External Flash"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Fired, Commander Mode"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "Fired, TTL Mode"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHighISONoiseReductionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 113
    const/16 v0, 0xb1

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Minimal"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v4, v1, v2

    const/4 v2, 0x4

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object v4, v1, v2

    const/4 v2, 0x6

    const-string v3, "High"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHueAdjustmentDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 338
    const/16 v0, 0x92

    const-string v1, "%s degrees"

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getFormattedString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIsoSettingDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 321
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    invoke-virtual {v1, v4}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getIntArray(I)[I

    move-result-object v0

    .line 322
    .local v0, "values":[I
    if-nez v0, :cond_e

    .line 323
    const/4 v1, 0x0

    .line 326
    :goto_d
    return-object v1

    .line 324
    :cond_e
    const/4 v1, 0x0

    aget v1, v0, v1

    if-nez v1, :cond_17

    aget v1, v0, v3

    if-nez v1, :cond_39

    .line 325
    :cond_17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    invoke-virtual {v1, v4}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 326
    :cond_39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ISO "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getLensDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 332
    const/16 v0, 0x84

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getLensSpecificationDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLensStopsDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 302
    const/16 v0, 0x8b

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLensTypeDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 176
    const/16 v0, 0x83

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "AF"

    aput-object v3, v2, v4

    const-string v3, "MF"

    aput-object v3, v2, v5

    aput-object v2, v1, v4

    const-string v2, "D"

    aput-object v2, v1, v5

    const-string v2, "G"

    aput-object v2, v1, v6

    const/4 v2, 0x3

    const-string v3, "VR"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getBitFlagDescription(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNEFCompressionDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 144
    const/16 v0, 0x93

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Lossy (Type 1)"

    aput-object v3, v1, v2

    aput-object v4, v1, v5

    const/4 v2, 0x2

    const-string v3, "Uncompressed"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v4, v1, v2

    const/4 v2, 0x4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    aput-object v4, v1, v2

    const/4 v2, 0x6

    const-string v3, "Lossless"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Lossy (Type 2)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v5, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPowerUpTimeDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 107
    const/16 v0, 0xb6

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEpochTimeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProgramShiftDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 266
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getEVDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShootingModeDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 160
    const/16 v0, 0x89

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "Single Frame"

    aput-object v3, v2, v4

    const-string v3, "Continuous"

    aput-object v3, v2, v5

    aput-object v2, v1, v4

    const-string v2, "Delay"

    aput-object v2, v1, v5

    const/4 v2, 0x0

    aput-object v2, v1, v6

    const/4 v2, 0x3

    const-string v3, "PC Control"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Exposure Bracketing"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Auto ISO"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "White-Balance Bracketing"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "IR Control"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->getBitFlagDescription(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVignetteControlDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 215
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 216
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 217
    const/4 v1, 0x0

    .line 223
    :goto_d
    return-object v1

    .line 218
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_3c

    .line 223
    :pswitch_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 219
    :pswitch_2f
    const-string v1, "Off"

    goto :goto_d

    .line 220
    :pswitch_32
    const-string v1, "Low"

    goto :goto_d

    .line 221
    :pswitch_35
    const-string v1, "Normal"

    goto :goto_d

    .line 222
    :pswitch_38
    const-string v1, "High"

    goto :goto_d

    .line 218
    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_32
        :pswitch_15
        :pswitch_35
        :pswitch_15
        :pswitch_38
    .end packed-switch
.end method
