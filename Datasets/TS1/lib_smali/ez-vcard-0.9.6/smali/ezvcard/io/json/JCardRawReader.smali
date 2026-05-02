.class public Lezvcard/io/json/JCardRawReader;
.super Ljava/lang/Object;
.source "JCardRawReader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/json/JCardRawReader$1;,
        Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;
    }
.end annotation


# instance fields
.field private eof:Z

.field private listener:Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;

.field private parser:Lcom/fasterxml/jackson/core/JsonParser;

.field private final reader:Ljava/io/Reader;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/json/JCardRawReader;->eof:Z

    .line 60
    iput-object p1, p0, Lezvcard/io/json/JCardRawReader;->reader:Ljava/io/Reader;

    .line 61
    return-void
.end method

.method private check(Lcom/fasterxml/jackson/core/JsonToken;Lcom/fasterxml/jackson/core/JsonToken;)V
    .registers 4
    .param p1, "expected"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p2, "actual"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/io/json/JCardParseException;
        }
    .end annotation

    .prologue
    .line 237
    if-eq p2, p1, :cond_8

    .line 238
    new-instance v0, Lezvcard/io/json/JCardParseException;

    invoke-direct {v0, p1, p2}, Lezvcard/io/json/JCardParseException;-><init>(Lcom/fasterxml/jackson/core/JsonToken;Lcom/fasterxml/jackson/core/JsonToken;)V

    throw v0

    .line 240
    :cond_8
    return-void
.end method

.method private checkCurrent(Lcom/fasterxml/jackson/core/JsonToken;)V
    .registers 4
    .param p1, "expected"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/io/json/JCardParseException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v1, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 233
    .local v0, "actual":Lcom/fasterxml/jackson/core/JsonToken;
    invoke-direct {p0, p1, v0}, Lezvcard/io/json/JCardRawReader;->check(Lcom/fasterxml/jackson/core/JsonToken;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 234
    return-void
.end method

.method private checkNext(Lcom/fasterxml/jackson/core/JsonToken;)V
    .registers 4
    .param p1, "expected"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    iget-object v1, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 228
    .local v0, "actual":Lcom/fasterxml/jackson/core/JsonToken;
    invoke-direct {p0, p1, v0}, Lezvcard/io/json/JCardRawReader;->check(Lcom/fasterxml/jackson/core/JsonToken;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 229
    return-void
.end method

.method private parseParameters()Lezvcard/parameter/VCardParameters;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v2}, Lezvcard/io/json/JCardRawReader;->checkNext(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 147
    new-instance v1, Lezvcard/parameter/VCardParameters;

    invoke-direct {v1}, Lezvcard/parameter/VCardParameters;-><init>()V

    .line 148
    .local v1, "parameters":Lezvcard/parameter/VCardParameters;
    :cond_a
    :goto_a
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_42

    .line 149
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "parameterName":Ljava/lang/String;
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_38

    .line 153
    :goto_24
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_a

    .line 154
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24

    .line 157
    :cond_38
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_a

    .line 161
    .end local v0    # "parameterName":Ljava/lang/String;
    :cond_42
    return-object v1
.end method

.method private parseProperties()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawReader;->checkNext(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 113
    :goto_5
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_1d

    .line 114
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawReader;->checkCurrent(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 115
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 116
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseProperty()V

    goto :goto_5

    .line 118
    :cond_1d
    return-void
.end method

.method private parseProperty()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 122
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawReader;->checkCurrent(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 123
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "propertyName":Ljava/lang/String;
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseParameters()Lezvcard/parameter/VCardParameters;

    move-result-object v3

    .line 129
    .local v3, "parameters":Lezvcard/parameter/VCardParameters;
    const-string v0, "group"

    invoke-virtual {v3, v0}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 130
    .local v7, "removed":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_48

    move-object v1, v9

    .line 133
    .local v1, "group":Ljava/lang/String;
    :goto_21
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawReader;->checkNext(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 134
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "dataTypeStr":Ljava/lang/String;
    const-string v0, "unknown"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    move-object v4, v9

    .line 138
    .local v4, "dataType":Lezvcard/VCardDataType;
    :goto_39
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValues()Ljava/util/List;

    move-result-object v8

    .line 140
    .local v8, "values":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    new-instance v5, Lezvcard/io/json/JCardValue;

    invoke-direct {v5, v8}, Lezvcard/io/json/JCardValue;-><init>(Ljava/util/List;)V

    .line 141
    .local v5, "value":Lezvcard/io/json/JCardValue;
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->listener:Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;

    invoke-interface/range {v0 .. v5}, Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;->readProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V

    .line 142
    return-void

    .line 130
    .end local v1    # "group":Ljava/lang/String;
    .end local v4    # "dataType":Lezvcard/VCardDataType;
    .end local v5    # "value":Lezvcard/io/json/JCardValue;
    .end local v6    # "dataTypeStr":Ljava/lang/String;
    .end local v8    # "values":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    :cond_48
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    goto :goto_21

    .line 135
    .restart local v1    # "group":Ljava/lang/String;
    .restart local v6    # "dataTypeStr":Ljava/lang/String;
    :cond_51
    invoke-static {v6}, Lezvcard/VCardDataType;->get(Ljava/lang/String;)Lezvcard/VCardDataType;

    move-result-object v4

    goto :goto_39
.end method

.method private parseValue()Lezvcard/io/json/JsonValue;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    sget-object v0, Lezvcard/io/json/JCardRawReader$1;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    iget-object v1, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_30

    .line 222
    new-instance v0, Lezvcard/io/json/JsonValue;

    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValueElement()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/io/json/JsonValue;-><init>(Ljava/lang/Object;)V

    :goto_1a
    return-object v0

    .line 218
    :pswitch_1b
    new-instance v0, Lezvcard/io/json/JsonValue;

    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValueArray()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/io/json/JsonValue;-><init>(Ljava/util/List;)V

    goto :goto_1a

    .line 220
    :pswitch_25
    new-instance v0, Lezvcard/io/json/JsonValue;

    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValueObject()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/io/json/JsonValue;-><init>(Ljava/util/Map;)V

    goto :goto_1a

    .line 216
    nop

    :pswitch_data_30
    .packed-switch 0x6
        :pswitch_1b
        :pswitch_25
    .end packed-switch
.end method

.method private parseValueArray()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/io/json/JsonValue;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    :goto_5
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_17

    .line 193
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValue()Lezvcard/io/json/JsonValue;

    move-result-object v1

    .line 194
    .local v1, "value":Lezvcard/io/json/JsonValue;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 197
    .end local v1    # "value":Lezvcard/io/json/JsonValue;
    :cond_17
    return-object v0
.end method

.method private parseValueElement()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    sget-object v0, Lezvcard/io/json/JCardRawReader$1;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    iget-object v1, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3c

    .line 185
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    :goto_17
    return-object v0

    .line 177
    :pswitch_18
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_17

    .line 179
    :pswitch_23
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getDoubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_17

    .line 181
    :pswitch_2e
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_17

    .line 183
    :pswitch_39
    const/4 v0, 0x0

    goto :goto_17

    .line 174
    nop

    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_18
        :pswitch_18
        :pswitch_23
        :pswitch_2e
        :pswitch_39
    .end packed-switch
.end method

.method private parseValueObject()Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lezvcard/io/json/JsonValue;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 203
    .local v1, "object":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lezvcard/io/json/JsonValue;>;"
    :goto_5
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v3, v4, :cond_27

    .line 204
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-direct {p0, v3}, Lezvcard/io/json/JCardRawReader;->checkCurrent(Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 206
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 208
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValue()Lezvcard/io/json/JsonValue;

    move-result-object v2

    .line 209
    .local v2, "value":Lezvcard/io/json/JsonValue;
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 212
    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "value":Lezvcard/io/json/JsonValue;
    :cond_27
    return-object v1
.end method

.method private parseValues()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/io/json/JsonValue;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 166
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    :goto_5
    iget-object v2, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_17

    .line 167
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseValue()Lezvcard/io/json/JsonValue;

    move-result-object v0

    .line 168
    .local v0, "value":Lezvcard/io/json/JsonValue;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 170
    .end local v0    # "value":Lezvcard/io/json/JsonValue;
    :cond_17
    return-object v1
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 275
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 276
    return-void
.end method

.method public eof()Z
    .registers 2

    .prologue
    .line 247
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawReader;->eof:Z

    return v0
.end method

.method public getLineNum()I
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonLocation;->getLineNr()I

    move-result v0

    goto :goto_5
.end method

.method public readNext(Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;)V
    .registers 7
    .param p1, "listener"    # Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    if-nez v3, :cond_38

    .line 81
    new-instance v1, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v1}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    .line 82
    .local v1, "factory":Lcom/fasterxml/jackson/core/JsonFactory;
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->reader:Ljava/io/Reader;

    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/io/Reader;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v3

    iput-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    .line 87
    .end local v1    # "factory":Lcom/fasterxml/jackson/core/JsonFactory;
    :cond_11
    iput-object p1, p0, Lezvcard/io/json/JCardRawReader;->listener:Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;

    .line 90
    const/4 v2, 0x0

    .line 92
    .local v2, "prev":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_14
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .local v0, "cur":Lcom/fasterxml/jackson/core/JsonToken;
    if-eqz v0, :cond_32

    .line 93
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_41

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v3, :cond_41

    const-string v3, "vcard"

    iget-object v4, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_41

    .line 98
    :cond_32
    if-nez v0, :cond_43

    .line 100
    const/4 v3, 0x1

    iput-boolean v3, p0, Lezvcard/io/json/JCardRawReader;->eof:Z

    .line 106
    .end local v0    # "cur":Lcom/fasterxml/jackson/core/JsonToken;
    .end local v2    # "prev":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_37
    return-void

    .line 83
    :cond_38
    iget-object v3, p0, Lezvcard/io/json/JCardRawReader;->parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_11

    goto :goto_37

    .line 96
    .restart local v0    # "cur":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v2    # "prev":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_41
    move-object v2, v0

    goto :goto_14

    .line 104
    :cond_43
    invoke-interface {p1}, Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;->beginVCard()V

    .line 105
    invoke-direct {p0}, Lezvcard/io/json/JCardRawReader;->parseProperties()V

    goto :goto_37
.end method
