.class public Lezvcard/io/scribe/GenderScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "GenderScribe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/io/scribe/VCardPropertyScribe",
        "<",
        "Lezvcard/property/Gender;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 43
    const-class v0, Lezvcard/property/Gender;

    const-string v1, "GENDER"

    invoke-direct {p0, v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 44
    return-void
.end method


# virtual methods
.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 3
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 48
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;
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
            ">;)",
            "Lezvcard/property/Gender;"
        }
    .end annotation

    .prologue
    .line 119
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/GenderScribe;->structured(Lezvcard/io/json/JCardValue;)Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;

    move-result-object v0

    .line 121
    .local v0, "it":Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;
    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->nextString()Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "sex":Ljava/lang/String;
    if-eqz v2, :cond_e

    .line 123
    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    .line 125
    :cond_e
    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->nextString()Ljava/lang/String;

    move-result-object v3

    .line 127
    .local v3, "text":Ljava/lang/String;
    new-instance v1, Lezvcard/property/Gender;

    invoke-direct {v1, v2}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    .line 128
    .local v1, "property":Lezvcard/property/Gender;
    invoke-virtual {v1, v3}, Lezvcard/property/Gender;->setText(Ljava/lang/String;)V

    .line 129
    return-object v1
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/GenderScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;
    .registers 11
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
            "Lezvcard/property/Gender;"
        }
    .end annotation

    .prologue
    .line 67
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x2

    invoke-static {p1, v4}, Lezvcard/io/scribe/GenderScribe;->semistructured(Ljava/lang/String;I)Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;

    move-result-object v0

    .line 69
    .local v0, "it":Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;
    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->next()Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "sex":Ljava/lang/String;
    if-eqz v2, :cond_12

    .line 71
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1f

    .line 72
    const/4 v2, 0x0

    .line 77
    :cond_12
    :goto_12
    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->next()Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "text":Ljava/lang/String;
    new-instance v1, Lezvcard/property/Gender;

    invoke-direct {v1, v2}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    .line 80
    .local v1, "property":Lezvcard/property/Gender;
    invoke-virtual {v1, v3}, Lezvcard/property/Gender;->setText(Ljava/lang/String;)V

    .line 81
    return-object v1

    .line 74
    .end local v1    # "property":Lezvcard/property/Gender;
    .end local v3    # "text":Ljava/lang/String;
    :cond_1f
    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_12
.end method

.method protected bridge synthetic _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 7
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/parameter/VCardParameters;
    .param p5, "x4"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/GenderScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;
    .registers 10
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
            "Lezvcard/property/Gender;"
        }
    .end annotation

    .prologue
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 96
    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "sex"

    aput-object v3, v2, v4

    invoke-virtual {p1, v2}, Lezvcard/io/xml/XCardElement;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "sex":Ljava/lang/String;
    if-eqz v1, :cond_21

    .line 98
    new-instance v0, Lezvcard/property/Gender;

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    .line 99
    .local v0, "property":Lezvcard/property/Gender;
    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "identity"

    aput-object v3, v2, v4

    invoke-virtual {p1, v2}, Lezvcard/io/xml/XCardElement;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lezvcard/property/Gender;->setText(Ljava/lang/String;)V

    .line 100
    return-object v0

    .line 103
    .end local v0    # "property":Lezvcard/property/Gender;
    :cond_21
    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "sex"

    aput-object v3, v2, v4

    invoke-static {v2}, Lezvcard/io/scribe/GenderScribe;->missingXmlElements([Ljava/lang/String;)Lezvcard/io/CannotParseException;

    move-result-object v2

    throw v2
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/GenderScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/Gender;

    move-result-object v0

    return-object v0
.end method

.method protected _writeJson(Lezvcard/property/Gender;)Lezvcard/io/json/JCardValue;
    .registers 6
    .param p1, "property"    # Lezvcard/property/Gender;

    .prologue
    .line 108
    invoke-virtual {p1}, Lezvcard/property/Gender;->getGender()Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "gender":Ljava/lang/String;
    invoke-virtual {p1}, Lezvcard/property/Gender;->getText()Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "text":Ljava/lang/String;
    if-nez v1, :cond_f

    .line 112
    invoke-static {v0}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    .line 114
    :goto_e
    return-object v2

    :cond_f
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-static {v2}, Lezvcard/io/json/JCardValue;->structured([Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v2

    goto :goto_e
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 41
    check-cast p1, Lezvcard/property/Gender;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/GenderScribe;->_writeJson(Lezvcard/property/Gender;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/Gender;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 8
    .param p1, "property"    # Lezvcard/property/Gender;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 53
    invoke-virtual {p1}, Lezvcard/property/Gender;->getGender()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "gender":Ljava/lang/String;
    invoke-virtual {p1}, Lezvcard/property/Gender;->getText()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_18

    .line 57
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    aput-object v1, v2, v4

    invoke-static {v2}, Lezvcard/io/scribe/GenderScribe;->structured([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 62
    :goto_17
    return-object v2

    .line 59
    :cond_18
    if-eqz v0, :cond_23

    .line 60
    new-array v2, v4, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v2}, Lezvcard/io/scribe/GenderScribe;->structured([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_17

    .line 62
    :cond_23
    const-string v2, ""

    goto :goto_17
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 41
    check-cast p1, Lezvcard/property/Gender;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/GenderScribe;->_writeText(Lezvcard/property/Gender;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/Gender;Lezvcard/io/xml/XCardElement;)V
    .registers 6
    .param p1, "property"    # Lezvcard/property/Gender;
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 86
    const-string v1, "sex"

    invoke-virtual {p1}, Lezvcard/property/Gender;->getGender()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lezvcard/io/xml/XCardElement;->append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 88
    invoke-virtual {p1}, Lezvcard/property/Gender;->getText()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "text":Ljava/lang/String;
    if-eqz v0, :cond_14

    .line 90
    const-string v1, "identity"

    invoke-virtual {p2, v1, v0}, Lezvcard/io/xml/XCardElement;->append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 92
    :cond_14
    return-void
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 41
    check-cast p1, Lezvcard/property/Gender;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/GenderScribe;->_writeXml(Lezvcard/property/Gender;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method
