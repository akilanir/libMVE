.class public Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "CanonMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 42
    return-void
.end method


# virtual methods
.method public getAfPointSelectedDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 470
    const v0, 0xc113

    const/16 v1, 0x3000

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "None (MF)"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "Auto selected"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "Right"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "Centre"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "Left"

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAfPointUsedDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 355
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc20e

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 356
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 357
    const/4 v1, 0x0

    .line 365
    :goto_e
    return-object v1

    .line 358
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    if-nez v1, :cond_1a

    .line 359
    const-string v1, "Right"

    goto :goto_e

    .line 360
    :cond_1a
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    const/4 v2, 0x1

    if-ne v1, v2, :cond_26

    .line 361
    const-string v1, "Centre"

    goto :goto_e

    .line 362
    :cond_26
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    const/4 v2, 0x2

    if-ne v1, v2, :cond_32

    .line 363
    const-string v1, "Left"

    goto :goto_e

    .line 365
    :cond_32
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
.end method

.method public getContinuousDriveModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 627
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc105

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 628
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 629
    const/4 v2, 0x0

    .line 638
    :goto_e
    return-object v2

    .line 630
    :cond_f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    packed-switch v2, :pswitch_data_4c

    .line 638
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    .line 632
    :pswitch_30
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc102

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 633
    .local v0, "delay":Ljava/lang/Integer;
    if-eqz v0, :cond_49

    .line 634
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_46

    const-string v2, "Single shot"

    goto :goto_e

    :cond_46
    const-string v2, "Single shot with self-timer"

    goto :goto_e

    .line 636
    .end local v0    # "delay":Ljava/lang/Integer;
    :cond_49
    :pswitch_49
    const-string v2, "Continuous"

    goto :goto_e

    .line 630
    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_30
        :pswitch_49
    .end packed-switch
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 562
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc10d

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 563
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 564
    const/4 v1, 0x0

    .line 573
    :goto_e
    return-object v1

    .line 565
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3a

    .line 573
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

    .line 567
    :sswitch_30
    const-string v1, "Low"

    goto :goto_e

    .line 569
    :sswitch_33
    const-string v1, "Normal"

    goto :goto_e

    .line 571
    :sswitch_36
    const-string v1, "High"

    goto :goto_e

    .line 565
    nop

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_33
        0x1 -> :sswitch_36
        0xffff -> :sswitch_30
    .end sparse-switch
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 48
    sparse-switch p1, :sswitch_data_98

    .line 136
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 50
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getSerialNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFlashActivityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocusTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getMacroModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getSelfTimerDelayDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getContinuousDriveModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocusMode1Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getImageSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getEasyShootingModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 76
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 78
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 80
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIsoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 82
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getMeteringModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 84
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getAfPointSelectedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 86
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 88
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getLensTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 90
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getLongFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 92
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getShortFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 94
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocalUnitsPerMillimetreDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 96
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFlashDetailsDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 98
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocusMode2Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 100
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 102
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getAfPointUsedDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 104
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFlashBiasDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 48
    nop

    :sswitch_data_98
    .sparse-switch
        0xc -> :sswitch_8
        0xc101 -> :sswitch_21
        0xc102 -> :sswitch_26
        0xc103 -> :sswitch_1c
        0xc104 -> :sswitch_2b
        0xc105 -> :sswitch_30
        0xc107 -> :sswitch_35
        0xc10a -> :sswitch_3a
        0xc10b -> :sswitch_3f
        0xc10c -> :sswitch_17
        0xc10d -> :sswitch_44
        0xc10e -> :sswitch_49
        0xc10f -> :sswitch_4e
        0xc110 -> :sswitch_53
        0xc111 -> :sswitch_58
        0xc112 -> :sswitch_12
        0xc113 -> :sswitch_5d
        0xc114 -> :sswitch_62
        0xc116 -> :sswitch_67
        0xc117 -> :sswitch_6c
        0xc118 -> :sswitch_71
        0xc119 -> :sswitch_76
        0xc11c -> :sswitch_d
        0xc11d -> :sswitch_7b
        0xc120 -> :sswitch_80
        0xc207 -> :sswitch_85
        0xc20e -> :sswitch_8b
        0xc20f -> :sswitch_91
    .end sparse-switch
.end method

.method public getDigitalZoomDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 699
    const v0, 0xc10c

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No digital zoom"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "2x"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "4x"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEasyShootingModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 580
    const v0, 0xc10b

    const/16 v1, 0xc

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Full auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Landscape"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Fast shutter"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Slow shutter"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Night"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "B&W"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Sepia"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Portrait"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "Sports"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "Macro / Closeup"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "Pan focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 447
    const v0, 0xc114

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Easy shooting"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Program"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Tv-priority"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Av-priority"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Manual"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "A-DEP"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashActivityDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 725
    const v0, 0xc11c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Flash did not fire"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Flash fired"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashBiasDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 332
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc20f

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 334
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 335
    const/4 v2, 0x0

    .line 349
    :goto_e
    return-object v2

    .line 337
    :cond_f
    const/4 v0, 0x0

    .line 338
    .local v0, "isNegative":Z
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0xf000

    if-le v2, v3, :cond_30

    .line 339
    const/4 v0, 0x1

    .line 340
    const v2, 0xffff

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 341
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 349
    :cond_30
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v0, :cond_58

    const-string v2, "-"

    :goto_39
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x42000000    # 32.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " EV"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    :cond_58
    const-string v2, ""

    goto :goto_39
.end method

.method public getFlashDetailsDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 393
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc11d

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 394
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 395
    const/4 v1, 0x0

    .line 408
    :goto_e
    return-object v1

    .line 396
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    shr-int/lit8 v1, v1, 0xe

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_1c

    .line 397
    const-string v1, "External E-TTL"

    goto :goto_e

    .line 399
    :cond_1c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    shr-int/lit8 v1, v1, 0xd

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_29

    .line 400
    const-string v1, "Internal flash"

    goto :goto_e

    .line 402
    :cond_29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    shr-int/lit8 v1, v1, 0xb

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_36

    .line 403
    const-string v1, "FP sync used"

    goto :goto_e

    .line 405
    :cond_36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    shr-int/lit8 v1, v1, 0x4

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_43

    .line 406
    const-string v1, "FP sync enabled"

    goto :goto_e

    .line 408
    :cond_43
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
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 644
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc104

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 645
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 646
    const/4 v1, 0x0

    .line 666
    :goto_e
    return-object v1

    .line 647
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_48

    .line 666
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

    .line 649
    :pswitch_30
    const-string v1, "No flash fired"

    goto :goto_e

    .line 651
    :pswitch_33
    const-string v1, "Auto"

    goto :goto_e

    .line 653
    :pswitch_36
    const-string v1, "On"

    goto :goto_e

    .line 655
    :pswitch_39
    const-string v1, "Red-eye reduction"

    goto :goto_e

    .line 657
    :pswitch_3c
    const-string v1, "Slow-synchro"

    goto :goto_e

    .line 659
    :pswitch_3f
    const-string v1, "Auto and red-eye reduction"

    goto :goto_e

    .line 661
    :pswitch_42
    const-string v1, "On and red-eye reduction"

    goto :goto_e

    .line 664
    :pswitch_45
    const-string v1, "External flash"

    goto :goto_e

    .line 647
    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_30
        :pswitch_33
        :pswitch_36
        :pswitch_39
        :pswitch_3c
        :pswitch_3f
        :pswitch_42
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_45
    .end packed-switch
.end method

.method public getFocalUnitsPerMillimetreDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 414
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc119

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 415
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 416
    const/4 v1, 0x0

    .line 420
    :goto_e
    return-object v1

    .line 417
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_1e

    .line 418
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 420
    :cond_1e
    const-string v1, ""

    goto :goto_e
.end method

.method public getFocusMode1Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 611
    const v0, 0xc107

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "One-shot"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "AI Servo"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "AI Focus"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Manual Focus"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Single"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Continuous"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Manual Focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusMode2Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 387
    const v0, 0xc120

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Single"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Continuous"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusTypeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 705
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc112

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 706
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 707
    const/4 v1, 0x0

    .line 718
    :goto_e
    return-object v1

    .line 708
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_3c

    .line 718
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

    .line 710
    :pswitch_30
    const-string v1, "Manual"

    goto :goto_e

    .line 712
    :pswitch_33
    const-string v1, "Auto"

    goto :goto_e

    .line 714
    :pswitch_36
    const-string v1, "Close-up (Macro)"

    goto :goto_e

    .line 716
    :pswitch_39
    const-string v1, "Locked (Pan Mode)"

    goto :goto_e

    .line 708
    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_30
        :pswitch_33
        :pswitch_16
        :pswitch_36
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_39
    .end packed-switch
.end method

.method public getImageSizeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 600
    const v0, 0xc10a

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Large"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Medium"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Small"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIsoDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 496
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc110

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 497
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 498
    const/4 v2, 0x0

    .line 519
    :goto_e
    return-object v2

    .line 501
    :cond_f
    const/16 v0, 0x4000

    .line 502
    .local v0, "canonMask":I
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/2addr v2, v0

    if-lez v2, :cond_32

    .line 503
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    and-int/lit16 v3, v3, -0x4001

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    .line 505
    :cond_32
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sparse-switch v2, :sswitch_data_66

    .line 519
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    .line 507
    :sswitch_53
    const-string v2, "Not specified (see ISOSpeedRatings tag)"

    goto :goto_e

    .line 509
    :sswitch_56
    const-string v2, "Auto"

    goto :goto_e

    .line 511
    :sswitch_59
    const-string v2, "50"

    goto :goto_e

    .line 513
    :sswitch_5c
    const-string v2, "100"

    goto :goto_e

    .line 515
    :sswitch_5f
    const-string v2, "200"

    goto :goto_e

    .line 517
    :sswitch_62
    const-string v2, "400"

    goto :goto_e

    .line 505
    nop

    :sswitch_data_66
    .sparse-switch
        0x0 -> :sswitch_53
        0xf -> :sswitch_56
        0x10 -> :sswitch_59
        0x11 -> :sswitch_5c
        0x12 -> :sswitch_5f
        0x13 -> :sswitch_62
    .end sparse-switch
.end method

.method public getLensTypeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 460
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc116

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 461
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 462
    const/4 v1, 0x0

    .line 464
    :goto_e
    return-object v1

    :cond_f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Lens type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getLongFocalLengthDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 437
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc117

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 438
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 439
    const/4 v2, 0x0

    .line 441
    :goto_e
    return-object v2

    .line 440
    :cond_f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocalUnitsPerMillimetreDescription()Ljava/lang/String;

    move-result-object v0

    .line 441
    .local v0, "units":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e
.end method

.method public getMacroModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 687
    const v0, 0xc101

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Macro"

    aput-object v3, v1, v2

    const-string v2, "Normal"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMeteringModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 484
    const v0, 0xc111

    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Evaluative"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Partial"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Centre weighted"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 693
    const v0, 0xc103

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Fine"

    aput-object v3, v1, v2

    const/4 v2, 0x0

    aput-object v2, v1, v4

    const/4 v2, 0x3

    const-string v3, "Superfine"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSaturationDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 544
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc10e

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 545
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 546
    const/4 v1, 0x0

    .line 555
    :goto_e
    return-object v1

    .line 547
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3a

    .line 555
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

    .line 549
    :sswitch_30
    const-string v1, "Low"

    goto :goto_e

    .line 551
    :sswitch_33
    const-string v1, "Normal"

    goto :goto_e

    .line 553
    :sswitch_36
    const-string v1, "High"

    goto :goto_e

    .line 547
    nop

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_33
        0x1 -> :sswitch_36
        0xffff -> :sswitch_30
    .end sparse-switch
.end method

.method public getSelfTimerDelayDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 673
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc102

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 674
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 675
    const/4 v2, 0x0

    .line 680
    :goto_e
    return-object v2

    .line 676
    :cond_f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_18

    .line 677
    const-string v2, "Self timer not used"

    goto :goto_e

    .line 679
    :cond_18
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 680
    .local v0, "format":Ljava/text/DecimalFormat;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-double v3, v3

    const-wide v5, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sec"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e
.end method

.method public getSerialNumberDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 144
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 145
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 146
    const/4 v1, 0x0

    .line 147
    :goto_d
    return-object v1

    :cond_e
    const-string v1, "%04X%05d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 526
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v2, 0xc10f

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 527
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_f

    .line 528
    const/4 v1, 0x0

    .line 537
    :goto_e
    return-object v1

    .line 529
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3a

    .line 537
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

    .line 531
    :sswitch_30
    const-string v1, "Low"

    goto :goto_e

    .line 533
    :sswitch_33
    const-string v1, "Normal"

    goto :goto_e

    .line 535
    :sswitch_36
    const-string v1, "High"

    goto :goto_e

    .line 529
    nop

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_33
        0x1 -> :sswitch_36
        0xffff -> :sswitch_30
    .end sparse-switch
.end method

.method public getShortFocalLengthDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 427
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;

    const v3, 0xc118

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 428
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_f

    .line 429
    const/4 v2, 0x0

    .line 431
    :goto_e
    return-object v2

    .line 430
    :cond_f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getFocalUnitsPerMillimetreDescription()Ljava/lang/String;

    move-result-object v0

    .line 431
    .local v0, "units":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 372
    const v0, 0xc207

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Sunny"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Cloudy"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Tungsten"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Florescent"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Flash"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Custom"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CanonMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
