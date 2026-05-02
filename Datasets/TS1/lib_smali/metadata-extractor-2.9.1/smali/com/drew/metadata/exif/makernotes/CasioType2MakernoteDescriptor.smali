.class public Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "CasioType2MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getCasioPreviewThumbnailDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 208
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x2000

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 209
    .local v0, "bytes":[B
    if-nez v0, :cond_e

    .line 210
    const/4 v1, 0x0

    .line 211
    :goto_d
    return-object v1

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes of image data>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getCcdIsoSensitivityDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 127
    const/16 v0, 0x3014

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColourModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 121
    const/16 v0, 0x3015

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 230
    const/16 v0, 0x20

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "-1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "+1"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 46
    sparse-switch p1, :sswitch_data_92

    .line 102
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 48
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getThumbnailDimensionsDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getThumbnailSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getThumbnailOffsetDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getQualityModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getImageSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFocusMode1Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIsoSensitivityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getWhiteBalance1Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getPrintImageMatchingInfoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getCasioPreviewThumbnailDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 76
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getWhiteBalanceBiasDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 78
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getWhiteBalance2Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 80
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getObjectDistanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 82
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFlashDistanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 84
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getRecordModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 86
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getSelfTimerDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 88
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 90
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFocusMode2Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 92
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getTimeZoneDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 94
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getCcdIsoSensitivityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 96
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getColourModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 98
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getEnhancementDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 100
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 46
    nop

    :sswitch_data_92
    .sparse-switch
        0x2 -> :sswitch_8
        0x3 -> :sswitch_d
        0x4 -> :sswitch_12
        0x8 -> :sswitch_17
        0x9 -> :sswitch_1c
        0xd -> :sswitch_21
        0x14 -> :sswitch_26
        0x19 -> :sswitch_2b
        0x1d -> :sswitch_30
        0x1f -> :sswitch_35
        0x20 -> :sswitch_3a
        0x21 -> :sswitch_3f
        0xe00 -> :sswitch_44
        0x2000 -> :sswitch_49
        0x2011 -> :sswitch_4e
        0x2012 -> :sswitch_53
        0x2022 -> :sswitch_58
        0x2034 -> :sswitch_5d
        0x3000 -> :sswitch_62
        0x3001 -> :sswitch_67
        0x3002 -> :sswitch_6c
        0x3003 -> :sswitch_71
        0x3006 -> :sswitch_76
        0x3014 -> :sswitch_7b
        0x3015 -> :sswitch_80
        0x3016 -> :sswitch_85
        0x3017 -> :sswitch_8b
    .end sparse-switch
.end method

.method public getEnhancementDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 115
    const/16 v0, 0x3016

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFilterDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 109
    const/16 v0, 0x3017

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashDistanceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 171
    const/16 v0, 0x2034

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocalLengthDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 242
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x1d

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v0

    .line 243
    .local v0, "value":Ljava/lang/Double;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getFocusMode1Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 279
    const/16 v0, 0xd

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusMode2Description()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 139
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x3003

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 140
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 141
    const/4 v1, 0x0

    .line 146
    :goto_d
    return-object v1

    .line 142
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_36

    .line 146
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

    .line 143
    :sswitch_2f
    const-string v1, "Fixation"

    goto :goto_d

    .line 144
    :sswitch_32
    const-string v1, "Multi-Area Focus"

    goto :goto_d

    .line 142
    nop

    :sswitch_data_36
    .sparse-switch
        0x1 -> :sswitch_2f
        0x6 -> :sswitch_32
    .end sparse-switch
.end method

.method public getImageSizeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 285
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 286
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 287
    const/4 v1, 0x0

    .line 296
    :goto_d
    return-object v1

    .line 288
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_44

    .line 296
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

    .line 289
    :sswitch_2f
    const-string v1, "640 x 480 pixels"

    goto :goto_d

    .line 290
    :sswitch_32
    const-string v1, "1600 x 1200 pixels"

    goto :goto_d

    .line 291
    :sswitch_35
    const-string v1, "2048 x 1536 pixels"

    goto :goto_d

    .line 292
    :sswitch_38
    const-string v1, "2288 x 1712 pixels"

    goto :goto_d

    .line 293
    :sswitch_3b
    const-string v1, "2592 x 1944 pixels"

    goto :goto_d

    .line 294
    :sswitch_3e
    const-string v1, "2304 x 1728 pixels"

    goto :goto_d

    .line 295
    :sswitch_41
    const-string v1, "3008 x 2008 pixels"

    goto :goto_d

    .line 288
    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_2f
        0x4 -> :sswitch_32
        0x5 -> :sswitch_35
        0x14 -> :sswitch_38
        0x15 -> :sswitch_3b
        0x16 -> :sswitch_3e
        0x24 -> :sswitch_41
    .end sparse-switch
.end method

.method public getIsoSensitivityDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 263
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 264
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 265
    const/4 v1, 0x0

    .line 272
    :goto_d
    return-object v1

    .line 266
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_3c

    .line 272
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

    .line 267
    :pswitch_2f
    const-string v1, "50"

    goto :goto_d

    .line 268
    :pswitch_32
    const-string v1, "64"

    goto :goto_d

    .line 269
    :pswitch_35
    const-string v1, "100"

    goto :goto_d

    .line 270
    :pswitch_38
    const-string v1, "200"

    goto :goto_d

    .line 266
    nop

    :pswitch_data_3c
    .packed-switch 0x3
        :pswitch_2f
        :pswitch_32
        :pswitch_15
        :pswitch_35
        :pswitch_15
        :pswitch_15
        :pswitch_38
    .end packed-switch
.end method

.method public getObjectDistanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 177
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x2022

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 178
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 179
    const/4 v1, 0x0

    .line 180
    :goto_d
    return-object v1

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getPrintImageMatchingInfoDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v1, 0xe00

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 153
    const/16 v0, 0x3002

    const/4 v1, 0x3

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "Fine"

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 303
    const/16 v0, 0x8

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Fine"

    aput-object v3, v1, v2

    const-string v2, "Super Fine"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRecordModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 165
    const/16 v0, 0x3000

    const/4 v1, 0x2

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "Normal"

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSaturationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 236
    const/16 v0, 0x1f

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "-1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "+1"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSelfTimerDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 159
    const/16 v0, 0x3001

    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 224
    const/16 v0, 0x21

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "-1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "+1"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailDimensionsDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 324
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getIntArray(I)[I

    move-result-object v0

    .line 325
    .local v0, "dimensions":[I
    if-eqz v0, :cond_e

    array-length v1, v0

    if-eq v1, v2, :cond_17

    .line 326
    :cond_e
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 327
    :goto_16
    return-object v1

    :cond_17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " x "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_16
.end method

.method public getThumbnailOffsetDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 309
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailSizeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 315
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 316
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 317
    const/4 v1, 0x0

    .line 318
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getTimeZoneDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v1, 0x3006

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalance1Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 249
    const/16 v0, 0x19

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Daylight"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Shade"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Tungsten"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Florescent"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Manual"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalance2Description()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 186
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v2, 0x2012

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 187
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 188
    const/4 v1, 0x0

    .line 195
    :goto_d
    return-object v1

    .line 189
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3c

    .line 195
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

    .line 190
    :sswitch_2f
    const-string v1, "Manual"

    goto :goto_d

    .line 191
    :sswitch_32
    const-string v1, "Auto"

    goto :goto_d

    .line 192
    :sswitch_35
    const-string v1, "Flash"

    goto :goto_d

    .line 193
    :sswitch_38
    const-string v1, "Flash"

    goto :goto_d

    .line 189
    nop

    :sswitch_data_3c
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x4 -> :sswitch_35
        0xc -> :sswitch_38
    .end sparse-switch
.end method

.method public getWhiteBalanceBiasDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;

    const/16 v1, 0x2011

    invoke-virtual {v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
