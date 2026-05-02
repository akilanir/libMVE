.class public Lezvcard/io/scribe/TimezoneScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "TimezoneScribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/scribe/TimezoneScribe$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<",
        "Lezvcard/property/Timezone;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 98
    const-class v0, Lezvcard/property/Timezone;

    const-string v1, "TZ"

    invoke-direct {p0, v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method private offsetFromTimezone(Ljava/util/TimeZone;)Lezvcard/util/UtcOffset;
    .registers 12
    .param p1, "timezone"    # Ljava/util/TimeZone;

    .prologue
    const-wide/16 v8, 0x3e8

    const-wide/16 v6, 0x3c

    .line 282
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v4

    int-to-long v2, v4

    .line 283
    .local v2, "offsetMs":J
    div-long v4, v2, v8

    div-long/2addr v4, v6

    div-long/2addr v4, v6

    long-to-int v0, v4

    .line 284
    .local v0, "hours":I
    div-long v4, v2, v8

    div-long/2addr v4, v6

    rem-long/2addr v4, v6

    long-to-int v1, v4

    .line 285
    .local v1, "minutes":I
    if-gez v1, :cond_1b

    .line 286
    mul-int/lit8 v1, v1, -0x1

    .line 288
    :cond_1b
    new-instance v4, Lezvcard/util/UtcOffset;

    invoke-direct {v4, v0, v1}, Lezvcard/util/UtcOffset;-><init>(II)V

    return-object v4
.end method

.method private parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Timezone;
    .registers 10
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/VCardVersion;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Timezone;"
        }
    .end annotation

    .prologue
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 254
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_13

    .line 255
    :cond_a
    new-instance v2, Lezvcard/property/Timezone;

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v1}, Lezvcard/property/Timezone;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    .line 278
    :goto_12
    return-object v1

    .line 258
    :cond_13
    sget-object v2, Lezvcard/io/scribe/TimezoneScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p3}, Lezvcard/VCardVersion;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_5e

    .line 278
    new-instance v2, Lezvcard/property/Timezone;

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v1}, Lezvcard/property/Timezone;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    goto :goto_12

    .line 262
    :pswitch_27
    :try_start_27
    new-instance v1, Lezvcard/property/Timezone;

    invoke-static {p1}, Lezvcard/util/UtcOffset;->parse(Ljava/lang/String;)Lezvcard/util/UtcOffset;

    move-result-object v2

    invoke-direct {v1, v2}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;)V
    :try_end_30
    .catch Ljava/lang/IllegalArgumentException; {:try_start_27 .. :try_end_30} :catch_31

    goto :goto_12

    .line 263
    :catch_31
    move-exception v0

    .line 264
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lezvcard/io/CannotParseException;

    const/16 v2, 0x13

    new-array v3, v4, [Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v1

    .line 269
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :pswitch_3c
    :try_start_3c
    new-instance v1, Lezvcard/property/Timezone;

    invoke-static {p1}, Lezvcard/util/UtcOffset;->parse(Ljava/lang/String;)Lezvcard/util/UtcOffset;

    move-result-object v2

    invoke-direct {v1, v2}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;)V
    :try_end_45
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3c .. :try_end_45} :catch_46

    goto :goto_12

    .line 270
    :catch_46
    move-exception v0

    .line 271
    .restart local v0    # "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    if-ne p2, v1, :cond_58

    .line 272
    sget-object v1, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    const/16 v2, 0x14

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    :cond_58
    new-instance v1, Lezvcard/property/Timezone;

    invoke-direct {v1, p1}, Lezvcard/property/Timezone;-><init>(Ljava/lang/String;)V

    goto :goto_12

    .line 258
    :pswitch_data_5e
    .packed-switch 0x1
        :pswitch_27
        :pswitch_3c
        :pswitch_3c
    .end packed-switch
.end method

.method private timezoneFromId(Ljava/lang/String;)Ljava/util/TimeZone;
    .registers 5
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 292
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 293
    .local v0, "timezone":Ljava/util/TimeZone;
    const-string v1, "GMT"

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 v0, 0x0

    .end local v0    # "timezone":Ljava/util/TimeZone;
    :cond_11
    return-object v0
.end method


# virtual methods
.method protected _dataType(Lezvcard/property/Timezone;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 7
    .param p1, "property"    # Lezvcard/property/Timezone;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 115
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getText()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getOffset()Lezvcard/util/UtcOffset;

    move-result-object v0

    .line 118
    .local v0, "offset":Lezvcard/util/UtcOffset;
    sget-object v2, Lezvcard/io/scribe/TimezoneScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_30

    .line 139
    :cond_13
    invoke-virtual {p0, p2}, Lezvcard/io/scribe/TimezoneScribe;->_defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v2

    :goto_17
    return-object v2

    .line 120
    :pswitch_18
    sget-object v2, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    goto :goto_17

    .line 122
    :pswitch_1b
    if-eqz v0, :cond_20

    .line 123
    sget-object v2, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    goto :goto_17

    .line 125
    :cond_20
    if-eqz v1, :cond_13

    .line 126
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    goto :goto_17

    .line 130
    :pswitch_25
    if-eqz v1, :cond_2a

    .line 131
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    goto :goto_17

    .line 133
    :cond_2a
    if-eqz v0, :cond_13

    .line 134
    sget-object v2, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    goto :goto_17

    .line 118
    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1b
        :pswitch_25
    .end packed-switch
.end method

.method protected bridge synthetic _dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 96
    check-cast p1, Lezvcard/property/Timezone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TimezoneScribe;->_dataType(Lezvcard/property/Timezone;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    return-object v0
.end method

.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 103
    sget-object v0, Lezvcard/io/scribe/TimezoneScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p1}, Lezvcard/VCardVersion;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 110
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 106
    :pswitch_d
    sget-object v0, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    goto :goto_c

    .line 108
    :pswitch_10
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    goto :goto_c

    .line 103
    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_d
        :pswitch_d
        :pswitch_10
    .end packed-switch
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Timezone;
    .registers 6
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Timezone;"
        }
    .end annotation

    .prologue
    .line 229
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->value()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-direct {p0, v0, v1, v2, p2}, Lezvcard/io/scribe/TimezoneScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 96
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TimezoneScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;
    .registers 7
    .param p1, "value"    # Lezvcard/io/json/JCardValue;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/json/JCardValue;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Timezone;"
        }
    .end annotation

    .prologue
    .line 249
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "valueStr":Ljava/lang/String;
    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, v0, p2, v1, p4}, Lezvcard/io/scribe/TimezoneScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 96
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/TimezoneScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "version"    # Lezvcard/VCardVersion;
    .param p4, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Timezone;"
        }
    .end annotation

    .prologue
    .line 187
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/TimezoneScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 188
    invoke-direct {p0, p1, p2, p3, p5}, Lezvcard/io/scribe/TimezoneScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 7
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/parameter/VCardParameters;
    .param p5, "x4"    # Ljava/util/List;

    .prologue
    .line 96
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/TimezoneScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;
    .registers 11
    .param p1, "element"    # Lezvcard/io/xml/XCardElement;
    .param p2, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/xml/XCardElement;",
            "Lezvcard/parameter/VCardParameters;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Timezone;"
        }
    .end annotation

    .prologue
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 210
    new-array v3, v6, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    invoke-virtual {p1, v3}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_14

    .line 212
    new-instance v3, Lezvcard/property/Timezone;

    invoke-direct {v3, v1}, Lezvcard/property/Timezone;-><init>(Ljava/lang/String;)V

    .line 218
    :goto_13
    return-object v3

    .line 215
    :cond_14
    new-array v3, v6, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    invoke-virtual {p1, v3}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v2

    .line 216
    .local v2, "utcOffset":Ljava/lang/String;
    if-eqz v2, :cond_35

    .line 218
    :try_start_20
    new-instance v3, Lezvcard/property/Timezone;

    invoke-static {v2}, Lezvcard/util/UtcOffset;->parse(Ljava/lang/String;)Lezvcard/util/UtcOffset;

    move-result-object v4

    invoke-direct {v3, v4}, Lezvcard/property/Timezone;-><init>(Lezvcard/util/UtcOffset;)V
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20 .. :try_end_29} :catch_2a

    goto :goto_13

    .line 219
    :catch_2a
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lezvcard/io/CannotParseException;

    const/16 v4, 0x13

    new-array v5, v5, [Ljava/lang/Object;

    invoke-direct {v3, v4, v5}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v3

    .line 224
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_35
    const/4 v3, 0x2

    new-array v3, v3, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    sget-object v4, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    aput-object v4, v3, v6

    invoke-static {v3}, Lezvcard/io/scribe/TimezoneScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v3

    throw v3
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 96
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/TimezoneScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Timezone;

    move-result-object v0

    return-object v0
.end method

.method protected _writeJson(Lezvcard/property/Timezone;)Lezvcard/io/json/JCardValue;
    .registers 5
    .param p1, "property"    # Lezvcard/property/Timezone;

    .prologue
    .line 234
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getText()Ljava/lang/String;

    move-result-object v1

    .line 235
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_b

    .line 236
    invoke-static {v1}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    .line 244
    :goto_a
    return-object v2

    .line 239
    :cond_b
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getOffset()Lezvcard/util/UtcOffset;

    move-result-object v0

    .line 240
    .local v0, "offset":Lezvcard/util/UtcOffset;
    if-eqz v0, :cond_1b

    .line 241
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    goto :goto_a

    .line 244
    :cond_1b
    const-string v2, ""

    invoke-static {v2}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    goto :goto_a
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 96
    check-cast p1, Lezvcard/property/Timezone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/TimezoneScribe;->_writeJson(Lezvcard/property/Timezone;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/Timezone;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 10
    .param p1, "property"    # Lezvcard/property/Timezone;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    const/4 v6, 0x0

    .line 144
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getText()Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getOffset()Lezvcard/util/UtcOffset;

    move-result-object v0

    .line 147
    .local v0, "offset":Lezvcard/util/UtcOffset;
    sget-object v4, Lezvcard/io/scribe/TimezoneScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_4c

    .line 182
    :cond_14
    const-string v4, ""

    :goto_16
    return-object v4

    .line 149
    :pswitch_17
    if-eqz v0, :cond_1e

    .line 150
    invoke-virtual {v0, v6}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 153
    :cond_1e
    if-eqz v1, :cond_14

    .line 155
    invoke-direct {p0, v1}, Lezvcard/io/scribe/TimezoneScribe;->timezoneFromId(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    .line 156
    .local v2, "timezone":Ljava/util/TimeZone;
    if-eqz v2, :cond_14

    .line 157
    invoke-direct {p0, v2}, Lezvcard/io/scribe/TimezoneScribe;->offsetFromTimezone(Ljava/util/TimeZone;)Lezvcard/util/UtcOffset;

    move-result-object v3

    .line 158
    .local v3, "tzOffset":Lezvcard/util/UtcOffset;
    invoke-virtual {v3, v6}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 163
    .end local v2    # "timezone":Ljava/util/TimeZone;
    .end local v3    # "tzOffset":Lezvcard/util/UtcOffset;
    :pswitch_2f
    if-eqz v0, :cond_37

    .line 164
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 167
    :cond_37
    if-eqz v1, :cond_14

    .line 168
    invoke-static {v1}, Lezvcard/io/scribe/TimezoneScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 172
    :pswitch_3e
    if-eqz v1, :cond_45

    .line 173
    invoke-static {v1}, Lezvcard/io/scribe/TimezoneScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 176
    :cond_45
    if-eqz v0, :cond_14

    .line 177
    invoke-virtual {v0, v6}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 147
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_17
        :pswitch_2f
        :pswitch_3e
    .end packed-switch
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 96
    check-cast p1, Lezvcard/property/Timezone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TimezoneScribe;->_writeText(Lezvcard/property/Timezone;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/Timezone;Lezvcard/io/xml/XCardElement;)V
    .registers 7
    .param p1, "property"    # Lezvcard/property/Timezone;
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 193
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getText()Ljava/lang/String;

    move-result-object v1

    .line 194
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_c

    .line 195
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p2, v2, v1}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 206
    :goto_b
    return-void

    .line 199
    :cond_c
    invoke-virtual {p1}, Lezvcard/property/Timezone;->getOffset()Lezvcard/util/UtcOffset;

    move-result-object v0

    .line 200
    .local v0, "offset":Lezvcard/util/UtcOffset;
    if-eqz v0, :cond_1d

    .line 201
    sget-object v2, Lezvcard/VCardDataType;->UTC_OFFSET:Lezvcard/VCardDataType;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lezvcard/util/UtcOffset;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b

    .line 205
    :cond_1d
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    const-string v3, ""

    invoke-virtual {p2, v2, v3}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 96
    check-cast p1, Lezvcard/property/Timezone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TimezoneScribe;->_writeXml(Lezvcard/property/Timezone;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method
