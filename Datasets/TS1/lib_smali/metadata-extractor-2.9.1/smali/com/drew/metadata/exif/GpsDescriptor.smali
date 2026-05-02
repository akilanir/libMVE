.class public Lcom/drew/metadata/exif/GpsDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "GpsDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/GpsDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/GpsDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/GpsDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 44
    return-void
.end method

.method private getGpsVersionIdDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 91
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/GpsDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDegreesMinutesSecondsDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 239
    iget-object v1, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v1}, Lcom/drew/metadata/exif/GpsDirectory;->getGeoLocation()Lcom/drew/lang/GeoLocation;

    move-result-object v0

    .line 240
    .local v0, "location":Lcom/drew/lang/GeoLocation;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lcom/drew/lang/GeoLocation;->toDMSString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 50
    packed-switch p1, :pswitch_data_4a

    .line 84
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 52
    :pswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsVersionIdDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :pswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsAltitudeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :pswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsAltitudeRefDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :pswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsStatusDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :pswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsMeasureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :pswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsSpeedRefDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :pswitch_26
    invoke-virtual {p0, p1}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsDirectionReferenceDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :pswitch_2b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsDirectionDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :pswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsDestinationReferenceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :pswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsTimeStampDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :pswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsLongitudeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 80
    :pswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsLatitudeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 82
    :pswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/GpsDescriptor;->getGpsDifferentialDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_8
        :pswitch_3
        :pswitch_3f
        :pswitch_3
        :pswitch_3a
        :pswitch_12
        :pswitch_d
        :pswitch_35
        :pswitch_3
        :pswitch_17
        :pswitch_1c
        :pswitch_3
        :pswitch_21
        :pswitch_3
        :pswitch_26
        :pswitch_2b
        :pswitch_26
        :pswitch_2b
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_26
        :pswitch_2b
        :pswitch_30
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_44
    .end packed-switch
.end method

.method public getGpsAltitudeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 226
    iget-object v1, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/GpsDirectory;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/GpsDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 227
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " metres"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getGpsAltitudeRefDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 220
    const/4 v0, 0x5

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Sea level"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Below sea level"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/GpsDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGpsDestinationReferenceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 125
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    const/16 v3, 0x19

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_e

    .line 127
    const/4 v2, 0x0

    .line 136
    :goto_d
    return-object v2

    .line 128
    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "distanceRef":Ljava/lang/String;
    const-string v2, "K"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 130
    const-string v2, "kilometers"

    goto :goto_d

    .line 131
    :cond_1d
    const-string v2, "M"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 132
    const-string v2, "miles"

    goto :goto_d

    .line 133
    :cond_28
    const-string v2, "N"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 134
    const-string v2, "knots"

    goto :goto_d

    .line 136
    :cond_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getGpsDifferentialDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 233
    const/16 v0, 0x1e

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No Correction"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Differential Corrected"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/GpsDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGpsDirectionDescription(I)Ljava/lang/String;
    .registers 7
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 143
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v2, p1}, Lcom/drew/metadata/exif/GpsDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 145
    .local v0, "angle":Lcom/drew/lang/Rational;
    if-eqz v0, :cond_27

    new-instance v2, Ljava/text/DecimalFormat;

    const-string v3, "0.##"

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 148
    .local v1, "value":Ljava/lang/String;
    :goto_19
    if-eqz v1, :cond_25

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_30

    :cond_25
    const/4 v2, 0x0

    :goto_26
    return-object v2

    .line 145
    .end local v1    # "value":Ljava/lang/String;
    :cond_27
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v2, p1}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_19

    .line 148
    .restart local v1    # "value":Ljava/lang/String;
    :cond_30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " degrees"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_26
.end method

.method public getGpsDirectionReferenceDescription(I)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 154
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v2, p1}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_c

    .line 156
    const/4 v2, 0x0

    .line 163
    :goto_b
    return-object v2

    .line 157
    :cond_c
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "gpsDistRef":Ljava/lang/String;
    const-string v2, "T"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 159
    const-string v2, "True direction"

    goto :goto_b

    .line 160
    :cond_1b
    const-string v2, "M"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 161
    const-string v2, "Magnetic direction"

    goto :goto_b

    .line 163
    :cond_26
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_b
.end method

.method public getGpsLatitudeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 97
    iget-object v1, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v1}, Lcom/drew/metadata/exif/GpsDirectory;->getGeoLocation()Lcom/drew/lang/GeoLocation;

    move-result-object v0

    .line 98
    .local v0, "location":Lcom/drew/lang/GeoLocation;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lcom/drew/lang/GeoLocation;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/lang/GeoLocation;->decimalToDegreesMinutesSecondsString(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getGpsLongitudeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 104
    iget-object v1, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/GpsDirectory;

    invoke-virtual {v1}, Lcom/drew/metadata/exif/GpsDirectory;->getGeoLocation()Lcom/drew/lang/GeoLocation;

    move-result-object v0

    .line 105
    .local v0, "location":Lcom/drew/lang/GeoLocation;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lcom/drew/lang/GeoLocation;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/lang/GeoLocation;->decimalToDegreesMinutesSecondsString(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getGpsMeasureModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 188
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_e

    .line 190
    const/4 v2, 0x0

    .line 197
    :goto_d
    return-object v2

    .line 191
    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "gpsSpeedMeasureMode":Ljava/lang/String;
    const-string v2, "2"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 193
    const-string v2, "2-dimensional measurement"

    goto :goto_d

    .line 194
    :cond_1d
    const-string v2, "3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 195
    const-string v2, "3-dimensional measurement"

    goto :goto_d

    .line 197
    :cond_28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getGpsSpeedRefDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 170
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    const/16 v3, 0xc

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 171
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_e

    .line 172
    const/4 v2, 0x0

    .line 181
    :goto_d
    return-object v2

    .line 173
    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "gpsSpeedRef":Ljava/lang/String;
    const-string v2, "K"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 175
    const-string v2, "kph"

    goto :goto_d

    .line 176
    :cond_1d
    const-string v2, "M"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 177
    const-string v2, "mph"

    goto :goto_d

    .line 178
    :cond_28
    const-string v2, "N"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 179
    const-string v2, "knots"

    goto :goto_d

    .line 181
    :cond_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getGpsStatusDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 204
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    const/16 v3, 0x9

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_e

    .line 206
    const/4 v2, 0x0

    .line 213
    :goto_d
    return-object v2

    .line 207
    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "gpsStatus":Ljava/lang/String;
    const-string v2, "A"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 209
    const-string v2, "Active (Measurement in progress)"

    goto :goto_d

    .line 210
    :cond_1d
    const-string v2, "V"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 211
    const-string v2, "Void (Measurement Interoperability)"

    goto :goto_d

    .line 213
    :cond_28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getGpsTimeStampDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 112
    iget-object v2, p0, Lcom/drew/metadata/exif/GpsDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/GpsDirectory;

    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/GpsDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v1

    .line 113
    .local v1, "timeComponents":[Lcom/drew/lang/Rational;
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "00.000"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 114
    .local v0, "df":Ljava/text/DecimalFormat;
    if-nez v1, :cond_17

    const/4 v2, 0x0

    :goto_16
    return-object v2

    :cond_17
    const-string v2, "%02d:%02d:%s UTC"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aget-object v4, v1, v5

    invoke-virtual {v4}, Lcom/drew/lang/Rational;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    aget-object v4, v1, v6

    invoke-virtual {v4}, Lcom/drew/lang/Rational;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    aget-object v4, v1, v7

    invoke-virtual {v4}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_16
.end method
