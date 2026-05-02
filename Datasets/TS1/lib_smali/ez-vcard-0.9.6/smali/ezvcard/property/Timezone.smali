.class public Lezvcard/property/Timezone;
.super Lezvcard/property/VCardProperty;
.source "Timezone.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private offset:Lezvcard/util/UtcOffset;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lezvcard/util/UtcOffset;)V
    .registers 3
    .param p1, "offset"    # Lezvcard/util/UtcOffset;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lezvcard/util/UtcOffset;Ljava/lang/String;)V
    .registers 3
    .param p1, "offset"    # Lezvcard/util/UtcOffset;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 126
    invoke-virtual {p0, p1}, Lezvcard/property/Timezone;->setOffset(Lezvcard/util/UtcOffset;)V

    .line 127
    invoke-virtual {p0, p2}, Lezvcard/property/Timezone;->setText(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 6
    .param p1, "hourOffset"    # Ljava/lang/Integer;
    .param p2, "minuteOffset"    # Ljava/lang/Integer;

    .prologue
    .line 93
    new-instance v0, Lezvcard/util/UtcOffset;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lezvcard/util/UtcOffset;-><init>(II)V

    invoke-direct {p0, v0}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;)V
    .registers 7
    .param p1, "hourOffset"    # Ljava/lang/Integer;
    .param p2, "minuteOffset"    # Ljava/lang/Integer;
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 114
    new-instance v0, Lezvcard/util/UtcOffset;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lezvcard/util/UtcOffset;-><init>(II)V

    invoke-direct {p0, v0, p3}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;)V
    .registers 4
    .param p1, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 135
    invoke-static {p1}, Lezvcard/util/UtcOffset;->parse(Ljava/util/TimeZone;)Lezvcard/util/UtcOffset;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;Ljava/lang/String;)V

    .line 136
    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 8
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
    const/4 v3, 0x0

    .line 313
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-nez v0, :cond_15

    iget-object v0, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    if-nez v0, :cond_15

    .line 314
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    :cond_15
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-nez v0, :cond_29

    sget-object v0, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-ne p2, v0, :cond_29

    .line 317
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x14

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    :cond_29
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v0}, Lezvcard/util/UtcOffset;->getMinute()I

    move-result v0

    if-ltz v0, :cond_3f

    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v0}, Lezvcard/util/UtcOffset;->getMinute()I

    move-result v0

    const/16 v1, 0x3b

    if-le v0, v1, :cond_4b

    .line 320
    :cond_3f
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x15

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_4b
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 283
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 284
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHourOffset()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v0}, Lezvcard/util/UtcOffset;->getHour()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_5
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getMediaType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMinuteOffset()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v0}, Lezvcard/util/UtcOffset;->getMinute()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_5
.end method

.method public getOffset()Lezvcard/util/UtcOffset;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

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
    .line 278
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 293
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 288
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 289
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 308
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 309
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 273
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setMediaType(Ljava/lang/String;)V

    .line 274
    return-void
.end method

.method public setOffset(II)V
    .registers 4
    .param p1, "hourOffset"    # I
    .param p2, "minuteOffset"    # I

    .prologue
    .line 168
    new-instance v0, Lezvcard/util/UtcOffset;

    invoke-direct {v0, p1, p2}, Lezvcard/util/UtcOffset;-><init>(II)V

    invoke-virtual {p0, v0}, Lezvcard/property/Timezone;->setOffset(Lezvcard/util/UtcOffset;)V

    .line 169
    return-void
.end method

.method public setOffset(Lezvcard/util/UtcOffset;)V
    .registers 2
    .param p1, "offset"    # Lezvcard/util/UtcOffset;

    .prologue
    .line 176
    iput-object p1, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    .line 177
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 298
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 299
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    .line 199
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 251
    iget-object v0, p0, Lezvcard/property/Timezone;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 252
    return-void
.end method

.method public toTimeZone()Ljava/util/TimeZone;
    .registers 7

    .prologue
    .line 207
    iget-object v5, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    if-eqz v5, :cond_d

    .line 208
    iget-object v5, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    invoke-static {v5}, Lezvcard/util/VCardDateFormat;->parseTimeZoneId(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v4

    .line 209
    .local v4, "timezone":Ljava/util/TimeZone;
    if-eqz v4, :cond_d

    .line 227
    .end local v4    # "timezone":Ljava/util/TimeZone;
    :goto_c
    return-object v4

    .line 214
    :cond_d
    iget-object v5, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    if-eqz v5, :cond_3c

    .line 215
    iget-object v5, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v5}, Lezvcard/util/UtcOffset;->getHour()I

    move-result v5

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit16 v1, v5, 0x3e8

    .line 216
    .local v1, "rawHourOffset":I
    iget-object v5, p0, Lezvcard/property/Timezone;->offset:Lezvcard/util/UtcOffset;

    invoke-virtual {v5}, Lezvcard/util/UtcOffset;->getMinute()I

    move-result v5

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit16 v2, v5, 0x3e8

    .line 217
    .local v2, "rawMinuteOffset":I
    if-gez v1, :cond_2b

    .line 218
    mul-int/lit8 v2, v2, -0x1

    .line 220
    :cond_2b
    add-int v3, v1, v2

    .line 222
    .local v3, "rawOffset":I
    iget-object v5, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    if-nez v5, :cond_39

    const-string v0, ""

    .line 224
    .local v0, "id":Ljava/lang/String;
    :goto_33
    new-instance v4, Ljava/util/SimpleTimeZone;

    invoke-direct {v4, v3, v0}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    goto :goto_c

    .line 222
    .end local v0    # "id":Ljava/lang/String;
    :cond_39
    iget-object v0, p0, Lezvcard/property/Timezone;->text:Ljava/lang/String;

    goto :goto_33

    .line 227
    .end local v1    # "rawHourOffset":I
    .end local v2    # "rawMinuteOffset":I
    .end local v3    # "rawOffset":I
    :cond_3c
    const/4 v4, 0x0

    goto :goto_c
.end method
