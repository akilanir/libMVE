.class public abstract Lezvcard/io/scribe/DateOrTimePropertyScribe;
.super Lezvcard/io/scribe/VCardPropertyScribe;
.source "DateOrTimePropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/scribe/DateOrTimePropertyScribe$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/property/DateOrTimeProperty;",
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
    .line 49
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lezvcard/io/scribe/VCardPropertyScribe;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method private parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;
    .registers 10
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 219
    :try_start_1
    const-string v3, "T"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 220
    .local v2, "hasTime":Z
    invoke-static {p1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Ljava/util/Date;Z)Lezvcard/property/DateOrTimeProperty;
    :try_end_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_e} :catch_10

    move-result-object v3

    .line 230
    .end local v2    # "hasTime":Z
    :goto_f
    return-object v3

    .line 221
    :catch_10
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-eq p2, v3, :cond_19

    sget-object v3, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne p2, v3, :cond_22

    .line 223
    :cond_19
    new-instance v3, Lezvcard/io/CannotParseException;

    const/4 v4, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    invoke-direct {v3, v4, v5}, Lezvcard/io/CannotParseException;-><init>(I[Ljava/lang/Object;)V

    throw v3

    .line 227
    :cond_22
    :try_start_22
    new-instance v3, Lezvcard/util/PartialDate;

    invoke-direct {v3, p1}, Lezvcard/util/PartialDate;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Lezvcard/util/PartialDate;)Lezvcard/property/DateOrTimeProperty;
    :try_end_2a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_2a} :catch_2c

    move-result-object v3

    goto :goto_f

    .line 228
    :catch_2c
    move-exception v1

    .line 229
    .local v1, "e2":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    const/4 v4, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Ljava/lang/String;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v3

    goto :goto_f
.end method


# virtual methods
.method protected _dataType(Lezvcard/property/DateOrTimeProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 6
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
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/DateOrTimeProperty;, "TT;"
    const/4 v0, 0x0

    .line 66
    sget-object v1, Lezvcard/io/scribe/DateOrTimePropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p2}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_32

    .line 79
    :goto_c
    :pswitch_c
    return-object v0

    .line 71
    :pswitch_d
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 72
    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    goto :goto_c

    .line 74
    :cond_16
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getDate()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_22

    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getPartialDate()Lezvcard/util/PartialDate;

    move-result-object v0

    if-eqz v0, :cond_2e

    .line 75
    :cond_22
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->hasTime()Z

    move-result v0

    if-eqz v0, :cond_2b

    sget-object v0, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    goto :goto_c

    :cond_2b
    sget-object v0, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    goto :goto_c

    .line 77
    :cond_2e
    sget-object v0, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    goto :goto_c

    .line 66
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_c
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method protected bridge synthetic _dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/DateOrTimeProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_dataType(Lezvcard/property/DateOrTimeProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v0

    return-object v0
.end method

.method protected _defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;
    .registers 5
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    const/4 v0, 0x0

    .line 54
    sget-object v1, Lezvcard/io/scribe/DateOrTimePropertyScribe$1;->$SwitchMap$ezvcard$VCardVersion:[I

    invoke-virtual {p1}, Lezvcard/VCardVersion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_10

    .line 61
    :goto_c
    :pswitch_c
    return-object v0

    .line 59
    :pswitch_d
    sget-object v0, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    goto :goto_c

    .line 54
    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_c
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method protected _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;
    .registers 7
    .param p1, "element"    # Lezvcard/io/html/HCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/html/HCardElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 172
    .local v1, "value":Ljava/lang/String;
    const-string v2, "time"

    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->tagName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 173
    const-string v2, "datetime"

    invoke-virtual {p1, v2}, Lezvcard/io/html/HCardElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "datetime":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1a

    .line 175
    move-object v1, v0

    .line 178
    .end local v0    # "datetime":Ljava/lang/String;
    :cond_1a
    if-nez v1, :cond_20

    .line 179
    invoke-virtual {p1}, Lezvcard/io/html/HCardElement;->value()Ljava/lang/String;

    move-result-object v1

    .line 181
    :cond_20
    sget-object v2, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-direct {p0, v1, v2, p2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v2

    return-object v2
.end method

.method protected bridge synthetic _parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 4
    .param p1, "x0"    # Lezvcard/io/html/HCardElement;
    .param p2, "x1"    # Ljava/util/List;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_parseHtml(Lezvcard/io/html/HCardElement;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 209
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p4, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "valueStr":Ljava/lang/String;
    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    if-ne p2, v1, :cond_d

    .line 211
    invoke-virtual {p0, v0}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Ljava/lang/String;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v1

    .line 214
    :goto_c
    return-object v1

    :cond_d
    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, v0, v1, p4}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v1

    goto :goto_c
.end method

.method protected bridge synthetic _parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 6
    .param p1, "x0"    # Lezvcard/io/json/JCardValue;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/parameter/VCardParameters;
    .param p4, "x3"    # Ljava/util/List;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p5, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 108
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p3, v0, :cond_11

    sget-object v0, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    if-ne p2, v0, :cond_11

    .line 109
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Ljava/lang/String;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    .line 112
    :goto_10
    return-object v0

    :cond_11
    invoke-direct {p0, p1, p3, p5}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    goto :goto_10
.end method

.method protected bridge synthetic _parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 7
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/VCardDataType;
    .param p3, "x2"    # Lezvcard/VCardVersion;
    .param p4, "x3"    # Lezvcard/parameter/VCardParameters;
    .param p5, "x4"    # Ljava/util/List;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    invoke-virtual/range {p0 .. p5}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p3, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 156
    new-array v1, v6, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    aput-object v2, v1, v3

    sget-object v2, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    aput-object v2, v1, v4

    sget-object v2, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    aput-object v2, v1, v5

    invoke-virtual {p1, v1}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_21

    .line 158
    invoke-virtual {p1}, Lezvcard/io/xml/XCardElement;->version()Lezvcard/VCardVersion;

    move-result-object v1

    invoke-direct {p0, v0, v1, p3}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->parse(Ljava/lang/String;Lezvcard/VCardVersion;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v1

    .line 163
    :goto_20
    return-object v1

    .line 161
    :cond_21
    new-array v1, v4, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Lezvcard/io/xml/XCardElement;->first([Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v0

    .line 162
    if-eqz v0, :cond_32

    .line 163
    invoke-virtual {p0, v0}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->newInstance(Ljava/lang/String;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v1

    goto :goto_20

    .line 166
    :cond_32
    const/4 v1, 0x4

    new-array v1, v1, [Lezvcard/VCardDataType;

    sget-object v2, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    aput-object v2, v1, v3

    sget-object v2, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    aput-object v2, v1, v4

    sget-object v2, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    aput-object v2, v1, v5

    sget-object v2, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    aput-object v2, v1, v6

    invoke-static {v1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->missingXmlElements([Lezvcard/VCardDataType;)Lezvcard/io/CannotParseException;

    move-result-object v1

    throw v1
.end method

.method protected bridge synthetic _parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/VCardProperty;
    .registers 5
    .param p1, "x0"    # Lezvcard/io/xml/XCardElement;
    .param p2, "x1"    # Lezvcard/parameter/VCardParameters;
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_parseXml(Lezvcard/io/xml/XCardElement;Lezvcard/parameter/VCardParameters;Ljava/util/List;)Lezvcard/property/DateOrTimeProperty;

    move-result-object v0

    return-object v0
.end method

.method protected _writeJson(Lezvcard/property/DateOrTimeProperty;)Lezvcard/io/json/JCardValue;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lezvcard/io/json/JCardValue;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/DateOrTimeProperty;, "TT;"
    const/4 v6, 0x1

    .line 186
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 187
    .local v0, "date":Ljava/util/Date;
    if-eqz v0, :cond_25

    .line 188
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->hasTime()Z

    move-result v1

    .line 189
    .local v1, "hasTime":Z
    invoke-static {v0}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->date(Ljava/util/Date;)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {v5, v1}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->time(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {v5, v6}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {v5}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->write()Ljava/lang/String;

    move-result-object v4

    .line 190
    .local v4, "value":Ljava/lang/String;
    invoke-static {v4}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v5

    .line 204
    .end local v1    # "hasTime":Z
    .end local v4    # "value":Ljava/lang/String;
    :goto_24
    return-object v5

    .line 193
    :cond_25
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getPartialDate()Lezvcard/util/PartialDate;

    move-result-object v2

    .line 194
    .local v2, "partialDate":Lezvcard/util/PartialDate;
    if-eqz v2, :cond_34

    .line 195
    invoke-virtual {v2, v6}, Lezvcard/util/PartialDate;->toDateAndOrTime(Z)Ljava/lang/String;

    move-result-object v4

    .line 196
    .restart local v4    # "value":Ljava/lang/String;
    invoke-static {v4}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v5

    goto :goto_24

    .line 199
    .end local v4    # "value":Ljava/lang/String;
    :cond_34
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getText()Ljava/lang/String;

    move-result-object v3

    .line 200
    .local v3, "text":Ljava/lang/String;
    if-eqz v3, :cond_3f

    .line 201
    invoke-static {v3}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v5

    goto :goto_24

    .line 204
    :cond_3f
    const-string v5, ""

    invoke-static {v5}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v5

    goto :goto_24
.end method

.method protected bridge synthetic _writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/DateOrTimeProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_writeJson(Lezvcard/property/DateOrTimeProperty;)Lezvcard/io/json/JCardValue;

    move-result-object v0

    return-object v0
.end method

.method protected _writeText(Lezvcard/property/DateOrTimeProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 10
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
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/DateOrTimeProperty;, "TT;"
    const/4 v4, 0x0

    .line 84
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 85
    .local v0, "date":Ljava/util/Date;
    if-eqz v0, :cond_27

    .line 86
    sget-object v5, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne p2, v5, :cond_25

    const/4 v1, 0x1

    .line 87
    .local v1, "extended":Z
    :goto_c
    invoke-static {v0}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->date(Ljava/util/Date;)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->hasTime()Z

    move-result v6

    invoke-virtual {v5, v6}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->time(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {v5, v1}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v5

    invoke-virtual {v5, v4}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v4

    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->write()Ljava/lang/String;

    move-result-object v4

    .line 102
    .end local v1    # "extended":Z
    :goto_24
    return-object v4

    :cond_25
    move v1, v4

    .line 86
    goto :goto_c

    .line 90
    :cond_27
    sget-object v5, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p2, v5, :cond_41

    .line 91
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getText()Ljava/lang/String;

    move-result-object v3

    .line 92
    .local v3, "text":Ljava/lang/String;
    if-eqz v3, :cond_36

    .line 93
    invoke-static {v3}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_24

    .line 96
    :cond_36
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getPartialDate()Lezvcard/util/PartialDate;

    move-result-object v2

    .line 97
    .local v2, "partialDate":Lezvcard/util/PartialDate;
    if-eqz v2, :cond_41

    .line 98
    invoke-virtual {v2, v4}, Lezvcard/util/PartialDate;->toDateAndOrTime(Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_24

    .line 102
    .end local v2    # "partialDate":Lezvcard/util/PartialDate;
    .end local v3    # "text":Ljava/lang/String;
    :cond_41
    const-string v4, ""

    goto :goto_24
.end method

.method protected bridge synthetic _writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    .registers 4
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/VCardVersion;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/DateOrTimeProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_writeText(Lezvcard/property/DateOrTimeProperty;Lezvcard/VCardVersion;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _writeXml(Lezvcard/property/DateOrTimeProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 11
    .param p2, "parent"    # Lezvcard/io/xml/XCardElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lezvcard/io/xml/XCardElement;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    .local p1, "property":Lezvcard/property/DateOrTimeProperty;, "TT;"
    const/4 v7, 0x0

    .line 117
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getDate()Ljava/util/Date;

    move-result-object v1

    .line 118
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_2a

    .line 119
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->hasTime()Z

    move-result v2

    .line 120
    .local v2, "hasTime":Z
    invoke-static {v1}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->date(Ljava/util/Date;)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v6

    invoke-virtual {v6, v2}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->time(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v6

    invoke-virtual {v6, v7}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v6

    invoke-virtual {v6, v7}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;

    move-result-object v6

    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->write()Ljava/lang/String;

    move-result-object v5

    .line 122
    .local v5, "value":Ljava/lang/String;
    if-eqz v2, :cond_27

    sget-object v0, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    .line 124
    .local v0, "dataType":Lezvcard/VCardDataType;
    :goto_23
    invoke-virtual {p2, v0, v5}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 152
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    .end local v2    # "hasTime":Z
    .end local v5    # "value":Ljava/lang/String;
    :goto_26
    return-void

    .line 122
    .restart local v2    # "hasTime":Z
    .restart local v5    # "value":Ljava/lang/String;
    :cond_27
    sget-object v0, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    goto :goto_23

    .line 128
    .end local v2    # "hasTime":Z
    .end local v5    # "value":Ljava/lang/String;
    :cond_2a
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getPartialDate()Lezvcard/util/PartialDate;

    move-result-object v3

    .line 129
    .local v3, "partialDate":Lezvcard/util/PartialDate;
    if-eqz v3, :cond_5b

    .line 131
    invoke-virtual {v3}, Lezvcard/util/PartialDate;->hasTimeComponent()Z

    move-result v6

    if-eqz v6, :cond_46

    invoke-virtual {v3}, Lezvcard/util/PartialDate;->hasDateComponent()Z

    move-result v6

    if-eqz v6, :cond_46

    .line 132
    sget-object v0, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    .line 141
    .restart local v0    # "dataType":Lezvcard/VCardDataType;
    :goto_3e
    invoke-virtual {v3, v7}, Lezvcard/util/PartialDate;->toDateAndOrTime(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v0, v6}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_26

    .line 133
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    :cond_46
    invoke-virtual {v3}, Lezvcard/util/PartialDate;->hasTimeComponent()Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 134
    sget-object v0, Lezvcard/VCardDataType;->TIME:Lezvcard/VCardDataType;

    .restart local v0    # "dataType":Lezvcard/VCardDataType;
    goto :goto_3e

    .line 135
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    :cond_4f
    invoke-virtual {v3}, Lezvcard/util/PartialDate;->hasDateComponent()Z

    move-result v6

    if-eqz v6, :cond_58

    .line 136
    sget-object v0, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    .restart local v0    # "dataType":Lezvcard/VCardDataType;
    goto :goto_3e

    .line 138
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    :cond_58
    sget-object v0, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    .restart local v0    # "dataType":Lezvcard/VCardDataType;
    goto :goto_3e

    .line 145
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    :cond_5b
    invoke-virtual {p1}, Lezvcard/property/DateOrTimeProperty;->getText()Ljava/lang/String;

    move-result-object v4

    .line 146
    .local v4, "text":Ljava/lang/String;
    if-eqz v4, :cond_67

    .line 147
    sget-object v6, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p2, v6, v4}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_26

    .line 151
    :cond_67
    sget-object v6, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    const-string v7, ""

    invoke-virtual {p2, v6, v7}, Lezvcard/io/xml/XCardElement;->append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_26
.end method

.method protected bridge synthetic _writeXml(Lezvcard/property/VCardProperty;Lezvcard/io/xml/XCardElement;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/property/VCardProperty;
    .param p2, "x1"    # Lezvcard/io/xml/XCardElement;

    .prologue
    .line 47
    .local p0, "this":Lezvcard/io/scribe/DateOrTimePropertyScribe;, "Lezvcard/io/scribe/DateOrTimePropertyScribe<TT;>;"
    check-cast p1, Lezvcard/property/DateOrTimeProperty;

    .end local p1    # "x0":Lezvcard/property/VCardProperty;
    invoke-virtual {p0, p1, p2}, Lezvcard/io/scribe/DateOrTimePropertyScribe;->_writeXml(Lezvcard/property/DateOrTimeProperty;Lezvcard/io/xml/XCardElement;)V

    return-void
.end method

.method protected abstract newInstance(Lezvcard/util/PartialDate;)Lezvcard/property/DateOrTimeProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/util/PartialDate;",
            ")TT;"
        }
    .end annotation
.end method

.method protected abstract newInstance(Ljava/lang/String;)Lezvcard/property/DateOrTimeProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method protected abstract newInstance(Ljava/util/Date;Z)Lezvcard/property/DateOrTimeProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "Z)TT;"
        }
    .end annotation
.end method
