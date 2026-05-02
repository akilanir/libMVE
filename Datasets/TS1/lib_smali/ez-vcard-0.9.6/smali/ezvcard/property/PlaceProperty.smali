.class public Lezvcard/property/PlaceProperty;
.super Lezvcard/property/VCardProperty;
.source "PlaceProperty.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field protected geoUri:Lezvcard/util/GeoUri;

.field protected text:Ljava/lang/String;

.field protected uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 56
    return-void
.end method

.method public constructor <init>(DD)V
    .registers 5
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 63
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 64
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/property/PlaceProperty;->setCoordinates(DD)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 72
    invoke-virtual {p0, p1}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    .line 73
    return-void
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 7
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
    .line 181
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->uri:Ljava/lang/String;

    if-nez v0, :cond_19

    iget-object v0, p0, Lezvcard/property/PlaceProperty;->text:Ljava/lang/String;

    if-nez v0, :cond_19

    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_19

    .line 182
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    :cond_19
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGeoUri()Lezvcard/util/GeoUri;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 171
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLatitude()Ljava/lang/Double;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->getCoordA()Ljava/lang/Double;

    move-result-object v0

    goto :goto_5
.end method

.method public getLongitude()Ljava/lang/Double;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->getCoordB()Ljava/lang/Double;

    move-result-object v0

    goto :goto_5
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 166
    iget-object v0, p0, Lezvcard/property/PlaceProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public setCoordinates(DD)V
    .registers 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 110
    new-instance v0, Lezvcard/util/GeoUri$Builder;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lezvcard/util/GeoUri$Builder;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    invoke-virtual {v0}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lezvcard/property/PlaceProperty;->setGeoUri(Lezvcard/util/GeoUri;)V

    .line 111
    return-void
.end method

.method public setGeoUri(Lezvcard/util/GeoUri;)V
    .registers 3
    .param p1, "geoUri"    # Lezvcard/util/GeoUri;

    .prologue
    const/4 v0, 0x0

    .line 118
    iput-object p1, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    .line 119
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->uri:Ljava/lang/String;

    .line 120
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->text:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setLanguage(Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 154
    iput-object p1, p0, Lezvcard/property/PlaceProperty;->text:Ljava/lang/String;

    .line 155
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    .line 156
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->uri:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 136
    iput-object p1, p0, Lezvcard/property/PlaceProperty;->uri:Ljava/lang/String;

    .line 137
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->geoUri:Lezvcard/util/GeoUri;

    .line 138
    iput-object v0, p0, Lezvcard/property/PlaceProperty;->text:Ljava/lang/String;

    .line 139
    return-void
.end method
