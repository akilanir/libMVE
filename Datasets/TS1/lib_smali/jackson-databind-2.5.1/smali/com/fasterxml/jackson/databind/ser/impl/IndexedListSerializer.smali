.class public final Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;
.super Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase;
.source "IndexedListSerializer.java"


# annotations
.annotation runtime Lcom/fasterxml/jackson/databind/annotation/JacksonStdImpl;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase",
        "<",
        "Ljava/util/List",
        "<*>;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 13
    .param p1, "elemType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "staticTyping"    # Z
    .param p3, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .param p4, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Z",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p5, "valueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    const-class v1, Ljava/util/List;

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase;-><init>(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 5
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .param p3, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p4, "valueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase;-><init>(Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 35
    return-void
.end method


# virtual methods
.method public _withValueTypeSerializer(Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)Lcom/fasterxml/jackson/databind/ser/ContainerSerializer;
    .registers 8
    .param p1, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            ")",
            "Lcom/fasterxml/jackson/databind/ser/ContainerSerializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-boolean v2, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_staticTyping:Z

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    return-object v0
.end method

.method public bridge synthetic hasSingleElement(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->hasSingleElement(Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method public hasSingleElement(Ljava/util/List;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v0, 0x1

    .line 56
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public bridge synthetic isEmpty(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->isEmpty(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method public isEmpty(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/util/List;)Z
    .registers 4
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Ljava/util/List",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 51
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p2, :cond_8

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "x2"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serialize(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    return-void
.end method

.method public final serialize(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 6
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 68
    .local v0, "len":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    sget-object v1, Lcom/fasterxml/jackson/databind/SerializationFeature;->WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {p3, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serializeContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 75
    :goto_12
    return-void

    .line 72
    :cond_13
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray(I)V

    .line 73
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serializeContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 74
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    goto :goto_12
.end method

.method public bridge synthetic serializeContents(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "x2"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serializeContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    return-void
.end method

.method public serializeContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 12
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v7, :cond_a

    .line 82
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {p0, p1, p2, p3, v7}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serializeContentsUsing(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 119
    :cond_9
    :goto_9
    return-void

    .line 85
    :cond_a
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_valueTypeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    if-eqz v7, :cond_12

    .line 86
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->serializeTypedContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_9

    .line 89
    :cond_12
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    .line 90
    .local v4, "len":I
    if-eqz v4, :cond_9

    .line 93
    const/4 v3, 0x0

    .line 95
    .local v3, "i":I
    :try_start_19
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_dynamicSerializers:Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;

    .line 96
    .local v6, "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    :goto_1b
    if-ge v3, v4, :cond_9

    .line 97
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 98
    .local v2, "elem":Ljava/lang/Object;
    if-nez v2, :cond_29

    .line 99
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 96
    :goto_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 101
    :cond_29
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 102
    .local v0, "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6, v0}, Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;->serializerFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v5

    .line 103
    .local v5, "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v5, :cond_47

    .line 105
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/JavaType;->hasGenericTypes()Z

    move-result v7

    if-eqz v7, :cond_50

    .line 106
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {p3, v7, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->constructSpecializedType(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v7

    invoke-virtual {p0, v6, v7, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_findAndAddDynamic(Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializerProvider;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v5

    .line 111
    :goto_45
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_dynamicSerializers:Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;

    .line 113
    :cond_47
    invoke-virtual {v5, v2, p2, p3}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_4a} :catch_4b

    goto :goto_26

    .line 116
    .end local v0    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "elem":Ljava/lang/Object;
    .end local v5    # "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v6    # "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    :catch_4b
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, p3, v1, p1, v3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->wrapAndThrow(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/Throwable;Ljava/lang/Object;I)V

    goto :goto_9

    .line 109
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "elem":Ljava/lang/Object;
    .restart local v5    # "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v6    # "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    :cond_50
    :try_start_50
    invoke-virtual {p0, v6, v0, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_findAndAddDynamic(Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;Ljava/lang/Class;Lcom/fasterxml/jackson/databind/SerializerProvider;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_53} :catch_4b

    move-result-object v5

    goto :goto_45
.end method

.method public serializeContentsUsing(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 10
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    .local p4, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 126
    .local v3, "len":I
    if-nez v3, :cond_7

    .line 145
    :cond_6
    return-void

    .line 129
    :cond_7
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_valueTypeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    .line 130
    .local v4, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v3, :cond_6

    .line 131
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 133
    .local v1, "elem":Ljava/lang/Object;
    if-nez v1, :cond_18

    .line 134
    :try_start_12
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 130
    :goto_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 135
    :cond_18
    if-nez v4, :cond_23

    .line 136
    invoke-virtual {p4, v1, p2, p3}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1d} :catch_1e

    goto :goto_15

    .line 140
    :catch_1e
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, p3, v0, p1, v2}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->wrapAndThrow(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/Throwable;Ljava/lang/Object;I)V

    goto :goto_15

    .line 138
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_23
    :try_start_23
    invoke-virtual {p4, v1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serializeWithType(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_26} :catch_1e

    goto :goto_15
.end method

.method public serializeTypedContents(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 13
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    .line 151
    .local v4, "len":I
    if-nez v4, :cond_7

    .line 182
    :cond_6
    :goto_6
    return-void

    .line 154
    :cond_7
    const/4 v3, 0x0

    .line 156
    .local v3, "i":I
    :try_start_8
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_valueTypeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    .line 157
    .local v7, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_dynamicSerializers:Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;

    .line 158
    .local v6, "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    :goto_c
    if-ge v3, v4, :cond_6

    .line 159
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 160
    .local v2, "elem":Ljava/lang/Object;
    if-nez v2, :cond_1a

    .line 161
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 158
    :goto_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 163
    :cond_1a
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 164
    .local v0, "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6, v0}, Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;->serializerFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v5

    .line 165
    .local v5, "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v5, :cond_38

    .line 167
    iget-object v8, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/JavaType;->hasGenericTypes()Z

    move-result v8

    if-eqz v8, :cond_41

    .line 168
    iget-object v8, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_elementType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {p3, v8, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->constructSpecializedType(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v8

    invoke-virtual {p0, v6, v8, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_findAndAddDynamic(Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializerProvider;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v5

    .line 173
    :goto_36
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_dynamicSerializers:Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;

    .line 175
    :cond_38
    invoke-virtual {v5, v2, p2, p3, v7}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serializeWithType(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3b} :catch_3c

    goto :goto_17

    .line 178
    .end local v0    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "elem":Ljava/lang/Object;
    .end local v5    # "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v6    # "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    .end local v7    # "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    :catch_3c
    move-exception v1

    .line 180
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, p3, v1, p1, v3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->wrapAndThrow(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/Throwable;Ljava/lang/Object;I)V

    goto :goto_6

    .line 171
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "elem":Ljava/lang/Object;
    .restart local v5    # "serializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v6    # "serializers":Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;
    .restart local v7    # "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    :cond_41
    :try_start_41
    invoke-virtual {p0, v6, v0, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->_findAndAddDynamic(Lcom/fasterxml/jackson/databind/ser/impl/PropertySerializerMap;Ljava/lang/Class;Lcom/fasterxml/jackson/databind/SerializerProvider;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_3c

    move-result-object v5

    goto :goto_36
.end method

.method public withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;
    .registers 5
    .param p1, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .param p2, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;"
        }
    .end annotation

    .prologue
    .line 40
    .local p3, "elementSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;-><init>(Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    return-object v0
.end method

.method public bridge synthetic withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/std/AsArraySerializerBase;
    .registers 5
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .param p2, "x1"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .param p3, "x2"    # Lcom/fasterxml/jackson/databind/JsonSerializer;

    .prologue
    .line 19
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;->withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;

    move-result-object v0

    return-object v0
.end method
