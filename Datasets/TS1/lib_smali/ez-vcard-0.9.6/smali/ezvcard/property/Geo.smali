.class public Lezvcard/property/Geo;
.super Lezvcard/property/VCardProperty;
.source "Geo.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private uri:Lezvcard/util/GeoUri;


# direct methods
.method public constructor <init>(Lezvcard/util/GeoUri;)V
    .registers 2
    .param p1, "uri"    # Lezvcard/util/GeoUri;

    .prologue
    .line 104
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 105
    iput-object p1, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/lang/Double;Ljava/lang/Double;)V
    .registers 4
    .param p1, "latitude"    # Ljava/lang/Double;
    .param p2, "longitude"    # Ljava/lang/Double;

    .prologue
    .line 97
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    invoke-direct {v0, p1, p2}, Lezvcard/util/GeoUri$Builder;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/property/Geo;-><init>(Lezvcard/util/GeoUri;)V

    .line 98
    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 8
    .param p2, "version"    # Lezvcard/VCardVersion;
    .param p3, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    const/4 v3, 0x0

    .line 257
    invoke-virtual {p0}, Lezvcard/property/Geo;->getLatitude()Ljava/lang/Double;

    move-result-object v0

    if-nez v0, :cond_13

    .line 258
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0xd

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :cond_13
    invoke-virtual {p0}, Lezvcard/property/Geo;->getLongitude()Ljava/lang/Double;

    move-result-object v0

    if-nez v0, :cond_25

    .line 261
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0xe

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    :cond_25
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 227
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 228
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGeoUri()Lezvcard/util/GeoUri;
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    return-object v0
.end method

.method public getLatitude()Ljava/lang/Double;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->getCoordA()Ljava/lang/Double;

    move-result-object v0

    goto :goto_5
.end method

.method public getLongitude()Ljava/lang/Double;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->getCoordB()Ljava/lang/Double;

    move-result-object v0

    goto :goto_5
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getMediaType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPids()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 237
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 232
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 233
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 252
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method public setGeoUri(Lezvcard/util/GeoUri;)V
    .registers 2
    .param p1, "uri"    # Lezvcard/util/GeoUri;

    .prologue
    .line 171
    iput-object p1, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    .line 172
    return-void
.end method

.method public setLatitude(Ljava/lang/Double;)V
    .registers 4
    .param p1, "latitude"    # Ljava/lang/Double;

    .prologue
    .line 121
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_11

    .line 122
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lezvcard/util/GeoUri$Builder;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    iput-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    .line 126
    :goto_10
    return-void

    .line 124
    :cond_11
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    iget-object v1, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    invoke-direct {v0, v1}, Lezvcard/util/GeoUri$Builder;-><init>(Lezvcard/util/GeoUri;)V

    invoke-virtual {v0, p1}, Lezvcard/util/GeoUri$Builder;->coordA(Ljava/lang/Double;)Lezvcard/util/GeoUri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    iput-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    goto :goto_10
.end method

.method public setLongitude(Ljava/lang/Double;)V
    .registers 4
    .param p1, "longitude"    # Ljava/lang/Double;

    .prologue
    .line 141
    iget-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_11

    .line 142
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lezvcard/util/GeoUri$Builder;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    iput-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    .line 146
    :goto_10
    return-void

    .line 144
    :cond_11
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    iget-object v1, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    invoke-direct {v0, v1}, Lezvcard/util/GeoUri$Builder;-><init>(Lezvcard/util/GeoUri;)V

    invoke-virtual {v0, p1}, Lezvcard/util/GeoUri$Builder;->coordB(Ljava/lang/Double;)Lezvcard/util/GeoUri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    iput-object v0, p0, Lezvcard/property/Geo;->uri:Lezvcard/util/GeoUri;

    goto :goto_10
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 242
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 243
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 195
    iget-object v0, p0, Lezvcard/property/Geo;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 196
    return-void
.end method
