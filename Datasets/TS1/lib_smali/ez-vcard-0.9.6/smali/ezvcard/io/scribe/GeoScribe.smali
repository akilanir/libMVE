.class public Lezvcard/io/scribe/GeoScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "GeoScribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/scribe/GeoScribe$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<",
        "Lezvcard/property/Geo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 47
    const-class v0, Lezvcard/property/Geo;

    const-string v1, "GEO"

    invoke-direct {p0, v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method private parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Geo;
    .registers 15
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lezvcard/VCardVersion;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Geo;"
        }
    .end annotation

    .prologue
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 128
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_12

    .line 129
    :cond_b
    new-instance v7, Lezvcard/property/Geo;

    invoke-direct {v7, v6}, Lezvcard/property/Geo;-><init>(Lezvcard/util/GeoUri;)V

    move-object v6, v7

    .line 164
    :goto_11
    return-object v6

    .line 132
    :cond_12
    sget-object v7, Lezvcard/io/scribe/GeoScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_76

    goto :goto_11

    .line 135
    :pswitch_1e
    invoke-static {p1}, Lezvcard/io/scribe/GeoScribe;->semistructured(Ljava/lang/String;)Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;

    move-result-object v1

    .line 136
    .local v1, "it":Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;
    invoke-virtual {v1}, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->next()Ljava/lang/String;

    move-result-object v3

    .line 137
    .local v3, "latitudeStr":Ljava/lang/String;
    invoke-virtual {v1}, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->next()Ljava/lang/String;

    move-result-object v5

    .line 138
    .local v5, "longitudeStr":Ljava/lang/String;
    if-eqz v3, :cond_2e

    if-nez v5, :cond_38

    .line 139
    :cond_2e
    new-instance v6, Lezvcard/io/CannotParseException;

    const/16 v7, 0xb

    new-array v8, v9, [Ljava/lang/Object;

    invoke-direct {v6, v7, v8}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 144
    :cond_38
    :try_start_38
    invoke-static {v3}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_3b
    .catch Ljava/lang/NumberFormatException; {:try_start_38 .. :try_end_3b} :catch_46

    move-result-object v2

    .line 151
    .local v2, "latitude":Ljava/lang/Double;
    :try_start_3c
    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_3f
    .catch Ljava/lang/NumberFormatException; {:try_start_3c .. :try_end_3f} :catch_53

    move-result-object v4

    .line 156
    .local v4, "longitude":Ljava/lang/Double;
    new-instance v6, Lezvcard/property/Geo;

    invoke-direct {v6, v2, v4}, Lezvcard/property/Geo;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    goto :goto_11

    .line 145
    .end local v2    # "latitude":Ljava/lang/Double;
    .end local v4    # "longitude":Ljava/lang/Double;
    :catch_46
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lezvcard/io/CannotParseException;

    const/16 v7, 0x8

    new-array v8, v10, [Ljava/lang/Object;

    aput-object v3, v8, v9

    invoke-direct {v6, v7, v8}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 152
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v2    # "latitude":Ljava/lang/Double;
    :catch_53
    move-exception v0

    .line 153
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lezvcard/io/CannotParseException;

    const/16 v7, 0xa

    new-array v8, v10, [Ljava/lang/Object;

    aput-object v5, v8, v9

    invoke-direct {v6, v7, v8}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 159
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v1    # "it":Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;
    .end local v2    # "latitude":Ljava/lang/Double;
    .end local v3    # "latitudeStr":Ljava/lang/String;
    .end local v5    # "longitudeStr":Ljava/lang/String;
    :pswitch_60
    :try_start_60
    new-instance v6, Lezvcard/property/Geo;

    invoke-static {p1}, Lezvcard/util/GeoUri;->parse(Ljava/lang/String;)Lezvcard/util/GeoUri;

    move-result-object v7

    invoke-direct {v6, v7}, Lezvcard/property/Geo;-><init>(Lezvcard/util/GeoUri;)V
    :try_end_69
    .catch Ljava/lang/IllegalArgumentException; {:try_start_60 .. :try_end_69} :catch_6a

    goto :goto_11

    .line 160
    :catch_6a
    move-exception v0

    .line 161
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v6, Lezvcard/io/CannotParseException;

    const/16 v7, 0xc

    new-array v8, v9, [Ljava/lang/Object;

    invoke-direct {v6, v7, v8}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v6

    .line 132
    nop

    :pswitch_data_76
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_1e
        :pswitch_60
    .end packed-switch
.end method

.method private write(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 7
    .param p1, "property"    # Lezvcard/property/Geo;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    const/4 v3, 0x6

    .line 168
    invoke-virtual {p1}, Lezvcard/property/Geo;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v1

    if-nez v1, :cond_a

    .line 169
    const-string v1, ""

    .line 180
    :goto_9
    return-object v1

    .line 172
    :cond_a
    sget-object v1, Lezvcard/io/scribe/GeoScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_44

    .line 180
    const/4 v1, 0x0

    goto :goto_9

    .line 175
    :pswitch_17
    new-instance v0, Lezvcard/util/VCardFloatFormatter;

    invoke-direct {v0, v3}, Lezvcard/util/VCardFloatFormatter;-><init>(I)V

    .line 176
    .local v0, "formatter":Lezvcard/util/VCardFloatFormatter;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lezvcard/property/Geo;->getLatitude()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v0, v3}, Lezvcard/util/VCardFloatFormatter;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lezvcard/property/Geo;->getLongitude()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v0, v3}, Lezvcard/util/VCardFloatFormatter;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lezvcard/io/scribe/GeoScribe;->structured([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 178
    .end local v0    # "formatter":Lezvcard/util/VCardFloatFormatter;
    :pswitch_3a
    invoke-virtual {p1}, Lezvcard/property/Geo;->getGeoUri()Lezvcard/util/GeoUri;

    move-result-object v1

    invoke-virtual {v1, v3}, Lezvcard/util/GeoUri;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 172
    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_17
        :pswitch_17
        :pswitch_3a
    .end packed-switch
.end method


# virtual methods
.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 5
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    const/4 v0, 0x0

    .line 52
    sget-object v1, Lezvcard/io/scribe/GeoScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p1}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_10

    .line 59
    :goto_c
    :pswitch_c
    return-object v0

    .line 57
    :pswitch_d
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    goto :goto_c

    .line 52
    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_c
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Geo;
    .registers 12
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lezvcard/property/Geo;"
        }
    .end annotation

    .prologue
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 90
    const-string v5, "latitude"

    invoke-virtual {p1, v5}, Lezvcard/io/html/HCardElement;->firstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 91
    .local v2, "latitudeStr":Ljava/lang/String;
    if-nez v2, :cond_13

    .line 92
    new-instance v5, Lezvcard/io/CannotParseException;

    const/4 v6, 0x7

    new-array v7, v8, [Ljava/lang/Object;

    invoke-direct {v5, v6, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v5

    .line 97
    :cond_13
    :try_start_13
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_1a
    .catch Ljava/lang/NumberFormatException; {:try_start_13 .. :try_end_1a} :catch_2d

    move-result-object v1

    .line 102
    .local v1, "latitude":Ljava/lang/Double;
    const-string v5, "longitude"

    invoke-virtual {p1, v5}, Lezvcard/io/html/HCardElement;->firstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "longitudeStr":Ljava/lang/String;
    if-nez v4, :cond_3a

    .line 104
    new-instance v5, Lezvcard/io/CannotParseException;

    const/16 v6, 0x9

    new-array v7, v8, [Ljava/lang/Object;

    invoke-direct {v5, v6, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v5

    .line 98
    .end local v1    # "latitude":Ljava/lang/Double;
    .end local v4    # "longitudeStr":Ljava/lang/String;
    :catch_2d
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lezvcard/io/CannotParseException;

    const/16 v6, 0x8

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v2, v7, v8

    invoke-direct {v5, v6, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v5

    .line 109
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "latitude":Ljava/lang/Double;
    .restart local v4    # "longitudeStr":Ljava/lang/String;
    :cond_3a
    :try_start_3a
    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_41
    .catch Ljava/lang/NumberFormatException; {:try_start_3a .. :try_end_41} :catch_48

    move-result-object v3

    .line 114
    .local v3, "longitude":Ljava/lang/Double;
    new-instance v5, Lezvcard/property/Geo;

    invoke-direct {v5, v1, v3}, Lezvcard/property/Geo;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    return-object v5

    .line 110
    .end local v3    # "longitude":Ljava/lang/Double;
    :catch_48
    move-exception v0

    .line 111
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lezvcard/io/CannotParseException;

    const/16 v6, 0xa

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v8

    invoke-direct {v5, v6, v7}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v5
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/GeoScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v0

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;
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
            "Lezvcard/property/Geo;"
        }
    .end annotation

    .prologue
    .line 124
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, v0, v1, p4}, Lezvcard/io/scribe/GeoScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/GeoScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;
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
            "Lezvcard/property/Geo;"
        }
    .end annotation

    .prologue
    .line 69
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/GeoScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 70
    invoke-direct {p0, p1, p3, p5}, Lezvcard/io/scribe/GeoScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Geo;

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
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/GeoScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;
    .registers 9
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
            "Lezvcard/property/Geo;"
        }
    .end annotation

    .prologue
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 80
    new-array v1, v4, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_17

    .line 82
    invoke-virtual {p1}, Lezvcard/io/xml/XCardElement;->version()Lezvcard/VCardVersion;

    move-result-object v1

    invoke-direct {p0, v0, v1, p3}, Lezvcard/io/scribe/GeoScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v1

    return-object v1

    .line 85
    :cond_17
    new-array v1, v4, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    aput-object v2, v1, v3

    invoke-static {v1}, Lezvcard/io/scribe/GeoScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v1

    throw v1
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/GeoScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Geo;

    move-result-object v0

    return-object v0
.end method

.method protected _writeJson(Lezvcard/property/Geo;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "property"    # Lezvcard/property/Geo;

    .prologue
    .line 119
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, p1, v0}, Lezvcard/io/scribe/GeoScribe;->write(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Geo;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/GeoScribe;->_writeJson(Lezvcard/property/Geo;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "property"    # Lezvcard/property/Geo;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/GeoScribe;->write(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Geo;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/GeoScribe;->_writeText(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/Geo;Lezvcard/io/xml/XCardElement;)V
    .registers 5
    .param p1, "property"    # Lezvcard/property/Geo;
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 75
    sget-object v0, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p2}, Lezvcard/io/xml/XCardElement;->version()Lezvcard/VCardVersion;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lezvcard/io/scribe/GeoScribe;->write(Lezvcard/property/Geo;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 76
    return-void
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 45
    check-cast p1, Lezvcard/property/Geo;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/GeoScribe;->_writeXml(Lezvcard/property/Geo;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method
