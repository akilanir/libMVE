.class public abstract Lezvcard/io/scribe/PlacePropertyScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "PlacePropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/property/PlaceProperty;",
        ">",
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 46
    return-void
.end method


# virtual methods
.method protected _dataType(Lezvcard/property/PlaceProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/VCardVersion;",
            ")",
            "Lezvcard/VCardDataType;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 56
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    .line 63
    :goto_8
    return-object v0

    .line 59
    :cond_9
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getUri()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 60
    :cond_15
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_8

    .line 63
    :cond_18
    invoke-virtual {p0, p2}, Lezvcard/io/scribe/PlacePropertyScribe;->_defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    goto :goto_8
.end method

.method protected bridge synthetic _dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/PlaceProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/PlacePropertyScribe;->_dataType(Lezvcard/property/PlaceProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    return-object v0
.end method

.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 3
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 50
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;
    .registers 9
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lezvcard/io/scribe/PlacePropertyScribe;->newInstance()Lezvcard/property/PlaceProperty;

    move-result-object v1

    .line 178
    .local v1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "valueStr":Ljava/lang/String;
    sget-object v3, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    if-ne p2, v3, :cond_10

    .line 181
    invoke-virtual {v1, v2}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    .line 195
    :goto_f
    return-object v1

    .line 185
    :cond_10
    sget-object v3, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    if-ne p2, v3, :cond_21

    .line 187
    :try_start_14
    invoke-static {v2}, Lezvcard/util/GeoUri;->parse(Ljava/lang/String;)Lezvcard/util/GeoUri;

    move-result-object v3

    invoke-virtual {v1, v3}, Lezvcard/property/PlaceProperty;->setGeoUri(Lezvcard/util/GeoUri;)V
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_14 .. :try_end_1b} :catch_1c

    goto :goto_f

    .line 188
    :catch_1c
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1, v2}, Lezvcard/property/PlaceProperty;->setUri(Ljava/lang/String;)V

    goto :goto_f

    .line 194
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_21
    invoke-virtual {v1, v2}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    goto :goto_f
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/PlacePropertyScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;
    .registers 9
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lezvcard/io/scribe/PlacePropertyScribe;->newInstance()Lezvcard/property/PlaceProperty;

    move-result-object v1

    .line 89
    .local v1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-static {p1}, Lezvcard/io/scribe/PlacePropertyScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 91
    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    if-ne p2, v2, :cond_10

    .line 92
    invoke-virtual {v1, p1}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    .line 106
    :goto_f
    return-object v1

    .line 96
    :cond_10
    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    if-ne p2, v2, :cond_21

    .line 98
    :try_start_14
    invoke-static {p1}, Lezvcard/util/GeoUri;->parse(Ljava/lang/String;)Lezvcard/util/GeoUri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lezvcard/property/PlaceProperty;->setGeoUri(Lezvcard/util/GeoUri;)V
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_14 .. :try_end_1b} :catch_1c

    goto :goto_f

    .line 99
    :catch_1c
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1, p1}, Lezvcard/property/PlaceProperty;->setUri(Ljava/lang/String;)V

    goto :goto_f

    .line 105
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_21
    invoke-virtual {v1, p1}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    goto :goto_f
.end method

.method protected bridge synthetic _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 7
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/parameter/VCardParameters;
    .param p5, "x4"    # Ljava/util/List;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/PlacePropertyScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;
    .registers 12
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 134
    invoke-virtual {p0}, Lezvcard/io/scribe/PlacePropertyScribe;->newInstance()Lezvcard/property/PlaceProperty;

    move-result-object v1

    .line 136
    .local v1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    new-array v4, v7, [Lezvcard/VCardDataType;

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v5, v4, v6

    invoke-virtual {p1, v4}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, "text":Ljava/lang/String;
    if-eqz v2, :cond_16

    .line 138
    invoke-virtual {v1, v2}, Lezvcard/property/PlaceProperty;->setText(Ljava/lang/String;)V

    .line 149
    :goto_15
    return-object v1

    .line 142
    :cond_16
    new-array v4, v7, [Lezvcard/VCardDataType;

    sget-object v5, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v5, v4, v6

    invoke-virtual {p1, v4}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "uri":Ljava/lang/String;
    if-eqz v3, :cond_2f

    .line 145
    :try_start_22
    invoke-static {v3}, Lezvcard/util/GeoUri;->parse(Ljava/lang/String;)Lezvcard/util/GeoUri;

    move-result-object v4

    invoke-virtual {v1, v4}, Lezvcard/property/PlaceProperty;->setGeoUri(Lezvcard/util/GeoUri;)V
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_29} :catch_2a

    goto :goto_15

    .line 146
    :catch_2a
    move-exception v0

    .line 147
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1, v3}, Lezvcard/property/PlaceProperty;->setUri(Ljava/lang/String;)V

    goto :goto_15

    .line 152
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2f
    const/4 v4, 0x2

    new-array v4, v4, [Lezvcard/VCardDataType;

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v5, v4, v6

    sget-object v5, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v5, v4, v7

    invoke-static {v4}, Lezvcard/io/scribe/PlacePropertyScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v4

    throw v4
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/PlacePropertyScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/PlaceProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _writeJson(Lezvcard/property/PlaceProperty;)Lezvcard/io/json/JCardValue;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lezvcard/io/json/JCardValue;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getText()Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_b

    .line 159
    invoke-static {v1}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v3

    .line 172
    :goto_a
    return-object v3

    .line 162
    :cond_b
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 163
    .local v2, "uri":Ljava/lang/String;
    if-eqz v2, :cond_16

    .line 164
    invoke-static {v2}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v3

    goto :goto_a

    .line 167
    :cond_16
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v0

    .line 168
    .local v0, "geoUri":Lezvcard/util/GeoUri;
    if-eqz v0, :cond_25

    .line 169
    invoke-virtual {v0}, Lezvcard/util/GeoUri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v3

    goto :goto_a

    .line 172
    :cond_25
    const-string v3, ""

    invoke-static {v3}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v3

    goto :goto_a
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/PlaceProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/PlacePropertyScribe;->_writeJson(Lezvcard/property/PlaceProperty;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/PlaceProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 6
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/VCardVersion;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getText()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_b

    .line 70
    invoke-static {v1}, Lezvcard/io/scribe/PlacePropertyScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 83
    :cond_a
    :goto_a
    return-object v2

    .line 73
    :cond_b
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "uri":Ljava/lang/String;
    if-nez v2, :cond_a

    .line 78
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v0

    .line 79
    .local v0, "geoUri":Lezvcard/util/GeoUri;
    if-eqz v0, :cond_1c

    .line 80
    invoke-virtual {v0}, Lezvcard/util/GeoUri;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    .line 83
    :cond_1c
    const-string v2, ""

    goto :goto_a
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/PlaceProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/PlacePropertyScribe;->_writeText(Lezvcard/property/PlaceProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/PlaceProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 8
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/io/xml/XCardElement;",
            ")V"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/PlaceProperty;, "TT;"
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getText()Ljava/lang/String;

    move-result-object v1

    .line 112
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_c

    .line 113
    sget-object v3, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p2, v3, v1}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 130
    :goto_b
    return-void

    .line 117
    :cond_c
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 118
    .local v2, "uri":Ljava/lang/String;
    if-eqz v2, :cond_18

    .line 119
    sget-object v3, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p2, v3, v2}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b

    .line 123
    :cond_18
    invoke-virtual {p1}, Lezvcard/property/PlaceProperty;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v0

    .line 124
    .local v0, "geoUri":Lezvcard/util/GeoUri;
    if-eqz v0, :cond_28

    .line 125
    sget-object v3, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b

    .line 129
    :cond_28
    sget-object v3, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    const-string v4, ""

    invoke-virtual {p2, v3, v4}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_b
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 43
    .local p0, "this":Lezvcard/io/scribe/PlacePropertyScribe;, "Lezvcard/io/scribe/PlacePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/PlaceProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/PlacePropertyScribe;->_writeXml(Lezvcard/property/PlaceProperty;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method

.method protected abstract newInstance()Lezvcard/property/PlaceProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method
