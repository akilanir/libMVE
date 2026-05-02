.class public Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "NikonType1MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 52
    return-void
.end method


# virtual methods
.method public getCcdSensitivityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x6

    .line 125
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "ISO80"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v4, v0, v1

    const/4 v1, 0x2

    const-string v2, "ISO160"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    aput-object v4, v0, v1

    const/4 v1, 0x4

    const-string v2, "ISO320"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "ISO100"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 150
    const/4 v0, 0x4

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Color"

    aput-object v3, v1, v2

    const-string v2, "Monochrome"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConverterDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 83
    const/16 v0, 0xb

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Fisheye converter"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 58
    packed-switch p1, :pswitch_data_30

    .line 76
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 60
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :pswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :pswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getImageAdjustmentDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :pswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getCcdSensitivityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :pswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :pswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getFocusDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :pswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :pswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getConverterDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :pswitch_data_30
    .packed-switch 0x3
        :pswitch_8
        :pswitch_d
        :pswitch_12
        :pswitch_17
        :pswitch_1c
        :pswitch_21
        :pswitch_3
        :pswitch_26
        :pswitch_2b
    .end packed-switch
.end method

.method public getDigitalZoomDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 89
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 90
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getNumerator()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1b

    const-string v1, "No digital zoom"

    goto :goto_d

    :cond_1b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x digital zoom"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getFocusDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 100
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 101
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getNumerator()J

    move-result-wide v1

    const-wide/16 v3, 0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_25

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_25

    const-string v1, "Infinite"

    goto :goto_d

    :cond_25
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getImageAdjustmentDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x5

    .line 138
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Normal"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Bright +"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Bright -"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Contrast +"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Contrast -"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 160
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "VGA Basic"

    aput-object v2, v0, v1

    const-string v1, "VGA Normal"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "VGA Fine"

    aput-object v2, v0, v1

    const-string v1, "SXGA Basic"

    aput-object v1, v0, v4

    const/4 v1, 0x4

    const-string v2, "SXGA Normal"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "SXGA Fine"

    aput-object v2, v0, v1

    invoke-virtual {p0, v4, v3, v0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x7

    .line 111
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Auto"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Preset"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Daylight"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Incandescence"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Florescence"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Cloudy"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "SpeedLight"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/drew/metadata/exif/makernotes/NikonType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
