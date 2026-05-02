.class public Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "SonyType1MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 41
    return-void
.end method


# virtual methods
.method public getAFIlluminatorDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 606
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb044

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 608
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 609
    const/4 v1, 0x0

    .line 616
    :goto_e
    return-object v1

    .line 611
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3a

    .line 616
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

    goto :goto_e

    .line 612
    :sswitch_30
    const-string v1, "Off"

    goto :goto_e

    .line 613
    :sswitch_33
    const-string v1, "Auto"

    goto :goto_e

    .line 614
    :sswitch_36
    const-string v1, "n/a"

    goto :goto_e

    .line 611
    nop

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_30
        0x1 -> :sswitch_33
        0xffff -> :sswitch_36
    .end sparse-switch
.end method

.method public getAFModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 583
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb043

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 585
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 586
    const/4 v1, 0x0

    .line 599
    :goto_e
    return-object v1

    .line 588
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_4c

    .line 599
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

    goto :goto_e

    .line 589
    :sswitch_30
    const-string v1, "Default"

    goto :goto_e

    .line 590
    :sswitch_33
    const-string v1, "Multi"

    goto :goto_e

    .line 591
    :sswitch_36
    const-string v1, "Center"

    goto :goto_e

    .line 592
    :sswitch_39
    const-string v1, "Spot"

    goto :goto_e

    .line 593
    :sswitch_3c
    const-string v1, "Flexible Spot"

    goto :goto_e

    .line 594
    :sswitch_3f
    const-string v1, "Touch"

    goto :goto_e

    .line 595
    :sswitch_42
    const-string v1, "Manual Focus"

    goto :goto_e

    .line 596
    :sswitch_45
    const-string v1, "Face Detected"

    goto :goto_e

    .line 597
    :sswitch_48
    const-string v1, "n/a"

    goto :goto_e

    .line 588
    nop

    :sswitch_data_4c
    .sparse-switch
        0x0 -> :sswitch_30
        0x1 -> :sswitch_33
        0x2 -> :sswitch_36
        0x3 -> :sswitch_39
        0x4 -> :sswitch_3c
        0x6 -> :sswitch_3f
        0xe -> :sswitch_42
        0xf -> :sswitch_45
        0xffff -> :sswitch_48
    .end sparse-switch
.end method

.method public getAFPointSelectedDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 467
    const/16 v0, 0x201e

    const/16 v1, 0x14

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Center"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Top"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Upper-right"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Right"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Lower-right"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Bottom"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Lower-left"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Left"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "Upper-left\t  \t"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "Far Right"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "Far Left"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "Upper-middle"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "Near Right"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "Lower-middle"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "Near Left"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "Upper Far Right"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "Lower Far Right"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "Lower Far Left"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "Upper Far Left"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAntiBlurDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 337
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb04b

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 338
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 339
    const/4 v1, 0x0

    .line 345
    :goto_e
    return-object v1

    .line 340
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_30

    .line 345
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 341
    :sswitch_23
    const-string v1, "Off"

    goto :goto_e

    .line 342
    :sswitch_26
    const-string v1, "On (Continuous)"

    goto :goto_e

    .line 343
    :sswitch_29
    const-string v1, "On (Shooting)"

    goto :goto_e

    .line 344
    :sswitch_2c
    const-string v1, "N/A"

    goto :goto_e

    .line 340
    nop

    :sswitch_data_30
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0x2 -> :sswitch_29
        0xffff -> :sswitch_2c
    .end sparse-switch
.end method

.method public getAutoPortraitFramedDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 454
    const/16 v0, 0x2016

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 238
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb029

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 239
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 240
    const/4 v1, 0x0

    .line 258
    :goto_e
    return-object v1

    .line 241
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_54

    .line 258
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 242
    :sswitch_23
    const-string v1, "Standard"

    goto :goto_e

    .line 243
    :sswitch_26
    const-string v1, "Vivid"

    goto :goto_e

    .line 244
    :sswitch_29
    const-string v1, "Portrait"

    goto :goto_e

    .line 245
    :sswitch_2c
    const-string v1, "Landscape"

    goto :goto_e

    .line 246
    :sswitch_2f
    const-string v1, "Sunset"

    goto :goto_e

    .line 247
    :sswitch_32
    const-string v1, "Night Portrait"

    goto :goto_e

    .line 248
    :sswitch_35
    const-string v1, "Black & White"

    goto :goto_e

    .line 249
    :sswitch_38
    const-string v1, "Adobe RGB"

    goto :goto_e

    .line 250
    :sswitch_3b
    const-string v1, "Neutral"

    goto :goto_e

    .line 251
    :sswitch_3e
    const-string v1, "Clear"

    goto :goto_e

    .line 252
    :sswitch_41
    const-string v1, "Deep"

    goto :goto_e

    .line 253
    :sswitch_44
    const-string v1, "Light"

    goto :goto_e

    .line 254
    :sswitch_47
    const-string v1, "Autumn"

    goto :goto_e

    .line 255
    :sswitch_4a
    const-string v1, "Sepia"

    goto :goto_e

    .line 256
    :sswitch_4d
    const-string v1, "Night View"

    goto :goto_e

    .line 257
    :sswitch_50
    const-string v1, "Autumn Leaves"

    goto :goto_e

    .line 241
    nop

    :sswitch_data_54
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0x2 -> :sswitch_29
        0x3 -> :sswitch_2c
        0x4 -> :sswitch_2f
        0x5 -> :sswitch_32
        0x6 -> :sswitch_35
        0x7 -> :sswitch_38
        0xc -> :sswitch_3b
        0xd -> :sswitch_3e
        0xe -> :sswitch_41
        0xf -> :sswitch_44
        0x10 -> :sswitch_47
        0x11 -> :sswitch_4a
        0x64 -> :sswitch_3b
        0x65 -> :sswitch_3e
        0x66 -> :sswitch_41
        0x67 -> :sswitch_44
        0x68 -> :sswitch_4d
        0x69 -> :sswitch_50
    .end sparse-switch
.end method

.method public getColorTemperatureDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 181
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v3, 0xb021

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 182
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 183
    const/4 v2, 0x0

    .line 187
    :goto_e
    return-object v2

    .line 184
    :cond_f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_18

    .line 185
    const-string v2, "Auto"

    goto :goto_e

    .line 186
    :cond_18
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/high16 v3, 0xff0000

    and-int/2addr v2, v3

    shr-int/lit8 v2, v2, 0x8

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/high16 v4, -0x1000000

    and-int/2addr v3, v4

    shr-int/lit8 v3, v3, 0x18

    or-int v0, v2, v3

    .line 187
    .local v0, "kelvin":I
    const-string v2, "%d K"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_e
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 47
    sparse-switch p1, :sswitch_data_a4

    .line 113
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 49
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getImageQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getFlashExposureCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 53
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getTeleconverterDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 55
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getColorTemperatureDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getSceneModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 61
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getZoneMatchingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getDynamicRangeOptimizerDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getImageStabilizationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getMacroDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getJpegQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getAntiBlurDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getLongExposureNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getHighIsoNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 85
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getPictureEffectDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 87
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getSoftSkinEffectDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 89
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getVignettingCorrectionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 91
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getLateralChromaticAberrationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 93
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getDistortionCorrectionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 95
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getAutoPortraitFramedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 97
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 99
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getAFPointSelectedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 101
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getSonyModelIdDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 103
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getAFModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 105
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getAFIlluminatorDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 107
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getFlashLevelDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 109
    :sswitch_97
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getReleaseModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 111
    :sswitch_9d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getSequenceNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 47
    nop

    :sswitch_data_a4
    .sparse-switch
        0x102 -> :sswitch_8
        0x104 -> :sswitch_d
        0x105 -> :sswitch_12
        0x115 -> :sswitch_17
        0x2009 -> :sswitch_53
        0x200e -> :sswitch_58
        0x200f -> :sswitch_5d
        0x2011 -> :sswitch_62
        0x2012 -> :sswitch_67
        0x2013 -> :sswitch_6c
        0x2016 -> :sswitch_71
        0x201b -> :sswitch_76
        0x201e -> :sswitch_7b
        0xb001 -> :sswitch_80
        0xb021 -> :sswitch_1c
        0xb023 -> :sswitch_21
        0xb024 -> :sswitch_26
        0xb025 -> :sswitch_2b
        0xb026 -> :sswitch_30
        0xb029 -> :sswitch_35
        0xb040 -> :sswitch_3a
        0xb041 -> :sswitch_3f
        0xb043 -> :sswitch_85
        0xb044 -> :sswitch_8b
        0xb047 -> :sswitch_44
        0xb048 -> :sswitch_91
        0xb049 -> :sswitch_97
        0xb04a -> :sswitch_9d
        0xb04b -> :sswitch_49
        0xb04e -> :sswitch_4e
    .end sparse-switch
.end method

.method public getDistortionCorrectionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 448
    const/16 v0, 0x2013

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Auto"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDynamicRangeOptimizerDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 200
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb025

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 201
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 202
    const/4 v1, 0x0

    .line 218
    :goto_e
    return-object v1

    .line 203
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_4e

    .line 218
    :pswitch_16
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 204
    :pswitch_23
    const-string v1, "Off"

    goto :goto_e

    .line 205
    :pswitch_26
    const-string v1, "Standard"

    goto :goto_e

    .line 206
    :pswitch_29
    const-string v1, "Advanced Auto"

    goto :goto_e

    .line 207
    :pswitch_2c
    const-string v1, "Auto"

    goto :goto_e

    .line 208
    :pswitch_2f
    const-string v1, "Advanced LV1"

    goto :goto_e

    .line 209
    :pswitch_32
    const-string v1, "Advanced LV2"

    goto :goto_e

    .line 210
    :pswitch_35
    const-string v1, "Advanced LV3"

    goto :goto_e

    .line 211
    :pswitch_38
    const-string v1, "Advanced LV4"

    goto :goto_e

    .line 212
    :pswitch_3b
    const-string v1, "Advanced LV5"

    goto :goto_e

    .line 213
    :pswitch_3e
    const-string v1, "LV1"

    goto :goto_e

    .line 214
    :pswitch_41
    const-string v1, "LV2"

    goto :goto_e

    .line 215
    :pswitch_44
    const-string v1, "LV3"

    goto :goto_e

    .line 216
    :pswitch_47
    const-string v1, "LV4"

    goto :goto_e

    .line 217
    :pswitch_4a
    const-string v1, "LV5"

    goto :goto_e

    .line 203
    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_26
        :pswitch_29
        :pswitch_2c
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_2f
        :pswitch_32
        :pswitch_35
        :pswitch_38
        :pswitch_3b
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_3e
        :pswitch_41
        :pswitch_44
        :pswitch_47
        :pswitch_4a
    .end packed-switch
.end method

.method public getExposureModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 280
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb041

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 281
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 282
    const/4 v1, 0x0

    .line 315
    :goto_e
    return-object v1

    .line 283
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_80

    .line 315
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 284
    :sswitch_23
    const-string v1, "Program"

    goto :goto_e

    .line 285
    :sswitch_26
    const-string v1, "Portrait"

    goto :goto_e

    .line 286
    :sswitch_29
    const-string v1, "Beach"

    goto :goto_e

    .line 287
    :sswitch_2c
    const-string v1, "Sports"

    goto :goto_e

    .line 288
    :sswitch_2f
    const-string v1, "Snow"

    goto :goto_e

    .line 289
    :sswitch_32
    const-string v1, "Landscape"

    goto :goto_e

    .line 290
    :sswitch_35
    const-string v1, "Auto"

    goto :goto_e

    .line 291
    :sswitch_38
    const-string v1, "Aperture Priority"

    goto :goto_e

    .line 292
    :sswitch_3b
    const-string v1, "Shutter Priority"

    goto :goto_e

    .line 293
    :sswitch_3e
    const-string v1, "Night Scene / Twilight"

    goto :goto_e

    .line 294
    :sswitch_41
    const-string v1, "Hi-Speed Shutter"

    goto :goto_e

    .line 295
    :sswitch_44
    const-string v1, "Twilight Portrait"

    goto :goto_e

    .line 296
    :sswitch_47
    const-string v1, "Soft Snap/Portrait"

    goto :goto_e

    .line 297
    :sswitch_4a
    const-string v1, "Fireworks"

    goto :goto_e

    .line 298
    :sswitch_4d
    const-string v1, "Smile Shutter"

    goto :goto_e

    .line 299
    :sswitch_50
    const-string v1, "Manual"

    goto :goto_e

    .line 300
    :sswitch_53
    const-string v1, "High Sensitivity"

    goto :goto_e

    .line 301
    :sswitch_56
    const-string v1, "Macro"

    goto :goto_e

    .line 302
    :sswitch_59
    const-string v1, "Advanced Sports Shooting"

    goto :goto_e

    .line 303
    :sswitch_5c
    const-string v1, "Underwater"

    goto :goto_e

    .line 304
    :sswitch_5f
    const-string v1, "Food"

    goto :goto_e

    .line 305
    :sswitch_62
    const-string v1, "Panorama"

    goto :goto_e

    .line 306
    :sswitch_65
    const-string v1, "Handheld Night Shot"

    goto :goto_e

    .line 307
    :sswitch_68
    const-string v1, "Anti Motion Blur"

    goto :goto_e

    .line 308
    :sswitch_6b
    const-string v1, "Pet"

    goto :goto_e

    .line 309
    :sswitch_6e
    const-string v1, "Backlight Correction HDR"

    goto :goto_e

    .line 310
    :sswitch_71
    const-string v1, "Superior Auto"

    goto :goto_e

    .line 311
    :sswitch_74
    const-string v1, "Background Defocus"

    goto :goto_e

    .line 312
    :sswitch_77
    const-string v1, "Soft Skin"

    goto :goto_e

    .line 313
    :sswitch_7a
    const-string v1, "3D Image"

    goto :goto_e

    .line 314
    :sswitch_7d
    const-string v1, "N/A"

    goto :goto_e

    .line 283
    :sswitch_data_80
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0x2 -> :sswitch_29
        0x3 -> :sswitch_2c
        0x4 -> :sswitch_2f
        0x5 -> :sswitch_32
        0x6 -> :sswitch_35
        0x7 -> :sswitch_38
        0x8 -> :sswitch_3b
        0x9 -> :sswitch_3e
        0xa -> :sswitch_41
        0xb -> :sswitch_44
        0xc -> :sswitch_47
        0xd -> :sswitch_4a
        0xe -> :sswitch_4d
        0xf -> :sswitch_50
        0x12 -> :sswitch_53
        0x13 -> :sswitch_56
        0x14 -> :sswitch_59
        0x1d -> :sswitch_5c
        0x21 -> :sswitch_5f
        0x22 -> :sswitch_62
        0x23 -> :sswitch_65
        0x24 -> :sswitch_68
        0x25 -> :sswitch_6b
        0x26 -> :sswitch_6e
        0x27 -> :sswitch_71
        0x28 -> :sswitch_74
        0x29 -> :sswitch_77
        0x2a -> :sswitch_7a
        0xffff -> :sswitch_7d
    .end sparse-switch
.end method

.method public getFlashExposureCompensationDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 135
    const/16 v0, 0x104

    const-string v1, "%d EV"

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getFormattedInt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashLevelDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 623
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb048

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 625
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 626
    const/4 v1, 0x0

    .line 640
    :goto_e
    return-object v1

    .line 628
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_4e

    .line 640
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

    goto :goto_e

    .line 629
    :sswitch_30
    const-string v1, "Low"

    goto :goto_e

    .line 630
    :sswitch_33
    const-string v1, "-3/3"

    goto :goto_e

    .line 631
    :sswitch_36
    const-string v1, "-2/3"

    goto :goto_e

    .line 632
    :sswitch_39
    const-string v1, "-1/3"

    goto :goto_e

    .line 633
    :sswitch_3c
    const-string v1, "Normal"

    goto :goto_e

    .line 634
    :sswitch_3f
    const-string v1, "+1/3"

    goto :goto_e

    .line 635
    :sswitch_42
    const-string v1, "+2/3"

    goto :goto_e

    .line 636
    :sswitch_45
    const-string v1, "+3/3"

    goto :goto_e

    .line 637
    :sswitch_48
    const-string v1, "n/a"

    goto :goto_e

    .line 638
    :sswitch_4b
    const-string v1, "High"

    goto :goto_e

    .line 628
    :sswitch_data_4e
    .sparse-switch
        -0x8000 -> :sswitch_30
        -0x3 -> :sswitch_33
        -0x2 -> :sswitch_36
        -0x1 -> :sswitch_39
        0x0 -> :sswitch_3c
        0x1 -> :sswitch_3f
        0x2 -> :sswitch_42
        0x3 -> :sswitch_45
        0x80 -> :sswitch_48
        0x7fff -> :sswitch_4b
    .end sparse-switch
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 460
    const/16 v0, 0x201b

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Manual"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v4, v1, v2

    const/4 v2, 0x2

    const-string v3, "AF-A"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "AF-C"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "AF-S"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object v4, v1, v2

    const/4 v2, 0x6

    const-string v3, "DMF"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "AF-D"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHighIsoNoiseReductionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 366
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const/16 v2, 0x2009

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 367
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 368
    const/4 v1, 0x0

    .line 376
    :goto_d
    return-object v1

    .line 369
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_34

    .line 376
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 370
    :sswitch_22
    const-string v1, "Off"

    goto :goto_d

    .line 371
    :sswitch_25
    const-string v1, "On"

    goto :goto_d

    .line 372
    :sswitch_28
    const-string v1, "Normal"

    goto :goto_d

    .line 373
    :sswitch_2b
    const-string v1, "High"

    goto :goto_d

    .line 374
    :sswitch_2e
    const-string v1, "Auto"

    goto :goto_d

    .line 375
    :sswitch_31
    const-string v1, "N/A"

    goto :goto_d

    .line 369
    :sswitch_data_34
    .sparse-switch
        0x0 -> :sswitch_22
        0x1 -> :sswitch_25
        0x2 -> :sswitch_28
        0x3 -> :sswitch_2b
        0x100 -> :sswitch_2e
        0xffff -> :sswitch_31
    .end sparse-switch
.end method

.method public getImageQualityDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 120
    const/16 v0, 0x102

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "RAW"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Super Fine"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Fine"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Economy"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Extra Fine"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "RAW + JPEG"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Compressed RAW"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Compressed RAW + JPEG"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageStabilizationDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 225
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb026

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 226
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 227
    const/4 v1, 0x0

    .line 231
    :goto_e
    return-object v1

    .line 228
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    .line 231
    const-string v1, "N/A"

    goto :goto_e

    .line 229
    :pswitch_19
    const-string v1, "Off"

    goto :goto_e

    .line 230
    :pswitch_1c
    const-string v1, "On"

    goto :goto_e

    .line 228
    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_19
        :pswitch_1c
    .end packed-switch
.end method

.method public getJpegQualityDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 322
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb047

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 323
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 324
    const/4 v1, 0x0

    .line 330
    :goto_e
    return-object v1

    .line 325
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_30

    .line 330
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 326
    :sswitch_23
    const-string v1, "Normal"

    goto :goto_e

    .line 327
    :sswitch_26
    const-string v1, "Fine"

    goto :goto_e

    .line 328
    :sswitch_29
    const-string v1, "Extra Fine"

    goto :goto_e

    .line 329
    :sswitch_2c
    const-string v1, "N/A"

    goto :goto_e

    .line 325
    nop

    :sswitch_data_30
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0x2 -> :sswitch_29
        0xffff -> :sswitch_2c
    .end sparse-switch
.end method

.method public getLateralChromaticAberrationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 442
    const/16 v0, 0x2012

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Auto"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLongExposureNoiseReductionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 352
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb04e

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 353
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 354
    const/4 v1, 0x0

    .line 359
    :goto_e
    return-object v1

    .line 355
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_2c

    .line 359
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 356
    :sswitch_23
    const-string v1, "Off"

    goto :goto_e

    .line 357
    :sswitch_26
    const-string v1, "On"

    goto :goto_e

    .line 358
    :sswitch_29
    const-string v1, "N/A"

    goto :goto_e

    .line 355
    :sswitch_data_2c
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0xffff -> :sswitch_29
    .end sparse-switch
.end method

.method public getMacroDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 265
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb040

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 266
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 267
    const/4 v1, 0x0

    .line 273
    :goto_e
    return-object v1

    .line 268
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_30

    .line 273
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 269
    :sswitch_23
    const-string v1, "Off"

    goto :goto_e

    .line 270
    :sswitch_26
    const-string v1, "On"

    goto :goto_e

    .line 271
    :sswitch_29
    const-string v1, "Magnifying Glass/Super Macro"

    goto :goto_e

    .line 272
    :sswitch_2c
    const-string v1, "N/A"

    goto :goto_e

    .line 268
    nop

    :sswitch_data_30
    .sparse-switch
        0x0 -> :sswitch_23
        0x1 -> :sswitch_26
        0x2 -> :sswitch_29
        0xffff -> :sswitch_2c
    .end sparse-switch
.end method

.method public getPictureEffectDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 383
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const/16 v2, 0x200e

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 384
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 385
    const/4 v1, 0x0

    .line 423
    :goto_d
    return-object v1

    .line 386
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_8e

    .line 423
    const-string v1, "Unknown (%d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 387
    :sswitch_22
    const-string v1, "Off"

    goto :goto_d

    .line 388
    :sswitch_25
    const-string v1, "Toy Camera"

    goto :goto_d

    .line 389
    :sswitch_28
    const-string v1, "Pop Color"

    goto :goto_d

    .line 390
    :sswitch_2b
    const-string v1, "Posterization"

    goto :goto_d

    .line 391
    :sswitch_2e
    const-string v1, "Posterization B/W"

    goto :goto_d

    .line 392
    :sswitch_31
    const-string v1, "Retro Photo"

    goto :goto_d

    .line 393
    :sswitch_34
    const-string v1, "Soft High Key"

    goto :goto_d

    .line 394
    :sswitch_37
    const-string v1, "Partial Color (red)"

    goto :goto_d

    .line 395
    :sswitch_3a
    const-string v1, "Partial Color (green)"

    goto :goto_d

    .line 396
    :sswitch_3d
    const-string v1, "Partial Color (blue)"

    goto :goto_d

    .line 397
    :sswitch_40
    const-string v1, "Partial Color (yellow)"

    goto :goto_d

    .line 398
    :sswitch_43
    const-string v1, "High Contrast Monochrome"

    goto :goto_d

    .line 399
    :sswitch_46
    const-string v1, "Toy Camera (normal)"

    goto :goto_d

    .line 400
    :sswitch_49
    const-string v1, "Toy Camera (cool)"

    goto :goto_d

    .line 401
    :sswitch_4c
    const-string v1, "Toy Camera (warm)"

    goto :goto_d

    .line 402
    :sswitch_4f
    const-string v1, "Toy Camera (green)"

    goto :goto_d

    .line 403
    :sswitch_52
    const-string v1, "Toy Camera (magenta)"

    goto :goto_d

    .line 404
    :sswitch_55
    const-string v1, "Soft Focus (low)"

    goto :goto_d

    .line 405
    :sswitch_58
    const-string v1, "Soft Focus"

    goto :goto_d

    .line 406
    :sswitch_5b
    const-string v1, "Soft Focus (high)"

    goto :goto_d

    .line 407
    :sswitch_5e
    const-string v1, "Miniature (auto)"

    goto :goto_d

    .line 408
    :sswitch_61
    const-string v1, "Miniature (top)"

    goto :goto_d

    .line 409
    :sswitch_64
    const-string v1, "Miniature (middle horizontal)"

    goto :goto_d

    .line 410
    :sswitch_67
    const-string v1, "Miniature (bottom)"

    goto :goto_d

    .line 411
    :sswitch_6a
    const-string v1, "Miniature (left)"

    goto :goto_d

    .line 412
    :sswitch_6d
    const-string v1, "Miniature (middle vertical)"

    goto :goto_d

    .line 413
    :sswitch_70
    const-string v1, "Miniature (right)"

    goto :goto_d

    .line 414
    :sswitch_73
    const-string v1, "HDR Painting (low)"

    goto :goto_d

    .line 415
    :sswitch_76
    const-string v1, "HDR Painting"

    goto :goto_d

    .line 416
    :sswitch_79
    const-string v1, "HDR Painting (high)"

    goto :goto_d

    .line 417
    :sswitch_7c
    const-string v1, "Rich-tone Monochrome"

    goto :goto_d

    .line 418
    :sswitch_7f
    const-string v1, "Water Color"

    goto :goto_d

    .line 419
    :sswitch_82
    const-string v1, "Water Color 2"

    goto :goto_d

    .line 420
    :sswitch_85
    const-string v1, "Illustration (low)"

    goto :goto_d

    .line 421
    :sswitch_88
    const-string v1, "Illustration"

    goto :goto_d

    .line 422
    :sswitch_8b
    const-string v1, "Illustration (high)"

    goto :goto_d

    .line 386
    :sswitch_data_8e
    .sparse-switch
        0x0 -> :sswitch_22
        0x1 -> :sswitch_25
        0x2 -> :sswitch_28
        0x3 -> :sswitch_2b
        0x4 -> :sswitch_2e
        0x5 -> :sswitch_31
        0x6 -> :sswitch_34
        0x7 -> :sswitch_37
        0x8 -> :sswitch_3a
        0x9 -> :sswitch_3d
        0xa -> :sswitch_40
        0xd -> :sswitch_43
        0x10 -> :sswitch_46
        0x11 -> :sswitch_49
        0x12 -> :sswitch_4c
        0x13 -> :sswitch_4f
        0x14 -> :sswitch_52
        0x20 -> :sswitch_55
        0x21 -> :sswitch_58
        0x22 -> :sswitch_5b
        0x30 -> :sswitch_5e
        0x31 -> :sswitch_61
        0x32 -> :sswitch_64
        0x33 -> :sswitch_67
        0x34 -> :sswitch_6a
        0x35 -> :sswitch_6d
        0x36 -> :sswitch_70
        0x40 -> :sswitch_73
        0x41 -> :sswitch_76
        0x42 -> :sswitch_79
        0x50 -> :sswitch_7c
        0x61 -> :sswitch_7f
        0x62 -> :sswitch_82
        0x70 -> :sswitch_85
        0x71 -> :sswitch_88
        0x72 -> :sswitch_8b
    .end sparse-switch
.end method

.method public getReleaseModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 647
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb049

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 649
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 650
    const/4 v1, 0x0

    .line 659
    :goto_e
    return-object v1

    .line 652
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_40

    .line 659
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

    goto :goto_e

    .line 653
    :sswitch_30
    const-string v1, "Normal"

    goto :goto_e

    .line 654
    :sswitch_33
    const-string v1, "Continuous"

    goto :goto_e

    .line 655
    :sswitch_36
    const-string v1, "Exposure Bracketing"

    goto :goto_e

    .line 656
    :sswitch_39
    const-string v1, "White Balance Bracketing"

    goto :goto_e

    .line 657
    :sswitch_3c
    const-string v1, "n/a"

    goto :goto_e

    .line 652
    nop

    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_30
        0x2 -> :sswitch_33
        0x5 -> :sswitch_36
        0x6 -> :sswitch_39
        0xffff -> :sswitch_3c
    .end sparse-switch
.end method

.method public getSceneModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 546
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb023

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 548
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 549
    const/4 v1, 0x0

    .line 576
    :goto_e
    return-object v1

    .line 551
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_76

    .line 576
    :pswitch_16
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

    goto :goto_e

    .line 552
    :pswitch_30
    const-string v1, "Standard"

    goto :goto_e

    .line 553
    :pswitch_33
    const-string v1, "Portrait"

    goto :goto_e

    .line 554
    :pswitch_36
    const-string v1, "Text"

    goto :goto_e

    .line 555
    :pswitch_39
    const-string v1, "Night Scene"

    goto :goto_e

    .line 556
    :pswitch_3c
    const-string v1, "Sunset"

    goto :goto_e

    .line 557
    :pswitch_3f
    const-string v1, "Sports"

    goto :goto_e

    .line 558
    :pswitch_42
    const-string v1, "Landscape"

    goto :goto_e

    .line 559
    :pswitch_45
    const-string v1, "Night Portrait"

    goto :goto_e

    .line 560
    :pswitch_48
    const-string v1, "Macro"

    goto :goto_e

    .line 561
    :pswitch_4b
    const-string v1, "Super Macro"

    goto :goto_e

    .line 562
    :pswitch_4e
    const-string v1, "Auto"

    goto :goto_e

    .line 563
    :pswitch_51
    const-string v1, "Night View/Portrait"

    goto :goto_e

    .line 564
    :pswitch_54
    const-string v1, "Sweep Panorama"

    goto :goto_e

    .line 565
    :pswitch_57
    const-string v1, "Handheld Night Shot"

    goto :goto_e

    .line 566
    :pswitch_5a
    const-string v1, "Anti Motion Blur"

    goto :goto_e

    .line 567
    :pswitch_5d
    const-string v1, "Cont. Priority AE"

    goto :goto_e

    .line 568
    :pswitch_60
    const-string v1, "Auto+"

    goto :goto_e

    .line 569
    :pswitch_63
    const-string v1, "3D Sweep Panorama"

    goto :goto_e

    .line 570
    :pswitch_66
    const-string v1, "Superior Auto"

    goto :goto_e

    .line 571
    :pswitch_69
    const-string v1, "High Sensitivity"

    goto :goto_e

    .line 572
    :pswitch_6c
    const-string v1, "Fireworks"

    goto :goto_e

    .line 573
    :pswitch_6f
    const-string v1, "Food"

    goto :goto_e

    .line 574
    :pswitch_72
    const-string v1, "Pet"

    goto :goto_e

    .line 551
    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_30
        :pswitch_33
        :pswitch_36
        :pswitch_39
        :pswitch_3c
        :pswitch_3f
        :pswitch_42
        :pswitch_45
        :pswitch_48
        :pswitch_4b
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_4e
        :pswitch_51
        :pswitch_54
        :pswitch_57
        :pswitch_5a
        :pswitch_5d
        :pswitch_60
        :pswitch_63
        :pswitch_66
        :pswitch_69
        :pswitch_6c
        :pswitch_6f
        :pswitch_72
    .end packed-switch
.end method

.method public getSequenceNumberDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 666
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb049

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 668
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 669
    const/4 v1, 0x0

    .line 675
    :goto_e
    return-object v1

    .line 671
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_22

    .line 675
    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 672
    :sswitch_1b
    const-string v1, "Single"

    goto :goto_e

    .line 673
    :sswitch_1e
    const-string v1, "n/a"

    goto :goto_e

    .line 671
    nop

    :sswitch_data_22
    .sparse-switch
        0x0 -> :sswitch_1b
        0xffff -> :sswitch_1e
    .end sparse-switch
.end method

.method public getSoftSkinEffectDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 430
    const/16 v0, 0x200f

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Mid"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "High"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSonyModelIdDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 494
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const v2, 0xb001

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 496
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 497
    const/4 v1, 0x0

    .line 539
    :goto_e
    return-object v1

    .line 499
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_aa

    .line 539
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

    goto :goto_e

    .line 500
    :sswitch_30
    const-string v1, "DSC-R1"

    goto :goto_e

    .line 501
    :sswitch_33
    const-string v1, "DSLR-A100"

    goto :goto_e

    .line 502
    :sswitch_36
    const-string v1, "DSLR-A900"

    goto :goto_e

    .line 503
    :sswitch_39
    const-string v1, "DSLR-A700"

    goto :goto_e

    .line 504
    :sswitch_3c
    const-string v1, "DSLR-A200"

    goto :goto_e

    .line 505
    :sswitch_3f
    const-string v1, "DSLR-A350"

    goto :goto_e

    .line 506
    :sswitch_42
    const-string v1, "DSLR-A300"

    goto :goto_e

    .line 507
    :sswitch_45
    const-string v1, "DSLR-A900 (APS-C mode)"

    goto :goto_e

    .line 508
    :sswitch_48
    const-string v1, "DSLR-A380/A390"

    goto :goto_e

    .line 509
    :sswitch_4b
    const-string v1, "DSLR-A330"

    goto :goto_e

    .line 510
    :sswitch_4e
    const-string v1, "DSLR-A230"

    goto :goto_e

    .line 511
    :sswitch_51
    const-string v1, "DSLR-A290"

    goto :goto_e

    .line 512
    :sswitch_54
    const-string v1, "DSLR-A850"

    goto :goto_e

    .line 513
    :sswitch_57
    const-string v1, "DSLR-A850 (APS-C mode)"

    goto :goto_e

    .line 514
    :sswitch_5a
    const-string v1, "DSLR-A550"

    goto :goto_e

    .line 515
    :sswitch_5d
    const-string v1, "DSLR-A500"

    goto :goto_e

    .line 516
    :sswitch_60
    const-string v1, "DSLR-A450"

    goto :goto_e

    .line 517
    :sswitch_63
    const-string v1, "NEX-5"

    goto :goto_e

    .line 518
    :sswitch_66
    const-string v1, "NEX-3"

    goto :goto_e

    .line 519
    :sswitch_69
    const-string v1, "SLT-A33"

    goto :goto_e

    .line 520
    :sswitch_6c
    const-string v1, "SLT-A55V"

    goto :goto_e

    .line 521
    :sswitch_6f
    const-string v1, "DSLR-A560"

    goto :goto_e

    .line 522
    :sswitch_72
    const-string v1, "DSLR-A580"

    goto :goto_e

    .line 523
    :sswitch_75
    const-string v1, "NEX-C3"

    goto :goto_e

    .line 524
    :sswitch_78
    const-string v1, "SLT-A35"

    goto :goto_e

    .line 525
    :sswitch_7b
    const-string v1, "SLT-A65V"

    goto :goto_e

    .line 526
    :sswitch_7e
    const-string v1, "SLT-A77V"

    goto :goto_e

    .line 527
    :sswitch_81
    const-string v1, "NEX-5N"

    goto :goto_e

    .line 528
    :sswitch_84
    const-string v1, "NEX-7"

    goto :goto_e

    .line 529
    :sswitch_87
    const-string v1, "NEX-VG20E"

    goto :goto_e

    .line 530
    :sswitch_8a
    const-string v1, "SLT-A37"

    goto :goto_e

    .line 531
    :sswitch_8d
    const-string v1, "SLT-A57"

    goto/16 :goto_e

    .line 532
    :sswitch_91
    const-string v1, "NEX-F3"

    goto/16 :goto_e

    .line 533
    :sswitch_95
    const-string v1, "SLT-A99V"

    goto/16 :goto_e

    .line 534
    :sswitch_99
    const-string v1, "NEX-6"

    goto/16 :goto_e

    .line 535
    :sswitch_9d
    const-string v1, "NEX-5R"

    goto/16 :goto_e

    .line 536
    :sswitch_a1
    const-string v1, "DSC-RX100"

    goto/16 :goto_e

    .line 537
    :sswitch_a5
    const-string v1, "DSC-RX1"

    goto/16 :goto_e

    .line 499
    nop

    :sswitch_data_aa
    .sparse-switch
        0x2 -> :sswitch_30
        0x100 -> :sswitch_33
        0x101 -> :sswitch_36
        0x102 -> :sswitch_39
        0x103 -> :sswitch_3c
        0x104 -> :sswitch_3f
        0x105 -> :sswitch_42
        0x106 -> :sswitch_45
        0x107 -> :sswitch_48
        0x108 -> :sswitch_4b
        0x109 -> :sswitch_4e
        0x10a -> :sswitch_51
        0x10d -> :sswitch_54
        0x10e -> :sswitch_57
        0x111 -> :sswitch_5a
        0x112 -> :sswitch_5d
        0x113 -> :sswitch_60
        0x116 -> :sswitch_63
        0x117 -> :sswitch_66
        0x118 -> :sswitch_69
        0x119 -> :sswitch_6c
        0x11a -> :sswitch_6f
        0x11b -> :sswitch_72
        0x11c -> :sswitch_75
        0x11d -> :sswitch_78
        0x11e -> :sswitch_7b
        0x11f -> :sswitch_7e
        0x120 -> :sswitch_81
        0x121 -> :sswitch_84
        0x122 -> :sswitch_87
        0x123 -> :sswitch_8a
        0x124 -> :sswitch_8d
        0x125 -> :sswitch_91
        0x126 -> :sswitch_95
        0x127 -> :sswitch_99
        0x128 -> :sswitch_9d
        0x129 -> :sswitch_a1
        0x12a -> :sswitch_a5
    .end sparse-switch
.end method

.method public getTeleconverterDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 141
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const/16 v2, 0x105

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 142
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 143
    const/4 v1, 0x0

    .line 153
    :goto_d
    return-object v1

    .line 144
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_44

    .line 153
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

    .line 145
    :sswitch_2f
    const-string v1, "None"

    goto :goto_d

    .line 146
    :sswitch_32
    const-string v1, "Minolta/Sony AF 2x APO (D)"

    goto :goto_d

    .line 147
    :sswitch_35
    const-string v1, "Minolta AF 2x APO II"

    goto :goto_d

    .line 148
    :sswitch_38
    const-string v1, "Minolta AF 2x APO"

    goto :goto_d

    .line 149
    :sswitch_3b
    const-string v1, "Minolta/Sony AF 1.4x APO (D)"

    goto :goto_d

    .line 150
    :sswitch_3e
    const-string v1, "Minolta AF 1.4x APO II"

    goto :goto_d

    .line 151
    :sswitch_41
    const-string v1, "Minolta AF 1.4x APO"

    goto :goto_d

    .line 144
    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_2f
        0x48 -> :sswitch_32
        0x50 -> :sswitch_35
        0x60 -> :sswitch_38
        0x88 -> :sswitch_3b
        0x90 -> :sswitch_3e
        0xa0 -> :sswitch_41
    .end sparse-switch
.end method

.method public getVignettingCorrectionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 436
    const/16 v0, 0x2011

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Auto"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 160
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;

    const/16 v2, 0x115

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 161
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 162
    const/4 v1, 0x0

    .line 174
    :goto_d
    return-object v1

    .line 163
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_4a

    .line 174
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

    .line 164
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 165
    :sswitch_32
    const-string v1, "Color Temperature/Color Filter"

    goto :goto_d

    .line 166
    :sswitch_35
    const-string v1, "Daylight"

    goto :goto_d

    .line 167
    :sswitch_38
    const-string v1, "Cloudy"

    goto :goto_d

    .line 168
    :sswitch_3b
    const-string v1, "Shade"

    goto :goto_d

    .line 169
    :sswitch_3e
    const-string v1, "Tungsten"

    goto :goto_d

    .line 170
    :sswitch_41
    const-string v1, "Flash"

    goto :goto_d

    .line 171
    :sswitch_44
    const-string v1, "Fluorescent"

    goto :goto_d

    .line 172
    :sswitch_47
    const-string v1, "Custom"

    goto :goto_d

    .line 163
    :sswitch_data_4a
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x10 -> :sswitch_35
        0x20 -> :sswitch_38
        0x30 -> :sswitch_3b
        0x40 -> :sswitch_3e
        0x50 -> :sswitch_41
        0x60 -> :sswitch_44
        0x70 -> :sswitch_47
    .end sparse-switch
.end method

.method public getZoneMatchingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 193
    const v0, 0xb024

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "ISO Setting Used"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "High Key"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Low Key"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
