.class public Lezvcard/property/Impp;
.super Lezvcard/property/VCardProperty;
.source "Impp.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# static fields
.field private static final AIM:Ljava/lang/String; = "aim"

.field private static final ICQ:Ljava/lang/String; = "icq"

.field private static final IRC:Ljava/lang/String; = "irc"

.field private static final MSN:Ljava/lang/String; = "msnim"

.field private static final SIP:Ljava/lang/String; = "sip"

.field private static final SKYPE:Ljava/lang/String; = "skype"

.field private static final XMPP:Ljava/lang/String; = "xmpp"

.field private static final YAHOO:Ljava/lang/String; = "ymsgr"


# instance fields
.field private uri:Ljava/net/URI;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 94
    invoke-virtual {p0, p1}, Lezvcard/property/Impp;->setUri(Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "handle"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 113
    invoke-virtual {p0, p1, p2}, Lezvcard/property/Impp;->setUri(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 102
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 103
    invoke-virtual {p0, p1}, Lezvcard/property/Impp;->setUri(Ljava/net/URI;)V

    .line 104
    return-void
.end method

.method public static aim(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 127
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "aim"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static icq(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 179
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "icq"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static irc(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 196
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "irc"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private isProtocol(Ljava/lang/String;)Z
    .registers 3
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 263
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static msn(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 162
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "msnim"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static sip(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 214
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "sip"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static skype(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 232
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "skype"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static xmpp(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 250
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "xmpp"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static yahoo(Ljava/lang/String;)Lezvcard/property/Impp;
    .registers 3
    .param p0, "handle"    # Ljava/lang/String;

    .prologue
    .line 145
    new-instance v0, Lezvcard/property/Impp;

    const-string v1, "ymsgr"

    invoke-direct {v0, v1, p0}, Lezvcard/property/Impp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
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
    .line 118
    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

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
    .line 416
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    if-nez v0, :cond_11

    .line 417
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    :cond_11
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 386
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 387
    return-void
.end method

.method public addType(Lezvcard/parameter/ImppType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/ImppType;

    .prologue
    .line 346
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/ImppType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 347
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 406
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHandle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    if-nez v0, :cond_6

    .line 323
    const/4 v0, 0x0

    .line 325
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 365
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

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
    .line 381
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 396
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    if-nez v0, :cond_6

    .line 311
    const/4 v0, 0x0

    .line 313
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getTypes()Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/parameter/ImppType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 333
    iget-object v4, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 334
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 335
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/ImppType;>;"
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

    .line 336
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/ImppType;->get(Ljava/lang/String;)Lezvcard/parameter/ImppType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 338
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public getUri()Ljava/net/URI;
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public isAim()Z
    .registers 2

    .prologue
    .line 136
    const-string v0, "aim"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isIcq()Z
    .registers 2

    .prologue
    .line 187
    const-string v0, "icq"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isIrc()Z
    .registers 2

    .prologue
    .line 204
    const-string v0, "irc"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isMsn()Z
    .registers 2

    .prologue
    .line 170
    const-string v0, "msnim"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSip()Z
    .registers 2

    .prologue
    .line 223
    const-string v0, "sip"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSkype()Z
    .registers 2

    .prologue
    .line 240
    const-string v0, "skype"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isXmpp()Z
    .registers 2

    .prologue
    .line 259
    const-string v0, "xmpp"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isYahoo()Z
    .registers 2

    .prologue
    .line 153
    const-string v0, "ymsgr"

    invoke-direct {p0, v0}, Lezvcard/property/Impp;->isProtocol(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 391
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 392
    return-void
.end method

.method public removeType(Lezvcard/parameter/ImppType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/ImppType;

    .prologue
    .line 354
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/ImppType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 355
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 411
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 412
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 376
    iget-object v0, p0, Lezvcard/property/Impp;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 377
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 401
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 402
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 280
    if-nez p1, :cond_7

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lezvcard/property/Impp;->setUri(Ljava/net/URI;)V

    .line 281
    return-void

    .line 280
    :cond_7
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    goto :goto_3
.end method

.method public setUri(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "handle"    # Ljava/lang/String;

    .prologue
    .line 298
    :try_start_0
    new-instance v1, Ljava/net/URI;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;
    :try_end_8
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_8} :catch_9

    .line 302
    return-void

    .line 299
    :catch_9
    move-exception v0

    .line 300
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setUri(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 288
    iput-object p1, p0, Lezvcard/property/Impp;->uri:Ljava/net/URI;

    .line 289
    return-void
.end method
