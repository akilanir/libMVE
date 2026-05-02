.class public Linfo/metadude/java/library/halfnarp/TalkIdsSerializer;
.super Lcom/fasterxml/jackson/databind/JsonSerializer;
.source "TalkIdsSerializer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/fasterxml/jackson/databind/JsonSerializer",
        "<",
        "Linfo/metadude/java/library/halfnarp/model/TalkIds;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public serialize(Linfo/metadude/java/library/halfnarp/model/TalkIds;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 7
    .param p1, "talkIds"    # Linfo/metadude/java/library/halfnarp/model/TalkIds;
    .param p2, "jsonGenerator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 20
    const-string v2, "talk_ids"

    invoke-virtual {p2, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 21
    invoke-virtual {p1}, Linfo/metadude/java/library/halfnarp/model/TalkIds;->getTalkIds()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 22
    .local v1, "talkId":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p2, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(I)V

    goto :goto_10

    .line 24
    .end local v1    # "talkId":Ljava/lang/Integer;
    :cond_24
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 25
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 26
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 10
    check-cast p1, Linfo/metadude/java/library/halfnarp/model/TalkIds;

    invoke-virtual {p0, p1, p2, p3}, Linfo/metadude/java/library/halfnarp/TalkIdsSerializer;->serialize(Linfo/metadude/java/library/halfnarp/model/TalkIds;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    return-void
.end method
