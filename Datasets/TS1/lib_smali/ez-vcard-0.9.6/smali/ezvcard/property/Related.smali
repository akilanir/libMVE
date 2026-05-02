.class public Lezvcard/property/Related;
.super Lezvcard/property/VCardProperty;
.source "Related.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private text:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 88
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 97
    invoke-virtual {p0, p1}, Lezvcard/property/Related;->setUri(Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public static email(Ljava/lang/String;)Lezvcard/property/Related;
    .registers 4
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 106
    new-instance v0, Lezvcard/property/Related;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mailto:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/property/Related;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static im(Ljava/lang/String;Ljava/lang/String;)Lezvcard/property/Related;
    .registers 5
    .param p0, "protocol"    # Ljava/lang/String;
    .param p1, "handle"    # Ljava/lang/String;

    .prologue
    .line 116
    new-instance v0, Lezvcard/property/Related;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/property/Related;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static telephone(Lezvcard/util/TelUri;)Lezvcard/property/Related;
    .registers 3
    .param p0, "telUri"    # Lezvcard/util/TelUri;

    .prologue
    .line 125
    new-instance v0, Lezvcard/property/Related;

    invoke-virtual {p0}, Lezvcard/util/TelUri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/property/Related;-><init>(Ljava/lang/String;)V

    return-object v0
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
    .line 130
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 7
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
    .line 233
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/Related;->uri:Ljava/lang/String;

    if-nez v0, :cond_15

    iget-object v0, p0, Lezvcard/property/Related;->text:Ljava/lang/String;

    if-nez v0, :cond_15

    .line 234
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_15
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 203
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 204
    return-void
.end method

.method public addType(Lezvcard/parameter/RelatedType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/RelatedType;

    .prologue
    .line 185
    iget-object v0, p0, Lezvcard/property/Related;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/RelatedType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 186
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lezvcard/property/Related;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 198
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 213
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lezvcard/property/Related;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTypes()Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/parameter/RelatedType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 172
    iget-object v4, p0, Lezvcard/property/Related;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 173
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 174
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/RelatedType;>;"
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

    .line 175
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/RelatedType;->get(Ljava/lang/String;)Lezvcard/parameter/RelatedType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 177
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lezvcard/property/Related;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 208
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 209
    return-void
.end method

.method public removeType(Lezvcard/parameter/RelatedType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/RelatedType;

    .prologue
    .line 193
    iget-object v0, p0, Lezvcard/property/Related;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/RelatedType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 194
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v0, p0, Lezvcard/property/Related;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 218
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 219
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lezvcard/property/Related;->text:Ljava/lang/String;

    .line 164
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Related;->uri:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lezvcard/property/Related;->uri:Ljava/lang/String;

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Related;->text:Ljava/lang/String;

    .line 148
    return-void
.end method
