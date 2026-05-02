.class public Lezvcard/property/OrgDirectory;
.super Lezvcard/property/UriProperty;
.source "OrgDirectory.java"

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

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lezvcard/property/OrgDirectory;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 78
    invoke-super {p0}, Lezvcard/property/UriProperty;->getIndex()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    invoke-super {p0}, Lezvcard/property/UriProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 116
    invoke-super {p0}, Lezvcard/property/UriProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lezvcard/property/OrgDirectory;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lezvcard/property/OrgDirectory;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public setIndex(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 83
    invoke-super {p0, p1}, Lezvcard/property/UriProperty;->setIndex(Ljava/lang/Integer;)V

    .line 84
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-super {p0, p1}, Lezvcard/property/UriProperty;->setLanguage(Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 121
    invoke-super {p0, p1}, Lezvcard/property/UriProperty;->setPref(Ljava/lang/Integer;)V

    .line 122
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v0, p0, Lezvcard/property/OrgDirectory;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 102
    return-void
.end method
