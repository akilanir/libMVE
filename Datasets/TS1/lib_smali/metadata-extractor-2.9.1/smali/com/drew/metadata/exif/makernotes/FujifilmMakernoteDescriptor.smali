.class public Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "FujifilmMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 57
    return-void
.end method

.method private getMakernoteVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAutoBracketingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 365
    const/16 v0, 0x1100

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "No Flash & Flash"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAutoExposureWarningDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 411
    const/16 v0, 0x1302

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "AE Good"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Over Exposed"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBlurWarningDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 391
    const/16 v0, 0x1300

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No Blur Warning"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Blur warning"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorSaturationDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 175
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1003

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 176
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 177
    const/4 v1, 0x0

    .line 191
    :goto_d
    return-object v1

    .line 178
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_50

    .line 191
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

    .line 179
    :sswitch_2f
    const-string v1, "Normal"

    goto :goto_d

    .line 180
    :sswitch_32
    const-string v1, "Medium High"

    goto :goto_d

    .line 181
    :sswitch_35
    const-string v1, "High"

    goto :goto_d

    .line 182
    :sswitch_38
    const-string v1, "Medium Low"

    goto :goto_d

    .line 183
    :sswitch_3b
    const-string v1, "Low"

    goto :goto_d

    .line 184
    :sswitch_3e
    const-string v1, "None (B&W)"

    goto :goto_d

    .line 185
    :sswitch_41
    const-string v1, "B&W Green Filter"

    goto :goto_d

    .line 186
    :sswitch_44
    const-string v1, "B&W Yellow Filter"

    goto :goto_d

    .line 187
    :sswitch_47
    const-string v1, "B&W Blue Filter"

    goto :goto_d

    .line 188
    :sswitch_4a
    const-string v1, "B&W Sepia"

    goto :goto_d

    .line 189
    :sswitch_4d
    const-string v1, "Film Simulation"

    goto :goto_d

    .line 178
    :sswitch_data_50
    .sparse-switch
        0x0 -> :sswitch_2f
        0x80 -> :sswitch_32
        0x100 -> :sswitch_35
        0x180 -> :sswitch_38
        0x200 -> :sswitch_3b
        0x300 -> :sswitch_3e
        0x301 -> :sswitch_41
        0x302 -> :sswitch_44
        0x303 -> :sswitch_47
        0x304 -> :sswitch_4a
        0x8000 -> :sswitch_4d
    .end sparse-switch
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1006

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 218
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 219
    const/4 v1, 0x0

    .line 225
    :goto_d
    return-object v1

    .line 220
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 225
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

    .line 221
    :sswitch_2f
    const-string v1, "Normal"

    goto :goto_d

    .line 222
    :sswitch_32
    const-string v1, "High"

    goto :goto_d

    .line 223
    :sswitch_35
    const-string v1, "Low"

    goto :goto_d

    .line 220
    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_2f
        0x100 -> :sswitch_32
        0x300 -> :sswitch_35
    .end sparse-switch
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 63
    sparse-switch p1, :sswitch_data_80

    .line 113
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 65
    :sswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getMakernoteVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getColorSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getToneDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getHighIsoNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFlashExposureValueDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 85
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getMacroDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 87
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 89
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getSlowSyncDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 91
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getPictureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 93
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getExrAutoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 95
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getExrModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 97
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getAutoBracketingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 99
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFinePixColorDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 101
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getBlurWarningDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 103
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFocusWarningDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 105
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getAutoExposureWarningDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 107
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getDynamicRangeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 109
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getFilmModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 111
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getDynamicRangeSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :sswitch_data_80
    .sparse-switch
        0x0 -> :sswitch_8
        0x1001 -> :sswitch_d
        0x1002 -> :sswitch_12
        0x1003 -> :sswitch_17
        0x1004 -> :sswitch_1c
        0x1006 -> :sswitch_21
        0x100b -> :sswitch_26
        0x100e -> :sswitch_2b
        0x1010 -> :sswitch_30
        0x1011 -> :sswitch_35
        0x1020 -> :sswitch_3a
        0x1021 -> :sswitch_3f
        0x1030 -> :sswitch_44
        0x1031 -> :sswitch_49
        0x1033 -> :sswitch_4e
        0x1034 -> :sswitch_53
        0x1100 -> :sswitch_58
        0x1210 -> :sswitch_5d
        0x1300 -> :sswitch_62
        0x1301 -> :sswitch_67
        0x1302 -> :sswitch_6c
        0x1400 -> :sswitch_71
        0x1401 -> :sswitch_76
        0x1402 -> :sswitch_7b
    .end sparse-switch
.end method

.method public getDynamicRangeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 421
    const/16 v0, 0x1400

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const/4 v2, 0x0

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Wide"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDynamicRangeSettingDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 455
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1402

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 456
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 457
    const/4 v1, 0x0

    .line 466
    :goto_d
    return-object v1

    .line 458
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_42

    .line 466
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

    .line 459
    :sswitch_2f
    const-string v1, "Auto (100-400%)"

    goto :goto_d

    .line 460
    :sswitch_32
    const-string v1, "Manual"

    goto :goto_d

    .line 461
    :sswitch_35
    const-string v1, "Standard (100%)"

    goto :goto_d

    .line 462
    :sswitch_38
    const-string v1, "Wide 1 (230%)"

    goto :goto_d

    .line 463
    :sswitch_3b
    const-string v1, "Wide 2 (400%)"

    goto :goto_d

    .line 464
    :sswitch_3e
    const-string v1, "Film Simulation"

    goto :goto_d

    .line 458
    nop

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x100 -> :sswitch_35
        0x200 -> :sswitch_38
        0x201 -> :sswitch_3b
        0x8000 -> :sswitch_3e
    .end sparse-switch
.end method

.method public getExrAutoDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 344
    const/16 v0, 0x1033

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExrModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 350
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1034

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 351
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 352
    const/4 v1, 0x0

    .line 358
    :goto_d
    return-object v1

    .line 353
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 358
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

    .line 354
    :sswitch_2f
    const-string v1, "HR (High Resolution)"

    goto :goto_d

    .line 355
    :sswitch_32
    const-string v1, "SN (Signal to Noise Priority)"

    goto :goto_d

    .line 356
    :sswitch_35
    const-string v1, "DR (Dynamic Range Priority)"

    goto :goto_d

    .line 353
    :sswitch_data_38
    .sparse-switch
        0x100 -> :sswitch_2f
        0x200 -> :sswitch_32
        0x300 -> :sswitch_35
    .end sparse-switch
.end method

.method public getFilmModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 433
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1401

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 434
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 435
    const/4 v1, 0x0

    .line 448
    :goto_d
    return-object v1

    .line 436
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_4e

    .line 448
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

    .line 437
    :sswitch_2f
    const-string v1, "F0/Standard (Provia) "

    goto :goto_d

    .line 438
    :sswitch_32
    const-string v1, "F1/Studio Portrait"

    goto :goto_d

    .line 439
    :sswitch_35
    const-string v1, "F1a/Studio Portrait Enhanced Saturation"

    goto :goto_d

    .line 440
    :sswitch_38
    const-string v1, "F1b/Studio Portrait Smooth Skin Tone (Astia)"

    goto :goto_d

    .line 441
    :sswitch_3b
    const-string v1, "F1c/Studio Portrait Increased Sharpness"

    goto :goto_d

    .line 442
    :sswitch_3e
    const-string v1, "F2/Fujichrome (Velvia)"

    goto :goto_d

    .line 443
    :sswitch_41
    const-string v1, "F3/Studio Portrait Ex"

    goto :goto_d

    .line 444
    :sswitch_44
    const-string v1, "F4/Velvia"

    goto :goto_d

    .line 445
    :sswitch_47
    const-string v1, "Pro Neg. Std"

    goto :goto_d

    .line 446
    :sswitch_4a
    const-string v1, "Pro Neg. Hi"

    goto :goto_d

    .line 436
    nop

    :sswitch_data_4e
    .sparse-switch
        0x0 -> :sswitch_2f
        0x100 -> :sswitch_32
        0x110 -> :sswitch_35
        0x120 -> :sswitch_38
        0x130 -> :sswitch_3b
        0x200 -> :sswitch_3e
        0x300 -> :sswitch_41
        0x400 -> :sswitch_44
        0x500 -> :sswitch_47
        0x501 -> :sswitch_4a
    .end sparse-switch
.end method

.method public getFinePixColorDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 376
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1210

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 377
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 378
    const/4 v1, 0x0

    .line 384
    :goto_d
    return-object v1

    .line 379
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 384
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

    .line 380
    :sswitch_2f
    const-string v1, "Standard"

    goto :goto_d

    .line 381
    :sswitch_32
    const-string v1, "Chrome"

    goto :goto_d

    .line 382
    :sswitch_35
    const-string v1, "B&W"

    goto :goto_d

    .line 379
    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_2f
        0x10 -> :sswitch_32
        0x30 -> :sswitch_35
    .end sparse-switch
.end method

.method public getFlashExposureValueDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 275
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1011

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 276
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " EV (Apex)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 262
    const/16 v0, 0x1010

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Red-eye Reduction"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "External"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 288
    const/16 v0, 0x1021

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto Focus"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual Focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusWarningDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 401
    const/16 v0, 0x1301

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Good Focus"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Out Of Focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHighIsoNoiseReductionDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 247
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x100e

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 248
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 249
    const/4 v1, 0x0

    .line 255
    :goto_d
    return-object v1

    .line 250
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 255
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

    .line 251
    :sswitch_2f
    const-string v1, "Normal"

    goto :goto_d

    .line 252
    :sswitch_32
    const-string v1, "Strong"

    goto :goto_d

    .line 253
    :sswitch_35
    const-string v1, "Weak"

    goto :goto_d

    .line 250
    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_2f
        0x100 -> :sswitch_32
        0x200 -> :sswitch_35
    .end sparse-switch
.end method

.method public getMacroDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 282
    const/16 v0, 0x1020

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoiseReductionDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 232
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x100b

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 233
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 234
    const/4 v1, 0x0

    .line 240
    :goto_d
    return-object v1

    .line 235
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 240
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

    .line 236
    :sswitch_2f
    const-string v1, "Low"

    goto :goto_d

    .line 237
    :sswitch_32
    const-string v1, "Normal"

    goto :goto_d

    .line 238
    :sswitch_35
    const-string v1, "N/A"

    goto :goto_d

    .line 235
    :sswitch_data_38
    .sparse-switch
        0x40 -> :sswitch_2f
        0x80 -> :sswitch_32
        0x100 -> :sswitch_35
    .end sparse-switch
.end method

.method public getPictureModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 300
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1031

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 301
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 302
    const/4 v1, 0x0

    .line 337
    :goto_d
    return-object v1

    .line 303
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_8a

    .line 337
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

    .line 304
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 305
    :sswitch_32
    const-string v1, "Portrait scene"

    goto :goto_d

    .line 306
    :sswitch_35
    const-string v1, "Landscape scene"

    goto :goto_d

    .line 307
    :sswitch_38
    const-string v1, "Macro"

    goto :goto_d

    .line 308
    :sswitch_3b
    const-string v1, "Sports scene"

    goto :goto_d

    .line 309
    :sswitch_3e
    const-string v1, "Night scene"

    goto :goto_d

    .line 310
    :sswitch_41
    const-string v1, "Program AE"

    goto :goto_d

    .line 311
    :sswitch_44
    const-string v1, "Natural Light"

    goto :goto_d

    .line 312
    :sswitch_47
    const-string v1, "Anti-blur"

    goto :goto_d

    .line 313
    :sswitch_4a
    const-string v1, "Beach & Snow"

    goto :goto_d

    .line 314
    :sswitch_4d
    const-string v1, "Sunset"

    goto :goto_d

    .line 315
    :sswitch_50
    const-string v1, "Museum"

    goto :goto_d

    .line 316
    :sswitch_53
    const-string v1, "Party"

    goto :goto_d

    .line 317
    :sswitch_56
    const-string v1, "Flower"

    goto :goto_d

    .line 318
    :sswitch_59
    const-string v1, "Text"

    goto :goto_d

    .line 319
    :sswitch_5c
    const-string v1, "Natural Light & Flash"

    goto :goto_d

    .line 320
    :sswitch_5f
    const-string v1, "Beach"

    goto :goto_d

    .line 321
    :sswitch_62
    const-string v1, "Snow"

    goto :goto_d

    .line 322
    :sswitch_65
    const-string v1, "Fireworks"

    goto :goto_d

    .line 323
    :sswitch_68
    const-string v1, "Underwater"

    goto :goto_d

    .line 324
    :sswitch_6b
    const-string v1, "Portrait with Skin Correction"

    goto :goto_d

    .line 326
    :sswitch_6e
    const-string v1, "Panorama"

    goto :goto_d

    .line 327
    :sswitch_71
    const-string v1, "Night (Tripod)"

    goto :goto_d

    .line 328
    :sswitch_74
    const-string v1, "Pro Low-light"

    goto :goto_d

    .line 329
    :sswitch_77
    const-string v1, "Pro Focus"

    goto :goto_d

    .line 331
    :sswitch_7a
    const-string v1, "Dog Face Detection"

    goto :goto_d

    .line 332
    :sswitch_7d
    const-string v1, "Cat Face Detection"

    goto :goto_d

    .line 333
    :sswitch_80
    const-string v1, "Aperture priority AE"

    goto :goto_d

    .line 334
    :sswitch_83
    const-string v1, "Shutter priority AE"

    goto :goto_d

    .line 335
    :sswitch_86
    const-string v1, "Manual exposure"

    goto :goto_d

    .line 303
    nop

    :sswitch_data_8a
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x2 -> :sswitch_35
        0x3 -> :sswitch_38
        0x4 -> :sswitch_3b
        0x5 -> :sswitch_3e
        0x6 -> :sswitch_41
        0x7 -> :sswitch_44
        0x8 -> :sswitch_47
        0x9 -> :sswitch_4a
        0xa -> :sswitch_4d
        0xb -> :sswitch_50
        0xc -> :sswitch_53
        0xd -> :sswitch_56
        0xe -> :sswitch_59
        0xf -> :sswitch_5c
        0x10 -> :sswitch_5f
        0x11 -> :sswitch_62
        0x12 -> :sswitch_65
        0x13 -> :sswitch_68
        0x14 -> :sswitch_6b
        0x16 -> :sswitch_6e
        0x17 -> :sswitch_71
        0x18 -> :sswitch_74
        0x19 -> :sswitch_77
        0x1b -> :sswitch_7a
        0x1c -> :sswitch_7d
        0x100 -> :sswitch_80
        0x200 -> :sswitch_83
        0x300 -> :sswitch_86
    .end sparse-switch
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 126
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1001

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 127
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 128
    const/4 v1, 0x0

    .line 140
    :goto_d
    return-object v1

    .line 129
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_4a

    .line 140
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

    .line 130
    :sswitch_2f
    const-string v1, "Softest"

    goto :goto_d

    .line 131
    :sswitch_32
    const-string v1, "Soft"

    goto :goto_d

    .line 132
    :sswitch_35
    const-string v1, "Normal"

    goto :goto_d

    .line 133
    :sswitch_38
    const-string v1, "Hard"

    goto :goto_d

    .line 134
    :sswitch_3b
    const-string v1, "Hardest"

    goto :goto_d

    .line 135
    :sswitch_3e
    const-string v1, "Medium Soft"

    goto :goto_d

    .line 136
    :sswitch_41
    const-string v1, "Medium Hard"

    goto :goto_d

    .line 137
    :sswitch_44
    const-string v1, "Film Simulation"

    goto :goto_d

    .line 138
    :sswitch_47
    const-string v1, "N/A"

    goto :goto_d

    .line 129
    :sswitch_data_4a
    .sparse-switch
        0x1 -> :sswitch_2f
        0x2 -> :sswitch_32
        0x3 -> :sswitch_35
        0x4 -> :sswitch_38
        0x5 -> :sswitch_3b
        0x82 -> :sswitch_3e
        0x84 -> :sswitch_41
        0x8000 -> :sswitch_44
        0xffff -> :sswitch_47
    .end sparse-switch
.end method

.method public getSlowSyncDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 294
    const/16 v0, 0x1030

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToneDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 198
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1004

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 199
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 200
    const/4 v1, 0x0

    .line 210
    :goto_d
    return-object v1

    .line 201
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_44

    .line 210
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
    const-string v1, "Normal"

    goto :goto_d

    .line 203
    :sswitch_32
    const-string v1, "Medium High"

    goto :goto_d

    .line 204
    :sswitch_35
    const-string v1, "High"

    goto :goto_d

    .line 205
    :sswitch_38
    const-string v1, "Medium Low"

    goto :goto_d

    .line 206
    :sswitch_3b
    const-string v1, "Low"

    goto :goto_d

    .line 207
    :sswitch_3e
    const-string v1, "None (B&W)"

    goto :goto_d

    .line 208
    :sswitch_41
    const-string v1, "Film Simulation"

    goto :goto_d

    .line 201
    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_2f
        0x80 -> :sswitch_32
        0x100 -> :sswitch_35
        0x180 -> :sswitch_38
        0x200 -> :sswitch_3b
        0x300 -> :sswitch_3e
        0x8000 -> :sswitch_41
    .end sparse-switch
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 147
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;

    const/16 v2, 0x1002

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/FujifilmMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 148
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 149
    const/4 v1, 0x0

    .line 168
    :goto_d
    return-object v1

    .line 150
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_60

    .line 168
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

    .line 151
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 152
    :sswitch_32
    const-string v1, "Daylight"

    goto :goto_d

    .line 153
    :sswitch_35
    const-string v1, "Cloudy"

    goto :goto_d

    .line 154
    :sswitch_38
    const-string v1, "Daylight Fluorescent"

    goto :goto_d

    .line 155
    :sswitch_3b
    const-string v1, "Day White Fluorescent"

    goto :goto_d

    .line 156
    :sswitch_3e
    const-string v1, "White Fluorescent"

    goto :goto_d

    .line 157
    :sswitch_41
    const-string v1, "Warm White Fluorescent"

    goto :goto_d

    .line 158
    :sswitch_44
    const-string v1, "Living Room Warm White Fluorescent"

    goto :goto_d

    .line 159
    :sswitch_47
    const-string v1, "Incandescence"

    goto :goto_d

    .line 160
    :sswitch_4a
    const-string v1, "Flash"

    goto :goto_d

    .line 161
    :sswitch_4d
    const-string v1, "Custom White Balance"

    goto :goto_d

    .line 162
    :sswitch_50
    const-string v1, "Custom White Balance 2"

    goto :goto_d

    .line 163
    :sswitch_53
    const-string v1, "Custom White Balance 3"

    goto :goto_d

    .line 164
    :sswitch_56
    const-string v1, "Custom White Balance 4"

    goto :goto_d

    .line 165
    :sswitch_59
    const-string v1, "Custom White Balance 5"

    goto :goto_d

    .line 166
    :sswitch_5c
    const-string v1, "Kelvin"

    goto :goto_d

    .line 150
    nop

    :sswitch_data_60
    .sparse-switch
        0x0 -> :sswitch_2f
        0x100 -> :sswitch_32
        0x200 -> :sswitch_35
        0x300 -> :sswitch_38
        0x301 -> :sswitch_3b
        0x302 -> :sswitch_3e
        0x303 -> :sswitch_41
        0x304 -> :sswitch_44
        0x400 -> :sswitch_47
        0x500 -> :sswitch_4a
        0xf00 -> :sswitch_4d
        0xf01 -> :sswitch_50
        0xf02 -> :sswitch_53
        0xf03 -> :sswitch_56
        0xf04 -> :sswitch_59
        0xff0 -> :sswitch_5c
    .end sparse-switch
.end method
