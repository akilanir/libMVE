.class public Lezvcard/property/Telephone;
.super Lezvcard/property/VCardProperty;
.source "Telephone.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private text:Ljava/lang/String;

.field private uri:Lezvcard/util/TelUri;


# direct methods
.method public constructor <init>(Lezvcard/util/TelUri;)V
    .registers 2
    .param p1, "uri"    # Lezvcard/util/TelUri;

    .prologue
    .line 92
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 93
    invoke-virtual {p0, p1}, Lezvcard/property/Telephone;->setUri(Lezvcard/util/TelUri;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 85
    invoke-virtual {p0, p1}, Lezvcard/property/Telephone;->setText(Ljava/lang/String;)V

    .line 86
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
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    const/4 v6, 0x0

    .line 202
    iget-object v2, p0, Lezvcard/property/Telephone;->uri:Lezvcard/util/TelUri;

    if-nez v2, :cond_15

    iget-object v2, p0, Lezvcard/property/Telephone;->text:Ljava/lang/String;

    if-nez v2, :cond_15

    .line 203
    new-instance v2, Lezvcard/Warning;

    const/16 v3, 0x8

    new-array v4, v6, [Ljava/lang/Object;

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_15
    iget-object v2, p0, Lezvcard/property/Telephone;->uri:Lezvcard/util/TelUri;

    if-eqz v2, :cond_2d

    sget-object v2, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-eq p2, v2, :cond_21

    sget-object v2, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne p2, v2, :cond_2d

    .line 207
    :cond_21
    new-instance v2, Lezvcard/Warning;

    const/16 v3, 0x13

    new-array v4, v6, [Ljava/lang/Object;

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    :cond_2d
    invoke-virtual {p0}, Lezvcard/property/Telephone;->getTypes()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_35
    :goto_35
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/parameter/TelephoneType;

    .line 211
    .local v1, "type":Lezvcard/parameter/TelephoneType;
    sget-object v2, Lezvcard/parameter/TelephoneType;->PREF:Lezvcard/parameter/TelephoneType;

    if-eq v1, v2, :cond_35

    .line 216
    invoke-virtual {v1, p2}, Lezvcard/parameter/TelephoneType;->isSupported(Lezvcard/VCardVersion;)Z

    move-result v2

    if-nez v2, :cond_35

    .line 217
    new-instance v2, Lezvcard/Warning;

    const/16 v3, 0x9

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v1}, Lezvcard/parameter/TelephoneType;->getValue()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_35

    .line 220
    .end local v1    # "type":Lezvcard/parameter/TelephoneType;
    :cond_5f
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 172
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 173
    return-void
.end method

.method public addType(Lezvcard/parameter/TelephoneType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/TelephoneType;

    .prologue
    .line 154
    iget-object v0, p0, Lezvcard/property/Telephone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/TelephoneType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lezvcard/property/Telephone;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 167
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 182
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lezvcard/property/Telephone;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTypes()Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/parameter/TelephoneType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v4, p0, Lezvcard/property/Telephone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 142
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 143
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/TelephoneType;>;"
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

    .line 144
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/TelephoneType;->get(Ljava/lang/String;)Lezvcard/parameter/TelephoneType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 146
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public getUri()Lezvcard/util/TelUri;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lezvcard/property/Telephone;->uri:Lezvcard/util/TelUri;

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 177
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 178
    return-void
.end method

.method public removeType(Lezvcard/parameter/TelephoneType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/TelephoneType;

    .prologue
    .line 162
    iget-object v0, p0, Lezvcard/property/Telephone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/TelephoneType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 163
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 197
    iget-object v0, p0, Lezvcard/property/Telephone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 187
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 188
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lezvcard/property/Telephone;->text:Ljava/lang/String;

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Telephone;->uri:Lezvcard/util/TelUri;

    .line 111
    return-void
.end method

.method public setUri(Lezvcard/util/TelUri;)V
    .registers 3
    .param p1, "uri"    # Lezvcard/util/TelUri;

    .prologue
    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Telephone;->text:Ljava/lang/String;

    .line 133
    iput-object p1, p0, Lezvcard/property/Telephone;->uri:Lezvcard/util/TelUri;

    .line 134
    return-void
.end method
