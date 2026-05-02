.class public Lezvcard/property/Interest;
.super Lezvcard/property/TextProperty;
.source "Interest.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "interest"    # Ljava/lang/String;

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
    .line 152
    iget-object v0, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 104
    invoke-super {p0}, Lezvcard/property/TextProperty;->getIndex()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 132
    invoke-super {p0}, Lezvcard/property/TextProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLevel()Lezvcard/parameter/InterestLevel;
    .registers 3

    .prologue
    .line 88
    iget-object v1, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v1}, Lezvcard/parameter/VCardParameters;->getLevel()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lezvcard/parameter/InterestLevel;->get(Ljava/lang/String;)Lezvcard/parameter/InterestLevel;

    move-result-object v1

    goto :goto_9
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 142
    invoke-super {p0}, Lezvcard/property/TextProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method public setIndex(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 109
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setIndex(Ljava/lang/Integer;)V

    .line 110
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setLanguage(Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method public setLevel(Lezvcard/parameter/InterestLevel;)V
    .registers 4
    .param p1, "level"    # Lezvcard/parameter/InterestLevel;

    .prologue
    .line 98
    if-nez p1, :cond_9

    const/4 v0, 0x0

    .line 99
    .local v0, "value":Ljava/lang/String;
    :goto_3
    iget-object v1, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v1, v0}, Lezvcard/parameter/VCardParameters;->setLevel(Ljava/lang/String;)V

    .line 100
    return-void

    .line 98
    .end local v0    # "value":Ljava/lang/String;
    :cond_9
    invoke-virtual {p1}, Lezvcard/parameter/InterestLevel;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 147
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setPref(Ljava/lang/Integer;)V

    .line 148
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 127
    iget-object v0, p0, Lezvcard/property/Interest;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 128
    return-void
.end method
