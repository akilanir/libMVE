.class public Lezvcard/io/scribe/TelephoneScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "TelephoneScribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<",
        "Lezvcard/property/Telephone;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 47
    const-class v0, Lezvcard/property/Telephone;

    const-string v1, "TEL"

    invoke-direct {p0, v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method private parse(Ljava/lang/String;Lezvcard/VCardDataType;Ljava/util/List;)Lezvcard/property/Telephone;
    .registers 8
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Telephone;"
        }
    .end annotation

    .prologue
    .line 182
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    new-instance v1, Lezvcard/property/Telephone;

    invoke-static {p1}, Lezvcard/util/TelUri;->parse(Ljava/lang/String;)Lezvcard/util/TelUri;

    move-result-object v2

    invoke-direct {v1, v2}, Lezvcard/property/Telephone;-><init>(Lezvcard/util/TelUri;)V
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_a

    .line 189
    :goto_9
    return-object v1

    .line 183
    :catch_a
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    if-ne p2, v1, :cond_1d

    .line 185
    sget-object v1, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    const/16 v2, 0x12

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_1d
    new-instance v1, Lezvcard/property/Telephone;

    invoke-direct {v1, p1}, Lezvcard/property/Telephone;-><init>(Ljava/lang/String;)V

    goto :goto_9
.end method


# virtual methods
.method protected _dataType(Lezvcard/property/Telephone;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "property"    # Lezvcard/property/Telephone;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 57
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p2, v0, :cond_16

    .line 58
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 59
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    .line 66
    :goto_c
    return-object v0

    .line 61
    :cond_d
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getUri()Lezvcard/util/TelUri;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 62
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_c

    .line 66
    :cond_16
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    goto :goto_c
.end method

.method protected bridge synthetic _dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Telephone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TelephoneScribe;->_dataType(Lezvcard/property/Telephone;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    return-object v0
.end method

.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 3
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 52
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    return-object v0
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Telephone;
    .registers 10
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Telephone;"
        }
    .end annotation

    .prologue
    .line 143
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v6, "href"

    invoke-virtual {p1, v6}, Lezvcard/io/html/HCardElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "href":Ljava/lang/String;
    :try_start_6
    new-instance v3, Lezvcard/property/Telephone;

    invoke-static {v1}, Lezvcard/util/TelUri;->parse(Ljava/lang/String;)Lezvcard/util/TelUri;

    move-result-object v6

    invoke-direct {v3, v6}, Lezvcard/property/Telephone;-><init>(Lezvcard/util/TelUri;)V
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_f} :catch_2b

    .line 151
    .local v3, "property":Lezvcard/property/Telephone;
    :goto_f
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->types()Ljava/util/List;

    move-result-object v5

    .line 152
    .local v5, "types":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 153
    .local v4, "type":Ljava/lang/String;
    invoke-virtual {v3}, Lezvcard/property/Telephone;->getParameters()Lezvcard/parameter/VCardParameters;

    move-result-object v6

    invoke-virtual {v6, v4}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    goto :goto_17

    .line 146
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "property":Lezvcard/property/Telephone;
    .end local v4    # "type":Ljava/lang/String;
    .end local v5    # "types":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_2b
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lezvcard/property/Telephone;

    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->value()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lezvcard/property/Telephone;-><init>(Ljava/lang/String;)V

    .restart local v3    # "property":Lezvcard/property/Telephone;
    goto :goto_f

    .line 156
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v5    # "types":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_36
    return-object v3
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TelephoneScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Telephone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;
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
            "Lezvcard/property/Telephone;"
        }
    .end annotation

    .prologue
    .line 176
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, "valueStr":Ljava/lang/String;
    invoke-direct {p0, v0, p2, p4}, Lezvcard/io/scribe/TelephoneScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Ljava/util/List;)Lezvcard/property/Telephone;

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
    .line 45
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/TelephoneScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;
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
            "Lezvcard/property/Telephone;"
        }
    .end annotation

    .prologue
    .line 99
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/TelephoneScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 100
    invoke-direct {p0, p1, p2, p5}, Lezvcard/io/scribe/TelephoneScribe;->parse(Ljava/lang/String;Lezvcard/VCardDataType;Ljava/util/List;)Lezvcard/property/Telephone;

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
    .line 45
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/TelephoneScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;
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
            "Lezvcard/property/Telephone;"
        }
    .end annotation

    .prologue
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 122
    new-array v3, v6, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    invoke-virtual {p1, v3}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_14

    .line 124
    new-instance v3, Lezvcard/property/Telephone;

    invoke-direct {v3, v1}, Lezvcard/property/Telephone;-><init>(Ljava/lang/String;)V

    .line 133
    :goto_13
    return-object v3

    .line 127
    :cond_14
    new-array v3, v6, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    invoke-virtual {p1, v3}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "uri":Ljava/lang/String;
    if-eqz v2, :cond_3e

    .line 130
    :try_start_20
    new-instance v3, Lezvcard/property/Telephone;

    invoke-static {v2}, Lezvcard/util/TelUri;->parse(Ljava/lang/String;)Lezvcard/util/TelUri;

    move-result-object v4

    invoke-direct {v3, v4}, Lezvcard/property/Telephone;-><init>(Lezvcard/util/TelUri;)V
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20 .. :try_end_29} :catch_2a

    goto :goto_13

    .line 131
    :catch_2a
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    const/16 v4, 0x12

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    new-instance v3, Lezvcard/property/Telephone;

    invoke-direct {v3, v2}, Lezvcard/property/Telephone;-><init>(Ljava/lang/String;)V

    goto :goto_13

    .line 137
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_3e
    const/4 v3, 0x2

    new-array v3, v3, [Lezvcard/VCardDataType;

    sget-object v4, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v4, v3, v5

    sget-object v4, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v4, v3, v6

    invoke-static {v3}, Lezvcard/io/scribe/TelephoneScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v3

    throw v3
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/TelephoneScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Telephone;

    move-result-object v0

    return-object v0
.end method

.method protected _prepareParameters(Lezvcard/property/Telephone;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 5
    .param p1, "property"    # Lezvcard/property/Telephone;
    .param p2, "copy"    # Lezvcard/parameter/VCardParameters;
    .param p3, "version"    # Lezvcard/VCardVersion;
    .param p4, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 71
    invoke-static {p1, p2, p3, p4}, Lezvcard/io/scribe/TelephoneScribe;->handlePrefParam(Lezvcard/property/VCardProperty;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    .line 72
    return-void
.end method

.method protected bridge synthetic _prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 5
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/VCard;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Telephone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/TelephoneScribe;->_prepareParameters(Lezvcard/property/Telephone;Lezvcard/parameter/VCardParameters;Lezvcard/VCardVersion;Lezvcard/VCard;)V

    return-void
.end method

.method protected _writeJson(Lezvcard/property/Telephone;)Lezvcard/io/json/JCardValue;
    .registers 5
    .param p1, "property"    # Lezvcard/property/Telephone;

    .prologue
    .line 161
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getText()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "text":Ljava/lang/String;
    if-eqz v0, :cond_b

    .line 163
    invoke-static {v0}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    .line 171
    :goto_a
    return-object v2

    .line 166
    :cond_b
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getUri()Lezvcard/util/TelUri;

    move-result-object v1

    .line 167
    .local v1, "uri":Lezvcard/util/TelUri;
    if-eqz v1, :cond_1a

    .line 168
    invoke-virtual {v1}, Lezvcard/util/TelUri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    goto :goto_a

    .line 171
    :cond_1a
    const-string v2, ""

    invoke-static {v2}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    goto :goto_a
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Telephone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/TelephoneScribe;->_writeJson(Lezvcard/property/Telephone;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/Telephone;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 8
    .param p1, "property"    # Lezvcard/property/Telephone;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 76
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getText()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_b

    .line 78
    invoke-static {v1}, Lezvcard/io/scribe/TelephoneScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 94
    :goto_a
    return-object v3

    .line 81
    :cond_b
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getUri()Lezvcard/util/TelUri;

    move-result-object v2

    .line 82
    .local v2, "uri":Lezvcard/util/TelUri;
    if-eqz v2, :cond_49

    .line 83
    sget-object v3, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p2, v3, :cond_1a

    .line 84
    invoke-virtual {v2}, Lezvcard/util/TelUri;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_a

    .line 87
    :cond_1a
    invoke-virtual {v2}, Lezvcard/util/TelUri;->getExtension()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "ext":Ljava/lang/String;
    if-nez v0, :cond_29

    .line 89
    invoke-virtual {v2}, Lezvcard/util/TelUri;->getNumber()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lezvcard/io/scribe/TelephoneScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_a

    .line 91
    :cond_29
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lezvcard/util/TelUri;->getNumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lezvcard/io/scribe/TelephoneScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_a

    .line 94
    .end local v0    # "ext":Ljava/lang/String;
    :cond_49
    const-string v3, ""

    goto :goto_a
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Telephone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TelephoneScribe;->_writeText(Lezvcard/property/Telephone;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/Telephone;Lezvcard/io/xml/XCardElement;)V
    .registers 7
    .param p1, "property"    # Lezvcard/property/Telephone;
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 105
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getText()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "text":Ljava/lang/String;
    if-eqz v0, :cond_c

    .line 107
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p2, v2, v0}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 118
    :goto_b
    return-void

    .line 111
    :cond_c
    invoke-virtual {p1}, Lezvcard/property/Telephone;->getUri()Lezvcard/util/TelUri;

    move-result-object v1

    .line 112
    .local v1, "uri":Lezvcard/util/TelUri;
    if-eqz v1, :cond_1c

    .line 113
    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {v1}, Lezvcard/util/TelUri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b

    .line 117
    :cond_1c
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
    .line 45
    check-cast p1, Lezvcard/property/Telephone;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/TelephoneScribe;->_writeXml(Lezvcard/property/Telephone;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method
