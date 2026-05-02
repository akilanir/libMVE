.class public Lezvcard/property/Hobby;
.super Lezvcard/property/TextProperty;
.source "Hobby.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "hobby"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lezvcard/property/TextProperty;-><init>(Ljava/lang/String;)V

    .line 75
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
    .line 79
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 103
    invoke-super {p0}, Lezvcard/property/TextProperty;->getIndex()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    invoke-super {p0}, Lezvcard/property/TextProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLevel()Lezvcard/parameter/HobbyLevel;
    .registers 3

    .prologue
    .line 88
    iget-object v1, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v1}, Lezvcard/parameter/VCardParameters;->getLevel()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lezvcard/parameter/HobbyLevel;->get(Ljava/lang/String;)Lezvcard/parameter/HobbyLevel;

    move-result-object v1

    goto :goto_9
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 141
    invoke-super {p0}, Lezvcard/property/TextProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 156
    iget-object v0, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public setIndex(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 108
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setIndex(Ljava/lang/Integer;)V

    .line 109
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setLanguage(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public setLevel(Lezvcard/parameter/HobbyLevel;)V
    .registers 4
    .param p1, "level"    # Lezvcard/parameter/HobbyLevel;

    .prologue
    .line 98
    iget-object v0, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/HobbyLevel;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->setLevel(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 146
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setPref(Ljava/lang/Integer;)V

    .line 147
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 126
    iget-object v0, p0, Lezvcard/property/Hobby;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 127
    return-void
.end method
