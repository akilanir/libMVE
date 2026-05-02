.class public Lezvcard/property/Categories;
.super Lezvcard/property/TextListProperty;
.source "Categories.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Lezvcard/property/TextListProperty;-><init>()V

    return-void
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 3
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
    .line 127
    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 73
    invoke-super {p0, p1, p2}, Lezvcard/property/TextListProperty;->addPid(II)V

    .line 74
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lezvcard/property/Categories;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

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
    .line 68
    invoke-super {p0}, Lezvcard/property/TextListProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 83
    invoke-super {p0}, Lezvcard/property/TextListProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lezvcard/property/Categories;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 78
    invoke-super {p0}, Lezvcard/property/TextListProperty;->removePids()V

    .line 79
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 98
    iget-object v0, p0, Lezvcard/property/Categories;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 88
    invoke-super {p0, p1}, Lezvcard/property/TextListProperty;->setPref(Ljava/lang/Integer;)V

    .line 89
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v0, p0, Lezvcard/property/Categories;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 123
    return-void
.end method
