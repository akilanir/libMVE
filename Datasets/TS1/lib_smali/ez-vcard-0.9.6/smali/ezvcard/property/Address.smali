.class public Lezvcard/property/Address;
.super Lezvcard/property/VCardProperty;
.source "Address.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private country:Ljava/lang/String;

.field private extendedAddress:Ljava/lang/String;

.field private locality:Ljava/lang/String;

.field private poBox:Ljava/lang/String;

.field private postalCode:Ljava/lang/String;

.field private region:Ljava/lang/String;

.field private streetAddress:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 11
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
    .line 355
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-virtual {p0}, Lezvcard/property/Address;->getTypes()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/parameter/AddressType;

    .line 356
    .local v1, "type":Lezvcard/parameter/AddressType;
    sget-object v2, Lezvcard/parameter/AddressType;->PREF:Lezvcard/parameter/AddressType;

    if-eq v1, v2, :cond_8

    .line 361
    invoke-virtual {v1, p2}, Lezvcard/parameter/AddressType;->isSupported(Lezvcard/VCardVersion;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 362
    new-instance v2, Lezvcard/Warning;

    const/16 v3, 0x9

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Lezvcard/parameter/AddressType;->getValue()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 365
    .end local v1    # "type":Lezvcard/parameter/AddressType;
    :cond_33
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 302
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 303
    return-void
.end method

.method public addType(Lezvcard/parameter/AddressType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/AddressType;

    .prologue
    .line 230
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/AddressType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCountry()Ljava/lang/String;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lezvcard/property/Address;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getExtendedAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lezvcard/property/Address;->extendedAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getGeo()[D
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getGeo()[D

    move-result-object v0

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getLabel()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 243
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocality()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lezvcard/property/Address;->locality:Ljava/lang/String;

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
    .line 297
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPoBox()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/property/Address;->poBox:Ljava/lang/String;

    return-object v0
.end method

.method public getPostalCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lezvcard/property/Address;->postalCode:Ljava/lang/String;

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 312
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lezvcard/property/Address;->region:Ljava/lang/String;

    return-object v0
.end method

.method public getStreetAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lezvcard/property/Address;->streetAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getTimezone()Ljava/lang/String;
    .registers 2

    .prologue
    .line 339
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getTimezone()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTypes()Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/parameter/AddressType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    iget-object v4, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 218
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 219
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/AddressType;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 220
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/AddressType;->get(Ljava/lang/String;)Lezvcard/parameter/AddressType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 222
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 307
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 308
    return-void
.end method

.method public removeType(Lezvcard/parameter/AddressType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/AddressType;

    .prologue
    .line 238
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/AddressType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 239
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 327
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 328
    return-void
.end method

.method public setCountry(Ljava/lang/String;)V
    .registers 2
    .param p1, "country"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lezvcard/property/Address;->country:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public setExtendedAddress(Ljava/lang/String;)V
    .registers 2
    .param p1, "extendedAddress"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lezvcard/property/Address;->extendedAddress:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setGeo(DD)V
    .registers 6
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 292
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1, p2, p3, p4}, Lezvcard/parameter/VCardParameters;->setGeo(DD)V

    .line 293
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .registers 3
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 264
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setLabel(Ljava/lang/String;)V

    .line 265
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setLanguage(Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method public setLocality(Ljava/lang/String;)V
    .registers 2
    .param p1, "locality"    # Ljava/lang/String;

    .prologue
    .line 161
    iput-object p1, p0, Lezvcard/property/Address;->locality:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public setPoBox(Ljava/lang/String;)V
    .registers 2
    .param p1, "poBox"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lezvcard/property/Address;->poBox:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setPostalCode(Ljava/lang/String;)V
    .registers 2
    .param p1, "postalCode"    # Ljava/lang/String;

    .prologue
    .line 193
    iput-object p1, p0, Lezvcard/property/Address;->postalCode:Ljava/lang/String;

    .line 194
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 317
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 318
    return-void
.end method

.method public setRegion(Ljava/lang/String;)V
    .registers 2
    .param p1, "region"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lezvcard/property/Address;->region:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setStreetAddress(Ljava/lang/String;)V
    .registers 2
    .param p1, "streetAddress"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lezvcard/property/Address;->streetAddress:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setTimezone(Ljava/lang/String;)V
    .registers 3
    .param p1, "timezone"    # Ljava/lang/String;

    .prologue
    .line 350
    iget-object v0, p0, Lezvcard/property/Address;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setTimezone(Ljava/lang/String;)V

    .line 351
    return-void
.end method
