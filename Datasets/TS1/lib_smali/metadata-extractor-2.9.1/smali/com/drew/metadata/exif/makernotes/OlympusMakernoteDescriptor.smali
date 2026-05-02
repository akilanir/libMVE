.class public Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "OlympusMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getApexApertureDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 293
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v4, 0xf00b

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v2

    .line 295
    .local v2, "value":Ljava/lang/Long;
    if-nez v2, :cond_f

    .line 296
    const/4 v3, 0x0

    .line 299
    :goto_e
    return-object v3

    .line 298
    :cond_f
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    long-to-double v3, v3

    const-wide/high16 v5, 0x4030000000000000L    # 16.0

    div-double/2addr v3, v5

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    sub-double/2addr v3, v5

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 299
    .local v0, "fStop":D
    invoke-static {v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    goto :goto_e
.end method

.method public getApexBrightnessDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 558
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf02d

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 559
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 560
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide/high16 v4, 0x4020000000000000L    # 8.0

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x4018000000000000L    # 6.0

    sub-double/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getApexFilmSpeedDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 258
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v5, 0xf009

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v3

    .line 260
    .local v3, "value":Ljava/lang/Long;
    if-nez v3, :cond_f

    .line 261
    const/4 v4, 0x0

    .line 266
    :goto_e
    return-object v4

    .line 263
    :cond_f
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide/high16 v6, 0x4020000000000000L    # 8.0

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    const-wide/high16 v6, 0x4009000000000000L    # 3.125

    mul-double v1, v4, v6

    .line 264
    .local v1, "iso":D
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "0.##"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 265
    .local v0, "format":Ljava/text/DecimalFormat;
    sget-object v4, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v4}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 266
    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    goto :goto_e
.end method

.method public getApexShutterSpeedTimeDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 276
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v5, 0xf00a

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v3

    .line 278
    .local v3, "value":Ljava/lang/Long;
    if-nez v3, :cond_f

    .line 279
    const/4 v4, 0x0

    .line 284
    :goto_e
    return-object v4

    .line 281
    :cond_f
    const-wide/16 v4, 0x31

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long/2addr v4, v6

    long-to-double v4, v4

    const-wide/high16 v6, 0x4020000000000000L    # 8.0

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    .line 282
    .local v1, "shutterSpeed":D
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "0.###"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 283
    .local v0, "format":Ljava/text/DecimalFormat;
    sget-object v4, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v4}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 284
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " sec"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_e
.end method

.method public getBWModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 692
    const/16 v0, 0x203

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBlackAndWhiteFilterDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 546
    const v0, 0xf02b

    invoke-super {p0, v0}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBracketStepDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 325
    const v0, 0xf00f

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "1/3 EV"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "2/3 EV"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "1 EV"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCameraIdDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 677
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const/16 v2, 0x209

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 678
    .local v0, "bytes":[B
    if-nez v0, :cond_e

    .line 679
    const/4 v1, 0x0

    .line 680
    :goto_d
    return-object v1

    :cond_e
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_d
.end method

.method public getCameraModelDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 507
    const v0, 0xf026

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "DiMAGE 7"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "DiMAGE 5"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "DiMAGE S304"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "DiMAGE S404"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "DiMAGE 7i"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "DiMAGE 7Hi"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "DiMAGE A1"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "DiMAGE S414"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorFilterDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 539
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf02a

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 540
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getColorModeCameraSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 533
    const v0, 0xf029

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Natural Color"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Black & White"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Vivid Color"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Solarization"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "AdobeRGB"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 636
    const/16 v0, 0x101

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Natural Colour"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Black & White"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Vivid Colour"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Solarization"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "AdobeRGB"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 474
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf021

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 475
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getDateDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const-wide/16 v7, 0xff

    .line 378
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v5, 0xf016

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v2

    .line 379
    .local v2, "value":Ljava/lang/Long;
    if-nez v2, :cond_11

    .line 380
    const/4 v4, 0x0

    .line 389
    :goto_10
    return-object v4

    .line 382
    :cond_11
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    and-long/2addr v4, v7

    long-to-int v0, v4

    .line 383
    .local v0, "day":I
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/16 v6, 0x10

    shr-long/2addr v4, v6

    and-long/2addr v4, v7

    long-to-int v1, v4

    .line 384
    .local v1, "month":I
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/16 v6, 0x8

    shr-long/2addr v4, v6

    and-long/2addr v4, v7

    long-to-int v4, v4

    add-int/lit16 v3, v4, 0x7b2

    .line 386
    .local v3, "year":I
    invoke-static {v3, v1, v0}, Lcom/drew/lang/DateUtil;->isValidDate(III)Z

    move-result v4

    if-nez v4, :cond_34

    .line 387
    const-string v4, "Invalid date"

    goto :goto_10

    .line 389
    :cond_34
    const-string v4, "%04d-%02d-%02d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    add-int/lit8 v7, v1, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_10
.end method

.method public getDecSwitchPositionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 602
    const v0, 0xf033

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Exposure"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Contrast"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Saturation"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Filter"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 53
    sparse-switch p1, :sswitch_data_15e

    .line 181
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 55
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getMakernoteVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getImageQuality1Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 61
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getImageQuality2Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSpecialModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getJpegQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getMacroModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getBWModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getDigiZoomRatioDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getCameraIdDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocusRangeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 84
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 86
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFlashModeCameraSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 88
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 90
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getImageSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 92
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getImageQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 94
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getShootingModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 96
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getMeteringModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 98
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getApexFilmSpeedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 100
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getApexShutterSpeedTimeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 102
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getApexApertureDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 104
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getMacroModeCameraSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 106
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 108
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getExposureCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 110
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getBracketStepDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 113
    :sswitch_97
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIntervalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 115
    :sswitch_9d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIntervalNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 117
    :sswitch_a3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 119
    :sswitch_a9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocusDistanceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 121
    :sswitch_af
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFlashFiredDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 123
    :sswitch_b5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getDateDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 125
    :sswitch_bb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getTimeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 127
    :sswitch_c1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getMaxApertureAtFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 130
    :sswitch_c7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFileNumberMemoryDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 132
    :sswitch_cd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getLastFileNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 134
    :sswitch_d3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getWhiteBalanceRedDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 136
    :sswitch_d9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getWhiteBalanceGreenDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 138
    :sswitch_df
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getWhiteBalanceBlueDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 140
    :sswitch_e5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 142
    :sswitch_eb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 144
    :sswitch_f1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSharpnessCameraSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 146
    :sswitch_f7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSubjectProgramDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 148
    :sswitch_fd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFlashCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 150
    :sswitch_103
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIsoSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 152
    :sswitch_109
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getCameraModelDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 154
    :sswitch_10f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIntervalModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 156
    :sswitch_115
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFolderNameDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 158
    :sswitch_11b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getColorModeCameraSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 160
    :sswitch_121
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getColorFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 162
    :sswitch_127
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getBlackAndWhiteFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 164
    :sswitch_12d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getInternalFlashDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 166
    :sswitch_133
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getApexBrightnessDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 168
    :sswitch_139
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSpotFocusPointXCoordinateDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 170
    :sswitch_13f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getSpotFocusPointYCoordinateDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 172
    :sswitch_145
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getWideFocusZoneDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 174
    :sswitch_14b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocusModeCameraSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 176
    :sswitch_151
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocusAreaDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 178
    :sswitch_157
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getDecSwitchPositionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 53
    nop

    :sswitch_data_15e
    .sparse-switch
        0x0 -> :sswitch_8
        0x101 -> :sswitch_d
        0x102 -> :sswitch_12
        0x103 -> :sswitch_17
        0x200 -> :sswitch_1c
        0x201 -> :sswitch_21
        0x202 -> :sswitch_26
        0x203 -> :sswitch_2b
        0x204 -> :sswitch_30
        0x209 -> :sswitch_35
        0x1004 -> :sswitch_3a
        0x100a -> :sswitch_3f
        0x100b -> :sswitch_44
        0x100f -> :sswitch_49
        0xf002 -> :sswitch_4e
        0xf003 -> :sswitch_53
        0xf004 -> :sswitch_58
        0xf005 -> :sswitch_5d
        0xf006 -> :sswitch_62
        0xf007 -> :sswitch_67
        0xf008 -> :sswitch_6c
        0xf009 -> :sswitch_71
        0xf00a -> :sswitch_76
        0xf00b -> :sswitch_7b
        0xf00c -> :sswitch_80
        0xf00d -> :sswitch_85
        0xf00e -> :sswitch_8b
        0xf00f -> :sswitch_91
        0xf011 -> :sswitch_97
        0xf012 -> :sswitch_9d
        0xf013 -> :sswitch_a3
        0xf014 -> :sswitch_a9
        0xf015 -> :sswitch_af
        0xf016 -> :sswitch_b5
        0xf017 -> :sswitch_bb
        0xf018 -> :sswitch_c1
        0xf01b -> :sswitch_c7
        0xf01c -> :sswitch_cd
        0xf01d -> :sswitch_d3
        0xf01e -> :sswitch_d9
        0xf01f -> :sswitch_df
        0xf020 -> :sswitch_e5
        0xf021 -> :sswitch_eb
        0xf022 -> :sswitch_f1
        0xf023 -> :sswitch_f7
        0xf024 -> :sswitch_fd
        0xf025 -> :sswitch_103
        0xf026 -> :sswitch_109
        0xf027 -> :sswitch_10f
        0xf028 -> :sswitch_115
        0xf029 -> :sswitch_11b
        0xf02a -> :sswitch_121
        0xf02b -> :sswitch_127
        0xf02c -> :sswitch_12d
        0xf02d -> :sswitch_133
        0xf02e -> :sswitch_139
        0xf02f -> :sswitch_13f
        0xf030 -> :sswitch_145
        0xf031 -> :sswitch_14b
        0xf032 -> :sswitch_151
        0xf033 -> :sswitch_157
    .end sparse-switch
.end method

.method public getDigiZoomRatioDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 671
    const/16 v0, 0x204

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Digital 2x Zoom"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDigitalZoomDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 311
    const v0, 0xf00d

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Electronic magnification"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Digital zoom 2x"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureCompensationDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 317
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf00e

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 318
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 319
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    long-to-double v3, v3

    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    div-double/2addr v3, v5

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    sub-double/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " EV"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getExposureModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 188
    const v0, 0xf002

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "P"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "A"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "S"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "M"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileNumberMemoryDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 426
    const v0, 0xf01b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashCompensationDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 493
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf024

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 494
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 495
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x6

    sub-long/2addr v3, v5

    long-to-double v3, v3

    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    div-double/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " EV"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getFlashFiredDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 369
    const v0, 0xf015

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashModeCameraSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 194
    const v0, 0xf003

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Red-eye reduction"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Rear flash sync"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Wireless"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 665
    const/16 v0, 0x1004

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "On"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Off"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocalLengthDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 351
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf013

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 352
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide/high16 v3, 0x4070000000000000L    # 256.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getFocusAreaDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 596
    const v0, 0xf032

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Wide Focus (Normal)"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Spot Focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusDistanceDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 358
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf014

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 359
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1c

    const-string v1, "Infinity"

    goto :goto_e

    :cond_1c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getFocusModeCameraSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 590
    const v0, 0xf031

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto Focus"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual Focus"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 653
    const/16 v0, 0x100b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusRangeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 659
    const/16 v0, 0x100a

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFolderNameDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 527
    const v0, 0xf028

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard Form"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Data Form"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageQuality1Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 625
    const/16 v0, 0x102

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Raw"

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

    const-string v3, "Extra Fine"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageQuality2Description()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 614
    const/16 v0, 0x103

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Raw"

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

    const-string v3, "Extra Fine"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageQualityDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 228
    const v0, 0xf006

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Raw"

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

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageSizeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 222
    const v0, 0xf005

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "2560 x 1920"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "1600 x 1200"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "1280 x 960"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "640 x 480"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInternalFlashDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 552
    const v0, 0xf02c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Did Not Fire"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Fired"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIntervalLengthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 331
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    invoke-virtual {v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->isIntervalMode()Z

    move-result v1

    if-nez v1, :cond_d

    .line 332
    const-string v1, "N/A"

    .line 335
    :goto_c
    return-object v1

    .line 334
    :cond_d
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf011

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 335
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_1c

    const/4 v1, 0x0

    goto :goto_c

    :cond_1c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " min"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getIntervalModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 521
    const v0, 0xf027

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Still Image"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Time Lapse Movie"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIntervalNumberDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 341
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    invoke-virtual {v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->isIntervalMode()Z

    move-result v1

    if-nez v1, :cond_d

    .line 342
    const-string v1, "N/A"

    .line 345
    :goto_c
    return-object v1

    .line 344
    :cond_d
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf012

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 345
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_1c

    const/4 v1, 0x0

    goto :goto_c

    :cond_1c
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getIsoSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 501
    const v0, 0xf025

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "100"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "200"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "400"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "800"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "64"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getJpegQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 698
    const/16 v0, 0x201

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard Quality"

    aput-object v3, v1, v2

    const-string v2, "High Quality"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Super High Quality"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastFileNumberDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 432
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf01c

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 433
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1c

    const-string v1, "File Number Memory Off"

    goto :goto_e

    :cond_1c
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getMacroModeCameraSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 305
    const v0, 0xf00c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacroModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 686
    const/16 v0, 0x202

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal (no macro)"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMakernoteVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 608
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxApertureAtFocalLengthDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 416
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v4, 0xf017

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v2

    .line 417
    .local v2, "value":Ljava/lang/Long;
    if-nez v2, :cond_f

    .line 418
    const/4 v3, 0x0

    .line 420
    :goto_e
    return-object v3

    .line 419
    :cond_f
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    long-to-double v3, v3

    const-wide/high16 v5, 0x4030000000000000L    # 16.0

    div-double/2addr v3, v5

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    sub-double/2addr v3, v5

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 420
    .local v0, "fStop":D
    invoke-static {v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    goto :goto_e
.end method

.method public getMeteringModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 249
    const v0, 0xf008

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Multi-Segment"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Centre Weighted"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Spot"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSaturationDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 467
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v2, 0xf020

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 468
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getSharpnessCameraSettingDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 481
    const v0, 0xf022

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Hard"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Soft"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 647
    const/16 v0, 0x100f

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Hard"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Soft"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShootingModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 234
    const v0, 0xf007

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Single"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Continuous"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Self Timer"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Bracketing"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Interval"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "UHS Continuous"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "HS Continuous"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSpecialModeDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 708
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const/16 v3, 0x200

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getObject(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [J

    move-object v1, v2

    check-cast v1, [J

    .line 709
    .local v1, "values":[J
    if-nez v1, :cond_15

    .line 710
    const/4 v2, 0x0

    .line 770
    :goto_14
    return-object v2

    .line 711
    :cond_15
    array-length v2, v1

    if-ge v2, v4, :cond_1b

    .line 712
    const-string v2, ""

    goto :goto_14

    .line 713
    :cond_1b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 715
    .local v0, "desc":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    aget-wide v2, v1, v2

    long-to-int v2, v2

    packed-switch v2, :pswitch_data_96

    .line 729
    const-string v2, "Unknown picture taking mode"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 733
    :goto_2c
    array-length v2, v1

    if-lt v2, v5, :cond_44

    .line 734
    aget-wide v2, v1, v4

    long-to-int v2, v2

    packed-switch v2, :pswitch_data_a2

    .line 747
    const-string v2, " / "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 748
    aget-wide v2, v1, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 749
    const-string v2, "th in a sequence"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 753
    :cond_44
    :goto_44
    :pswitch_44
    array-length v2, v1

    const/4 v3, 0x3

    if-lt v2, v3, :cond_4e

    .line 754
    aget-wide v2, v1, v5

    long-to-int v2, v2

    packed-switch v2, :pswitch_data_ae

    .line 770
    :cond_4e
    :goto_4e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_14

    .line 717
    :pswitch_53
    const-string v2, "Normal picture taking mode"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 720
    :pswitch_59
    const-string v2, "Unknown picture taking mode"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 723
    :pswitch_5f
    const-string v2, "Fast picture taking mode"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 726
    :pswitch_65
    const-string v2, "Panorama picture taking mode"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 738
    :pswitch_6b
    const-string v2, " / 1st in a sequence"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_44

    .line 741
    :pswitch_71
    const-string v2, " / 2nd in a sequence"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_44

    .line 744
    :pswitch_77
    const-string v2, " / 3rd in a sequence"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_44

    .line 756
    :pswitch_7d
    const-string v2, " / Left to right panorama direction"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    .line 759
    :pswitch_83
    const-string v2, " / Right to left panorama direction"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    .line 762
    :pswitch_89
    const-string v2, " / Bottom to top panorama direction"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    .line 765
    :pswitch_8f
    const-string v2, " / Top to bottom panorama direction"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    .line 715
    nop

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_53
        :pswitch_59
        :pswitch_5f
        :pswitch_65
    .end packed-switch

    .line 734
    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_44
        :pswitch_6b
        :pswitch_71
        :pswitch_77
    .end packed-switch

    .line 754
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_7d
        :pswitch_83
        :pswitch_89
        :pswitch_8f
    .end packed-switch
.end method

.method public getSpotFocusPointXCoordinateDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 566
    const v0, 0xf02e

    invoke-super {p0, v0}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSpotFocusPointYCoordinateDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 572
    const v0, 0xf02f

    invoke-super {p0, v0}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubjectProgramDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 487
    const v0, 0xf023

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Portrait"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Text"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Night Portrait"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Sunset"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Sports Action"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimeDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const-wide/16 v7, 0xff

    .line 398
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v5, 0xf017

    invoke-virtual {v4, v5}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v3

    .line 399
    .local v3, "value":Ljava/lang/Long;
    if-nez v3, :cond_11

    .line 400
    const/4 v4, 0x0

    .line 409
    :goto_10
    return-object v4

    .line 402
    :cond_11
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/16 v6, 0x8

    shr-long/2addr v4, v6

    and-long/2addr v4, v7

    long-to-int v0, v4

    .line 403
    .local v0, "hours":I
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/16 v6, 0x10

    shr-long/2addr v4, v6

    and-long/2addr v4, v7

    long-to-int v1, v4

    .line 404
    .local v1, "minutes":I
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    and-long/2addr v4, v7

    long-to-int v2, v4

    .line 406
    .local v2, "seconds":I
    invoke-static {v0, v1, v2}, Lcom/drew/lang/DateUtil;->isValidTime(III)Z

    move-result v4

    if-nez v4, :cond_32

    .line 407
    const-string v4, "Invalid time"

    goto :goto_10

    .line 409
    :cond_32
    const-string v4, "%02d:%02d:%02d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_10
.end method

.method public getWhiteBalanceBlueDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 459
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf01f

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 460
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 461
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    div-double/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 201
    const v0, 0xf004

    const/16 v1, 0xd

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Daylight"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Cloudy"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Tungsten"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    const-string v3, "Custom"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    aput-object v4, v1, v2

    const/4 v2, 0x7

    const-string v3, "Fluorescent"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Fluorescent 2"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    aput-object v4, v1, v2

    const/16 v2, 0xa

    aput-object v4, v1, v2

    const/16 v2, 0xb

    const-string v3, "Custom 2"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "Custom 3"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalanceGreenDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 451
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf01e

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 452
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 453
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    div-double/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getWhiteBalanceRedDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 443
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;

    const v3, 0xf01d

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 444
    .local v1, "value":Ljava/lang/Long;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 445
    .local v0, "format":Ljava/text/DecimalFormat;
    if-nez v1, :cond_16

    const/4 v2, 0x0

    :goto_15
    return-object v2

    :cond_16
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    div-double/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getWideFocusZoneDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 578
    const v0, 0xf030

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No Zone or AF Failed"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Center Zone (Horizontal Orientation)"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Center Zone (Vertical Orientation)"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Left Zone"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Right Zone"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
