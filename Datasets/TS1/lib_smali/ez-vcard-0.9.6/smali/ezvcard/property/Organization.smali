.class public Lezvcard/property/Organization;
.super Lezvcard/property/TextListProperty;
.source "Organization.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Lezvcard/property/TextListProperty;-><init>()V

    return-void
.end method


# virtual methods
.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 106
    invoke-super {p0, p1, p2}, Lezvcard/property/TextListProperty;->addPid(II)V

    .line 107
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    invoke-super {p0}, Lezvcard/property/TextListProperty;->getLanguage()Ljava/lang/String;

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
    .line 101
    invoke-super {p0}, Lezvcard/property/TextListProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 116
    invoke-super {p0}, Lezvcard/property/TextListProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getSortAs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getSortAs()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 111
    invoke-super {p0}, Lezvcard/property/TextListProperty;->removePids()V

    .line 112
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-super {p0, p1}, Lezvcard/property/TextListProperty;->setLanguage(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 121
    invoke-super {p0, p1}, Lezvcard/property/TextListProperty;->setPref(Ljava/lang/Integer;)V

    .line 122
    return-void
.end method

.method public varargs setSortAs([Ljava/lang/String;)V
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setSortAs([Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-object v0, p0, Lezvcard/property/Organization;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 97
    return-void
.end method
