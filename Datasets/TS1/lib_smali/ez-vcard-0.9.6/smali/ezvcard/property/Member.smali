.class public Lezvcard/property/Member;
.super Lezvcard/property/UriProperty;
.source "Member.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lezvcard/property/UriProperty;-><init>(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public static email(Ljava/lang/String;)Lezvcard/property/Member;
    .registers 4
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 89
    new-instance v0, Lezvcard/property/Member;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mailto:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/property/Member;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static im(Ljava/lang/String;Ljava/lang/String;)Lezvcard/property/Member;
    .registers 5
    .param p0, "protocol"    # Ljava/lang/String;
    .param p1, "handle"    # Ljava/lang/String;

    .prologue
    .line 99
    new-instance v0, Lezvcard/property/Member;

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

    invoke-direct {v0, v1}, Lezvcard/property/Member;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static telephone(Lezvcard/util/TelUri;)Lezvcard/property/Member;
    .registers 3
    .param p0, "telUri"    # Lezvcard/util/TelUri;

    .prologue
    .line 108
    new-instance v0, Lezvcard/property/Member;

    invoke-virtual {p0}, Lezvcard/util/TelUri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/property/Member;-><init>(Ljava/lang/String;)V

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
    .line 113
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
    .line 191
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-super {p0, p1, p2, p3}, Lezvcard/property/UriProperty;->_validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    .line 193
    invoke-virtual {p3}, Lezvcard/VCard;->getKind()Lezvcard/property/Kind;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {p3}, Lezvcard/VCard;->getKind()Lezvcard/property/Kind;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/property/Kind;->isGroup()Z

    move-result v0

    if-nez v0, :cond_20

    .line 194
    :cond_13
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x11

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    :cond_20
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 139
    invoke-super {p0, p1, p2}, Lezvcard/property/UriProperty;->addPid(II)V

    .line 140
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lezvcard/property/Member;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lezvcard/property/Member;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 134
    invoke-super {p0}, Lezvcard/property/UriProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 149
    invoke-super {p0}, Lezvcard/property/UriProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lezvcard/property/Member;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 144
    invoke-super {p0}, Lezvcard/property/UriProperty;->removePids()V

    .line 145
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lezvcard/property/Member;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v0, p0, Lezvcard/property/Member;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 187
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 154
    invoke-super {p0, p1}, Lezvcard/property/UriProperty;->setPref(Ljava/lang/Integer;)V

    .line 155
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lezvcard/property/Member;->setValue(Ljava/lang/Object;)V

    .line 130
    return-void
.end method
