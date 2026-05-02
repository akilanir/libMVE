.class public Lezvcard/property/FreeBusyUrl;
.super Lezvcard/property/UriProperty;
.source "FreeBusyUrl.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lezvcard/property/UriProperty;-><init>(Ljava/lang/String;)V

    .line 69
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
    .line 73
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 105
    invoke-super {p0, p1, p2}, Lezvcard/property/UriProperty;->addPid(II)V

    .line 106
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 100
    invoke-super {p0}, Lezvcard/property/UriProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 115
    invoke-super {p0}, Lezvcard/property/UriProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 110
    invoke-super {p0}, Lezvcard/property/UriProperty;->removePids()V

    .line 111
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 130
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 120
    invoke-super {p0, p1}, Lezvcard/property/UriProperty;->setPref(Ljava/lang/Integer;)V

    .line 121
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 154
    iget-object v0, p0, Lezvcard/property/FreeBusyUrl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 155
    return-void
.end method
