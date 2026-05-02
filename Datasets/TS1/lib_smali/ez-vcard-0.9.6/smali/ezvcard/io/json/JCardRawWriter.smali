.class public Lezvcard/io/json/JCardRawWriter;
.super Ljava/lang/Object;
.source "JCardRawWriter.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# instance fields
.field private generator:Lcom/fasterxml/jackson/core/JsonGenerator;

.field private indent:Z

.field private open:Z

.field private final wrapInArray:Z

.field private final writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;Z)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "wrapInArray"    # Z

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->indent:Z

    .line 54
    iput-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    .line 63
    iput-object p1, p0, Lezvcard/io/json/JCardRawWriter;->writer:Ljava/io/Writer;

    .line 64
    iput-boolean p2, p0, Lezvcard/io/json/JCardRawWriter;->wrapInArray:Z

    .line 65
    return-void
.end method

.method private indent(I)V
    .registers 5
    .param p1, "spaces"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    iget-boolean v1, p0, Lezvcard/io/json/JCardRawWriter;->indent:Z

    if-nez v1, :cond_5

    .line 264
    :cond_4
    return-void

    .line 260
    :cond_5
    iget-object v1, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    sget-object v2, Lezvcard/util/StringUtils;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 261
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, p1, :cond_4

    .line 262
    iget-object v1, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeRaw(C)V

    .line 261
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method

.method private init()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 314
    new-instance v0, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    .line 315
    .local v0, "factory":Lcom/fasterxml/jackson/core/JsonFactory;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_TARGET:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/JsonFactory;->configure(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;Z)Lcom/fasterxml/jackson/core/JsonFactory;

    .line 316
    iget-object v1, p0, Lezvcard/io/json/JCardRawWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v1

    iput-object v1, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 318
    iget-boolean v1, p0, Lezvcard/io/json/JCardRawWriter;->wrapInArray:Z

    if-eqz v1, :cond_1f

    .line 319
    iget-object v1, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 320
    invoke-direct {p0, v2}, Lezvcard/io/json/JCardRawWriter;->indent(I)V

    .line 322
    :cond_1f
    return-void
.end method

.method private writeValue(Lezvcard/io/json/JsonValue;)V
    .registers 11
    .param p1, "jsonValue"    # Lezvcard/io/json/JsonValue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    invoke-virtual {p1}, Lezvcard/io/json/JsonValue;->isNull()Z

    move-result v6

    if-eqz v6, :cond_c

    .line 201
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 247
    :cond_b
    :goto_b
    return-void

    .line 205
    :cond_c
    invoke-virtual {p1}, Lezvcard/io/json/JsonValue;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 206
    .local v5, "val":Ljava/lang/Object;
    if-eqz v5, :cond_8e

    .line 207
    instance-of v6, v5, Ljava/lang/Byte;

    if-eqz v6, :cond_23

    .line 208
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Byte;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Byte;->byteValue()B

    move-result v7

    int-to-short v7, v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(S)V

    goto :goto_b

    .line 209
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_23
    instance-of v6, v5, Ljava/lang/Short;

    if-eqz v6, :cond_33

    .line 210
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Short;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Short;->shortValue()S

    move-result v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(S)V

    goto :goto_b

    .line 211
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_33
    instance-of v6, v5, Ljava/lang/Integer;

    if-eqz v6, :cond_43

    .line 212
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(I)V

    goto :goto_b

    .line 213
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_43
    instance-of v6, v5, Ljava/lang/Long;

    if-eqz v6, :cond_53

    .line 214
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Long;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(J)V

    goto :goto_b

    .line 215
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_53
    instance-of v6, v5, Ljava/lang/Float;

    if-eqz v6, :cond_63

    .line 216
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Float;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(F)V

    goto :goto_b

    .line 217
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_63
    instance-of v6, v5, Ljava/lang/Double;

    if-eqz v6, :cond_73

    .line 218
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Double;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(D)V

    goto :goto_b

    .line 219
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_73
    instance-of v6, v5, Ljava/lang/Boolean;

    if-eqz v6, :cond_83

    .line 220
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    check-cast v5, Ljava/lang/Boolean;

    .end local v5    # "val":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBoolean(Z)V

    goto :goto_b

    .line 222
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_83
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 227
    :cond_8e
    invoke-virtual {p1}, Lezvcard/io/json/JsonValue;->getArray()Ljava/util/List;

    move-result-object v0

    .line 228
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lezvcard/io/json/JsonValue;>;"
    if-eqz v0, :cond_b4

    .line 229
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 230
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_9d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ad

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/io/json/JsonValue;

    .line 231
    .local v1, "element":Lezvcard/io/json/JsonValue;
    invoke-direct {p0, v1}, Lezvcard/io/json/JCardRawWriter;->writeValue(Lezvcard/io/json/JsonValue;)V

    goto :goto_9d

    .line 233
    .end local v1    # "element":Lezvcard/io/json/JsonValue;
    :cond_ad
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    goto/16 :goto_b

    .line 237
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_b4
    invoke-virtual {p1}, Lezvcard/io/json/JsonValue;->getObject()Ljava/util/Map;

    move-result-object v4

    .line 238
    .local v4, "object":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lezvcard/io/json/JsonValue;>;"
    if-eqz v4, :cond_b

    .line 239
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 240
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_c7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_e8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 241
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lezvcard/io/json/JsonValue;>;"
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 242
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lezvcard/io/json/JsonValue;

    invoke-direct {p0, v6}, Lezvcard/io/json/JCardRawWriter;->writeValue(Lezvcard/io/json/JsonValue;)V

    goto :goto_c7

    .line 244
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lezvcard/io/json/JsonValue;>;"
    :cond_e8
    iget-object v6, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto/16 :goto_b
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
    .line 305
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    if-nez v0, :cond_5

    .line 311
    :goto_4
    return-void

    .line 309
    :cond_5
    invoke-virtual {p0}, Lezvcard/io/json/JCardRawWriter;->closeJsonStream()V

    .line 310
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    goto :goto_4
.end method

.method public closeJsonStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    if-nez v0, :cond_5

    .line 297
    :goto_4
    return-void

    .line 287
    :cond_5
    :goto_5
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    if-eqz v0, :cond_d

    .line 288
    invoke-virtual {p0}, Lezvcard/io/json/JCardRawWriter;->writeEndVCard()V

    goto :goto_5

    .line 291
    :cond_d
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->wrapInArray:Z

    if-eqz v0, :cond_1a

    .line 292
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawWriter;->indent(I)V

    .line 293
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 296
    :cond_1a
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V

    goto :goto_4
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    if-nez v0, :cond_5

    .line 275
    :goto_4
    return-void

    .line 274
    :cond_5
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->flush()V

    goto :goto_4
.end method

.method public isIndent()Z
    .registers 2

    .prologue
    .line 73
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->indent:Z

    return v0
.end method

.method public setIndent(Z)V
    .registers 2
    .param p1, "indent"    # Z

    .prologue
    .line 81
    iput-boolean p1, p0, Lezvcard/io/json/JCardRawWriter;->indent:Z

    .line 82
    return-void
.end method

.method public writeEndVCard()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    if-nez v0, :cond_c

    .line 113
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call \"writeStartVCard\" first."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_c
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 117
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    .line 120
    return-void
.end method

.method public writeProperty(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V
    .registers 10
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;
    .param p3, "value"    # Lezvcard/io/json/JCardValue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    const/4 v1, 0x0

    new-instance v3, Lezvcard/parameter/VCardParameters;

    invoke-direct {v3}, Lezvcard/parameter/VCardParameters;-><init>()V

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lezvcard/io/json/JCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V

    .line 133
    return-void
.end method

.method public writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V
    .registers 15
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p4, "dataType"    # Lezvcard/VCardDataType;
    .param p5, "value"    # Lezvcard/io/json/JCardValue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget-boolean v7, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    if-nez v7, :cond_c

    .line 148
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Call \"writeStartVCard\" first."

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 151
    :cond_c
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 152
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lezvcard/io/json/JCardRawWriter;->indent(I)V

    .line 155
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7, p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 158
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 159
    invoke-virtual {p3}, Lezvcard/parameter/VCardParameters;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_23
    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 160
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 161
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 162
    .local v6, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_23

    .line 166
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_59

    .line 167
    iget-object v8, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v4, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23

    .line 169
    :cond_59
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 170
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_62
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_74

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 171
    .local v5, "paramValue":Ljava/lang/String;
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_62

    .line 173
    .end local v5    # "paramValue":Ljava/lang/String;
    :cond_74
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    goto :goto_23

    .line 178
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7a
    if-eqz p1, :cond_83

    .line 179
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    const-string v8, "group"

    invoke-virtual {v7, v8, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :cond_83
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 185
    iget-object v8, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    if-nez p4, :cond_a8

    const-string v7, "unknown"

    :goto_8e
    invoke-virtual {v8, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 188
    invoke-virtual {p5}, Lezvcard/io/json/JCardValue;->getValues()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_b1

    .line 189
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    const-string v8, ""

    invoke-virtual {v7, v8}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 196
    :cond_a2
    iget-object v7, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 197
    return-void

    .line 185
    :cond_a8
    invoke-virtual {p4}, Lezvcard/VCardDataType;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    goto :goto_8e

    .line 191
    :cond_b1
    invoke-virtual {p5}, Lezvcard/io/json/JCardValue;->getValues()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/io/json/JsonValue;

    .line 192
    .local v3, "jsonValue":Lezvcard/io/json/JsonValue;
    invoke-direct {p0, v3}, Lezvcard/io/json/JCardRawWriter;->writeValue(Lezvcard/io/json/JsonValue;)V

    goto :goto_b9
.end method

.method public writeStartVCard()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    if-nez v0, :cond_7

    .line 90
    invoke-direct {p0}, Lezvcard/io/json/JCardRawWriter;->init()V

    .line 93
    :cond_7
    iget-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    if-eqz v0, :cond_e

    .line 94
    invoke-virtual {p0}, Lezvcard/io/json/JCardRawWriter;->writeEndVCard()V

    .line 97
    :cond_e
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardRawWriter;->indent(I)V

    .line 99
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    const-string v1, "vcard"

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lezvcard/io/json/JCardRawWriter;->generator:Lcom/fasterxml/jackson/core/JsonGenerator;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 102
    const/4 v0, 0x1

    iput-boolean v0, p0, Lezvcard/io/json/JCardRawWriter;->open:Z

    .line 103
    return-void
.end method
