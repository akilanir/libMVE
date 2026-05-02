.class public Lezvcard/property/Email;
.super Lezvcard/property/TextProperty;
.source "Email.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lezvcard/property/TextProperty;-><init>(Ljava/lang/String;)V

    .line 78
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
    .line 146
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-super {p0, p1, p2, p3}, Lezvcard/property/TextProperty;->_validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    .line 148
    invoke-virtual {p0}, Lezvcard/property/Email;->getTypes()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/parameter/EmailType;

    .line 149
    .local v1, "type":Lezvcard/parameter/EmailType;
    sget-object v2, Lezvcard/parameter/EmailType;->PREF:Lezvcard/parameter/EmailType;

    if-eq v1, v2, :cond_b

    .line 153
    invoke-virtual {v1, p2}, Lezvcard/parameter/EmailType;->isSupported(Lezvcard/VCardVersion;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 154
    new-instance v2, Lezvcard/Warning;

    const/16 v3, 0x9

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Lezvcard/parameter/EmailType;->getValue()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {v2, v3, v4}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 157
    .end local v1    # "type":Lezvcard/parameter/EmailType;
    :cond_36
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 116
    invoke-super {p0, p1, p2}, Lezvcard/property/TextProperty;->addPid(II)V

    .line 117
    return-void
.end method

.method public addType(Lezvcard/parameter/EmailType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/EmailType;

    .prologue
    .line 98
    iget-object v0, p0, Lezvcard/property/Email;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/EmailType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lezvcard/property/Email;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 111
    invoke-super {p0}, Lezvcard/property/TextProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 126
    invoke-super {p0}, Lezvcard/property/TextProperty;->getPref()Ljava/lang/Integer;

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
            "Lezvcard/parameter/EmailType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    iget-object v4, p0, Lezvcard/property/Email;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 86
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 87
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/EmailType;>;"
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

    .line 88
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/EmailType;->get(Ljava/lang/String;)Lezvcard/parameter/EmailType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 90
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 121
    invoke-super {p0}, Lezvcard/property/TextProperty;->removePids()V

    .line 122
    return-void
.end method

.method public removeType(Lezvcard/parameter/EmailType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/EmailType;

    .prologue
    .line 106
    iget-object v0, p0, Lezvcard/property/Email;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/EmailType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 141
    iget-object v0, p0, Lezvcard/property/Email;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 131
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setPref(Ljava/lang/Integer;)V

    .line 132
    return-void
.end method
