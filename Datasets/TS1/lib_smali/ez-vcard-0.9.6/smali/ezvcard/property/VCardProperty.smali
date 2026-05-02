.class public abstract Lezvcard/property/VCardProperty;
.super Ljava/lang/Object;
.source "VCardProperty.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lezvcard/property/VCardProperty;",
        ">;"
    }
.end annotation


# instance fields
.field protected group:Ljava/lang/String;

.field protected parameters:Lezvcard/parameter/VCardParameters;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lezvcard/parameter/VCardParameters;

    invoke-direct {v0}, Lezvcard/parameter/VCardParameters;-><init>()V

    iput-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    return-void
.end method


# virtual methods
.method protected _supportedVersions()Ljava/util/Set;
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
    invoke-static {}, Lezvcard/VCardVersion;->values()[Lezvcard/VCardVersion;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 4
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
    .line 122
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    return-void
.end method

.method public addParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 173
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1, p2}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 174
    return-void
.end method

.method addPid(II)V
    .registers 4
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 248
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1, p2}, Lezvcard/parameter/VCardParameters;->addPid(II)V

    .line 249
    return-void
.end method

.method public compareTo(Lezvcard/property/VCardProperty;)I
    .registers 5
    .param p1, "that"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 205
    invoke-virtual {p0}, Lezvcard/property/VCardProperty;->getParameters()Lezvcard/parameter/VCardParameters;

    move-result-object v2

    invoke-virtual {v2}, Lezvcard/parameter/VCardParameters;->getPref()Ljava/lang/Integer;

    move-result-object v0

    .line 206
    .local v0, "pref0":Ljava/lang/Integer;
    invoke-virtual {p1}, Lezvcard/property/VCardProperty;->getParameters()Lezvcard/parameter/VCardParameters;

    move-result-object v2

    invoke-virtual {v2}, Lezvcard/parameter/VCardParameters;->getPref()Ljava/lang/Integer;

    move-result-object v1

    .line 207
    .local v1, "pref1":Ljava/lang/Integer;
    if-nez v0, :cond_16

    if-nez v1, :cond_16

    .line 208
    const/4 v2, 0x0

    .line 216
    :goto_15
    return v2

    .line 210
    :cond_16
    if-nez v0, :cond_1a

    .line 211
    const/4 v2, 0x1

    goto :goto_15

    .line 213
    :cond_1a
    if-nez v1, :cond_1e

    .line 214
    const/4 v2, -0x1

    goto :goto_15

    .line 216
    :cond_1e
    invoke-virtual {v1, v0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v2

    goto :goto_15
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 47
    check-cast p1, Lezvcard/property/VCardProperty;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lezvcard/property/VCardProperty;->compareTo(Lezvcard/property/VCardProperty;)I

    move-result v0

    return v0
.end method

.method public getGroup()Ljava/lang/String;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lezvcard/property/VCardProperty;->group:Ljava/lang/String;

    return-object v0
.end method

.method getIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 325
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getIndex()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 146
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Lezvcard/parameter/VCardParameters;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    return-object v0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getPids()Ljava/util/List;
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
    .line 232
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final getSupportedVersions()Ljava/util/Set;
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
    .line 64
    invoke-virtual {p0}, Lezvcard/property/VCardProperty;->_supportedVersions()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public removeParameter(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 182
    return-void
.end method

.method removePids()V
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->removePids()V

    .line 262
    return-void
.end method

.method public setGroup(Ljava/lang/String;)V
    .registers 2
    .param p1, "group"    # Ljava/lang/String;

    .prologue
    .line 197
    iput-object p1, p0, Lezvcard/property/VCardProperty;->group:Ljava/lang/String;

    .line 198
    return-void
.end method

.method setIndex(Ljava/lang/Integer;)V
    .registers 3
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 337
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setIndex(Ljava/lang/Integer;)V

    .line 338
    return-void
.end method

.method setLanguage(Ljava/lang/String;)V
    .registers 3
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 313
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setLanguage(Ljava/lang/String;)V

    .line 314
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1, p2}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 165
    return-void
.end method

.method public setParameters(Lezvcard/parameter/VCardParameters;)V
    .registers 2
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;

    .prologue
    .line 137
    iput-object p1, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    .line 138
    return-void
.end method

.method setPref(Ljava/lang/Integer;)V
    .registers 3
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 295
    iget-object v0, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setPref(Ljava/lang/Integer;)V

    .line 296
    return-void
.end method

.method public final validate(Lezvcard/VCardVersion;Lezvcard/VCard;)Ljava/util/List;
    .registers 9
    .param p1, "version"    # Lezvcard/VCardVersion;
    .param p2, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 96
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .local v1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-virtual {p0}, Lezvcard/property/VCardProperty;->getSupportedVersions()Ljava/util/Set;

    move-result-object v0

    .line 100
    .local v0, "supportedVersions":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/VCardVersion;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e

    .line 101
    new-instance v2, Lezvcard/Warning;

    const/4 v3, 0x2

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v5

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_1e
    iget-object v2, p0, Lezvcard/property/VCardProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v2, p1}, Lezvcard/parameter/VCardParameters;->validate(Lezvcard/VCardVersion;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 107
    invoke-virtual {p0, v1, p1, p2}, Lezvcard/property/VCardProperty;->_validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    .line 109
    return-object v1
.end method
